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
        int t13 = (t12 * 64);
        int t14 = (t13 + t0);
        int t15 = (128 + t14);
        int t16 = buf1[t15];
        bool t17 = (t16 != 0);
        if (!(t17)) break;
        int t18 = (t11 + t12);
        int t19 = (t12 + 1);
        int t20 = (t12 * 64);
        int t21 = (0 + t20);
        int t22 = (t21 + t0);
        int t23 = simt_wave_count_bits(true);
        buf0[t22] = t23;
        t11 = t18;
        t12 = t19;
      }
      t10 = t11;
    } else {
      int t24 = (448 + t0);
      int t25 = buf1[t24];
      bool t26 = (t25 != 0);
      int t27;
      if (t26) {
        int t28 = simt_subgroup_id(tid);
        int t29 = static_cast<int>(t28);
        t27 = t29;
      } else {
        int t30 = (t0 + 1);
        t27 = t30;
      }
      int t31 = (256 + t0);
      int t32 = simt_wave_count_bits(true);
      buf0[t31] = t32;
      t10 = t27;
    }
    int t33 = (512 + t0);
    int t34 = simt_wave_count_bits(true);
    buf0[t33] = t34;
    t6 = t10;
  } else {
    int t35 = (512 + t0);
    int t36 = buf1[t35];
    bool t37 = (t36 != 0);
    int t38;
    if (t37) {
      int t39 = (576 + t0);
      int t40 = buf1[t39];
      bool t41 = (t40 != 0);
      int t42;
      if (t41) {
        t42 = 0;
      } else {
        t42 = 3;
      }
      int t43 = (768 + t0);
      int t44 = simt_wave_count_bits(true);
      buf0[t43] = t44;
      t38 = t42;
    } else {
      int t45 = 0;
      int t46 = 0;
      while (true) {
        int t47 = (t46 * 64);
        int t48 = (t47 + t0);
        int t49 = (640 + t48);
        int t50 = buf1[t49];
        bool t51 = (t50 != 0);
        if (!(t51)) break;
        int t52 = (t45 + t46);
        int t53 = (t46 + 1);
        int t54 = (t46 * 64);
        int t55 = (1024 + t54);
        int t56 = (t55 + t0);
        int t57 = simt_wave_count_bits(true);
        buf0[t56] = t57;
        t45 = t52;
        t46 = t53;
      }
      t38 = t45;
    }
    int t58 = (1280 + t0);
    int t59 = simt_wave_count_bits(true);
    buf0[t58] = t59;
    t6 = t38;
  }
  int t60 = (1536 + t0);
  int t61 = simt_wave_count_bits(true);
  buf0[t60] = t61;
}
