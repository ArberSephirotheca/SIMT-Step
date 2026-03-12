#import <Foundation/Foundation.h>
#import <Metal/Metal.h>
#include <cstdint>
#include <cstdio>

static const char *kShaderSource = R"MSL(
#include <metal_stdlib>
using namespace metal;
#define SIMT_SUBGROUP_WIDTH 32
static inline int simt_lane_id(int tid) {
  return tid % SIMT_SUBGROUP_WIDTH;
}
static inline int simt_subgroup_id(int tid) {
  return tid / SIMT_SUBGROUP_WIDTH;
}
static inline int simt_wave_count_bits(bool pred) {
  return static_cast<int>(simd_sum(pred ? 1u : 0u));
}

inline void helper0(int v0, device int* v1, int v2, int v3, int __simt_tid){
  int v4 = 3;
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 2;
      int v10 = v3 % v9;
      int v11 = 3;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        case 0:
          {
          int v14 = 3;
          int v15 = v3 % v14;
          int v16 = 0;
          int v17;
          v17 = v16;
          switch (v15) {
            case 0:
              {
              int v18 = 0;
              v17 = v18;
              break;
            }
            case 1:
              {
              v17 = v0;
              break;
            }
            default:
              {
              int v19 = 1;
              v17 = v19;
              break;
            }
            case 2:
              {
              v17 = v0;
              break;
            }
          }
          v13 = v17;
          break;
        }
        default:
          {
          int v20 = 0;
          bool v21 = v2 != v20;
          int v22;
          if (v21) {
            int v23 = 2;
            int v24 = v0 + v23;
            v22 = v24;
          } else {
            v22 = v0;
          }
          v13 = v22;
          break;
        }
      }
      v8 = v13;
    }
    default:
      {
      int v25 = 3;
      v8 = v25;
    }
    case 1:
      {
      int v26 = 0;
      bool v27 = v2 != v26;
      int v28;
      if (v27) {
        int v29 = 3;
        int v30 = v0 + v29;
        v28 = v30;
      } else {
        int v31 = 0;
        int v32 = v0 + v31;
        v28 = v32;
      }
      v8 = v28;
      break;
    }
  }
  bool v33 = true;
  int v34 = simt_wave_count_bits(v33);
  int v35 = 0;
  int v36 = v35 + v0;
  v1[v36] = v34;
  return;
}

kernel void kernel_main(device int* v37 [[buffer(0)]], device int* v38 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v39 = static_cast<int>(__simt_tid3.x);
  int v40 = 0;
  int v41 = v40 + v39;
  int v42 = v38[v41];
  int v43 = 4;
  int v44 = v43 + v39;
  int v45 = v38[v44];
  helper0(v39, v37, v42, v45, static_cast<int>(__simt_tid3.x));
  int v46 = 2;
  int v47 = 2;
  int v48 = v39 + v47;
  int v49 = 8;
  int v50 = v49 + v39;
  int v51 = v38[v50];
  int v52 = 4;
  int v53;
  v53 = v52;
  switch (v51) {
    default:
      {
      v53 = v39;
      break;
    }
    case 0:
      {
      int v54 = 12;
      int v55 = v54 + v39;
      int v56 = v38[v55];
      int v57 = 0;
      bool v58 = v56 != v57;
      int v59;
      if (v58) {
        int v60 = 0;
        int v61 = v39 + v60;
        v59 = v61;
      } else {
        int v62 = 0;
        int v63 = 0;
        int v64;
        int v65;
        v64 = v62;
        v65 = v63;
        while (true) {
          int v66 = 4;
          int v67 = v65 * v66;
          int v68 = v67 + v39;
          int v69 = 16;
          int v70 = v69 + v68;
          int v71 = v38[v70];
          int v72 = 0;
          bool v73 = v71 != v72;
          v64 = v64;
          v65 = v65;
          if (!v73) break;
          int v74 = v64 + v65;
          int v75 = 1;
          int v76 = v65 + v75;
          bool v77 = true;
          v64 = v74;
          v65 = v76;
          break;
          ;
        }
        v59 = v64;
      }
      v53 = v59;
      break;
    }
  }
  int v78 = 36;
  int v79 = v78 + v39;
  int v80 = v38[v79];
  int v81 = 0;
  bool v82 = v80 != v81;
  int v83;
  if (v82) {
    int v84 = 40;
    int v85 = v84 + v39;
    int v86 = v38[v85];
    int v87;
    v87 = v39;
    switch (v86) {
      case 0:
        {
        int v88 = 0;
        int v89 = 0;
        int v90;
        int v91;
        v90 = v88;
        v91 = v89;
        while (true) {
          int v92 = 4;
          int v93 = v91 * v92;
          int v94 = v93 + v39;
          int v95 = 44;
          int v96 = v95 + v94;
          int v97 = v38[v96];
          int v98 = 0;
          bool v99 = v97 != v98;
          v90 = v90;
          v91 = v91;
          if (!v99) break;
          int v100 = v90 + v91;
          int v101 = 1;
          int v102 = v91 + v101;
          bool v103 = true;
          v90 = v100;
          v91 = v102;
        }
        v87 = v90;
        break;
      }
      default:
        {
        int v104 = 64;
        int v105 = v104 + v39;
        int v106 = v38[v105];
        int v107 = 0;
        int v108;
        v108 = v107;
        switch (v106) {
          case 0:
            {
            v108 = v39;
            break;
          }
          case 1:
            {
            int v109 = 3;
            int v110 = v39 + v109;
            v108 = v110;
            break;
          }
          default:
            {
            int v111 = 4;
            int v112 = v39 + v111;
            v108 = v112;
            break;
          }
          case 2:
            {
            int v113 = 1;
            v108 = v113;
            break;
          }
        }
        v87 = v108;
        break;
      }
      case 1:
        {
        int v114 = 68;
        int v115 = v114 + v39;
        int v116 = v38[v115];
        int v117;
        v117 = v39;
        switch (v116) {
          case 0:
            {
            int v118 = 0;
            v117 = v118;
            break;
          }
          case 1:
            {
            int v119 = 3;
            v117 = v119;
            break;
          }
          case 2:
            {
            v117 = v39;
            break;
          }
          default:
            {
            int v120 = 3;
            v117 = v120;
            break;
          }
        }
        v87 = v117;
        break;
      }
      case 2:
        {
        int v121 = 72;
        int v122 = v121 + v39;
        int v123 = v38[v122];
        int v124 = 0;
        int v125;
        v125 = v124;
        switch (v123) {
          case 0:
            {
            int v126 = 4;
            int v127 = v39 + v126;
            v125 = v127;
            break;
          }
          case 1:
            {
            int v128 = 3;
            int v129 = v39 + v128;
            v125 = v129;
            break;
          }
          case 2:
            {
            int v130 = 0;
            v125 = v130;
            break;
          }
          default:
            {
            int v131 = 3;
            int v132 = v39 + v131;
            v125 = v132;
            break;
          }
        }
        bool v133 = true;
        v87 = v125;
        break;
      }
    }
    bool v134 = true;
    int v135 = 16;
    int v136 = v135 + v39;
    bool v137 = true;
    int v138 = simt_wave_count_bits(v137);
    v37[v136] = v138;
    v83 = v87;
  } else {
    int v139 = 0;
    int v140 = 0;
    int v141;
    int v142;
    v141 = v139;
    v142 = v140;
    while (true) {
      int v143 = 4;
      int v144 = v142 * v143;
      int v145 = v144 + v39;
      int v146 = 76;
      int v147 = v146 + v145;
      int v148 = v38[v147];
      int v149 = 0;
      bool v150 = v148 != v149;
      v141 = v141;
      v142 = v142;
      if (!v150) break;
      int v151 = 3;
      int v152 = v141 + v151;
      int v153 = 1;
      int v154 = v142 + v153;
      bool v155 = true;
      int v156 = 32;
      int v157 = 4;
      int v158 = v142 * v157;
      int v159 = v156 + v158;
      int v160 = v159 + v39;
      bool v161 = true;
      int v162 = simt_wave_count_bits(v161);
      v37[v160] = v162;
      v141 = v152;
      v142 = v154;
    }
    v83 = v141;
  }
  int v163 = 48;
  int v164 = v163 + v39;
  bool v165 = true;
  int v166 = simt_wave_count_bits(v165);
  v37[v164] = v166;
  return;
}

)MSL";

int main() {
  @autoreleasepool {
    id<MTLDevice> device = MTLCreateSystemDefaultDevice();
    if (!device) {
      fprintf(stderr, "No Metal device available\n");
      return 1;
    }
    NSError *error = nil;
    NSString *source = [NSString stringWithUTF8String:kShaderSource];
    id<MTLLibrary> library = [device newLibraryWithSource:source options:nil error:&error];
    if (!library) {
      const char *msg = error ? [[error localizedDescription] UTF8String] : "unknown";
      fprintf(stderr, "newLibraryWithSource failed: %s\n", msg);
      return 1;
    }
    id<MTLFunction> kernel = [library newFunctionWithName:@"kernel_main"];
    if (!kernel) {
      fprintf(stderr, "Unable to find kernel_main in generated MSL\n");
      return 1;
    }
    id<MTLComputePipelineState> pipeline = [device newComputePipelineStateWithFunction:kernel error:&error];
    if (!pipeline) {
      const char *msg = error ? [[error localizedDescription] UTF8String] : "unknown";
      fprintf(stderr, "newComputePipelineStateWithFunction failed: %s\n", msg);
      return 1;
    }
    id<MTLCommandQueue> queue = [device newCommandQueue];
    if (!queue) {
      fprintf(stderr, "Unable to create command queue\n");
      return 1;
    }
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf1 = [device newBufferWithBytes:host_actual1 length:sizeof(host_actual1) options:MTLResourceStorageModeShared];
    if (!actual_buf1) {
      fprintf(stderr, "Unable to create input buffer 1\n");
      return 1;
    }
    id<MTLCommandBuffer> commandBuffer = [queue commandBuffer];
    id<MTLComputeCommandEncoder> encoder = [commandBuffer computeCommandEncoder];
    [encoder setComputePipelineState:pipeline];
    [encoder setBuffer:actual_buf0 offset:0 atIndex:0];
    [encoder setBuffer:actual_buf1 offset:0 atIndex:1];
    MTLSize threadgroups = MTLSizeMake(1, 1, 1);
    MTLSize threadsPerThreadgroup = MTLSizeMake(4, 1, 1);
    [encoder dispatchThreadgroups:threadgroups threadsPerThreadgroup:threadsPerThreadgroup];
    [encoder endEncoding];
    [commandBuffer commit];
    [commandBuffer waitUntilCompleted];
    if ([commandBuffer status] != MTLCommandBufferStatusCompleted) {
      fprintf(stderr, "Metal command buffer did not complete\n");
      return 1;
    }
    int32_t *actual0 = static_cast<int32_t *>([actual_buf0 contents]);
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
