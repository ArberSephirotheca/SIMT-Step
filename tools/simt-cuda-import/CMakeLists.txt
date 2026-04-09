find_package(Clang REQUIRED CONFIG)

add_executable(simt-cuda-import
    src/main.cpp
    lib/Lowering.cpp
    ${PROJECT_SOURCE_DIR}/lib/frontends/CUDA.cpp
)

set_target_properties(simt-cuda-import PROPERTIES OUTPUT_NAME simt-cuda-import)

llvm_update_compile_flags(simt-cuda-import)

if (TARGET clang-cpp)
  target_link_libraries(simt-cuda-import PRIVATE clang-cpp)
else()
  message(FATAL_ERROR "clang-cpp target not found; please ensure the monolithic Clang library is available")
endif()

target_link_libraries(simt-cuda-import
    PRIVATE
        simt-frontends-common
        simt-step
        MLIRSupport
        MLIRFuncDialect
        MLIRArithDialect
        MLIRMathDialect
        MLIRVectorDialect
        LLVMCore
)

target_include_directories(simt-cuda-import
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        ${CLANG_INCLUDE_DIRS}
        ${LLVM_INCLUDE_DIRS}
        ${MLIR_INCLUDE_DIRS}
)

if (TARGET clangTooling)
  target_link_libraries(simt-cuda-import PRIVATE clangTooling)
elseif(TARGET Clang::clangTooling)
  target_link_libraries(simt-cuda-import PRIVATE Clang::clangTooling)
else()
  message(STATUS "clangTooling target not found; relying on clang-cpp")
endif()
