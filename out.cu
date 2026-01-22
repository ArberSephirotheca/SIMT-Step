#include <cuda_runtime.h>
#define SIMT_SUBGROUP_WIDTH 32
static __device__ __forceinline__ int simt_lane_id(int tid) {
  return tid % SIMT_SUBGROUP_WIDTH;
}
static __device__ __forceinline__ int simt_subgroup_id(int tid) {
  return tid / SIMT_SUBGROUP_WIDTH;
}
static __device__ __forceinline__ unsigned simt_subgroup_mask() {
  unsigned lane = static_cast<unsigned>(threadIdx.x & 31);
  unsigned width = SIMT_SUBGROUP_WIDTH;
  if (width >= 32) return 0xffffffffu;
  unsigned base = (lane / width) * width;
  unsigned mask = ((1u << width) - 1u) << base;
  unsigned blockMask = (blockDim.x >= 32) ? 0xffffffffu : ((1u << blockDim.x) - 1u);
  return mask & blockMask;
}
static __device__ __forceinline__ int simt_wave_count_bits(bool pred) {
  unsigned mask = simt_subgroup_mask();
  return __popc(__ballot_sync(mask, pred));
}

static __device__ __forceinline__ int helper0(int arg0) {
  int t0 = (arg0 + 1);
  int t1 = (t0 % 2);
  int t2 = (t1 + 2);
  return t2;
}

extern "C" __global__ void main(int* buf0, int* buf1) {
  int tid = static_cast<int>(blockIdx.x * blockDim.x + threadIdx.x);
  int t0 = tid;
  int t1 = helper0(t0);
  int t2 = (128 + t0);
  buf0[t2] = t1;
  int t3 = (0 + t0);
  int t4 = buf1[t3];
  bool t5 = (t4 != 0);
  int t6;
  if (t5) {
    int t7 = (64 + t0);
    int t8 = buf1[t7];
    bool t9 = (t8 != 0);
    int t10;
    if (t9) {
      int t11 = 0;
      int t12 = 0;
      while (true) {
        if (!((<unsupported> != 0))) break;
        int t13 = (t11 + t12);
        int t14 = (t12 + 1);
        int t15 = (t12 * 64);
        int t16 = (0 + t15);
        int t17 = (t16 + t0);
        int t18 = simt_wave_count_bits(true);
        buf0[t17] = t18;
        t11 = t13;
        t12 = t14;
      }
      t10 = t11;
    } else {
      int t19 = (448 + t0);
      int t20 = buf1[t19];
      bool t21 = (t20 != 0);
      int t22;
      if (t21) {
        int t23 = simt_subgroup_id(tid);
        int t24 = static_cast<int>(t23);
        t22 = t24;
      } else {
        int t25 = (t0 + 1);
        t22 = t25;
      }
      int t26 = (256 + t0);
      int t27 = simt_wave_count_bits(true);
      buf0[t26] = t27;
      t10 = t22;
    }
    int t28 = (512 + t0);
    int t29 = simt_wave_count_bits(true);
    buf0[t28] = t29;
    t6 = t10;
  } else {
    int t30 = (512 + t0);
    int t31 = buf1[t30];
    bool t32 = (t31 != 0);
    int t33;
    if (t32) {
      int t34 = (576 + t0);
      int t35 = buf1[t34];
      bool t36 = (t35 != 0);
      int t37;
      if (t36) {
        t37 = 0;
      } else {
        t37 = 3;
      }
      int t38 = (768 + t0);
      int t39 = simt_wave_count_bits(true);
      buf0[t38] = t39;
      t33 = t37;
    } else {
      int t40 = 0;
      int t41 = 0;
      while (true) {
        if (!((<unsupported> != 0))) break;
        int t42 = (t40 + t41);
        int t43 = (t41 + 1);
        int t44 = (t41 * 64);
        int t45 = (1024 + t44);
        int t46 = (t45 + t0);
        int t47 = simt_wave_count_bits(true);
        buf0[t46] = t47;
        t40 = t42;
        t41 = t43;
      }
      t33 = t40;
    }
    int t48 = (1280 + t0);
    int t49 = simt_wave_count_bits(true);
    buf0[t48] = t49;
    t6 = t33;
  }
  int t50 = (1536 + t0);
  int t51 = simt_wave_count_bits(true);
  buf0[t50] = t51;
}
