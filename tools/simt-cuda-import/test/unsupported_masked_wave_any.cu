__global__ void wave_any_kernel() {
  bool any_zero = __any_sync(0x0000ffffu, threadIdx.x == 0u);
  if (any_zero) {
    return;
  }
}
