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
      int v9 = 2;
      int v10 = v3 % v9;
      int v11;
      v11 = v0;
      switch (v10) {
        case 0:
          {
          int v12 = 0;
          bool v13 = v2 != v12;
          int v14;
          if (v13) {
            v14 = v0;
          } else {
            int v15 = 0;
            int v16 = v0 + v15;
            v14 = v16;
          }
          int v17 = 2;
          int v18 = v0 + v17;
          v11 = v14;
          break;
        }
        default:
          {
          int v19 = 3;
          int v20;
          v20 = v19;
          switch (v3) {
            default:
              {
              int v21 = 3;
              int v22 = v0 + v21;
              v20 = v22;
              break;
            }
            case 0:
              {
              int v23 = 3;
              int v24 = v0 + v23;
              v20 = v24;
              break;
            }
          }
          int v25 = 1;
          int v26 = v0 + v25;
          v11 = v20;
          break;
        }
        case 1:
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
            int v36 = 0;
            int v37 = 1;
            int v38 = v30 + v37;
            v29 = v36;
            v30 = v38;
          }
          int v39 = 2;
          v11 = v29;
          break;
        }
      }
      int v40 = 2;
      v8 = v11;
      break;
    }
    case 1:
      {
      int v41 = 2;
      int v42 = v3 % v41;
      int v43 = 3;
      int v44;
      v44 = v43;
      switch (v42) {
        default:
          {
          int v45 = 1;
          int v46 = v0 + v45;
          v44 = v46;
        }
        case 0:
          {
          int v47 = 0;
          bool v48 = v2 != v47;
          int v49;
          if (v48) {
            v49 = v0;
          } else {
            v49 = v0;
          }
          v44 = v49;
          break;
        }
      }
      int v50 = 2;
      v8 = v44;
      break;
    }
    default:
      {
      int v51 = 0;
      bool v52 = v2 != v51;
      int v53;
      if (v52) {
        v53 = v0;
      } else {
        int v54 = 2;
        int v55 = v0 + v54;
        v53 = v55;
      }
      int v56 = 3;
      int v57 = v0 + v56;
      v8 = v53;
      break;
    }
    case 2:
      {
      int v58 = 0;
      int v59 = 0;
      int v60;
      int v61;
      v60 = v58;
      v61 = v59;
      while (true) {
        int v62 = 4;
        int v63 = v3 % v62;
        int v64 = 1;
        int v65 = v63 + v64;
        bool v66 = v61 < v65;
        v60 = v60;
        v61 = v61;
        if (!v66) break;
        int v67 = 4;
        int v68 = v3 % v67;
        int v69 = 3;
        int v70;
        v70 = v69;
        switch (v68) {
          case 0:
            {
            int v71 = 2;
            v70 = v71;
            break;
          }
          case 1:
            {
            int v72 = 2;
            v70 = v72;
            break;
          }
          case 2:
            {
            v70 = v0;
            break;
          }
          default:
            {
            int v73 = 3;
            int v74 = v0 + v73;
            v70 = v74;
            break;
          }
        }
        int v75 = 3;
        int v76 = v0 + v75;
        int v77 = 1;
        int v78 = v61 + v77;
        v60 = v70;
        v61 = v78;
      }
      v8 = v60;
      break;
    }
  }
  bool v79 = true;
  int v80 = simt_wave_count_bits(v79);
  int v81 = 0;
  int v82 = v81 + v0;
  v1[v82] = v80;
  return;
}

kernel void kernel_main(device int* v83 [[buffer(0)]], device int* v84 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v85 = static_cast<int>(__simt_tid3.x);
  int v86 = 0;
  int v87 = v86 + v85;
  int v88 = v84[v87];
  int v89 = 4;
  int v90 = v89 + v85;
  int v91 = v84[v90];
  helper0(v85, v83, v88, v91, static_cast<int>(__simt_tid3.x));
  int v92 = 8;
  int v93 = v92 + v85;
  int v94 = v84[v93];
  uint v95 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v96 = (int)(v95);
  int v97;
  v97 = v96;
  switch (v94) {
    case 0:
      {
      int v98 = 1;
      int v99 = v85 + v98;
      v97 = v99;
      break;
    }
    case 1:
      {
      int v100 = 12;
      int v101 = v100 + v85;
      int v102 = v84[v101];
      int v103 = 1;
      int v104 = v85 + v103;
      int v105;
      v105 = v104;
      switch (v102) {
        case 0:
          {
          int v106 = 3;
          int v107 = v85 + v106;
          v105 = v107;
          break;
        }
        case 1:
          {
          int v108 = 16;
          int v109 = v108 + v85;
          int v110 = v84[v109];
          int v111 = 2;
          int v112 = v85 + v111;
          int v113;
          v113 = v112;
          switch (v110) {
            case 0:
              {
              int v114 = 2;
              v113 = v114;
              break;
            }
            default:
              {
              v113 = v85;
              break;
            }
            case 1:
              {
              int v115 = 3;
              v113 = v115;
              break;
            }
          }
          bool v116 = true;
          v105 = v113;
          break;
        }
        default:
          {
          int v117 = 20;
          int v118 = v117 + v85;
          int v119 = v84[v118];
          int v120 = 0;
          bool v121 = v119 != v120;
          int v122;
          if (v121) {
            int v123 = 3;
            v122 = v123;
          } else {
            int v124 = 4;
            int v125 = v85 + v124;
            v122 = v125;
          }
          v105 = v122;
          break;
        }
      }
      bool v126 = true;
      v97 = v105;
      break;
    }
    case 2:
      {
      int v127 = 24;
      int v128 = v127 + v85;
      int v129 = v84[v128];
      int v130 = 0;
      bool v131 = v129 != v130;
      int v132;
      if (v131) {
        int v133 = 28;
        int v134 = v133 + v85;
        int v135 = v84[v134];
        int v136 = 0;
        bool v137 = v135 != v136;
        int v138;
        if (v137) {
          int v139 = 4;
          v138 = v139;
        } else {
          int v140 = 4;
          int v141 = v85 + v140;
          v138 = v141;
        }
        v132 = v138;
      } else {
        int v142 = 0;
        int v143 = 0;
        int v144;
        int v145;
        v144 = v142;
        v145 = v143;
        while (true) {
          int v146 = 4;
          int v147 = v145 * v146;
          int v148 = v147 + v85;
          int v149 = 32;
          int v150 = v149 + v148;
          int v151 = v84[v150];
          int v152 = 0;
          bool v153 = v151 != v152;
          v144 = v144;
          v145 = v145;
          if (!v153) break;
          int v154 = v144 + v145;
          int v155 = 1;
          int v156 = v145 + v155;
          v144 = v154;
          v145 = v156;
        }
        bool v157 = true;
        v132 = v144;
      }
      v97 = v132;
      break;
    }
    default:
      {
      int v158 = 0;
      int v159 = 0;
      int v160;
      int v161;
      v160 = v158;
      v161 = v159;
      while (true) {
        int v162 = 4;
        int v163 = v161 * v162;
        int v164 = v163 + v85;
        int v165 = 52;
        int v166 = v165 + v164;
        int v167 = v84[v166];
        int v168 = 0;
        bool v169 = v167 != v168;
        v160 = v160;
        v161 = v161;
        if (!v169) break;
        int v170 = 72;
        int v171 = v170 + v85;
        int v172 = v84[v171];
        int v173 = 1;
        int v174 = v85 + v173;
        int v175;
        v175 = v174;
        switch (v172) {
          default:
            {
            int v176 = 1;
            v175 = v176;
            break;
          }
          case 0:
            {
            v175 = v85;
            break;
          }
        }
        bool v177 = true;
        int v178 = v160 + v175;
        int v179 = 1;
        int v180 = v161 + v179;
        v160 = v178;
        v161 = v180;
      }
      bool v181 = true;
      v97 = v160;
      break;
    }
  }
  bool v182 = true;
  int v183 = 16;
  int v184 = v183 + v85;
  bool v185 = true;
  int v186 = simt_wave_count_bits(v185);
  v83[v184] = v186;
  int v187 = 2;
  int v188 = 76;
  int v189 = v188 + v85;
  int v190 = v84[v189];
  int v191 = 1;
  int v192;
  v192 = v191;
  switch (v190) {
    default:
      {
      int v193 = 0;
      int v194 = 0;
      int v195;
      int v196;
      v195 = v193;
      v196 = v194;
      while (true) {
        int v197 = 4;
        int v198 = v196 * v197;
        int v199 = v198 + v85;
        int v200 = 80;
        int v201 = v200 + v199;
        int v202 = v84[v201];
        int v203 = 0;
        bool v204 = v202 != v203;
        v195 = v195;
        v196 = v196;
        if (!v204) break;
        int v205 = 0;
        int v206 = 0;
        int v207;
        int v208;
        v207 = v205;
        v208 = v206;
        while (true) {
          int v209 = 4;
          int v210 = v208 * v209;
          int v211 = v210 + v85;
          int v212 = 100;
          int v213 = v212 + v211;
          int v214 = v84[v213];
          int v215 = 0;
          bool v216 = v214 != v215;
          v207 = v207;
          v208 = v208;
          if (!v216) break;
          int v217 = v207 + v208;
          int v218 = 1;
          int v219 = v208 + v218;
          v207 = v217;
          v208 = v219;
        }
        bool v220 = true;
        int v221 = v195 + v207;
        int v222 = 1;
        int v223 = v196 + v222;
        v195 = v221;
        v196 = v223;
      }
      bool v224 = true;
      v192 = v195;
      break;
    }
    case 0:
      {
      int v225 = 1;
      v192 = v225;
      break;
    }
    case 1:
      {
      int v226 = 120;
      int v227 = v226 + v85;
      int v228 = v84[v227];
      int v229 = 0;
      bool v230 = v228 != v229;
      int v231;
      if (v230) {
        int v232 = 124;
        int v233 = v232 + v85;
        int v234 = v84[v233];
        int v235 = 0;
        bool v236 = v234 != v235;
        int v237;
        if (v236) {
          int v238 = 2;
          int v239 = v85 + v238;
          v237 = v239;
        } else {
          int v240 = 4;
          int v241 = v85 + v240;
          v237 = v241;
        }
        v231 = v237;
      } else {
        int v242 = 128;
        int v243 = v242 + v85;
        int v244 = v84[v243];
        int v245 = 0;
        bool v246 = v244 != v245;
        int v247;
        if (v246) {
          int v248 = 4;
          int v249 = v85 + v248;
          v247 = v249;
        } else {
          int v250 = 3;
          v247 = v250;
        }
        v231 = v247;
      }
      v192 = v231;
      break;
    }
    case 2:
      {
      int v251 = 0;
      int v252 = 0;
      int v253;
      int v254;
      v253 = v251;
      v254 = v252;
      while (true) {
        int v255 = 4;
        int v256 = v254 * v255;
        int v257 = v256 + v85;
        int v258 = 132;
        int v259 = v258 + v257;
        int v260 = v84[v259];
        int v261 = 0;
        bool v262 = v260 != v261;
        v253 = v253;
        v254 = v254;
        if (!v262) break;
        int v263 = v253 + v254;
        int v264 = 1;
        int v265 = v254 + v264;
        v253 = v263;
        v254 = v265;
      }
      bool v266 = true;
      v192 = v253;
      break;
    }
  }
  bool v267 = true;
  int v268 = 32;
  int v269 = v268 + v85;
  bool v270 = true;
  int v271 = simt_wave_count_bits(v270);
  v83[v269] = v271;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 152; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
