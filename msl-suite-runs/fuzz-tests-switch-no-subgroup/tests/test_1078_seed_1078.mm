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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 4;
  int v9 = v3 % v8;
  uint v10 = simt_subgroup_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    case 0:
      {
      int v13 = 4;
      int v14 = v3 % v13;
      int v15 = 0;
      int v16;
      v16 = v15;
      switch (v14) {
        default:
          {
          int v17 = 0;
          int v18 = 0;
          int v19;
          int v20;
          v19 = v17;
          v20 = v18;
          while (true) {
            int v21 = 4;
            int v22 = v3 % v21;
            int v23 = 1;
            int v24 = v22 + v23;
            bool v25 = v20 < v24;
            v19 = v19;
            v20 = v20;
            if (!v25) break;
            int v26 = 1;
            int v27 = v20 + v26;
            v19 = v0;
            v20 = v27;
            continue;
            ;
          }
          v16 = v19;
        }
        case 0:
          {
          int v28 = 0;
          int v29 = 0;
          int v30;
          int v31;
          v30 = v28;
          v31 = v29;
          while (true) {
            int v32 = 4;
            int v33 = v3 % v32;
            int v34 = 1;
            int v35 = v33 + v34;
            bool v36 = v31 < v35;
            v30 = v30;
            v31 = v31;
            if (!v36) break;
            int v37 = 3;
            int v38 = v0 + v37;
            int v39 = 1;
            int v40 = v31 + v39;
            v30 = v38;
            v31 = v40;
          }
          v16 = v30;
          break;
        }
        case 1:
          {
          int v41 = 0;
          int v42 = 0;
          int v43;
          int v44;
          v43 = v41;
          v44 = v42;
          while (true) {
            int v45 = 4;
            int v46 = v3 % v45;
            int v47 = 1;
            int v48 = v46 + v47;
            bool v49 = v44 < v48;
            v43 = v43;
            v44 = v44;
            if (!v49) break;
            int v50 = 0;
            int v51 = v0 + v50;
            int v52 = 1;
            int v53 = v44 + v52;
            v43 = v51;
            v44 = v53;
          }
          v16 = v43;
          break;
        }
        case 2:
          {
          int v54 = 2;
          int v55 = v3 % v54;
          int v56;
          v56 = v0;
          switch (v55) {
            case 0:
              {
              int v57 = 3;
              v56 = v57;
              break;
            }
            case 1:
              {
              int v58 = 4;
              int v59 = v0 + v58;
              v56 = v59;
              break;
            }
            default:
              {
              v56 = v0;
              break;
            }
          }
          v16 = v56;
          break;
        }
      }
      int v60 = 4;
      int v61 = v0 + v60;
      v12 = v16;
    }
    case 1:
      {
      int v62 = 0;
      int v63 = 0;
      int v64;
      int v65;
      v64 = v62;
      v65 = v63;
      while (true) {
        int v66 = 4;
        int v67 = v3 % v66;
        int v68 = 1;
        int v69 = v67 + v68;
        bool v70 = v65 < v69;
        v64 = v64;
        v65 = v65;
        if (!v70) break;
        int v71 = 0;
        int v72 = 0;
        int v73;
        int v74;
        v73 = v71;
        v74 = v72;
        while (true) {
          int v75 = 4;
          int v76 = v3 % v75;
          int v77 = 1;
          int v78 = v76 + v77;
          bool v79 = v74 < v78;
          v73 = v73;
          v74 = v74;
          if (!v79) break;
          int v80 = 3;
          int v81 = 1;
          int v82 = v74 + v81;
          v73 = v80;
          v74 = v82;
        }
        int v83 = 1;
        int v84 = v65 + v83;
        v64 = v73;
        v65 = v84;
      }
      v12 = v64;
    }
    case 2:
      {
      int v85 = 0;
      bool v86 = v2 != v85;
      int v87;
      if (v86) {
        int v88 = 3;
        int v89 = v0 + v88;
        v87 = v89;
      } else {
        int v90 = 0;
        bool v91 = v2 != v90;
        int v92;
        if (v91) {
          int v93 = 1;
          v92 = v93;
        } else {
          int v94 = 1;
          int v95 = v0 + v94;
          v92 = v95;
        }
        v87 = v92;
      }
      v12 = v87;
      break;
    }
    default:
      {
      int v96 = 0;
      bool v97 = v2 != v96;
      int v98;
      if (v97) {
        int v99 = 0;
        int v100 = 0;
        int v101;
        int v102;
        v101 = v99;
        v102 = v100;
        while (true) {
          int v103 = 4;
          int v104 = v3 % v103;
          int v105 = 1;
          int v106 = v104 + v105;
          bool v107 = v102 < v106;
          v101 = v101;
          v102 = v102;
          if (!v107) break;
          int v108 = 2;
          int v109 = 1;
          int v110 = v102 + v109;
          v101 = v108;
          v102 = v110;
        }
        v98 = v101;
      } else {
        int v111 = 3;
        int v112 = v3 % v111;
        int v113 = 2;
        int v114 = v0 + v113;
        int v115;
        v115 = v114;
        switch (v112) {
          default:
            {
            v115 = v0;
            break;
          }
          case 0:
            {
            int v116 = 1;
            int v117 = v0 + v116;
            v115 = v117;
          }
          case 1:
            {
            int v118 = 1;
            v115 = v118;
          }
          case 2:
            {
            v115 = v0;
            break;
          }
        }
        v98 = v115;
      }
      v12 = v98;
      break;
    }
  }
  int v119 = 0;
  bool v120 = v2 != v119;
  int v121 = v120 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v122 [[buffer(0)]], device int* v123 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v124 = static_cast<int>(__simt_tid3.x);
  int v125 = 0;
  int v126 = v125 + v124;
  int v127 = v123[v126];
  int v128 = 4;
  int v129 = v128 + v124;
  int v130 = v123[v129];
  helper0(v124, v122, v127, v130, static_cast<int>(__simt_tid3.x));
  int v131 = 8;
  int v132 = v131 + v124;
  int v133 = v123[v132];
  int v134 = 2;
  int v135;
  v135 = v134;
  switch (v133) {
    case 0:
      {
      int v136 = 12;
      int v137 = v136 + v124;
      int v138 = v123[v137];
      int v139 = 0;
      bool v140 = v138 != v139;
      int v141;
      if (v140) {
        int v142 = 16;
        int v143 = v142 + v124;
        int v144 = v123[v143];
        int v145 = 3;
        int v146 = v124 + v145;
        int v147;
        v147 = v146;
        switch (v144) {
          case 0:
            {
            v147 = v124;
            break;
          }
          case 1:
            {
            int v148 = 0;
            v147 = v148;
            break;
          }
          case 2:
            {
            int v149 = 4;
            int v150 = v124 + v149;
            v147 = v150;
            break;
          }
          default:
            {
            int v151 = 1;
            v147 = v151;
            break;
          }
        }
        v141 = v147;
      } else {
        int v152 = 20;
        int v153 = v152 + v124;
        int v154 = v123[v153];
        int v155 = 0;
        int v156 = v124 + v155;
        int v157;
        v157 = v156;
        switch (v154) {
          case 0:
            {
            int v158 = 2;
            int v159 = v124 + v158;
            v157 = v159;
            break;
          }
          default:
            {
            int v160 = 3;
            v157 = v160;
            break;
          }
        }
        v141 = v157;
      }
      v135 = v141;
    }
    default:
      {
      v135 = v124;
      break;
    }
    case 1:
      {
      int v161 = 1;
      int v162 = v124 + v161;
      v135 = v162;
      break;
    }
  }
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 24; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
