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
  int v6 = 4;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 4;
      v8 = v9;
      break;
    }
    case 0:
      {
      int v10 = 0;
      bool v11 = v2 != v10;
      int v12;
      if (v11) {
        int v13 = 3;
        int v14 = v3 % v13;
        int v15 = 3;
        int v16 = v0 + v15;
        int v17;
        v17 = v16;
        switch (v14) {
          default:
            {
            int v18 = 0;
            v17 = v18;
            break;
          }
          case 0:
            {
            int v19 = 1;
            int v20 = v0 + v19;
            v17 = v20;
            break;
          }
          case 1:
            {
            int v21 = 4;
            int v22 = v0 + v21;
            v17 = v22;
            break;
          }
        }
        int v23 = 0;
        int v24 = v0 + v23;
        v12 = v17;
      } else {
        v12 = v0;
      }
      int v25 = 3;
      int v26 = v0 + v25;
      v8 = v12;
      break;
    }
    case 1:
      {
      int v27 = 3;
      int v28 = v3 % v27;
      int v29 = 1;
      int v30 = v0 + v29;
      int v31;
      v31 = v30;
      switch (v28) {
        case 0:
          {
          int v32 = 0;
          int v33 = 0;
          int v34;
          int v35;
          v34 = v32;
          v35 = v33;
          while (true) {
            int v36 = 4;
            int v37 = v3 % v36;
            int v38 = 1;
            int v39 = v37 + v38;
            bool v40 = v35 < v39;
            v34 = v34;
            v35 = v35;
            if (!v40) break;
            int v41 = 2;
            int v42 = v0 + v41;
            int v43 = 1;
            int v44 = v35 + v43;
            v34 = v42;
            v35 = v44;
            break;
            ;
          }
          v31 = v34;
        }
        default:
          {
          int v45 = 0;
          int v46 = 0;
          int v47;
          int v48;
          v47 = v45;
          v48 = v46;
          while (true) {
            int v49 = 4;
            int v50 = v3 % v49;
            int v51 = 1;
            int v52 = v50 + v51;
            bool v53 = v48 < v52;
            v47 = v47;
            v48 = v48;
            if (!v53) break;
            int v54 = 1;
            int v55 = v48 + v54;
            v47 = v0;
            v48 = v55;
            continue;
            ;
          }
          int v56 = 1;
          int v57 = v0 + v56;
          v31 = v47;
          break;
        }
        case 1:
          {
          int v58 = 0;
          bool v59 = v2 != v58;
          int v60;
          if (v59) {
            int v61 = 2;
            int v62 = v0 + v61;
            v60 = v62;
          } else {
            int v63 = 1;
            int v64 = v0 + v63;
            v60 = v64;
          }
          v31 = v60;
          break;
        }
        case 2:
          {
          int v65 = 0;
          int v66 = 0;
          int v67;
          int v68;
          v67 = v65;
          v68 = v66;
          while (true) {
            int v69 = 4;
            int v70 = v3 % v69;
            int v71 = 1;
            int v72 = v70 + v71;
            bool v73 = v68 < v72;
            v67 = v67;
            v68 = v68;
            if (!v73) break;
            int v74 = 2;
            int v75 = v0 + v74;
            int v76 = 1;
            int v77 = v68 + v76;
            v67 = v75;
            v68 = v77;
            break;
            ;
          }
          int v78 = 1;
          v31 = v67;
          break;
        }
      }
      v8 = v31;
      break;
    }
  }
  bool v79 = true;
  int v80 = simt_wave_count_bits(v79);
  int v81 = 0;
  int v82 = v81 + v0;
  v1[v82] = v80;
  return;
}

kernel void kernel_main(device int* v83 [[buffer(0)]], device int* v84 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v85 = static_cast<int>(__simt_tid3.x);
  int v86 = 0;
  int v87 = v86 + v85;
  int v88 = v84[v87];
  int v89 = 4;
  int v90 = v89 + v85;
  int v91 = v84[v90];
  helper0(v85, v83, v88, v91, static_cast<int>(__simt_tid3.x));
  int v92 = 8;
  int v93 = v92 + v85;
  int v94 = v84[v93];
  int v95;
  v95 = v85;
  switch (v94) {
    default:
      {
      v95 = v85;
      break;
    }
    case 0:
      {
      int v96 = 3;
      int v97 = v85 + v96;
      v95 = v97;
      break;
    }
    case 1:
      {
      int v98 = 12;
      int v99 = v98 + v85;
      int v100 = v84[v99];
      int v101 = 0;
      int v102;
      v102 = v101;
      switch (v100) {
        case 0:
          {
          int v103 = 16;
          int v104 = v103 + v85;
          int v105 = v84[v104];
          int v106 = 0;
          bool v107 = v105 != v106;
          int v108;
          if (v107) {
            int v109 = 0;
            int v110 = v85 + v109;
            v108 = v110;
          } else {
            int v111 = 2;
            v108 = v111;
          }
          v102 = v108;
          break;
        }
        default:
          {
          int v112 = 20;
          int v113 = v112 + v85;
          int v114 = v84[v113];
          int v115;
          v115 = v85;
          switch (v114) {
            case 0:
              {
              v115 = v85;
            }
            case 1:
              {
              v115 = v85;
              break;
            }
            case 2:
              {
              int v116 = 2;
              v115 = v116;
              break;
            }
            default:
              {
              v115 = v85;
              break;
            }
          }
          bool v117 = true;
          v102 = v115;
          break;
        }
        case 1:
          {
          int v118 = 24;
          int v119 = v118 + v85;
          int v120 = v84[v119];
          int v121 = 4;
          int v122 = v85 + v121;
          int v123;
          v123 = v122;
          switch (v120) {
            case 0:
              {
              v123 = v85;
            }
            case 1:
              {
              int v124 = 3;
              v123 = v124;
              break;
            }
            default:
              {
              int v125 = 0;
              int v126 = v85 + v125;
              v123 = v126;
              break;
            }
          }
          bool v127 = true;
          v102 = v123;
          break;
        }
      }
      bool v128 = true;
      v95 = v102;
      break;
    }
  }
  bool v129 = true;
  int v130 = 16;
  int v131 = v130 + v85;
  bool v132 = true;
  int v133 = simt_wave_count_bits(v132);
  v83[v131] = v133;
  int v134 = 28;
  int v135 = v134 + v85;
  int v136 = v84[v135];
  int v137 = 0;
  bool v138 = v136 != v137;
  int v139;
  if (v138) {
    int v140 = 32;
    int v141 = v140 + v85;
    int v142 = v84[v141];
    int v143 = 0;
    bool v144 = v142 != v143;
    int v145;
    if (v144) {
      int v146 = 36;
      int v147 = v146 + v85;
      int v148 = v84[v147];
      int v149 = 0;
      bool v150 = v148 != v149;
      int v151;
      if (v150) {
        int v152 = 0;
        v151 = v152;
      } else {
        uint v153 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v154 = (int)(v153);
        v151 = v154;
      }
      v145 = v151;
    } else {
      int v155 = 40;
      int v156 = v155 + v85;
      int v157 = v84[v156];
      uint v158 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v159 = (int)(v158);
      int v160;
      v160 = v159;
      switch (v157) {
        case 0:
          {
          v160 = v85;
          break;
        }
        case 1:
          {
          v160 = v85;
          break;
        }
        case 2:
          {
          int v161 = 0;
          v160 = v161;
          break;
        }
        default:
          {
          v160 = v85;
          break;
        }
      }
      bool v162 = true;
      v145 = v160;
    }
    v139 = v145;
  } else {
    uint v163 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v164 = (int)(v163);
    v139 = v164;
  }
  int v165 = 32;
  int v166 = v165 + v85;
  bool v167 = true;
  int v168 = simt_wave_count_bits(v167);
  v83[v166] = v168;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 44; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
