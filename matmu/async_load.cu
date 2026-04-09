#define CCCL_IGNORE_DEPRECATED_CPP_DIALECT

#include <assert.h>
#include <stdio.h>
#include <cooperative_groups.h>
#include <cooperative_groups/memcpy_async.h>

namespace cg = cooperative_groups;

const int BUF_SIZE = 16;

#define gpuErrchk(ans) { gpuAssert((ans), __FILE__, __LINE__); }
inline void gpuAssert(cudaError_t code, const char *file, int line, bool abort=true)
{
   if (code != cudaSuccess) 
   {
      fprintf(stderr,"GPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);
      if (abort) exit(code);
   }
}

__global__ void kernel_main(int* input, int* output){
    cg::thread_block block = cg::this_thread_block();
    // Cooperatively issue the copies across all threads.
    cg::memcpy_async(block, output, input, BUF_SIZE * sizeof(int));
    cg::wait(block); // Waits for all copies to complete.
    __syncthreads();
}

int main(void){
    int input[BUF_SIZE] = { 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 };
    int output[BUF_SIZE] = { 1 };
    int* dev_input;
    int* dev_output;

    cudaStream_t stream;
    gpuErrchk(cudaStreamCreate(&stream));

    gpuErrchk(cudaMallocAsync(&dev_input, sizeof(input), stream));
    gpuErrchk(cudaMallocAsync(&dev_output, sizeof(output), stream));
    gpuErrchk(cudaMemcpyAsync(dev_input, input, sizeof(input), cudaMemcpyHostToDevice, stream));
    kernel_main<<<1, 32>>>(dev_input, dev_output);
    gpuErrchk(cudaPeekAtLastError());
    gpuErrchk(cudaStreamSynchronize(stream));
    gpuErrchk(cudaMemcpy(output, dev_output, sizeof(output), cudaMemcpyDeviceToHost));

    for (int i = 0; i < BUF_SIZE; i++){
        printf("[%d] expected=%d, actual=%d\n", i, input[i], output[i]);
    }

    gpuErrchk(cudaFree(dev_input));
    gpuErrchk(cudaFree(dev_output));
    gpuErrchk(cudaStreamDestroy(stream));


    
}