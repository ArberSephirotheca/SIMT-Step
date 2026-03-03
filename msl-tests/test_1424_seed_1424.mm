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
  int v4 = 0;
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 0;
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      int v10 = 0;
      int v11 = 0;
      int v12;
      int v13;
      v12 = v10;
      v13 = v11;
      while (true) {
        int v14 = 4;
        int v15 = v3 % v14;
        int v16 = 1;
        int v17 = v15 + v16;
        bool v18 = v13 < v17;
        v12 = v12;
        v13 = v13;
        if (!v18) break;
        int v19 = 4;
        int v20 = 1;
        int v21 = v13 + v20;
        v12 = v19;
        v13 = v21;
      }
      v9 = v12;
    } else {
      int v22 = 2;
      int v23 = v3 % v22;
      int v24;
      v24 = v0;
      switch (v23) {
        default:
          {
          int v25 = 3;
          int v26 = v0 + v25;
          v24 = v26;
        }
        case 0:
          {
          int v27 = 2;
          v24 = v27;
          break;
        }
      }
      int v28 = 2;
      int v29 = v0 + v28;
      v9 = v24;
    }
    int v30 = 0;
    int v31 = v0 + v30;
    v6 = v9;
  } else {
    int v32 = 0;
    bool v33 = v2 != v32;
    int v34;
    if (v33) {
      v34 = v0;
    } else {
      int v35 = 0;
      int v36 = 0;
      int v37;
      int v38;
      v37 = v35;
      v38 = v36;
      while (true) {
        int v39 = 4;
        int v40 = v3 % v39;
        int v41 = 1;
        int v42 = v40 + v41;
        bool v43 = v38 < v42;
        v37 = v37;
        v38 = v38;
        if (!v43) break;
        int v44 = 3;
        int v45 = v0 + v44;
        int v46 = 1;
        int v47 = v38 + v46;
        v37 = v45;
        v38 = v47;
      }
      int v48 = 1;
      v34 = v37;
    }
    int v49 = 1;
    v6 = v34;
  }
  bool v50 = true;
  int v51 = simt_wave_count_bits(v50);
  int v52 = 0;
  int v53 = v52 + v0;
  v1[v53] = v51;
  return;
}

kernel void kernel_main(device int* v54 [[buffer(0)]], device int* v55 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v56 = static_cast<int>(__simt_tid3.x);
  int v57 = 0;
  int v58 = v57 + v56;
  int v59 = v55[v58];
  int v60 = 4;
  int v61 = v60 + v56;
  int v62 = v55[v61];
  helper0(v56, v54, v59, v62, static_cast<int>(__simt_tid3.x));
  int v63 = 0;
  int v64 = 0;
  int v65;
  int v66;
  v65 = v63;
  v66 = v64;
  while (true) {
    int v67 = 4;
    int v68 = v66 * v67;
    int v69 = v68 + v56;
    int v70 = 8;
    int v71 = v70 + v69;
    int v72 = v55[v71];
    int v73 = 0;
    bool v74 = v72 != v73;
    v65 = v65;
    v66 = v66;
    if (!v74) break;
    int v75 = v65 + v66;
    int v76 = 1;
    int v77 = v66 + v76;
    v65 = v75;
    v66 = v77;
    break;
    ;
  }
  bool v78 = true;
  int v79 = 16;
  int v80 = v79 + v56;
  bool v81 = true;
  int v82 = simt_wave_count_bits(v81);
  v54[v80] = v82;
  int v83 = 28;
  int v84 = v83 + v56;
  int v85 = v55[v84];
  int v86;
  v86 = v56;
  switch (v85) {
    case 0:
      {
      int v87 = 32;
      int v88 = v87 + v56;
      int v89 = v55[v88];
      int v90 = 0;
      bool v91 = v89 != v90;
      int v92;
      if (v91) {
        int v93 = 36;
        int v94 = v93 + v56;
        int v95 = v55[v94];
        int v96 = 0;
        bool v97 = v95 != v96;
        int v98;
        if (v97) {
          int v99 = 2;
          int v100 = v56 + v99;
          v98 = v100;
        } else {
          int v101 = 4;
          int v102 = v56 + v101;
          v98 = v102;
        }
        v92 = v98;
      } else {
        int v103 = 40;
        int v104 = v103 + v56;
        int v105 = v55[v104];
        int v106 = 2;
        int v107 = v56 + v106;
        int v108;
        v108 = v107;
        switch (v105) {
          case 0:
            {
            int v109 = 1;
            v108 = v109;
            break;
          }
          default:
            {
            int v110 = 1;
            int v111 = v56 + v110;
            v108 = v111;
            break;
          }
        }
        bool v112 = true;
        v92 = v108;
      }
      v86 = v92;
      break;
    }
    case 1:
      {
      int v113 = 44;
      int v114 = v113 + v56;
      int v115 = v55[v114];
      int v116;
      v116 = v56;
      switch (v115) {
        default:
          {
          v116 = v56;
          break;
        }
        case 0:
          {
          int v117 = 48;
          int v118 = v117 + v56;
          int v119 = v55[v118];
          int v120 = 0;
          bool v121 = v119 != v120;
          int v122;
          if (v121) {
            int v123 = 2;
            int v124 = v56 + v123;
            v122 = v124;
          } else {
            int v125 = 0;
            int v126 = v56 + v125;
            v122 = v126;
          }
          v116 = v122;
          break;
        }
      }
      bool v127 = true;
      v86 = v116;
      break;
    }
    default:
      {
      int v128 = 52;
      int v129 = v128 + v56;
      int v130 = v55[v129];
      int v131;
      v131 = v56;
      switch (v130) {
        default:
          {
          int v132 = 0;
          int v133 = 0;
          int v134;
          int v135;
          v134 = v132;
          v135 = v133;
          while (true) {
            int v136 = 4;
            int v137 = v135 * v136;
            int v138 = v137 + v56;
            int v139 = 56;
            int v140 = v139 + v138;
            int v141 = v55[v140];
            int v142 = 0;
            bool v143 = v141 != v142;
            v134 = v134;
            v135 = v135;
            if (!v143) break;
            int v144 = v134 + v135;
            int v145 = 1;
            int v146 = v135 + v145;
            v134 = v144;
            v135 = v146;
          }
          bool v147 = true;
          v131 = v134;
        }
        case 0:
          {
          int v148 = 76;
          int v149 = v148 + v56;
          int v150 = v55[v149];
          int v151 = 0;
          int v152 = v56 + v151;
          int v153;
          v153 = v152;
          switch (v150) {
            case 0:
              {
              int v154 = 4;
              int v155 = v56 + v154;
              v153 = v155;
              break;
            }
            default:
              {
              v153 = v56;
              break;
            }
            case 1:
              {
              int v156 = 4;
              v153 = v156;
              break;
            }
            case 2:
              {
              int v157 = 4;
              int v158 = v56 + v157;
              v153 = v158;
              break;
            }
          }
          bool v159 = true;
          v131 = v153;
          break;
        }
      }
      bool v160 = true;
      v86 = v131;
      break;
    }
  }
  bool v161 = true;
  int v162 = 32;
  int v163 = v162 + v56;
  bool v164 = true;
  int v165 = simt_wave_count_bits(v164);
  v54[v163] = v165;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
