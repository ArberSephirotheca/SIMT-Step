#include "common.h"

#include <llvm/Support/CommandLine.h>
#include <mlir/Tools/mlir-translate/Translation.h>
#include <mlir/Tools/mlir-translate/MlirTranslateMain.h>

#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include "llvm/Support/LogicalResult.h"
#include "llvm/Support/raw_ostream.h"
#include <mlir/Dialect/Arith/IR/Arith.h>
#include <mlir/Dialect/Func/IR/FuncOps.h>
#include <mlir/Dialect/Math/IR/Math.h>
#include <mlir/Dialect/Vector/IR/VectorOps.h>

#include <mlir/InitAllTranslations.h>

using namespace simt::test_raiser;

namespace simt::test_raiser {
    BaseRaiser::BaseRaiser(llvm::raw_ostream& o) : os(o){
    };

    llvm::LogicalResult emitAmberHarnessPrologue(llvm::raw_ostream &o, std::string lang){
        o << "#!amber\nDEVICE_FEATURE SubgroupSizeControl.subgroupSizeControl\n"
            "SET ENGINE_DATA fence_timeout_ms 10000\n"
            "SHADER compute compute_shader " << lang << " TARGET_ENV vulkan1.1\n";
        return llvm::success();
    }

    llvm::LogicalResult emitAmberHarnessEpilogue(llvm::raw_ostream &o, int threadx, int thready, int threadz){
        o << "\nEND\n"
            "PIPELINE compute pipeline\n"
            "  ATTACH compute_shader\n"
            "END\n"
            << "RUN " << threadx << " " << thready << " " << threadz << "\n";
        return llvm::success();
    }
}
