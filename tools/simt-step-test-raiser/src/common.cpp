#include "common.h"

#include <cstdio>
#include <llvm/Support/CommandLine.h>
#include <mlir/Tools/mlir-translate/Translation.h>
#include <mlir/Tools/mlir-translate/MlirTranslateMain.h>

#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/Operation.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include "llvm/ADT/TypeSwitch.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/LogicalResult.h"
#include "llvm/Support/raw_ostream.h"
#include <mlir/Dialect/Arith/IR/Arith.h>
#include <mlir/Dialect/Func/IR/FuncOps.h>
#include <mlir/Dialect/Math/IR/Math.h>
#include <mlir/Dialect/Vector/IR/VectorOps.h>

#include <mlir/InitAllTranslations.h>
#include "mlir/Support/IndentedOstream.h"


using namespace simt::test_raiser;
using namespace llvm;
using namespace mlir;

namespace simt::test_raiser {

BaseRaiser::BaseRaiser(raw_ostream& o): os((raw_indented_ostream&)(o)) {};

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

/**
Uses function overloading to choose the correct printing function for each
operation type.
*/
LogicalResult BaseRaiser::emitOp(mlir::Operation* op){
    LogicalResult res = llvm::TypeSwitch<Operation&, LogicalResult>(*op)
        .Case<func::FuncOp, func::ReturnOp, ModuleOp>([&](auto op){return printOp(op);})
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

LogicalResult BaseRaiser::printOp(func::FuncOp& op){
    if (op.getSymName() == "main" && failed(emitMainFuncTop(op))) return failure();
    os << "{";
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

LogicalResult BaseRaiser::printOp(ModuleOp& op){
    for (auto &subop : op.getBodyRegion().front()){
        if (failed(emitOp(&subop))) {
            return failure();
        }
    }

    return success();
}




//////////// Other helper functions ////////////

LogicalResult emitAmberHarness(BaseRaiser& b, Operation* op, std::string lang, int threadx, int thready, int threadz){
    b.os << "#!amber\n"
            "DEVICE_FEATURE SubgroupSizeControl.subgroupSizeControl\n"
            "SET ENGINE_DATA fence_timeout_ms 10000\n"
            "SHADER compute compute_shader " << lang << " TARGET_ENV vulkan1.1\n";
    
    if (failed(b.emitOp(op))) {
        return failure();
    }
    
    b.os << "\nEND\n"
        "PIPELINE compute pipeline\n"
        "  ATTACH compute_shader\n"
        "END\n"
        << "RUN " << threadx << " " << thready << " " << threadz << "\n";
    return success();
}

}
