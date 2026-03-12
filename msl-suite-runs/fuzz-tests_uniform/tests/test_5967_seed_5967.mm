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
      bool v11 = v2 != v10;
      int v12;
      if (v11) {
        v12 = v0;
      } else {
        v12 = v0;
      }
      int v13 = 3;
      int v14 = v0 + v13;
      v9 = v12;
    } else {
      int v15 = 2;
      int v16 = v3 % v15;
      int v17 = 4;
      int v18;
      v18 = v17;
      switch (v16) {
        default:
          {
          int v19 = 2;
          int v20 = v0 + v19;
          v18 = v20;
          break;
        }
        case 0:
          {
          int v21 = 2;
          int v22 = v0 + v21;
          v18 = v22;
          break;
        }
        case 1:
          {
          int v23 = 0;
          int v24 = v0 + v23;
          v18 = v24;
          break;
        }
      }
      uint v25 = simt_subgroup_id(__simt_tid);
      int v26 = (int)(v25);
      v9 = v18;
    }
    uint v27 = simt_lane_id(__simt_tid);
    int v28 = (int)(v27);
    v6 = v9;
  } else {
    int v29 = 3;
    int v30 = v3 % v29;
    int v31;
    v31 = v0;
    switch (v30) {
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
          int v41 = 0;
          int v42 = v0 + v41;
          int v43 = 1;
          int v44 = v35 + v43;
          v34 = v42;
          v35 = v44;
          break;
          ;
        }
        int v45 = 3;
        int v46 = v0 + v45;
        v31 = v34;
        break;
      }
      default:
        {
        int v47 = 0;
        int v48 = 0;
        int v49;
        int v50;
        v49 = v47;
        v50 = v48;
        while (true) {
          int v51 = 4;
          int v52 = v3 % v51;
          int v53 = 1;
          int v54 = v52 + v53;
          bool v55 = v50 < v54;
          v49 = v49;
          v50 = v50;
          if (!v55) break;
          int v56 = 4;
          int v57 = v0 + v56;
          int v58 = 1;
          int v59 = v50 + v58;
          v49 = v57;
          v50 = v59;
        }
        v31 = v49;
        break;
      }
      case 1:
        {
        int v60 = 3;
        int v61 = v3 % v60;
        int v62;
        v62 = v0;
        switch (v61) {
          case 0:
            {
            int v63 = 2;
            v62 = v63;
          }
          default:
            {
            int v64 = 4;
            int v65 = v0 + v64;
            v62 = v65;
            break;
          }
          case 1:
            {
            int v66 = 3;
            int v67 = v0 + v66;
            v62 = v67;
            break;
          }
          case 2:
            {
            int v68 = 0;
            v62 = v68;
            break;
          }
        }
        int v69 = 2;
        v31 = v62;
        break;
      }
    }
    uint v70 = simt_subgroup_id(__simt_tid);
    int v71 = (int)(v70);
    v6 = v31;
  }
  bool v72 = true;
  int v73 = simt_wave_count_bits(v72);
  int v74 = 0;
  int v75 = v74 + v0;
  v1[v75] = v73;
  return;
}

kernel void kernel_main(device int* v76 [[buffer(0)]], device int* v77 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v78 = static_cast<int>(__simt_tid3.x);
  int v79 = 0;
  int v80 = v79 + v78;
  int v81 = v77[v80];
  int v82 = 4;
  int v83 = v82 + v78;
  int v84 = v77[v83];
  helper0(v78, v76, v81, v84, static_cast<int>(__simt_tid3.x));
  int v85 = 8;
  int v86 = v85 + v78;
  int v87 = v77[v86];
  int v88 = 4;
  int v89;
  v89 = v88;
  switch (v87) {
    case 0:
      {
      int v90 = 0;
      int v91 = 0;
      int v92;
      int v93;
      v92 = v90;
      v93 = v91;
      while (true) {
        int v94 = 4;
        int v95 = v93 * v94;
        int v96 = v95 + v78;
        int v97 = 12;
        int v98 = v97 + v96;
        int v99 = v77[v98];
        int v100 = 0;
        bool v101 = v99 != v100;
        v92 = v92;
        v93 = v93;
        if (!v101) break;
        int v102 = 32;
        int v103 = v102 + v78;
        int v104 = v77[v103];
        int v105 = 0;
        bool v106 = v104 != v105;
        int v107;
        if (v106) {
          v107 = v78;
        } else {
          int v108 = 0;
          int v109 = v78 + v108;
          v107 = v109;
        }
        int v110 = v92 + v107;
        int v111 = 1;
        int v112 = v93 + v111;
        v92 = v110;
        v93 = v112;
      }
      bool v113 = true;
      v89 = v92;
      break;
    }
    default:
      {
      int v114 = 36;
      int v115 = v114 + v78;
      int v116 = v77[v115];
      int v117 = 0;
      bool v118 = v116 != v117;
      int v119;
      if (v118) {
        v119 = v78;
      } else {
        int v120 = 40;
        int v121 = v120 + v78;
        int v122 = v77[v121];
        int v123 = 1;
        int v124 = v78 + v123;
        int v125;
        v125 = v124;
        switch (v122) {
          case 0:
            {
            int v126 = 2;
            v125 = v126;
            break;
          }
          case 1:
            {
            v125 = v78;
            break;
          }
          case 2:
            {
            int v127 = 0;
            int v128 = v78 + v127;
            v125 = v128;
          }
          default:
            {
            v125 = v78;
            break;
          }
        }
        bool v129 = true;
        v119 = v125;
      }
      v89 = v119;
      break;
    }
    case 1:
      {
      int v130 = 44;
      int v131 = v130 + v78;
      int v132 = v77[v131];
      int v133;
      v133 = v78;
      switch (v132) {
        case 0:
          {
          int v134 = 48;
          int v135 = v134 + v78;
          int v136 = v77[v135];
          int v137 = 0;
          bool v138 = v136 != v137;
          int v139;
          if (v138) {
            int v140 = 3;
            v139 = v140;
          } else {
            int v141 = 3;
            int v142 = v78 + v141;
            v139 = v142;
          }
          v133 = v139;
          break;
        }
        default:
          {
          int v143 = 52;
          int v144 = v143 + v78;
          int v145 = v77[v144];
          int v146;
          v146 = v78;
          switch (v145) {
            case 0:
              {
              int v147 = 3;
              v146 = v147;
              break;
            }
            case 1:
              {
              v146 = v78;
              break;
            }
            default:
              {
              int v148 = 2;
              int v149 = v78 + v148;
              v146 = v149;
              break;
            }
            case 2:
              {
              int v150 = 1;
              v146 = v150;
              break;
            }
          }
          bool v151 = true;
          v133 = v146;
          break;
        }
        case 1:
          {
          int v152 = 0;
          int v153 = 0;
          int v154;
          int v155;
          v154 = v152;
          v155 = v153;
          while (true) {
            int v156 = 4;
            int v157 = v155 * v156;
            int v158 = v157 + v78;
            int v159 = 56;
            int v160 = v159 + v158;
            int v161 = v77[v160];
            int v162 = 0;
            bool v163 = v161 != v162;
            v154 = v154;
            v155 = v155;
            if (!v163) break;
            int v164 = v154 + v155;
            int v165 = 1;
            int v166 = v155 + v165;
            v154 = v164;
            v155 = v166;
          }
          bool v167 = true;
          v133 = v154;
          break;
        }
      }
      bool v168 = true;
      v89 = v133;
      break;
    }
    case 2:
      {
      int v169 = 2;
      int v170 = v78 + v169;
      v89 = v170;
      break;
    }
  }
  bool v171 = true;
  int v172 = 16;
  int v173 = v172 + v78;
  bool v174 = true;
  int v175 = simt_wave_count_bits(v174);
  v76[v173] = v175;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
