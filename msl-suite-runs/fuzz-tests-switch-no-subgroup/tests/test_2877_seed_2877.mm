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
  int v6 = 2;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 2;
      int v10 = v3 % v9;
      int v11 = 4;
      int v12;
      v12 = v11;
      switch (v10) {
        case 0:
          {
          int v13 = 2;
          int v14 = v3 % v13;
          int v15 = 0;
          int v16 = v0 + v15;
          int v17;
          v17 = v16;
          switch (v14) {
            default:
              {
              int v18 = 0;
              v17 = v18;
            }
            case 0:
              {
              int v19 = 1;
              v17 = v19;
              break;
            }
          }
          int v20 = 3;
          v12 = v17;
        }
        case 1:
          {
          int v21 = 4;
          int v22 = v3 % v21;
          int v23 = 3;
          int v24;
          v24 = v23;
          switch (v22) {
            case 0:
              {
              v24 = v0;
              break;
            }
            case 1:
              {
              v24 = v0;
              break;
            }
            case 2:
              {
              int v25 = 1;
              v24 = v25;
              break;
            }
            default:
              {
              int v26 = 1;
              int v27 = v0 + v26;
              v24 = v27;
              break;
            }
          }
          v12 = v24;
        }
        default:
          {
          int v28 = 4;
          int v29 = v3 % v28;
          int v30 = 2;
          int v31;
          v31 = v30;
          switch (v29) {
            default:
              {
              int v32 = 0;
              v31 = v32;
            }
            case 0:
              {
              int v33 = 2;
              v31 = v33;
              break;
            }
            case 1:
              {
              int v34 = 4;
              v31 = v34;
            }
            case 2:
              {
              int v35 = 3;
              int v36 = v0 + v35;
              v31 = v36;
              break;
            }
          }
          v12 = v31;
          break;
        }
      }
      v8 = v12;
      break;
    }
    case 0:
      {
      int v37 = 3;
      int v38 = v0 + v37;
      v8 = v38;
      break;
    }
    case 1:
      {
      int v39 = 2;
      int v40 = v3 % v39;
      int v41 = 1;
      int v42 = v0 + v41;
      int v43;
      v43 = v42;
      switch (v40) {
        default:
          {
          int v44 = 2;
          v43 = v44;
          break;
        }
        case 0:
          {
          int v45 = 1;
          v43 = v45;
          break;
        }
        case 1:
          {
          int v46 = 2;
          int v47 = v3 % v46;
          int v48 = 0;
          int v49;
          v49 = v48;
          switch (v47) {
            default:
              {
              v49 = v0;
              break;
            }
            case 0:
              {
              int v50 = 0;
              int v51 = v0 + v50;
              v49 = v51;
              break;
            }
          }
          v43 = v49;
          break;
        }
      }
      v8 = v43;
      break;
    }
    case 2:
      {
      int v52 = 0;
      int v53 = 0;
      int v54;
      int v55;
      v54 = v52;
      v55 = v53;
      while (true) {
        int v56 = 4;
        int v57 = v3 % v56;
        int v58 = 1;
        int v59 = v57 + v58;
        bool v60 = v55 < v59;
        v54 = v54;
        v55 = v55;
        if (!v60) break;
        int v61 = 0;
        bool v62 = v2 != v61;
        int v63;
        if (v62) {
          int v64 = 1;
          int v65 = v0 + v64;
          v63 = v65;
        } else {
          v63 = v0;
        }
        int v66 = 1;
        int v67 = v55 + v66;
        v54 = v63;
        v55 = v67;
      }
      v8 = v54;
      break;
    }
  }
  bool v68 = true;
  int v69 = simt_wave_count_bits(v68);
  int v70 = 0;
  int v71 = v70 + v0;
  v1[v71] = v69;
  return;
}

kernel void kernel_main(device int* v72 [[buffer(0)]], device int* v73 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v74 = static_cast<int>(__simt_tid3.x);
  int v75 = 0;
  int v76 = v75 + v74;
  int v77 = v73[v76];
  int v78 = 4;
  int v79 = v78 + v74;
  int v80 = v73[v79];
  helper0(v74, v72, v77, v80, static_cast<int>(__simt_tid3.x));
  uint v81 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v82 = (int)(v81);
  uint v83 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v84 = (int)(v83);
  int v85 = 8;
  int v86 = v85 + v74;
  int v87 = v73[v86];
  int v88 = 4;
  int v89 = v74 + v88;
  int v90;
  v90 = v89;
  switch (v87) {
    case 0:
      {
      int v91 = 12;
      int v92 = v91 + v74;
      int v93 = v73[v92];
      int v94 = 0;
      bool v95 = v93 != v94;
      int v96;
      if (v95) {
        int v97 = 16;
        int v98 = v97 + v74;
        int v99 = v73[v98];
        int v100;
        v100 = v74;
        switch (v99) {
          case 0:
            {
            int v101 = 2;
            v100 = v101;
            break;
          }
          case 1:
            {
            int v102 = 4;
            int v103 = v74 + v102;
            v100 = v103;
            break;
          }
          case 2:
            {
            int v104 = 3;
            v100 = v104;
            break;
          }
          default:
            {
            int v105 = 2;
            int v106 = v74 + v105;
            v100 = v106;
            break;
          }
        }
        bool v107 = true;
        v96 = v100;
      } else {
        v96 = v74;
      }
      v90 = v96;
      break;
    }
    case 1:
      {
      int v108 = 20;
      int v109 = v108 + v74;
      int v110 = v73[v109];
      int v111 = 1;
      int v112 = v74 + v111;
      int v113;
      v113 = v112;
      switch (v110) {
        case 0:
          {
          int v114 = 24;
          int v115 = v114 + v74;
          int v116 = v73[v115];
          int v117;
          v117 = v74;
          switch (v116) {
            default:
              {
              int v118 = 1;
              int v119 = v74 + v118;
              v117 = v119;
              break;
            }
            case 0:
              {
              v117 = v74;
              break;
            }
            case 1:
              {
              int v120 = 3;
              int v121 = v74 + v120;
              v117 = v121;
              break;
            }
          }
          v113 = v117;
        }
        default:
          {
          int v122 = 0;
          int v123 = 0;
          int v124;
          int v125;
          v124 = v122;
          v125 = v123;
          while (true) {
            int v126 = 4;
            int v127 = v125 * v126;
            int v128 = v127 + v74;
            int v129 = 28;
            int v130 = v129 + v128;
            int v131 = v73[v130];
            int v132 = 0;
            bool v133 = v131 != v132;
            v124 = v124;
            v125 = v125;
            if (!v133) break;
            int v134 = v124 + v125;
            int v135 = 1;
            int v136 = v125 + v135;
            bool v137 = true;
            v124 = v134;
            v125 = v136;
          }
          v113 = v124;
        }
        case 1:
          {
          int v138 = 48;
          int v139 = v138 + v74;
          int v140 = v73[v139];
          int v141 = 0;
          bool v142 = v140 != v141;
          int v143;
          if (v142) {
            int v144 = 3;
            v143 = v144;
          } else {
            v143 = v74;
          }
          v113 = v143;
          break;
        }
      }
      v90 = v113;
      break;
    }
    default:
      {
      int v145 = 52;
      int v146 = v145 + v74;
      int v147 = v73[v146];
      int v148 = 0;
      bool v149 = v147 != v148;
      int v150;
      if (v149) {
        int v151 = 0;
        int v152 = 0;
        int v153;
        int v154;
        v153 = v151;
        v154 = v152;
        while (true) {
          int v155 = 4;
          int v156 = v154 * v155;
          int v157 = v156 + v74;
          int v158 = 56;
          int v159 = v158 + v157;
          int v160 = v73[v159];
          int v161 = 0;
          bool v162 = v160 != v161;
          v153 = v153;
          v154 = v154;
          if (!v162) break;
          int v163 = v153 + v154;
          int v164 = 1;
          int v165 = v154 + v164;
          bool v166 = true;
          v153 = v163;
          v154 = v165;
        }
        v150 = v153;
      } else {
        int v167 = 76;
        int v168 = v167 + v74;
        int v169 = v73[v168];
        int v170 = 0;
        bool v171 = v169 != v170;
        int v172;
        if (v171) {
          int v173 = 4;
          int v174 = v74 + v173;
          v172 = v174;
        } else {
          int v175 = 2;
          int v176 = v74 + v175;
          v172 = v176;
        }
        v150 = v172;
      }
      v90 = v150;
      break;
    }
    case 2:
      {
      int v177 = 80;
      int v178 = v177 + v74;
      int v179 = v73[v178];
      int v180 = 0;
      bool v181 = v179 != v180;
      int v182;
      if (v181) {
        int v183 = 0;
        int v184 = 0;
        int v185;
        int v186;
        v185 = v183;
        v186 = v184;
        while (true) {
          int v187 = 4;
          int v188 = v186 * v187;
          int v189 = v188 + v74;
          int v190 = 84;
          int v191 = v190 + v189;
          int v192 = v73[v191];
          int v193 = 0;
          bool v194 = v192 != v193;
          v185 = v185;
          v186 = v186;
          if (!v194) break;
          int v195 = v185 + v186;
          int v196 = 1;
          int v197 = v186 + v196;
          bool v198 = true;
          v185 = v195;
          v186 = v197;
        }
        v182 = v185;
      } else {
        int v199 = 104;
        int v200 = v199 + v74;
        int v201 = v73[v200];
        int v202 = 0;
        bool v203 = v201 != v202;
        int v204;
        if (v203) {
          int v205 = 3;
          v204 = v205;
        } else {
          int v206 = 1;
          v204 = v206;
        }
        v182 = v204;
      }
      v90 = v182;
      break;
    }
  }
  bool v207 = true;
  int v208 = 16;
  int v209 = v208 + v74;
  bool v210 = true;
  int v211 = simt_wave_count_bits(v210);
  v72[v209] = v211;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
