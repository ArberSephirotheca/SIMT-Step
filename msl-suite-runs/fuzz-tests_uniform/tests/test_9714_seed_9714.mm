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
  int v5 = 2;
  int v6 = v3 % v5;
  int v7 = 0;
  int v8;
  v8 = v7;
  switch (v6) {
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 4;
        int v13 = v3 % v12;
        int v14 = 2;
        int v15;
        v15 = v14;
        switch (v13) {
          default:
            {
            int v16 = 0;
            int v17 = v0 + v16;
            v15 = v17;
            break;
          }
          case 0:
            {
            v15 = v0;
            break;
          }
          case 1:
            {
            int v18 = 1;
            v15 = v18;
            break;
          }
          case 2:
            {
            v15 = v0;
            break;
          }
        }
        v11 = v15;
      } else {
        int v19 = 2;
        int v20 = v3 % v19;
        int v21;
        v21 = v0;
        switch (v20) {
          case 0:
            {
            v21 = v0;
            break;
          }
          case 1:
            {
            v21 = v0;
            break;
          }
          default:
            {
            int v22 = 1;
            v21 = v22;
            break;
          }
        }
        int v23 = 4;
        int v24 = v0 + v23;
        v11 = v21;
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v25 = 2;
      int v26 = v3 % v25;
      int v27;
      v27 = v0;
      switch (v26) {
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
            int v37 = 2;
            int v38 = 1;
            int v39 = v31 + v38;
            v30 = v37;
            v31 = v39;
          }
          v27 = v30;
          break;
        }
        default:
          {
          int v40 = 3;
          int v41 = v3 % v40;
          int v42 = 0;
          int v43 = v0 + v42;
          int v44;
          v44 = v43;
          switch (v41) {
            case 0:
              {
              v44 = v0;
            }
            case 1:
              {
              v44 = v0;
              break;
            }
            default:
              {
              int v45 = 3;
              int v46 = v0 + v45;
              v44 = v46;
              break;
            }
            case 2:
              {
              int v47 = 2;
              v44 = v47;
              break;
            }
          }
          int v48 = 3;
          v27 = v44;
          break;
        }
        case 1:
          {
          int v49;
          v49 = v0;
          switch (v3) {
            default:
              {
              v49 = v0;
              break;
            }
            case 0:
              {
              int v50 = 3;
              int v51 = v0 + v50;
              v49 = v51;
              break;
            }
          }
          int v52 = 4;
          int v53 = v0 + v52;
          v27 = v49;
          break;
        }
      }
      v8 = v27;
    }
    default:
      {
      int v54 = 0;
      bool v55 = v2 != v54;
      int v56;
      if (v55) {
        int v57 = 0;
        int v58 = 0;
        int v59;
        int v60;
        v59 = v57;
        v60 = v58;
        while (true) {
          int v61 = 4;
          int v62 = v3 % v61;
          int v63 = 1;
          int v64 = v62 + v63;
          bool v65 = v60 < v64;
          v59 = v59;
          v60 = v60;
          if (!v65) break;
          int v66 = 3;
          int v67 = v0 + v66;
          int v68 = 1;
          int v69 = v60 + v68;
          v59 = v67;
          v60 = v69;
        }
        int v70 = 0;
        v56 = v59;
      } else {
        v56 = v0;
      }
      int v71 = 4;
      v8 = v56;
      break;
    }
  }
  bool v72 = true;
  int v73 = simt_wave_count_bits(v72);
  int v74 = 0;
  int v75 = v74 + v0;
  v1[v75] = v73;
  int v76 = 0;
  bool v77 = v2 != v76;
  int v78 = v77 ? v4 : v8;
  return;
}

kernel void kernel_main(device int* v79 [[buffer(0)]], device int* v80 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v81 = static_cast<int>(__simt_tid3.x);
  int v82 = 0;
  int v83 = v82 + v81;
  int v84 = v80[v83];
  int v85 = 4;
  int v86 = v85 + v81;
  int v87 = v80[v86];
  helper0(v81, v79, v84, v87, static_cast<int>(__simt_tid3.x));
  int v88 = 0;
  int v89 = 0;
  int v90;
  int v91;
  v90 = v88;
  v91 = v89;
  while (true) {
    int v92 = 4;
    int v93 = v91 * v92;
    int v94 = v93 + v81;
    int v95 = 8;
    int v96 = v95 + v94;
    int v97 = v80[v96];
    int v98 = 0;
    bool v99 = v97 != v98;
    v90 = v90;
    v91 = v91;
    if (!v99) break;
    int v100 = 28;
    int v101 = v100 + v81;
    int v102 = v80[v101];
    int v103 = 0;
    bool v104 = v102 != v103;
    int v105;
    if (v104) {
      uint v106 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v107 = (int)(v106);
      v105 = v107;
    } else {
      int v108 = 32;
      int v109 = v108 + v81;
      int v110 = v80[v109];
      int v111 = 0;
      bool v112 = v110 != v111;
      int v113;
      if (v112) {
        uint v114 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v115 = (int)(v114);
        v113 = v115;
      } else {
        uint v116 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v117 = (int)(v116);
        v113 = v117;
      }
      v105 = v113;
    }
    int v118 = v90 + v105;
    int v119 = 1;
    int v120 = v91 + v119;
    v90 = v118;
    v91 = v120;
  }
  bool v121 = true;
  int v122 = 16;
  int v123 = v122 + v81;
  bool v124 = true;
  int v125 = simt_wave_count_bits(v124);
  v79[v123] = v125;
  uint v126 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v127 = (int)(v126);
  int v128 = 36;
  int v129 = v128 + v81;
  int v130 = v80[v129];
  int v131 = 0;
  int v132;
  v132 = v131;
  switch (v130) {
    default:
      {
      int v133 = 40;
      int v134 = v133 + v81;
      int v135 = v80[v134];
      int v136 = 0;
      bool v137 = v135 != v136;
      int v138;
      if (v137) {
        v138 = v81;
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
          int v145 = v144 + v81;
          int v146 = 44;
          int v147 = v146 + v145;
          int v148 = v80[v147];
          int v149 = 0;
          bool v150 = v148 != v149;
          v141 = v141;
          v142 = v142;
          if (!v150) break;
          int v151 = v141 + v142;
          int v152 = 1;
          int v153 = v142 + v152;
          v141 = v151;
          v142 = v153;
          break;
          ;
        }
        bool v154 = true;
        v138 = v141;
      }
      v132 = v138;
    }
    case 0:
      {
      int v155 = 64;
      int v156 = v155 + v81;
      int v157 = v80[v156];
      int v158 = 2;
      int v159 = v81 + v158;
      int v160;
      v160 = v159;
      switch (v157) {
        default:
          {
          int v161 = 0;
          int v162 = 0;
          int v163;
          int v164;
          v163 = v161;
          v164 = v162;
          while (true) {
            int v165 = 4;
            int v166 = v164 * v165;
            int v167 = v166 + v81;
            int v168 = 68;
            int v169 = v168 + v167;
            int v170 = v80[v169];
            int v171 = 0;
            bool v172 = v170 != v171;
            v163 = v163;
            v164 = v164;
            if (!v172) break;
            int v173 = v163 + v164;
            int v174 = 1;
            int v175 = v164 + v174;
            v163 = v173;
            v164 = v175;
          }
          bool v176 = true;
          v160 = v163;
          break;
        }
        case 0:
          {
          v160 = v81;
          break;
        }
        case 1:
          {
          int v177 = 88;
          int v178 = v177 + v81;
          int v179 = v80[v178];
          int v180 = 0;
          bool v181 = v179 != v180;
          int v182;
          if (v181) {
            v182 = v81;
          } else {
            int v183 = 3;
            v182 = v183;
          }
          v160 = v182;
          break;
        }
      }
      bool v184 = true;
      v132 = v160;
      break;
    }
    case 1:
      {
      int v185 = 92;
      int v186 = v185 + v81;
      int v187 = v80[v186];
      int v188 = 1;
      int v189;
      v189 = v188;
      switch (v187) {
        case 0:
          {
          int v190 = 1;
          v189 = v190;
          break;
        }
        default:
          {
          int v191 = 2;
          v189 = v191;
          break;
        }
        case 1:
          {
          v189 = v81;
          break;
        }
        case 2:
          {
          int v192 = 2;
          int v193 = v81 + v192;
          v189 = v193;
          break;
        }
      }
      bool v194 = true;
      v132 = v189;
      break;
    }
  }
  bool v195 = true;
  int v196 = 32;
  int v197 = v196 + v81;
  bool v198 = true;
  int v199 = simt_wave_count_bits(v198);
  v79[v197] = v199;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
