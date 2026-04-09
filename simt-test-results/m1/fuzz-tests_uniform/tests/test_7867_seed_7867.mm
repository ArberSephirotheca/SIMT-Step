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
  int v4 = 2;
  int v5 = 4;
  int v6 = v3 % v5;
  int v7 = 0;
  int v8;
  v8 = v7;
  switch (v6) {
    case 0:
      {
      int v9 = 2;
      int v10 = v3 % v9;
      int v11 = 3;
      int v12;
      v12 = v11;
      switch (v10) {
        case 0:
          {
          int v13 = 3;
          int v14 = v3 % v13;
          int v15 = 2;
          int v16;
          v16 = v15;
          switch (v14) {
            case 0:
              {
              int v17 = 1;
              int v18 = v0 + v17;
              v16 = v18;
              break;
            }
            case 1:
              {
              int v19 = 2;
              int v20 = v0 + v19;
              v16 = v20;
              break;
            }
            default:
              {
              int v21 = 1;
              v16 = v21;
              break;
            }
            case 2:
              {
              int v22 = 1;
              int v23 = v0 + v22;
              v16 = v23;
              break;
            }
          }
          v12 = v16;
        }
        case 1:
          {
          int v24 = 3;
          int v25 = v3 % v24;
          int v26 = 0;
          int v27 = v0 + v26;
          int v28;
          v28 = v27;
          switch (v25) {
            default:
              {
              int v29 = 1;
              int v30 = v0 + v29;
              v28 = v30;
              break;
            }
            case 0:
              {
              int v31 = 3;
              v28 = v31;
              break;
            }
            case 1:
              {
              int v32 = 4;
              v28 = v32;
              break;
            }
          }
          v12 = v28;
          break;
        }
        default:
          {
          int v33 = 0;
          int v34 = 0;
          int v35;
          int v36;
          v35 = v33;
          v36 = v34;
          while (true) {
            int v37 = 4;
            int v38 = v3 % v37;
            int v39 = 1;
            int v40 = v38 + v39;
            bool v41 = v36 < v40;
            v35 = v35;
            v36 = v36;
            if (!v41) break;
            int v42 = 3;
            int v43 = 1;
            int v44 = v36 + v43;
            v35 = v42;
            v36 = v44;
            break;
            ;
          }
          v12 = v35;
          break;
        }
      }
      int v45 = 4;
      int v46 = v0 + v45;
      v8 = v12;
    }
    default:
      {
      int v47 = 3;
      int v48 = v3 % v47;
      int v49 = 1;
      int v50;
      v50 = v49;
      switch (v48) {
        default:
          {
          int v51 = 0;
          bool v52 = v2 != v51;
          int v53;
          if (v52) {
            int v54 = 3;
            v53 = v54;
          } else {
            v53 = v0;
          }
          int v55 = 4;
          int v56 = v0 + v55;
          v50 = v53;
          break;
        }
        case 0:
          {
          int v57 = 0;
          bool v58 = v2 != v57;
          int v59;
          if (v58) {
            int v60 = 2;
            int v61 = v0 + v60;
            v59 = v61;
          } else {
            v59 = v0;
          }
          int v62 = 4;
          v50 = v59;
          break;
        }
        case 1:
          {
          int v63 = 0;
          bool v64 = v2 != v63;
          int v65;
          if (v64) {
            int v66 = 1;
            v65 = v66;
          } else {
            int v67 = 2;
            v65 = v67;
          }
          int v68 = 1;
          v50 = v65;
          break;
        }
      }
      int v69 = 4;
      int v70 = v0 + v69;
      v8 = v50;
    }
    case 1:
      {
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
        int v80 = 0;
        bool v81 = v2 != v80;
        int v82;
        if (v81) {
          v82 = v0;
        } else {
          int v83 = 0;
          int v84 = v0 + v83;
          v82 = v84;
        }
        int v85 = 2;
        int v86 = v0 + v85;
        int v87 = 1;
        int v88 = v74 + v87;
        v73 = v82;
        v74 = v88;
      }
      int v89 = 2;
      v8 = v73;
    }
    case 2:
      {
      int v90 = 2;
      int v91 = v3 % v90;
      int v92;
      v92 = v0;
      switch (v91) {
        case 0:
          {
          int v93 = 2;
          int v94 = v3 % v93;
          int v95;
          v95 = v0;
          switch (v94) {
            case 0:
              {
              int v96 = 1;
              int v97 = v0 + v96;
              v95 = v97;
              break;
            }
            default:
              {
              int v98 = 1;
              int v99 = v0 + v98;
              v95 = v99;
              break;
            }
          }
          int v100 = 4;
          v92 = v95;
          break;
        }
        case 1:
          {
          int v101 = 0;
          bool v102 = v2 != v101;
          int v103;
          if (v102) {
            int v104 = 2;
            v103 = v104;
          } else {
            int v105 = 0;
            v103 = v105;
          }
          int v106 = 3;
          v92 = v103;
          break;
        }
        default:
          {
          int v107 = 0;
          bool v108 = v2 != v107;
          int v109;
          if (v108) {
            int v110 = 2;
            int v111 = v0 + v110;
            v109 = v111;
          } else {
            int v112 = 0;
            v109 = v112;
          }
          int v113 = 4;
          int v114 = v0 + v113;
          v92 = v109;
          break;
        }
      }
      v8 = v92;
      break;
    }
  }
  bool v115 = true;
  int v116 = simt_wave_count_bits(v115);
  int v117 = 0;
  int v118 = v117 + v0;
  v1[v118] = v116;
  int v119 = 0;
  bool v120 = v2 != v119;
  int v121 = v120 ? v4 : v8;
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
  int v134 = 0;
  bool v135 = v133 != v134;
  int v136;
  if (v135) {
    uint v137 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v138 = (int)(v137);
    v136 = v138;
  } else {
    int v139 = 12;
    int v140 = v139 + v124;
    int v141 = v123[v140];
    uint v142 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v143 = (int)(v142);
    int v144;
    v144 = v143;
    switch (v141) {
      default:
        {
        int v145 = 16;
        int v146 = v145 + v124;
        int v147 = v123[v146];
        int v148 = 0;
        bool v149 = v147 != v148;
        int v150;
        if (v149) {
          int v151 = 2;
          int v152 = v124 + v151;
          v150 = v152;
        } else {
          int v153 = 3;
          int v154 = v124 + v153;
          v150 = v154;
        }
        v144 = v150;
        break;
      }
      case 0:
        {
        int v155 = 2;
        int v156 = v124 + v155;
        v144 = v156;
        break;
      }
    }
    bool v157 = true;
    v136 = v144;
  }
  int v158 = 16;
  int v159 = v158 + v124;
  bool v160 = true;
  int v161 = simt_wave_count_bits(v160);
  v122[v159] = v161;
  int v162 = 0;
  int v163 = 0;
  int v164;
  int v165;
  v164 = v162;
  v165 = v163;
  while (true) {
    int v166 = 4;
    int v167 = v165 * v166;
    int v168 = v167 + v124;
    int v169 = 20;
    int v170 = v169 + v168;
    int v171 = v123[v170];
    int v172 = 0;
    bool v173 = v171 != v172;
    v164 = v164;
    v165 = v165;
    if (!v173) break;
    int v174 = v164 + v165;
    int v175 = 1;
    int v176 = v165 + v175;
    v164 = v174;
    v165 = v176;
  }
  bool v177 = true;
  int v178 = 32;
  int v179 = v178 + v124;
  bool v180 = true;
  int v181 = simt_wave_count_bits(v180);
  v122[v179] = v181;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 40; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
