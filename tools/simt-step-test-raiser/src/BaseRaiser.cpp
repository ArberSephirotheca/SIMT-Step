#include "BaseRaiser.h"

#include <cassert>
#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <deque>
#include <iterator>
#include <llvm/Support/CommandLine.h>
#include <mlir/Tools/mlir-translate/Translation.h>
#include <mlir/Tools/mlir-translate/MlirTranslateMain.h>

#include "mlir/IR/BuiltinAttributes.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/Operation.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include "llvm/ADT/APFloat.h"
#include "llvm/ADT/TypeSwitch.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/LogicalResult.h"
#include "llvm/Support/Regex.h"
#include "llvm/Support/raw_ostream.h"
#include <mlir/Dialect/Arith/IR/Arith.h>
#include <mlir/Dialect/Func/IR/FuncOps.h>
#include <mlir/Dialect/Math/IR/Math.h>
#include <mlir/Dialect/Vector/IR/VectorOps.h>

#include <mlir/InitAllTranslations.h>
#include <string>
#include <vector>
#include <cstdio>
#include "mlir/Support/IndentedOstream.h"


using namespace simt::test_raiser;
using namespace llvm;
using namespace mlir;

namespace simt::test_raiser {

BaseRaiser::BaseRaiser(raw_ostream& o): scopeHandler(), os(o) {}
BaseRaiser::~BaseRaiser(){}

int BaseRaiser::addValueNumber(Value v){
    assert(!value_map.contains(v));
    return value_map[v] = value_counter++;
}

int BaseRaiser::getValueNumber(Value v){
    assert(value_map.contains(v));
    return value_map[v];
}

std::string BaseRaiser::addValueName(Value v){
    return "v" + std::to_string(addValueNumber(v));
}

std::string BaseRaiser::getValueName(Value v){
    return "v" + std::to_string(getValueNumber(v));
}

LogicalResult BaseRaiser::emitConst(Type t, int64_t v){
    switch (t.getIntOrFloatBitWidth()){
        case 1:
            os << (v ? "true" : "false");
            break;
        case 32:
            os << v;
            if (t.isUnsignedInteger()) os << "u";
            break;
        case 64:
            os << v;
            if (t.isUnsignedInteger()) os << "u";
            os << "l";
            break;
        default:
            llvm_unreachable("Unable to emit conststant");
            break;
    }

    return success();
}

LogicalResult BaseRaiser::emitConst(Type t, APFloat v){
    switch (t.getIntOrFloatBitWidth()){
        case 32:
            os << v;
            break;
        case 64:
            os << v << "lf";
            break;
        default:
            llvm_unreachable("Unable to emit conststant");
            break;
    }

    return success();
}


LogicalResult BaseRaiser::emitValueDefine(Value v){
    std::string vname = addValueName(v);
    if (failed(emitType(v.getType()))) return failure();
    os << " " << vname << " = ";
    return success();
}

LogicalResult BaseRaiser::emitBinop(Value output, Value left, Value right, std::string op){
    if (failed(emitValueDefine(output))) return failure();
    os << getValueName(left) << " " << op << " " << getValueName(right);
    return success();
}

LogicalResult BaseRaiser::emitFuncCall(Value output, std::string fname, std::vector<Value> args){
    if (failed(emitValueDefine(output))) return failure();
    os << fname << "(";
    for (std::size_t i = 0; i < args.size(); i++){
        os << getValueName(args[i]);
        if (i < args.size() - 1) os << ", ";
    }
    os << ")";
    return success();
}

LogicalResult BaseRaiser::emitFuncCall(std::string fname, std::vector<Value> args){
    os << fname << "(";
    for (std::size_t i = 0; i < args.size(); i++){
        os << getValueName(args[i]);
        if (i < args.size() - 1) os << ", ";
    }
    os << ")";
    return success();
}

/**
Uses function overloading to choose the correct printing function for each
operation type.
*/
LogicalResult BaseRaiser::emitOp(mlir::Operation* op){

    // Creates the lambda for cases for binary operators
    auto makeBinop = [this](std::string opstr){
        return [opstr, this](auto op){return emitBinop(op.getResult(), op->getOperand(0), op->getOperand(1), opstr);};
    };

    LogicalResult res = llvm::TypeSwitch<Operation&, LogicalResult>(*op)
        .Case<
            // func Operations
            func::FuncOp, func::ReturnOp, func::CallOp,
            // builtin Operations
            ModuleOp,
            // arith Operations
            arith::ConstantOp, arith::CmpIOp, arith::CmpFOp, arith::NegFOp, 
            arith::SelectOp, arith::RemFOp,
            // vector Operations
            vector::ExtractOp,
            // simt_step Operations
            DispatchThreadIdOp, BufferLoadOp, BufferStoreOp,
            BufferAtomicAddOp, IfOp, YieldOp, LoopOp, ConditionOp,
            BreakOp, ContinueOp, SwitchOp, WaveCountBitsOp,
            LaneIdOp, SubgroupIdOp, WaveAllOp, WaveAnyOp,
            GroupIdOp, GroupThreadIdOp, GroupIndexOp
            >(
                [&](auto op){return printOp(op);})
        
        // Binary operations
        .Case<arith::AddFOp, arith::AddIOp>(makeBinop("+"))
        .Case<arith::SubFOp, arith::SubIOp>(makeBinop("-"))
        .Case<arith::MulFOp, arith::MulIOp>(makeBinop("*"))
        .Case<arith::DivFOp, arith::DivSIOp, arith::DivUIOp>(makeBinop("/"))
        .Case<arith::AndIOp>(makeBinop("&"))
        .Case<arith::OrIOp>(makeBinop("|"))
        .Case<arith::XOrIOp>(makeBinop("^"))
        .Case<arith::RemUIOp, arith::RemSIOp>(makeBinop("%"))
        
        // Casting operations
        .Case<
            arith::ExtUIOp, arith::ExtSIOp, arith::ExtFOp,
            arith::TruncFOp, arith::TruncIOp, arith::IndexCastOp>(
                [&](auto op){return emitCast(op.getOperand(), op.getResult());})

        .Default([&](Operation &) {
            return op->emitOpError("unsupported");
        });
    
    if (failed(res)){
        return failure();
    }
    
    if (!isa<func::FuncOp, ModuleOp, IfOp, YieldOp, LoopOp, ConditionOp, SwitchOp>(op)){
        os << ";\n";
    }

    return success();
}

LogicalResult BaseRaiser::emitRegion(Region& region){
    for (auto &subop : region.front()){
        if (failed(emitOp(&subop))) {
            return failure();
        }
    }
    return success();
}

LogicalResult BaseRaiser::emitBlock(Block& block){
    for (auto& subop : block){
        if (failed(emitOp(&subop))) {
            return failure();
        }
    }
    return success();
}

/////////////     Builtins     /////////////

LogicalResult BaseRaiser::printOp(ModuleOp& op){
    return emitRegion(op.getBodyRegion());
}

///////////// 'func' dialect /////////////

//
LogicalResult BaseRaiser::printOp(func::FuncOp& op){
    if (op.getSymName() == "main"){
        if (failed(emitMainFuncTop(op))) return failure();
    } else {
        assert(op.getFunctionType().getNumResults() == 1);
        if (failed(emitType(op.getFunctionType().getResult(0)))) return failure();
        os << " " << op.getSymName() << "(";
        for (auto arg : op.getArguments()){
            if (failed(emitType(arg.getType()))) return failure();
            os << " " << addValueName(arg);
            if (arg.getArgNumber() < op.getNumArguments() - 1){
                os << ", ";
            }
        }
        os << ")";
    }
    os << "{\n";
    os.indent();
    if (failed(emitRegion(op.getRegion()))) return failure();
    os.unindent();
    os << "}\n\n";
    return success();
}

LogicalResult BaseRaiser::printOp(func::ReturnOp& op){
    os << "return";
    if (op->getNumOperands() > 0){
        assert(op->getNumOperands() == 1);
        os << " " << getValueName(op->getOperand(0));
    }
    return success();
}

LogicalResult BaseRaiser::printOp(func::CallOp& op){
    if (op->getNumResults() > 0){
        assert(op->getNumResults() == 1);
        return emitFuncCall(op.getResult(0), op.getCallee().str(), 
            std::vector<Value>(op.getArgOperands().begin(), op.getArgOperands().end()));
    } else {
        return emitFuncCall(op.getCallee().str(), 
            std::vector<Value>(op.getArgOperands().begin(), op.getArgOperands().end()));
    }
}

///////////// 'arith' dialect /////////////

LogicalResult BaseRaiser::printOp(arith::ConstantOp& op){
    Value v = op.getResult();
    if (failed(emitValueDefine(v))) return failure();

    if((op.getValue().getType().isFloat() 
            && succeeded(emitConst(v.getType(), cast<FloatAttr>(op.getValue()).getValue()))) || 
       (op.getValue().getType().isInteger()
            && succeeded(emitConst(v.getType(), cast<IntegerAttr>(op.getValue()).getInt())))){
        return success();
    }

    return failure();
}

LogicalResult BaseRaiser::printOp(arith::CmpIOp& op){
    Value v = op.getResult();

    std::string opstr = "<unk>";
    switch (op.getPredicate()){
        case arith::CmpIPredicate::eq:
            opstr = "==";
            break;
        case arith::CmpIPredicate::ne:
            opstr = "!=";
            break;
        case arith::CmpIPredicate::sgt:
        case arith::CmpIPredicate::ugt:
            opstr = ">";
            break;
        case arith::CmpIPredicate::slt:
        case arith::CmpIPredicate::ult:
            opstr = "<";
            break;
        case arith::CmpIPredicate::sge:
        case arith::CmpIPredicate::uge:
            opstr = ">=";
            break;
        case arith::CmpIPredicate::sle:
        case arith::CmpIPredicate::ule:
            opstr = "<=";
            break;
    }

    return emitBinop(v, op->getOperand(0), op->getOperand(1), opstr);

}

LogicalResult BaseRaiser::printOp(arith::CmpFOp& op){
    Value v = op.getResult();
    Value left = op->getOperand(0);
    std::string lname = getValueName(left);
    Value right = op->getOperand(1);
    std::string rname = getValueName(right);
    if (failed(emitValueDefine(v))) return failure();

    // Unordered operations return true if either operand is NaN
    // which is the opposite behavior to most languages. We can
    // emulate unordered instructions by taking the logical complement
    // of the opposite intruction. (i.e. a == b -> !(a != b)).
    switch (op.getPredicate()){
        case arith::CmpFPredicate::OEQ:
            os << lname << " == " << rname;
            break;
        case arith::CmpFPredicate::UEQ:
            os << "!(" << lname << " != " << rname << ")";
            break;
        case arith::CmpFPredicate::ONE:
            os << lname << " != " << rname;
            break;
        case arith::CmpFPredicate::UNE:
            os << "!(" << lname << " == " << rname << ")";
            break;
        case arith::CmpFPredicate::OGT:
            os << lname << " > " << rname;
            break;
        case arith::CmpFPredicate::UGT:
            os << "!(" << lname << " <= " << rname << ")";
            break;
        case arith::CmpFPredicate::OLT:
            os << lname << " < " << rname;
            break;
        case arith::CmpFPredicate::ULT:
            os << "!(" << lname << " >= " << rname << ")";
            break;
        case arith::CmpFPredicate::OGE:
            os << lname << " >= " << rname;
            break;
        case arith::CmpFPredicate::UGE:
            os << "!(" << lname << " < " << rname << ")";
            break;
        case arith::CmpFPredicate::OLE:
            os << lname << " < " << rname;
            break;
        case arith::CmpFPredicate::ULE:
            os << "!(" << lname << " >= " << rname << ")";
            break;
        default:
            op->emitError("unsupported");
            break;
    }

    return success();
}

LogicalResult BaseRaiser::printOp(arith::NegFOp& op){
    Value v = op.getResult();
    if (failed(emitValueDefine(v))) return failure();
    os << "-" << getValueName(op->getOperand(0));
    return success();
}

LogicalResult BaseRaiser::printOp(arith::SelectOp& op){
    Value v = op.getResult();
    if (failed(emitValueDefine(v))) return failure();
    os  << getValueName(op->getOperand(0)) << " ? " 
        << getValueName(op->getOperand(1)) << " : "
        << getValueName(op->getOperand(2));
    return success();
}

///////////// 'vector' dialect ////////////////
LogicalResult BaseRaiser::printOp(vector::ExtractOp &op) {
    if (failed(emitValueDefine(op.getResult()))) return failure();
    os << getValueName(op.getOperand(0));
    if (std::optional<int64_t> id = getConstantIntValue(op.getMixedPosition()[0])){
        if (id == vector::ExtractOp::kPoisonIndex) op->emitError("cannot handle poison indices");
        if (!id.has_value()) return failure();
        if (id.value() <= 4){
            os << "." << "xyzw"[id.value()];
        } else {
            os << "[" << id.value() << "]";
        }
    } else {
        Value v = op.getDynamicPosition()[0];
        os << "[" + getValueName(v) + "]";
    }
    return success();
}

///////////// 'simt_step' dialect /////////////
LogicalResult BaseRaiser::printOp(BufferLoadOp& op) {
    if (failed(emitValueDefine(op.getResult()))) return failure();
    os << getValueName(op.getOperand(0)) << "[" << getValueName(op.getOperand(1)) << "]";
    return success();
}

LogicalResult BaseRaiser::printOp(BufferStoreOp& op) {
    os << getValueName(op.getOperand(0)) << "[" << getValueName(op.getOperand(1)) << "] = "
    << getValueName(op.getOperand(2));
    return success();
}

LogicalResult BaseRaiser::printOp(IfOp& op){
    std::vector<Value> vs(op->getResults().begin(), op->getResults().end());
    scopeHandler.push((BaseRaiser::ScopeHandler::Scope){vs, ScopeHandler::Scope::IF_SCOPE});
    if (failed(scopeHandler.peek().emitDeclareResults(*this))) return failure();

    os << "if (" << getValueName(op.getOperand()) << ") {\n";
    os.indent();
    if (failed(emitRegion(op.getThenRegion()))) return failure();
    os.unindent();
    os << "} else {\n";
    os.indent();
    if (failed(emitRegion(op.getElseRegion()))) return failure();
    os.unindent();
    os << "}\n";

    scopeHandler.pop();
    return success();
}

LogicalResult BaseRaiser::printOp(YieldOp& op){
    if (failed(scopeHandler.peek().emitSetResults(
        *this, std::vector<Value>(op->getOperands().begin(), op->getOperands().end())))) 
        return failure();
    
    if (auto attr = op->getAttr("fallthrough")){
        auto battr = dyn_cast<BoolAttr>(attr);
        assert(battr);
        if (!battr.getValue()) os << "break;\n";
    }

    return success();
}

LogicalResult BaseRaiser::printOp(LoopOp& op){
    std::vector<Value> values(op->getResults().begin(), op->getResults().end());
    std::vector<Value> inits(op.getOperands().begin(), op.getOperands().end());
    scopeHandler.push((BaseRaiser::ScopeHandler::Scope){values, ScopeHandler::Scope::LOOP_SCOPE});
    if (failed(scopeHandler.peek().emitDeclareResults(*this))) return failure();
    if (failed(scopeHandler.peek().emitSetResults(*this, inits))) return failure();
    os << "while (true) {\n";
    os.indent();

    for (auto& region : op->getRegions()){
        assert(region.getBlocks().size() == 1);
        for (auto arg : region.getBlocks().front().getArguments()){
            value_map[arg] = getValueNumber(scopeHandler.peek().results[arg.getArgNumber()]);
        }
    }

    if (failed(emitRegion(op.getPrepareRegion()))) return failure();
    if (failed(emitRegion(op.getBodyRegion()))) return failure();

    os.unindent();
    os << "}\n";
    scopeHandler.pop();
    

    return success();
}

LogicalResult BaseRaiser::printOp(ConditionOp& op){
    if (failed(scopeHandler.peek().emitSetResults(*this, 
        std::vector<Value>(op->getOperands().begin()+1, op->getOperands().end())))) return failure();
    os << "if (!" << getValueName(op->getOperand(0)) << ") break;\n";
    return success();
}

LogicalResult BaseRaiser::printOp(BreakOp& op){
    ScopeHandler::Scope s;
    if (failed(scopeHandler.peekKind(ScopeHandler::Scope::LOOP_SCOPE, s))){
        // TODO: Switch statement too
        llvm_unreachable("Cannot find loop scope to break from");    
    }

    if (failed(s.emitSetResults(*this, 
        std::vector<Value>(op->getOperands().begin(), op->getOperands().end())))) return failure();
    os << "break;\n";
    return success();
}

LogicalResult BaseRaiser::printOp(ContinueOp& op){
    ScopeHandler::Scope s;
    if (failed(scopeHandler.peekKind(ScopeHandler::Scope::LOOP_SCOPE, s))){
        llvm_unreachable("Cannot find loop scope to break from");    
    }

    if (failed(s.emitSetResults(*this, 
        std::vector<Value>(op->getOperands().begin(), op->getOperands().end())))) return failure();
    os << "continue;\n";
    return success();
}

LogicalResult BaseRaiser::printOp(SwitchOp& op){
    std::vector<Value> values(op->getResults().begin(), op->getResults().end());
    std::vector<Value> inits(op.getOperands().begin() + 1, op.getOperands().end());
    scopeHandler.push((BaseRaiser::ScopeHandler::Scope){values, ScopeHandler::Scope::SWITCH_SCOPE});
    if (failed(scopeHandler.peek().emitDeclareResults(*this))) return failure();
    if (failed(scopeHandler.peek().emitSetResults(*this, inits))) return failure();
    
    os << "switch (" << getValueName(op->getOperand(0)) << ") {\n";
    os.indent();

    size_t block_index = 0;
    bool seen_default = false;
    for (auto& block : op.getCaseBody().getBlocks()){
        if (block_index == op.getDefaultIndex()){
            os << "default:\n";
            seen_default = true;
        } else {
            os << "case " << op.getCaseValues()[block_index - seen_default] << ":\n";
        }
        os.indent() << "{\n";

        for (auto arg : block.getArguments()){
            value_map[arg] = getValueNumber(scopeHandler.peek().results[arg.getArgNumber()]);
        }

        if (failed(emitBlock(block))) return failure();

        os.unindent() << "}\n";
        block_index++;
    }

    os.unindent();
    os << "}\n";
    scopeHandler.pop();


    return success();

}

//////////// Scope handler ////////////

BaseRaiser::ScopeHandler::Scope BaseRaiser::ScopeHandler::pop() {
    Scope res = stack.back();
    stack.pop_back();
    return res;
}

BaseRaiser::ScopeHandler::Scope BaseRaiser::ScopeHandler::peek() {
    return stack.back();
}

LogicalResult BaseRaiser::ScopeHandler::peekKind(BaseRaiser::ScopeHandler::Scope::ScopeKinds kind, BaseRaiser::ScopeHandler::Scope& out) {
    for (auto i = stack.rbegin(); i != stack.rend(); i++){
        if (i->scopeKind == kind) {
            out = *i;
            return success();
        }
    }
    return failure();
}

void BaseRaiser::ScopeHandler::push(BaseRaiser::ScopeHandler::Scope v) {
    stack.push_back(v);
}

LogicalResult BaseRaiser::ScopeHandler::Scope::emitGroupSet(BaseRaiser& b, std::vector<Value> lefts, std::vector<Value> rights){
    assert(lefts.size() == rights.size());
    for (size_t i = 0; i < lefts.size(); i++){
        b.os << b.getValueName(lefts[i]) << " = " << b.getValueName(rights[i]) << ";\n";
    }
    return success();
}

LogicalResult BaseRaiser::ScopeHandler::Scope::emitGroupDeclare(BaseRaiser& b, std::vector<Value> values){
    for (auto v : values){
        if (failed(b.emitType(v.getType()))) return failure();
        b.os << " " << b.addValueName(v) << ";\n";
    }
    return success();
}

LogicalResult BaseRaiser::ScopeHandler::Scope::emitDeclareResults(BaseRaiser& b){
    return emitGroupDeclare(b, results);
}

LogicalResult BaseRaiser::ScopeHandler::Scope::emitSetResults(BaseRaiser& b, std::vector<Value> rights){
    return emitGroupSet(b, results, rights);
}



//////////// Other helper functions ////////////

LogicalResult getMainInfo(Operation* op, int64_t& ntx, int64_t& nty, int64_t& ntz, std::vector<int64_t>& bufferIndex){
    // Stolen from HlslEmitter.cpp
    if (auto mod = dyn_cast<ModuleOp>(op)){
        auto func = mod.lookupSymbol<func::FuncOp>("main");
        bufferIndex.clear();
        for (auto arg : func.getArguments()){
            if (auto memarg = dyn_cast<simt::dialect::ResourceType>(arg.getType())){
                bufferIndex.push_back(arg.getArgNumber());
            }
        }
        if (auto attr = func->getAttr("simt.num_threads")) {
            if (auto denseAttr = mlir::dyn_cast<DenseI64ArrayAttr>(attr)) {
                auto vals = denseAttr.asArrayRef();
                if (vals.size() == 3) {
                    ntx = vals[0];
                    nty = vals[1];
                    ntz = vals[2];
                    return success();
                }
            } else if (auto arrayAttr = mlir::dyn_cast<ArrayAttr>(attr)) {
                if (arrayAttr.size() == 3) {
                    auto x = mlir::dyn_cast<IntegerAttr>(arrayAttr[0]);
                    auto y = mlir::dyn_cast<IntegerAttr>(arrayAttr[1]);
                    auto z = mlir::dyn_cast<IntegerAttr>(arrayAttr[2]);
                    if (x && y && z) {
                        ntx = x.getInt();
                        nty = y.getInt();
                        ntz = z.getInt();
                        return success();
                    }
                }
            }
        }
    }

    return failure();
}

LogicalResult emitAmberHarness(
        BaseRaiser& b, 
        Operation* op, 
        std::string lang, 
        HarnessProps props){

    int64_t ntx, nty, ntz;
    std::vector<int64_t> bufferIndicies;
    if(failed(getMainInfo(op, ntx, nty, ntz, bufferIndicies))) return failure();
    b.ntx = ntx;
    b.nty = nty;
    b.ntz = ntz;

    for (auto buffer : props.expected){
        b.buffer_sizes.push_back(buffer.size());
    }

    b.os << "#!amber\n"
            "DEVICE_FEATURE SubgroupSizeControl.subgroupSizeControl\n"
            "DEVICE_FEATURE shaderInt64\n";
    if (!props.noF64) b.os << "DEVICE_FEATURE shaderFloat64\n";
    b.os << "SET ENGINE_DATA fence_timeout_ms 10000\n"
            "SHADER compute compute_shader " << lang << " TARGET_ENV vulkan1.1\n";
    
    if (failed(b.emitShaderPrologue()) || failed(b.emitOp(op))) {
        return failure();
    }
    
    b.os << "\nEND\n";

    int bnum = 0;
    for (auto [outbuffer, inbuffer] : llvm::zip(props.expected, props.input)){
        b.os << "BUFFER actual" << bnum << " DATA_TYPE int32 DATA\n  ";
        for (int i : inbuffer) b.os << i << " ";
        b.os << "\nEND\nBUFFER expected" << bnum << " DATA_TYPE int32 DATA\n  ";
        for (int i : outbuffer) b.os << i << " ";
        b.os << "\nEND\n";
        bnum++;
    }
    b.os << "PIPELINE compute pipeline\n"
        "  ATTACH compute_shader\n";
    for (size_t i = 0; i < props.expected.size(); i++){
        b.os << "  BIND BUFFER actual" << i << " AS storage DESCRIPTOR_SET 0 BINDING " << i << "\n";
    }
    b.os << "SUBGROUP compute_shader\n";
    b.os.indent() << "REQUIRED_SIZE " << props.subgroupWidth << "\n";
    b.os.unindent() << "END\n";
    b.os << "END\n"
        << "RUN pipeline 1 1 1\n";
    
    for (size_t i = 0; i < props.expected.size(); i++){
        b.os << "EXPECT expected" << i << " EQ_BUFFER actual" << i << "\n";
    }
    return success();
}

}
