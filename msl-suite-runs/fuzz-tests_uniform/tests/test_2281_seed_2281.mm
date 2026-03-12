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
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    int v13 = 1;
    int v14 = v7 + v13;
    v6 = v0;
    v7 = v14;
  }
  bool v15 = true;
  int v16 = simt_wave_count_bits(v15);
  int v17 = 0;
  int v18 = v17 + v0;
  v1[v18] = v16;
  int v19 = 2;
  int v20 = v3 % v19;
  int v21;
  v21 = v0;
  switch (v20) {
    case 0:
      {
      int v22 = 3;
      v21 = v22;
      break;
    }
    case 1:
      {
      int v23 = 2;
      int v24 = v3 % v23;
      int v25 = 4;
      int v26 = v0 + v25;
      int v27;
      v27 = v26;
      switch (v24) {
        case 0:
          {
          v27 = v0;
          break;
        }
        default:
          {
          int v28 = 3;
          int v29 = v3 % v28;
          int v30 = 4;
          int v31;
          v31 = v30;
          switch (v29) {
            default:
              {
              int v32 = 2;
              int v33 = v0 + v32;
              v31 = v33;
              break;
            }
            case 0:
              {
              int v34 = 2;
              v31 = v34;
              break;
            }
            case 1:
              {
              v31 = v0;
              break;
            }
          }
          int v35 = 0;
          v27 = v31;
          break;
        }
        case 1:
          {
          int v36 = 0;
          int v37 = 0;
          int v38;
          int v39;
          v38 = v36;
          v39 = v37;
          while (true) {
            int v40 = 4;
            int v41 = v3 % v40;
            int v42 = 1;
            int v43 = v41 + v42;
            bool v44 = v39 < v43;
            v38 = v38;
            v39 = v39;
            if (!v44) break;
            int v45 = 2;
            int v46 = v0 + v45;
            int v47 = 1;
            int v48 = v39 + v47;
            v38 = v46;
            v39 = v48;
          }
          int v49 = 3;
          v27 = v38;
          break;
        }
      }
      int v50 = 3;
      v21 = v27;
    }
    default:
      {
      int v51 = 3;
      int v52 = v3 % v51;
      int v53 = 1;
      int v54 = v0 + v53;
      int v55;
      v55 = v54;
      switch (v52) {
        case 0:
          {
          int v56 = 0;
          int v57 = 0;
          int v58;
          int v59;
          v58 = v56;
          v59 = v57;
          while (true) {
            int v60 = 4;
            int v61 = v3 % v60;
            int v62 = 1;
            int v63 = v61 + v62;
            bool v64 = v59 < v63;
            v58 = v58;
            v59 = v59;
            if (!v64) break;
            int v65 = 2;
            int v66 = v0 + v65;
            int v67 = 1;
            int v68 = v59 + v67;
            v58 = v66;
            v59 = v68;
            continue;
            ;
          }
          int v69 = 4;
          v55 = v58;
          break;
        }
        case 1:
          {
          int v70 = 3;
          int v71 = v3 % v70;
          int v72 = 4;
          int v73;
          v73 = v72;
          switch (v71) {
            case 0:
              {
              int v74 = 1;
              int v75 = v0 + v74;
              v73 = v75;
              break;
            }
            case 1:
              {
              int v76 = 1;
              v73 = v76;
              break;
            }
            default:
              {
              int v77 = 1;
              v73 = v77;
              break;
            }
          }
          int v78 = 1;
          int v79 = v0 + v78;
          v55 = v73;
          break;
        }
        default:
          {
          int v80 = 0;
          bool v81 = v2 != v80;
          int v82;
          if (v81) {
            int v83 = 4;
            int v84 = v0 + v83;
            v82 = v84;
          } else {
            int v85 = 0;
            int v86 = v0 + v85;
            v82 = v86;
          }
          int v87 = 1;
          v55 = v82;
          break;
        }
        case 2:
          {
          int v88 = 0;
          int v89 = v0 + v88;
          v55 = v89;
          break;
        }
      }
      int v90 = 2;
      int v91 = v0 + v90;
      v21 = v55;
      break;
    }
  }
  bool v92 = true;
  int v93 = simt_wave_count_bits(v92);
  int v94 = 16;
  int v95 = v94 + v0;
  v1[v95] = v93;
  int v96 = 0;
  bool v97 = v2 != v96;
  int v98 = v97 ? v6 : v21;
  return;
}

kernel void kernel_main(device int* v99 [[buffer(0)]], device int* v100 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v101 = static_cast<int>(__simt_tid3.x);
  int v102 = 0;
  int v103 = v102 + v101;
  int v104 = v100[v103];
  int v105 = 4;
  int v106 = v105 + v101;
  int v107 = v100[v106];
  helper0(v101, v99, v104, v107, static_cast<int>(__simt_tid3.x));
  int v108 = 8;
  int v109 = v108 + v101;
  int v110 = v100[v109];
  int v111 = 0;
  bool v112 = v110 != v111;
  int v113;
  if (v112) {
    int v114 = 12;
    int v115 = v114 + v101;
    int v116 = v100[v115];
    int v117;
    v117 = v101;
    switch (v116) {
      default:
        {
        int v118 = 16;
        int v119 = v118 + v101;
        int v120 = v100[v119];
        int v121 = 0;
        bool v122 = v120 != v121;
        int v123;
        if (v122) {
          int v124 = 2;
          int v125 = v101 + v124;
          v123 = v125;
        } else {
          v123 = v101;
        }
        v117 = v123;
        break;
      }
      case 0:
        {
        int v126 = 1;
        int v127 = v101 + v126;
        v117 = v127;
        break;
      }
    }
    bool v128 = true;
    v113 = v117;
  } else {
    uint v129 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v130 = (int)(v129);
    v113 = v130;
  }
  int v131 = 32;
  int v132 = v131 + v101;
  bool v133 = true;
  int v134 = simt_wave_count_bits(v133);
  v99[v132] = v134;
  int v135 = 20;
  int v136 = v135 + v101;
  int v137 = v100[v136];
  int v138 = 0;
  bool v139 = v137 != v138;
  int v140;
  if (v139) {
    int v141 = 24;
    int v142 = v141 + v101;
    int v143 = v100[v142];
    int v144 = 0;
    bool v145 = v143 != v144;
    int v146;
    if (v145) {
      int v147 = 28;
      int v148 = v147 + v101;
      int v149 = v100[v148];
      int v150;
      v150 = v101;
      switch (v149) {
        default:
          {
          v150 = v101;
          break;
        }
        case 0:
          {
          int v151 = 3;
          v150 = v151;
          break;
        }
      }
      bool v152 = true;
      v146 = v150;
    } else {
      int v153 = 32;
      int v154 = v153 + v101;
      int v155 = v100[v154];
      int v156 = 0;
      bool v157 = v155 != v156;
      int v158;
      if (v157) {
        uint v159 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v160 = (int)(v159);
        v158 = v160;
      } else {
        int v161 = 2;
        v158 = v161;
      }
      v146 = v158;
    }
    v140 = v146;
  } else {
    int v162 = 36;
    int v163 = v162 + v101;
    int v164 = v100[v163];
    int v165 = 1;
    int v166;
    v166 = v165;
    switch (v164) {
      case 0:
        {
        v166 = v101;
        break;
      }
      default:
        {
        int v167 = 40;
        int v168 = v167 + v101;
        int v169 = v100[v168];
        int v170 = 0;
        bool v171 = v169 != v170;
        int v172;
        if (v171) {
          int v173 = 4;
          int v174 = v101 + v173;
          v172 = v174;
        } else {
          int v175 = 4;
          int v176 = v101 + v175;
          v172 = v176;
        }
        v166 = v172;
        break;
      }
    }
    bool v177 = true;
    v140 = v166;
  }
  int v178 = 48;
  int v179 = v178 + v101;
  bool v180 = true;
  int v181 = simt_wave_count_bits(v180);
  v99[v179] = v181;
  int v182 = 44;
  int v183 = v182 + v101;
  int v184 = v100[v183];
  int v185 = 2;
  int v186;
  v186 = v185;
  switch (v184) {
    case 0:
      {
      int v187 = 0;
      int v188 = 0;
      int v189;
      int v190;
      v189 = v187;
      v190 = v188;
      while (true) {
        int v191 = 4;
        int v192 = v190 * v191;
        int v193 = v192 + v101;
        int v194 = 48;
        int v195 = v194 + v193;
        int v196 = v100[v195];
        int v197 = 0;
        bool v198 = v196 != v197;
        v189 = v189;
        v190 = v190;
        if (!v198) break;
        int v199 = 3;
        int v200 = v101 + v199;
        int v201 = v189 + v200;
        int v202 = 1;
        int v203 = v190 + v202;
        v189 = v201;
        v190 = v203;
      }
      bool v204 = true;
      v186 = v189;
      break;
    }
    default:
      {
      int v205 = 4;
      v186 = v205;
      break;
    }
    case 1:
      {
      int v206 = 68;
      int v207 = v206 + v101;
      int v208 = v100[v207];
      int v209 = 0;
      int v210;
      v210 = v209;
      switch (v208) {
        default:
          {
          int v211 = 0;
          int v212 = v101 + v211;
          v210 = v212;
          break;
        }
        case 0:
          {
          int v213 = 72;
          int v214 = v213 + v101;
          int v215 = v100[v214];
          int v216 = 0;
          bool v217 = v215 != v216;
          int v218;
          if (v217) {
            int v219 = 2;
            v218 = v219;
          } else {
            int v220 = 1;
            v218 = v220;
          }
          v210 = v218;
          break;
        }
      }
      bool v221 = true;
      v186 = v210;
      break;
    }
  }
  bool v222 = true;
  int v223 = 64;
  int v224 = v223 + v101;
  bool v225 = true;
  int v226 = simt_wave_count_bits(v225);
  v99[v224] = v226;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
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
