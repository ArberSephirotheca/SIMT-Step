

add_executable(simt-step-test-raiser
    src/main.cpp
    src/BaseRaiser.cpp
    src/RaiseGLSL.cpp
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

mlir_check_link_libraries(simt-step-test-raiser)


install(TARGETS simt-step-test-raiser RUNTIME DESTINATION bin)