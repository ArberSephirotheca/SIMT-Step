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
  int v4 = 4;
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      v8 = v0;
      break;
    }
    case 1:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11 = 0;
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
              int v18 = 1;
              v17 = v18;
              break;
            }
            default:
              {
              int v19 = 2;
              int v20 = v0 + v19;
              v17 = v20;
              break;
            }
            case 1:
              {
              v17 = v0;
              break;
            }
          }
          int v21 = 4;
          int v22 = v0 + v21;
          v13 = v17;
          break;
        }
        case 1:
          {
          int v23 = 0;
          int v24 = 0;
          int v25;
          int v26;
          v25 = v23;
          v26 = v24;
          while (true) {
            int v27 = 4;
            int v28 = v3 % v27;
            int v29 = 1;
            int v30 = v28 + v29;
            bool v31 = v26 < v30;
            v25 = v25;
            v26 = v26;
            if (!v31) break;
            int v32 = 1;
            int v33 = v0 + v32;
            int v34 = 1;
            int v35 = v26 + v34;
            v25 = v33;
            v26 = v35;
            continue;
            ;
          }
          int v36 = 1;
          int v37 = v0 + v36;
          v13 = v25;
          break;
        }
        default:
          {
          int v38 = 0;
          int v39 = 0;
          int v40;
          int v41;
          v40 = v38;
          v41 = v39;
          while (true) {
            int v42 = 4;
            int v43 = v3 % v42;
            int v44 = 1;
            int v45 = v43 + v44;
            bool v46 = v41 < v45;
            v40 = v40;
            v41 = v41;
            if (!v46) break;
            int v47 = 1;
            int v48 = 1;
            int v49 = v41 + v48;
            v40 = v47;
            v41 = v49;
            continue;
            ;
          }
          v13 = v40;
          break;
        }
        case 2:
          {
          int v50 = 0;
          bool v51 = v2 != v50;
          int v52;
          if (v51) {
            v52 = v0;
          } else {
            int v53 = 0;
            int v54 = v0 + v53;
            v52 = v54;
          }
          int v55 = 3;
          v13 = v52;
          break;
        }
      }
      int v56 = 2;
      v8 = v13;
      break;
    }
    case 2:
      {
      int v57 = 2;
      int v58 = v3 % v57;
      int v59;
      v59 = v0;
      switch (v58) {
        default:
          {
          v59 = v0;
          break;
        }
        case 0:
          {
          int v60 = 0;
          int v61 = 0;
          int v62;
          int v63;
          v62 = v60;
          v63 = v61;
          while (true) {
            int v64 = 4;
            int v65 = v3 % v64;
            int v66 = 1;
            int v67 = v65 + v66;
            bool v68 = v63 < v67;
            v62 = v62;
            v63 = v63;
            if (!v68) break;
            int v69 = 2;
            int v70 = 1;
            int v71 = v63 + v70;
            v62 = v69;
            v63 = v71;
          }
          v59 = v62;
        }
        case 1:
          {
          int v72 = 0;
          int v73 = 0;
          int v74;
          int v75;
          v74 = v72;
          v75 = v73;
          while (true) {
            int v76 = 4;
            int v77 = v3 % v76;
            int v78 = 1;
            int v79 = v77 + v78;
            bool v80 = v75 < v79;
            v74 = v74;
            v75 = v75;
            if (!v80) break;
            int v81 = 1;
            int v82 = v75 + v81;
            v74 = v0;
            v75 = v82;
          }
          int v83 = 0;
          v59 = v74;
          break;
        }
      }
      int v84 = 4;
      int v85 = v0 + v84;
      v8 = v59;
      break;
    }
    default:
      {
      int v86 = 2;
      int v87 = v3 % v86;
      int v88 = 3;
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
            int v95 = v3 % v94;
            int v96 = 1;
            int v97 = v95 + v96;
            bool v98 = v93 < v97;
            v92 = v92;
            v93 = v93;
            if (!v98) break;
            int v99 = 1;
            int v100 = v93 + v99;
            v92 = v0;
            v93 = v100;
          }
          int v101 = 4;
          v89 = v92;
          break;
        }
        default:
          {
          int v102 = 0;
          int v103 = 0;
          int v104;
          int v105;
          v104 = v102;
          v105 = v103;
          while (true) {
            int v106 = 4;
            int v107 = v3 % v106;
            int v108 = 1;
            int v109 = v107 + v108;
            bool v110 = v105 < v109;
            v104 = v104;
            v105 = v105;
            if (!v110) break;
            int v111 = 4;
            int v112 = v0 + v111;
            int v113 = 1;
            int v114 = v105 + v113;
            v104 = v112;
            v105 = v114;
          }
          v89 = v104;
          break;
        }
      }
      v8 = v89;
      break;
    }
  }
  bool v115 = true;
  int v116 = simt_wave_count_bits(v115);
  int v117 = 0;
  int v118 = v117 + v0;
  v1[v118] = v116;
  return;
}

kernel void kernel_main(device int* v119 [[buffer(0)]], device int* v120 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v121 = static_cast<int>(__simt_tid3.x);
  int v122 = 0;
  int v123 = v122 + v121;
  int v124 = v120[v123];
  int v125 = 4;
  int v126 = v125 + v121;
  int v127 = v120[v126];
  helper0(v121, v119, v124, v127, static_cast<int>(__simt_tid3.x));
  uint v128 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v129 = (int)(v128);
  int v130 = 8;
  int v131 = v130 + v121;
  int v132 = v120[v131];
  int v133 = 0;
  int v134;
  v134 = v133;
  switch (v132) {
    case 0:
      {
      int v135 = 0;
      int v136 = v121 + v135;
      v134 = v136;
      break;
    }
    default:
      {
      int v137 = 12;
      int v138 = v137 + v121;
      int v139 = v120[v138];
      int v140 = 3;
      int v141;
      v141 = v140;
      switch (v139) {
        case 0:
          {
          int v142 = 16;
          int v143 = v142 + v121;
          int v144 = v120[v143];
          int v145 = 0;
          bool v146 = v144 != v145;
          int v147;
          if (v146) {
            int v148 = 1;
            int v149 = v121 + v148;
            v147 = v149;
          } else {
            int v150 = 0;
            int v151 = v121 + v150;
            v147 = v151;
          }
          v141 = v147;
          break;
        }
        default:
          {
          int v152 = 20;
          int v153 = v152 + v121;
          int v154 = v120[v153];
          int v155 = 2;
          int v156 = v121 + v155;
          int v157;
          v157 = v156;
          switch (v154) {
            case 0:
              {
              int v158 = 2;
              v157 = v158;
              break;
            }
            case 1:
              {
              int v159 = 0;
              int v160 = v121 + v159;
              v157 = v160;
              break;
            }
            case 2:
              {
              int v161 = 0;
              v157 = v161;
              break;
            }
            default:
              {
              v157 = v121;
              break;
            }
          }
          bool v162 = true;
          v141 = v157;
        }
        case 1:
          {
          int v163 = 24;
          int v164 = v163 + v121;
          int v165 = v120[v164];
          int v166 = 0;
          bool v167 = v165 != v166;
          int v168;
          if (v167) {
            int v169 = 2;
            v168 = v169;
          } else {
            int v170 = 1;
            v168 = v170;
          }
          v141 = v168;
          break;
        }
      }
      bool v171 = true;
      v134 = v141;
      break;
    }
    case 1:
      {
      int v172 = 28;
      int v173 = v172 + v121;
      int v174 = v120[v173];
      int v175 = 0;
      bool v176 = v174 != v175;
      int v177;
      if (v176) {
        int v178 = 32;
        int v179 = v178 + v121;
        int v180 = v120[v179];
        int v181 = 1;
        int v182 = v121 + v181;
        int v183;
        v183 = v182;
        switch (v180) {
          case 0:
            {
            int v184 = 2;
            int v185 = v121 + v184;
            v183 = v185;
            break;
          }
          case 1:
            {
            int v186 = 0;
            int v187 = v121 + v186;
            v183 = v187;
            break;
          }
          default:
            {
            v183 = v121;
            break;
          }
          case 2:
            {
            int v188 = 2;
            int v189 = v121 + v188;
            v183 = v189;
            break;
          }
        }
        bool v190 = true;
        v177 = v183;
      } else {
        int v191 = 4;
        v177 = v191;
      }
      v134 = v177;
      break;
    }
  }
  bool v192 = true;
  int v193 = 16;
  int v194 = v193 + v121;
  bool v195 = true;
  int v196 = simt_wave_count_bits(v195);
  v119[v194] = v196;
  uint v197 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v198 = (int)(v197);
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
