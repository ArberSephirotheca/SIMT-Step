

add_executable(simt-step-test-raiser
    src/main.cpp
    src/BaseRaiser.cpp
    src/RaiseGLSL.cpp
    src/RaiseCUDA_HIP.cpp
    src/RaiseMSL.cpp
)

llvm_update_compile_flags(simt-step-test-raiser)

target_link_libraries(simt-step-test-raiser
    PUBLIC
        simt-step
        MLIRIR
        MLIRParser
        LLVMSupport
        MLIRSupport
        MLIRArithDialect
        MLIRFuncDialect
        MLIRVectorDialect
        MLIRMathDialect
        MLIRTranslateLib
)

target_include_directories(simt-step-test-raiser
    PUBLIC
        src/
)

target_compile_definitions(simt-step-test-raiser
    PRIVATE
        SIMT_STEP_RUNNER_PATH="${CMAKE_SOURCE_DIR}/build/tools/simt-step-runner/simt-step-runner"
)

mlir_check_link_libraries(simt-step-test-raiser)

<<<<<<< HEAD
install(TARGETS simt-step-test-raiser RUNTIME DESTINATION bin)
=======
install(TARGETS simt-step-test-raiser RUNTIME DESTINATION bin)
>>>>>>> origin/CPSInterpeter-reimp
