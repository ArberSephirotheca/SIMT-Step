__global__ void wave_any_kernel() {
  bool any_zero = __any_sync(0xffffffffu, threadIdx.x == 0u);
  if (any_zero) {
    return;
  }
}
