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
      uint v10 = simt_lane_id(__simt_tid);
      int v11 = (int)(v10);
      v9 = v11;
    } else {
      uint v12 = simt_lane_id(__simt_tid);
      int v13 = (int)(v12);
      v9 = v13;
    }
    uint v14 = simt_lane_id(__simt_tid);
    int v15 = (int)(v14);
    v6 = v9;
  } else {
    int v16 = 4;
    v6 = v16;
  }
  bool v17 = true;
  int v18 = simt_wave_count_bits(v17);
  int v19 = 0;
  int v20 = v19 + v0;
  v1[v20] = v18;
  int v21 = 3;
  int v22 = v3 % v21;
  int v23 = 0;
  int v24;
  v24 = v23;
  switch (v22) {
    case 0:
      {
      int v25 = 0;
      int v26 = 0;
      int v27;
      int v28;
      v27 = v25;
      v28 = v26;
      while (true) {
        int v29 = 4;
        int v30 = v3 % v29;
        int v31 = 1;
        int v32 = v30 + v31;
        bool v33 = v28 < v32;
        v27 = v27;
        v28 = v28;
        if (!v33) break;
        int v34 = 3;
        int v35 = v0 + v34;
        int v36 = 1;
        int v37 = v28 + v36;
        v27 = v35;
        v28 = v37;
      }
      v24 = v27;
      break;
    }
    default:
      {
      int v38 = 0;
      bool v39 = v2 != v38;
      int v40;
      if (v39) {
        v40 = v0;
      } else {
        int v41 = 0;
        bool v42 = v2 != v41;
        int v43;
        if (v42) {
          int v44 = 1;
          v43 = v44;
        } else {
          v43 = v0;
        }
        int v45 = 0;
        v40 = v43;
      }
      int v46 = 4;
      int v47 = v0 + v46;
      v24 = v40;
      break;
    }
    case 1:
      {
      int v48 = 4;
      int v49 = v3 % v48;
      int v50;
      v50 = v0;
      switch (v49) {
        case 0:
          {
          int v51 = 0;
          bool v52 = v2 != v51;
          int v53;
          if (v52) {
            v53 = v0;
          } else {
            int v54 = 1;
            int v55 = v0 + v54;
            v53 = v55;
          }
          int v56 = 3;
          v50 = v53;
        }
        case 1:
          {
          int v57 = 3;
          int v58 = v3 % v57;
          int v59;
          v59 = v0;
          switch (v58) {
            default:
              {
              int v60 = 4;
              int v61 = v0 + v60;
              v59 = v61;
            }
            case 0:
              {
              int v62 = 1;
              v59 = v62;
              break;
            }
            case 1:
              {
              v59 = v0;
              break;
            }
          }
          int v63 = 4;
          int v64 = v0 + v63;
          v50 = v59;
          break;
        }
        default:
          {
          int v65 = 2;
          int v66 = v3 % v65;
          int v67 = 3;
          int v68 = v0 + v67;
          int v69;
          v69 = v68;
          switch (v66) {
            default:
              {
              int v70 = 2;
              int v71 = v0 + v70;
              v69 = v71;
            }
            case 0:
              {
              int v72 = 2;
              v69 = v72;
            }
            case 1:
              {
              int v73 = 0;
              v69 = v73;
              break;
            }
          }
          int v74 = 3;
          int v75 = v0 + v74;
          v50 = v69;
          break;
        }
        case 2:
          {
          int v76 = 2;
          int v77 = v3 % v76;
          int v78 = 0;
          int v79 = v0 + v78;
          int v80;
          v80 = v79;
          switch (v77) {
            case 0:
              {
              int v81 = 4;
              v80 = v81;
              break;
            }
            case 1:
              {
              v80 = v0;
              break;
            }
            default:
              {
              int v82 = 0;
              v80 = v82;
              break;
            }
          }
          v50 = v80;
          break;
        }
      }
      int v83 = 2;
      int v84 = v0 + v83;
      v24 = v50;
      break;
    }
    case 2:
      {
      int v85 = 0;
      bool v86 = v2 != v85;
      int v87;
      if (v86) {
        int v88 = 0;
        int v89 = 0;
        int v90;
        int v91;
        v90 = v88;
        v91 = v89;
        while (true) {
          int v92 = 4;
          int v93 = v3 % v92;
          int v94 = 1;
          int v95 = v93 + v94;
          bool v96 = v91 < v95;
          v90 = v90;
          v91 = v91;
          if (!v96) break;
          int v97 = 1;
          int v98 = v0 + v97;
          int v99 = 1;
          int v100 = v91 + v99;
          v90 = v98;
          v91 = v100;
        }
        v87 = v90;
      } else {
        int v101 = 2;
        int v102 = v3 % v101;
        int v103 = 0;
        int v104 = v0 + v103;
        int v105;
        v105 = v104;
        switch (v102) {
          default:
            {
            int v106 = 1;
            v105 = v106;
          }
          case 0:
            {
            v105 = v0;
          }
          case 1:
            {
            int v107 = 4;
            int v108 = v0 + v107;
            v105 = v108;
            break;
          }
        }
        int v109 = 0;
        v87 = v105;
      }
      v24 = v87;
      break;
    }
  }
  bool v110 = true;
  int v111 = simt_wave_count_bits(v110);
  int v112 = 16;
  int v113 = v112 + v0;
  v1[v113] = v111;
  int v114 = 0;
  bool v115 = v2 != v114;
  int v116 = v115 ? v6 : v24;
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
  int v129 = 0;
  bool v130 = v128 != v129;
  int v131;
  if (v130) {
    uint v132 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v133 = (int)(v132);
    v131 = v133;
  } else {
    int v134 = 12;
    int v135 = v134 + v119;
    int v136 = v118[v135];
    uint v137 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v138 = (int)(v137);
    int v139;
    v139 = v138;
    switch (v136) {
      case 0:
        {
        int v140 = 16;
        int v141 = v140 + v119;
        int v142 = v118[v141];
        int v143 = 4;
        int v144;
        v144 = v143;
        switch (v142) {
          case 0:
            {
            int v145 = 3;
            v144 = v145;
            break;
          }
          case 1:
            {
            int v146 = 1;
            v144 = v146;
            break;
          }
          case 2:
            {
            v144 = v119;
            break;
          }
          default:
            {
            int v147 = 4;
            v144 = v147;
            break;
          }
        }
        bool v148 = true;
        v139 = v144;
        break;
      }
      default:
        {
        int v149 = 3;
        int v150 = v119 + v149;
        v139 = v150;
        break;
      }
    }
    bool v151 = true;
    v131 = v139;
  }
  int v152 = 32;
  int v153 = v152 + v119;
  bool v154 = true;
  int v155 = simt_wave_count_bits(v154);
  v117[v153] = v155;
  int v156 = 20;
  int v157 = v156 + v119;
  int v158 = v118[v157];
  uint v159 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v160 = (int)(v159);
  int v161;
  v161 = v160;
  switch (v158) {
    default:
      {
      int v162 = 24;
      int v163 = v162 + v119;
      int v164 = v118[v163];
      int v165 = 0;
      bool v166 = v164 != v165;
      int v167;
      if (v166) {
        int v168 = 28;
        int v169 = v168 + v119;
        int v170 = v118[v169];
        int v171 = 1;
        int v172 = v119 + v171;
        int v173;
        v173 = v172;
        switch (v170) {
          case 0:
            {
            int v174 = 0;
            int v175 = v119 + v174;
            v173 = v175;
            break;
          }
          default:
            {
            v173 = v119;
          }
          case 1:
            {
            v173 = v119;
            break;
          }
        }
        bool v176 = true;
        v167 = v173;
      } else {
        int v177 = 32;
        int v178 = v177 + v119;
        int v179 = v118[v178];
        int v180 = 1;
        int v181;
        v181 = v180;
        switch (v179) {
          default:
            {
            int v182 = 2;
            int v183 = v119 + v182;
            v181 = v183;
            break;
          }
          case 0:
            {
            int v184 = 1;
            int v185 = v119 + v184;
            v181 = v185;
            break;
          }
        }
        bool v186 = true;
        v167 = v181;
      }
      v161 = v167;
    }
    case 0:
      {
      v161 = v119;
      break;
    }
  }
  bool v187 = true;
  int v188 = 48;
  int v189 = v188 + v119;
  bool v190 = true;
  int v191 = simt_wave_count_bits(v190);
  v117[v189] = v191;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
