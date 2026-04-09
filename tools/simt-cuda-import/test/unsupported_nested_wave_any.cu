__global__ void wave_any_kernel() {
  if (threadIdx.x == 0u) {
    bool any_zero = __any_sync(0xffffffffu, true);
    if (any_zero) {
      return;
    }
  }
}
