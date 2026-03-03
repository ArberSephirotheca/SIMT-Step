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
  int v6 = 0;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11 = 4;
      int v12;
      v12 = v11;
      switch (v10) {
        case 0:
          {
          int v13 = 0;
          int v14 = 0;
          int v15;
          int v16;
          v15 = v13;
          v16 = v14;
          while (true) {
            int v17 = 4;
            int v18 = v3 % v17;
            int v19 = 1;
            int v20 = v18 + v19;
            bool v21 = v16 < v20;
            v15 = v15;
            v16 = v16;
            if (!v21) break;
            int v22 = 1;
            int v23 = 1;
            int v24 = v16 + v23;
            v15 = v22;
            v16 = v24;
            break;
            ;
          }
          int v25 = 4;
          v12 = v15;
          break;
        }
        case 1:
          {
          int v26 = 3;
          int v27 = v3 % v26;
          int v28 = 4;
          int v29;
          v29 = v28;
          switch (v27) {
            case 0:
              {
              v29 = v0;
              break;
            }
            default:
              {
              v29 = v0;
            }
            case 1:
              {
              int v30 = 4;
              v29 = v30;
              break;
            }
          }
          int v31 = 0;
          v12 = v29;
          break;
        }
        default:
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
            int v41 = 1;
            int v42 = v35 + v41;
            v34 = v0;
            v35 = v42;
          }
          int v43 = 4;
          int v44 = v0 + v43;
          v12 = v34;
          break;
        }
        case 2:
          {
          int v45 = 0;
          bool v46 = v2 != v45;
          int v47;
          if (v46) {
            int v48 = 4;
            int v49 = v0 + v48;
            v47 = v49;
          } else {
            v47 = v0;
          }
          int v50 = 1;
          int v51 = v0 + v50;
          v12 = v47;
          break;
        }
      }
      v8 = v12;
      break;
    }
    case 1:
      {
      int v52 = 0;
      int v53 = v0 + v52;
      v8 = v53;
      break;
    }
    default:
      {
      int v54 = 4;
      v8 = v54;
      break;
    }
    case 2:
      {
      int v55 = 2;
      int v56 = v3 % v55;
      int v57 = 4;
      int v58;
      v58 = v57;
      switch (v56) {
        case 0:
          {
          int v59 = 0;
          int v60 = 0;
          int v61;
          int v62;
          v61 = v59;
          v62 = v60;
          while (true) {
            int v63 = 4;
            int v64 = v3 % v63;
            int v65 = 1;
            int v66 = v64 + v65;
            bool v67 = v62 < v66;
            v61 = v61;
            v62 = v62;
            if (!v67) break;
            int v68 = 2;
            int v69 = 1;
            int v70 = v62 + v69;
            v61 = v68;
            v62 = v70;
          }
          v58 = v61;
          break;
        }
        default:
          {
          int v71 = 2;
          int v72 = v3 % v71;
          int v73;
          v73 = v0;
          switch (v72) {
            case 0:
              {
              int v74 = 0;
              int v75 = v0 + v74;
              v73 = v75;
              break;
            }
            default:
              {
              int v76 = 4;
              int v77 = v0 + v76;
              v73 = v77;
              break;
            }
          }
          int v78 = 0;
          v58 = v73;
          break;
        }
        case 1:
          {
          int v79 = 0;
          int v80 = 0;
          int v81;
          int v82;
          v81 = v79;
          v82 = v80;
          while (true) {
            int v83 = 4;
            int v84 = v3 % v83;
            int v85 = 1;
            int v86 = v84 + v85;
            bool v87 = v82 < v86;
            v81 = v81;
            v82 = v82;
            if (!v87) break;
            int v88 = 4;
            int v89 = 1;
            int v90 = v82 + v89;
            v81 = v88;
            v82 = v90;
          }
          int v91 = 0;
          v58 = v81;
          break;
        }
      }
      int v92 = 4;
      v8 = v58;
      break;
    }
  }
  bool v93 = true;
  int v94 = simt_wave_count_bits(v93);
  int v95 = 0;
  int v96 = v95 + v0;
  v1[v96] = v94;
  return;
}

kernel void kernel_main(device int* v97 [[buffer(0)]], device int* v98 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v99 = static_cast<int>(__simt_tid3.x);
  int v100 = 0;
  int v101 = v100 + v99;
  int v102 = v98[v101];
  int v103 = 4;
  int v104 = v103 + v99;
  int v105 = v98[v104];
  helper0(v99, v97, v102, v105, static_cast<int>(__simt_tid3.x));
  int v106 = 8;
  int v107 = v106 + v99;
  int v108 = v98[v107];
  int v109 = 0;
  bool v110 = v108 != v109;
  int v111;
  if (v110) {
    uint v112 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v113 = (int)(v112);
    v111 = v113;
  } else {
    int v114 = 12;
    int v115 = v114 + v99;
    int v116 = v98[v115];
    int v117 = 0;
    bool v118 = v116 != v117;
    int v119;
    if (v118) {
      int v120 = 16;
      int v121 = v120 + v99;
      int v122 = v98[v121];
      int v123 = 3;
      int v124 = v99 + v123;
      int v125;
      v125 = v124;
      switch (v122) {
        case 0:
          {
          int v126 = 0;
          int v127 = v99 + v126;
          v125 = v127;
          break;
        }
        case 1:
          {
          int v128 = 2;
          int v129 = v99 + v128;
          v125 = v129;
          break;
        }
        case 2:
          {
          int v130 = 0;
          int v131 = v99 + v130;
          v125 = v131;
          break;
        }
        default:
          {
          int v132 = 0;
          int v133 = v99 + v132;
          v125 = v133;
          break;
        }
      }
      bool v134 = true;
      v119 = v125;
    } else {
      int v135 = 20;
      int v136 = v135 + v99;
      int v137 = v98[v136];
      int v138 = 0;
      bool v139 = v137 != v138;
      int v140;
      if (v139) {
        v140 = v99;
      } else {
        uint v141 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v142 = (int)(v141);
        v140 = v142;
      }
      v119 = v140;
    }
    v111 = v119;
  }
  int v143 = 16;
  int v144 = v143 + v99;
  bool v145 = true;
  int v146 = simt_wave_count_bits(v145);
  v97[v144] = v146;
  int v147 = 24;
  int v148 = v147 + v99;
  int v149 = v98[v148];
  int v150 = 0;
  bool v151 = v149 != v150;
  int v152;
  if (v151) {
    int v153 = 28;
    int v154 = v153 + v99;
    int v155 = v98[v154];
    int v156 = 0;
    bool v157 = v155 != v156;
    int v158;
    if (v157) {
      int v159 = 32;
      int v160 = v159 + v99;
      int v161 = v98[v160];
      int v162 = 2;
      int v163 = v99 + v162;
      int v164;
      v164 = v163;
      switch (v161) {
        default:
          {
          v164 = v99;
          break;
        }
        case 0:
          {
          int v165 = 2;
          v164 = v165;
          break;
        }
      }
      bool v166 = true;
      v158 = v164;
    } else {
      uint v167 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v168 = (int)(v167);
      v158 = v168;
    }
    v152 = v158;
  } else {
    int v169 = 36;
    int v170 = v169 + v99;
    int v171 = v98[v170];
    int v172 = 2;
    int v173;
    v173 = v172;
    switch (v171) {
      case 0:
        {
        int v174 = 40;
        int v175 = v174 + v99;
        int v176 = v98[v175];
        int v177 = 0;
        bool v178 = v176 != v177;
        int v179;
        if (v178) {
          v179 = v99;
        } else {
          int v180 = 4;
          int v181 = v99 + v180;
          v179 = v181;
        }
        v173 = v179;
      }
      default:
        {
        int v182 = 44;
        int v183 = v182 + v99;
        int v184 = v98[v183];
        int v185 = 3;
        int v186 = v99 + v185;
        int v187;
        v187 = v186;
        switch (v184) {
          case 0:
            {
            int v188 = 4;
            v187 = v188;
            break;
          }
          case 1:
            {
            int v189 = 3;
            int v190 = v99 + v189;
            v187 = v190;
            break;
          }
          case 2:
            {
            int v191 = 3;
            v187 = v191;
            break;
          }
          default:
            {
            v187 = v99;
            break;
          }
        }
        bool v192 = true;
        v173 = v187;
        break;
      }
      case 1:
        {
        int v193 = 0;
        v173 = v193;
        break;
      }
    }
    bool v194 = true;
    v152 = v173;
  }
  int v195 = 32;
  int v196 = v195 + v99;
  bool v197 = true;
  int v198 = simt_wave_count_bits(v197);
  v97[v196] = v198;
  int v199 = 0;
  int v200 = 0;
  int v201;
  int v202;
  v201 = v199;
  v202 = v200;
  while (true) {
    int v203 = 4;
    int v204 = v202 * v203;
    int v205 = v204 + v99;
    int v206 = 48;
    int v207 = v206 + v205;
    int v208 = v98[v207];
    int v209 = 0;
    bool v210 = v208 != v209;
    v201 = v201;
    v202 = v202;
    if (!v210) break;
    int v211 = 0;
    int v212 = 0;
    int v213;
    int v214;
    v213 = v211;
    v214 = v212;
    while (true) {
      int v215 = 4;
      int v216 = v214 * v215;
      int v217 = v216 + v99;
      int v218 = 68;
      int v219 = v218 + v217;
      int v220 = v98[v219];
      int v221 = 0;
      bool v222 = v220 != v221;
      v213 = v213;
      v214 = v214;
      if (!v222) break;
      int v223 = v213 + v214;
      int v224 = 1;
      int v225 = v214 + v224;
      v213 = v223;
      v214 = v225;
      continue;
      ;
    }
    bool v226 = true;
    int v227 = v201 + v213;
    int v228 = 1;
    int v229 = v202 + v228;
    v201 = v227;
    v202 = v229;
  }
  bool v230 = true;
  int v231 = 48;
  int v232 = v231 + v99;
  bool v233 = true;
  int v234 = simt_wave_count_bits(v233);
  v97[v232] = v234;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
