#include <stdio.h>
#include <assert.h>
#include <cooperative_groups.h>

__global__ void test(int* t){
    auto global = make_uint3(blockDim.x * blockIdx.x + threadIdx.x, blockDim.y * blockIdx.y + threadIdx.y, blockDim.z * blockIdx.z + threadIdx.z);
    *t = 1;
    auto warp = cooperative_groups::tiled_partition<32>(cooperative_groups::this_thread_block());
    int lane = warp.thread_rank();
    int warp_id = warp.meta_group_rank();
    int warp_num = warp.meta_group_size();
}

int main(){

    int host_t[10] = { 0 };
    int* dev_t;
    cudaMalloc(&dev_t, sizeof(host_t));
    cudaMemcpy(dev_t, host_t, sizeof(host_t), cudaMemcpyHostToDevice);
    test<<<1, 1>>>(dev_t);
    cudaMemcpy(host_t, dev_t, sizeof(host_t), cudaMemcpyDeviceToHost);

    for (int i = 0; i < 10; i++){
        printf("%d ", host_t[i]);
    }
    printf("\n");
}