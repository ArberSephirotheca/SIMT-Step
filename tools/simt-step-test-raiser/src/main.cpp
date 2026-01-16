#include "BaseRaiser.h"
#include "RaiseGLSL.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include "simt-step/semantics/SimpleProgram.h"

#include <cstdint>
#include <llvm/Support/CommandLine.h>
#include <mlir/Tools/mlir-translate/Translation.h>
#include <mlir/Tools/mlir-translate/MlirTranslateMain.h>
#include "llvm/Support/LogicalResult.h"

#include "mlir/IR/DialectRegistry.h"
#include "mlir/Support/LLVM.h"
#include <mlir/Dialect/Arith/IR/Arith.h>
#include <mlir/Dialect/Func/IR/FuncOps.h>
#include <mlir/Dialect/Math/IR/Math.h>
#include <mlir/Dialect/Vector/IR/VectorOps.h>
#include <mlir/InitAllTranslations.h>

#include <vector>


using namespace mlir;
using namespace llvm;


void insertSimtDialects(DialectRegistry &registry){
    registry.insert<
        simt::dialect::SimtStepDialect,
        arith::ArithDialect,
        func::FuncDialect,
        math::MathDialect,
        vector::VectorDialect>();
}

llvm::LogicalResult getExpectedBuffer(Operation* op, std::vector<std::vector<int64_t>>& outBuffer){
    // TODO: Up to 2 buffers
    outBuffer.clear();

    DialectRegistry registry;
    insertSimtDialects(registry);

    int64_t ntx, nty, ntz;
    std::vector<int64_t> bufferIndicies;
    if(failed(simt::test_raiser::getMainInfo(op, ntx, nty, ntz, bufferIndicies))) return failure();
    if (bufferIndicies.size() == 0) return success();

    simt::semantics::RunOperationOptions options;
    options.entry = "main";
    options.lanes = ntx;
    options.subgroupWidth = 32;
    for (int64_t i : bufferIndicies){
        simt::semantics::BufferOptions buf;
        buf.argIndex = i;
        buf.size = 16;
        buf.fill = 0;
        options.perBuffer.push_back(buf);
    }
    std::vector<simt::semantics::BufferResult> buffers;

    if (mlir::failed(simt::semantics::runOperationToBuffers(*op, {}, buffers, options))) {
        return llvm::failure();
    }

    for (auto buf : buffers){
        outBuffer.push_back(buf.values);
    }

    return llvm::success();
}

enum RaiserTarget {
    GLSL
};
inline auto transFuncCreator(RaiserTarget target){
    switch (target) {
        case GLSL:
            return [](Operation *op, raw_ostream &output) {
                std::vector<std::vector<int64_t>> buf = {};
                if(failed(getExpectedBuffer(op, buf))) return failure();
                return simt::test_raiser::emitRaisedGLSL(op, output, buf);
            };
    }
}

int main(int argc, char** argv){

    TranslateFromMLIRRegistration t(
        "mlir-to-glsl-amber", "translate mlir to GLSL with Amber harness",
        transFuncCreator(GLSL), insertSimtDialects
    );

    return llvm::failed(mlirTranslateMain(argc, argv, "SIMT-Step Test Raiser"));
}
