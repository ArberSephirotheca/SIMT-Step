find_package(CUDAToolkit REQUIRED)

add_executable(simt-cuda-test
    main.cpp
)

target_include_directories(simt-cuda-test
    PRIVATE
        ${PROJECT_SOURCE_DIR}/include
        ${LLVM_INCLUDE_DIRS}
)

llvm_update_compile_flags(simt-cuda-test)

target_link_libraries(simt-cuda-test
    PRIVATE
    CUDA::cuda_driver
    CUDA::nvrtc
    LLVMSupport
)

target_compile_features(simt-cuda-test PRIVATE cxx_std_20)
target_compile_options(simt-cuda-test PRIVATE
    $<$<CXX_COMPILER_ID:GNU,Clang,AppleClang>:-fexceptions>
    $<$<CXX_COMPILER_ID:MSVC>:/EHsc>
)
