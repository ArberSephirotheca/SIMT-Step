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
  int v6 = 4;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 1;
      v8 = v9;
    }
    case 1:
      {
      int v10 = 0;
      int v11 = 0;
      int v12;
      int v13;
      v12 = v10;
      v13 = v11;
      while (true) {
        int v14 = 4;
        int v15 = v3 % v14;
        int v16 = 1;
        int v17 = v15 + v16;
        bool v18 = v13 < v17;
        v12 = v12;
        v13 = v13;
        if (!v18) break;
        int v19 = 0;
        bool v20 = v2 != v19;
        int v21;
        if (v20) {
          int v22 = 3;
          int v23 = v0 + v22;
          v21 = v23;
        } else {
          v21 = v0;
        }
        int v24 = 1;
        int v25 = 1;
        int v26 = v13 + v25;
        v12 = v21;
        v13 = v26;
      }
      v8 = v12;
      break;
    }
    case 2:
      {
      int v27 = 0;
      int v28 = 0;
      int v29;
      int v30;
      v29 = v27;
      v30 = v28;
      while (true) {
        int v31 = 4;
        int v32 = v3 % v31;
        int v33 = 1;
        int v34 = v32 + v33;
        bool v35 = v30 < v34;
        v29 = v29;
        v30 = v30;
        if (!v35) break;
        int v36;
        v36 = v0;
        switch (v3) {
          default:
            {
            v36 = v0;
            break;
          }
          case 0:
            {
            v36 = v0;
            break;
          }
        }
        int v37 = 4;
        int v38 = 1;
        int v39 = v30 + v38;
        v29 = v36;
        v30 = v39;
      }
      int v40 = 3;
      int v41 = v0 + v40;
      v8 = v29;
    }
    default:
      {
      int v42 = 4;
      int v43 = v3 % v42;
      int v44 = 2;
      int v45 = v0 + v44;
      int v46;
      v46 = v45;
      switch (v43) {
        default:
          {
          int v47 = 0;
          bool v48 = v2 != v47;
          int v49;
          if (v48) {
            int v50 = 3;
            v49 = v50;
          } else {
            int v51 = 0;
            int v52 = v0 + v51;
            v49 = v52;
          }
          int v53 = 1;
          int v54 = v0 + v53;
          v46 = v49;
          break;
        }
        case 0:
          {
          int v55 = 4;
          int v56 = v3 % v55;
          int v57 = 0;
          int v58;
          v58 = v57;
          switch (v56) {
            default:
              {
              int v59 = 4;
              int v60 = v0 + v59;
              v58 = v60;
              break;
            }
            case 0:
              {
              v58 = v0;
              break;
            }
            case 1:
              {
              int v61 = 0;
              int v62 = v0 + v61;
              v58 = v62;
              break;
            }
            case 2:
              {
              int v63 = 3;
              int v64 = v0 + v63;
              v58 = v64;
              break;
            }
          }
          int v65 = 3;
          int v66 = v0 + v65;
          v46 = v58;
        }
        case 1:
          {
          int v67 = 3;
          int v68 = v3 % v67;
          int v69 = 2;
          int v70 = v0 + v69;
          int v71;
          v71 = v70;
          switch (v68) {
            default:
              {
              v71 = v0;
              break;
            }
            case 0:
              {
              int v72 = 3;
              int v73 = v0 + v72;
              v71 = v73;
              break;
            }
            case 1:
              {
              int v74 = 0;
              v71 = v74;
              break;
            }
            case 2:
              {
              int v75 = 1;
              v71 = v75;
              break;
            }
          }
          v46 = v71;
          break;
        }
        case 2:
          {
          int v76 = 3;
          int v77 = v3 % v76;
          int v78;
          v78 = v0;
          switch (v77) {
            default:
              {
              v78 = v0;
              break;
            }
            case 0:
              {
              int v79 = 3;
              v78 = v79;
              break;
            }
            case 1:
              {
              v78 = v0;
              break;
            }
          }
          int v80 = 1;
          int v81 = v0 + v80;
          v46 = v78;
          break;
        }
      }
      int v82 = 2;
      int v83 = v0 + v82;
      v8 = v46;
      break;
    }
  }
  bool v84 = true;
  int v85 = simt_wave_count_bits(v84);
  int v86 = 0;
  int v87 = v86 + v0;
  v1[v87] = v85;
  return;
}

kernel void kernel_main(device int* v88 [[buffer(0)]], device int* v89 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v90 = static_cast<int>(__simt_tid3.x);
  int v91 = 0;
  int v92 = v91 + v90;
  int v93 = v89[v92];
  int v94 = 4;
  int v95 = v94 + v90;
  int v96 = v89[v95];
  helper0(v90, v88, v93, v96, static_cast<int>(__simt_tid3.x));
  int v97 = 0;
  int v98 = 0;
  int v99;
  int v100;
  v99 = v97;
  v100 = v98;
  while (true) {
    int v101 = 4;
    int v102 = v100 * v101;
    int v103 = v102 + v90;
    int v104 = 8;
    int v105 = v104 + v103;
    int v106 = v89[v105];
    int v107 = 0;
    bool v108 = v106 != v107;
    v99 = v99;
    v100 = v100;
    if (!v108) break;
    int v109 = 0;
    int v110 = 0;
    int v111;
    int v112;
    v111 = v109;
    v112 = v110;
    while (true) {
      int v113 = 4;
      int v114 = v112 * v113;
      int v115 = v114 + v90;
      int v116 = 28;
      int v117 = v116 + v115;
      int v118 = v89[v117];
      int v119 = 0;
      bool v120 = v118 != v119;
      v111 = v111;
      v112 = v112;
      if (!v120) break;
      uint v121 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v122 = (int)(v121);
      int v123 = v111 + v122;
      int v124 = 1;
      int v125 = v112 + v124;
      v111 = v123;
      v112 = v125;
    }
    bool v126 = true;
    int v127 = v99 + v111;
    int v128 = 1;
    int v129 = v100 + v128;
    v99 = v127;
    v100 = v129;
  }
  bool v130 = true;
  int v131 = 16;
  int v132 = v131 + v90;
  bool v133 = true;
  int v134 = simt_wave_count_bits(v133);
  v88[v132] = v134;
  uint v135 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v136 = (int)(v135);
  int v137 = 0;
  int v138 = 0;
  int v139;
  int v140;
  v139 = v137;
  v140 = v138;
  while (true) {
    int v141 = 4;
    int v142 = v140 * v141;
    int v143 = v142 + v90;
    int v144 = 48;
    int v145 = v144 + v143;
    int v146 = v89[v145];
    int v147 = 0;
    bool v148 = v146 != v147;
    v139 = v139;
    v140 = v140;
    if (!v148) break;
    uint v149 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v150 = (int)(v149);
    int v151 = v139 + v150;
    int v152 = 1;
    int v153 = v140 + v152;
    v139 = v151;
    v140 = v153;
  }
  bool v154 = true;
  int v155 = 32;
  int v156 = v155 + v90;
  bool v157 = true;
  int v158 = simt_wave_count_bits(v157);
  v88[v156] = v158;
  int v159 = 68;
  int v160 = v159 + v90;
  int v161 = v89[v160];
  uint v162 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v163 = (int)(v162);
  int v164;
  v164 = v163;
  switch (v161) {
    case 0:
      {
      int v165 = 0;
      v164 = v165;
      break;
    }
    case 1:
      {
      int v166 = 72;
      int v167 = v166 + v90;
      int v168 = v89[v167];
      int v169 = 0;
      bool v170 = v168 != v169;
      int v171;
      if (v170) {
        int v172 = 76;
        int v173 = v172 + v90;
        int v174 = v89[v173];
        int v175 = 0;
        bool v176 = v174 != v175;
        int v177;
        if (v176) {
          v177 = v90;
        } else {
          int v178 = 3;
          int v179 = v90 + v178;
          v177 = v179;
        }
        v171 = v177;
      } else {
        int v180 = 80;
        int v181 = v180 + v90;
        int v182 = v89[v181];
        int v183 = 0;
        bool v184 = v182 != v183;
        int v185;
        if (v184) {
          int v186 = 0;
          v185 = v186;
        } else {
          int v187 = 0;
          v185 = v187;
        }
        v171 = v185;
      }
      v164 = v171;
    }
    case 2:
      {
      int v188 = 84;
      int v189 = v188 + v90;
      int v190 = v89[v189];
      int v191 = 2;
      int v192 = v90 + v191;
      int v193;
      v193 = v192;
      switch (v190) {
        case 0:
          {
          int v194 = 88;
          int v195 = v194 + v90;
          int v196 = v89[v195];
          int v197 = 0;
          bool v198 = v196 != v197;
          int v199;
          if (v198) {
            int v200 = 4;
            int v201 = v90 + v200;
            v199 = v201;
          } else {
            int v202 = 2;
            int v203 = v90 + v202;
            v199 = v203;
          }
          v193 = v199;
          break;
        }
        case 1:
          {
          int v204 = 92;
          int v205 = v204 + v90;
          int v206 = v89[v205];
          int v207 = 0;
          bool v208 = v206 != v207;
          int v209;
          if (v208) {
            v209 = v90;
          } else {
            int v210 = 3;
            v209 = v210;
          }
          v193 = v209;
          break;
        }
        default:
          {
          int v211 = 0;
          int v212 = 0;
          int v213;
          int v214;
          v213 = v211;
          v214 = v212;
          while (true) {
            int v215 = 4;
            int v216 = v214 * v215;
            int v217 = v216 + v90;
            int v218 = 96;
            int v219 = v218 + v217;
            int v220 = v89[v219];
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
          }
          bool v226 = true;
          v193 = v213;
          break;
        }
      }
      bool v227 = true;
      v164 = v193;
    }
    default:
      {
      int v228 = 116;
      int v229 = v228 + v90;
      int v230 = v89[v229];
      int v231 = 0;
      bool v232 = v230 != v231;
      int v233;
      if (v232) {
        int v234 = 120;
        int v235 = v234 + v90;
        int v236 = v89[v235];
        int v237 = 4;
        int v238 = v90 + v237;
        int v239;
        v239 = v238;
        switch (v236) {
          case 0:
            {
            int v240 = 3;
            v239 = v240;
            break;
          }
          default:
            {
            int v241 = 1;
            v239 = v241;
            break;
          }
        }
        bool v242 = true;
        v233 = v239;
      } else {
        int v243 = 124;
        int v244 = v243 + v90;
        int v245 = v89[v244];
        int v246 = 0;
        bool v247 = v245 != v246;
        int v248;
        if (v247) {
          v248 = v90;
        } else {
          v248 = v90;
        }
        v233 = v248;
      }
      v164 = v233;
      break;
    }
  }
  bool v249 = true;
  int v250 = 48;
  int v251 = v250 + v90;
  bool v252 = true;
  int v253 = simt_wave_count_bits(v252);
  v88[v251] = v253;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
