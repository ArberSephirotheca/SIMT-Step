#include "RaiseLanguages.h"
#include "common.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/LogicalResult.h"

using namespace simt::test_raiser;
using namespace llvm;
using namespace mlir;

class GlslRaiser : public BaseRaiser {
    using BaseRaiser::BaseRaiser;

    public: 
    llvm::LogicalResult emitHarness(mlir::Operation* op) {
        if (failed(emitAmberHarnessPrologue(os, "GLSL"))) return failure();
        os << "Hello!\n";
        if (failed(emitAmberHarnessEpilogue(os, 1, 1, 1))) return failure();
        return success();
    }

};
namespace simt::test_raiser {
    llvm::LogicalResult emitRaised(mlir::Operation *op, llvm::raw_ostream &o, RaiserTarget target){
        switch (target){
            case simt::test_raiser::GLSL:
                GlslRaiser glsl(o);
                return glsl.emitHarness(op);
        }
    }
}