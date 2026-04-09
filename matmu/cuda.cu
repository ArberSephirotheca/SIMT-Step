#include <assert.h>
#include <stdio.h>
#include <mma.h>

using namespace nvcuda;

#define gpuErrchk(ans) { gpuAssert((ans), __FILE__, __LINE__); }
inline void gpuAssert(cudaError_t code, const char *file, int line, bool abort=true)
{
   if (code != cudaSuccess) 
   {
      fprintf(stderr,"GPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);
      if (abort) exit(code);
   }
}

// __global__ void kernel_main(int* input, float* output){
//     wmma::fragment<wmma::matrix_a, 16, 16, 16, half, wmma::col_major> a_frag;
//     wmma::fragment<wmma::matrix_b, 16, 16, 16, half, wmma::row_major> b_frag;
//     wmma::fragment<wmma::accumulator, 16, 16, 16, float> c_frag;

//     // Initialize the output to zero
//     wmma::fill_fragment(c_frag, 0.0f);

//     __shared__ half ident[256];
//     // for (int i = 0; i < 16; i++){
//     //     ident[i + 16 * i] = 1;
//     // }


//     // Load the inputs
//     wmma::load_matrix_sync(a_frag, ident, 16);
//     for (int i = 0; i < 2; i++){
//         // #pragma unroll 1 // This causes the loop to behave as expected
//         for (int j = 0; j < threadIdx.x + 1; j++){
//             if (j == 0){
//                 wmma::load_matrix_sync(b_frag, ident, 16);
//                 output[threadIdx.x] = __popc(__activemask());
//             }
//         }
//     }

//     // Perform the matrix multiplication
//     wmma::mma_sync(c_frag, a_frag, b_frag, c_frag);

//     // Store the output
//     wmma::store_matrix_sync(output, c_frag, 16, wmma::mem_row_major);
// }


__global__ void kernel_main(float* matrix_out, int* mask_out){
    wmma::fragment<wmma::matrix_a, 16, 16, 16, half, wmma::col_major> a_frag;
    wmma::fragment<wmma::matrix_b, 16, 16, 16, half, wmma::row_major> b_frag;
    wmma::fragment<wmma::accumulator, 16, 16, 16, float> c_frag;

    __shared__ half ident[256];

    for (int i = threadIdx.x; i < 256; i += 32)
        ident[i] = __float2half(0.0f);

    for (int i = threadIdx.x; i < 16; i += 32)
        ident[i + 16 * i] = __float2half(1.0f);

    __syncthreads();

    wmma::fill_fragment(c_frag, 0.0f);
    wmma::load_matrix_sync(a_frag, ident, 16);

    // intentionally non-uniform
    if (threadIdx.x < 16) {
        mask_out[threadIdx.x] = __popc(__activemask());
        wmma::load_matrix_sync(b_frag, ident, 16);
    } else {
        mask_out[threadIdx.x] = __popc(__activemask());
    }

    wmma::mma_sync(c_frag, a_frag, b_frag, c_frag);
    wmma::store_matrix_sync(matrix_out, c_frag, 16, wmma::mem_row_major);
}


int main(void){
    float host_matrix[256] = { 0.0f };
    int host_mask[32] = { 0 };
    float* dev_matrix = nullptr;
    int* dev_mask = nullptr;

    cudaStream_t stream;
    gpuErrchk(cudaStreamCreate(&stream));

    gpuErrchk(cudaMallocAsync(&dev_matrix, sizeof(host_matrix), stream));
    gpuErrchk(cudaMallocAsync(&dev_mask, sizeof(host_mask), stream));
    gpuErrchk(cudaMemsetAsync(dev_matrix, 0, sizeof(host_matrix), stream));
    gpuErrchk(cudaMemsetAsync(dev_mask, 0xff, sizeof(host_mask), stream));

    kernel_main<<<1, 32, 0, stream>>>(dev_matrix, dev_mask);
    gpuErrchk(cudaPeekAtLastError());
    gpuErrchk(cudaMemcpyAsync(host_matrix, dev_matrix, sizeof(host_matrix), cudaMemcpyDeviceToHost, stream));
    gpuErrchk(cudaMemcpyAsync(host_mask, dev_mask, sizeof(host_mask), cudaMemcpyDeviceToHost, stream));
    gpuErrchk(cudaStreamSynchronize(stream));

    printf("mask counts:\n");
    for (int i = 0; i < 32; i++){
        printf("%2d ", host_mask[i]);
    }
    printf("\n\nmatrix:\n");

    for (int i = 0; i < 256; i++){
        if (i % 16 == 0){
            printf("\n");
        }
        printf("%2.0f ", host_matrix[i]);
    }
    printf("\n");

    gpuErrchk(cudaFree(dev_matrix));
    gpuErrchk(cudaFree(dev_mask));
    gpuErrchk(cudaStreamDestroy(stream));


    
}
