#include "BaseRaiser.h"
#include "RaiseGLSL.h"
#include "RaiseCUDA_HIP.h"
#include "RaiseMSL.h"
#include "RaiseHLSL.h"
#include "mlir/IR/Operation.h"
#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"
#include "simt-step/semantics/SemanticsContext.h"
#include "simt-step/semantics/SimpleProgram.h"
#include "simt-step/Runner/InitYaml.h"

#include <cstdint>
#include <cstdio>
#include <iostream>
#include <llvm/Support/CommandLine.h>
#include <mlir/Tools/mlir-translate/Translation.h>
#include <mlir/Tools/mlir-translate/MlirTranslateMain.h>
#include "llvm/Support/LogicalResult.h"
#include "llvm/Support/raw_ostream.h"

#include "mlir/IR/DialectRegistry.h"
#include "mlir/Support/LLVM.h"
#include <mlir/Dialect/Arith/IR/Arith.h>
#include <mlir/Dialect/Func/IR/FuncOps.h>
#include <mlir/Dialect/Math/IR/Math.h>
#include <mlir/Dialect/Vector/IR/VectorOps.h>
#include <mlir/InitAllTranslations.h>

#include <string>
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

llvm::LogicalResult getExpectedBuffer(
    Operation* op, 
    std::vector<std::vector<int64_t>>& expectedBuffer, 
    std::vector<std::vector<int64_t>>& inputBuffer, 
    std::string path = "",
    unsigned subgroupWidth = 32){ // TODO: Find subgroup width of machine
    expectedBuffer.clear();

    DialectRegistry registry;
    insertSimtDialects(registry);

    int64_t ntx, nty, ntz;
    std::vector<int64_t> bufferIndicies;
    if(failed(simt::test_raiser::getMainInfo(op, ntx, nty, ntz, bufferIndicies))) return failure();
    if (bufferIndicies.size() == 0) return success();

    simt::semantics::RunOperationOptions options;
    options.entry = "main";
    options.lanes = ntx;
    options.subgroupWidth = subgroupWidth;

    simt::semantics::ExecutionPolicy policy;
    policy.controlFlow = simt::semantics::ExecutionMode::Collective;
    options.policy = &policy;

    std::vector<simt::semantics::BufferInitEntry> init_entries = {};

    if (path.empty()){
        for (int64_t i : bufferIndicies){
            simt::semantics::BufferOptions buf;
            buf.argIndex = i;
            buf.size = 16;
            buf.fill = 0;
            options.perBuffer.push_back(buf);
        }
    } else {
        simt::runner::InitFile init;
        std::string error;
        if (!simt::runner::loadInitYamlFile(path, init, error)){
            std::cerr << error << "\n";
            return failure();
        }
        for (auto& buf : init.buffers){
            simt::semantics::BufferOptions bufopt;
            if (buf.buffer.starts_with("buf") || buf.buffer.starts_with("arg")){
                bufopt.argIndex = std::stoul(buf.buffer.substr(3));
            }
            bufopt.size = buf.size;
            bufopt.fill = buf.fill;
            for (auto &ientry : buf.entries){
                init_entries.push_back({bufopt.argIndex, ientry.index, ientry.value});
            }

            options.perBuffer.push_back(bufopt);
        }
    }
    std::vector<simt::semantics::BufferResult> buffers;

    if (mlir::failed(simt::semantics::runOperationToBuffers(*op, {}, buffers, options, init_entries))) {
        return llvm::failure();
    }

    for (auto [i, buf] : llvm::enumerate(buffers)){
        expectedBuffer.push_back(buf.values);
        inputBuffer.push_back(std::vector<int64_t>(buf.values.size(), 0));
    }

    for (auto entry : init_entries){
        inputBuffer[entry.argIndex][entry.index] = entry.value;
    }

    return llvm::success();
}

auto makeTranslateFunction(
    LogicalResult func(Operation*, raw_ostream&, simt::test_raiser::HarnessProps),
    llvm::cl::opt<std::string>& bufferInitYaml,
    llvm::cl::opt<int>& subgroupWidth,
    llvm::cl::opt<bool>& noFloat64,
    llvm::cl::opt<bool>& noInterpreter,
    llvm::cl::opt<bool>& noWrapper,
    llvm::cl::opt<bool>& noInt64,
    llvm::cl::opt<bool>& noSizeControl,
    llvm::cl::opt<bool>& noCleanup){
    return [&, func](Operation *op, raw_ostream &output) {
                std::vector<std::vector<int64_t>> expbuf = {};
                std::vector<std::vector<int64_t>> inbuf = {};
                if (!noInterpreter){
                    if(failed(getExpectedBuffer(op, expbuf, inbuf, bufferInitYaml, subgroupWidth))) return failure();
                }
                simt::test_raiser::HarnessProps props {
                    .expected = expbuf,
                    .input = inbuf,
                    .subgroupWidth = subgroupWidth,
                    .noF64 = noFloat64,
                    .noWrapper = noWrapper,
                    .noI64 = noInt64,
                    .noSizeControl = noSizeControl,
                    .noCleanup = noCleanup
                };
                return func(op, output, props);
        };
}

int main(int argc, char** argv){

    llvm::cl::opt<std::string> bufferInitYaml(
      "buffer-init-yaml",
      llvm::cl::desc(
          "Path to YAML file with buffer initalization information. If not provided, buffer will start with default intialization."),
      llvm::cl::init(""));
    
    llvm::cl::opt<int> subgroupWidth(
        "subgroup-width",
        llvm::cl::desc("Width of subgroup"),
        llvm::cl::init(32)
    );

    llvm::cl::opt<bool> noFloat64(
        "no-f64",
        llvm::cl::desc(
            "Does not require device to support 64-bit (double precision) floats. "
            "Scripts that use them will not work."),
        llvm::cl::init(false)
    );

    llvm::cl::opt<bool> noInt64(
        "no-i64",
        llvm::cl::desc(
            "Does not require device to support 64-bit integers. "
            "Scripts that use them will not work."),
        llvm::cl::init(false)
    );

    llvm::cl::opt<bool> noSizeControl(
        "no-sizecontrol",
        llvm::cl::desc(
            "Does not require device to support subgroup size control. "
            "Scripts that use them will not work."),
        llvm::cl::init(false)
    );

    llvm::cl::opt<bool> noInterpreter(
        "no-interpreter",
        llvm::cl::desc(
            "Do not run interpeter to get expected values"),
        llvm::cl::init(false)
    );

    llvm::cl::opt<bool> noWrapper(
        "no-wrapper",
        llvm::cl::desc(
            "Do not emit the Python wrapper (when possible). Only works for GLSL, CUDA, HIP, and MSL."),
        llvm::cl::init(false)
    );

    llvm::cl::opt<bool> noCleanup(
        "no-cleanup",
        llvm::cl::desc(
            "When emity Python wrapper, do not emit code to clean up temporary files after execution. "
            "Only works for HLSL w/ DirectX."),
        llvm::cl::init(false)
    );

    TranslateFromMLIRRegistration t_glsl(
        "mlir-to-glsl-amber", "translate mlir to GLSL with Amber harness",
        makeTranslateFunction(
            simt::test_raiser::emitRaisedGLSL, 
            bufferInitYaml, subgroupWidth, noFloat64, noInterpreter, noWrapper, noInt64, noSizeControl, noCleanup),
        insertSimtDialects
    );

    TranslateFromMLIRRegistration t_cuda(
        "mlir-to-cuda", "translate mlir to CUDA with a CUDA test harness",
        makeTranslateFunction(
            simt::test_raiser::emitRaisedCUDA, 
            bufferInitYaml, subgroupWidth, noFloat64, noInterpreter, noWrapper, noInt64, noSizeControl, noCleanup),
        insertSimtDialects
    );

    TranslateFromMLIRRegistration t_hip(
        "mlir-to-hip", "translate mlir to HIP with a HIP test harness",
        makeTranslateFunction(
            simt::test_raiser::emitRaisedHIP, 
            bufferInitYaml, subgroupWidth, noFloat64, noInterpreter, noWrapper, noInt64, noSizeControl, noCleanup),
        insertSimtDialects
    );

    TranslateFromMLIRRegistration t_hlsl_amber(
        "mlir-to-hlsl-amber", "translate mlir to HLSL with a Amber test harness",
        makeTranslateFunction(
            simt::test_raiser::emitRaisedHLSLAmber, 
            bufferInitYaml, subgroupWidth, noFloat64, noInterpreter, noWrapper, noInt64, noSizeControl, noCleanup),
        insertSimtDialects
    );

    TranslateFromMLIRRegistration t_hlsl(
        "mlir-to-hlsl-directx", "translate mlir to HLSL with a DirectX C++ test harness",
        makeTranslateFunction(
            simt::test_raiser::emitRaisedHLSL, 
            bufferInitYaml, subgroupWidth, noFloat64, noInterpreter, noWrapper, noInt64, noSizeControl, noCleanup),
        insertSimtDialects
    );

    TranslateFromMLIRRegistration t_msl(
        "mlir-to-msl", "translate mlir to MSL with Metal test harness (or shader-only with --no-wrapper)",
        makeTranslateFunction(
            simt::test_raiser::emitRaisedMSL,
            bufferInitYaml, subgroupWidth, noFloat64, noInterpreter, noWrapper, noInt64, noSizeControl, noCleanup),
        insertSimtDialects
    );

    return llvm::failed(mlirTranslateMain(argc, argv, "SIMT-Step Test Raiser"));
}
