#include "common.h"

#include <cstdio>
#include <llvm/Support/CommandLine.h>
#include <mlir/Tools/mlir-translate/Translation.h>
#include <mlir/Tools/mlir-translate/MlirTranslateMain.h>

#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/Operation.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include "llvm/ADT/APFloat.h"
#include "llvm/ADT/TypeSwitch.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/LogicalResult.h"
#include "llvm/Support/raw_ostream.h"
#include <mlir/Dialect/Arith/IR/Arith.h>
#include <mlir/Dialect/Func/IR/FuncOps.h>
#include <mlir/Dialect/Math/IR/Math.h>
#include <mlir/Dialect/Vector/IR/VectorOps.h>

#include <mlir/InitAllTranslations.h>
#include <string>
#include "mlir/Support/IndentedOstream.h"


using namespace simt::test_raiser;
using namespace llvm;
using namespace mlir;

namespace simt::test_raiser {

BaseRaiser::BaseRaiser(raw_ostream& o): os(o) {
}

BaseRaiser::~BaseRaiser(){}

/*
Creates or gets a unique number for each value, which will be used to
create a variable for it.
*/
int BaseRaiser::getOrAddValueNumber(Value v){
    if (value_map.contains(v)){
        return value_map[v];
    }
    return value_map[v] = value_counter++;
}

std::string BaseRaiser::getOrAddValueName(Value v){
    return "v" + std::to_string(getOrAddValueNumber(v));
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


/**
Uses function overloading to choose the correct printing function for each
operation type.
*/
LogicalResult BaseRaiser::emitOp(mlir::Operation* op){
    LogicalResult res = llvm::TypeSwitch<Operation&, LogicalResult>(*op)
        .Case<
            func::FuncOp, func::ReturnOp, 
            ModuleOp, 
            arith::ConstantIntOp, arith::ConstantFloatOp>([&](auto op){return printOp(op);})
        .Default([&](Operation &) {
            return op->emitOpError("unsupported");
        });
    
    if (failed(res)){
        return failure();
    }
    
    if (!isa<func::FuncOp, ModuleOp>(op)){
        os << ";\n";
    }

    return success();
}


/////////////     Builtins     /////////////

//
LogicalResult BaseRaiser::printOp(ModuleOp& op){
    for (auto &subop : op.getBodyRegion().front()){
        if (failed(emitOp(&subop))) {
            return failure();
        }
    }

    return success();
}

///////////// 'func' dialect /////////////

//
LogicalResult BaseRaiser::printOp(func::FuncOp& op){
    if (op.getSymName() == "main" && failed(emitMainFuncTop(op))) return failure();
    os << "{\n";
    os.indent();
    for (auto &subop : op.getBody().front()){
        if (failed(emitOp(&subop))) {
            return failure();
        }
    }
    os.unindent();
    os << "}";
    return success();
}

LogicalResult BaseRaiser::printOp(func::ReturnOp& op){
    os << "return";
    return success();
}

///////////// 'arith' dialect /////////////

LogicalResult BaseRaiser::printOp(arith::ConstantIntOp& op){
    Value v = op.getResult();
    std::string vname = getOrAddValueName(v);
    if (failed(emitType(v.getType()))) return failure();
    os << " " << vname << " = ";
    if (failed(emitConst(v.getType(), op.value()))) return failure();

    return success();
}

LogicalResult BaseRaiser::printOp(arith::ConstantFloatOp& op){
    Value v = op.getResult();
    std::string vname = getOrAddValueName(v);
    if (failed(emitType(v.getType()))) return failure();
    os << " " << vname << " = ";
    if (failed(emitConst(v.getType(), op.value()))) return failure();

    return success();
}

//////////// Other helper functions ////////////

LogicalResult emitAmberHarness(BaseRaiser& b, Operation* op, std::string lang){
    b.os << "#!amber\n"
            "DEVICE_FEATURE SubgroupSizeControl.subgroupSizeControl\n"
            "DEVICE_FEATURE shaderInt64\n"
            "DEVICE_FEATURE shaderFloat64\n"
            "SET ENGINE_DATA fence_timeout_ms 10000\n"
            "SHADER compute compute_shader " << lang << " TARGET_ENV vulkan1.1\n";
    
    if (failed(b.emitShaderPrologue()) || failed(b.emitOp(op))) {
        return failure();
    }

    // Stolen from HlslEmitter.cpp
    int64_t ntx = 1, nty = 1, ntz = 1;
    if (auto mod = dyn_cast<ModuleOp>(op)){
        auto func = mod.lookupSymbol<func::FuncOp>("main");
        if (auto attr = func->getAttr("simt.num_threads")) {
            if (auto denseAttr = mlir::dyn_cast<DenseI64ArrayAttr>(attr)) {
                auto vals = denseAttr.asArrayRef();
                if (vals.size() == 3) {
                    ntx = vals[0];
                    nty = vals[1];
                    ntz = vals[2];
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
                    }
                }
            }
        }
    }
    
    b.os << "\nEND\n"
        "PIPELINE compute pipeline\n"
        "  ATTACH compute_shader\n"
        "END\n"
        << "RUN pipeline " << ntx << " " << nty << " " << ntz << "\n";
    return success();
}

}
