#include "RaiseLanguages.h"
#include "common.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/LogicalResult.h"
#include <cstdio>


using namespace simt::test_raiser;
using namespace llvm;
using namespace mlir;

class GlslRaiser : public BaseRaiser {

public:

using BaseRaiser::BaseRaiser;

LogicalResult emitHarness(Operation* op) {
    return emitAmberHarness(*this, op, "GLSL", 1, 1, 1);
}

~GlslRaiser(){}

private:
LogicalResult emitMainFuncTop(func::FuncOp& f) override {
    os << "void main()";
    return success();
}

LogicalResult emitType(Type type) override {
    return success();
}


// LogicalResult emitBuiltin(Operation type) override {
//     return success();
// }

};

namespace simt::test_raiser {

LogicalResult emitRaised(Operation *op,raw_ostream &o, RaiserTarget target){
    switch (target){
        case simt::test_raiser::GLSL:
            GlslRaiser glsl(o);
            return glsl.emitHarness(op);
    }
    llvm_unreachable("Target not implemented");
    return failure();
}

}