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
    default:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11;
      v11 = v0;
      switch (v10) {
        case 0:
          {
          int v12 = 0;
          int v13 = 0;
          int v14;
          int v15;
          v14 = v12;
          v15 = v13;
          while (true) {
            int v16 = 4;
            int v17 = v3 % v16;
            int v18 = 1;
            int v19 = v17 + v18;
            bool v20 = v15 < v19;
            v14 = v14;
            v15 = v15;
            if (!v20) break;
            int v21 = 4;
            int v22 = v0 + v21;
            int v23 = 1;
            int v24 = v15 + v23;
            v14 = v22;
            v15 = v24;
            continue;
            ;
          }
          int v25 = 3;
          v11 = v14;
        }
        default:
          {
          int v26 = 0;
          int v27 = 0;
          int v28;
          int v29;
          v28 = v26;
          v29 = v27;
          while (true) {
            int v30 = 4;
            int v31 = v3 % v30;
            int v32 = 1;
            int v33 = v31 + v32;
            bool v34 = v29 < v33;
            v28 = v28;
            v29 = v29;
            if (!v34) break;
            int v35 = 3;
            int v36 = v0 + v35;
            int v37 = 1;
            int v38 = v29 + v37;
            v28 = v36;
            v29 = v38;
          }
          int v39 = 2;
          v11 = v28;
          break;
        }
        case 1:
          {
          int v40 = 4;
          int v41 = v3 % v40;
          int v42 = 4;
          int v43;
          v43 = v42;
          switch (v41) {
            case 0:
              {
              int v44 = 1;
              v43 = v44;
            }
            case 1:
              {
              int v45 = 0;
              v43 = v45;
            }
            default:
              {
              v43 = v0;
              break;
            }
            case 2:
              {
              int v46 = 3;
              int v47 = v0 + v46;
              v43 = v47;
              break;
            }
          }
          v11 = v43;
          break;
        }
      }
      int v48 = 2;
      int v49 = v0 + v48;
      v8 = v11;
      break;
    }
    case 0:
      {
      int v50 = 3;
      int v51 = v3 % v50;
      int v52 = 1;
      int v53 = v0 + v52;
      int v54;
      v54 = v53;
      switch (v51) {
        case 0:
          {
          int v55 = 4;
          int v56 = v3 % v55;
          int v57 = 3;
          int v58 = v0 + v57;
          int v59;
          v59 = v58;
          switch (v56) {
            default:
              {
              v59 = v0;
              break;
            }
            case 0:
              {
              int v60 = 4;
              v59 = v60;
              break;
            }
            case 1:
              {
              int v61 = 0;
              int v62 = v0 + v61;
              v59 = v62;
              break;
            }
            case 2:
              {
              int v63 = 2;
              int v64 = v0 + v63;
              v59 = v64;
              break;
            }
          }
          int v65 = 1;
          int v66 = v0 + v65;
          v54 = v59;
          break;
        }
        case 1:
          {
          int v67 = 0;
          int v68 = 0;
          int v69;
          int v70;
          v69 = v67;
          v70 = v68;
          while (true) {
            int v71 = 4;
            int v72 = v3 % v71;
            int v73 = 1;
            int v74 = v72 + v73;
            bool v75 = v70 < v74;
            v69 = v69;
            v70 = v70;
            if (!v75) break;
            int v76 = 1;
            int v77 = v70 + v76;
            v69 = v0;
            v70 = v77;
          }
          int v78 = 2;
          int v79 = v0 + v78;
          v54 = v69;
          break;
        }
        default:
          {
          int v80 = 2;
          int v81 = v3 % v80;
          int v82 = 4;
          int v83;
          v83 = v82;
          switch (v81) {
            default:
              {
              int v84 = 1;
              v83 = v84;
            }
            case 0:
              {
              v83 = v0;
              break;
            }
          }
          int v85 = 2;
          int v86 = v0 + v85;
          v54 = v83;
          break;
        }
      }
      int v87 = 0;
      int v88 = v0 + v87;
      v8 = v54;
      break;
    }
    case 1:
      {
      v8 = v0;
      break;
    }
    case 2:
      {
      int v89 = 0;
      int v90 = 0;
      int v91;
      int v92;
      v91 = v89;
      v92 = v90;
      while (true) {
        int v93 = 4;
        int v94 = v3 % v93;
        int v95 = 1;
        int v96 = v94 + v95;
        bool v97 = v92 < v96;
        v91 = v91;
        v92 = v92;
        if (!v97) break;
        int v98 = 3;
        int v99 = v3 % v98;
        int v100 = 0;
        int v101 = v0 + v100;
        int v102;
        v102 = v101;
        switch (v99) {
          case 0:
            {
            int v103 = 0;
            int v104 = v0 + v103;
            v102 = v104;
            break;
          }
          case 1:
            {
            v102 = v0;
            break;
          }
          case 2:
            {
            int v105 = 4;
            int v106 = v0 + v105;
            v102 = v106;
          }
          default:
            {
            int v107 = 0;
            v102 = v107;
            break;
          }
        }
        int v108 = 1;
        int v109 = 1;
        int v110 = v92 + v109;
        v91 = v102;
        v92 = v110;
      }
      int v111 = 2;
      int v112 = v0 + v111;
      v8 = v91;
      break;
    }
  }
  bool v113 = true;
  int v114 = simt_wave_count_bits(v113);
  int v115 = 0;
  int v116 = v115 + v0;
  v1[v116] = v114;
  return;
}

kernel void kernel_main(device int* v117 [[buffer(0)]], device int* v118 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v119 = static_cast<int>(__simt_tid3.x);
  int v120 = 0;
  int v121 = v120 + v119;
  int v122 = v118[v121];
  int v123 = 4;
  int v124 = v123 + v119;
  int v125 = v118[v124];
  helper0(v119, v117, v122, v125, static_cast<int>(__simt_tid3.x));
  int v126 = 8;
  int v127 = v126 + v119;
  int v128 = v118[v127];
  uint v129 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v130 = (int)(v129);
  int v131;
  v131 = v130;
  switch (v128) {
    default:
      {
      int v132 = 1;
      int v133 = v119 + v132;
      v131 = v133;
      break;
    }
    case 0:
      {
      int v134 = 12;
      int v135 = v134 + v119;
      int v136 = v118[v135];
      int v137;
      v137 = v119;
      switch (v136) {
        case 0:
          {
          int v138 = 16;
          int v139 = v138 + v119;
          int v140 = v118[v139];
          int v141;
          v141 = v119;
          switch (v140) {
            default:
              {
              int v142 = 1;
              int v143 = v119 + v142;
              v141 = v143;
            }
            case 0:
              {
              int v144 = 4;
              int v145 = v119 + v144;
              v141 = v145;
            }
            case 1:
              {
              int v146 = 1;
              int v147 = v119 + v146;
              v141 = v147;
              break;
            }
          }
          bool v148 = true;
          v137 = v141;
          break;
        }
        default:
          {
          int v149 = 20;
          int v150 = v149 + v119;
          int v151 = v118[v150];
          int v152;
          v152 = v119;
          switch (v151) {
            case 0:
              {
              v152 = v119;
              break;
            }
            default:
              {
              int v153 = 1;
              int v154 = v119 + v153;
              v152 = v154;
              break;
            }
            case 1:
              {
              int v155 = 2;
              v152 = v155;
              break;
            }
          }
          bool v156 = true;
          v137 = v152;
        }
        case 1:
          {
          int v157 = 0;
          int v158 = 0;
          int v159;
          int v160;
          v159 = v157;
          v160 = v158;
          while (true) {
            int v161 = 4;
            int v162 = v160 * v161;
            int v163 = v162 + v119;
            int v164 = 24;
            int v165 = v164 + v163;
            int v166 = v118[v165];
            int v167 = 0;
            bool v168 = v166 != v167;
            v159 = v159;
            v160 = v160;
            if (!v168) break;
            int v169 = v159 + v160;
            int v170 = 1;
            int v171 = v160 + v170;
            v159 = v169;
            v160 = v171;
          }
          bool v172 = true;
          v137 = v159;
          break;
        }
      }
      bool v173 = true;
      v131 = v137;
      break;
    }
  }
  bool v174 = true;
  int v175 = 16;
  int v176 = v175 + v119;
  bool v177 = true;
  int v178 = simt_wave_count_bits(v177);
  v117[v176] = v178;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
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
