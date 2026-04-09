#include <hip/hip_fp16.h>
#include <hip/hip_runtime.h>
#include <rocwmma/rocwmma.hpp>

#include <cstdio>
#include <cstdlib>
#include <vector>

using namespace rocwmma;

#define HIP_CHECK(expr) hipCheck((expr), __FILE__, __LINE__)

static inline void hipCheck(hipError_t code, const char* file, int line) {
    if(code != hipSuccess) {
        std::fprintf(stderr, "HIP error: %s %s:%d\n", hipGetErrorString(code), file, line);
        std::exit(static_cast<int>(code));
    }
}

__device__ __forceinline__ int wave_count_bits_true() {
    return static_cast<int>(__popcll(__ballot(1)));
}

__global__ void kernel_main(float* matrix_out, int* mask_out) {
    fragment<matrix_a, 16, 16, 16, half, col_major> a_frag;
    fragment<matrix_b, 16, 16, 16, half, row_major> b_frag;
    fragment<accumulator, 16, 16, 16, float> c_frag;

    __shared__ half ident[16 * 16];

    for(unsigned i = threadIdx.x; i < 16 * 16; i += warpSize) {
        ident[i] = __float2half(0.0f);
    }

    for(unsigned i = threadIdx.x; i < 16; i += warpSize) {
        ident[i + 16 * i] = __float2half(1.0f);
    }

    __syncthreads();

    fill_fragment(c_frag, 0.0f);
    load_matrix_sync(a_frag, ident, 16);

    // Intentionally non-uniform. This mirrors the CUDA test shape:
    // only part of the wave executes the B-fragment load before mma_sync.
    if(threadIdx.x < 16) {
        mask_out[threadIdx.x] = wave_count_bits_true();
        load_matrix_sync(b_frag, ident, 16);
    } else if(threadIdx.x < warpSize) {
        mask_out[threadIdx.x] = wave_count_bits_true();
    }

    mma_sync(c_frag, a_frag, b_frag, c_frag);
    store_matrix_sync(matrix_out, c_frag, 16, mem_row_major);
}

int main() {
    int device = 0;
    hipDeviceProp_t props{};
    HIP_CHECK(hipGetDeviceProperties(&props, device));

    const int threads = props.warpSize;
    if(threads <= 0 || threads > 64) {
        std::fprintf(stderr, "unexpected warpSize=%d\n", threads);
        return 1;
    }

    std::vector<float> host_matrix(16 * 16, -1.0f);
    std::vector<int> host_mask(threads, -1);

    float* dev_matrix = nullptr;
    int* dev_mask = nullptr;

    HIP_CHECK(hipMalloc(&dev_matrix, host_matrix.size() * sizeof(float)));
    HIP_CHECK(hipMalloc(&dev_mask, host_mask.size() * sizeof(int)));
    HIP_CHECK(hipMemset(dev_matrix, 0, host_matrix.size() * sizeof(float)));
    HIP_CHECK(hipMemset(dev_mask, 0xff, host_mask.size() * sizeof(int)));

    hipLaunchKernelGGL(kernel_main, dim3(1), dim3(threads), 0, 0, dev_matrix, dev_mask);
    HIP_CHECK(hipPeekAtLastError());
    HIP_CHECK(hipDeviceSynchronize());

    HIP_CHECK(hipMemcpy(host_matrix.data(), dev_matrix,
                        host_matrix.size() * sizeof(float), hipMemcpyDeviceToHost));
    HIP_CHECK(hipMemcpy(host_mask.data(), dev_mask,
                        host_mask.size() * sizeof(int), hipMemcpyDeviceToHost));

    std::printf("warpSize=%d\n", threads);
    std::printf("mask counts:\n");
    for(int i = 0; i < threads; ++i) {
        std::printf("%2d ", host_mask[i]);
    }
    std::printf("\n\nmatrix:\n");
    for(int i = 0; i < 16 * 16; ++i) {
        if(i % 16 == 0) {
            std::printf("\n");
        }
        std::printf("%4.0f ", host_matrix[i]);
    }
    std::printf("\n");

    HIP_CHECK(hipFree(dev_matrix));
    HIP_CHECK(hipFree(dev_mask));
    return 0;
}
