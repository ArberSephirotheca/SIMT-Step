#include "RaiseLanguages.h"

#include <llvm/Support/CommandLine.h>
#include <mlir/Tools/mlir-translate/Translation.h>
#include <mlir/Tools/mlir-translate/MlirTranslateMain.h>
#include "llvm/Support/LogicalResult.h"

#include "mlir/Support/LLVM.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include <mlir/Dialect/Arith/IR/Arith.h>
#include <mlir/Dialect/Func/IR/FuncOps.h>
#include <mlir/Dialect/Math/IR/Math.h>
#include <mlir/Dialect/Vector/IR/VectorOps.h>

#include <mlir/InitAllTranslations.h>


using namespace mlir;

void insertSimtDialects(DialectRegistry &registry){
    registry.insert<
        simt::dialect::SimtStepDialect,
        arith::ArithDialect,
        func::FuncDialect,
        math::MathDialect,
        vector::VectorDialect>();
}

inline std::function<llvm::LogicalResult (Operation*, raw_ostream&)> transFuncCreator(simt::test_raiser::RaiserTarget r){
    return [r](Operation *op, raw_ostream &output) {
        return simt::test_raiser::emitRaised(op, output, r);
    };
}

int main(int argc, char** argv){

    TranslateFromMLIRRegistration t(
        "mlir-to-glsl-amber", "translate mlir to GLSL with Amber harness",
        transFuncCreator(simt::test_raiser::GLSL), insertSimtDialects
    );

    return llvm::failed(mlirTranslateMain(argc, argv, "SIMT-Step Test Raiser"));
}