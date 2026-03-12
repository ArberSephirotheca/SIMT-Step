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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 4;
  int v7 = v3 % v6;
  uint v8 = simt_lane_id(__simt_tid);
  int v9 = (int)(v8);
  int v10;
  v10 = v9;
  switch (v7) {
    case 0:
      {
      int v11 = 1;
      int v12 = v0 + v11;
      v10 = v12;
      break;
    }
    case 1:
      {
      int v13 = 4;
      int v14 = v3 % v13;
      int v15 = 2;
      int v16 = v0 + v15;
      int v17;
      v17 = v16;
      switch (v14) {
        case 0:
          {
          int v18 = 3;
          v17 = v18;
          break;
        }
        case 1:
          {
          int v19 = 3;
          int v20 = v0 + v19;
          v17 = v20;
          break;
        }
        default:
          {
          int v21 = 0;
          bool v22 = v2 != v21;
          int v23;
          if (v22) {
            int v24 = 3;
            int v25 = v0 + v24;
            v23 = v25;
          } else {
            v23 = v0;
          }
          int v26 = 3;
          int v27 = v0 + v26;
          v17 = v23;
          break;
        }
        case 2:
          {
          int v28 = 0;
          bool v29 = v2 != v28;
          int v30;
          if (v29) {
            v30 = v0;
          } else {
            int v31 = 0;
            v30 = v31;
          }
          int v32 = 2;
          int v33 = v0 + v32;
          v17 = v30;
          break;
        }
      }
      int v34 = 4;
      v10 = v17;
      break;
    }
    default:
      {
      int v35 = 4;
      int v36 = v3 % v35;
      int v37 = 4;
      int v38;
      v38 = v37;
      switch (v36) {
        case 0:
          {
          int v39 = 0;
          bool v40 = v2 != v39;
          int v41;
          if (v40) {
            int v42 = 3;
            int v43 = v0 + v42;
            v41 = v43;
          } else {
            int v44 = 1;
            v41 = v44;
          }
          int v45 = 3;
          v38 = v41;
          break;
        }
        case 1:
          {
          int v46;
          v46 = v0;
          switch (v3) {
            default:
              {
              v46 = v0;
              break;
            }
            case 0:
              {
              int v47 = 4;
              int v48 = v0 + v47;
              v46 = v48;
              break;
            }
          }
          int v49 = 3;
          v38 = v46;
          break;
        }
        case 2:
          {
          int v50 = 4;
          int v51 = v3 % v50;
          int v52 = 1;
          int v53 = v0 + v52;
          int v54;
          v54 = v53;
          switch (v51) {
            case 0:
              {
              int v55 = 2;
              int v56 = v0 + v55;
              v54 = v56;
              break;
            }
            case 1:
              {
              int v57 = 4;
              v54 = v57;
              break;
            }
            case 2:
              {
              v54 = v0;
              break;
            }
            default:
              {
              int v58 = 3;
              int v59 = v0 + v58;
              v54 = v59;
              break;
            }
          }
          int v60 = 0;
          int v61 = v0 + v60;
          v38 = v54;
          break;
        }
        default:
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
            int v71 = 3;
            int v72 = 1;
            int v73 = v65 + v72;
            v64 = v71;
            v65 = v73;
          }
          v38 = v64;
          break;
        }
      }
      int v74 = 3;
      int v75 = v0 + v74;
      v10 = v38;
      break;
    }
    case 2:
      {
      int v76 = 0;
      int v77 = 0;
      int v78;
      int v79;
      v78 = v76;
      v79 = v77;
      while (true) {
        int v80 = 4;
        int v81 = v3 % v80;
        int v82 = 1;
        int v83 = v81 + v82;
        bool v84 = v79 < v83;
        v78 = v78;
        v79 = v79;
        if (!v84) break;
        int v85 = 1;
        int v86 = v79 + v85;
        v78 = v0;
        v79 = v86;
      }
      int v87 = 2;
      int v88 = v0 + v87;
      v10 = v78;
      break;
    }
  }
  bool v89 = true;
  int v90 = simt_wave_count_bits(v89);
  int v91 = 0;
  int v92 = v91 + v0;
  v1[v92] = v90;
  int v93 = 0;
  bool v94 = v2 != v93;
  int v95 = v94 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v96 [[buffer(0)]], device int* v97 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v98 = static_cast<int>(__simt_tid3.x);
  int v99 = 0;
  int v100 = v99 + v98;
  int v101 = v97[v100];
  int v102 = 4;
  int v103 = v102 + v98;
  int v104 = v97[v103];
  helper0(v98, v96, v101, v104, static_cast<int>(__simt_tid3.x));
  int v105 = 8;
  int v106 = v105 + v98;
  int v107 = v97[v106];
  int v108;
  v108 = v98;
  switch (v107) {
    case 0:
      {
      v108 = v98;
      break;
    }
    case 1:
      {
      int v109 = 0;
      int v110 = 0;
      int v111;
      int v112;
      v111 = v109;
      v112 = v110;
      while (true) {
        int v113 = 4;
        int v114 = v112 * v113;
        int v115 = v114 + v98;
        int v116 = 12;
        int v117 = v116 + v115;
        int v118 = v97[v117];
        int v119 = 0;
        bool v120 = v118 != v119;
        v111 = v111;
        v112 = v112;
        if (!v120) break;
        int v121 = 32;
        int v122 = v121 + v98;
        int v123 = v97[v122];
        int v124 = 0;
        bool v125 = v123 != v124;
        int v126;
        if (v125) {
          v126 = v98;
        } else {
          int v127 = 3;
          v126 = v127;
        }
        int v128 = v111 + v126;
        int v129 = 1;
        int v130 = v112 + v129;
        v111 = v128;
        v112 = v130;
        continue;
        ;
      }
      bool v131 = true;
      v108 = v111;
      break;
    }
    case 2:
      {
      int v132 = 36;
      int v133 = v132 + v98;
      int v134 = v97[v133];
      int v135 = 1;
      int v136;
      v136 = v135;
      switch (v134) {
        case 0:
          {
          int v137 = 0;
          int v138 = 0;
          int v139;
          int v140;
          v139 = v137;
          v140 = v138;
          while (true) {
            int v141 = 4;
            int v142 = v140 * v141;
            int v143 = v142 + v98;
            int v144 = 40;
            int v145 = v144 + v143;
            int v146 = v97[v145];
            int v147 = 0;
            bool v148 = v146 != v147;
            v139 = v139;
            v140 = v140;
            if (!v148) break;
            int v149 = v139 + v140;
            int v150 = 1;
            int v151 = v140 + v150;
            v139 = v149;
            v140 = v151;
            break;
            ;
          }
          bool v152 = true;
          v136 = v139;
          break;
        }
        default:
          {
          int v153 = 2;
          v136 = v153;
          break;
        }
        case 1:
          {
          int v154 = 0;
          int v155 = 0;
          int v156;
          int v157;
          v156 = v154;
          v157 = v155;
          while (true) {
            int v158 = 4;
            int v159 = v157 * v158;
            int v160 = v159 + v98;
            int v161 = 60;
            int v162 = v161 + v160;
            int v163 = v97[v162];
            int v164 = 0;
            bool v165 = v163 != v164;
            v156 = v156;
            v157 = v157;
            if (!v165) break;
            int v166 = v156 + v157;
            int v167 = 1;
            int v168 = v157 + v167;
            v156 = v166;
            v157 = v168;
            continue;
            ;
          }
          bool v169 = true;
          v136 = v156;
          break;
        }
        case 2:
          {
          int v170 = 80;
          int v171 = v170 + v98;
          int v172 = v97[v171];
          int v173;
          v173 = v98;
          switch (v172) {
            case 0:
              {
              v173 = v98;
              break;
            }
            case 1:
              {
              int v174 = 1;
              v173 = v174;
              break;
            }
            default:
              {
              int v175 = 2;
              v173 = v175;
              break;
            }
            case 2:
              {
              v173 = v98;
              break;
            }
          }
          bool v176 = true;
          v136 = v173;
          break;
        }
      }
      bool v177 = true;
      v108 = v136;
      break;
    }
    default:
      {
      int v178 = 84;
      int v179 = v178 + v98;
      int v180 = v97[v179];
      int v181 = 0;
      bool v182 = v180 != v181;
      int v183;
      if (v182) {
        int v184 = 88;
        int v185 = v184 + v98;
        int v186 = v97[v185];
        int v187 = 0;
        bool v188 = v186 != v187;
        int v189;
        if (v188) {
          int v190 = 2;
          int v191 = v98 + v190;
          v189 = v191;
        } else {
          int v192 = 1;
          v189 = v192;
        }
        v183 = v189;
      } else {
        int v193 = 0;
        v183 = v193;
      }
      v108 = v183;
      break;
    }
  }
  bool v194 = true;
  int v195 = 16;
  int v196 = v195 + v98;
  bool v197 = true;
  int v198 = simt_wave_count_bits(v197);
  v96[v196] = v198;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 92; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
