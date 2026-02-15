#pragma once

#include "simt-step/semantics/Effects.h"
#include "simt-step/semantics/ExecutionState.h"
#include "simt-step/semantics/SemanticsContext.h"
#include "simt-step/semantics/Trace.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"

#include <algorithm>
#include <bit>
#include <cstdlib>
#include <cstdint>
#include <functional>
#include <limits>
#include <optional>
#include <type_traits>
#include <utility>
#include <variant>
#include <deque>
#include <random>
#include <string>

#include <mlir/Dialect/Func/IR/FuncOps.h>
#include <llvm/ADT/Hashing.h>
#include <llvm/ADT/Twine.h>
#include <llvm/Support/Error.h>
#include <llvm/Support/ErrorHandling.h>
#include <llvm/Support/raw_ostream.h>
#include <mlir/IR/SymbolTable.h>

namespace mlir {
class Operation;
} // namespace mlir

namespace simt::semantics {

inline bool EnableCPSDebugLogs = []() {
    const char *env = std::getenv("SIMT_STEP_CPS_DEBUG");
    if (!env || !*env)
        return false;
    return std::string(env) != "0";
}();

inline llvm::raw_ostream &cpsDebugStream() {
    return EnableCPSDebugLogs ? llvm::errs() : llvm::nulls();
}

template <typename ValueT>
inline void printValueDebug(llvm::raw_ostream &os, const ValueT &v) {
    if constexpr (std::is_same_v<ValueT, SemValue>) {
        if (v.isResource()) {
            os << "<resource>";
        } else if (v.isBool()) {
            os << (v.asBool() ? "true" : "false");
        } else if (v.isFloat32()) {
            os << v.asFloat32();
        } else {
            os << v.asInt64();
        }
    } else {
        os << "<value>";
    }
}

template <typename ValueT>
inline void printValueListDebug(llvm::raw_ostream &os,
                                llvm::ArrayRef<ValueT> values) {
    os << "[";
    for (std::size_t i = 0; i < values.size(); ++i) {
        if (i)
            os << ", ";
        printValueDebug(os, values[i]);
    }
    os << "]";
}

inline std::string formatMaskBits(std::uint64_t mask, unsigned width) {
    std::string s;
    s.reserve(width + 2);
    s.append("0b");
    for (int i = static_cast<int>(width) - 1; i >= 0; --i) {
        s.push_back((mask & (1ull << i)) ? '1' : '0');
    }
    return s;
}

inline const char *blockKindLabel(DynamicBlockKind kind) {
    switch (kind) {
    case DynamicBlockKind::Plain:
        return "plain";
    case DynamicBlockKind::IfThen:
        return "if.then";
    case DynamicBlockKind::IfElse:
        return "if.else";
    case DynamicBlockKind::SwitchCase:
        return "switch.case";
    case DynamicBlockKind::SwitchDefault:
        return "switch.default";
    case DynamicBlockKind::LoopPrepare:
        return "loop.prepare";
    case DynamicBlockKind::LoopBody:
        return "loop.body";
    }
    return "unknown";
}

template <typename ValueT, typename StepT>
inline void logMergeStackState(const WaveContext<ValueT, StepT> &waveCtx) {
    auto fmt = [&](std::uint64_t m) { return formatMaskBits(m, 32); };
    cpsDebugStream() << "[CPS] MergeStack size=" << waveCtx.mergeStack.size() << "\n";
    for (std::size_t idx = 0; idx < waveCtx.mergeStack.size(); ++idx) {
        const auto &entry = waveCtx.mergeStack[idx];
        cpsDebugStream() << "  [" << idx << "] parent=" << entry.parent.block
                     << " seq=" << entry.parent.sequenceId
                     << " expected=0b" << fmt(entry.expectedMask)
                     << " completed=0b" << fmt(entry.completedMask)
                     << " children=" << entry.pendingChildren.size()
                     << (entry.loopFrame ? " (loop)" : "") << "\n";
        for (std::size_t ci = 0; ci < entry.pendingChildren.size(); ++ci) {
            cpsDebugStream() << "      child[" << ci << "]=" << entry.pendingChildren[ci].block
                         << " seq=" << entry.pendingChildren[ci].sequenceId << "\n";
        }
    }
}

/// Continuation-Passing Style control primitive returned by interpreter steps.
template <typename ValueT>
class Step {
public:
    struct Halt {};

    struct Continue {
        std::function<Step()> next;
    };

    struct Produce {
        ValueT value;
    };

    struct Suspend {
        Effect effect;
        std::function<Step()> resume;
    };

    using State = std::variant<Halt, Continue, Produce, Suspend>;

    Step() : state_(Halt{}) {}

    explicit Step(Halt halt) : state_(std::move(halt)) {}
    explicit Step(Continue cont) : state_(std::move(cont)) {}
    explicit Step(Produce prod) : state_(std::move(prod)) {}
    explicit Step(Suspend susp) : state_(std::move(susp)) {}

    static Step halt() { return Step(Halt{}); }

    static Step continueWith(std::function<Step()> next) {
        return Step(Continue{std::move(next)});
    }

    static Step produce(ValueT value) {
        return Step(Produce{std::move(value)});
    }

    static Step suspend(Effect effect, std::function<Step()> resume) {
        return Step(Suspend{std::move(effect), std::move(resume)});
    }

    bool isHalt() const { return std::holds_alternative<Halt>(state_); }
    bool isContinue() const { return std::holds_alternative<Continue>(state_); }
    bool isProduce() const { return std::holds_alternative<Produce>(state_); }
    bool isSuspend() const { return std::holds_alternative<Suspend>(state_); }

    const State &state() const { return state_; }
    State takeState() && { return std::move(state_); }

private:
    State state_;
};

/// Minimal tagless interface wrapper. Semantic implementations are expected to
/// provide the aliases below.
template <typename Impl>
struct SimtStepSemanticsAdaptor {
    using ValueType = typename Impl::ValueType;
    using StepType = Step<ValueType>;

    StepType eval(Impl &impl, mlir::Operation *op, SemanticsContext &context) {
        if constexpr (requires { impl.evalOperation(op, context); }) {
            return impl.evalOperation(op, context);
        } else {
            return impl.eval(op, context);
        }
    }
};

/// High-level interpreter shell that delegates to a semantics implementation
/// and exposes a CPS stepping API.
template <typename SemanticsT>
class SimtStepExecutor {
public:
    using ValueType = typename SemanticsT::ValueType;
    using StepType = Step<ValueType>;

    explicit SimtStepExecutor(SemanticsT semantics)
        : semantics_(std::move(semantics)) {}

    StepType step(mlir::Operation *op, SemanticsContext &context) {
        return adaptor_.eval(semantics_, op, context);
    }

    SemanticsT &semantics() { return semantics_; }
    const SemanticsT &semantics() const { return semantics_; }

private:
    SemanticsT semantics_;
    SimtStepSemanticsAdaptor<SemanticsT> adaptor_;
};

/// Template interpreter harness that drives CPS-style semantics.
template <typename SemanticsT>
class CPSInterpreter {
public:
    using ValueType = typename SemanticsT::ValueType;
    using StepType = Step<ValueType>;
    using StateType = InterpreterState<ValueType, StepType>;
    enum class ScheduleMode { Deterministic, Randomized };

    explicit CPSInterpreter(SemanticsT semantics)
        : semantics_(std::move(semantics)) {}

    void setTraceSink(TraceSink *sink) { traceSink_ = sink; }
    void setScheduleMode(ScheduleMode mode) { scheduleMode_ = mode; }
    void setScheduleSeed(std::uint64_t seed) { rng_.seed(seed); }

    StateType &state() { return state_; }
    const StateType &state() const { return state_; }

    /// Enqueue an initial continuation for the given wave/block/lane triple.
    void enqueue(WaveId wave, const DynamicBlockKey &block, LaneId lane,
                 StepType step) {
        ensureWaveBlock(wave, block, lane);
        auto &waveCtx = state_.waves[wave];
        if (auto *blockCtx = getBlock(waveCtx, block)) {
            std::uint64_t laneBit = 1ull << lane;
            blockCtx->activeMask |= laneBit;
            if (blockCtx->expectedMask)
                blockCtx->expectedMask |= laneBit;
            else
                blockCtx->expectedMask = blockCtx->activeMask;
            blockCtx->completedMask &= ~laneBit;
        }
        if (EnableCPSDebugLogs) {
            cpsDebugStream() << "[CPS] enqueue lane=" << lane
                         << " block=" << block.block
                         << " seq=" << block.sequenceId << "\n";
            dumpReadyQueue();
            dumpContinuations();
        }
        pushReady(wave, block, lane, std::move(step));
    }

    void dumpReadyQueue() const {
        if (!EnableCPSDebugLogs)
            return;
        cpsDebugStream() << "[CPS] ReadyQueue size=" << state_.readyQueue.size() << "\n";
        std::deque<ReadyContinuation<ValueType, StepType>> tmp = state_.readyQueue;
        std::size_t idx = 0;
        while (!tmp.empty()) {
            const auto &item = tmp.front();
            cpsDebugStream() << "  [" << idx++ << "] wave=" << item.wave
                         << " block=" << item.block.block
                         << " seq=" << item.block.sequenceId
                         << " lane=" << item.lane << "\n";
            tmp.pop_front();
        }
    }

    void dumpContinuations() const {
        if (!EnableCPSDebugLogs)
            return;
        for (const auto &wavePair : state_.waves) {
            WaveId w = wavePair.first;
            const auto &waveCtx = wavePair.second;
            cpsDebugStream() << "[CPS] Continuations for wave " << w << "\n";
            for (const auto &blockPair : waveCtx.blocks) {
                const auto &key = blockPair.first;
                const auto &blk = blockPair.second;
                if (blk.continuations.empty())
                    continue;
                cpsDebugStream() << "  block=" << key.block
                             << " seq=" << key.sequenceId
                             << " lanes:";
                for (const auto &c : blk.continuations)
                    cpsDebugStream() << " " << c.first;
                cpsDebugStream() << "\n";
            }
        }
    }

    /// Execute a single ready continuation if available.
    llvm::Error runOne() {
        if (state_.readyQueue.empty())
            return llvm::Error::success();
        if (scheduleMode_ == ScheduleMode::Deterministic) {
            auto item = std::move(state_.readyQueue.front());
            state_.readyQueue.pop_front();
            return processReady(std::move(item));
        }
        std::size_t index = 0;
        if (state_.readyQueue.size() > 1) {
            std::uniform_int_distribution<std::size_t> dist(
                0, state_.readyQueue.size() - 1);
            index = dist(rng_);
        }
        auto item = std::move(state_.readyQueue[index]);
        if (index + 1 != state_.readyQueue.size())
            state_.readyQueue[index] = std::move(state_.readyQueue.back());
        state_.readyQueue.pop_back();
        return processReady(std::move(item));
    }

    /// Run until there are no ready continuations left.
    llvm::Error run() {
        while (!state_.readyQueue.empty()) {
            if (llvm::Error err = runOne())
                return err;
        }
        return llvm::Error::success();
    }

    /// Build a continuation that executes the operation at `it` for the given
    /// wave/block/lane and chains to the next iterator.
    StepType makeNextOp(WaveId wave,
                        const DynamicBlockKey &key,
                        mlir::Block *block,
                        mlir::Block::iterator it,
                        SemanticsContext context,
                        LaneId lane) {
        // Defer execution: return a continuation that will run this op when invoked.
        return StepType::continueWith(
            [this, wave, key, block, it, context, lane]() mutable -> StepType {
                if (it == block->end())
                    return StepType::halt();

                SemanticsContext ctx = context;
                ctx.laneId = lane;
                ctx.waveId = wave;
                WaveContext<ValueType, StepType> *waveCtx = nullptr;
                DynamicBlock<ValueType, StepType> *blockCtx = nullptr;
                if (auto waveIt = state_.waves.find(wave); waveIt != state_.waves.end()) {
                    waveCtx = &waveIt->second;
                    if (!waveCtx->policy && ctx.policy)
                        waveCtx->policy = ctx.policy;
                    if (!ctx.policy && waveCtx->policy)
                        ctx.policy = waveCtx->policy;
                    if (ctx.subgroupWidth == 0 && waveCtx->subgroupWidth != 0)
                        ctx.subgroupWidth = waveCtx->subgroupWidth;
                    if (auto *blk = getBlock(*waveCtx, key)) {
                        blockCtx = blk;
                        ctx.activeMask = blk->activeMask;
                        ctx.expectedMask =
                            blk->expectedMask ? blk->expectedMask : blk->activeMask;
                        auto envIt = blk->valueEnvs.find(lane);
                        if (envIt != blk->valueEnvs.end()) {
                            auto &laneState = waveCtx->lanes[lane];
                            for (const auto &entry : envIt->second)
                                laneState.values[entry.first] = entry.second;
                        }
                    }
                    waveCtx->lanes[lane].currentBlock = key;
                    ctx.valueEnv = &waveCtx->lanes[lane].values;
                }
                const std::uint32_t blockSeq = key.sequenceId;
                const void *blockPtr = key.block;
                const char *blockKind =
                    blockCtx ? blockKindLabel(blockCtx->kind) : "unknown";
                std::optional<std::uint32_t> blockIter =
                    blockCtx ? blockCtx->loopIteration : std::nullopt;

                if (auto handled =
                        handleLoopSplit(wave, key, block, it, ctx, lane))
                    return *handled;

                if (auto handled =
                        handleSwitchSplit(wave, key, block, it, ctx, lane))
                    return *handled;

                if (auto handled = handleLoopPrepareTerminator(
                        wave, key, block, it, ctx, lane))
                    return *handled;

                if (auto handled =
                        handleLoopYield(wave, key, block, it, ctx, lane))
                    return *handled;

                if (auto handled = handleLoopContinue(
                        wave, key, block, it, ctx, lane))
                    return *handled;

                if (auto handled =
                        handleSwitchYield(wave, key, block, it, ctx, lane))
                    return *handled;

                if (auto handled =
                        handleBreak(wave, key, block, it, ctx, lane))
                    return *handled;

                if (auto handled =
                        handleIfYield(wave, key, block, it, ctx, lane))
                    return *handled;

                if (auto handled =
                        handleIfSplit(wave, key, block, it, ctx, lane))
                    return *handled;

                if (auto handled =
                        handleCallOp(wave, key, block, it, ctx, lane))
                    return *handled;

                // Mark return as terminal for this lane so we don't resume parents.
                if (auto retOp = llvm::dyn_cast<mlir::func::ReturnOp>(&*it)) {
                    auto waveIt = state_.waves.find(wave);
                    if (waveIt != state_.waves.end()) {
                        auto &waveCtx = waveIt->second;
                        auto &laneCtx = waveCtx.lanes[lane];
                        if (!laneCtx.callStack.empty()) {
                            DynamicBlockKey calleeKey = key;
                            auto calleeRoot = findDynamicRoot(waveCtx, calleeKey);
                            auto frame = std::move(laneCtx.callStack.back());
                            laneCtx.callStack.pop_back();
                            if (auto *blockCtx = getBlock(waveCtx, key))
                                blockCtx->activeMask &= ~(1ull << lane);
                            if (frame.results.size() != retOp.getNumOperands())
                                llvm::report_fatal_error(
                                    "call return value count mismatch");
                            auto *callerBlockCtx = getBlock(waveCtx, frame.callerKey);
                            if (!callerBlockCtx)
                                llvm::report_fatal_error(
                                    "call return missing caller block");
                            if (!frame.results.empty()) {
                                auto valOrErr =
                                    evaluateValue(waveCtx, key, retOp.getOperand(0),
                                                  lane, ctx.activeMask, ctx.expectedMask);
                                if (!valOrErr)
                                    llvm::report_fatal_error(
                                        "call return value evaluation failed");
                                callerBlockCtx->valueEnvs[lane][frame.results[0]] =
                                    *valOrErr;
                                laneCtx.values[frame.results[0]] = *valOrErr;
                            }
                            if (calleeRoot)
                                shrinkExpectedForSubtree(wave, waveCtx, *calleeRoot, lane);
                            callerBlockCtx = getBlock(waveCtx, frame.callerKey);
                            if (!callerBlockCtx)
                                llvm::report_fatal_error(
                                    "call return missing caller block after shrink");
                            // When the callee dynamic root drains, release the call-site
                            // child binding so a later call epoch gets a fresh key.
                            if (frame.callOp && calleeRoot) {
                                if (auto *calleeRootCtx =
                                        getBlock(waveCtx, *calleeRoot)) {
                                    if (calleeRootCtx->expectedMask == 0 &&
                                        calleeRootCtx->activeMask == 0) {
                                        auto callChildIt =
                                            callerBlockCtx->callChildren.find(
                                                frame.callOp);
                                        if (callChildIt !=
                                                callerBlockCtx->callChildren.end() &&
                                            callChildIt->second == *calleeRoot) {
                                            callerBlockCtx->callChildren.erase(
                                                callChildIt);
                                        }
                                    }
                                }
                            }
                            callerBlockCtx->activeMask |= (1ull << lane);
                            callerBlockCtx->expectedMask |= (1ull << lane);
                            laneCtx.phase =
                                LaneContext<ValueType, StepType>::Phase::Running;
                            laneCtx.hasReturned = false;
                            laneCtx.returnValue.reset();
                            laneCtx.currentBlock = frame.callerKey;
                            SemanticsContext resumeCtx;
                            resumeCtx.laneId = lane;
                            resumeCtx.waveId = wave;
                            resumeCtx.subgroupWidth = ctx.subgroupWidth;
                            resumeCtx.policy = ctx.policy;
                            resumeCtx.overrideMode.reset();
                            return StepType::continueWith(
                                [this, wave, frame = std::move(frame), lane,
                                 resumeCtx]() mutable -> StepType {
                                    return makeNextOp(wave, frame.callerKey,
                                                      frame.callerBlock,
                                                      frame.resumeIt, resumeCtx,
                                                      lane);
                                });
                        }
                        laneCtx.phase =
                            LaneContext<ValueType, StepType>::Phase::Completed;
                        laneCtx.hasReturned = true;
                    }
                    if (traceSink_) {
                        std::uint64_t expectedMask =
                            ctx.expectedMask ? ctx.expectedMask : ctx.activeMask;
                        traceSink_->onReturn(wave, lane,
                                             retOp.getNumOperands() > 0,
                                             ctx.activeMask, expectedMask,
                                             blockSeq, blockPtr, blockKind, blockIter);
                    }
                }

                if (EnableCPSDebugLogs) {
                    cpsDebugStream() << "[CPS] eval lane=" << lane
                                 << " block=" << block
                                 << " seq=" << key.sequenceId
                                 << " op=" << it->getName().getStringRef() << "\n";
                }
                if (traceSink_) {
                    std::uint64_t expectedMask =
                        ctx.expectedMask ? ctx.expectedMask : ctx.activeMask;
                    traceSink_->onStepBegin(
                        wave, lane, it->getName().getStringRef().str(),
                        ctx.activeMask, expectedMask,
                        blockSeq, blockPtr, blockKind, blockIter);
                }

                StepType current = adaptor_.eval(semantics_, &*it, ctx);
                mlir::Block::iterator nextIt = std::next(it);
                bool isTerminator = it->hasTrait<mlir::OpTrait::IsTerminator>();
                const bool hasNext = nextIt != block->end();

                while (true) {
                    typename StepType::State stateVariant = std::move(current).takeState();

                    if (auto *cont =
                            std::get_if<typename StepType::Continue>(&stateVariant)) {
                        if (!cont->next)
                            return StepType::halt();
                        current = cont->next();
                        continue;
                    }

                    if (auto *suspend =
                            std::get_if<typename StepType::Suspend>(&stateVariant)) {
                        Effect effect = std::move(suspend->effect);
                        auto resume = std::move(suspend->resume);
                        if (waveCtx && executionModeForOp(&*it, ctx) ==
                                           ExecutionMode::Collective) {
                            if (isMemoryOp(&*it)) {
                                auto *collective =
                                    effect.template get_if<CollectiveEffect>();
                                if (!collective)
                                    llvm::report_fatal_error(
                                        "collective memory op: missing collective effect");
                                CollectiveKey collectKey =
                                    ensureCollectiveEpochForLane(
                                        *waveCtx, key, *collective, lane);
                                waveCtx->collectiveTokenToOp[collectKey] = &*it;
                                auto &syncPoint = waveCtx->collectives[collectKey];
                                auto idxOrErr =
                                    evaluateValue(*waveCtx, key, it->getOperand(1),
                                                  lane, ctx.activeMask,
                                                  ctx.expectedMask);
                                if (!idxOrErr) {
                                    llvm::consumeError(idxOrErr.takeError());
                                    llvm::report_fatal_error(
                                        "collective memory op: failed to evaluate index");
                                }
                                syncPoint.memoryIndices[lane] = std::move(*idxOrErr);

                                if (isBufferStore(&*it)) {
                                    auto valOrErr =
                                        evaluateValue(*waveCtx, key,
                                                      it->getOperand(2), lane,
                                                      ctx.activeMask,
                                                      ctx.expectedMask);
                                    if (!valOrErr) {
                                        llvm::consumeError(valOrErr.takeError());
                                        llvm::report_fatal_error(
                                            "collective memory op: failed to evaluate value");
                                    }
                                    syncPoint.memoryValues[lane] =
                                        std::move(*valOrErr);
                                    resume = []() mutable -> StepType {
                                        return StepType::halt();
                                    };
                                } else {
                                    resume = [this, wave, collectKey, lane]()
                                                 mutable -> StepType {
                                        auto waveIt = state_.waves.find(wave);
                                        if (waveIt == state_.waves.end())
                                            llvm::report_fatal_error(
                                                "collective memory resume: missing wave context");
                                        auto &waveCtx = waveIt->second;
                                        auto syncIt = waveCtx.collectives.find(collectKey);
                                        if (syncIt == waveCtx.collectives.end())
                                            return StepType::halt();
                                        auto &syncPoint = syncIt->second;
                                        auto resultIt = syncPoint.results.find(lane);
                                        if (resultIt == syncPoint.results.end())
                                            return StepType::halt();
                                        ValueType result = resultIt->second;
                                        syncPoint.results.erase(resultIt);
                                        syncPoint.continuations.erase(lane);
                                        if (syncPoint.results.empty()) {
                                            waveCtx.collectives.erase(syncIt);
                                            waveCtx.collectiveTokenToOp.erase(collectKey);
                                        }
                                        return StepType::produce(std::move(result));
                                    };
                                }
                            }
                        }
                        if (waveCtx && isWaveOp(&*it) &&
                            executionModeForOp(&*it, ctx) == ExecutionMode::Collective) {
                            if (!blockCtx)
                                llvm::report_fatal_error(
                                    "collective wave op: missing block context");
                            auto *collective =
                                effect.template get_if<CollectiveEffect>();
                            if (!collective)
                                llvm::report_fatal_error(
                                    "collective wave op: missing collective effect");
                            if (it->getNumOperands() != 1)
                                llvm::report_fatal_error(
                                    "collective wave op: expected one operand");
                            auto predOrErr =
                                evaluateValue(*waveCtx, key, it->getOperand(0),
                                              lane, ctx.activeMask,
                                              ctx.expectedMask);
                            if (!predOrErr) {
                                llvm::consumeError(predOrErr.takeError());
                                llvm::report_fatal_error(
                                    "collective wave op: failed to evaluate operand");
                            }
                            CollectiveKey collectKey =
                                ensureCollectiveEpochForLane(
                                    *waveCtx, key, *collective, lane);
                            waveCtx->collectiveTokenToOp[collectKey] = &*it;
                            auto &syncPoint = waveCtx->collectives[collectKey];
                            syncPoint.operands[lane] = std::move(*predOrErr);
                            resume = [this, wave, collectKey, lane]() mutable -> StepType {
                                auto waveIt = state_.waves.find(wave);
                                if (waveIt == state_.waves.end())
                                    llvm::report_fatal_error(
                                        "collective wave resume: missing wave context");
                                auto &waveCtx = waveIt->second;
                                auto syncIt = waveCtx.collectives.find(collectKey);
                                if (syncIt == waveCtx.collectives.end())
                                    return StepType::halt();
                                auto &syncPoint = syncIt->second;
                                auto resultIt = syncPoint.results.find(lane);
                                if (resultIt == syncPoint.results.end())
                                    return StepType::halt();
                                ValueType result = resultIt->second;
                                syncPoint.results.erase(resultIt);
                                syncPoint.continuations.erase(lane);
                                if (syncPoint.results.empty()) {
                                    waveCtx.collectives.erase(syncIt);
                                    waveCtx.collectiveTokenToOp.erase(collectKey);
                                }
                                return StepType::produce(std::move(result));
                            };
                        }
                        if (traceSink_) {
                            std::uint64_t expectedMask =
                                ctx.expectedMask ? ctx.expectedMask : ctx.activeMask;
                            traceSink_->onSuspend(
                                wave, lane, effect, ctx.activeMask, expectedMask,
                                blockSeq, blockPtr, blockKind, blockIter);
                        }

                        std::function<StepType(StepType)> handleResumed;
                        handleResumed = [this, wave, key, block, nextIt, ctx, lane,
                                         isTerminator, hasNext,
                                         blockSeq, blockPtr, blockKind, blockIter,
                                         op = &*it, &handleResumed](StepType current)
                                         mutable -> StepType {
                            if (traceSink_) {
                                std::uint64_t expectedMask =
                                    ctx.expectedMask ? ctx.expectedMask : ctx.activeMask;
                                traceSink_->onResume(
                                    wave, lane, ctx.activeMask, expectedMask,
                                    blockSeq, blockPtr, blockKind, blockIter);
                            }
                            while (true) {
                                auto resumedState = std::move(current).takeState();
                                if (auto *cont =
                                        std::get_if<typename StepType::Continue>(
                                            &resumedState)) {
                                    if (!cont->next)
                                        return StepType::halt();
                                    current = cont->next();
                                    continue;
                                }
                                if (auto *susp =
                                        std::get_if<typename StepType::Suspend>(
                                            &resumedState)) {
                                    Effect eff = std::move(susp->effect);
                                    auto innerResume = std::move(susp->resume);
                                    auto chained = [innerResume = std::move(innerResume),
                                                    &handleResumed]() mutable -> StepType {
                                        return handleResumed(innerResume());
                                    };
                                    return StepType::suspend(std::move(eff), std::move(chained));
                                }
                                if (auto *prod =
                                        std::get_if<typename StepType::Produce>(
                                            &resumedState)) {
                                    auto waveIt = state_.waves.find(wave);
                                    if (waveIt == state_.waves.end())
                                        llvm::report_fatal_error(
                                            "resume: missing wave context");
                                    auto &resumeWaveCtx = waveIt->second;
                                    if (auto *resumeBlockCtx =
                                            getBlock(resumeWaveCtx, key)) {
                                        if (op->getNumResults() == 1) {
                                            resumeBlockCtx
                                                ->valueEnvs[lane][op->getResult(0)] =
                                                    prod->value;
                                            resumeWaveCtx
                                                .lanes[lane]
                                                .values[op->getResult(0)] = prod->value;
                                        }
                                    }
                                    if (!isTerminator && hasNext) {
                                        return StepType::continueWith(
                                            [this, wave, key, block, nextIt, ctx, lane]()
                                            mutable -> StepType {
                                                return makeNextOp(wave, key, block, nextIt,
                                                                  ctx, lane);
                                            });
                                    }
                                    if (isTerminator)
                                        handleReconvergence(wave, resumeWaveCtx, key, lane);
                                    return StepType::produce(std::move(prod->value));
                                }
                                if (std::holds_alternative<typename StepType::Halt>(
                                        resumedState)) {
                                    if (!isTerminator && hasNext) {
                                        return StepType::continueWith(
                                            [this, wave, key, block, nextIt, ctx, lane]()
                                            mutable -> StepType {
                                                return makeNextOp(wave, key, block, nextIt,
                                                                  ctx, lane);
                                            });
                                    }
                                    if (isTerminator) {
                                        auto waveIt = state_.waves.find(wave);
                                        if (waveIt == state_.waves.end())
                                            llvm::report_fatal_error(
                                                "resume: missing wave context");
                                        handleReconvergence(
                                            wave, waveIt->second, key, lane);
                                    }
                                    return StepType::halt();
                                }
                                if (!isTerminator && hasNext) {
                                    return StepType::continueWith(
                                        [this, wave, key, block, nextIt, ctx, lane]()
                                        mutable -> StepType {
                                            return makeNextOp(wave, key, block, nextIt,
                                                              ctx, lane);
                                        });
                                }
                                return StepType::halt();
                            }
                        };

                        return StepType::suspend(
                            std::move(effect),
                            [handleResumed = std::move(handleResumed),
                             resume = std::move(resume)]() mutable -> StepType {
                                return handleResumed(resume());
                            });
                    }

                    if (auto *prod =
                            std::get_if<typename StepType::Produce>(&stateVariant)) {
                        if (blockCtx && it->getNumResults() == 1) {
                            blockCtx->valueEnvs[lane][it->getResult(0)] = prod->value;
                            waveCtx->lanes[lane].values[it->getResult(0)] = prod->value;
                        }
                        if (!isTerminator && hasNext) {
                            return StepType::continueWith(
                                [this, wave, key, block, nextIt, ctx, lane]() mutable
                                -> StepType {
                                    return makeNextOp(wave, key, block, nextIt, ctx, lane);
                                });
                        }
                        if (isTerminator && waveCtx)
                            handleReconvergence(wave, *waveCtx, key, lane);
                        return StepType::produce(std::move(prod->value));
                    }

                    if (std::holds_alternative<typename StepType::Halt>(stateVariant)) {
                        if (!isTerminator && hasNext) {
                            return StepType::continueWith(
                                [this, wave, key, block, nextIt, ctx, lane]() mutable
                                -> StepType {
                                    return makeNextOp(wave, key, block, nextIt, ctx, lane);
                                });
                        }
                        if (isTerminator && waveCtx)
                            handleReconvergence(wave, *waveCtx, key, lane);
                        return StepType::halt();
                    }

                    if (!isTerminator && hasNext) {
                        return StepType::continueWith(
                            [this, wave, key, block, nextIt, ctx, lane]() mutable -> StepType {
                                return makeNextOp(wave, key, block, nextIt, ctx, lane);
                            });
                    }

                    return StepType::halt();
                }
            });
    }

private:
    using IfDecisionMap = llvm::DenseMap<LaneId, bool>;
    using SwitchDecisionMap = llvm::DenseMap<LaneId, std::int64_t>;

    static std::uint64_t arrivedMask(const llvm::DenseSet<LaneId> &arrivals) {
        std::uint64_t mask = 0;
        for (LaneId lane : arrivals) {
            if (lane >= 64) {
                llvm::report_fatal_error(
                    llvm::Twine("collective: lane id out of range: ") +
                    llvm::Twine(lane));
            }
            mask |= (1ull << lane);
        }
        return mask;
    }

    static void ensureExpectedCoversArrivals(
        CollectiveSyncPoint<ValueType, StepType> &syncPoint) {
        syncPoint.expectedMask |= arrivedMask(syncPoint.arrivals);
    }

    static bool isControlFlowOp(mlir::Operation *op) {
        return llvm::isa<simt::dialect::IfOp, simt::dialect::LoopOp,
                         simt::dialect::SwitchOp>(op);
    }

    static CollectiveKey makeCollectiveKey(const CollectiveEffect &effect,
                                           const DynamicBlockKey &block) {
        std::uint64_t token =
            effect.token ? *effect.token : effect.operation;
        std::uintptr_t blockPtr =
            reinterpret_cast<std::uintptr_t>(block.block);
        return static_cast<CollectiveKey>(
            static_cast<std::size_t>(
                llvm::hash_combine(token, block.sequenceId, blockPtr)));
    }

    static CollectiveKey makeControlCollectiveKey(std::uint32_t token,
                                                  const DynamicBlockKey &block) {
        CollectiveEffect effect;
        effect.operation = 0;
        effect.token = token;
        return makeCollectiveKey(effect, block);
    }

    CollectiveKey ensureCollectiveEpochForLane(
        WaveContext<ValueType, StepType> &waveCtx,
        const DynamicBlockKey &blockKey,
        CollectiveEffect &effect,
        LaneId lane) {
        CollectiveKey key = makeCollectiveKey(effect, blockKey);
        auto syncIt = waveCtx.collectives.find(key);
        if (syncIt == waveCtx.collectives.end())
            return key;

        auto &syncPoint = syncIt->second;
        bool hasCompletedResults = !syncPoint.results.empty();
        bool laneKnownToEpoch =
            syncPoint.arrivals.contains(lane) ||
            syncPoint.continuations.contains(lane) ||
            syncPoint.results.contains(lane);
        if (!hasCompletedResults || laneKnownToEpoch)
            return key;

        // A previous epoch for this op/key has already produced results and
        // this lane is a fresh arrival. Fork into a new token so we do not mix
        // late arrivals with the completed epoch's result set.
        effect.token = waveCtx.nextControlToken++;
        return makeCollectiveKey(effect, blockKey);
    }

    static std::uint64_t deriveControlEpochMask(
        const DynamicBlock<ValueType, StepType> &blockCtx,
        const SemanticsContext &context,
        std::uint64_t laneBit) {
        std::uint64_t mask = blockCtx.expectedMask;
        if (mask == 0)
            mask = context.expectedMask ? context.expectedMask : context.activeMask;
        if (mask == 0)
            mask = laneBit;
        return mask;
    }

    void closeControlEpoch(WaveContext<ValueType, StepType> &waveCtx,
                           const DynamicBlockKey &blockKey,
                           DynamicBlock<ValueType, StepType> &blockCtx,
                           const mlir::Operation *op,
                           bool erasePendingCollective) {
        auto tokenIt = blockCtx.controlTokens.find(op);
        if (tokenIt != blockCtx.controlTokens.end()) {
            CollectiveKey key = makeControlCollectiveKey(tokenIt->second, blockKey);
            waveCtx.controlTokenToOp.erase(key);
            if (erasePendingCollective)
                waveCtx.collectives.erase(key);
        }
        blockCtx.controlTokens.erase(op);
        blockCtx.controlEpochExpectedMask.erase(op);
    }

    void pruneControlEpochLane(WaveContext<ValueType, StepType> &waveCtx,
                               const DynamicBlockKey &blockKey,
                               DynamicBlock<ValueType, StepType> &blockCtx,
                               LaneId lane) {
        std::uint64_t laneBit = 1ull << lane;
        for (auto it = blockCtx.controlEpochExpectedMask.begin();
             it != blockCtx.controlEpochExpectedMask.end();) {
            std::uint64_t updatedMask = it->second & ~laneBit;
            if (updatedMask != 0) {
                it->second = updatedMask;
                ++it;
                continue;
            }
            const mlir::Operation *op = it->first;
            ++it;
            closeControlEpoch(waveCtx, blockKey, blockCtx, op,
                              /*erasePendingCollective=*/true);
        }
    }

    void restoreLaneInBlockEpochsAndCollectives(
        WaveContext<ValueType, StepType> &waveCtx,
        const DynamicBlockKey &blockKey,
        LaneId lane) {
        auto *blockCtx = getBlock(waveCtx, blockKey);
        if (!blockCtx)
            return;
        std::uint64_t laneBit = 1ull << lane;
        blockCtx->expectedMask |= laneBit;

        for (auto &epoch : blockCtx->controlEpochExpectedMask) {
            epoch.second |= laneBit;
            auto tokenIt = blockCtx->controlTokens.find(epoch.first);
            if (tokenIt == blockCtx->controlTokens.end())
                continue;
            CollectiveKey ckey = makeControlCollectiveKey(tokenIt->second, blockKey);
            auto collIt = waveCtx.collectives.find(ckey);
            if (collIt != waveCtx.collectives.end())
                collIt->second.expectedMask |= laneBit;
        }

        for (auto &entry : waveCtx.collectives) {
            if (entry.second.block == blockKey)
                entry.second.expectedMask |= laneBit;
        }
        for (auto &entry : waveCtx.syncPoints) {
            if (entry.second.block == blockKey)
                entry.second.expectedMask |= laneBit;
        }
    }

    static bool isMemoryOp(mlir::Operation *op) {
        auto name = op->getName().getStringRef();
        return name == "simt_step.buffer.load" || name == "simt_step.buffer.store";
    }

    static bool isBufferLoad(mlir::Operation *op) {
        return op->getName().getStringRef() == "simt_step.buffer.load";
    }

    static bool isBufferStore(mlir::Operation *op) {
        return op->getName().getStringRef() == "simt_step.buffer.store";
    }

    static bool isWaveOp(mlir::Operation *op) {
        return op->hasTrait<simt::dialect::SimtWave>();
    }

    static bool valueToBool(const ValueType &value) {
        if constexpr (std::is_same_v<ValueType, SemValue>)
            return value.asBool();
        llvm::report_fatal_error("collective wave op: unsupported value type");
        return false;
    }

    static ValueType makeInt32Value(std::int32_t value) {
        if constexpr (std::is_same_v<ValueType, SemValue>)
            return SemValue::fromInt32(value);
        llvm::report_fatal_error("collective wave op: unsupported value type");
        return ValueType();
    }

    static auto &memoryMutable() {
        if constexpr (requires { SemanticsT::memoryMutable(); }) {
            return SemanticsT::memoryMutable();
        } else {
            llvm::report_fatal_error(
                "collective memory op: semantics does not expose memory");
        }
    }

    void computeWaveCollectiveResults(
        const mlir::Operation *op,
        CollectiveSyncPoint<ValueType, StepType> &syncPoint) {
        if (syncPoint.expectedMask == 0)
            llvm::report_fatal_error(
                "collective wave op: missing expected mask");
        if (!llvm::isa<simt::dialect::WaveCountBitsOp>(op))
            llvm::report_fatal_error(
                "collective wave op: unsupported operation");
        std::uint64_t predMask = 0;
        std::uint64_t mask = syncPoint.expectedMask;
        while (mask) {
            unsigned lane = std::countr_zero(mask);
            mask &= mask - 1;
            auto operandIt = syncPoint.operands.find(lane);
            if (operandIt == syncPoint.operands.end())
                llvm::report_fatal_error(
                    "collective wave op: missing operand value");
            if (valueToBool(operandIt->second))
                predMask |= (1ull << lane);
        }
        std::int32_t count =
            static_cast<std::int32_t>(std::popcount(predMask));
        mask = syncPoint.expectedMask;
        while (mask) {
            unsigned lane = std::countr_zero(mask);
            mask &= mask - 1;
            syncPoint.results[lane] = makeInt32Value(count);
        }
        syncPoint.operands.clear();
    }

    bool computeMemoryCollectiveResults(
        const mlir::Operation *op,
        CollectiveSyncPoint<ValueType, StepType> &syncPoint) {
        if (!isMemoryOp(const_cast<mlir::Operation *>(op)))
            llvm::report_fatal_error(
                "collective memory op: unsupported operation");
        if (syncPoint.expectedMask == 0)
            llvm::report_fatal_error(
                "collective memory op: missing expected mask");

        auto &mem = memoryMutable();
        auto *mutableOp = const_cast<mlir::Operation *>(op);
        mlir::Value res = mutableOp->getOperand(0);
        if (isBufferLoad(const_cast<mlir::Operation *>(op))) {
            std::uint64_t mask = syncPoint.expectedMask;
            while (mask) {
                unsigned lane = std::countr_zero(mask);
                mask &= mask - 1;
                auto idxIt = syncPoint.memoryIndices.find(lane);
                if (idxIt == syncPoint.memoryIndices.end())
                    llvm::report_fatal_error(
                        "collective memory load: missing index");
                int64_t idx = idxIt->second.asInt64();
                auto resIt = mem.find(res);
                if (resIt == mem.end())
                    llvm::report_fatal_error("buffer.load: missing value at index");
                auto valIt = resIt->second.find(idx);
                if (valIt == resIt->second.end())
                    llvm::report_fatal_error("buffer.load: missing value at index");
                syncPoint.results[lane] = valIt->second;
            }
            return true;
        }

        if (isBufferStore(const_cast<mlir::Operation *>(op))) {
            std::uint64_t mask = syncPoint.expectedMask;
            // Apply stores in lane order to keep conflicts deterministic.
            while (mask) {
                unsigned lane = std::countr_zero(mask);
                mask &= mask - 1;
                auto idxIt = syncPoint.memoryIndices.find(lane);
                if (idxIt == syncPoint.memoryIndices.end())
                    llvm::report_fatal_error(
                        "collective memory store: missing index");
                auto valIt = syncPoint.memoryValues.find(lane);
                if (valIt == syncPoint.memoryValues.end())
                    llvm::report_fatal_error(
                        "collective memory store: missing value");
                int64_t idx = idxIt->second.asInt64();
                mem[res][idx] = valIt->second;
            }
            return false;
        }

        llvm::report_fatal_error("collective memory op: unsupported operation");
    }

    ExecutionMode executionModeForOp(mlir::Operation *op,
                                     const SemanticsContext &context) const {
        if (context.overrideMode)
            return *context.overrideMode;
        if (context.policy) {
            auto name = op->getName().getStringRef();
            auto it = context.policy->overrides.find(name);
            if (it != context.policy->overrides.end())
                return it->second;
            if (isControlFlowOp(op))
                return context.policy->controlFlow;
            if (isWaveOp(op))
                return context.policy->waveOps;
            if (isMemoryOp(op))
                return context.policy->memoryOps;
        }
        if (isWaveOp(op))
            return ExecutionMode::Collective;
        return ExecutionMode::Independent;
    }

    std::optional<StepType> gateControlFlowOp(WaveId wave,
                                              const DynamicBlockKey &key,
                                              mlir::Block *block,
                                              mlir::Block::iterator it,
                                              SemanticsContext context,
                                              LaneId lane) {
        ExecutionMode mode = executionModeForOp(&*it, context);
        if (mode == ExecutionMode::Collective)
            return gateControlFlow(wave, key, block, it, context, lane);
        if (mode == ExecutionMode::Synchronous)
            return gateSynchronousOp(wave, key, block, it, context, lane);
        return std::nullopt;
    }

    std::optional<StepType> gateControlFlow(WaveId wave,
                                            const DynamicBlockKey &key,
                                            mlir::Block *block,
                                            mlir::Block::iterator it,
                                            SemanticsContext context,
                                            LaneId lane) {
        auto waveIt = state_.waves.find(wave);
        if (waveIt == state_.waves.end())
            llvm::report_fatal_error("collective-cf: missing wave context");
        auto &waveCtx = waveIt->second;
        auto *blockCtx = getBlock(waveCtx, key);
        if (!blockCtx)
            llvm::report_fatal_error("collective-cf: missing block context");

        auto *op = &*it;
        std::uint64_t laneBit = 1ull << lane;
        auto readyIt = blockCtx->controlReadyMask.find(op);
        if (readyIt != blockCtx->controlReadyMask.end()) {
            if (readyIt->second & laneBit) {
                if (EnableCPSDebugLogs) {
                    cpsDebugStream() << "[CPS] control ready bypass op="
                                     << op->getName().getStringRef()
                                     << " lane=" << lane
                                     << " ready=0b" << formatMaskBits(readyIt->second, 32)
                                     << " block=" << key.block
                                     << " seq=" << key.sequenceId << "\n";
                }
                readyIt->second &= ~laneBit;
                if (readyIt->second == 0)
                    blockCtx->controlReadyMask.erase(readyIt);
                return std::nullopt;
                }
        }

        std::uint64_t expected = 0;
        std::uint32_t token = 0;
        bool openedEpoch = false;
        auto epochIt = blockCtx->controlEpochExpectedMask.find(op);
        if (epochIt == blockCtx->controlEpochExpectedMask.end()) {
            if (blockCtx->controlTokens.contains(op)) {
                if (EnableCPSDebugLogs) {
                    cpsDebugStream() << "[CPS] warning: stale control epoch token "
                                     << "for op=" << op->getName().getStringRef()
                                     << " block=" << key.block
                                     << " seq=" << key.sequenceId
                                     << " (repairing)\n";
                }
                closeControlEpoch(waveCtx, key, *blockCtx, op,
                                  /*erasePendingCollective=*/true);
            }
            expected = deriveControlEpochMask(*blockCtx, context, laneBit);
            // A control op is single-shot per dynamic block instance. Exclude
            // lanes that already executed this op from the next collective epoch.
            expected &= ~blockCtx->controlExecutedMask.lookup(op);
            if (expected == 0)
                return StepType::halt();
            token = waveCtx.nextControlToken++;
            blockCtx->controlTokens[op] = token;
            blockCtx->controlEpochExpectedMask[op] = expected;
            ++blockCtx->controlEpochVersion[op];
            openedEpoch = true;
            if (EnableCPSDebugLogs) {
                cpsDebugStream() << "[CPS] open control epoch op="
                                 << op->getName().getStringRef()
                                 << " token=" << token
                                 << " version=" << blockCtx->controlEpochVersion.lookup(op)
                                 << " expected=0b" << formatMaskBits(expected, 32)
                                 << " block=" << key.block
                                 << " seq=" << key.sequenceId << "\n";
            }
        } else {
            expected = epochIt->second;
            auto tokenIt = blockCtx->controlTokens.find(op);
            if (tokenIt == blockCtx->controlTokens.end()) {
                token = waveCtx.nextControlToken++;
                blockCtx->controlTokens[op] = token;
                if (EnableCPSDebugLogs) {
                    cpsDebugStream() << "[CPS] warning: control epoch missing token "
                                     << "for op=" << op->getName().getStringRef()
                                     << " block=" << key.block
                                     << " seq=" << key.sequenceId
                                     << " (recreated token=" << token << ")\n";
                }
            } else {
                token = tokenIt->second;
            }
        }
        if ((expected & laneBit) == 0) {
            if (EnableCPSDebugLogs) {
                cpsDebugStream() << "[CPS] control gate halt (lane not in epoch) op="
                                 << op->getName().getStringRef()
                                 << " lane=" << lane
                                 << " expected=0b" << formatMaskBits(expected, 32)
                                 << " executed=0b"
                                 << formatMaskBits(blockCtx->controlExecutedMask.lookup(op), 32)
                                 << " blockExpected=0b"
                                 << formatMaskBits(blockCtx->expectedMask, 32)
                                 << " blockActive=0b"
                                 << formatMaskBits(blockCtx->activeMask, 32)
                                 << " block=" << key.block
                                 << " seq=" << key.sequenceId << "\n";
            }
            auto nextIt = std::next(it);
            if (nextIt == block->end())
                return StepType::halt();
            return StepType::continueWith(
                [this, wave, key, block, nextIt, context, lane]() mutable
                -> StepType {
                    SemanticsContext resumeCtx = context;
                    resumeCtx.overrideMode.reset();
                    return makeNextOp(wave, key, block, nextIt, resumeCtx, lane);
                });
        }

        CollectiveEffect effect;
        effect.operation = 0;
        effect.activeMask = expected;
        effect.token = token;
        CollectiveKey collectKey = makeCollectiveKey(effect, key);
        if (openedEpoch && EnableCPSDebugLogs &&
            waveCtx.collectives.find(collectKey) != waveCtx.collectives.end()) {
            cpsDebugStream() << "[CPS] warning: newly opened control epoch collides "
                             << "with existing collective key=" << collectKey
                             << " op=" << op->getName().getStringRef()
                             << " block=" << key.block
                             << " seq=" << key.sequenceId << "\n";
        }
        waveCtx.controlTokenToOp[collectKey] = op;

        if (traceSink_) {
            traceSink_->onSuspend(
                wave, lane, Effect(effect), context.activeMask, expected,
                key.sequenceId, key.block, blockKindLabel(blockCtx->kind),
                blockCtx->loopIteration);
        }

        return StepType::suspend(
            Effect(std::move(effect)),
            [this, wave, key, block, it, lane, context]() mutable -> StepType {
                SemanticsContext resumeCtx;
                resumeCtx.laneId = lane;
                resumeCtx.waveId = wave;
                resumeCtx.subgroupWidth = context.subgroupWidth;
                resumeCtx.policy = context.policy;
                return makeNextOp(wave, key, block, it, resumeCtx, lane);
            });
    }

    std::optional<StepType> gateSynchronousOp(WaveId wave,
                                              const DynamicBlockKey &key,
                                              mlir::Block *block,
                                              mlir::Block::iterator it,
                                              SemanticsContext context,
                                              LaneId lane) {
        auto waveIt = state_.waves.find(wave);
        if (waveIt == state_.waves.end())
            llvm::report_fatal_error("sync-cf: missing wave context");
        auto &waveCtx = waveIt->second;
        auto *blockCtx = getBlock(waveCtx, key);
        if (!blockCtx)
            llvm::report_fatal_error("sync-cf: missing block context");

        auto *op = &*it;
        std::uint64_t laneBit = 1ull << lane;
        auto readyIt = blockCtx->controlReadyMask.find(op);
        if (readyIt != blockCtx->controlReadyMask.end()) {
            if (readyIt->second & laneBit) {
                readyIt->second &= ~laneBit;
                if (readyIt->second == 0)
                    blockCtx->controlReadyMask.erase(readyIt);
                return std::nullopt;
            }
        }

        std::uint64_t expected = 0;
        std::uint32_t token = 0;
        auto epochIt = blockCtx->controlEpochExpectedMask.find(op);
        if (epochIt == blockCtx->controlEpochExpectedMask.end()) {
            if (blockCtx->controlTokens.contains(op)) {
                if (EnableCPSDebugLogs) {
                    cpsDebugStream() << "[CPS] warning: stale sync epoch token "
                                     << "for op=" << op->getName().getStringRef()
                                     << " block=" << key.block
                                     << " seq=" << key.sequenceId
                                     << " (repairing)\n";
                }
                closeControlEpoch(waveCtx, key, *blockCtx, op,
                                  /*erasePendingCollective=*/true);
            }
            expected = deriveControlEpochMask(*blockCtx, context, laneBit);
            expected &= ~blockCtx->controlExecutedMask.lookup(op);
            if (expected == 0)
                return StepType::halt();
            token = waveCtx.nextControlToken++;
            blockCtx->controlTokens[op] = token;
            blockCtx->controlEpochExpectedMask[op] = expected;
            ++blockCtx->controlEpochVersion[op];
            if (EnableCPSDebugLogs) {
                cpsDebugStream() << "[CPS] open sync epoch op="
                                 << op->getName().getStringRef()
                                 << " token=" << token
                                 << " version=" << blockCtx->controlEpochVersion.lookup(op)
                                 << " expected=0b" << formatMaskBits(expected, 32)
                                 << " block=" << key.block
                                 << " seq=" << key.sequenceId << "\n";
            }
        } else {
            expected = epochIt->second;
            auto tokenIt = blockCtx->controlTokens.find(op);
            if (tokenIt == blockCtx->controlTokens.end()) {
                token = waveCtx.nextControlToken++;
                blockCtx->controlTokens[op] = token;
                if (EnableCPSDebugLogs) {
                    cpsDebugStream() << "[CPS] warning: sync epoch missing token "
                                     << "for op=" << op->getName().getStringRef()
                                     << " block=" << key.block
                                     << " seq=" << key.sequenceId
                                     << " (recreated token=" << token << ")\n";
                }
            } else {
                token = tokenIt->second;
            }
        }
        if ((expected & laneBit) == 0) {
            auto nextIt = std::next(it);
            if (nextIt == block->end())
                return StepType::halt();
            return StepType::continueWith(
                [this, wave, key, block, nextIt, context, lane]() mutable
                -> StepType {
                    SemanticsContext resumeCtx = context;
                    resumeCtx.overrideMode.reset();
                    return makeNextOp(wave, key, block, nextIt, resumeCtx, lane);
                });
        }

        waveCtx.syncTokenToOp[token] = op;

        SynchronizationEffect effect;
        effect.operation = 0;
        effect.activeMask = expected;
        effect.token = token;

        if (traceSink_) {
            traceSink_->onSuspend(
                wave, lane, Effect(effect), context.activeMask, expected,
                key.sequenceId, key.block, blockKindLabel(blockCtx->kind),
                blockCtx->loopIteration);
        }

        return StepType::suspend(
            Effect(std::move(effect)),
            [this, wave, key, block, it, lane, context]() mutable -> StepType {
                SemanticsContext resumeCtx;
                resumeCtx.laneId = lane;
                resumeCtx.waveId = wave;
                resumeCtx.subgroupWidth = context.subgroupWidth;
                resumeCtx.policy = context.policy;
                return makeNextOp(wave, key, block, it, resumeCtx, lane);
            });
    }

    void handleControlFlowCollective(WaveId wave, const DynamicBlockKey &key,
                                     mlir::Operation *op,
                                     std::uint64_t expectedMask) {
        auto waveIt = state_.waves.find(wave);
        if (waveIt == state_.waves.end())
            llvm::report_fatal_error("collective-cf: missing wave context");
        auto &waveCtx = waveIt->second;
        auto *blockCtx = getBlock(waveCtx, key);
        if (!blockCtx)
            llvm::report_fatal_error("collective-cf: missing block context");

        mlir::Block *block = const_cast<mlir::Block *>(key.block);
        auto it = op->getIterator();

        std::uint64_t evalExpected = 0;
        if (auto epochIt = blockCtx->controlEpochExpectedMask.find(op);
            epochIt != blockCtx->controlEpochExpectedMask.end()) {
            evalExpected = epochIt->second;
        } else {
            evalExpected =
                expectedMask ? expectedMask
                             : (blockCtx->expectedMask ? blockCtx->expectedMask
                                                       : blockCtx->activeMask);
            if (EnableCPSDebugLogs) {
                cpsDebugStream() << "[CPS] warning: control collective completed "
                                 << "without active epoch state for op="
                                 << op->getName().getStringRef()
                                 << " block=" << key.block
                                 << " seq=" << key.sequenceId
                                 << " expected=0b" << formatMaskBits(evalExpected, 32)
                                 << "\n";
            }
        }
        std::uint64_t evalActive =
            expectedMask ? expectedMask : blockCtx->activeMask;
        if (blockCtx->expectedMask == 0)
            blockCtx->expectedMask = evalExpected;
        blockCtx->controlExecutedMask[op] |= evalExpected;
        closeControlEpoch(waveCtx, key, *blockCtx, op,
                          /*erasePendingCollective=*/false);

        llvm::DenseMap<LaneId, bool> ifDecisions;
        llvm::DenseMap<LaneId, std::int64_t> switchDecisions;
        if (auto ifOp = llvm::dyn_cast<simt::dialect::IfOp>(op)) {
            std::uint64_t mask = evalExpected;
            while (mask) {
                LaneId lane = static_cast<LaneId>(std::countr_zero(mask));
                mask &= mask - 1;
                auto condOrErr = evaluateBool(waveCtx, key, ifOp.getCondition(),
                                              lane, evalActive, evalExpected);
                bool takeThen = false;
                if (condOrErr)
                    takeThen = *condOrErr;
                else
                    llvm::consumeError(condOrErr.takeError());
                ifDecisions[lane] = takeThen;
            }
        } else if (auto switchOp = llvm::dyn_cast<simt::dialect::SwitchOp>(op)) {
            std::uint64_t mask = evalExpected;
            while (mask) {
                LaneId lane = static_cast<LaneId>(std::countr_zero(mask));
                mask &= mask - 1;
                auto selectorOrErr =
                    evaluateValue(waveCtx, key, switchOp.getSelector(), lane,
                                  evalActive, evalExpected);
                std::int64_t selectorValue = 0;
                if (selectorOrErr)
                    selectorValue = selectorOrErr->asInt64();
                else
                    llvm::consumeError(selectorOrErr.takeError());
                switchDecisions[lane] = selectorValue;
            }
        }

        auto dispatchLane = [&](LaneId lane) {
            // NOTE: handle*Split may create new dynamic blocks, which can rehash
            // waveCtx.blocks and invalidate pointers to existing DynamicBlocks.
            // Re-fetch the parent block each time to avoid use-after-rehash.
            auto *blockCtx = getBlock(waveCtx, key);
            if (!blockCtx)
                llvm::report_fatal_error("collective-cf: missing block context");
            std::uint64_t laneBit = 1ull << lane;
            blockCtx->activeMask |= laneBit;
            blockCtx->expectedMask |= evalExpected;
            SemanticsContext laneCtx;
            laneCtx.activeMask = evalActive;
            laneCtx.expectedMask = evalExpected;
            laneCtx.laneId = lane;
            laneCtx.waveId = wave;
            laneCtx.subgroupWidth = waveCtx.subgroupWidth;
            laneCtx.policy = waveCtx.policy;
            laneCtx.overrideMode = ExecutionMode::Independent;
            laneCtx.suppressStepTrace = true;
            auto envIt = blockCtx->valueEnvs.find(lane);
            auto &laneState = waveCtx.lanes[lane];
            if (envIt != blockCtx->valueEnvs.end()) {
                for (const auto &entry : envIt->second)
                    laneState.values[entry.first] = entry.second;
            }
            laneCtx.valueEnv = &laneState.values;

            if (traceSink_ && !laneCtx.suppressStepTrace) {
                traceSink_->onResume(
                    wave, lane, evalActive, evalExpected, key.sequenceId, key.block,
                    blockKindLabel(blockCtx->kind), blockCtx->loopIteration);
            }

            if (llvm::isa<simt::dialect::IfOp>(op)) {
                (void)handleIfSplit(wave, key, block, it, laneCtx, lane,
                                    &ifDecisions);
                return;
            }
            if (llvm::isa<simt::dialect::LoopOp>(op)) {
                (void)handleLoopSplit(wave, key, block, it, laneCtx, lane);
                return;
            }
            if (llvm::isa<simt::dialect::SwitchOp>(op)) {
                (void)handleSwitchSplit(wave, key, block, it, laneCtx, lane,
                                        &switchDecisions);
                return;
            }

            llvm::report_fatal_error("collective-cf: unsupported control op");
        };

        std::uint64_t mask = evalExpected;
        while (mask) {
            LaneId lane = static_cast<LaneId>(std::countr_zero(mask));
            mask &= mask - 1;
            dispatchLane(lane);
        }
    }

    std::optional<StepType> handleLoopSplit(WaveId wave,
                                            const DynamicBlockKey &key,
                                            mlir::Block *block,
                                            mlir::Block::iterator it,
                                            SemanticsContext context,
                                            LaneId lane) {
        auto loopOp = llvm::dyn_cast<simt::dialect::LoopOp>(&*it);
        if (!loopOp)
            return std::nullopt;

        auto waveIt = state_.waves.find(wave);
        if (waveIt == state_.waves.end())
            llvm::report_fatal_error("handleLoopSplit: missing wave context");
        auto &waveCtx = waveIt->second;
        auto parentBlockIt = waveCtx.blocks.find(key);
        if (parentBlockIt == waveCtx.blocks.end())
            llvm::report_fatal_error("handleLoopSplit: missing parent block context");
        auto &parentBlock = parentBlockIt->second;
        std::uint64_t laneBit = 1ull << lane;
        std::uint64_t parentActiveMask = parentBlock.activeMask;
        std::uint64_t parentExpectedMask = parentBlock.expectedMask;
        if ((parentBlock.activeMask & laneBit) == 0)
            return StepType::halt();
        // Prefer the collective-cf epoch mask when available; parentBlock
        // expectedMask can include lanes from prior executions of this block.
        std::uint64_t parentExpected =
            context.expectedMask
                ? context.expectedMask
                : (parentExpectedMask ? parentExpectedMask : parentActiveMask);

        if (auto gated = gateControlFlowOp(wave, key, block, it, context, lane))
            return gated;
        if (traceSink_ && !context.suppressStepTrace) {
            std::uint64_t expectedMask =
                context.expectedMask ? context.expectedMask : context.activeMask;
            if (expectedMask == 0)
                expectedMask = laneBit;
            traceSink_->onStepBegin(
                wave, lane, it->getName().getStringRef().str(),
                context.activeMask, expectedMask, key.sequenceId, key.block,
                blockKindLabel(parentBlock.kind), parentBlock.loopIteration);
        }

        if (EnableCPSDebugLogs) {
            auto fmt = [&](std::uint64_t m) { return formatMaskBits(m, 32); };
            cpsDebugStream() << "[CPS] handleLoopSplit lane=" << lane
                         << " parent=" << key.block << " seq=" << key.sequenceId
                         << " active=" << fmt(parentBlock.activeMask)
                         << " expected=" << fmt(parentBlock.expectedMask)
                         << "\n";
        }

        mlir::Block *prepareBlock = &loopOp.getPrepareRegion().front();
        mlir::Block *bodyBlock = &loopOp.getBodyRegion().front();

        auto nextIt = std::next(it);
        SemanticsContext parentContext = context;
        parentContext.overrideMode.reset();
        parentContext.suppressStepTrace = false;
        StepType parentCont = StepType::continueWith(
            [this, wave, key, block, nextIt, parentContext, lane]() mutable
            -> StepType {
                return makeNextOp(wave, key, block, nextIt, parentContext, lane);
            });
        // Store for later reconvergence; do not enqueue until the lane returns.
        auto &parentBlockCtx = waveCtx.blocks.find(key)->second;
        parentBlockCtx.continuations[lane] = parentCont;

        MergeStackEntry<ValueType, StepType> *entry = nullptr;
        auto frameBindingIt = parentBlockCtx.activeLoopFrames.find(loopOp.getOperation());
        if (frameBindingIt != parentBlockCtx.activeLoopFrames.end()) {
            entry = findLoopEntryByFrameId(waveCtx, frameBindingIt->second);
            if (!entry)
                parentBlockCtx.activeLoopFrames.erase(frameBindingIt);
        }
        DynamicBlockKey prepKey{};
        DynamicBlockKey bodyKey{};
        if (!entry) {
            // Reserve a disjoint sequence-id slab per dynamic loop instance to avoid
            // collisions when the same loop op is re-entered under divergent control.
            constexpr std::uint32_t kLoopSeqStride = 1u << 20;
            if (waveCtx.nextDynamicSeq >
                std::numeric_limits<std::uint32_t>::max() - kLoopSeqStride) {
                llvm::report_fatal_error("handleLoopSplit: exhausted dynamic sequence space");
            }
            std::uint32_t baseSeq = waveCtx.nextDynamicSeq;
            waveCtx.nextDynamicSeq += kLoopSeqStride;
            prepKey = DynamicBlockKey{prepareBlock, baseSeq};
            bodyKey = DynamicBlockKey{bodyBlock, static_cast<std::uint32_t>(baseSeq + 1)};

            MergeStackEntry<ValueType, StepType> newEntry;
            newEntry.parent = key;
            newEntry.loopFrame.emplace();
            newEntry.loopFrame->frameId = waveCtx.nextLoopFrameId++;
            newEntry.loopFrame->loopOp = loopOp.getOperation();
            newEntry.loopFrame->prepareKey = prepKey;
            newEntry.loopFrame->bodyKey = bodyKey;
            waveCtx.mergeStack.push_back(std::move(newEntry));
            entry = &waveCtx.mergeStack.back();
            parentBlockCtx.activeLoopFrames[loopOp.getOperation()] =
                entry->loopFrame->frameId;
            if (EnableCPSDebugLogs) {
                cpsDebugStream() << "[CPS] push merge (loop) parent=" << key.block
                             << " seq=" << key.sequenceId << "\n";
                logMergeStackState<ValueType, StepType>(waveCtx);
            }
        } else {
            prepKey = entry->loopFrame->prepareKey;
            bodyKey = entry->loopFrame->bodyKey;
        }
        auto &loopFrame = *entry->loopFrame;

        // NOTE: `waveCtx.blocks` is a DenseMap; inserting can rehash and invalidate
        // references. Insert both keys before taking references.
        waveCtx.blocks.try_emplace(prepKey);
        waveCtx.blocks.try_emplace(bodyKey);

        auto &prepareCtx = waveCtx.blocks.find(prepKey)->second;
        prepareCtx.block = prepareBlock;
        prepareCtx.sequenceId = prepKey.sequenceId;
        prepareCtx.parentKey = key;
        if (prepareCtx.expectedMask == 0)
            prepareCtx.expectedMask = parentExpected;
        prepareCtx.expectedMask |= laneBit;
        prepareCtx.activeMask |= laneBit;
        prepareCtx.completedMask &= ~laneBit;
        prepareCtx.loopOp = loopOp.getOperation();
        prepareCtx.ownerLoopFrameId = loopFrame.frameId;
        prepareCtx.switchOp = nullptr;
        prepareCtx.loopIteration = 0;
        prepareCtx.kind = DynamicBlockKind::LoopPrepare;
        assert(!(prepareCtx.loopOp && prepareCtx.switchOp) &&
               "dynamic block cannot have both loopOp and switchOp");

        auto &bodyCtx = waveCtx.blocks.find(bodyKey)->second;
        bodyCtx.block = bodyBlock;
        bodyCtx.sequenceId = bodyKey.sequenceId;
        bodyCtx.parentKey = prepKey;
        if (bodyCtx.expectedMask == 0)
            bodyCtx.expectedMask = parentExpected;
        bodyCtx.activeMask &= ~laneBit;
        bodyCtx.completedMask &= ~laneBit;
        bodyCtx.loopOp = loopOp.getOperation();
        bodyCtx.ownerLoopFrameId = loopFrame.frameId;
        bodyCtx.switchOp = nullptr;
        bodyCtx.ifOp = nullptr;
        bodyCtx.loopIteration = 0;
        bodyCtx.kind = DynamicBlockKind::LoopBody;
        assert(!(bodyCtx.loopOp && bodyCtx.switchOp) &&
               "dynamic block cannot have both loopOp and switchOp");

        if (!llvm::is_contained(entry->pendingChildren, prepKey)) {
            entry->pendingChildren.push_back(prepKey);
        }
        if (!llvm::is_contained(entry->pendingChildren, bodyKey)) {
            entry->pendingChildren.push_back(bodyKey);
        }
        loopFrame.exitContinuations[lane] = parentCont;
        entry->expectedMask |= (parentExpected ? (parentExpected & laneBit) : laneBit);

        auto inits = loopOp.getInits();
        llvm::ArrayRef<mlir::BlockArgument> prepArgs = prepareBlock->getArguments();
        auto &tuple = loopFrame.carried[lane];
        tuple.clear();
        tuple.reserve(inits.size());
        std::uint64_t evalActive =
            context.activeMask ? context.activeMask : parentActiveMask;
        std::uint64_t evalExpected =
            context.expectedMask
                ? context.expectedMask
                : (parentExpectedMask ? parentExpectedMask : parentActiveMask);
        for (mlir::Value init : inits) {
            auto valueOrErr =
                evaluateValue(waveCtx, key, init, lane, evalActive, evalExpected);
            if (!valueOrErr)
                llvm::report_fatal_error("handleLoopSplit: failed to evaluate init");
            tuple.push_back(*valueOrErr);
        }
        auto &env = prepareCtx.valueEnvs[lane];
        for (auto indexed : llvm::enumerate(prepArgs)) {
            if (indexed.index() < tuple.size())
                env[indexed.value()] = tuple[indexed.index()];
        }

        SemanticsContext childContext = context;
        childContext.overrideMode.reset();
        childContext.suppressStepTrace = false;
        childContext.activeMask = prepareCtx.activeMask;
        childContext.laneId = lane;
        StepType childStep = makeNextOp(wave, prepKey, prepareBlock,
                                        prepareBlock->begin(), childContext, lane);
        enqueue(wave, prepKey, lane, std::move(childStep));

        waveCtx.blocks.find(key)->second.activeMask &= ~laneBit;
        return StepType::halt();
    }

    std::optional<StepType> handleSwitchSplit(WaveId wave,
                                              const DynamicBlockKey &key,
                                              mlir::Block *block,
                                              mlir::Block::iterator it,
                                              SemanticsContext context,
                                              LaneId lane,
                                              const SwitchDecisionMap *decisions = nullptr) {
        auto switchOp = llvm::dyn_cast<simt::dialect::SwitchOp>(&*it);
        if (!switchOp)
            return std::nullopt;

        auto waveIt = state_.waves.find(wave);
        if (waveIt == state_.waves.end())
            llvm::report_fatal_error("handleSwitchSplit: missing wave context");
        auto &waveCtx = waveIt->second;
        auto parentBlockIt = waveCtx.blocks.find(key);
        if (parentBlockIt == waveCtx.blocks.end())
            llvm::report_fatal_error("handleSwitchSplit: missing parent block");
        auto &parentBlock = parentBlockIt->second;
        std::uint64_t laneBit = 1ull << lane;
        if ((parentBlock.activeMask & laneBit) == 0)
            parentBlock.activeMask |= laneBit;

        // Prefer the collective-cf epoch mask when available; parentBlock
        // expectedMask can include lanes from prior executions of this block.
        std::uint64_t parentExpected =
            context.expectedMask
                ? context.expectedMask
                : (parentBlock.expectedMask ? parentBlock.expectedMask
                                            : parentBlock.activeMask);
        const mlir::Operation *enclosingLoopOp = parentBlock.loopOp;
        std::optional<LoopFrameId> enclosingLoopFrameId =
            parentBlock.ownerLoopFrameId;

        if (auto gated = gateControlFlowOp(wave, key, block, it, context, lane))
            return gated;
        if (traceSink_ && !context.suppressStepTrace) {
            std::uint64_t expectedMask =
                context.expectedMask ? context.expectedMask : context.activeMask;
            if (expectedMask == 0)
                expectedMask = laneBit;
            traceSink_->onStepBegin(
                wave, lane, it->getName().getStringRef().str(),
                context.activeMask, expectedMask, key.sequenceId, key.block,
                blockKindLabel(parentBlock.kind), parentBlock.loopIteration);
        }

        mlir::Region &caseRegion = switchOp.getCaseBody();
        unsigned numBlocks = static_cast<unsigned>(std::distance(caseRegion.begin(),
                                                                 caseRegion.end()));
        llvm::SmallVector<mlir::Block *, 4> caseBlocks;
        caseBlocks.reserve(numBlocks);
        for (mlir::Block &b : caseRegion)
            caseBlocks.push_back(&b);
        if (caseBlocks.empty())
            llvm::report_fatal_error("handleSwitchSplit: missing case blocks");

        auto caseValues = switchOp.getCaseValues();
        if (caseValues.size() + 1 != numBlocks)
            llvm::report_fatal_error("handleSwitchSplit: case_values size mismatch");
        auto defaultIndexAttr = switchOp.getDefaultIndexAttr();
        if (!defaultIndexAttr)
            llvm::report_fatal_error("handleSwitchSplit: missing default_index attr");
        int64_t defaultIndex = defaultIndexAttr.getInt();
        if (defaultIndex < 0 ||
            static_cast<std::size_t>(defaultIndex) >= caseBlocks.size())
            llvm::report_fatal_error("handleSwitchSplit: default_index out of range");
        llvm::SmallVector<unsigned, 4> caseValueBlocks;
        caseValueBlocks.reserve(caseValues.size());
        for (unsigned idx = 0; idx < caseBlocks.size(); ++idx) {
            if (idx == static_cast<unsigned>(defaultIndex))
                continue;
            caseValueBlocks.push_back(idx);
        }
        if (caseValueBlocks.size() != caseValues.size())
            llvm::report_fatal_error("handleSwitchSplit: case_values mapping mismatch");

        auto nextIt = std::next(it);
        SemanticsContext parentContext = context;
        parentContext.overrideMode.reset();
        parentContext.suppressStepTrace = false;
        StepType parentCont = StepType::continueWith(
            [this, wave, key, block, nextIt, parentContext, lane]() mutable
            -> StepType {
                return makeNextOp(wave, key, block, nextIt, parentContext, lane);
            });
        // Store for later reconvergence; do not enqueue until the lane returns.
        parentBlock.continuations[lane] = parentCont;

        auto findEntry = [&](WaveContext<ValueType, StepType> &ctx,
                             const DynamicBlockKey &parentKey,
                             mlir::Operation *op) {
            for (auto it = ctx.mergeStack.rbegin(); it != ctx.mergeStack.rend(); ++it) {
                if (it->loopFrame || it->parent != parentKey)
                    continue;
                if (it->ifOp)
                    continue;
                if (it->switchFrame && it->switchFrame->switchOp != op)
                    continue;
                return &*it;
            }
            return static_cast<MergeStackEntry<ValueType, StepType> *>(nullptr);
        };
        MergeStackEntry<ValueType, StepType> *entry =
            findEntry(waveCtx, key, switchOp.getOperation());
        if (!entry) {
            MergeStackEntry<ValueType, StepType> newEntry;
            newEntry.parent = key;
            newEntry.ifOp = nullptr;
            waveCtx.mergeStack.push_back(std::move(newEntry));
            entry = &waveCtx.mergeStack.back();
            if (EnableCPSDebugLogs) {
                cpsDebugStream() << "[CPS] push merge (switch) parent=" << key.block
                             << " seq=" << key.sequenceId << "\n";
                logMergeStackState<ValueType, StepType>(waveCtx);
            }
        }

        std::uint64_t laneMask =
            parentExpected ? (parentExpected & laneBit) : laneBit;

        // C-like switch with explicit fallthrough: pick a case by selector, then
        // allow fallthrough to subsequent cases when the terminator requests it.
        std::uint64_t evalActive =
            context.activeMask ? context.activeMask : parentBlock.activeMask;
        std::uint64_t evalExpected =
            context.expectedMask
                ? context.expectedMask
                : (parentBlock.expectedMask ? parentBlock.expectedMask
                                            : parentBlock.activeMask);
        std::int64_t selectorValue = 0;
        if (decisions) {
            auto decisionIt = decisions->find(lane);
            if (decisionIt == decisions->end())
                llvm::report_fatal_error(
                    "handleSwitchSplit: missing selector decision");
            selectorValue = decisionIt->second;
        } else {
            auto selectorOrErr =
                evaluateValue(waveCtx, key, switchOp.getSelector(), lane,
                              evalActive, evalExpected);
            if (selectorOrErr)
                selectorValue = selectorOrErr->asInt64();
            else
                llvm::consumeError(selectorOrErr.takeError());
        }

        unsigned caseIdx = static_cast<unsigned>(defaultIndex);
        for (auto indexed : llvm::enumerate(caseValues)) {
            if (indexed.value() == selectorValue) {
                if (indexed.index() >= caseValueBlocks.size())
                    llvm::report_fatal_error(
                        "handleSwitchSplit: case_values mapping overflow");
                caseIdx = caseValueBlocks[indexed.index()];
                break;
            }
        }
        if (caseIdx >= numBlocks)
            llvm::report_fatal_error("handleSwitchSplit: target block not found");
        llvm::SmallVector<bool, 4> caseFallthrough;
        caseFallthrough.reserve(numBlocks);
        for (unsigned idx = 0; idx < numBlocks; ++idx) {
            mlir::Block *caseBlock = caseBlocks[idx];
            if (caseBlock->empty())
                llvm::report_fatal_error("handleSwitchSplit: missing switch yield");
            auto yield =
                llvm::dyn_cast<simt::dialect::YieldOp>(caseBlock->back());
            if (!yield)
                llvm::report_fatal_error("handleSwitchSplit: missing switch yield");
            auto attr = yield->getAttrOfType<mlir::BoolAttr>("fallthrough");
            if (!attr)
                llvm::report_fatal_error("handleSwitchSplit: missing fallthrough attr");
            bool fall = attr.getValue();
            caseFallthrough.push_back(fall);
        }

        unsigned lastIdx = caseIdx;
        while (lastIdx + 1 < numBlocks && caseFallthrough[lastIdx])
            ++lastIdx;

        std::uint32_t baseSeq = key.sequenceId + 1;
        if (!entry->switchFrame) {
            SwitchFrameState<ValueType> frame;
            frame.switchOp = switchOp.getOperation();
            frame.baseSeq = baseSeq;
            frame.caseBlocks.assign(caseBlocks.begin(), caseBlocks.end());
            entry->switchFrame = std::move(frame);
        }
        auto &frame = *entry->switchFrame;
        baseSeq = frame.baseSeq;
        if (entry->expectedMask == 0)
            entry->expectedMask = parentExpected ? parentExpected : laneMask;
        entry->expectedMask |= laneMask;
        if (entry->pendingChildren.empty()) {
            for (unsigned idx = 0; idx < caseBlocks.size(); ++idx) {
                entry->pendingChildren.push_back(
                    DynamicBlockKey{caseBlocks[idx], baseSeq + idx});
            }
        }

        mlir::Block *targetBlock = caseBlocks[caseIdx];
        std::uint32_t seq = baseSeq + caseIdx;
        DynamicBlockKey childKey{targetBlock, seq};

        {
            auto &childCtx = waveCtx.blocks[childKey];
            childCtx.block = childKey.block;
            childCtx.sequenceId = childKey.sequenceId;
            childCtx.parentKey = key;
            if (childCtx.expectedMask == 0)
                childCtx.expectedMask = laneMask;
            childCtx.expectedMask |= laneMask;
            childCtx.activeMask |= laneBit;
            childCtx.completedMask &= ~laneBit;
            childCtx.kind = (caseIdx == static_cast<unsigned>(defaultIndex))
                                ? DynamicBlockKind::SwitchDefault
                                : DynamicBlockKind::SwitchCase;
            childCtx.switchOp = switchOp.getOperation();
            childCtx.loopOp = enclosingLoopOp;
            childCtx.ownerLoopFrameId = enclosingLoopFrameId;
            childCtx.ifOp = nullptr;
        }

        for (unsigned pathIdx = caseIdx + 1; pathIdx <= lastIdx; ++pathIdx) {
            DynamicBlockKey pathKey{caseBlocks[pathIdx], baseSeq + pathIdx};
            auto &pathCtx = waveCtx.blocks[pathKey];
            pathCtx.block = pathKey.block;
            pathCtx.sequenceId = pathKey.sequenceId;
            pathCtx.parentKey = key;
            pathCtx.switchOp = switchOp.getOperation();
            pathCtx.loopOp = enclosingLoopOp;
            pathCtx.ownerLoopFrameId = enclosingLoopFrameId;
            pathCtx.ifOp = nullptr;
            pathCtx.kind = (pathIdx == static_cast<unsigned>(defaultIndex))
                               ? DynamicBlockKind::SwitchDefault
                               : DynamicBlockKind::SwitchCase;
            if (pathCtx.expectedMask == 0)
                pathCtx.expectedMask = laneMask;
            pathCtx.expectedMask |= laneBit;
        }

        for (unsigned otherIdx = 0; otherIdx < numBlocks; ++otherIdx) {
            if (otherIdx >= caseIdx && otherIdx <= lastIdx)
                continue;
            DynamicBlockKey otherKey{caseBlocks[otherIdx], baseSeq + otherIdx};
            auto &otherCtx = waveCtx.blocks[otherKey];
            otherCtx.block = otherKey.block;
            otherCtx.sequenceId = otherKey.sequenceId;
            otherCtx.parentKey = key;
            otherCtx.switchOp = switchOp.getOperation();
            otherCtx.loopOp = enclosingLoopOp;
            otherCtx.ownerLoopFrameId = enclosingLoopFrameId;
            otherCtx.ifOp = nullptr;
            otherCtx.kind = (otherIdx == static_cast<unsigned>(defaultIndex))
                                ? DynamicBlockKind::SwitchDefault
                                : DynamicBlockKind::SwitchCase;
            otherCtx.expectedMask &= ~laneMask;
            for (auto &kv : waveCtx.blocks) {
                const auto &descKey = kv.first;
                auto &desc = kv.second;
                if (isDynamicDescendant(waveCtx, descKey, otherKey))
                    desc.expectedMask &= ~laneMask;
            }
            shrinkExpectedForSubtree(wave, waveCtx, otherKey, lane);
        }

        entry = findEntry(waveCtx, key, switchOp.getOperation());
        if (!entry || !entry->switchFrame)
            llvm::report_fatal_error("handleSwitchSplit: missing switch frame after shrink");
        auto &frameAfter = *entry->switchFrame;

        // `waveCtx.blocks` is a DenseMap; loops above can insert and rehash.
        auto &childCtx = waveCtx.blocks.find(childKey)->second;
        auto &env = childCtx.valueEnvs[lane];
        auto childArgs = targetBlock->getArguments();
        auto inits = switchOp.getInitialValues();
        llvm::SmallVector<ValueType, 8> initVals;
        initVals.reserve(inits.size());
        for (mlir::Value init : inits) {
            auto valOrErr =
                evaluateValue(waveCtx, key, init, lane, evalActive, evalExpected);
            if (!valOrErr)
                llvm::report_fatal_error("handleSwitchSplit: failed to evaluate init");
            initVals.push_back(*valOrErr);
        }
        frameAfter.carried[lane] = initVals;
        for (auto indexed : llvm::enumerate(childArgs)) {
            if (indexed.index() < initVals.size())
                env[indexed.value()] = initVals[indexed.index()];
        }

        if (EnableCPSDebugLogs) {
            auto fmt = [&](std::uint64_t m) { return formatMaskBits(m, 32); };
            auto &parentBlockCtx = waveCtx.blocks.find(key)->second;
            cpsDebugStream() << "[CPS] handleSwitchSplit lane=" << lane
                         << " parent=" << key.block << " seq=" << key.sequenceId
                         << " -> caseIdx=" << caseIdx
                         << " childSeq=" << seq
                         << " active=" << fmt(parentBlockCtx.activeMask)
                         << " expected=" << fmt(parentBlockCtx.expectedMask)
                         << "\n";
        }

        SemanticsContext laneCtx = context;
        laneCtx.overrideMode.reset();
        laneCtx.suppressStepTrace = false;
        laneCtx.activeMask = childCtx.activeMask;
        laneCtx.expectedMask =
            childCtx.expectedMask ? childCtx.expectedMask : childCtx.activeMask;
        laneCtx.laneId = lane;
        mlir::Block *childBlock = const_cast<mlir::Block *>(childKey.block);
        StepType childStep =
            makeNextOp(wave, childKey, childBlock, childBlock->begin(), laneCtx, lane);
        enqueue(wave, childKey, lane, std::move(childStep));
        waveCtx.blocks.find(key)->second.activeMask &= ~laneBit;
        return StepType::halt();
    }

    MergeStackEntry<ValueType, StepType> *
    findLoopEntryByFrameId(WaveContext<ValueType, StepType> &waveCtx,
                           LoopFrameId frameId) {
        for (auto it = waveCtx.mergeStack.rbegin();
             it != waveCtx.mergeStack.rend(); ++it) {
            if (!it->loopFrame)
                continue;
            if (it->loopFrame->frameId == frameId)
                return &*it;
        }
        return nullptr;
    }

    void clearLoopFrameBinding(WaveContext<ValueType, StepType> &waveCtx,
                               const MergeStackEntry<ValueType, StepType> &entry) {
        if (!entry.loopFrame)
            return;
        auto parentIt = waveCtx.blocks.find(entry.parent);
        if (parentIt == waveCtx.blocks.end())
            return;
        auto &bindings = parentIt->second.activeLoopFrames;
        auto bindingIt = bindings.find(entry.loopFrame->loopOp);
        if (bindingIt != bindings.end() &&
            bindingIt->second == entry.loopFrame->frameId) {
            bindings.erase(bindingIt);
        }
    }

    bool popLoopEntryIfComplete(WaveContext<ValueType, StepType> &waveCtx,
                                MergeStackEntry<ValueType, StepType> *entry) {
        if (!entry || !entry->loopFrame)
            return false;
        const auto &frame = *entry->loopFrame;
        bool loopDone =
            entry->expectedMask != 0
                ? (entry->completedMask == entry->expectedMask)
                : (frame.laneNextSeq.empty() && frame.exitContinuations.empty() &&
                   frame.carried.empty());
        if (!loopDone)
            return false;
        clearLoopFrameBinding(waveCtx, *entry);
        for (auto it = waveCtx.mergeStack.begin(); it != waveCtx.mergeStack.end();
             ++it) {
            if (&*it == entry) {
                waveCtx.mergeStack.erase(it);
                return true;
            }
        }
        return false;
    }

    MergeStackEntry<ValueType, StepType> *
    findLoopEntry(WaveContext<ValueType, StepType> &waveCtx,
                  const DynamicBlockKey &key,
                  const mlir::Operation *loopOp) {
        auto resolveOwnerFrameId = [&](DynamicBlockKey cur)
            -> std::optional<LoopFrameId> {
            while (true) {
                auto blockIt = waveCtx.blocks.find(cur);
                if (blockIt == waveCtx.blocks.end())
                    return std::nullopt;
                if (blockIt->second.ownerLoopFrameId)
                    return blockIt->second.ownerLoopFrameId;
                if (!blockIt->second.parentKey)
                    return std::nullopt;
                cur = *blockIt->second.parentKey;
            }
        };

        if (auto frameId = resolveOwnerFrameId(key)) {
            for (auto it = waveCtx.mergeStack.rbegin();
                 it != waveCtx.mergeStack.rend(); ++it) {
                if (!it->loopFrame)
                    continue;
                if (it->loopFrame->frameId != *frameId)
                    continue;
                if (loopOp && it->loopFrame->loopOp != loopOp)
                    continue;
                return &*it;
            }
            return nullptr;
        }

        // Fallback for legacy dynamic blocks that predate explicit owner ids.
        for (auto it = waveCtx.mergeStack.rbegin();
             it != waveCtx.mergeStack.rend(); ++it) {
            if (!it->loopFrame)
                continue;
            if (loopOp && it->loopFrame->loopOp != loopOp)
                continue;
            const auto &frame = *it->loopFrame;
            if (key == frame.prepareKey || key == frame.bodyKey)
                return &*it;
            if (isDynamicDescendant(waveCtx, key, frame.prepareKey) ||
                isDynamicDescendant(waveCtx, key, frame.bodyKey))
                return &*it;
        }
        return nullptr;
    }

    std::optional<StepType> handleLoopPrepareTerminator(
        WaveId wave, const DynamicBlockKey &key, mlir::Block *block,
        mlir::Block::iterator it, SemanticsContext context, LaneId lane) {
        auto condOp = llvm::dyn_cast<simt::dialect::ConditionOp>(&*it);
        if (!condOp)
            return std::nullopt;

        (void)block;
        auto waveIt = state_.waves.find(wave);
        if (waveIt == state_.waves.end())
            llvm::report_fatal_error("handleLoopPrepareTerminator: missing wave context");
        auto &waveCtx = waveIt->second;
        auto *blockCtx = getBlock(waveCtx, key);
        if (!blockCtx || blockCtx->kind != DynamicBlockKind::LoopPrepare ||
            !blockCtx->loopOp)
            llvm::report_fatal_error("handleLoopPrepareTerminator: invalid block context");
        if ((blockCtx->activeMask & (1ull << lane)) == 0){
            llvm::report_fatal_error("handleLoopPrepareTerminator: invalid active mask");
        }

        auto *entry = findLoopEntry(waveCtx, key, blockCtx->loopOp);
        if (!entry || !entry->loopFrame) {
            cpsDebugStream() << "[CPS] handleLoopPrepareTerminator missing loop frame "
                         << "lane=" << lane << " key=" << key.block
                         << " seq=" << key.sequenceId << "\n";
            logMergeStackState<ValueType, StepType>(waveCtx);
            llvm::report_fatal_error("handleLoopPrepareTerminator: missing loop frame");
        }
        auto &loopFrame = *entry->loopFrame;
        const mlir::Operation *loopOp = blockCtx->loopOp;

        std::uint64_t laneBit = 1ull << lane;
        auto condOrErr = evaluateBool(
            waveCtx, key, condOp.getCondition(), lane, blockCtx->activeMask,
            blockCtx->expectedMask ? blockCtx->expectedMask : blockCtx->activeMask);
        bool takeBody = false;
        if (condOrErr)
            takeBody = *condOrErr;
        else
            llvm::consumeError(condOrErr.takeError());

        llvm::SmallVector<ValueType, 4> forwarded;
        forwarded.reserve(condOp.getForwarded().size());
        for (mlir::Value v : condOp.getForwarded()) {
            auto valOrErr = evaluateValue(
                waveCtx, key, v, lane, blockCtx->activeMask,
                blockCtx->expectedMask ? blockCtx->expectedMask : blockCtx->activeMask);
            if (!valOrErr) {
                llvm::report_fatal_error("handleLoopPrepareTerminator: failed to evaluate forwarded value");
            }
            forwarded.push_back(*valOrErr);
        }
        loopFrame.carried[lane].assign(forwarded.begin(), forwarded.end());

        if (EnableCPSDebugLogs) {
            auto fmt = [&](std::uint64_t m) { return formatMaskBits(m, 32); };
            cpsDebugStream() << "[CPS] loop.prepare.term lane=" << lane
                             << " block=" << key.block
                             << " seq=" << key.sequenceId
                             << " loopIter=";
            if (blockCtx->loopIteration)
                cpsDebugStream() << *blockCtx->loopIteration;
            else
                cpsDebugStream() << "<none>";
            cpsDebugStream() << " takeBody=" << (takeBody ? 1 : 0)
                             << " active=" << fmt(blockCtx->activeMask)
                             << " expected=" << fmt(blockCtx->expectedMask)
                             << " forwarded=";
            printValueListDebug<ValueType>(
                cpsDebugStream(), llvm::ArrayRef<ValueType>(forwarded));
            cpsDebugStream() << "\n";
        }

        blockCtx->activeMask &= ~laneBit;
        blockCtx->completedMask |= laneBit;
        std::uint64_t inheritedExpected =
            blockCtx->expectedMask ? blockCtx->expectedMask : blockCtx->activeMask;


        if (takeBody) {
            DynamicBlockKey bodyKey{loopFrame.bodyKey.block,
                                    static_cast<std::uint32_t>(key.sequenceId + 1)};
            auto [bodyIt, inserted] = waveCtx.blocks.try_emplace(bodyKey);
            auto &bodyCtx = bodyIt->second;
            bool isNew = inserted;
            bodyCtx.block = bodyKey.block;
            bodyCtx.sequenceId = bodyKey.sequenceId;
            if (isNew)
                bodyCtx.expectedMask = inheritedExpected;
            else if (bodyCtx.expectedMask == 0)
                bodyCtx.expectedMask = laneBit;
            bodyCtx.expectedMask |= laneBit;
            bodyCtx.activeMask |= laneBit;
            bodyCtx.loopOp = loopOp;
            bodyCtx.ownerLoopFrameId = loopFrame.frameId;
            bodyCtx.kind = DynamicBlockKind::LoopBody;
            if (key.sequenceId >= loopFrame.prepareKey.sequenceId) {
                bodyCtx.loopIteration =
                    (key.sequenceId - loopFrame.prepareKey.sequenceId) / 2;
            } else {
                bodyCtx.loopIteration.reset();
            }
            restoreLaneInBlockEpochsAndCollectives(waveCtx, bodyKey, lane);

            auto &env = bodyCtx.valueEnvs[lane];
            auto bodyArgs =
                const_cast<mlir::Block *>(bodyKey.block)->getArguments();
            for (auto indexed : llvm::enumerate(bodyArgs)) {
                if (indexed.index() < forwarded.size())
                    env[indexed.value()] = forwarded[indexed.index()];
            }

            if (isNew && !llvm::is_contained(entry->pendingChildren, bodyKey)) {
                entry->pendingChildren.push_back(bodyKey);
            }

            SemanticsContext laneCtx = context;
            laneCtx.overrideMode.reset();
            laneCtx.activeMask = bodyCtx.activeMask;
            laneCtx.expectedMask =
                bodyCtx.expectedMask ? bodyCtx.expectedMask : bodyCtx.activeMask;
            laneCtx.laneId = lane;
            mlir::Block *childBlock = const_cast<mlir::Block *>(bodyKey.block);
            StepType childStep =
                makeNextOp(wave, bodyKey, childBlock, childBlock->begin(),
                           laneCtx, lane);
            enqueue(wave, bodyKey, lane, std::move(childStep));
            return StepType::halt();
        }

        auto parentIt = waveCtx.blocks.find(entry->parent);
        if (parentIt != waveCtx.blocks.end()) {
            auto &parentEnv = parentIt->second.valueEnvs[lane];
            unsigned idx = 0;
            auto *loopOperation = const_cast<mlir::Operation *>(loopFrame.loopOp);
            for (mlir::Value res : loopOperation->getResults()) {
                if (idx < forwarded.size())
                    parentEnv[res] = forwarded[idx];
                ++idx;
            }
        }
        loopFrame.laneNextSeq.erase(lane);
        loopFrame.carried.erase(lane);
        (void)enqueueLoopExitContinuation(wave, waveCtx, *entry, lane);
        shrinkExpectedForLoopLane(wave, waveCtx, loopFrame.frameId, lane);
        handleReconvergence(wave, waveCtx, key, lane);
        (void)popLoopEntryIfComplete(
            waveCtx, findLoopEntry(waveCtx, key, loopOp));
        return StepType::halt();
    }

    std::optional<StepType> handleLoopYield(WaveId wave,
                                            const DynamicBlockKey &key,
                                            mlir::Block *block,
                                            mlir::Block::iterator it,
                                            SemanticsContext context,
                                            LaneId lane) {
        auto yieldOp = llvm::dyn_cast<simt::dialect::YieldOp>(&*it);
        if (!yieldOp)
            return std::nullopt;

        (void)block;
        auto waveIt = state_.waves.find(wave);
        if (waveIt == state_.waves.end())
            llvm::report_fatal_error("handleLoopYield: missing wave context");
        auto &waveCtx = waveIt->second;
        auto *blockCtx = getBlock(waveCtx, key);
        if (!blockCtx || blockCtx->kind != DynamicBlockKind::LoopBody ||
            !blockCtx->loopOp)
            return std::nullopt;
        if ((blockCtx->activeMask & (1ull << lane)) == 0) {
            llvm::report_fatal_error("handleLoopYield: invalid active mask");
        }
        assert(!(blockCtx->loopOp && blockCtx->switchOp) &&
               "dynamic block cannot have both loopOp and switchOp");

        if (EnableCPSDebugLogs) {
            auto fmt = [&](std::uint64_t m) { return formatMaskBits(m, 32); };
            cpsDebugStream() << "[CPS] handleLoopYield lane=" << lane
                         << " block=" << key.block << " seq=" << key.sequenceId
                         << " active=" << fmt(blockCtx->activeMask)
                         << " expected=" << fmt(blockCtx->expectedMask)
                         << "\n";
        }

        auto *entry = findLoopEntry(waveCtx, key, blockCtx->loopOp);
        if (!entry || !entry->loopFrame)
            llvm::report_fatal_error("handleLoopYield: missing loop frame");
        auto &loopFrame = *entry->loopFrame;
        const mlir::Operation *loopOp = blockCtx->loopOp;
        std::uint64_t laneBit = 1ull << lane;

        llvm::SmallVector<ValueType, 4> nextCarried;
        nextCarried.reserve(yieldOp.getNumOperands());
        auto envIt = blockCtx->valueEnvs.find(lane);
        if (envIt == blockCtx->valueEnvs.end()) {
            cpsDebugStream() << "[CPS] handleLoopYield missing value env for lane=" << lane
                         << " seq=" << key.sequenceId << " block=" << key.block << "\n";
        }
        for (mlir::Value v : yieldOp.getOperands()) {
            auto valOrErr =
                evaluateValue(waveCtx, key, v, lane, blockCtx->activeMask,
                              blockCtx->expectedMask ? blockCtx->expectedMask
                                                     : blockCtx->activeMask);
            if (!valOrErr) {
                cpsDebugStream() << "[CPS] handleLoopYield eval failure lane=" << lane
                             << " seq=" << key.sequenceId << " block=" << key.block
                             << " operand=" << nextCarried.size() << "\n";
                if (envIt != blockCtx->valueEnvs.end()) {
                    cpsDebugStream() << "  env entries: " << envIt->second.size() << "\n";
                    for (auto &kv : envIt->second) {
                        cpsDebugStream() << "    - ";
                        kv.first.print(cpsDebugStream());
                        cpsDebugStream() << "\n";
                    }
                }
                v.print(cpsDebugStream());
                cpsDebugStream() << "\n";
                llvm::consumeError(valOrErr.takeError());
                llvm::report_fatal_error("handleLoopYield: failed to evaluate yield operand");
            }
            nextCarried.push_back(*valOrErr);
        }
        loopFrame.carried[lane].assign(nextCarried.begin(), nextCarried.end());

        if (EnableCPSDebugLogs) {
            auto fmt = [&](std::uint64_t m) { return formatMaskBits(m, 32); };
            cpsDebugStream() << "[CPS] loop.yield lane=" << lane
                             << " block=" << key.block
                             << " seq=" << key.sequenceId
                             << " loopIter=";
            if (blockCtx->loopIteration)
                cpsDebugStream() << *blockCtx->loopIteration;
            else
                cpsDebugStream() << "<none>";
            cpsDebugStream() << " active=" << fmt(blockCtx->activeMask)
                             << " expected=" << fmt(blockCtx->expectedMask)
                             << " nextCarried=";
            printValueListDebug<ValueType>(
                cpsDebugStream(), llvm::ArrayRef<ValueType>(nextCarried));
            cpsDebugStream() << "\n";
        }

        std::uint32_t nextSeq =
            loopFrame.laneNextSeq.try_emplace(lane, key.sequenceId + 2).first->second;

        blockCtx->activeMask &= ~laneBit;
        blockCtx->completedMask |= laneBit;
        // This lane leaves the current body iteration and should no longer be
        // counted by collectives nested under this dynamic body subtree. Keep
        // future iterations of the same loop frame intact so this lane can
        // re-enroll before those control epochs close.
        shrinkExpectedForSubtree(wave, waveCtx, key, lane, loopFrame.frameId,
                                 nextSeq);

        if (EnableCPSDebugLogs) {
            auto fmt = [&](std::uint64_t m) { return formatMaskBits(m, 32); };
            cpsDebugStream() << "[CPS] handleLoopContinue lane=" << lane
                         << " block=" << key.block << " seq=" << key.sequenceId
                         << " active=" << fmt(blockCtx->activeMask)
                         << " expected=" << fmt(blockCtx->expectedMask)
                         << "\n";
        }

        DynamicBlockKey nextPrep{loopFrame.prepareKey.block, nextSeq};
        DynamicBlockKey nextBody{loopFrame.bodyKey.block,
                                 static_cast<std::uint32_t>(nextSeq + 1)};
        std::uint32_t loopIteration = 0;
        if (nextPrep.sequenceId >= loopFrame.prepareKey.sequenceId)
            loopIteration =
                (nextPrep.sequenceId - loopFrame.prepareKey.sequenceId) / 2;
        // Include lanes that are already assigned to this iteration and lanes
        // that have not progressed beyond it yet. Exclude lanes that are
        // known to be strictly ahead of this iteration sequence.
        std::uint64_t nextExpected = 0;
        std::uint64_t candidateMask = entry->expectedMask ? entry->expectedMask
                                                          : laneBit;
        std::uint64_t mask = candidateMask;
        while (mask) {
            LaneId candidateLane = static_cast<LaneId>(std::countr_zero(mask));
            mask &= mask - 1;
            auto seqIt = loopFrame.laneNextSeq.find(candidateLane);
            if (seqIt == loopFrame.laneNextSeq.end() ||
                seqIt->second <= nextSeq) {
                nextExpected |= (1ull << candidateLane);
            }
        }
        if (nextExpected == 0)
            nextExpected = laneBit;

        // NOTE: `waveCtx.blocks` is a DenseMap; inserting can rehash and invalidate
        // references. Insert both keys before taking references.
        bool insertedPrep = waveCtx.blocks.try_emplace(nextPrep).second;
        bool insertedBody = waveCtx.blocks.try_emplace(nextBody).second;

        auto &prepCtx = waveCtx.blocks.find(nextPrep)->second;
        if (insertedPrep) {
            prepCtx.block = nextPrep.block;
            prepCtx.sequenceId = nextPrep.sequenceId;
            prepCtx.parentKey = key;
            prepCtx.expectedMask = nextExpected;
            prepCtx.activeMask = 0;
            prepCtx.completedMask = 0;
        } else {
            prepCtx.parentKey = key;
        }
        if (!insertedPrep && prepCtx.expectedMask == 0)
            prepCtx.expectedMask = laneBit;
        prepCtx.expectedMask |= laneBit;
        prepCtx.activeMask |= laneBit;
        prepCtx.completedMask &= ~laneBit;
        prepCtx.loopOp = loopOp;
        prepCtx.ownerLoopFrameId = loopFrame.frameId;
        prepCtx.switchOp = nullptr;
        prepCtx.ifOp = nullptr;
        prepCtx.loopIteration = loopIteration;
        prepCtx.kind = DynamicBlockKind::LoopPrepare;

        auto &bodyCtx = waveCtx.blocks.find(nextBody)->second;
        if (insertedBody) {
            bodyCtx.block = nextBody.block;
            bodyCtx.sequenceId = nextBody.sequenceId;
            bodyCtx.parentKey = nextPrep;
            bodyCtx.expectedMask = nextExpected;
            bodyCtx.activeMask = 0;
            bodyCtx.completedMask = 0;
        } else {
            bodyCtx.parentKey = nextPrep;
        }
        if (!insertedBody && bodyCtx.expectedMask == 0)
            bodyCtx.expectedMask = laneBit;
        bodyCtx.expectedMask |= laneBit;
        bodyCtx.activeMask &= ~laneBit;
        bodyCtx.completedMask &= ~laneBit;
        bodyCtx.loopOp = loopOp;
        bodyCtx.ownerLoopFrameId = loopFrame.frameId;
        bodyCtx.switchOp = nullptr;
        bodyCtx.ifOp = nullptr;
        bodyCtx.loopIteration = loopIteration;
        bodyCtx.kind = DynamicBlockKind::LoopBody;

        restoreLaneInBlockEpochsAndCollectives(waveCtx, nextPrep, lane);
        restoreLaneInBlockEpochsAndCollectives(waveCtx, nextBody, lane);

        assert(!(prepCtx.loopOp && prepCtx.switchOp) &&
               "dynamic block cannot have both loopOp and switchOp");
        assert(!(bodyCtx.loopOp && bodyCtx.switchOp) &&
               "dynamic block cannot have both loopOp and switchOp");

        if (insertedPrep && !llvm::is_contained(entry->pendingChildren, nextPrep)) {
            entry->pendingChildren.push_back(nextPrep);
        }
        if (insertedBody && !llvm::is_contained(entry->pendingChildren, nextBody)) {
            entry->pendingChildren.push_back(nextBody);
        }

        auto prepArgs =
            const_cast<mlir::Block *>(nextPrep.block)->getArguments();
        auto &env = prepCtx.valueEnvs[lane];
        for (auto indexed : llvm::enumerate(prepArgs)) {
            if (indexed.index() < nextCarried.size())
                env[indexed.value()] = nextCarried[indexed.index()];
        }

        SemanticsContext laneCtx = context;
        laneCtx.overrideMode.reset();
        laneCtx.activeMask = prepCtx.activeMask;
        laneCtx.expectedMask =
            prepCtx.expectedMask ? prepCtx.expectedMask : prepCtx.activeMask;
        laneCtx.laneId = lane;
        mlir::Block *prepBlock = const_cast<mlir::Block *>(nextPrep.block);
        StepType childStep =
            makeNextOp(wave, nextPrep, prepBlock, prepBlock->begin(), laneCtx, lane);
        enqueue(wave, nextPrep, lane, std::move(childStep));
        loopFrame.laneNextSeq[lane] = nextSeq + 2;
        return StepType::halt();
    }

    std::optional<StepType> handleLoopContinue(WaveId wave,
                                               const DynamicBlockKey &key,
                                               mlir::Block *block,
                                               mlir::Block::iterator it,
                                               SemanticsContext context,
                                               LaneId lane) {
        auto contOp = llvm::dyn_cast<simt::dialect::ContinueOp>(&*it);
        if (!contOp)
            return std::nullopt;

        (void)block;
        auto waveIt = state_.waves.find(wave);
        if (waveIt == state_.waves.end())
            llvm::report_fatal_error("handleLoopContinue: missing wave context");
        auto &waveCtx = waveIt->second;
        auto *blockCtx = getBlock(waveCtx, key);
        if (!blockCtx || !blockCtx->loopOp)
            llvm::report_fatal_error("handleLoopContinue: invalid block context");
        if ((blockCtx->activeMask & (1ull << lane)) == 0)
            llvm::report_fatal_error("handleLoopContinue: invalid active mask");

        if (EnableCPSDebugLogs) {
            auto fmt = [&](std::uint64_t m) { return formatMaskBits(m, 32); };
            cpsDebugStream() << "[CPS] handleLoopContinue lane=" << lane
                         << " block=" << key.block << " seq=" << key.sequenceId
                         << " active=" << fmt(blockCtx->activeMask)
                         << " expected=" << fmt(blockCtx->expectedMask)
                         << "\n";
        }

        auto *entry = findLoopEntry(waveCtx, key, blockCtx->loopOp);
        if (!entry || !entry->loopFrame)
            llvm::report_fatal_error("handleLoopContinue: missing loop frame");
        auto &loopFrame = *entry->loopFrame;
        LoopFrameId loopFrameId = loopFrame.frameId;
        const mlir::Operation *loopOp = blockCtx->loopOp;
        auto bodyKeyOrNone = findOwningLoopBodyKey(waveCtx, key, loopOp);
        if (!bodyKeyOrNone)
            llvm::report_fatal_error("handleLoopContinue: missing owning loop body key");
        DynamicBlockKey bodyKey = *bodyKeyOrNone;
        // Continuing from a nested region still targets the loop's next prepare/body.
        if (blockCtx->kind != DynamicBlockKind::LoopBody) {
            if (EnableCPSDebugLogs) {
                cpsDebugStream() << "[CPS] handleLoopContinue non-body lane=" << lane
                             << " block=" << key.block << " seq=" << key.sequenceId
                             << "\n";
            }
            // Drop pending continuations for control-split parents within this loop.
            auto parentKey = blockCtx->parentKey;
            while (parentKey) {
                auto parentIt = waveCtx.blocks.find(*parentKey);
                if (parentIt == waveCtx.blocks.end())
                    break;
                if (parentIt->second.loopOp != blockCtx->loopOp)
                    break;
                if (parentIt->second.kind == DynamicBlockKind::IfThen ||
                    parentIt->second.kind == DynamicBlockKind::IfElse ||
                    parentIt->second.kind == DynamicBlockKind::SwitchCase ||
                    parentIt->second.kind == DynamicBlockKind::SwitchDefault) {
                    // Only clear continuations that belong to control-split
                    // scaffolding. Loop ancestors keep their continuation so the
                    // lane can return to the correct loop parent.
                    parentIt->second.continuations.erase(lane);
                    markMergeCompletion(wave, waveCtx, *parentKey, lane);
                }
                parentKey = parentIt->second.parentKey;
            }
            if (blockCtx->kind == DynamicBlockKind::IfThen ||
                blockCtx->kind == DynamicBlockKind::IfElse ||
                blockCtx->kind == DynamicBlockKind::SwitchCase ||
                blockCtx->kind == DynamicBlockKind::SwitchDefault) {
                blockCtx->continuations.erase(lane);
                markMergeCompletion(wave, waveCtx, key, lane);
            }
        }
        std::uint64_t laneBit = 1ull << lane;

        llvm::SmallVector<ValueType, 4> nextCarried;
        nextCarried.reserve(contOp.getNumOperands());
        for (mlir::Value v : contOp.getOperands()) {
            auto valOrErr =
                evaluateValue(waveCtx, key, v, lane, blockCtx->activeMask,
                              blockCtx->expectedMask ? blockCtx->expectedMask
                                                     : blockCtx->activeMask);
            if (!valOrErr) {
                llvm::report_fatal_error("handleLoopContinue: failed to evaluate continue operand");
            }
            nextCarried.push_back(*valOrErr);
        }
        loopFrame.carried[lane].assign(nextCarried.begin(), nextCarried.end());
        std::uint32_t nextSeq =
            loopFrame.laneNextSeq.try_emplace(lane, key.sequenceId + 2).first->second;

        blockCtx->activeMask &= ~laneBit;
        blockCtx->completedMask |= laneBit;
        // This lane exits the current iteration immediately. Clear stale state
        // from the current dynamic body subtree, but keep future iterations of
        // the same loop frame intact so this lane can re-enroll before nested
        // control epochs there close.
        shrinkExpectedForSubtree(wave, waveCtx, bodyKey, lane, loopFrameId,
                                 nextSeq);

        entry = findLoopEntryByFrameId(waveCtx, loopFrameId);
        if (!entry || !entry->loopFrame)
            llvm::report_fatal_error("handleLoopContinue: missing loop frame after shrink");
        auto &loopFrameAfter = *entry->loopFrame;

        loopFrameAfter.laneNextSeq[lane] = nextSeq + 2;
        DynamicBlockKey nextPrep{loopFrameAfter.prepareKey.block, nextSeq};
        DynamicBlockKey nextBody{loopFrameAfter.bodyKey.block,
                                 static_cast<std::uint32_t>(nextSeq + 1)};
        std::uint32_t loopIteration = 0;
        if (nextPrep.sequenceId >= loopFrameAfter.prepareKey.sequenceId)
            loopIteration =
                (nextPrep.sequenceId - loopFrameAfter.prepareKey.sequenceId) / 2;
        std::uint64_t nextExpected = 0;
        std::uint64_t candidateMask =
            entry->expectedMask ? entry->expectedMask : laneBit;
        std::uint64_t mask = candidateMask;
        while (mask) {
            LaneId candidateLane = static_cast<LaneId>(std::countr_zero(mask));
            mask &= mask - 1;
            auto seqIt = loopFrameAfter.laneNextSeq.find(candidateLane);
            if (seqIt == loopFrameAfter.laneNextSeq.end() ||
                seqIt->second <= nextSeq) {
                nextExpected |= (1ull << candidateLane);
            }
        }
        nextExpected |= laneBit;

        // NOTE: `waveCtx.blocks` is a DenseMap; inserting can rehash and invalidate
        // references. Insert both keys before taking references.
        bool insertedPrep = waveCtx.blocks.try_emplace(nextPrep).second;
        bool insertedBody = waveCtx.blocks.try_emplace(nextBody).second;

        auto &prepCtx = waveCtx.blocks.find(nextPrep)->second;
        if (insertedPrep) {
            prepCtx.block = nextPrep.block;
            prepCtx.sequenceId = nextPrep.sequenceId;
            prepCtx.parentKey = bodyKey;
            prepCtx.expectedMask = nextExpected;
            prepCtx.activeMask = 0;
            prepCtx.completedMask = 0;
        } else {
            prepCtx.parentKey = bodyKey;
        }
        if (!insertedPrep && prepCtx.expectedMask == 0)
            prepCtx.expectedMask = laneBit;
        prepCtx.expectedMask |= laneBit;
        prepCtx.activeMask |= laneBit;
        prepCtx.completedMask &= ~laneBit;
        prepCtx.loopOp = loopOp;
        prepCtx.ownerLoopFrameId = loopFrameAfter.frameId;
        prepCtx.ifOp = nullptr;
        prepCtx.loopIteration = loopIteration;
        prepCtx.kind = DynamicBlockKind::LoopPrepare;

        auto &bodyCtx = waveCtx.blocks.find(nextBody)->second;
        if (insertedBody) {
            bodyCtx.block = nextBody.block;
            bodyCtx.sequenceId = nextBody.sequenceId;
            bodyCtx.parentKey = nextPrep;
            bodyCtx.expectedMask = nextExpected;
            bodyCtx.activeMask = 0;
            bodyCtx.completedMask = 0;
        } else {
            bodyCtx.parentKey = nextPrep;
        }
        if (!insertedBody && bodyCtx.expectedMask == 0)
            bodyCtx.expectedMask = laneBit;
        bodyCtx.expectedMask |= laneBit;
        bodyCtx.activeMask &= ~laneBit;
        bodyCtx.completedMask &= ~laneBit;
        bodyCtx.loopOp = loopOp;
        bodyCtx.ownerLoopFrameId = loopFrameAfter.frameId;
        bodyCtx.ifOp = nullptr;
        bodyCtx.loopIteration = loopIteration;
        bodyCtx.kind = DynamicBlockKind::LoopBody;

        restoreLaneInBlockEpochsAndCollectives(waveCtx, nextPrep, lane);
        restoreLaneInBlockEpochsAndCollectives(waveCtx, nextBody, lane);

        if (insertedPrep && !llvm::is_contained(entry->pendingChildren, nextPrep)) {
            entry->pendingChildren.push_back(nextPrep);
        }
        if (insertedBody && !llvm::is_contained(entry->pendingChildren, nextBody)) {
            entry->pendingChildren.push_back(nextBody);
        }

        auto prepArgs =
            const_cast<mlir::Block *>(nextPrep.block)->getArguments();
        auto &env = prepCtx.valueEnvs[lane];
        for (auto indexed : llvm::enumerate(prepArgs)) {
            if (indexed.index() < nextCarried.size())
                env[indexed.value()] = nextCarried[indexed.index()];
        }

        SemanticsContext laneCtx = context;
        laneCtx.overrideMode.reset();
        laneCtx.activeMask = prepCtx.activeMask;
        laneCtx.expectedMask =
            prepCtx.expectedMask ? prepCtx.expectedMask : prepCtx.activeMask;
        laneCtx.laneId = lane;
        mlir::Block *prepBlock = const_cast<mlir::Block *>(nextPrep.block);
        StepType childStep =
            makeNextOp(wave, nextPrep, prepBlock, prepBlock->begin(), laneCtx, lane);
        enqueue(wave, nextPrep, lane, std::move(childStep));
        loopFrameAfter.laneNextSeq[lane] = nextSeq + 2;
        return StepType::halt();
    }

    std::optional<StepType> handleBreak(WaveId wave,
                                        const DynamicBlockKey &key,
                                        mlir::Block *block,
                                        mlir::Block::iterator it,
                                        SemanticsContext context,
                                        LaneId lane) {
        auto breakOp = llvm::dyn_cast<simt::dialect::BreakOp>(&*it);
        if (!breakOp)
            return std::nullopt;

        (void)block;
        auto waveIt = state_.waves.find(wave);
        if (waveIt == state_.waves.end())
            llvm::report_fatal_error("handleBreak: missing wave context");
        auto &waveCtx = waveIt->second;
        auto *blockCtx = getBlock(waveCtx, key);
        if (!blockCtx)
            llvm::report_fatal_error("handleBreak: missing block context");
        if ((blockCtx->activeMask & (1ull << lane)) == 0)
            llvm::report_fatal_error("handleBreak: invalid active mask");
        // Find the nearest enclosing loop or switch merge entry that contains this
        // dynamic block key. This must disambiguate multiple dynamic instances of
        // the same op (e.g., a loop/switch executed in different iterations).
        MergeStackEntry<ValueType, StepType> *entry = nullptr;
        for (auto it = waveCtx.mergeStack.rbegin(); it != waveCtx.mergeStack.rend(); ++it) {
            if (it->ifOp)
                continue;
            if (it->loopFrame) {
                const auto &frame = *it->loopFrame;
                if (isDynamicDescendant(waveCtx, key, frame.prepareKey) ||
                    isDynamicDescendant(waveCtx, key, frame.bodyKey)) {
                    entry = &*it;
                    break;
                }
                continue;
            }
            if (it->switchFrame) {
                const auto &frame = *it->switchFrame;
                bool inSwitch = false;
                for (std::size_t idx = 0; idx < frame.caseBlocks.size(); ++idx) {
                    DynamicBlockKey caseKey{
                        frame.caseBlocks[idx],
                        static_cast<std::uint32_t>(frame.baseSeq + idx)};
                    if (isDynamicDescendant(waveCtx, key, caseKey)) {
                        inSwitch = true;
                        break;
                    }
                }
                if (inSwitch) {
                    entry = &*it;
                    break;
                }
            }
        }
        if (!entry)
            llvm::report_fatal_error("handleBreak: no enclosing merge entry");

        if (entry->loopFrame)
            return handleLoopBreakInternal(wave, key, breakOp, lane, waveCtx, *entry);
        return handleSwitchBreakInternal(wave, key, breakOp, lane, waveCtx, *entry);
    }

    std::optional<StepType> handleSwitchYield(WaveId wave,
                                              const DynamicBlockKey &key,
                                              mlir::Block *block,
                                              mlir::Block::iterator it,
                                              SemanticsContext context,
                                              LaneId lane) {
        auto yieldOp = llvm::dyn_cast<simt::dialect::YieldOp>(&*it);
        if (!yieldOp)
            return std::nullopt;

        (void)block;
        auto waveIt = state_.waves.find(wave);
        if (waveIt == state_.waves.end())
            llvm::report_fatal_error("handleSwitchYield: missing wave context");
        auto &waveCtx = waveIt->second;
        auto *blockCtx = getBlock(waveCtx, key);
        if (!blockCtx || !blockCtx->switchOp)
            return std::nullopt;
        if (blockCtx->kind != DynamicBlockKind::SwitchCase &&
            blockCtx->kind != DynamicBlockKind::SwitchDefault)
            return std::nullopt;
        std::uint64_t laneBit = 1ull << lane;
        if ((blockCtx->activeMask & laneBit) == 0)
            llvm::report_fatal_error("handleSwitchYield: invalid active mask");

        auto *switchOperation = const_cast<mlir::Operation *>(blockCtx->switchOp);
        auto switchOp = llvm::dyn_cast<simt::dialect::SwitchOp>(switchOperation);
        if (!switchOp)
            return std::nullopt;
        auto defaultIndexAttr = switchOp.getDefaultIndexAttr();
        if (!defaultIndexAttr)
            llvm::report_fatal_error("handleSwitchYield: missing default_index attr");
        int64_t defaultIndex = defaultIndexAttr.getInt();
        if (defaultIndex < 0)
            llvm::report_fatal_error("handleSwitchYield: invalid default_index");

        llvm::SmallVector<ValueType, 8> values;
        values.reserve(yieldOp.getNumOperands());
        auto *envPtr =
            blockCtx && blockCtx->valueEnvs.count(lane)
                ? &blockCtx->valueEnvs.find(lane)->second
                : nullptr;
        for (mlir::Value v : yieldOp.getOperands()) {
            if (envPtr) {
                if (auto it = envPtr->find(v); it != envPtr->end()) {
                    values.push_back(it->second);
                    continue;
                }
            }
            auto valOrErr =
                evaluateValue(waveCtx, key, v, lane, blockCtx->activeMask,
                              blockCtx->expectedMask ? blockCtx->expectedMask
                                                     : blockCtx->activeMask);
            if (!valOrErr)
                llvm::report_fatal_error("handleSwitchYield: failed to evaluate yield operand");
            values.push_back(*valOrErr);
        }

        // Match the merge entry for this dynamic instance of the switch.
        //
        // IMPORTANT: a single simt_step.switch op can execute multiple times (e.g.
        // inside a simt_step.loop), so matching by switchOp alone is ambiguous.
        // Prefer the parent dynamic block key when available.
        const auto parentKey = blockCtx->parentKey;
        const mlir::Operation *switchToken = blockCtx->switchOp;
        auto resolveSwitchEntry = [&]() -> MergeStackEntry<ValueType, StepType> * {
            MergeStackEntry<ValueType, StepType> *resolved = nullptr;
            if (parentKey) {
                for (auto it = waveCtx.mergeStack.rbegin();
                     it != waveCtx.mergeStack.rend(); ++it) {
                    if (it->loopFrame || it->ifOp || it->parent != *parentKey)
                        continue;
                    if (it->switchFrame &&
                        it->switchFrame->switchOp != switchToken)
                        continue;
                    resolved = &*it;
                    break;
                }
            }
            if (resolved)
                return resolved;
            for (auto it = waveCtx.mergeStack.rbegin();
                 it != waveCtx.mergeStack.rend(); ++it) {
                if (it->loopFrame || it->ifOp || !it->switchFrame)
                    continue;
                if (it->switchFrame->switchOp != switchToken)
                    continue;
                // Disambiguate multiple dynamic instances by sequence range.
                std::uint32_t baseSeq = it->switchFrame->baseSeq;
                std::size_t numCases = it->switchFrame->caseBlocks.size();
                if (key.sequenceId < baseSeq)
                    continue;
                std::uint32_t caseIdx = key.sequenceId - baseSeq;
                if (caseIdx >= numCases)
                    continue;
                return &*it;
            }
            return nullptr;
        };
        MergeStackEntry<ValueType, StepType> *entry = resolveSwitchEntry();
        if (entry && !entry->switchFrame) {
            SwitchFrameState<ValueType> frame;
            frame.switchOp = switchOp.getOperation();
            frame.baseSeq = entry->parent.sequenceId + 1;
            for (mlir::Block &b : switchOp.getCaseBody())
                frame.caseBlocks.push_back(&b);
            entry->switchFrame = std::move(frame);
            if (entry->pendingChildren.empty()) {
                for (unsigned idx = 0; idx < entry->switchFrame->caseBlocks.size(); ++idx) {
                    entry->pendingChildren.push_back(DynamicBlockKey{
                        entry->switchFrame->caseBlocks[idx],
                        static_cast<std::uint32_t>(entry->switchFrame->baseSeq + idx)});
                }
            }
            if (entry->expectedMask == 0)
                entry->expectedMask =
                    blockCtx->expectedMask ? blockCtx->expectedMask : blockCtx->activeMask;
        }
        if (!entry || !entry->switchFrame)
            llvm::report_fatal_error("handleSwitchYield: missing switch frame");
        auto &frame = *entry->switchFrame;
        auto &caseRegion = switchOp.getCaseBody();
        unsigned bodyBlocks = static_cast<unsigned>(
            std::distance(caseRegion.begin(), caseRegion.end()));
        if (frame.caseBlocks.size() != bodyBlocks) {
            frame.caseBlocks.clear();
            frame.caseBlocks.reserve(bodyBlocks);
            for (mlir::Block &b : caseRegion)
                frame.caseBlocks.push_back(&b);
            if (entry->pendingChildren.size() != frame.caseBlocks.size()) {
                entry->pendingChildren.clear();
                for (unsigned idx = 0; idx < frame.caseBlocks.size(); ++idx) {
                    entry->pendingChildren.push_back(DynamicBlockKey{
                        frame.caseBlocks[idx],
                        static_cast<std::uint32_t>(frame.baseSeq + idx)});
                }
            }
        }
        unsigned numCases = static_cast<unsigned>(frame.caseBlocks.size());
        if (numCases == 0)
            llvm::report_fatal_error("handleSwitchYield: no switch cases");
        if (static_cast<std::size_t>(defaultIndex) >= numCases) {
            if (EnableCPSDebugLogs) {
                cpsDebugStream() << "[CPS] handleSwitchYield invalid default_index"
                             << " default=" << defaultIndex
                             << " numCases=" << numCases
                             << " bodyBlocks=" << bodyBlocks
                             << " caseValues=" << switchOp.getCaseValues().size()
                             << " baseSeq=" << frame.baseSeq
                             << " keySeq=" << key.sequenceId
                             << " switch=" << switchOp.getOperation() << "\n";
            }
            llvm::report_fatal_error("handleSwitchYield: default_index out of range");
        }
        if (key.sequenceId < frame.baseSeq)
            llvm::report_fatal_error("handleSwitchYield: invalid switch sequence");
        unsigned caseIdx = key.sequenceId - frame.baseSeq;
        if (caseIdx >= numCases)
            llvm::report_fatal_error("handleSwitchYield: case index out of range");
        auto fallthroughAttr = yieldOp->getAttrOfType<mlir::BoolAttr>("fallthrough");
        if (!fallthroughAttr)
            llvm::report_fatal_error("handleSwitchYield: missing fallthrough attr");
        bool fallthrough = fallthroughAttr.getValue();
        bool lastCase = (caseIdx + 1 >= numCases);
        if (EnableCPSDebugLogs) {
            cpsDebugStream() << "[CPS] handleSwitchYield lane=" << lane
                         << " caseIdx=" << caseIdx
                         << " fallthrough=" << fallthrough
                         << " lastCase=" << lastCase << "\n";
        }
        frame.carried[lane] = values;

        bool switchDoneNow = !fallthrough || lastCase;
        if (switchDoneNow) {
            // handleSwitchSplit seeds this lane into downstream cases to model
            // potential fallthrough. If this case terminates the switch for the
            // lane, prune it from all future-case subtrees so their collectives
            // do not wait on an impossible participant.
            for (unsigned futureIdx = caseIdx + 1; futureIdx < numCases;
                 ++futureIdx) {
                DynamicBlockKey futureKey{
                    frame.caseBlocks[futureIdx],
                    static_cast<std::uint32_t>(frame.baseSeq + futureIdx)};
                shrinkExpectedForSubtree(wave, waveCtx, futureKey, lane);
            }
            entry = resolveSwitchEntry();
            if (!entry || !entry->switchFrame)
                llvm::report_fatal_error(
                    "handleSwitchYield: missing switch frame after shrink");
            auto &frameAfter = *entry->switchFrame;
            if (auto pendingIt = frameAfter.pendingCases.find(lane);
                pendingIt != frameAfter.pendingCases.end()) {
                if (auto *pendingBlock = getBlock(waveCtx, pendingIt->second))
                    pendingBlock->continuations.erase(lane);
                frameAfter.pendingCases.erase(pendingIt);
            }
            if (!parentKey)
                llvm::report_fatal_error("handleSwitchYield: missing parent key");
            auto parentIt = waveCtx.blocks.find(*parentKey);
            if (parentIt == waveCtx.blocks.end())
                llvm::report_fatal_error("handleSwitchYield: missing parent block");
            auto &parentEnv = parentIt->second.valueEnvs[lane];
            unsigned idx = 0;
            for (mlir::Value res : switchOp->getResults()) {
                if (idx < values.size())
                    parentEnv[res] = values[idx];
                ++idx;
            }
            blockCtx->activeMask &= ~laneBit;
            blockCtx->completedMask |= laneBit;
            handleReconvergence(wave, waveCtx, key, lane);
            return StepType::halt();
        }

        const auto currentSwitchOp = blockCtx->switchOp;
        const auto currentLoopOp = blockCtx->loopOp;
        const auto currentOwnerLoopFrameId = blockCtx->ownerLoopFrameId;

        unsigned nextIdx = caseIdx + 1;
        DynamicBlockKey nextKey{frame.caseBlocks[nextIdx],
                                static_cast<std::uint32_t>(frame.baseSeq + nextIdx)};
        auto &nextCtx = waveCtx.blocks[nextKey];
        auto *currentCtx = getBlock(waveCtx, key);
        if (!currentCtx)
            llvm::report_fatal_error("handleSwitchYield: missing current block after insert");
        nextCtx.block = nextKey.block;
        nextCtx.sequenceId = nextKey.sequenceId;
        nextCtx.parentKey = entry->parent;
        if (nextCtx.expectedMask == 0)
            nextCtx.expectedMask = laneBit;
        nextCtx.expectedMask |= laneBit;
        nextCtx.activeMask |= laneBit;
        nextCtx.completedMask &= ~laneBit;
        nextCtx.kind = (nextIdx == static_cast<unsigned>(defaultIndex))
                           ? DynamicBlockKind::SwitchDefault
                           : DynamicBlockKind::SwitchCase;
        nextCtx.switchOp = currentSwitchOp;
        nextCtx.loopOp = currentLoopOp;
        nextCtx.ownerLoopFrameId = currentOwnerLoopFrameId;
        nextCtx.ifOp = nullptr;

        auto &env = nextCtx.valueEnvs[lane];
        auto nextArgs =
            const_cast<mlir::Block *>(nextKey.block)->getArguments();
        for (auto indexed : llvm::enumerate(nextArgs)) {
            if (indexed.index() < values.size())
                env[indexed.value()] = values[indexed.index()];
        }

        if (auto pendingIt = frame.pendingCases.find(lane);
            pendingIt != frame.pendingCases.end()) {
            if (auto *pendingBlock = getBlock(waveCtx, pendingIt->second))
                pendingBlock->continuations.erase(lane);
        }
        frame.pendingCases[lane] = key;
        currentCtx->continuations[lane] = StepType::halt();

        currentCtx->activeMask &= ~laneBit;
        currentCtx->completedMask |= laneBit;
        waveCtx.lanes[lane].currentBlock = nextKey;

        SemanticsContext laneCtx = context;
        laneCtx.overrideMode.reset();
        laneCtx.activeMask = nextCtx.activeMask;
        laneCtx.expectedMask =
            nextCtx.expectedMask ? nextCtx.expectedMask : nextCtx.activeMask;
        laneCtx.laneId = lane;
        mlir::Block *nextBlock = const_cast<mlir::Block *>(nextKey.block);
        StepType childStep = makeNextOp(wave, nextKey, nextBlock,
                                        nextBlock->begin(), laneCtx, lane);
        enqueue(wave, nextKey, lane, std::move(childStep));
        return StepType::halt();
    }

    std::optional<StepType> handleIfYield(WaveId wave,
                                          const DynamicBlockKey &key,
                                          mlir::Block *block,
                                          mlir::Block::iterator it,
                                          SemanticsContext context,
                                          LaneId lane) {
        auto yieldOp = llvm::dyn_cast<simt::dialect::YieldOp>(&*it);
        if (!yieldOp)
            return std::nullopt;

        (void)block;
        auto waveIt = state_.waves.find(wave);
        if (waveIt == state_.waves.end())
            llvm::report_fatal_error("handleIfYield: missing wave context");
        auto &waveCtx = waveIt->second;
        auto *blockCtx = getBlock(waveCtx, key);
        if (!blockCtx)
            llvm::report_fatal_error("handleIfYield: missing block context");
        if (!blockCtx->parentKey || !blockCtx->ifOp)
            return std::nullopt;
        std::uint64_t laneBit = 1ull << lane;
        if ((blockCtx->activeMask & laneBit) == 0)
            llvm::report_fatal_error("handleIfYield: invalid active mask");

        auto parentIt = waveCtx.blocks.find(*blockCtx->parentKey);
        if (parentIt == waveCtx.blocks.end())
            llvm::report_fatal_error("handleIfYield: missing parent block");
        auto &parentBlock = parentIt->second;
        auto &parentEnv = parentBlock.valueEnvs[lane];

        llvm::SmallVector<ValueType, 4> values;
        values.reserve(yieldOp.getNumOperands());
        auto *envPtr =
            blockCtx && blockCtx->valueEnvs.count(lane)
                ? &blockCtx->valueEnvs.find(lane)->second
                : nullptr;
        for (mlir::Value v : yieldOp.getOperands()) {
            // Try current block env first, then parent env, then full eval.
            if (envPtr) {
                if (auto it = envPtr->find(v); it != envPtr->end()) {
                    values.push_back(it->second);
                    continue;
                }
            }
            if (auto it = parentEnv.find(v); it != parentEnv.end()) {
                values.push_back(it->second);
                continue;
            }
            auto valOrErr =
                evaluateValue(waveCtx, key, v, lane, blockCtx->activeMask,
                              blockCtx->expectedMask ? blockCtx->expectedMask
                                                     : blockCtx->activeMask);
            if (!valOrErr)
                llvm::report_fatal_error("handleIfYield: failed to evaluate yield operand");
            values.push_back(*valOrErr);
        }

        unsigned idx = 0;
        auto *ifOp = const_cast<mlir::Operation *>(blockCtx->ifOp);
        for (mlir::Value res : ifOp->getResults()) {
            if (idx < values.size())
                parentEnv[res] = values[idx];
            ++idx;
        }

        blockCtx->activeMask &= ~laneBit;
        blockCtx->completedMask |= laneBit;

        if (EnableCPSDebugLogs) {
            auto fmt = [&](std::uint64_t m) { return formatMaskBits(m, 32); };
            cpsDebugStream() << "[CPS] handleIfYield lane=" << lane
                         << " block=" << key.block << " seq=" << key.sequenceId
                         << " parent=" << blockCtx->parentKey->block
                         << " ifOp=" << blockCtx->ifOp
                         << " active=" << fmt(blockCtx->activeMask)
                         << " expected=" << fmt(blockCtx->expectedMask)
                         << "\n";
        }

        handleReconvergence(wave, waveCtx, key, lane);
        return StepType::halt();
    }

    std::optional<StepType> handleLoopBreakInternal(
        WaveId wave, const DynamicBlockKey &key, simt::dialect::BreakOp breakOp,
        LaneId lane, WaveContext<ValueType, StepType> &waveCtx,
        MergeStackEntry<ValueType, StepType> &entry) {
        auto *blockCtx = getBlock(waveCtx, key);
        if (!blockCtx || !blockCtx->loopOp)
            llvm::report_fatal_error("handleLoopBreak: invalid loop block context");
        const mlir::Operation *loopOp = blockCtx->loopOp;
        std::uint64_t laneBit = 1ull << lane;

        llvm::SmallVector<ValueType, 4> results;
        results.reserve(breakOp.getNumOperands());
        for (mlir::Value v : breakOp.getOperands()) {
            auto valOrErr = evaluateValue(
                waveCtx, key, v, lane, blockCtx->activeMask,
                blockCtx->expectedMask ? blockCtx->expectedMask
                                       : blockCtx->activeMask);
            if (!valOrErr) {
                llvm::consumeError(valOrErr.takeError());
                results.push_back(ValueType{});
            } else {
                results.push_back(*valOrErr);
            }
        }
        auto &loopFrame = *entry.loopFrame;
        loopFrame.carried[lane].assign(results.begin(), results.end());
        loopFrame.laneNextSeq.erase(lane);
        loopFrame.carried.erase(lane);

        auto parentIt = waveCtx.blocks.find(entry.parent);
        if (parentIt != waveCtx.blocks.end()) {
            auto &parentEnv = parentIt->second.valueEnvs[lane];
            unsigned idx = 0;
            auto *loopOperation = const_cast<mlir::Operation *>(loopFrame.loopOp);
            for (mlir::Value res : loopOperation->getResults()) {
                if (idx < results.size())
                    parentEnv[res] = results[idx];
                ++idx;
            }
        }
        enqueueLoopExitContinuation(wave, waveCtx, entry, lane);

        blockCtx->activeMask &= ~laneBit;
        blockCtx->completedMask |= laneBit;
        if (EnableCPSDebugLogs) {
            auto fmt = [&](std::uint64_t m) { return formatMaskBits(m, 32); };
            cpsDebugStream() << "[CPS] handleLoopBreak lane=" << lane
                         << " block=" << key.block << " seq=" << key.sequenceId
                         << " active=" << fmt(blockCtx->activeMask)
                         << " expected=" << fmt(blockCtx->expectedMask)
                         << "\n";
        }
        shrinkExpectedForLoopLane(wave, waveCtx, loopFrame.frameId, lane);
        handleReconvergence(wave, waveCtx, key, lane);
        (void)popLoopEntryIfComplete(
            waveCtx, findLoopEntry(waveCtx, key, loopOp));
        return StepType::halt();
    }

    bool enqueueLoopExitContinuation(WaveId wave,
                                     WaveContext<ValueType, StepType> &waveCtx,
                                     MergeStackEntry<ValueType, StepType> &entry,
                                     LaneId lane) {
        if (!entry.loopFrame)
            return false;

        auto parentIt = waveCtx.blocks.find(entry.parent);
        if (parentIt == waveCtx.blocks.end())
            return false;

        std::uint64_t laneBit = 1ull << lane;
        auto &parentBlock = parentIt->second;
        auto &loopFrame = *entry.loopFrame;

        auto exitIt = loopFrame.exitContinuations.find(lane);
        if (exitIt == loopFrame.exitContinuations.end()) {
            auto contIt = parentBlock.continuations.find(lane);
            if (contIt == parentBlock.continuations.end())
                return false;
            parentBlock.activeMask |= laneBit;
            pushReady(wave, entry.parent, lane, std::move(contIt->second));
            parentBlock.continuations.erase(contIt);
        } else {
            parentBlock.activeMask |= laneBit;
            pushReady(wave, entry.parent, lane, std::move(exitIt->second));
            loopFrame.exitContinuations.erase(exitIt);
            parentBlock.continuations.erase(lane);
        }

        return true;
    }

    std::optional<StepType> handleSwitchBreakInternal(
        WaveId wave, const DynamicBlockKey &key, simt::dialect::BreakOp breakOp,
        LaneId lane, WaveContext<ValueType, StepType> &waveCtx,
        MergeStackEntry<ValueType, StepType> &entry) {
        auto *blockCtx = getBlock(waveCtx, key);
        if (!blockCtx || !blockCtx->switchOp)
            llvm::report_fatal_error("handleSwitchBreak: invalid switch block context");
        std::uint64_t laneBit = 1ull << lane;

        llvm::SmallVector<ValueType, 4> results;
        results.reserve(breakOp.getNumOperands());
        for (mlir::Value v : breakOp.getOperands()) {
            auto valOrErr = evaluateValue(
                waveCtx, key, v, lane, blockCtx->activeMask,
                blockCtx->expectedMask ? blockCtx->expectedMask
                                       : blockCtx->activeMask);
            if (!valOrErr) {
                llvm::consumeError(valOrErr.takeError());
                results.push_back(ValueType{});
            } else {
                results.push_back(*valOrErr);
            }
        }

        auto parentIt = waveCtx.blocks.find(entry.parent);
        if (parentIt != waveCtx.blocks.end()) {
            auto &parentEnv = parentIt->second.valueEnvs[lane];
            unsigned idx = 0;
            auto *switchOperation = const_cast<mlir::Operation *>(blockCtx->switchOp);
            for (mlir::Value res : switchOperation->getResults()) {
                if (idx < results.size())
                    parentEnv[res] = results[idx];
                ++idx;
            }
            auto contIt = parentIt->second.continuations.find(lane);
            if (contIt != parentIt->second.continuations.end()) {
                parentIt->second.activeMask |= laneBit;
                pushReady(wave, entry.parent, lane, std::move(contIt->second));
                parentIt->second.continuations.erase(contIt);
            }
        }

        blockCtx->activeMask &= ~laneBit;
        blockCtx->completedMask |= laneBit;
        if (EnableCPSDebugLogs) {
            auto fmt = [&](std::uint64_t m) { return formatMaskBits(m, 32); };
            cpsDebugStream() << "[CPS] handleSwitchBreak lane=" << lane
                         << " block=" << key.block << " seq=" << key.sequenceId
                         << " active=" << fmt(blockCtx->activeMask)
                         << " expected=" << fmt(blockCtx->expectedMask)
                         << "\n";
        }
        shrinkExpectedForLane(wave, waveCtx, lane);
        handleReconvergence(wave, waveCtx, key, lane);
        return StepType::halt();
    }

    std::optional<StepType> handleIfSplit(WaveId wave,
                                          const DynamicBlockKey &key,
                                          mlir::Block *block,
                                          mlir::Block::iterator it,
                                          SemanticsContext context,
                                          LaneId lane,
                                          const IfDecisionMap *decisions = nullptr) {
        auto ifOp = llvm::dyn_cast<simt::dialect::IfOp>(&*it);
        if (!ifOp)
            return std::nullopt;

        auto waveIt = state_.waves.find(wave);
        if (waveIt == state_.waves.end())
            llvm::report_fatal_error("handleIfSplit: missing wave context");
        auto &waveCtx = waveIt->second;
        auto parentBlockIt = waveCtx.blocks.find(key);
        if (parentBlockIt == waveCtx.blocks.end())
            llvm::report_fatal_error("handleIfSplit: missing parent block");
        auto &parentBlock = parentBlockIt->second;
        if ((parentBlock.activeMask & (1ull << lane)) == 0)
            return StepType::halt();

        if (auto gated = gateControlFlowOp(wave, key, block, it, context, lane))
            return gated;
        if (traceSink_ && !context.suppressStepTrace) {
            std::uint64_t expectedMask =
                context.expectedMask ? context.expectedMask : context.activeMask;
            if (expectedMask == 0)
                expectedMask = (1ull << lane);
            traceSink_->onStepBegin(
                wave, lane, it->getName().getStringRef().str(),
                context.activeMask, expectedMask, key.sequenceId, key.block,
                blockKindLabel(parentBlock.kind), parentBlock.loopIteration);
        }

        auto nextIt = std::next(it);
        SemanticsContext parentContext = context;
        parentContext.overrideMode.reset();
        parentContext.suppressStepTrace = false;
        StepType parentCont = StepType::continueWith(
            [this, wave, key, block, nextIt, parentContext, lane]() mutable
            -> StepType {
                return makeNextOp(wave, key, block, nextIt, parentContext, lane);
            });
        // Store for later reconvergence; do not enqueue until the lane returns.
        parentBlock.continuations[lane] = parentCont;

        // Prefer the collective-cf epoch mask when available; parentBlock
        // expectedMask can include lanes from prior executions of this block.
        std::uint64_t parentExpected =
            context.expectedMask
                ? context.expectedMask
                : (parentBlock.expectedMask ? parentBlock.expectedMask
                                            : parentBlock.activeMask);
        std::uint64_t laneMask =
            parentExpected ? (parentExpected & (1ull << lane)) : (1ull << lane);
        std::uint64_t laneBit = 1ull << lane;
        const mlir::Operation *enclosingLoopOp = parentBlock.loopOp;
        std::optional<LoopFrameId> enclosingLoopFrameId =
            parentBlock.ownerLoopFrameId;
        const mlir::Operation *enclosingSwitchOp = parentBlock.switchOp;

        // Evaluate predicate only for this lane.
        std::uint64_t evalActive =
            context.activeMask ? context.activeMask : parentBlock.activeMask;
        std::uint64_t evalExpected =
            context.expectedMask
                ? context.expectedMask
                : (parentBlock.expectedMask ? parentBlock.expectedMask
                                            : parentBlock.activeMask);
        bool takeThen = false;
        bool takeElse = false;
        if (decisions) {
            auto decisionIt = decisions->find(lane);
            if (decisionIt == decisions->end())
                llvm::report_fatal_error(
                    "handleIfSplit: missing predicate decision");
            takeThen = decisionIt->second;
        } else {
            auto condOrErr =
                evaluateBool(waveCtx, key, ifOp.getCondition(), lane,
                             evalActive, evalExpected);
            if (condOrErr) {
                takeThen = *condOrErr;
            } else {
                llvm::consumeError(condOrErr.takeError());
            }
        }
        if (!takeThen && !ifOp.getElseRegion().empty())
            takeElse = true;

        if (EnableCPSDebugLogs) {
            auto fmt = [&](std::uint64_t m) { return formatMaskBits(m, 32); };
            cpsDebugStream() << "[CPS] handleIfSplit lane=" << lane
                         << " parent=" << key.block << " seq=" << key.sequenceId
                         << " takeThen=" << takeThen << " takeElse=" << takeElse
                         << " active=0b" << fmt(parentBlock.activeMask)
                         << " expected=0b" << fmt(parentBlock.expectedMask)
                         << "\n";
        }

        // auto makeChildKey = [&](mlir::Block *b, std::uint32_t seq) {
        //     return DynamicBlockKey{b, seq};
        // };
        std::uint32_t baseSeq = key.sequenceId + 1;

        DynamicBlockKey thenKey{&ifOp.getThenRegion().front(), baseSeq};
        DynamicBlockKey elseKey{&ifOp.getElseRegion().front(), baseSeq + 1};

        // No else region and condition is false: the lane skips the then-region
        // entirely, so prune it from any existing then-subtree expectations.
        if (!takeThen && !takeElse) {
            shrinkExpectedForSubtree(wave, waveCtx, thenKey, lane);
            for (auto it = waveCtx.mergeStack.rbegin();
                 it != waveCtx.mergeStack.rend(); ++it) {
                if (it->loopFrame || it->switchFrame || it->parent != key)
                    continue;
                if (it->ifOp && it->ifOp != ifOp.getOperation())
                    continue;
                it->expectedMask &= ~laneMask;
                it->completedMask &= ~laneMask;
                break;
            }
            auto contIt = parentBlock.continuations.find(lane);
            if (contIt != parentBlock.continuations.end()) {
                parentBlock.activeMask |= laneBit;
                pushReady(wave, key, lane, std::move(contIt->second));
                parentBlock.continuations.erase(contIt);
            }
            return StepType::halt();
        }

        // NOTE: `waveCtx.blocks` is a DenseMap; inserting can rehash and invalidate
        // references. Insert both children before taking references.
        waveCtx.blocks.try_emplace(thenKey);
        waveCtx.blocks.try_emplace(elseKey);
        auto *parentBlockCtx = getBlock(waveCtx, key);
        if (!parentBlockCtx)
            llvm::report_fatal_error("handleIfSplit: missing parent block after insert");
        
        auto findMergeEntry = [&](WaveContext<ValueType, StepType> &ctx)
            -> MergeStackEntry<ValueType, StepType> * {
            for (auto it = ctx.mergeStack.rbegin(); it != ctx.mergeStack.rend(); ++it) {
                if (it->loopFrame || it->parent != key)
                    continue;
                if (it->switchFrame)
                    continue;
                if (it->ifOp && it->ifOp != ifOp.getOperation())
                    continue;
                return &*it;
            }
            return nullptr;
        };

        MergeStackEntry<ValueType, StepType> *entry = findMergeEntry(waveCtx);
        if (!entry) {
            MergeStackEntry<ValueType, StepType> newEntry;
            newEntry.parent = key;
            newEntry.ifOp = ifOp.getOperation();
            waveCtx.mergeStack.push_back(std::move(newEntry));
            entry = &waveCtx.mergeStack.back();
            entry->expectedMask = parentExpected ? parentExpected : laneMask;
            if (EnableCPSDebugLogs) {
                cpsDebugStream() << "[CPS] push merge (if) parent=" << key.block
                             << " seq=" << key.sequenceId << "\n";
                logMergeStackState<ValueType, StepType>(waveCtx);
            }
        }
        entry->ifOp = ifOp.getOperation();
        if (entry->expectedMask == 0)
            entry->expectedMask = parentExpected ? parentExpected : laneMask;
        entry->expectedMask |= laneMask;
        // Start from a clean slate for this lane; add it back only to the taken path.
        // entry->expectedMask &= ~laneBit;

        if (takeThen) {
        auto &child = waveCtx.blocks[thenKey];
        child.block = thenKey.block;
        child.sequenceId = thenKey.sequenceId;
        child.parentKey = key;
        child.ifOp = ifOp.getOperation();
        child.loopOp = enclosingLoopOp;
        child.ownerLoopFrameId = enclosingLoopFrameId;
        child.switchOp = enclosingSwitchOp;
        if (child.expectedMask == 0)
            child.expectedMask = laneMask;
        child.expectedMask |= laneMask;
        child.activeMask |= (1ull << lane);
        // child.completedMask &= ~(1ull << lane);
        child.kind = DynamicBlockKind::IfThen;
        if (auto envIt = parentBlockCtx->valueEnvs.find(lane);
            envIt != parentBlockCtx->valueEnvs.end()) {
            child.valueEnvs[lane] = envIt->second;
        }
            // Ensure sibling exists so we can clear this lane from its expected set.
        auto &elseCtx = waveCtx.blocks[elseKey];
        elseCtx.block = elseKey.block;
        elseCtx.sequenceId = elseKey.sequenceId;
        elseCtx.parentKey = key;
        elseCtx.ifOp = ifOp.getOperation();
        elseCtx.loopOp = enclosingLoopOp;
        elseCtx.ownerLoopFrameId = enclosingLoopFrameId;
        elseCtx.switchOp = enclosingSwitchOp;
        elseCtx.kind = DynamicBlockKind::IfElse;
            elseCtx.expectedMask &= ~laneMask;
            // Propagate the exclusion into any existing descendant dynamic blocks of the
            // else branch, including other sequenceIds (e.g., loop iterations).
            for (auto &kv : waveCtx.blocks) {
                const auto &descKey = kv.first;
                auto &desc = kv.second;
                if (isDynamicDescendant(waveCtx, descKey, elseKey))
                    desc.expectedMask &= ~laneMask;
            }
            shrinkExpectedForSubtree(wave, waveCtx, elseKey, lane);

            entry = findMergeEntry(waveCtx);
            if (!entry)
                llvm::report_fatal_error("handleIfSplit: missing merge entry after shrink");
            auto *childAfter = getBlock(waveCtx, thenKey);
            if (!childAfter)
                llvm::report_fatal_error("handleIfSplit: missing then block after shrink");
            parentBlockCtx = getBlock(waveCtx, key);
            if (!parentBlockCtx)
                llvm::report_fatal_error("handleIfSplit: missing parent block after shrink");

            if (!llvm::is_contained(entry->pendingChildren, thenKey)) {
                entry->pendingChildren.push_back(thenKey);
            }
            // entry->expectedMask |= laneMask;

            if (EnableCPSDebugLogs) {
                cpsDebugStream() << "[CPS] handleIfSplit lane=" << lane
                             << " -> then block=" << thenKey.block
                             << " seq=" << thenKey.sequenceId
                             << " parent=" << key.block
                             << " parentSeq=" << key.sequenceId
                             << "\n";
            }

            SemanticsContext laneCtx = context;
            laneCtx.overrideMode.reset();
            laneCtx.suppressStepTrace = false;
            laneCtx.activeMask = childAfter->activeMask;
            laneCtx.expectedMask =
                childAfter->expectedMask ? childAfter->expectedMask
                                         : childAfter->activeMask;
            laneCtx.laneId = lane;
            mlir::Block *childBlock = const_cast<mlir::Block *>(thenKey.block);
            StepType childStep = makeNextOp(wave, thenKey, childBlock,
                                            childBlock->begin(), laneCtx, lane);
            enqueue(wave, thenKey, lane, std::move(childStep));
            parentBlockCtx->activeMask &= ~(1ull << lane);
            logMergeStackState<ValueType, StepType>(waveCtx);
            return StepType::halt();
        }

        if (takeElse) {
        auto &child = waveCtx.blocks[elseKey];
        child.block = elseKey.block;
        child.sequenceId = elseKey.sequenceId;
        child.parentKey = key;
        child.ifOp = ifOp.getOperation();
        child.loopOp = enclosingLoopOp;
        child.ownerLoopFrameId = enclosingLoopFrameId;
        child.switchOp = enclosingSwitchOp;
        if (child.expectedMask == 0)
            child.expectedMask = laneMask;
        child.expectedMask |= laneMask;
        child.activeMask |= (1ull << lane);
        // child.completedMask &= ~(1ull << lane);
        child.kind = DynamicBlockKind::IfElse;
        if (auto envIt = parentBlockCtx->valueEnvs.find(lane);
            envIt != parentBlockCtx->valueEnvs.end()) {
            child.valueEnvs[lane] = envIt->second;
        }
        auto &thenCtx = waveCtx.blocks[thenKey];
        thenCtx.block = thenKey.block;
        thenCtx.sequenceId = thenKey.sequenceId;
        thenCtx.parentKey = key;
        thenCtx.ifOp = ifOp.getOperation();
        thenCtx.loopOp = enclosingLoopOp;
        thenCtx.ownerLoopFrameId = enclosingLoopFrameId;
        thenCtx.switchOp = enclosingSwitchOp;
        thenCtx.kind = DynamicBlockKind::IfThen;
        thenCtx.expectedMask &= ~laneMask;
            for (auto &kv : waveCtx.blocks) {
                const auto &descKey = kv.first;
                auto &desc = kv.second;
                if (isDynamicDescendant(waveCtx, descKey, thenKey))
                    desc.expectedMask &= ~laneMask;
            }
            shrinkExpectedForSubtree(wave, waveCtx, thenKey, lane);

            entry = findMergeEntry(waveCtx);
            if (!entry)
                llvm::report_fatal_error("handleIfSplit: missing merge entry after shrink");
            auto *childAfter = getBlock(waveCtx, elseKey);
            if (!childAfter)
                llvm::report_fatal_error("handleIfSplit: missing else block after shrink");
            parentBlockCtx = getBlock(waveCtx, key);
            if (!parentBlockCtx)
                llvm::report_fatal_error("handleIfSplit: missing parent block after shrink");

            if (!llvm::is_contained(entry->pendingChildren, elseKey)) {
                entry->pendingChildren.push_back(elseKey);
            }
            // entry->expectedMask |= laneMask;

            if (EnableCPSDebugLogs) {
                cpsDebugStream() << "[CPS] handleIfSplit lane=" << lane
                             << " -> else block=" << elseKey.block
                             << " seq=" << elseKey.sequenceId
                             << " parent=" << key.block
                             << " parentSeq=" << key.sequenceId
                             << "\n";
            }

            SemanticsContext laneCtx = context;
            laneCtx.overrideMode.reset();
            laneCtx.suppressStepTrace = false;
            laneCtx.activeMask = childAfter->activeMask;
            laneCtx.expectedMask =
                childAfter->expectedMask ? childAfter->expectedMask
                                         : childAfter->activeMask;
            laneCtx.laneId = lane;
            mlir::Block *childBlock = const_cast<mlir::Block *>(elseKey.block);
            StepType childStep = makeNextOp(wave, elseKey, childBlock,
                                            childBlock->begin(), laneCtx, lane);
            enqueue(wave, elseKey, lane, std::move(childStep));
            parentBlockCtx->activeMask &= ~(1ull << lane);
                logMergeStackState<ValueType, StepType>(waveCtx);
            return StepType::halt();
        }

        // No else region and condition false: just resume parent continuation.
        auto contIt = parentBlockCtx->continuations.find(lane);
        if (contIt != parentBlockCtx->continuations.end()) {
            parentBlockCtx->activeMask |= (1ull << lane);
            pushReady(wave, key, lane, std::move(contIt->second));
            parentBlockCtx->continuations.erase(contIt);
        }
        return StepType::halt();
    }

    std::optional<StepType> handleCallOp(WaveId wave,
                                         const DynamicBlockKey &key,
                                         mlir::Block *block,
                                         mlir::Block::iterator it,
                                         SemanticsContext context,
                                         LaneId lane) {
        auto callOp = llvm::dyn_cast<mlir::func::CallOp>(&*it);
        if (!callOp)
            return std::nullopt;

        auto waveIt = state_.waves.find(wave);
        if (waveIt == state_.waves.end())
            llvm::report_fatal_error("call: missing wave context");
        auto &waveCtx = waveIt->second;
        auto &laneCtx = waveCtx.lanes[lane];
        auto *callerBlockCtx = getBlock(waveCtx, key);
        if (!callerBlockCtx)
            llvm::report_fatal_error("call: missing caller block");

        auto calleeAttr = callOp.getCalleeAttr();
        if (!calleeAttr)
            llvm::report_fatal_error("call: missing callee symbol");
        auto calleeOp =
            mlir::dyn_cast_or_null<mlir::func::FuncOp>(
                mlir::SymbolTable::lookupNearestSymbolFrom(callOp, calleeAttr));
        if (!calleeOp)
            llvm::report_fatal_error("call: unresolved callee");
        if (calleeOp.isExternal())
            llvm::report_fatal_error("call: external callee unsupported");

        auto currentFunc = callOp->getParentOfType<mlir::func::FuncOp>();
        if (!currentFunc)
            llvm::report_fatal_error("call: missing parent function");
        if (calleeOp == currentFunc)
            llvm::report_fatal_error("call: recursion unsupported");
        for (const auto &frame : laneCtx.callStack) {
            if (frame.calleeName == calleeOp.getName().str())
                llvm::report_fatal_error("call: recursion unsupported");
        }

        if (callOp.getNumResults() > 1)
            llvm::report_fatal_error("call: multiple results unsupported");
        if (callOp.getNumOperands() != calleeOp.getNumArguments())
            llvm::report_fatal_error("call: argument count mismatch");

        llvm::SmallVector<ValueType, 4> argValues;
        argValues.reserve(callOp.getNumOperands());
        for (auto arg : callOp.getOperands()) {
            auto valOrErr = evaluateValue(
                waveCtx, key, arg, lane, context.activeMask, context.expectedMask);
            if (!valOrErr)
                llvm::report_fatal_error("call: argument evaluation failed");
            argValues.push_back(*valOrErr);
        }

        DynamicBlockKey calleeKey;
        auto callChildIt = callerBlockCtx->callChildren.find(callOp.getOperation());
        if (callChildIt != callerBlockCtx->callChildren.end()) {
            calleeKey = callChildIt->second;
        } else {
            calleeKey = DynamicBlockKey{&calleeOp.getBody().front(),
                                        waveCtx.nextCallSeq++};
            callerBlockCtx->callChildren[callOp.getOperation()] = calleeKey;
        }

        auto &calleeBlockCtx = waveCtx.blocks[calleeKey];
        auto *callerAfterInsert = getBlock(waveCtx, key);
        if (!callerAfterInsert)
            llvm::report_fatal_error("call: missing caller block after callee insert");
        calleeBlockCtx.block = calleeKey.block;
        calleeBlockCtx.sequenceId = calleeKey.sequenceId;
        calleeBlockCtx.kind = DynamicBlockKind::Plain;
        // A function call is not a nested region in the caller's CFG. Avoid
        // inheriting caller control-flow metadata; otherwise, loop/switch/if
        // pruning can incorrectly treat callee blocks as belonging to the
        // caller's dynamic subtree.
        calleeBlockCtx.parentKey.reset();
        calleeBlockCtx.loopOp = nullptr;
        calleeBlockCtx.ownerLoopFrameId.reset();
        calleeBlockCtx.switchOp = nullptr;
        calleeBlockCtx.ifOp = nullptr;
        std::uint64_t expected =
            context.expectedMask ? context.expectedMask : context.activeMask;
        if (calleeBlockCtx.expectedMask == 0)
            calleeBlockCtx.expectedMask = expected ? expected : (1ull << lane);
        calleeBlockCtx.expectedMask |= (1ull << lane);
        calleeBlockCtx.activeMask |= (1ull << lane);
        calleeBlockCtx.completedMask &= ~(1ull << lane);

        auto &env = calleeBlockCtx.valueEnvs[lane];
        env.clear();
        auto &entryBlock = calleeOp.getBody().front();
        for (unsigned i = 0; i < entryBlock.getNumArguments(); ++i)
            env[entryBlock.getArgument(i)] = argValues[i];

        callerAfterInsert->activeMask &= ~(1ull << lane);

        CallFrame<ValueType> frame;
        frame.callerKey = key;
        frame.callerBlock = block;
        frame.resumeIt = std::next(it);
        frame.callOp = callOp.getOperation();
        frame.results.assign(callOp.getResults().begin(), callOp.getResults().end());
        frame.calleeName = calleeOp.getName().str();
        laneCtx.callStack.push_back(std::move(frame));
        laneCtx.currentBlock = calleeKey;

        SemanticsContext calleeContext = context;
        calleeContext.overrideMode.reset();
        return StepType::continueWith(
            [this, wave, calleeKey, calleeBlock = const_cast<mlir::Block *>(
                                             calleeKey.block),
             calleeContext, lane]() mutable -> StepType {
                return makeNextOp(wave, calleeKey, calleeBlock,
                                  calleeBlock->begin(), calleeContext, lane);
            });
    }

    /// Evaluate an SSA value to a SemValue for a given lane in a block.
    llvm::Expected<ValueType> evaluateValue(WaveContext<ValueType, StepType> &waveCtx,
                                            const DynamicBlockKey &blockKey,
                                            mlir::Value value,
                                            LaneId lane,
                                            std::uint64_t activeMask,
                                            std::uint64_t expectedMask) {
        SemanticsContext ctx;
        ctx.laneId = lane;
        ctx.waveId = waveCtx.waveId;
        ctx.subgroupWidth = waveCtx.subgroupWidth;
        ctx.activeMask = activeMask;
        ctx.expectedMask = expectedMask;
        if (auto *blockCtx = getBlock(waveCtx, blockKey)) {
            auto envIt = blockCtx->valueEnvs.find(lane);
            if (envIt != blockCtx->valueEnvs.end())
                ctx.valueEnv = &envIt->second;
        }
        // Prefer cached values when available (avoid re-evaluating defs).
        if (ctx.valueEnv) {
            auto it = ctx.valueEnv->find(value);
            if (it != ctx.valueEnv->end())
                return it->second;
        }
        auto laneIt = waveCtx.lanes.find(lane);
        if (laneIt != waveCtx.lanes.end()) {
            auto it = laneIt->second.values.find(value);
            if (it != laneIt->second.values.end())
                return it->second;
        }
        if (mlir::isa<simt::dialect::ResourceType>(value.getType()))
            return SemValue::fromResource(value);
        // If the value has a defining op, ask the semantics to evaluate it.
        if (auto *defOp = value.getDefiningOp()) {
            // Values produced by calls/control-flow ops are materialized by the CPS
            // interpreter (not by the SimpleSemantics adaptor). Their defs may not
            // be in the current block env due to dynamic block boundaries, so scan
            // all per-block envs as a fallback.
            if (llvm::isa<mlir::func::CallOp>(defOp) || isControlFlowOp(defOp)) {
                for (auto &blockEntry : waveCtx.blocks) {
                    auto envIt = blockEntry.second.valueEnvs.find(lane);
                    if (envIt == blockEntry.second.valueEnvs.end())
                        continue;
                    auto valIt = envIt->second.find(value);
                    if (valIt != envIt->second.end())
                        return valIt->second;
                }
            }
            StepType step = adaptor_.eval(semantics_, defOp, ctx);
            if (!step.isProduce())
                return llvm::make_error<llvm::StringError>(
                    "value evaluation did not produce",
                    llvm::inconvertibleErrorCode());
            auto state = std::move(step).takeState();
            return std::get<typename StepType::Produce>(std::move(state)).value;
        }
        return llvm::make_error<llvm::StringError>(
            "unsupported SSA value in interpreter evaluateValue",
            llvm::inconvertibleErrorCode());
    }

    /// Evaluate a boolean SSA value for a given lane.
    llvm::Expected<bool> evaluateBool(WaveContext<ValueType, StepType> &waveCtx,
                                      const DynamicBlockKey &blockKey,
                                      mlir::Value value,
                                      LaneId lane,
                                      std::uint64_t activeMask,
                                      std::uint64_t expectedMask) {
        auto valOrErr =
            evaluateValue(waveCtx, blockKey, value, lane, activeMask, expectedMask);
        if (!valOrErr)
            return valOrErr.takeError();
        return valOrErr->asBool();
    }

    llvm::Error processReady(ReadyContinuation<ValueType, StepType> item) {
        if (item.lane >= 64) {
            return llvm::make_error<llvm::StringError>(
                llvm::Twine("processReady: lane out of range: ") +
                    llvm::Twine(item.lane),
                llvm::inconvertibleErrorCode());
        }
        ensureWaveBlock(item.wave, item.block, item.lane);
        auto &waveCtx = state_.waves[item.wave];
        auto &laneCtx = waveCtx.lanes[item.lane];
        if (item.epoch != laneCtx.readyEpoch) {
            if (EnableCPSDebugLogs) {
                cpsDebugStream() << "[CPS] drop stale ready epoch lane="
                                 << item.lane << " itemEpoch=" << item.epoch
                                 << " currentEpoch=" << laneCtx.readyEpoch
                                 << " block=" << item.block.block
                                 << " seq=" << item.block.sequenceId << "\n";
            }
            return llvm::Error::success();
        }
        if (auto *blockCtx = getBlock(waveCtx, item.block)) {
            std::uint64_t laneBit = 1ull << item.lane;
            // A queued continuation is stale once this lane is pruned from the
            // dynamic block's expected set.
            if (blockCtx->expectedMask &&
                (blockCtx->expectedMask & laneBit) == 0) {
                if (EnableCPSDebugLogs) {
                    cpsDebugStream() << "[CPS] drop stale ready lane=" << item.lane
                                     << " block=" << item.block.block
                                     << " seq=" << item.block.sequenceId
                                     << " expected=0b"
                                     << formatMaskBits(blockCtx->expectedMask, 32)
                                     << "\n";
                }
                blockCtx->activeMask &= ~laneBit;
                blockCtx->completedMask |= laneBit;
                return llvm::Error::success();
            }
        }
        laneCtx.currentBlock = item.block;
        if (auto *blockCtx = getBlock(waveCtx, item.block)) {
            std::uint64_t laneBit = 1ull << item.lane;
            blockCtx->activeMask |= laneBit;
            if (blockCtx->expectedMask)
                blockCtx->expectedMask |= laneBit;
            else
                blockCtx->expectedMask = blockCtx->activeMask;
            blockCtx->completedMask &= ~laneBit;
        }
        if (EnableCPSDebugLogs) {
            cpsDebugStream() << "[CPS] run lane=" << item.lane
                         << " block=" << item.block.block
                         << " seq=" << item.block.sequenceId << "\n";
        }
        StepType current = std::move(item.resume);
        for (;;) {
            typename StepType::State stateVariant = std::move(current).takeState();

            if (std::holds_alternative<typename StepType::Continue>(stateVariant)) {
                if (EnableCPSDebugLogs) {
                    cpsDebugStream() << "[CPS] state=Continue lane=" << item.lane
                                 << " block=" << item.block.block
                                 << " seq=" << item.block.sequenceId << "\n";
                }
                auto cont =
                    std::get<typename StepType::Continue>(std::move(stateVariant));
                if (!cont.next) {
                    return llvm::make_error<llvm::StringError>(
                        "continuation missing resume function",
                        llvm::inconvertibleErrorCode());
                }
                current = cont.next();
                continue;
            }

            if (std::holds_alternative<typename StepType::Produce>(stateVariant)) {
                auto prod =
                    std::get<typename StepType::Produce>(std::move(stateVariant));
                if (EnableCPSDebugLogs) {
                    cpsDebugStream() << "[CPS] state=Produce lane=" << item.lane
                                 << " block=" << item.block.block
                                 << " seq=" << item.block.sequenceId << "\n";
                }
                bool terminal = laneCtx.phase ==
                                LaneContext<ValueType, StepType>::Phase::Completed;
                laneCtx.hasReturned = laneCtx.hasReturned || terminal;
                laneCtx.returnValue = std::move(prod.value);
                const DynamicBlockKey &currentKey =
                    laneCtx.currentBlock ? *laneCtx.currentBlock : item.block;
                if (auto *blockCtx = getBlock(waveCtx, currentKey)) {
                    std::uint64_t laneBit = 1ull << item.lane;
                    blockCtx->activeMask &= ~laneBit;
                    blockCtx->completedMask |= laneBit;
                    if (terminal)
                        shrinkExpectedForLane(item.wave, waveCtx, item.lane);
                    // if (!terminal) {
                    //     // Resume parent execution for this lane.
                    //     handleReconvergence(item.wave, waveCtx, item.block, item.lane);
                    // }
                }
                return llvm::Error::success();
            }

            if (std::holds_alternative<typename StepType::Halt>(stateVariant)) {
                if (EnableCPSDebugLogs) {
                    cpsDebugStream() << "[CPS] state=Halt lane=" << item.lane
                                 << " block=" << item.block.block
                                 << " seq=" << item.block.sequenceId
                                 << " (continuation exhausted)\n";
                }
                const DynamicBlockKey &currentKey =
                    laneCtx.currentBlock ? *laneCtx.currentBlock : item.block;
                if (auto *blockCtx = getBlock(waveCtx, currentKey)) {
                    if (blockCtx->kind == DynamicBlockKind::IfThen ||
                        blockCtx->kind == DynamicBlockKind::IfElse ||
                        blockCtx->kind == DynamicBlockKind::SwitchCase ||
                        blockCtx->kind == DynamicBlockKind::SwitchDefault) {
                        // Control-flow terminators already handled reconvergence.
                        return llvm::Error::success();
                    }
                    if (blockCtx->loopOp) {
                        // Let loop handlers drive reconvergence and parent resumption;
                        // don't treat this as end-of-function for the lane.
                        std::uint64_t laneBit = 1ull << item.lane;
                        blockCtx->activeMask &= ~laneBit;
                        blockCtx->completedMask |= laneBit;
                        return llvm::Error::success();
                    }
                    if (blockCtx->continuations.contains(item.lane)) {
                        // Control-split placeholder; the continuation will resume later.
                        return llvm::Error::success();
                    }
                    bool terminal = laneCtx.phase ==
                                    LaneContext<ValueType, StepType>::Phase::Completed;
                    laneCtx.hasReturned = laneCtx.hasReturned || terminal;
                    std::uint64_t laneBit = 1ull << item.lane;
                    blockCtx->activeMask &= ~laneBit;
                    blockCtx->completedMask |= laneBit;
                    if (terminal)
                        shrinkExpectedForLane(item.wave, waveCtx, item.lane);
                    // Account for completion and allow reconvergence unless this was
                    // a terminal return for the lane.
                    markMergeCompletion(item.wave, waveCtx, currentKey,
                                       item.lane);
                    if (!terminal) {
                        handleReconvergence(item.wave, waveCtx, currentKey,
                                            item.lane);
                    }
                }
                return llvm::Error::success();
            }

            if (std::holds_alternative<typename StepType::Suspend>(stateVariant)) {
                auto susp =
                    std::get<typename StepType::Suspend>(std::move(stateVariant));
                const DynamicBlockKey &currentKey =
                    laneCtx.currentBlock ? *laneCtx.currentBlock : item.block;
                return handleSuspend(item.wave, currentKey, item.lane,
                                     std::move(susp));
            }

            return llvm::make_error<llvm::StringError>(
                "unknown step state encountered in CPS interpreter",
                llvm::inconvertibleErrorCode());
        }
    }

    llvm::Error handleSuspend(WaveId wave, const DynamicBlockKey &block,
                              LaneId lane,
                              typename StepType::Suspend &&suspend) {
        if (suspend.effect.template isa<YieldEffect>()) {
            if (!suspend.resume) {
                return llvm::make_error<llvm::StringError>(
                    "yield effect missing resume continuation",
                    llvm::inconvertibleErrorCode());
            }
            StepType resumed = suspend.resume();
            enqueue(wave, block, lane, std::move(resumed));
            return llvm::Error::success();
        }

        if (auto *collective =
                suspend.effect.template get_if<CollectiveEffect>()) {
            auto &waveCtx = state_.waves[wave];
            auto *blockCtx = getBlock(waveCtx, block);
            if (!blockCtx) {
                return llvm::make_error<llvm::StringError>(
                    "collective effect missing dynamic block context",
                    llvm::inconvertibleErrorCode());
            }
            CollectiveKey collectKey =
                makeCollectiveKey(*collective, block);
            bool isControlFlow =
                waveCtx.controlTokenToOp.find(collectKey) !=
                waveCtx.controlTokenToOp.end();
            const mlir::Operation *waveOp = nullptr;
            auto waveIt = waveCtx.collectiveTokenToOp.find(collectKey);
            if (waveIt != waveCtx.collectiveTokenToOp.end())
                waveOp = waveIt->second;
            bool isWaveCollective =
                waveOp && isWaveOp(const_cast<mlir::Operation *>(waveOp));
            bool isMemoryCollective =
                waveOp && isMemoryOp(const_cast<mlir::Operation *>(waveOp));
            auto &syncPoint = waveCtx.collectives[collectKey];
            syncPoint.effect = *collective;
            syncPoint.block = block;
            std::uint64_t laneBit = 1ull << lane;
            // Park the lane while it is suspended on this collective.
            blockCtx->activeMask &= ~laneBit;
            if (syncPoint.expectedMask == 0) {
                std::uint64_t fallbackMask =
                    blockCtx->expectedMask ? blockCtx->expectedMask : blockCtx->activeMask;
                syncPoint.expectedMask = collective->activeMask
                                             ? collective->activeMask
                                             : fallbackMask;
            }
            if (waveOp) {
                syncPoint.expectedMask &=
                    ~blockCtx->collectiveExecutedMask.lookup(waveOp);
            }
            syncPoint.arrivals.insert(lane);
            if (!isControlFlow) {
                syncPoint.continuations[lane] =
                    StepType::continueWith(
                        [resume = std::move(suspend.resume)]() mutable -> StepType {
                            return resume();
                        });
            }
            ensureExpectedCoversArrivals(syncPoint);

            auto expectedCount =
                static_cast<unsigned>(std::popcount(syncPoint.expectedMask));
            if (syncPoint.arrivals.size() == expectedCount) {
                if (isControlFlow) {
                    auto controlIt = waveCtx.controlTokenToOp.find(collectKey);
                    if (controlIt != waveCtx.controlTokenToOp.end()) {
                        mlir::Operation *controlOp =
                            const_cast<mlir::Operation *>(controlIt->second);
                        std::uint64_t expectedMask = syncPoint.expectedMask;
                        DynamicBlockKey controlBlock = syncPoint.block;
                        if (traceSink_) {
                            std::string opName =
                                controlOp->getName().getStringRef().str();
                            traceSink_->onCollectiveComplete(
                                wave, opName, expectedMask, expectedMask,
                                controlBlock.sequenceId, controlBlock.block,
                                blockKindLabel(blockCtx->kind),
                                blockCtx->loopIteration);
                        }
                        waveCtx.controlTokenToOp.erase(controlIt);
                        waveCtx.collectives.erase(collectKey);
                        handleControlFlowCollective(wave, controlBlock, controlOp,
                                                    expectedMask);
                        return llvm::Error::success();
                    }
                }
                bool memoryProducesResults =
                    isMemoryCollective && !syncPoint.results.empty();
                if (isWaveCollective && syncPoint.results.empty()) {
                    syncPoint.expectedMask = arrivedMask(syncPoint.arrivals);
                    computeWaveCollectiveResults(waveOp, syncPoint);
                }
                if (isMemoryCollective && !memoryProducesResults)
                    memoryProducesResults =
                        computeMemoryCollectiveResults(waveOp, syncPoint);
                if (waveOp)
                    blockCtx->collectiveExecutedMask[waveOp] |=
                        syncPoint.expectedMask;
                if (isWaveCollective && traceSink_) {
                    std::string opName;
                    if (waveOp)
                        opName = const_cast<mlir::Operation *>(waveOp)
                                     ->getName()
                                     .getStringRef()
                                     .str();
                    traceSink_->onCollectiveComplete(
                        wave,
                        opName,
                        syncPoint.expectedMask, syncPoint.expectedMask,
                        block.sequenceId, block.block,
                        blockKindLabel(blockCtx->kind),
                        blockCtx->loopIteration);
                }
                if (isMemoryCollective && traceSink_) {
                    std::string opName;
                    if (waveOp)
                        opName = const_cast<mlir::Operation *>(waveOp)
                                     ->getName()
                                     .getStringRef()
                                     .str();
                    traceSink_->onCollectiveComplete(
                        wave,
                        opName,
                        syncPoint.expectedMask, syncPoint.expectedMask,
                        block.sequenceId, block.block,
                        blockKindLabel(blockCtx->kind),
                        blockCtx->loopIteration);
                }
                std::uint64_t mask = syncPoint.expectedMask;
                while (mask) {
                    unsigned l = std::countr_zero(mask);
                    mask &= mask - 1;
                    auto contIt = syncPoint.continuations.find(l);
                    if (contIt != syncPoint.continuations.end()) {
                        blockCtx->activeMask |= (1ull << l);
                        pushReady(wave, block, l, contIt->second);
                    }
                }
                if (!isWaveCollective && !memoryProducesResults)
                    waveCtx.collectives.erase(collectKey);
                if (isMemoryCollective && !memoryProducesResults)
                    waveCtx.collectiveTokenToOp.erase(collectKey);
            }
            return llvm::Error::success();
        }

        if (auto *sync =
                suspend.effect.template get_if<SynchronizationEffect>()) {
            auto &waveCtx = state_.waves[wave];
            auto *blockCtx = getBlock(waveCtx, block);
            if (!blockCtx) {
                return llvm::make_error<llvm::StringError>(
                    "synchronization effect missing dynamic block context",
                    llvm::inconvertibleErrorCode());
            }
            std::uint32_t key = sync->token.value_or(sync->operation);
            auto &syncPoint = waveCtx.syncPoints[key];
            syncPoint.effect = *sync;
            syncPoint.block = block;
            std::uint64_t laneBit = 1ull << lane;
            // Park the lane while it is suspended on this synchronization point.
            blockCtx->activeMask &= ~laneBit;
            if (syncPoint.expectedMask == 0) {
                std::uint64_t fallbackMask =
                    blockCtx->expectedMask ? blockCtx->expectedMask : blockCtx->activeMask;
                syncPoint.expectedMask =
                    sync->activeMask ? sync->activeMask : fallbackMask;
            }
            syncPoint.arrivals.insert(lane);
            syncPoint.continuations[lane] =
                StepType::continueWith(
                    [resume = std::move(suspend.resume)]() mutable -> StepType {
                        return resume();
                    });

            auto expectedCount =
                static_cast<unsigned>(std::popcount(syncPoint.expectedMask));
            if (syncPoint.arrivals.size() == expectedCount) {
                const mlir::Operation *controlOp = nullptr;
                auto tokenIt = waveCtx.syncTokenToOp.find(key);
                if (tokenIt != waveCtx.syncTokenToOp.end()) {
                    controlOp = tokenIt->second;
                    waveCtx.syncTokenToOp.erase(tokenIt);
                    if (blockCtx) {
                        blockCtx->controlExecutedMask[controlOp] |=
                            syncPoint.expectedMask;
                        blockCtx->controlReadyMask[controlOp] |=
                            syncPoint.expectedMask;
                        closeControlEpoch(waveCtx, block, *blockCtx, controlOp,
                                          /*erasePendingCollective=*/false);
                    }
                }
                std::uint64_t mask = syncPoint.expectedMask;
                while (mask) {
                    unsigned l = std::countr_zero(mask);
                    mask &= mask - 1;
                    auto contIt = syncPoint.continuations.find(l);
                    if (contIt != syncPoint.continuations.end()) {
                        blockCtx->activeMask |= (1ull << l);
                        if (traceSink_ && controlOp) {
                            traceSink_->onResume(
                                wave, l, syncPoint.expectedMask,
                                syncPoint.expectedMask, block.sequenceId,
                                block.block,
                                blockKindLabel(blockCtx->kind),
                                blockCtx->loopIteration);
                        }
                        pushReady(wave, block, l, std::move(contIt->second));
                    }
                }
                waveCtx.syncPoints.erase(key);
            }
            return llvm::Error::success();
        }

        return llvm::make_error<llvm::StringError>(
            "encountered suspend with unsupported effect",
            llvm::inconvertibleErrorCode());
    }

    void ensureWaveBlock(WaveId wave, const DynamicBlockKey &block, LaneId lane) {
        auto &waveCtx = state_.waves[wave];
        auto [blockIt, inserted] = waveCtx.blocks.try_emplace(block);
        if (inserted) {
            blockIt->second.activeMask = 0;
        }
        waveCtx.lanes.try_emplace(lane);
    }

    static DynamicBlock<ValueType, StepType> *
    getBlock(WaveContext<ValueType, StepType> &waveCtx,
             const DynamicBlockKey &key) {
        auto it = waveCtx.blocks.find(key);
        return it == waveCtx.blocks.end() ? nullptr : &it->second;
    }

    void pushReady(WaveId wave, const DynamicBlockKey &block, LaneId lane,
                   StepType step) {
        if (lane >= 64)
            llvm::report_fatal_error(
                llvm::Twine("pushReady: lane out of range: ") + llvm::Twine(lane));
        auto &waveCtx = state_.waves[wave];
        auto &laneCtx = waveCtx.lanes[lane];
        std::uint64_t epoch = ++laneCtx.readyEpoch;
        state_.readyQueue.push_back(
            ReadyContinuation<ValueType, StepType>{
                wave, block, lane, epoch, std::move(step)});
    }

    static bool isDynamicDescendant(WaveContext<ValueType, StepType> &waveCtx,
                                    const DynamicBlockKey &desc,
                                    const DynamicBlockKey &ancestor) {
        DynamicBlockKey cur = desc;
        while (true) {
            if (cur == ancestor)
                return true;
            auto it = waveCtx.blocks.find(cur);
            if (it == waveCtx.blocks.end() || !it->second.parentKey)
                return false;
            cur = *it->second.parentKey;
        }
    }

    static std::optional<DynamicBlockKey>
    findDynamicRoot(WaveContext<ValueType, StepType> &waveCtx,
                    DynamicBlockKey key) {
        while (true) {
            auto it = waveCtx.blocks.find(key);
            if (it == waveCtx.blocks.end())
                return std::nullopt;
            if (!it->second.parentKey)
                return key;
            key = *it->second.parentKey;
        }
    }

    void shrinkExpectedForLane(WaveId waveId,
                               WaveContext<ValueType, StepType> &waveCtx,
                               LaneId lane) {
        std::uint64_t laneBit = 1ull << lane;
        // Clear from dynamic blocks.
        for (auto &entry : waveCtx.blocks) {
            entry.second.expectedMask &= ~laneBit;
            entry.second.completedMask &= ~laneBit;
            entry.second.continuations.erase(lane);
            entry.second.pendingOps.erase(lane);
            for (auto it = entry.second.controlReadyMask.begin();
                 it != entry.second.controlReadyMask.end();) {
                it->second &= ~laneBit;
                if (it->second == 0) {
                    auto cur = it;
                    ++it;
                    entry.second.controlReadyMask.erase(cur);
                    continue;
                }
                ++it;
            }
            for (auto it = entry.second.controlExecutedMask.begin();
                 it != entry.second.controlExecutedMask.end();) {
                it->second &= ~laneBit;
                if (it->second == 0) {
                    auto cur = it;
                    ++it;
                    entry.second.controlExecutedMask.erase(cur);
                    continue;
                }
                ++it;
            }
            pruneControlEpochLane(waveCtx, entry.first, entry.second, lane);
        }
        for (auto &entry : waveCtx.mergeStack) {
            entry.expectedMask &= ~laneBit;
            entry.completedMask &= ~laneBit;
        }
        // Clear from collectives and release if now satisfied.
        for (auto it = waveCtx.collectives.begin();
             it != waveCtx.collectives.end();) {
            CollectiveKey key = it->first;
            it->second.expectedMask &= ~laneBit;
            it->second.arrivals.erase(lane);
            it->second.continuations.erase(lane);
            it->second.operands.erase(lane);
            it->second.results.erase(lane);
            it->second.memoryIndices.erase(lane);
            it->second.memoryValues.erase(lane);
            ensureExpectedCoversArrivals(it->second);
            const mlir::Operation *waveOp = nullptr;
            auto waveIt = waveCtx.collectiveTokenToOp.find(key);
            if (waveIt != waveCtx.collectiveTokenToOp.end())
                waveOp = waveIt->second;
            bool isWaveCollective =
                waveOp && isWaveOp(const_cast<mlir::Operation *>(waveOp));
            bool isMemoryCollective =
                waveOp && isMemoryOp(const_cast<mlir::Operation *>(waveOp));
            bool isControlFlow =
                waveCtx.controlTokenToOp.find(key) != waveCtx.controlTokenToOp.end();
            if (it->second.expectedMask == 0) {
                if (isControlFlow)
                    waveCtx.controlTokenToOp.erase(key);
                if (waveOp)
                    waveCtx.collectiveTokenToOp.erase(key);
                auto cur = it;
                ++it;
                waveCtx.collectives.erase(cur);
                continue;
            }
            bool ready =
                it->second.arrivals.size() ==
                static_cast<unsigned>(std::popcount(it->second.expectedMask));
            if (ready) {
                auto *blockCtx = getBlock(waveCtx, it->second.block);
                bool scheduleNow = true;
                bool emitCollective = false;
                bool memoryHasResults = false;
                if (isControlFlow) {
                    auto controlIt = waveCtx.controlTokenToOp.find(key);
                    if (controlIt != waveCtx.controlTokenToOp.end()) {
                        mlir::Operation *controlOp =
                            const_cast<mlir::Operation *>(controlIt->second);
                        if (traceSink_ && blockCtx) {
                            std::string opName =
                                controlOp->getName().getStringRef().str();
                            traceSink_->onCollectiveComplete(
                                waveId, opName, it->second.expectedMask,
                                it->second.expectedMask, it->second.block.sequenceId,
                                it->second.block.block, blockKindLabel(blockCtx->kind),
                                blockCtx->loopIteration);
                        }
                        std::uint64_t expectedMask = it->second.expectedMask;
                        DynamicBlockKey controlBlock = it->second.block;
                        waveCtx.controlTokenToOp.erase(controlIt);
                        waveCtx.collectives.erase(it++);
                        handleControlFlowCollective(waveId, controlBlock, controlOp,
                                                    expectedMask);
                        it = waveCtx.collectives.begin();
                        continue;
                    }
                } else if (isWaveCollective) {
                    if (it->second.results.empty()) {
                        it->second.expectedMask = arrivedMask(it->second.arrivals);
                        computeWaveCollectiveResults(waveOp, it->second);
                        emitCollective = true;
                    } else {
                        scheduleNow = false;
                    }
                } else if (isMemoryCollective) {
                    if (it->second.results.empty()) {
                        memoryHasResults =
                            computeMemoryCollectiveResults(waveOp, it->second);
                        emitCollective = true;
                    } else {
                        memoryHasResults = true;
                        scheduleNow = false;
                    }
                }
                if (emitCollective && traceSink_ && blockCtx) {
                    std::string opName;
                    if (waveOp)
                        opName = const_cast<mlir::Operation *>(waveOp)
                                     ->getName()
                                     .getStringRef()
                                     .str();
                    traceSink_->onCollectiveComplete(
                        waveId,
                        opName,
                        it->second.expectedMask, it->second.expectedMask,
                        it->second.block.sequenceId, it->second.block.block,
                        blockKindLabel(blockCtx->kind),
                        blockCtx->loopIteration);
                }
                if (blockCtx && scheduleNow) {
                    std::uint64_t mask = it->second.expectedMask;
                    while (mask) {
                        unsigned l = std::countr_zero(mask);
                        mask &= mask - 1;
                        auto contIt = it->second.continuations.find(l);
                        if (contIt != it->second.continuations.end()) {
                            blockCtx->activeMask |= (1ull << l);
                            pushReady(waveId, it->second.block, l,
                                      contIt->second);
                        }
                    }
                }
                bool keepCollective =
                    isWaveCollective || (isMemoryCollective && memoryHasResults);
                if (!keepCollective) {
                    if (isMemoryCollective)
                        waveCtx.collectiveTokenToOp.erase(it->first);
                    auto cur = it;
                    ++it;
                    waveCtx.collectives.erase(cur);
                    continue;
                }
            }
            ++it;
        }
        // Clear from sync points and release if now satisfied.
        for (auto it = waveCtx.syncPoints.begin();
             it != waveCtx.syncPoints.end();) {
            it->second.expectedMask &= ~laneBit;
            it->second.arrivals.erase(lane);
            it->second.continuations.erase(lane);
            if (it->second.expectedMask == 0) {
                waveCtx.syncTokenToOp.erase(it->first);
                auto cur = it;
                ++it;
                waveCtx.syncPoints.erase(cur);
                continue;
            }
            bool ready = it->second.expectedMask &&
                         it->second.arrivals.size() ==
                             static_cast<unsigned>(
                                 std::popcount(it->second.expectedMask));
            if (ready) {
                auto *blockCtx = getBlock(waveCtx, it->second.block);
                if (blockCtx) {
                    std::uint64_t mask = it->second.expectedMask;
                    while (mask) {
                        unsigned l = std::countr_zero(mask);
                        mask &= mask - 1;
                        auto contIt = it->second.continuations.find(l);
                        if (contIt != it->second.continuations.end()) {
                            blockCtx->activeMask |= (1ull << l);
                            pushReady(waveId, it->second.block, l,
                                      contIt->second);
                        }
                    }
                }
                auto cur = it;
                ++it;
                waveCtx.syncPoints.erase(cur);
                continue;
            }
            ++it;
        }
    }

    void shrinkExpectedForSubtree(
        WaveId waveId,
        WaveContext<ValueType, StepType> &waveCtx,
        const DynamicBlockKey &root,
        LaneId lane,
        std::optional<LoopFrameId> preserveLoopFrame = std::nullopt,
        std::optional<std::uint32_t> preserveSeqFloor = std::nullopt) {
        std::uint64_t laneBit = 1ull << lane;
        auto isPreservedFuturePath = [&](const DynamicBlockKey &candidate) {
            if (!preserveLoopFrame || !preserveSeqFloor)
                return false;
            DynamicBlockKey cur = candidate;
            while (true) {
                auto it = waveCtx.blocks.find(cur);
                if (it == waveCtx.blocks.end())
                    return false;
                const auto &ctx = it->second;
                if (ctx.ownerLoopFrameId &&
                    *ctx.ownerLoopFrameId == *preserveLoopFrame &&
                    ctx.sequenceId >= *preserveSeqFloor)
                    return true;
                if (cur == root || !ctx.parentKey)
                    return false;
                cur = *ctx.parentKey;
            }
        };
        auto inSubtree = [&](const DynamicBlockKey &key) {
            return isDynamicDescendant(waveCtx, key, root) &&
                   !isPreservedFuturePath(key);
        };

        for (auto &entry : waveCtx.blocks) {
            if (inSubtree(entry.first)) {
                entry.second.activeMask &= ~laneBit;
                entry.second.expectedMask &= ~laneBit;
                entry.second.completedMask &= ~laneBit;
                entry.second.continuations.erase(lane);
                entry.second.pendingOps.erase(lane);
                for (auto it = entry.second.controlReadyMask.begin();
                     it != entry.second.controlReadyMask.end();) {
                    it->second &= ~laneBit;
                    if (it->second == 0) {
                        auto cur = it;
                        ++it;
                        entry.second.controlReadyMask.erase(cur);
                        continue;
                    }
                    ++it;
                }
                for (auto it = entry.second.controlExecutedMask.begin();
                     it != entry.second.controlExecutedMask.end();) {
                    it->second &= ~laneBit;
                    if (it->second == 0) {
                        auto cur = it;
                        ++it;
                        entry.second.controlExecutedMask.erase(cur);
                        continue;
                    }
                    ++it;
                }
                pruneControlEpochLane(waveCtx, entry.first, entry.second, lane);
            }
        }
        for (auto &entry : waveCtx.mergeStack) {
            if (inSubtree(entry.parent)) {
                entry.expectedMask &= ~laneBit;
                entry.completedMask &= ~laneBit;
            }
        }

        for (auto it = waveCtx.collectives.begin();
             it != waveCtx.collectives.end();) {
            if (!inSubtree(it->second.block)) {
                ++it;
                continue;
            }
            it->second.expectedMask &= ~laneBit;
            it->second.arrivals.erase(lane);
            it->second.continuations.erase(lane);
            it->second.operands.erase(lane);
            it->second.results.erase(lane);
            it->second.memoryIndices.erase(lane);
            it->second.memoryValues.erase(lane);
            ensureExpectedCoversArrivals(it->second);

            CollectiveKey key = it->first;
            const mlir::Operation *waveOp = nullptr;
            auto waveIt = waveCtx.collectiveTokenToOp.find(key);
            if (waveIt != waveCtx.collectiveTokenToOp.end())
                waveOp = waveIt->second;
            bool isWaveCollective =
                waveOp && isWaveOp(const_cast<mlir::Operation *>(waveOp));
            bool isMemoryCollective =
                waveOp && isMemoryOp(const_cast<mlir::Operation *>(waveOp));
            bool isControlFlow =
                waveCtx.controlTokenToOp.find(key) != waveCtx.controlTokenToOp.end();

            if (it->second.expectedMask == 0) {
                if (isControlFlow)
                    waveCtx.controlTokenToOp.erase(key);
                if (waveOp)
                    waveCtx.collectiveTokenToOp.erase(key);
                auto cur = it;
                ++it;
                waveCtx.collectives.erase(cur);
                continue;
            }

            bool ready =
                it->second.arrivals.size() ==
                static_cast<unsigned>(std::popcount(it->second.expectedMask));
            if (ready) {
                auto *blockCtx = getBlock(waveCtx, it->second.block);
                bool scheduleNow = true;
                bool emitCollective = false;
                bool memoryHasResults = false;
                if (isControlFlow) {
                    auto controlIt = waveCtx.controlTokenToOp.find(key);
                    if (controlIt != waveCtx.controlTokenToOp.end()) {
                        mlir::Operation *controlOp =
                            const_cast<mlir::Operation *>(controlIt->second);
                        if (traceSink_ && blockCtx) {
                            std::string opName =
                                controlOp->getName().getStringRef().str();
                            traceSink_->onCollectiveComplete(
                                waveId, opName, it->second.expectedMask,
                                it->second.expectedMask, it->second.block.sequenceId,
                                it->second.block.block, blockKindLabel(blockCtx->kind),
                                blockCtx->loopIteration);
                        }
                        std::uint64_t expectedMask = it->second.expectedMask;
                        DynamicBlockKey controlBlock = it->second.block;
                        waveCtx.controlTokenToOp.erase(controlIt);
                        waveCtx.collectives.erase(it++);
                        handleControlFlowCollective(waveId, controlBlock, controlOp,
                                                    expectedMask);
                        it = waveCtx.collectives.begin();
                        continue;
                    }
                } else if (isWaveCollective) {
                    if (it->second.results.empty()) {
                        it->second.expectedMask = arrivedMask(it->second.arrivals);
                        computeWaveCollectiveResults(waveOp, it->second);
                        emitCollective = true;
                    } else {
                        scheduleNow = false;
                    }
                } else if (isMemoryCollective) {
                    if (it->second.results.empty()) {
                        memoryHasResults =
                            computeMemoryCollectiveResults(waveOp, it->second);
                        emitCollective = true;
                    } else {
                        memoryHasResults = true;
                        scheduleNow = false;
                    }
                }
                if (emitCollective && traceSink_ && blockCtx) {
                    std::string opName;
                    if (waveOp)
                        opName = const_cast<mlir::Operation *>(waveOp)
                                     ->getName()
                                     .getStringRef()
                                     .str();
                    traceSink_->onCollectiveComplete(
                        waveId, opName, it->second.expectedMask,
                        it->second.expectedMask, it->second.block.sequenceId,
                        it->second.block.block, blockKindLabel(blockCtx->kind),
                        blockCtx->loopIteration);
                }
                if (blockCtx && scheduleNow) {
                    std::uint64_t mask = it->second.expectedMask;
                    while (mask) {
                        unsigned l = std::countr_zero(mask);
                        mask &= mask - 1;
                        auto contIt = it->second.continuations.find(l);
                        if (contIt != it->second.continuations.end()) {
                            blockCtx->activeMask |= (1ull << l);
                            pushReady(waveId, it->second.block, l,
                                      contIt->second);
                        }
                    }
                }
                bool keepCollective =
                    isWaveCollective || (isMemoryCollective && memoryHasResults);
                if (!keepCollective) {
                    if (isMemoryCollective)
                        waveCtx.collectiveTokenToOp.erase(key);
                    auto cur = it;
                    ++it;
                    waveCtx.collectives.erase(cur);
                    continue;
                }
            }
            ++it;
        }

        for (auto it = waveCtx.syncPoints.begin();
             it != waveCtx.syncPoints.end();) {
            if (!inSubtree(it->second.block)) {
                ++it;
                continue;
            }
            it->second.expectedMask &= ~laneBit;
            it->second.arrivals.erase(lane);
            it->second.continuations.erase(lane);
            if (it->second.expectedMask == 0) {
                waveCtx.syncTokenToOp.erase(it->first);
                auto cur = it;
                ++it;
                waveCtx.syncPoints.erase(cur);
                continue;
            }
            bool ready =
                it->second.expectedMask &&
                it->second.arrivals.size() ==
                    static_cast<unsigned>(
                        std::popcount(it->second.expectedMask));
            if (ready) {
                auto *blockCtx = getBlock(waveCtx, it->second.block);
                if (blockCtx) {
                    std::uint64_t mask = it->second.expectedMask;
                    while (mask) {
                        unsigned l = std::countr_zero(mask);
                        mask &= mask - 1;
                        auto contIt = it->second.continuations.find(l);
                        if (contIt != it->second.continuations.end()) {
                            blockCtx->activeMask |= (1ull << l);
                            pushReady(waveId, it->second.block, l,
                                      contIt->second);
                        }
                    }
                }
                auto cur = it;
                ++it;
                waveCtx.syncPoints.erase(cur);
                continue;
            }
            ++it;
        }
    }

    bool isUnderLoopFrame(WaveContext<ValueType, StepType> &waveCtx,
                          DynamicBlockKey key,
                          LoopFrameId frameId) {
        while (true) {
            auto it = waveCtx.blocks.find(key);
            if (it == waveCtx.blocks.end())
                return false;
            if (it->second.ownerLoopFrameId &&
                *it->second.ownerLoopFrameId == frameId)
                return true;
            if (!it->second.parentKey)
                return false;
            key = *it->second.parentKey;
        }
    }

    std::optional<DynamicBlockKey>
    findOwningLoopBodyKey(WaveContext<ValueType, StepType> &waveCtx,
                          DynamicBlockKey key,
                          const mlir::Operation *loopOp) {
        while (true) {
            auto it = waveCtx.blocks.find(key);
            if (it == waveCtx.blocks.end())
                return std::nullopt;
            const auto &ctx = it->second;
            if (ctx.loopOp == loopOp &&
                ctx.kind == DynamicBlockKind::LoopBody)
                return key;
            if (!ctx.parentKey)
                return std::nullopt;
            key = *ctx.parentKey;
        }
    }

    void shrinkExpectedForLoopLane(WaveId waveId,
                                   WaveContext<ValueType, StepType> &waveCtx,
                                   LoopFrameId loopFrameId,
                                   LaneId lane) {
        std::uint64_t laneBit = 1ull << lane;
        for (auto &entry : waveCtx.mergeStack) {
            if (entry.loopFrame && entry.loopFrame->frameId == loopFrameId) {
                entry.expectedMask &= ~laneBit;
                entry.completedMask &= ~laneBit;
                entry.loopFrame->laneNextSeq.erase(lane);
                entry.loopFrame->carried.erase(lane);
                entry.loopFrame->exitContinuations.erase(lane);
                continue;
            }
            if (!entry.loopFrame &&
                isUnderLoopFrame(waveCtx, entry.parent, loopFrameId)) {
                entry.expectedMask &= ~laneBit;
                entry.completedMask &= ~laneBit;
            }
        }
        for (auto &entry : waveCtx.blocks) {
            if (isUnderLoopFrame(waveCtx, entry.first, loopFrameId)) {
                entry.second.expectedMask &= ~laneBit;
                entry.second.completedMask &= ~laneBit;
                entry.second.continuations.erase(lane);
                entry.second.pendingOps.erase(lane);
                for (auto it = entry.second.controlReadyMask.begin();
                     it != entry.second.controlReadyMask.end();) {
                    it->second &= ~laneBit;
                    if (it->second == 0) {
                        auto cur = it;
                        ++it;
                        entry.second.controlReadyMask.erase(cur);
                        continue;
                    }
                    ++it;
                }
                for (auto it = entry.second.controlExecutedMask.begin();
                     it != entry.second.controlExecutedMask.end();) {
                    it->second &= ~laneBit;
                    if (it->second == 0) {
                        auto cur = it;
                        ++it;
                        entry.second.controlExecutedMask.erase(cur);
                        continue;
                    }
                    ++it;
                }
                pruneControlEpochLane(waveCtx, entry.first, entry.second, lane);
            }
        }
        for (auto it = waveCtx.collectives.begin();
             it != waveCtx.collectives.end();) {
            if (!isUnderLoopFrame(waveCtx, it->second.block, loopFrameId)) {
                ++it;
                continue;
            }
            it->second.expectedMask &= ~laneBit;
            it->second.arrivals.erase(lane);
            it->second.continuations.erase(lane);
            it->second.operands.erase(lane);
            it->second.results.erase(lane);
            it->second.memoryIndices.erase(lane);
            it->second.memoryValues.erase(lane);
            ensureExpectedCoversArrivals(it->second);

            CollectiveKey key = it->first;
            const mlir::Operation *waveOp = nullptr;
            auto waveIt = waveCtx.collectiveTokenToOp.find(key);
            if (waveIt != waveCtx.collectiveTokenToOp.end())
                waveOp = waveIt->second;
            bool isWaveCollective =
                waveOp && isWaveOp(const_cast<mlir::Operation *>(waveOp));
            bool isMemoryCollective =
                waveOp && isMemoryOp(const_cast<mlir::Operation *>(waveOp));
            bool isControlFlow =
                waveCtx.controlTokenToOp.find(key) != waveCtx.controlTokenToOp.end();

            if (it->second.expectedMask == 0) {
                if (isControlFlow)
                    waveCtx.controlTokenToOp.erase(key);
                if (waveOp)
                    waveCtx.collectiveTokenToOp.erase(key);
                auto cur = it;
                ++it;
                waveCtx.collectives.erase(cur);
                continue;
            }

            bool ready =
                it->second.arrivals.size() ==
                static_cast<unsigned>(std::popcount(it->second.expectedMask));
            if (ready) {
                auto *blockCtx = getBlock(waveCtx, it->second.block);
                bool scheduleNow = true;
                bool emitCollective = false;
                bool memoryHasResults = false;
                if (isControlFlow) {
                    auto controlIt = waveCtx.controlTokenToOp.find(key);
                    if (controlIt != waveCtx.controlTokenToOp.end()) {
                        mlir::Operation *controlOp =
                            const_cast<mlir::Operation *>(controlIt->second);
                        if (traceSink_ && blockCtx) {
                            std::string opName =
                                controlOp->getName().getStringRef().str();
                            traceSink_->onCollectiveComplete(
                                waveId, opName, it->second.expectedMask,
                                it->second.expectedMask, it->second.block.sequenceId,
                                it->second.block.block, blockKindLabel(blockCtx->kind),
                                blockCtx->loopIteration);
                        }
                        std::uint64_t expectedMask = it->second.expectedMask;
                        DynamicBlockKey controlBlock = it->second.block;
                        waveCtx.controlTokenToOp.erase(controlIt);
                        waveCtx.collectives.erase(it++);
                        handleControlFlowCollective(waveId, controlBlock, controlOp,
                                                    expectedMask);
                        it = waveCtx.collectives.begin();
                        continue;
                    }
                } else if (isWaveCollective) {
                    if (it->second.results.empty()) {
                        it->second.expectedMask = arrivedMask(it->second.arrivals);
                        computeWaveCollectiveResults(waveOp, it->second);
                        emitCollective = true;
                    } else {
                        scheduleNow = false;
                    }
                } else if (isMemoryCollective) {
                    if (it->second.results.empty()) {
                        memoryHasResults =
                            computeMemoryCollectiveResults(waveOp, it->second);
                        emitCollective = true;
                    } else {
                        memoryHasResults = true;
                        scheduleNow = false;
                    }
                }
                if (emitCollective && traceSink_ && blockCtx) {
                    std::string opName;
                    if (waveOp)
                        opName = const_cast<mlir::Operation *>(waveOp)
                                     ->getName()
                                     .getStringRef()
                                     .str();
                    traceSink_->onCollectiveComplete(
                        waveId, opName, it->second.expectedMask,
                        it->second.expectedMask, it->second.block.sequenceId,
                        it->second.block.block, blockKindLabel(blockCtx->kind),
                        blockCtx->loopIteration);
                }
                if (blockCtx && scheduleNow) {
                    std::uint64_t mask = it->second.expectedMask;
                    while (mask) {
                        unsigned l = std::countr_zero(mask);
                        mask &= mask - 1;
                        auto contIt = it->second.continuations.find(l);
                        if (contIt != it->second.continuations.end()) {
                            blockCtx->activeMask |= (1ull << l);
                            pushReady(waveId, it->second.block, l,
                                      contIt->second);
                        }
                    }
                }
                bool keepCollective =
                    isWaveCollective || (isMemoryCollective && memoryHasResults);
                if (!keepCollective) {
                    if (isMemoryCollective)
                        waveCtx.collectiveTokenToOp.erase(key);
                    auto cur = it;
                    ++it;
                    waveCtx.collectives.erase(cur);
                    continue;
                }
            }
            ++it;
        }

        for (auto it = waveCtx.syncPoints.begin();
             it != waveCtx.syncPoints.end();) {
            if (!isUnderLoopFrame(waveCtx, it->second.block, loopFrameId)) {
                ++it;
                continue;
            }
            it->second.expectedMask &= ~laneBit;
            it->second.arrivals.erase(lane);
            it->second.continuations.erase(lane);
            if (it->second.expectedMask == 0) {
                waveCtx.syncTokenToOp.erase(it->first);
                auto cur = it;
                ++it;
                waveCtx.syncPoints.erase(cur);
                continue;
            }
            bool ready =
                it->second.expectedMask &&
                it->second.arrivals.size() ==
                    static_cast<unsigned>(
                        std::popcount(it->second.expectedMask));
            if (ready) {
                auto *blockCtx = getBlock(waveCtx, it->second.block);
                if (blockCtx) {
                    std::uint64_t mask = it->second.expectedMask;
                    while (mask) {
                        unsigned l = std::countr_zero(mask);
                        mask &= mask - 1;
                        auto contIt = it->second.continuations.find(l);
                        if (contIt != it->second.continuations.end()) {
                            blockCtx->activeMask |= (1ull << l);
                            pushReady(waveId, it->second.block, l,
                                      contIt->second);
                        }
                    }
                }
                auto cur = it;
                ++it;
                waveCtx.syncPoints.erase(cur);
                continue;
            }
            ++it;
        }
    }
    void markMergeCompletion(WaveId,
                             WaveContext<ValueType, StepType> &waveCtx,
                             const DynamicBlockKey &childKey,
                             LaneId lane) {
        if (waveCtx.mergeStack.empty())
            return;
        std::uint64_t laneBit = 1ull << lane;
        for (auto it = waveCtx.mergeStack.rbegin();
             it != waveCtx.mergeStack.rend(); ++it) {
            bool matchesChild = llvm::any_of(it->pendingChildren,
                                             [&](const DynamicBlockKey &k) {
                                                 return k == childKey;
                                             });
            if (!matchesChild)
                continue;
            if ((it->expectedMask & laneBit) == 0) {
                // Stale child completion for this merge entry: this lane is no
                // longer expected at this join, so it must not resume the
                // parent continuation here.
                it->completedMask &= ~laneBit;
                if (EnableCPSDebugLogs) {
                    cpsDebugStream() << "[CPS] skip reconverge lane=" << lane
                                     << " child=" << childKey.block
                                     << " seq=" << childKey.sequenceId
                                     << " (lane not in expected mask)\n";
                }
                break;
            }
            it->completedMask |= laneBit;
            if (it->completedMask == it->expectedMask) {
                auto base = it.base();
                auto eraseIt = --base;
                if (eraseIt->loopFrame)
                    clearLoopFrameBinding(waveCtx, *eraseIt);
                waveCtx.mergeStack.erase(eraseIt);
            }
            break;
        }
    }

    void handleReconvergence(WaveId waveId,
                             WaveContext<ValueType, StepType> &waveCtx,
                             const DynamicBlockKey &childKey,
                             LaneId lane) {
        if (waveCtx.mergeStack.empty())
            return;
        std::uint64_t laneBit = 1ull << lane;
        for (auto it = waveCtx.mergeStack.rbegin();
             it != waveCtx.mergeStack.rend(); ++it) {
            bool matchesChild = llvm::any_of(it->pendingChildren,
                                             [&](const DynamicBlockKey &k) {
                                                 return k == childKey;
                                             });
            if (!matchesChild)
                continue;

            if (EnableCPSDebugLogs) {
                auto fmt = [&](std::uint64_t m) { return formatMaskBits(m, 32); };
                cpsDebugStream() << "[CPS] handleReconvergence lane=" << lane
                             << " child=" << childKey.block
                             << " seq=" << childKey.sequenceId
                             << " parent=" << it->parent.block
                             << " parentSeq=" << it->parent.sequenceId
                             << " expected=0b" << fmt(it->expectedMask)
                             << " completed(before)=0b" << fmt(it->completedMask)
                             << "\n";
            }

            if (it->expectedMask & laneBit)
                it->completedMask |= laneBit;
            else
                it->completedMask &= ~laneBit;

            DynamicBlockKey parentKey = it->parent;
            auto parentBlockIt = waveCtx.blocks.find(parentKey);
            if (parentBlockIt != waveCtx.blocks.end()) {
                auto &parentBlock = parentBlockIt->second;
                parentBlock.activeMask |= (1ull << lane);
                // Resume parent continuation for this lane immediately.
                auto contIt = parentBlock.continuations.find(lane);
                if (contIt != parentBlock.continuations.end()) {
                    if (EnableCPSDebugLogs) {
                        cpsDebugStream() << "[CPS] enqueue from reconverge lane=" << lane
                                     << " parent=" << parentKey.block
                                     << " seq=" << parentKey.sequenceId << "\n";
                    }
                    pushReady(waveId, parentKey, lane, std::move(contIt->second));
                    dumpReadyQueue();
                    parentBlock.continuations.erase(contIt);
                } else if (EnableCPSDebugLogs) {
                    cpsDebugStream() << "[CPS] no parent continuation for lane=" << lane
                                 << " parent=" << parentKey.block
                                 << " seq=" << parentKey.sequenceId << "\n";
                }
            }
            // Pop the merge entry only when all expected lanes are done.
            bool shouldPop = !it->loopFrame &&
                             (it->expectedMask != 0
                                  ? (it->completedMask == it->expectedMask)
                                  : it->pendingChildren.empty());
            if (shouldPop) {
                if (EnableCPSDebugLogs) {
                    auto fmt = [&](std::uint64_t m) { return formatMaskBits(m, 32); };
                    cpsDebugStream() << "[CPS] pop merge parent=" << parentKey.block
                                 << " seq=" << parentKey.sequenceId
                                 << " expected=0b" << fmt(it->expectedMask)
                                 << " completed=0b" << fmt(it->completedMask)
                                 << "\n";
                    cpsDebugStream() << "[CPS] resume parent continuations parent="
                                 << parentKey.block << " seq=" << parentKey.sequenceId
                                 << " mask=0b" << fmt(it->expectedMask) << " lanes:";
                    std::uint64_t dbgMask = it->expectedMask;
                    while (dbgMask) {
                        unsigned l = std::countr_zero(dbgMask);
                        dbgMask &= dbgMask - 1;
                        cpsDebugStream() << " " << l;
                    }
                    cpsDebugStream() << "\n";
                }
                auto base = it.base();
                waveCtx.mergeStack.erase(--base);
            }
            dumpReadyQueue();
            break;
        }
    }

    SimtStepSemanticsAdaptor<SemanticsT> adaptor_;
    SemanticsT semantics_;
    TraceSink *traceSink_ = nullptr;
    StateType state_;
    ScheduleMode scheduleMode_ = ScheduleMode::Deterministic;
    std::mt19937_64 rng_{0};
};

} // namespace simt::semantics
