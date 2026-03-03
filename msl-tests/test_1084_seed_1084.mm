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
    int v7 = 4;
    int v8 = v3 % v7;
    int v9;
    v9 = v0;
    switch (v8) {
      default:
        {
        int v10 = 0;
        bool v11 = v2 != v10;
        int v12;
        if (v11) {
          int v13 = 2;
          v12 = v13;
        } else {
          int v14 = 3;
          int v15 = v0 + v14;
          v12 = v15;
        }
        int v16 = 4;
        v9 = v12;
        break;
      }
      case 0:
        {
        int v17 = 3;
        int v18 = v3 % v17;
        int v19 = 3;
        int v20;
        v20 = v19;
        switch (v18) {
          case 0:
            {
            int v21 = 4;
            v20 = v21;
            break;
          }
          default:
            {
            int v22 = 1;
            v20 = v22;
            break;
          }
          case 1:
            {
            int v23 = 2;
            v20 = v23;
            break;
          }
        }
        int v24 = 0;
        int v25 = v0 + v24;
        v9 = v20;
        break;
      }
      case 1:
        {
        int v26 = 0;
        int v27 = 0;
        int v28;
        int v29;
        v28 = v26;
        v29 = v27;
        while (true) {
          int v30 = 4;
          int v31 = v3 % v30;
          int v32 = 1;
          int v33 = v31 + v32;
          bool v34 = v29 < v33;
          v28 = v28;
          v29 = v29;
          if (!v34) break;
          int v35 = 4;
          int v36 = v0 + v35;
          int v37 = 1;
          int v38 = v29 + v37;
          v28 = v36;
          v29 = v38;
        }
        v9 = v28;
      }
      case 2:
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
            int v45 = v0 + v44;
            v43 = v45;
            break;
          }
          case 0:
            {
            int v46 = 0;
            int v47 = v0 + v46;
            v43 = v47;
            break;
          }
          case 1:
            {
            int v48 = 3;
            v43 = v48;
            break;
          }
        }
        int v49 = 4;
        int v50 = v0 + v49;
        v9 = v43;
        break;
      }
    }
    uint v51 = simt_lane_id(__simt_tid);
    int v52 = (int)(v51);
    v6 = v9;
  } else {
    int v53 = 0;
    int v54 = 0;
    int v55;
    int v56;
    v55 = v53;
    v56 = v54;
    while (true) {
      int v57 = 4;
      int v58 = v3 % v57;
      int v59 = 1;
      int v60 = v58 + v59;
      bool v61 = v56 < v60;
      v55 = v55;
      v56 = v56;
      if (!v61) break;
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
      int v74 = 0;
      int v75 = v0 + v74;
      int v76 = 1;
      int v77 = v56 + v76;
      v55 = v64;
      v56 = v77;
    }
    v6 = v55;
  }
  bool v78 = true;
  int v79 = simt_wave_count_bits(v78);
  int v80 = 0;
  int v81 = v80 + v0;
  v1[v81] = v79;
  return;
}

kernel void kernel_main(device int* v82 [[buffer(0)]], device int* v83 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v84 = static_cast<int>(__simt_tid3.x);
  int v85 = 0;
  int v86 = v85 + v84;
  int v87 = v83[v86];
  int v88 = 4;
  int v89 = v88 + v84;
  int v90 = v83[v89];
  helper0(v84, v82, v87, v90, static_cast<int>(__simt_tid3.x));
  int v91 = 8;
  int v92 = v91 + v84;
  int v93 = v83[v92];
  int v94 = 0;
  bool v95 = v93 != v94;
  int v96;
  if (v95) {
    uint v97 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v98 = (int)(v97);
    v96 = v98;
  } else {
    int v99 = 12;
    int v100 = v99 + v84;
    int v101 = v83[v100];
    int v102 = 0;
    bool v103 = v101 != v102;
    int v104;
    if (v103) {
      uint v105 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v106 = (int)(v105);
      v104 = v106;
    } else {
      int v107 = 16;
      int v108 = v107 + v84;
      int v109 = v83[v108];
      int v110 = 0;
      bool v111 = v109 != v110;
      int v112;
      if (v111) {
        int v113 = 2;
        int v114 = v84 + v113;
        v112 = v114;
      } else {
        uint v115 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v116 = (int)(v115);
        v112 = v116;
      }
      v104 = v112;
    }
    v96 = v104;
  }
  int v117 = 16;
  int v118 = v117 + v84;
  bool v119 = true;
  int v120 = simt_wave_count_bits(v119);
  v82[v118] = v120;
  int v121 = 20;
  int v122 = v121 + v84;
  int v123 = v83[v122];
  int v124 = 0;
  int v125 = v84 + v124;
  int v126;
  v126 = v125;
  switch (v123) {
    default:
      {
      int v127 = 24;
      int v128 = v127 + v84;
      int v129 = v83[v128];
      int v130;
      v130 = v84;
      switch (v129) {
        default:
          {
          int v131 = 0;
          int v132 = 0;
          int v133;
          int v134;
          v133 = v131;
          v134 = v132;
          while (true) {
            int v135 = 4;
            int v136 = v134 * v135;
            int v137 = v136 + v84;
            int v138 = 28;
            int v139 = v138 + v137;
            int v140 = v83[v139];
            int v141 = 0;
            bool v142 = v140 != v141;
            v133 = v133;
            v134 = v134;
            if (!v142) break;
            int v143 = v133 + v134;
            int v144 = 1;
            int v145 = v134 + v144;
            v133 = v143;
            v134 = v145;
            continue;
            ;
          }
          bool v146 = true;
          v130 = v133;
        }
        case 0:
          {
          int v147 = 3;
          v130 = v147;
          break;
        }
        case 1:
          {
          int v148 = 48;
          int v149 = v148 + v84;
          int v150 = v83[v149];
          int v151 = 3;
          int v152 = v84 + v151;
          int v153;
          v153 = v152;
          switch (v150) {
            case 0:
              {
              int v154 = 3;
              int v155 = v84 + v154;
              v153 = v155;
              break;
            }
            default:
              {
              int v156 = 1;
              int v157 = v84 + v156;
              v153 = v157;
              break;
            }
            case 1:
              {
              int v158 = 4;
              int v159 = v84 + v158;
              v153 = v159;
              break;
            }
            case 2:
              {
              v153 = v84;
              break;
            }
          }
          bool v160 = true;
          v130 = v153;
          break;
        }
        case 2:
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
            int v167 = v166 + v84;
            int v168 = 52;
            int v169 = v168 + v167;
            int v170 = v83[v169];
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
          v130 = v163;
          break;
        }
      }
      bool v177 = true;
      v126 = v130;
      break;
    }
    case 0:
      {
      int v178 = 72;
      int v179 = v178 + v84;
      int v180 = v83[v179];
      int v181;
      v181 = v84;
      switch (v180) {
        default:
          {
          int v182 = 0;
          int v183 = 0;
          int v184;
          int v185;
          v184 = v182;
          v185 = v183;
          while (true) {
            int v186 = 4;
            int v187 = v185 * v186;
            int v188 = v187 + v84;
            int v189 = 76;
            int v190 = v189 + v188;
            int v191 = v83[v190];
            int v192 = 0;
            bool v193 = v191 != v192;
            v184 = v184;
            v185 = v185;
            if (!v193) break;
            int v194 = v184 + v185;
            int v195 = 1;
            int v196 = v185 + v195;
            v184 = v194;
            v185 = v196;
          }
          bool v197 = true;
          v181 = v184;
          break;
        }
        case 0:
          {
          int v198 = 0;
          int v199 = 0;
          int v200;
          int v201;
          v200 = v198;
          v201 = v199;
          while (true) {
            int v202 = 4;
            int v203 = v201 * v202;
            int v204 = v203 + v84;
            int v205 = 96;
            int v206 = v205 + v204;
            int v207 = v83[v206];
            int v208 = 0;
            bool v209 = v207 != v208;
            v200 = v200;
            v201 = v201;
            if (!v209) break;
            int v210 = v200 + v201;
            int v211 = 1;
            int v212 = v201 + v211;
            v200 = v210;
            v201 = v212;
          }
          bool v213 = true;
          v181 = v200;
          break;
        }
      }
      bool v214 = true;
      v126 = v181;
    }
    case 1:
      {
      v126 = v84;
    }
    case 2:
      {
      int v215 = 0;
      int v216 = 0;
      int v217;
      int v218;
      v217 = v215;
      v218 = v216;
      while (true) {
        int v219 = 4;
        int v220 = v218 * v219;
        int v221 = v220 + v84;
        int v222 = 116;
        int v223 = v222 + v221;
        int v224 = v83[v223];
        int v225 = 0;
        bool v226 = v224 != v225;
        v217 = v217;
        v218 = v218;
        if (!v226) break;
        int v227 = v217 + v218;
        int v228 = 1;
        int v229 = v218 + v228;
        v217 = v227;
        v218 = v229;
        break;
        ;
      }
      bool v230 = true;
      v126 = v217;
      break;
    }
  }
  bool v231 = true;
  int v232 = 32;
  int v233 = v232 + v84;
  bool v234 = true;
  int v235 = simt_wave_count_bits(v234);
  v82[v233] = v235;
  int v236 = 136;
  int v237 = v236 + v84;
  int v238 = v83[v237];
  int v239 = 0;
  bool v240 = v238 != v239;
  int v241;
  if (v240) {
    int v242 = 140;
    int v243 = v242 + v84;
    int v244 = v83[v243];
    int v245 = 0;
    bool v246 = v244 != v245;
    int v247;
    if (v246) {
      int v248 = 144;
      int v249 = v248 + v84;
      int v250 = v83[v249];
      int v251 = 0;
      bool v252 = v250 != v251;
      int v253;
      if (v252) {
        int v254 = 4;
        v253 = v254;
      } else {
        uint v255 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v256 = (int)(v255);
        v253 = v256;
      }
      v247 = v253;
    } else {
      v247 = v84;
    }
    v241 = v247;
  } else {
    int v257 = 148;
    int v258 = v257 + v84;
    int v259 = v83[v258];
    int v260;
    v260 = v84;
    switch (v259) {
      case 0:
        {
        int v261 = 2;
        int v262 = v84 + v261;
        v260 = v262;
      }
      default:
        {
        int v263 = 152;
        int v264 = v263 + v84;
        int v265 = v83[v264];
        int v266 = 0;
        bool v267 = v265 != v266;
        int v268;
        if (v267) {
          int v269 = 2;
          int v270 = v84 + v269;
          v268 = v270;
        } else {
          v268 = v84;
        }
        v260 = v268;
      }
      case 1:
        {
        int v271 = 156;
        int v272 = v271 + v84;
        int v273 = v83[v272];
        int v274 = 0;
        bool v275 = v273 != v274;
        int v276;
        if (v275) {
          v276 = v84;
        } else {
          v276 = v84;
        }
        v260 = v276;
        break;
      }
    }
    bool v277 = true;
    v241 = v260;
  }
  int v278 = 48;
  int v279 = v278 + v84;
  bool v280 = true;
  int v281 = simt_wave_count_bits(v280);
  v82[v279] = v281;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 160; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
