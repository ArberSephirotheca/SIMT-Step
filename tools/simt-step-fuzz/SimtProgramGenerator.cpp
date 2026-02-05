#include "SimtProgramGenerator.h"

#include <mlir/Dialect/Arith/IR/Arith.h>
#include <mlir/Dialect/Func/IR/FuncOps.h>
#include <mlir/IR/BuiltinTypes.h>
#include <mlir/IR/ImplicitLocOpBuilder.h>

#include <algorithm>
#include <cstdint>
#include <random>
#include <vector>

#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"

using namespace mlir;

namespace simt::fuzz {

namespace {
struct RNG {
    std::mt19937_64 eng;
    explicit RNG(std::uint64_t seed) : eng(seed) {}
    int pick(int lo, int hi) {
        std::uniform_int_distribution<int> dist(lo, hi);
        return dist(eng);
    }
    bool coin() { return pick(0, 1) == 1; }
    bool chance(double p) {
        if (p <= 0.0)
            return false;
        if (p >= 1.0)
            return true;
        std::uniform_real_distribution<double> dist(0.0, 1.0);
        return dist(eng) < p;
    }
};

struct BuildState {
    GeneratorConfig cfg;
    RNG &rng;
    int waveId = 0;
    unsigned controlOps = 0;
    bool usePredicateBuffer = false;
    Value predBuffer;
    int predNextIndex = 0;
    std::vector<int64_t> *predValues = nullptr;
    Value tid;
    Value outWave;
    unsigned switchDepth = 0;
};

static Value makeI32(OpBuilder &b, Location loc, int v) {
    return b.create<arith::ConstantIntOp>(loc, v, 32);
}

static Value makeBool(OpBuilder &b, Location loc, bool v) {
    return b.create<arith::ConstantIntOp>(loc, v ? 1 : 0, 1);
}

static Value makeLaneIdI32(OpBuilder &b, Location loc) {
    Value lane = b.create<simt::dialect::LaneIdOp>(loc, b.getIndexType());
    return b.create<arith::IndexCastOp>(loc, b.getI32Type(), lane);
}

static Value makeSubgroupIdI32(OpBuilder &b, Location loc) {
    Value subgroup = b.create<simt::dialect::SubgroupIdOp>(loc, b.getIndexType());
    return b.create<arith::IndexCastOp>(loc, b.getI32Type(), subgroup);
}

static int allocPredicateSlots(BuildState &st, int count) {
    int base = st.predNextIndex;
    st.predNextIndex += count;
    if (st.predValues)
        st.predValues->resize(st.predNextIndex, 0);
    return base;
}

static Value loadPredicateI32(OpBuilder &b, Location loc, BuildState &st,
                              int base, Value offset) {
    Value idx = makeI32(b, loc, base);
    if (offset)
        idx = b.create<arith::AddIOp>(loc, idx, offset);
    return b.create<simt::dialect::BufferLoadOp>(loc, st.predBuffer, idx);
}

static Value loadPredicateBool(OpBuilder &b, Location loc, BuildState &st,
                               int base, Value offset) {
    Value raw = loadPredicateI32(b, loc, st, base, offset);
    Value zero = makeI32(b, loc, 0);
    return b.create<arith::CmpIOp>(loc, arith::CmpIPredicate::ne, raw, zero);
}

static Value scaleIndexByLanes(OpBuilder &b, Location loc, Value idx, int lanes) {
    if (lanes <= 1)
        return idx;
    Value lanesVal = makeI32(b, loc, lanes);
    return b.create<arith::MulIOp>(loc, idx, lanesVal);
}

static func::FuncOp buildScalarHelper(OpBuilder &b, Location loc,
                                      llvm::StringRef name, RNG *rng,
                                      const GeneratorConfig &cfg, int *waveId,
                                      unsigned predicateArgs = 0) {
    auto i32 = b.getI32Type();
    auto resTy = simt::dialect::ResourceType::get(
        b.getContext(), simt::dialect::MemorySpace::Global, i32);
    llvm::SmallVector<Type, 4> inputs;
    inputs.push_back(i32);
    inputs.push_back(resTy);
    for (unsigned i = 0; i < predicateArgs; ++i)
        inputs.push_back(i32);
    auto funcType = b.getFunctionType(inputs, {});
    auto func = b.create<func::FuncOp>(loc, name, funcType);
    auto *entry = func.addEntryBlock();
    OpBuilder fb(entry, entry->begin());
    Value tid = entry->getArgument(0);
    Value outWave = entry->getArgument(1);

    Value count = fb.create<simt::dialect::WaveCountBitsOp>(
        loc, i32, makeBool(fb, loc, true));

    int lanes = std::max<int>(1, static_cast<int>(cfg.numThreads[0]));
    int stride = std::max<int>(1, static_cast<int>(cfg.maxTripCount) * lanes);
    int base = (waveId ? (*waveId) : 0) * stride;
    if (waveId)
        (*waveId)++;
    Value idx = fb.create<arith::AddIOp>(loc, makeI32(fb, loc, base), tid);
    fb.create<simt::dialect::BufferStoreOp>(loc, outWave, idx, count);

    (void)rng;
    fb.create<func::ReturnOp>(loc);
    return func;
}

static Value makeNonUniformCond(OpBuilder &b, Location loc, RNG &rng,
                                const GeneratorConfig &cfg, Value tid);

static Value makeNonUniformBound(OpBuilder &b, Location loc, RNG &rng,
                                 const GeneratorConfig &cfg, Value tid,
                                 int fallback);

struct HelperBuildState {
    const GeneratorConfig &cfg;
    RNG &rng;
    Value tid;
    unsigned controlOps = 0;
    unsigned waveOps = 0;
    bool usesSubgroupIds = false;
    llvm::SmallVector<Value, 4> predicateArgs;
    Value outWave;
    int *waveId = nullptr;
    llvm::SmallVector<Value, 4> loopIters;
    unsigned switchDepth = 0;
};

static Value buildHelperValue(OpBuilder &b, Location loc, HelperBuildState &st);

static Value emitHelperWaveCount(OpBuilder &b, Location loc, HelperBuildState &st) {
    if (st.cfg.noSubgroupOpsInSwitch && st.switchDepth > 0)
        return buildHelperValue(b, loc, st);
    st.waveOps++;
    Value count = b.create<simt::dialect::WaveCountBitsOp>(loc, b.getI32Type(),
                                                           makeBool(b, loc, true));
    int lanes = std::max<int>(1, static_cast<int>(st.cfg.numThreads[0]));
    int stride = std::max<int>(1, static_cast<int>(st.cfg.maxTripCount) * lanes);
    int waveBase = (st.waveId ? (*st.waveId) : 0) * stride;
    Value idx = makeI32(b, loc, waveBase);
    if (!st.loopIters.empty()) {
        Value lanesVal = makeI32(b, loc, lanes);
        Value iterScaled =
            b.create<arith::MulIOp>(loc, st.loopIters.back(), lanesVal);
        idx = b.create<arith::AddIOp>(loc, idx, iterScaled);
    }
    idx = b.create<arith::AddIOp>(loc, idx, st.tid);
    b.create<simt::dialect::BufferStoreOp>(loc, st.outWave, idx, count);
    if (st.waveId)
        (*st.waveId)++;
    return count;
}

static Value buildHelperValue(OpBuilder &b, Location loc, HelperBuildState &st) {
    bool allowSubgroupIds = st.usesSubgroupIds;
    if (st.cfg.noSubgroupOpsInSwitch && st.switchDepth > 0)
        allowSubgroupIds = false;
    int choiceMax = allowSubgroupIds ? 4 : 2;
    int choice = st.rng.pick(0, choiceMax);
    if (choice == 0)
        return makeI32(b, loc, st.rng.pick(0, 4));
    if (choice == 1)
        return st.tid;
    if (choice == 2) {
        Value c = makeI32(b, loc, st.rng.pick(0, 4));
        return b.create<arith::AddIOp>(loc, st.tid, c);
    }
    if (choice == 3)
        return makeLaneIdI32(b, loc);
    if (choice == 4)
        return makeSubgroupIdI32(b, loc);
    return st.tid;
}

static Value buildHelperPattern(OpBuilder &b, Location loc, HelperBuildState &st,
                               unsigned depth, unsigned maxDepth);

static Value buildHelperSwitch(OpBuilder &b, Location loc, HelperBuildState &st,
                               unsigned depth, unsigned maxDepth) {
    st.controlOps++;
    int numCases = st.rng.pick(2, 4);
    bool includeDefault = st.rng.coin();
    bool allowFallthrough = st.rng.coin();
    int defaultIndex = st.rng.pick(0, numCases - 1);

    llvm::SmallVector<bool, 4> fallthroughCase;
    fallthroughCase.reserve(numCases);
    for (int i = 0; i < numCases; ++i) {
        bool fall = allowFallthrough && (i + 1) < numCases && st.rng.coin();
        fallthroughCase.push_back(fall);
    }

    int selectorMod = includeDefault ? numCases : (numCases - 1);
    Value selector =
        st.predicateArgs.size() > 1 ? st.predicateArgs[1]
        : !st.predicateArgs.empty() ? st.predicateArgs[0]
                                    : st.tid;
    if (selectorMod > 1) {
        Value mod = makeI32(b, loc, selectorMod);
        selector = b.create<arith::RemSIOp>(loc, selector, mod);
    }

    Value initVal = buildHelperValue(b, loc, st);

    llvm::SmallVector<int64_t, 4> caseValues;
    caseValues.reserve(numCases - 1);
    int nextCaseValue = 0;
    for (int i = 0; i < numCases; ++i) {
        if (i == defaultIndex)
            continue;
        caseValues.push_back(nextCaseValue++);
    }

    auto switchOp = b.create<simt::dialect::SwitchOp>(
        loc, TypeRange{b.getI32Type()}, selector, ValueRange{initVal}, caseValues,
        defaultIndex);

    auto &region = switchOp.getCaseBody();
    while (static_cast<int>(region.getBlocks().size()) < numCases) {
        auto *blk = new Block();
        blk->addArguments({b.getI32Type()}, SmallVector<Location>{loc});
        region.push_back(blk);
    }

    int caseIdx = 0;
    for (auto &blk : region) {
        if (caseIdx >= numCases)
            break;
        if (blk.getNumArguments() == 0) {
            blk.addArguments({b.getI32Type()}, SmallVector<Location>{loc});
        }
        OpBuilder cb(&blk, blk.begin());
        st.switchDepth++;
        Value bodyVal = buildHelperPattern(cb, loc, st, depth + 1, maxDepth);
        st.switchDepth--;
        auto yield = cb.create<simt::dialect::YieldOp>(loc, ValueRange{bodyVal});
        yield->setAttr("fallthrough", b.getBoolAttr(fallthroughCase[caseIdx]));
        ++caseIdx;
    }
    if (st.cfg.postSwitchWaveOpRate > 0.0 &&
        st.rng.chance(st.cfg.postSwitchWaveOpRate)) {
        emitHelperWaveCount(b, loc, st);
    }
    return switchOp.getResult(0);
}

static Value buildHelperIf(OpBuilder &b, Location loc, HelperBuildState &st,
                           unsigned depth, unsigned maxDepth) {
    st.controlOps++;
    Value cond;
    if (!st.predicateArgs.empty()) {
        Value pred = st.predicateArgs[0];
        Value zero = makeI32(b, loc, 0);
        cond = b.create<arith::CmpIOp>(loc, arith::CmpIPredicate::ne, pred, zero);
    } else {
        cond = makeNonUniformCond(b, loc, st.rng, st.cfg, st.tid);
    }
    auto ifOp = b.create<simt::dialect::IfOp>(loc, TypeRange{b.getI32Type()}, cond,
                                             /*withElseRegion=*/true);
    if (ifOp.getThenRegion().empty())
        ifOp.getThenRegion().push_back(new Block());
    if (ifOp.getElseRegion().empty())
        ifOp.getElseRegion().push_back(new Block());

    {
        auto &thenBlock = ifOp.getThenRegion().front();
        OpBuilder tb(&thenBlock, thenBlock.begin());
        Value v = buildHelperPattern(tb, loc, st, depth + 1, maxDepth);
        tb.create<simt::dialect::YieldOp>(loc, ValueRange{v});
    }
    {
        auto &elseBlock = ifOp.getElseRegion().front();
        OpBuilder eb(&elseBlock, elseBlock.begin());
        Value v = buildHelperPattern(eb, loc, st, depth + 1, maxDepth);
        eb.create<simt::dialect::YieldOp>(loc, ValueRange{v});
    }
    return ifOp.getResult(0);
}

static Value buildHelperLoop(OpBuilder &b, Location loc, HelperBuildState &st,
                             unsigned depth, unsigned maxDepth) {
    st.controlOps++;
    int trip = std::max(1, st.rng.pick(1, static_cast<int>(st.cfg.maxTripCount)));

    Value zero = makeI32(b, loc, 0);
    Value initI = makeI32(b, loc, 0);
    auto loop = b.create<simt::dialect::LoopOp>(
        loc, TypeRange{b.getI32Type(), b.getI32Type()}, ValueRange{zero, initI});
    if (loop.getPrepareRegion().empty()) {
        auto *prep = new Block();
        prep->addArguments({b.getI32Type(), b.getI32Type()},
                           SmallVector<Location>{loc, loc});
        loop.getPrepareRegion().push_back(prep);
    }
    if (loop.getBodyRegion().empty()) {
        auto *body = new Block();
        body->addArguments({b.getI32Type(), b.getI32Type()},
                           SmallVector<Location>{loc, loc});
        loop.getBodyRegion().push_back(body);
    }
    {
        auto &prep = loop.getPrepareRegion().front();
        OpBuilder pb(&prep, prep.begin());
        Value acc = prep.getArgument(0);
        Value idx = prep.getArgument(1);
        (void)acc;
        Value bound;
        if (!st.predicateArgs.empty()) {
            Value pred =
                st.predicateArgs.size() > 1 ? st.predicateArgs[1] : st.predicateArgs[0];
            int maxTrip =
                std::max<int>(1, static_cast<int>(st.cfg.maxTripCount));
            Value mod = makeI32(pb, loc, maxTrip);
            Value rem = pb.create<arith::RemSIOp>(loc, pred, mod);
            Value one = makeI32(pb, loc, 1);
            bound = pb.create<arith::AddIOp>(loc, rem, one);
        } else {
            bound = makeNonUniformBound(pb, loc, st.rng, st.cfg, st.tid, trip);
        }
        Value cond =
            pb.create<arith::CmpIOp>(loc, arith::CmpIPredicate::slt, idx, bound);
        pb.create<simt::dialect::ConditionOp>(loc, cond, ValueRange{acc, idx});
    }
    {
        auto &body = loop.getBodyRegion().front();
        OpBuilder bb(&body, body.begin());
        Value idx = body.getArgument(1);

        st.loopIters.push_back(idx);
        Value nextAcc = buildHelperPattern(bb, loc, st, depth + 1, maxDepth);
        st.loopIters.pop_back();
        Value one = makeI32(bb, loc, 1);
        Value nextIdx = bb.create<arith::AddIOp>(loc, idx, one);

        bool emitCtrl = false;
        if (st.cfg.breakContinueRate < 0.0) {
            emitCtrl = st.rng.coin();
        } else {
            emitCtrl = st.rng.chance(st.cfg.breakContinueRate);
        }
        bool doBreak = st.rng.coin();
        if (emitCtrl && doBreak) {
            bb.create<simt::dialect::BreakOp>(loc, ValueRange{nextAcc, nextIdx});
        } else if (emitCtrl) {
            bb.create<simt::dialect::ContinueOp>(loc,
                                                 ValueRange{nextAcc, nextIdx});
        } else {
            bb.create<simt::dialect::YieldOp>(loc, ValueRange{nextAcc, nextIdx});
        }
    }
    return loop.getResult(0);
}

static Value buildHelperPattern(OpBuilder &b, Location loc, HelperBuildState &st,
                               unsigned depth, unsigned maxDepth) {
    if (depth >= maxDepth)
        return emitHelperWaveCount(b, loc, st);
    int choice = st.rng.pick(0, 3); // 0 leaf, 1 if, 2 loop, 3 switch
    if (choice == 0)
        return emitHelperWaveCount(b, loc, st);
    if (choice == 1)
        return buildHelperIf(b, loc, st, depth, maxDepth);
    if (choice == 2)
        return buildHelperLoop(b, loc, st, depth, maxDepth);
    return buildHelperSwitch(b, loc, st, depth, maxDepth);
}

static Value buildHelperControlPattern(OpBuilder &b, Location loc,
                                      HelperBuildState &st, unsigned depth,
                                      unsigned maxDepth) {
    int choice = st.rng.pick(1, 3); // 1 if, 2 loop, 3 switch
    if (choice == 1)
        return buildHelperIf(b, loc, st, depth, maxDepth);
    if (choice == 2)
        return buildHelperLoop(b, loc, st, depth, maxDepth);
    return buildHelperSwitch(b, loc, st, depth, maxDepth);
}

static func::FuncOp buildComplexHelper(OpBuilder &b, Location loc,
                                      llvm::StringRef name, RNG &rng,
                                      const GeneratorConfig &cfg,
                                      int *waveId,
                                      unsigned predicateArgs = 0) {
    auto i32 = b.getI32Type();
    auto resTy = simt::dialect::ResourceType::get(
        b.getContext(), simt::dialect::MemorySpace::Global, i32);
    llvm::SmallVector<Type, 4> inputs;
    inputs.push_back(i32);
    inputs.push_back(resTy);
    for (unsigned i = 0; i < predicateArgs; ++i)
        inputs.push_back(i32);
    auto funcType = b.getFunctionType(inputs, {});
    auto func = b.create<func::FuncOp>(loc, name, funcType);
    auto *entry = func.addEntryBlock();
    OpBuilder fb(entry, entry->begin());
    Value tid = entry->getArgument(0);
    Value outWave = entry->getArgument(1);

    HelperBuildState st{cfg, rng, tid, /*controlOps=*/0, /*waveOps=*/0,
                        cfg.helperUsesSubgroupIds};
    st.outWave = outWave;
    st.waveId = waveId;
    for (unsigned i = 0; i < predicateArgs; ++i)
        st.predicateArgs.push_back(entry->getArgument(2 + i));
    unsigned maxDepth = std::max<unsigned>(1, cfg.helperMaxDepth);

    Value acc = buildHelperPattern(fb, loc, st, /*depth=*/0, maxDepth);
    while (st.controlOps < cfg.helperMinControlOps) {
        Value v = buildHelperControlPattern(fb, loc, st, /*depth=*/0, maxDepth);
        Value cond;
        if (!st.predicateArgs.empty()) {
            Value pred = st.predicateArgs[0];
            Value zero = makeI32(fb, loc, 0);
            cond = fb.create<arith::CmpIOp>(loc, arith::CmpIPredicate::ne, pred,
                                            zero);
        } else {
            Value two = makeI32(fb, loc, 2);
            Value rem = fb.create<arith::RemSIOp>(loc, tid, two);
            Value zero = makeI32(fb, loc, 0);
            cond = fb.create<arith::CmpIOp>(loc, arith::CmpIPredicate::eq, rem,
                                            zero);
        }
        acc = fb.create<arith::SelectOp>(loc, cond, acc, v);
    }
    if (st.waveOps == 0) {
        (void)emitHelperWaveCount(fb, loc, st);
    }
    (void)acc;
    fb.create<func::ReturnOp>(loc);
    return func;
}

static Value makeNonUniformCond(OpBuilder &b, Location loc, RNG &rng,
                                const GeneratorConfig &cfg, Value tid) {
    int lanes = static_cast<int>(cfg.numThreads[0]);
    if (lanes < 2)
        return makeBool(b, loc, true);
    if (rng.coin()) {
        Value two = makeI32(b, loc, 2);
        Value rem = b.create<arith::RemSIOp>(loc, tid, two);
        Value zero = makeI32(b, loc, 0);
        return b.create<arith::CmpIOp>(loc, arith::CmpIPredicate::eq, rem, zero);
    }
    int k = rng.pick(1, lanes - 1);
    Value ck = makeI32(b, loc, k);
    return b.create<arith::CmpIOp>(loc, arith::CmpIPredicate::slt, tid, ck);
}

static Value buildNonUniformCond(OpBuilder &b, Location loc, BuildState &st) {
    if (!st.usePredicateBuffer)
        return makeNonUniformCond(b, loc, st.rng, st.cfg, st.tid);

    int lanes = std::max(1, static_cast<int>(st.cfg.numThreads[0]));
    int base = allocPredicateSlots(st, lanes);
    if (lanes < 2) {
        for (int lane = 0; lane < lanes; ++lane) {
            if (st.predValues)
                (*st.predValues)[base + lane] = 1;
        }
    } else if (st.rng.coin()) {
        for (int lane = 0; lane < lanes; ++lane) {
            if (st.predValues)
                (*st.predValues)[base + lane] = ((lane % 2) == 0) ? 1 : 0;
        }
    } else {
        int k = st.rng.pick(1, lanes - 1);
        for (int lane = 0; lane < lanes; ++lane) {
            if (st.predValues)
                (*st.predValues)[base + lane] = (lane < k) ? 1 : 0;
        }
    }
    return loadPredicateBool(b, loc, st, base, st.tid);
}

static Value makeNonUniformBound(OpBuilder &b, Location loc, RNG &rng,
                                 const GeneratorConfig &cfg, Value tid,
                                 int fallback) {
    int lanes = static_cast<int>(cfg.numThreads[0]);
    int maxTrip = static_cast<int>(cfg.maxTripCount);
    if (lanes < 2 || maxTrip < 2)
        return makeI32(b, loc, fallback);
    int k = rng.pick(2, maxTrip);
    Value ck = makeI32(b, loc, k);
    Value rem = b.create<arith::RemSIOp>(loc, tid, ck);
    Value one = makeI32(b, loc, 1);
    return b.create<arith::AddIOp>(loc, rem, one);
}

static void emitWaveCount(OpBuilder &b, Location loc, BuildState &st,
                          Value predicate, Value iteration = nullptr) {
    if (st.cfg.noSubgroupOpsInSwitch && st.switchDepth > 0)
        return;
    (void)predicate; // ignore caller-provided predicate; always count active lanes.
    int lanes = static_cast<int>(st.cfg.numThreads[0]);
    int stride = std::max<int>(1, st.cfg.maxTripCount * lanes);
    int waveBase = st.waveId * stride;
    Value idx = makeI32(b, loc, waveBase);
    if (iteration) {
        Value lanesVal = makeI32(b, loc, lanes);
        Value iterScaled = b.create<arith::MulIOp>(loc, iteration, lanesVal);
        idx = b.create<arith::AddIOp>(loc, idx, iterScaled);
    }
    idx = b.create<arith::AddIOp>(loc, idx, st.tid);
    Value count = b.create<simt::dialect::WaveCountBitsOp>(
        loc, b.getI32Type(), makeBool(b, loc, true));
    b.create<simt::dialect::BufferStoreOp>(loc, st.outWave, idx, count);
    st.waveId++;
}

static Value buildValue(OpBuilder &b, Location loc, BuildState &st) {
    int maxChoice = 4;
    if (st.cfg.noSubgroupOpsInSwitch && st.switchDepth > 0)
        maxChoice = 2;
    int choice = st.rng.pick(0, maxChoice); // 0 const, 1 tid, 2 tid + const, 3 lane, 4 subgroup
    if (choice == 0)
        return makeI32(b, loc, st.rng.pick(0, 4));
    if (choice == 1)
        return st.tid;
    if (choice == 2) {
        Value c = makeI32(b, loc, st.rng.pick(0, 4));
        return b.create<arith::AddIOp>(loc, st.tid, c);
    }
    if (choice == 3)
        return makeLaneIdI32(b, loc);
    if (choice == 4)
        return makeSubgroupIdI32(b, loc);
    // Fallback
    return st.tid;
}

static Value buildPattern(OpBuilder &b, Location loc, BuildState &st,
                          unsigned depth, unsigned maxDepth);

static Value buildSwitch(OpBuilder &b, Location loc, BuildState &st,
                         unsigned depth, unsigned maxDepth) {
    st.controlOps++;
    int numCases = st.rng.pick(2, 4);
    bool includeDefault = st.rng.coin();
    bool allowFallthrough = st.rng.coin();
    int defaultIndex = st.rng.pick(0, numCases - 1);
    llvm::SmallVector<bool, 4> emitWaveInCase;
    emitWaveInCase.assign(numCases, false);
    if (!st.cfg.noSubgroupOpsInSwitch) {
        bool anyWave = false;
        bool allWave = true;
        for (int i = 0; i < numCases; ++i) {
            bool pick = st.rng.coin();
            emitWaveInCase[i] = pick;
            anyWave |= pick;
            allWave &= pick;
        }
        if (!anyWave)
            emitWaveInCase[st.rng.pick(0, numCases - 1)] = true;
        if (allWave)
            emitWaveInCase[st.rng.pick(0, numCases - 1)] = false;
    }

    llvm::SmallVector<bool, 4> fallthroughCase;
    fallthroughCase.reserve(numCases);
    for (int i = 0; i < numCases; ++i) {
        bool fall = allowFallthrough && (i + 1) < numCases && st.rng.coin();
        fallthroughCase.push_back(fall);
    }

    int selectorMod = includeDefault ? numCases : (numCases - 1);
    Value selector;
    if (st.usePredicateBuffer) {
        int lanes = std::max(1, static_cast<int>(st.cfg.numThreads[0]));
        int base = allocPredicateSlots(st, lanes);
        if (st.predValues) {
            for (int lane = 0; lane < lanes; ++lane) {
                int sel = lane;
                if (selectorMod > 1)
                    sel = lane % selectorMod;
                (*st.predValues)[base + lane] = sel;
            }
        }
        selector = loadPredicateI32(b, loc, st, base, st.tid);
    } else {
        selector = st.tid;
        if (selectorMod > 1) {
            Value mod = makeI32(b, loc, selectorMod);
            selector = b.create<arith::RemSIOp>(loc, selector, mod);
        }
    }

    Value initVal = buildValue(b, loc, st);

    llvm::SmallVector<int64_t, 4> caseValues;
    caseValues.reserve(numCases - 1);
    int nextCaseValue = 0;
    for (int i = 0; i < numCases; ++i) {
        if (i == defaultIndex)
            continue;
        caseValues.push_back(nextCaseValue++);
    }

    auto switchOp = b.create<simt::dialect::SwitchOp>(
        loc, TypeRange{b.getI32Type()}, selector, ValueRange{initVal}, caseValues,
        defaultIndex);

    auto &region = switchOp.getCaseBody();
    while (static_cast<int>(region.getBlocks().size()) < numCases) {
        auto *blk = new Block();
        blk->addArguments({b.getI32Type()}, SmallVector<Location>{loc});
        region.push_back(blk);
    }

    int caseIdx = 0;
    for (auto &blk : region) {
        if (caseIdx >= numCases)
            break;
        if (blk.getNumArguments() == 0) {
            blk.addArguments({b.getI32Type()}, SmallVector<Location>{loc});
        }
        OpBuilder cb(&blk, blk.begin());
        st.switchDepth++;
        Value bodyVal = buildPattern(cb, loc, st, depth + 1, maxDepth);
        if (emitWaveInCase[caseIdx])
            emitWaveCount(cb, loc, st, makeBool(cb, loc, true));
        st.switchDepth--;
        auto yield = cb.create<simt::dialect::YieldOp>(loc, ValueRange{bodyVal});
        yield->setAttr("fallthrough", b.getBoolAttr(fallthroughCase[caseIdx]));
        ++caseIdx;
    }
    if (st.cfg.postSwitchWaveOpRate > 0.0 &&
        st.rng.chance(st.cfg.postSwitchWaveOpRate)) {
        emitWaveCount(b, loc, st, makeBool(b, loc, true));
    }
    return switchOp.getResult(0);
}

static Value buildIf(OpBuilder &b, Location loc, BuildState &st, unsigned depth,
                     unsigned maxDepth) {
    st.controlOps++;
    Value cond = buildNonUniformCond(b, loc, st);
    auto ifOp = b.create<simt::dialect::IfOp>(loc, TypeRange{b.getI32Type()},
                                              cond, /*withElseRegion=*/true);
    if (ifOp.getThenRegion().empty())
        ifOp.getThenRegion().push_back(new Block());
    if (ifOp.getElseRegion().empty())
        ifOp.getElseRegion().push_back(new Block());
    {
        auto &blk = ifOp.getThenRegion().front();
        OpBuilder tb(&blk, blk.begin());
        Value v = buildPattern(tb, loc, st, depth + 1, maxDepth);
        tb.create<simt::dialect::YieldOp>(loc, ValueRange{v});
    }
    {
        auto &blk = ifOp.getElseRegion().front();
        OpBuilder eb(&blk, blk.begin());
        Value v = buildPattern(eb, loc, st, depth + 1, maxDepth);
        eb.create<simt::dialect::YieldOp>(loc, ValueRange{v});
    }
    emitWaveCount(b, loc, st, cond);
    return ifOp.getResult(0);
}

static Value buildLoop(OpBuilder &b, Location loc, BuildState &st, unsigned depth,
                       unsigned maxDepth) {
    st.controlOps++;
    int trip = std::max(1, st.rng.pick(1, static_cast<int>(st.cfg.maxTripCount)));
    int lanes = std::max(1, static_cast<int>(st.cfg.numThreads[0]));
    int predicateBase = -1;
    if (st.usePredicateBuffer) {
        int slotsPerLane = static_cast<int>(st.cfg.maxTripCount) + 1;
        predicateBase = allocPredicateSlots(st, lanes * slotsPerLane);
        int maxTrip = static_cast<int>(st.cfg.maxTripCount);
        bool useMod = lanes >= 2 && maxTrip >= 2;
        int k = useMod ? st.rng.pick(2, maxTrip) : 0;
        if (st.predValues) {
            for (int lane = 0; lane < lanes; ++lane) {
                int bound = useMod ? ((lane % k) + 1) : trip;
                for (int iter = 0; iter < slotsPerLane; ++iter) {
                    (*st.predValues)[predicateBase + iter * lanes + lane] =
                        (iter < bound) ? 1 : 0;
                }
            }
        }
    }
    Value acc0 = makeI32(b, loc, 0);
    Value idx0 = makeI32(b, loc, 0);
    auto loop = b.create<simt::dialect::LoopOp>(
        loc, TypeRange{b.getI32Type(), b.getI32Type()}, ValueRange{acc0, idx0});
    if (loop.getPrepareRegion().empty()) {
        auto *prep = new Block();
        prep->addArguments({b.getI32Type(), b.getI32Type()},
                           SmallVector<Location>{loc, loc});
        loop.getPrepareRegion().push_back(prep);
    }
    if (loop.getBodyRegion().empty()) {
        auto *body = new Block();
        body->addArguments({b.getI32Type(), b.getI32Type()},
                           SmallVector<Location>{loc, loc});
        loop.getBodyRegion().push_back(body);
    }
    {
        auto &prep = loop.getPrepareRegion().front();
        OpBuilder pb(&prep, prep.begin());
        Value acc = prep.getArgument(0);
        Value idx = prep.getArgument(1);
        Value cond;
        if (st.usePredicateBuffer) {
            Value scaled = scaleIndexByLanes(pb, loc, idx, lanes);
            Value offset = pb.create<arith::AddIOp>(loc, scaled, st.tid);
            cond = loadPredicateBool(pb, loc, st, predicateBase, offset);
        } else {
            // Non-uniform loop bounds derived from tid while keeping within maxTripCount.
            Value bound =
                makeNonUniformBound(pb, loc, st.rng, st.cfg, st.tid, trip);
            cond = pb.create<arith::CmpIOp>(loc, arith::CmpIPredicate::slt, idx, bound);
        }
        pb.create<simt::dialect::ConditionOp>(loc, cond, ValueRange{acc, idx});
    }
    {
        auto &body = loop.getBodyRegion().front();
        OpBuilder bb(&body, body.begin());
        Value acc = body.getArgument(0);
        Value idx = body.getArgument(1);
        Value inner = (depth + 1 < maxDepth && st.rng.coin())
                          ? buildPattern(bb, loc, st, depth + 1, maxDepth)
                          : idx;
        Value sum = bb.create<arith::AddIOp>(loc, acc, inner);
        Value one = makeI32(bb, loc, 1);
        Value nextIdx = bb.create<arith::AddIOp>(loc, idx, one);
        emitWaveCount(bb, loc, st, makeBool(bb, loc, true), idx);
        // Optionally emit a structured continue/break to exercise loop control.
        bool emitCtrl = false;
        if (st.cfg.breakContinueRate < 0.0) {
            emitCtrl = st.rng.coin();
        } else {
            emitCtrl = st.rng.chance(st.cfg.breakContinueRate);
        }
        bool doBreak = st.rng.coin();
        if (emitCtrl && doBreak) {
            // Break out with the current accum/next index.
            bb.create<simt::dialect::BreakOp>(loc, ValueRange{sum, nextIdx});
        } else if (emitCtrl) {
            // Continue with updated carried values to avoid stalling the loop.
            bb.create<simt::dialect::ContinueOp>(loc, ValueRange{sum, nextIdx});
        } else {
            bb.create<simt::dialect::YieldOp>(loc, ValueRange{sum, nextIdx});
        }
    }
    return loop.getResult(0);
}

static Value buildPattern(OpBuilder &b, Location loc, BuildState &st,
                          unsigned depth, unsigned maxDepth) {
    if (depth >= maxDepth)
        return buildValue(b, loc, st);
    int choice = st.rng.pick(0, 3); // 0 leaf, 1 if, 2 loop, 3 switch
    if (choice == 0)
        return buildValue(b, loc, st);
    if (choice == 1)
        return buildIf(b, loc, st, depth, maxDepth);
    if (choice == 2)
        return buildLoop(b, loc, st, depth, maxDepth);
    return buildSwitch(b, loc, st, depth, maxDepth);
}

static Value buildControlPattern(OpBuilder &b, Location loc, BuildState &st,
                                 unsigned depth, unsigned maxDepth) {
    int choice = st.rng.pick(1, 3); // 1 if, 2 loop, 3 switch
    if (choice == 1)
        return buildIf(b, loc, st, depth, maxDepth);
    if (choice == 2)
        return buildLoop(b, loc, st, depth, maxDepth);
    return buildSwitch(b, loc, st, depth, maxDepth);
}

static void emitPostSwitchHelperCall(OpBuilder &b, Location loc, BuildState &st,
                                     func::FuncOp helper,
                                     llvm::ArrayRef<Value> helperArgs) {
    st.controlOps++;
    int numCases = st.rng.pick(2, 4);
    bool includeDefault = st.rng.coin();
    int defaultIndex = st.rng.pick(0, numCases - 1);

    int selectorMod = includeDefault ? numCases : (numCases - 1);
    Value selector = st.tid;
    if (selectorMod > 1) {
        Value mod = makeI32(b, loc, selectorMod);
        selector = b.create<arith::RemSIOp>(loc, selector, mod);
    }

    Value initVal = buildValue(b, loc, st);

    llvm::SmallVector<int64_t, 4> caseValues;
    caseValues.reserve(numCases - 1);
    int nextCaseValue = 0;
    for (int i = 0; i < numCases; ++i) {
        if (i == defaultIndex)
            continue;
        caseValues.push_back(nextCaseValue++);
    }

    auto switchOp = b.create<simt::dialect::SwitchOp>(
        loc, TypeRange{b.getI32Type()}, selector, ValueRange{initVal}, caseValues,
        defaultIndex);

    auto &region = switchOp.getCaseBody();
    while (static_cast<int>(region.getBlocks().size()) < numCases) {
        auto *blk = new Block();
        blk->addArguments({b.getI32Type()}, SmallVector<Location>{loc});
        region.push_back(blk);
    }

    int caseIdx = 0;
    for (auto &blk : region) {
        if (caseIdx >= numCases)
            break;
        if (blk.getNumArguments() == 0) {
            blk.addArguments({b.getI32Type()}, SmallVector<Location>{loc});
        }
        OpBuilder cb(&blk, blk.begin());
        Value in = blk.getArgument(0);
        Value c = makeI32(cb, loc, st.rng.pick(0, 4));
        Value out = cb.create<arith::AddIOp>(loc, in, c);
        auto yield = cb.create<simt::dialect::YieldOp>(loc, ValueRange{out});
        yield->setAttr("fallthrough", b.getBoolAttr(false));
        ++caseIdx;
    }

    b.create<func::CallOp>(loc, helper, helperArgs);
}

static void emitNestedHelperCall(OpBuilder &b, Location loc, BuildState &st,
                                 func::FuncOp helper,
                                 llvm::ArrayRef<Value> helperArgs,
                                 unsigned depth, unsigned maxDepth) {
    if (depth >= maxDepth) {
        bool wrapWithSwitch = st.cfg.helperCallPostSwitchRate > 0.0 &&
                              st.rng.chance(st.cfg.helperCallPostSwitchRate);
        if (wrapWithSwitch) {
            emitPostSwitchHelperCall(b, loc, st, helper, helperArgs);
        } else {
            b.create<func::CallOp>(loc, helper, helperArgs);
        }
        return;
    }

    bool wrapWithLoop = st.cfg.helperCallNestLoopRate > 0.0 &&
                        st.rng.chance(st.cfg.helperCallNestLoopRate);
    if (wrapWithLoop) {
        st.controlOps++;
        int maxTrip = std::max<int>(1, static_cast<int>(st.cfg.maxTripCount));
        int tripHi = std::min<int>(2, maxTrip);
        int trip = std::max(1, st.rng.pick(1, tripHi));

        Value acc0 = makeI32(b, loc, 0);
        Value idx0 = makeI32(b, loc, 0);
        auto loop = b.create<simt::dialect::LoopOp>(
            loc, TypeRange{b.getI32Type(), b.getI32Type()}, ValueRange{acc0, idx0});
        if (loop.getPrepareRegion().empty()) {
            auto *prep = new Block();
            prep->addArguments({b.getI32Type(), b.getI32Type()},
                               SmallVector<Location>{loc, loc});
            loop.getPrepareRegion().push_back(prep);
        }
        if (loop.getBodyRegion().empty()) {
            auto *body = new Block();
            body->addArguments({b.getI32Type(), b.getI32Type()},
                               SmallVector<Location>{loc, loc});
            loop.getBodyRegion().push_back(body);
        }
        {
            auto &prep = loop.getPrepareRegion().front();
            if (prep.getNumArguments() == 0) {
                prep.addArguments({b.getI32Type(), b.getI32Type()},
                                  SmallVector<Location>{loc, loc});
            }
            OpBuilder pb(&prep, prep.begin());
            Value acc = prep.getArgument(0);
            Value idx = prep.getArgument(1);
            // Keep this wrapper loop uniform to avoid introducing extra
            // divergence at the helper call site (the outer if already provides
            // non-uniformity when enabled).
            Value bound = makeI32(pb, loc, trip);
            Value cond =
                pb.create<arith::CmpIOp>(loc, arith::CmpIPredicate::slt, idx, bound);
            pb.create<simt::dialect::ConditionOp>(loc, cond, ValueRange{acc, idx});
        }
        {
            auto &body = loop.getBodyRegion().front();
            if (body.getNumArguments() == 0) {
                body.addArguments({b.getI32Type(), b.getI32Type()},
                                  SmallVector<Location>{loc, loc});
            }
            OpBuilder bb(&body, body.begin());
            Value acc = body.getArgument(0);
            Value idx = body.getArgument(1);
            emitNestedHelperCall(bb, loc, st, helper, helperArgs, depth + 1,
                                 maxDepth);
            Value one = makeI32(bb, loc, 1);
            Value nextIdx = bb.create<arith::AddIOp>(loc, idx, one);
            bb.create<simt::dialect::YieldOp>(loc, ValueRange{acc, nextIdx});
        }
        b.setInsertionPointAfter(loop);
        return;
    }

    st.controlOps++;
    Value cond = buildNonUniformCond(b, loc, st);
    auto ifOp =
        b.create<simt::dialect::IfOp>(loc, TypeRange{}, cond, /*withElseRegion=*/true);
    auto &thenBlock = ifOp.getThenRegion().front();
    auto &elseBlock = ifOp.getElseRegion().front();
    Block &targetBlock = st.rng.coin() ? thenBlock : elseBlock;

    OpBuilder armB(&targetBlock, targetBlock.begin());
    if (mlir::Operation *term = targetBlock.getTerminator())
        armB.setInsertionPoint(term);
    emitNestedHelperCall(armB, loc, st, helper, helperArgs, depth + 1, maxDepth);
    b.setInsertionPointAfter(ifOp);
}
} // namespace

mlir::OwningOpRef<mlir::ModuleOp>
createDeterministicIfLoopModule(mlir::MLIRContext &context,
                                const GeneratorConfig &cfg) {
    ModuleOp module = ModuleOp::create(UnknownLoc::get(&context));
    llvm::errs() << "[fuzz-gen] module created\n";
    auto &modBlock = module.getBodyRegion().front();
    OpBuilder builder(&modBlock, modBlock.end());
    auto loc = module.getLoc();
    llvm::errs() << "[fuzz-gen] builder ready\n";

    auto resTy = simt::dialect::ResourceType::get(
        &context, simt::dialect::MemorySpace::Global, builder.getI32Type());
    llvm::errs() << "[fuzz-gen] resource type ready\n";

    RNG helperRng(1);
    int nextWaveId = 0;
    auto helper = cfg.complexHelper
                      ? buildComplexHelper(builder, loc, "helper0", helperRng, cfg,
                                           &nextWaveId)
                      : buildScalarHelper(builder, loc, "helper0", nullptr, cfg,
                                          &nextWaveId);

    auto funcType = builder.getFunctionType({resTy}, {});
    auto func = builder.create<func::FuncOp>(loc, "main", funcType);
    llvm::errs() << "[fuzz-gen] func created\n";
    func->setAttr("simt.num_threads",
                  builder.getI64ArrayAttr(
                      {cfg.numThreads[0], cfg.numThreads[1], cfg.numThreads[2]}));
    func->setAttr("simt.subgroup_width",
                  builder.getI64IntegerAttr(cfg.subgroupWidth));

    auto *entry = func.addEntryBlock();
    builder.setInsertionPointToStart(entry);

    Value outWave = entry->getArgument(0);
    Value tid =
        builder.create<simt::dialect::DispatchThreadIdOp>(loc, builder.getI32Type());
    llvm::errs() << "[fuzz-gen] tid op created\n";
    builder.create<func::CallOp>(loc, helper, ValueRange{tid, outWave});
    Value c0 = builder.create<arith::ConstantIntOp>(loc, 0, 32);
    Value cond =
        builder.create<arith::CmpIOp>(loc, arith::CmpIPredicate::eq, tid, c0);
    llvm::errs() << "[fuzz-gen] cond created\n";

    auto ifOp = builder.create<simt::dialect::IfOp>(
        loc, TypeRange{builder.getI32Type()}, cond, /*withElseRegion=*/true);
    if (ifOp.getThenRegion().empty())
        ifOp.getThenRegion().push_back(new Block());
    if (ifOp.getElseRegion().empty())
        ifOp.getElseRegion().push_back(new Block());
    {
        // then block: small counted loop accumulating 0+1+2+3
        auto &thenBlock = ifOp.getThenRegion().front();
        OpBuilder thenB(&thenBlock, thenBlock.begin());
        Value zero = thenB.create<arith::ConstantIntOp>(loc, 0, 32);
        Value initI = thenB.create<arith::ConstantIntOp>(loc, 0, 32);
        auto loop = thenB.create<simt::dialect::LoopOp>(
            loc, TypeRange{builder.getI32Type(), builder.getI32Type()},
            ValueRange{zero, initI});
        if (loop.getPrepareRegion().empty()) {
            auto *prepBlock = new Block();
            prepBlock->addArguments({builder.getI32Type(), builder.getI32Type()},
                                    SmallVector<Location>{loc, loc});
            loop.getPrepareRegion().push_back(prepBlock);
        }
        if (loop.getBodyRegion().empty()) {
            auto *bodyBlock = new Block();
            bodyBlock->addArguments({builder.getI32Type(), builder.getI32Type()},
                                    SmallVector<Location>{loc, loc});
            loop.getBodyRegion().push_back(bodyBlock);
        }

        // prepare region
        {
            auto &prep = loop.getPrepareRegion().front();
            OpBuilder prepB(&prep, prep.begin());
            Value acc = prep.getArgument(0);
            Value i = prep.getArgument(1);
            int k = static_cast<int>(cfg.maxTripCount);
            if (k < 2) {
                k = 1;
            }
            Value ck = prepB.create<arith::ConstantIntOp>(loc, k, 32);
            Value bound;
            if (k == 1) {
                bound = prepB.create<arith::ConstantIntOp>(loc, 1, 32);
            } else {
                Value rem = prepB.create<arith::RemSIOp>(loc, tid, ck);
                Value one = prepB.create<arith::ConstantIntOp>(loc, 1, 32);
                bound = prepB.create<arith::AddIOp>(loc, rem, one);
            }
            Value lt =
                prepB.create<arith::CmpIOp>(loc, arith::CmpIPredicate::slt, i, bound);
            prepB.create<simt::dialect::ConditionOp>(loc, lt, ValueRange{acc, i});
        }
        // body region
        {
            auto &body = loop.getBodyRegion().front();
            OpBuilder bodyB(&body, body.begin());
            Value acc = body.getArgument(0);
            Value i = body.getArgument(1);
            Value sum = bodyB.create<arith::AddIOp>(loc, acc, i);
            Value one = bodyB.create<arith::ConstantIntOp>(loc, 1, 32);
            Value next = bodyB.create<arith::AddIOp>(loc, i, one);
            bodyB.create<simt::dialect::YieldOp>(loc, ValueRange{sum, next});
        }
        Value loopVal = loop.getResult(0);
        thenB.create<simt::dialect::YieldOp>(loc, ValueRange{loopVal});
    }
    llvm::errs() << "[fuzz-gen] then/loop built\n";
    {
        // else block: just use tid
        auto &elseBlock = ifOp.getElseRegion().front();
        OpBuilder elseB(&elseBlock, elseBlock.begin());
        elseB.create<simt::dialect::YieldOp>(loc, ValueRange{tid});
    }
    llvm::errs() << "[fuzz-gen] else built\n";

    builder.setInsertionPointToEnd(entry);

    // Wave-count branch: use constant true predicate.
    Value even = builder.create<arith::ConstantIntOp>(loc, 1, 1);
    // Store wave_count_bits result at idx = waveId * stride + tid.
    constexpr int waveId = 0;
    constexpr int stride = 64;
    Value waveIdC = builder.create<arith::ConstantIntOp>(loc, waveId * stride, 32);
    Value baseIdx = builder.create<arith::AddIOp>(loc, waveIdC, tid);
    Value count = builder.create<simt::dialect::WaveCountBitsOp>(loc, builder.getI32Type(), even);
    builder.create<simt::dialect::BufferStoreOp>(loc, outWave, baseIdx, count);

    builder.create<func::ReturnOp>(loc);
    llvm::errs() << "[fuzz-gen] return built\n";

    return OwningOpRef<ModuleOp>(module);
}

mlir::OwningOpRef<mlir::ModuleOp>
createRandomizedModule(mlir::MLIRContext &context,
                       const GeneratorConfig &cfg) {
    if (cfg.seed == 0)
        return createDeterministicIfLoopModule(context, cfg);

    RNG rng(cfg.seed);

    // Randomize a few knobs.
    int tripCount = std::max(1, rng.pick(1, static_cast<int>(cfg.maxTripCount)));
    bool useWaveOp = rng.coin();
    int waveId = rng.pick(0, 3);
    int stride = 64;

    ModuleOp module = ModuleOp::create(UnknownLoc::get(&context));
    auto &modBlock = module.getBodyRegion().front();
    OpBuilder builder(&modBlock, modBlock.end());
    auto loc = module.getLoc();

    auto resTy = simt::dialect::ResourceType::get(
        &context, simt::dialect::MemorySpace::Global, builder.getI32Type());
    int nextWaveId = 0;
    auto helper = cfg.complexHelper ? buildComplexHelper(builder, loc, "helper0", rng, cfg,
                                                         &nextWaveId)
                                    : buildScalarHelper(builder, loc, "helper0", &rng, cfg,
                                                        &nextWaveId);
    llvm::SmallVector<Type, 2> argTypes;
    argTypes.push_back(resTy);
    if (cfg.predicateBuffer)
        argTypes.push_back(resTy);
    auto funcType = builder.getFunctionType(argTypes, {});
    auto func = builder.create<func::FuncOp>(loc, "main", funcType);
    func->setAttr("simt.num_threads",
                  builder.getI64ArrayAttr(
                      {cfg.numThreads[0], cfg.numThreads[1], cfg.numThreads[2]}));
    func->setAttr("simt.subgroup_width",
                  builder.getI64IntegerAttr(cfg.subgroupWidth));

    auto *entry = func.addEntryBlock();
    builder.setInsertionPointToStart(entry);

    Value outWave = entry->getArgument(0);
    Value predBuffer;
    if (cfg.predicateBuffer && cfg.predicateBufferArgIndex < argTypes.size())
        predBuffer = entry->getArgument(cfg.predicateBufferArgIndex);
    Value tid =
        builder.create<simt::dialect::DispatchThreadIdOp>(loc, builder.getI32Type());
    builder.create<func::CallOp>(loc, helper, ValueRange{tid, outWave});

    // Build a non-uniform branch predicate.
    Value cond = makeNonUniformCond(builder, loc, rng, cfg, tid);

    auto ifOp = builder.create<simt::dialect::IfOp>(
        loc, TypeRange{builder.getI32Type()}, cond, /*withElseRegion=*/true);
    if (ifOp.getThenRegion().empty())
        ifOp.getThenRegion().push_back(new Block());
    if (ifOp.getElseRegion().empty())
        ifOp.getElseRegion().push_back(new Block());

    // Then: counted loop with randomized trip count.
    {
        auto &thenBlock = ifOp.getThenRegion().front();
        OpBuilder thenB(&thenBlock, thenBlock.begin());
        Value zero = thenB.create<arith::ConstantIntOp>(loc, 0, 32);
        Value initI = thenB.create<arith::ConstantIntOp>(loc, 0, 32);
        auto loop = thenB.create<simt::dialect::LoopOp>(
            loc, TypeRange{builder.getI32Type(), builder.getI32Type()},
            ValueRange{zero, initI});
        if (loop.getPrepareRegion().empty()) {
            auto *prepBlock = new Block();
            prepBlock->addArguments({builder.getI32Type(), builder.getI32Type()},
                                    SmallVector<Location>{loc, loc});
            loop.getPrepareRegion().push_back(prepBlock);
        }
        if (loop.getBodyRegion().empty()) {
            auto *bodyBlock = new Block();
            bodyBlock->addArguments({builder.getI32Type(), builder.getI32Type()},
                                    SmallVector<Location>{loc, loc});
            loop.getBodyRegion().push_back(bodyBlock);
        }
        {
            auto &prep = loop.getPrepareRegion().front();
            OpBuilder prepB(&prep, prep.begin());
            Value acc = prep.getArgument(0);
            Value i = prep.getArgument(1);
            Value bound =
                makeNonUniformBound(prepB, loc, rng, cfg, tid, tripCount);
            Value lt =
                prepB.create<arith::CmpIOp>(loc, arith::CmpIPredicate::slt, i, bound);
            prepB.create<simt::dialect::ConditionOp>(loc, lt, ValueRange{acc, i});
        }
        {
            auto &body = loop.getBodyRegion().front();
            OpBuilder bodyB(&body, body.begin());
            Value acc = body.getArgument(0);
            Value i = body.getArgument(1);
            Value sum = bodyB.create<arith::AddIOp>(loc, acc, i);
            Value one = bodyB.create<arith::ConstantIntOp>(loc, 1, 32);
            Value next = bodyB.create<arith::AddIOp>(loc, i, one);
            bodyB.create<simt::dialect::YieldOp>(loc, ValueRange{sum, next});
        }
        Value loopVal = loop.getResult(0);
        thenB.create<simt::dialect::YieldOp>(loc, ValueRange{loopVal});
    }
    {
        auto &elseBlock = ifOp.getElseRegion().front();
        OpBuilder elseB(&elseBlock, elseBlock.begin());
        elseB.create<simt::dialect::YieldOp>(loc, ValueRange{tid});
    }

    builder.setInsertionPointToEnd(entry);

    if (useWaveOp) {
        Value trueVal = builder.create<arith::ConstantIntOp>(loc, 1, 1);
        Value waveBase = builder.create<arith::ConstantIntOp>(loc, waveId * stride, 32);
        Value baseIdx = builder.create<arith::AddIOp>(loc, waveBase, tid);
        Value count = builder.create<simt::dialect::WaveCountBitsOp>(loc, builder.getI32Type(), trueVal);
        builder.create<simt::dialect::BufferStoreOp>(loc, outWave, baseIdx, count);
    } else {
        Value waveBase = builder.create<arith::ConstantIntOp>(loc, 0, 32);
        Value baseIdx = builder.create<arith::AddIOp>(loc, waveBase, tid);
        Value zeroVal = builder.create<arith::ConstantIntOp>(loc, 0, 32);
        builder.create<simt::dialect::BufferStoreOp>(loc, outWave, baseIdx, zeroVal);
    }

    builder.create<func::ReturnOp>(loc);
    return OwningOpRef<ModuleOp>(module);
}

mlir::OwningOpRef<mlir::ModuleOp>
createRicherRandomModule(mlir::MLIRContext &context,
                         const GeneratorConfig &cfg) {
    RNG rng(cfg.seed == 0 ? 1 : cfg.seed);

    ModuleOp module = ModuleOp::create(UnknownLoc::get(&context));
    auto &modBlock = module.getBodyRegion().front();
    OpBuilder builder(&modBlock, modBlock.end());
    auto loc = module.getLoc();

    auto resTy = simt::dialect::ResourceType::get(
        &context, simt::dialect::MemorySpace::Global, builder.getI32Type());
    unsigned helperPredicateArgs = cfg.predicateBuffer ? 2 : 0;
    int nextWaveId = 0;
    auto helper = cfg.complexHelper
                      ? buildComplexHelper(builder, loc, "helper0", rng, cfg,
                                           &nextWaveId, helperPredicateArgs)
                      : buildScalarHelper(builder, loc, "helper0", &rng, cfg,
                                          &nextWaveId, helperPredicateArgs);
    llvm::SmallVector<Type, 2> argTypes;
    argTypes.push_back(resTy);
    if (cfg.predicateBuffer)
        argTypes.push_back(resTy);
    auto funcType = builder.getFunctionType(argTypes, {});
    auto func = builder.create<func::FuncOp>(loc, "main", funcType);
    func->setAttr("simt.num_threads",
                  builder.getI64ArrayAttr(
                      {cfg.numThreads[0], cfg.numThreads[1], cfg.numThreads[2]}));
    func->setAttr("simt.subgroup_width",
                  builder.getI64IntegerAttr(cfg.subgroupWidth));

    auto *entry = func.addEntryBlock();
    builder.setInsertionPointToStart(entry);

    Value outWave = entry->getArgument(0);
    Value predBuffer;
    if (cfg.predicateBuffer && cfg.predicateBufferArgIndex < argTypes.size())
        predBuffer = entry->getArgument(cfg.predicateBufferArgIndex);
    Value tid =
        builder.create<simt::dialect::DispatchThreadIdOp>(loc, builder.getI32Type());

    std::vector<int64_t> localPredicates;
    std::vector<int64_t> *predValues = cfg.predicateValues;
    if (cfg.predicateBuffer && !predValues)
        predValues = &localPredicates;
    BuildState st{cfg,
                  rng,
                  /*waveId=*/nextWaveId,
                  /*controlOps=*/0,
                  cfg.predicateBuffer,
                  predBuffer,
                  /*predNextIndex=*/0,
                  predValues,
                  tid,
                  outWave};

    llvm::SmallVector<Value, 4> helperArgs;
    helperArgs.push_back(tid);
    helperArgs.push_back(outWave);
    if (helperPredicateArgs) {
        int lanes = std::max(1, static_cast<int>(cfg.numThreads[0]));

        int condBase = allocPredicateSlots(st, lanes);
        if (st.predValues) {
            if (lanes < 2) {
                for (int lane = 0; lane < lanes; ++lane)
                    (*st.predValues)[condBase + lane] = 1;
            } else if (st.rng.coin()) {
                for (int lane = 0; lane < lanes; ++lane)
                    (*st.predValues)[condBase + lane] = ((lane % 2) == 0) ? 1 : 0;
            } else {
                int k = st.rng.pick(1, lanes - 1);
                for (int lane = 0; lane < lanes; ++lane)
                    (*st.predValues)[condBase + lane] = (lane < k) ? 1 : 0;
            }
        }
        helperArgs.push_back(loadPredicateI32(builder, loc, st, condBase, st.tid));

        if (helperPredicateArgs > 1) {
            int valueBase = allocPredicateSlots(st, lanes);
            if (st.predValues) {
                int maxTrip = std::max<int>(1, static_cast<int>(cfg.maxTripCount));
                int offset = (maxTrip > 1) ? st.rng.pick(0, maxTrip - 1) : 0;
                for (int lane = 0; lane < lanes; ++lane) {
                    (*st.predValues)[valueBase + lane] =
                        ((lane + offset) % maxTrip);
                }
            }
            helperArgs.push_back(
                loadPredicateI32(builder, loc, st, valueBase, st.tid));
        }
    }
    bool wrapHelper = cfg.nonUniformHelperCallRate > 0.0 &&
                      st.rng.chance(cfg.nonUniformHelperCallRate);
    if (!wrapHelper) {
        builder.create<func::CallOp>(loc, helper, helperArgs);
    } else {
        st.controlOps++;
        Value cond;
        if (helperPredicateArgs) {
            Value pred = helperArgs[2];
            Value zero = makeI32(builder, loc, 0);
            cond = builder.create<arith::CmpIOp>(loc, arith::CmpIPredicate::ne, pred,
                                                 zero);
        } else {
            cond = makeNonUniformCond(builder, loc, st.rng, st.cfg, st.tid);
        }

        auto ifOp = builder.create<simt::dialect::IfOp>(loc, TypeRange{}, cond,
                                                       /*withElseRegion=*/true);
        auto &thenBlock = ifOp.getThenRegion().front();
        auto &elseBlock = ifOp.getElseRegion().front();
        Block &targetBlock = st.rng.coin() ? thenBlock : elseBlock;

        OpBuilder armB(&targetBlock, targetBlock.begin());
        if (mlir::Operation *term = targetBlock.getTerminator())
            armB.setInsertionPoint(term);
        unsigned maxDepth = std::max<unsigned>(1, cfg.helperCallMaxDepth);
        emitNestedHelperCall(armB, loc, st, helper, helperArgs,
                             /*depth=*/1, maxDepth);
        builder.setInsertionPointAfter(ifOp);
    }

    int roots = rng.pick(1, 3);
    for (int r = 0; r < roots; ++r) {
        (void)buildPattern(builder, loc, st, /*depth=*/0, /*maxDepth=*/3);
    }
    while (st.controlOps < cfg.minControlOps) {
        (void)buildControlPattern(builder, loc, st, /*depth=*/0, /*maxDepth=*/3);
    }

    builder.create<func::ReturnOp>(loc);
    return OwningOpRef<ModuleOp>(module);
}

} // namespace simt::fuzz
