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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 2;
  int v9 = v3 % v8;
  uint v10 = simt_lane_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    case 0:
      {
      int v13 = 2;
      int v14 = v3 % v13;
      int v15;
      v15 = v0;
      switch (v14) {
        case 0:
          {
          int v16 = 0;
          int v17 = 0;
          int v18;
          int v19;
          v18 = v16;
          v19 = v17;
          while (true) {
            int v20 = 4;
            int v21 = v3 % v20;
            int v22 = 1;
            int v23 = v21 + v22;
            bool v24 = v19 < v23;
            v18 = v18;
            v19 = v19;
            if (!v24) break;
            int v25 = 1;
            int v26 = v0 + v25;
            int v27 = 1;
            int v28 = v19 + v27;
            v18 = v26;
            v19 = v28;
          }
          v15 = v18;
          break;
        }
        case 1:
          {
          int v29 = 0;
          bool v30 = v2 != v29;
          int v31;
          if (v30) {
            int v32 = 1;
            int v33 = v0 + v32;
            v31 = v33;
          } else {
            int v34 = 4;
            v31 = v34;
          }
          v15 = v31;
          break;
        }
        default:
          {
          int v35 = 0;
          int v36 = 0;
          int v37;
          int v38;
          v37 = v35;
          v38 = v36;
          while (true) {
            int v39 = 4;
            int v40 = v3 % v39;
            int v41 = 1;
            int v42 = v40 + v41;
            bool v43 = v38 < v42;
            v37 = v37;
            v38 = v38;
            if (!v43) break;
            int v44 = 1;
            int v45 = v38 + v44;
            v37 = v0;
            v38 = v45;
          }
          v15 = v37;
          break;
        }
      }
      v12 = v15;
      break;
    }
    default:
      {
      int v46 = 4;
      int v47 = v3 % v46;
      int v48;
      v48 = v0;
      switch (v47) {
        default:
          {
          int v49 = 3;
          int v50 = v3 % v49;
          int v51 = 4;
          int v52;
          v52 = v51;
          switch (v50) {
            case 0:
              {
              int v53 = 4;
              int v54 = v0 + v53;
              v52 = v54;
              break;
            }
            case 1:
              {
              v52 = v0;
              break;
            }
            default:
              {
              v52 = v0;
              break;
            }
          }
          int v55 = 3;
          v48 = v52;
          break;
        }
        case 0:
          {
          int v56 = 4;
          int v57 = v3 % v56;
          int v58 = 2;
          int v59 = v0 + v58;
          int v60;
          v60 = v59;
          switch (v57) {
            case 0:
              {
              v60 = v0;
            }
            default:
              {
              int v61 = 3;
              v60 = v61;
              break;
            }
            case 1:
              {
              v60 = v0;
            }
            case 2:
              {
              int v62 = 0;
              v60 = v62;
              break;
            }
          }
          int v63 = 2;
          v48 = v60;
          break;
        }
        case 1:
          {
          int v64 = 4;
          int v65 = v3 % v64;
          int v66 = 0;
          int v67;
          v67 = v66;
          switch (v65) {
            case 0:
              {
              v67 = v0;
              break;
            }
            case 1:
              {
              int v68 = 0;
              int v69 = v0 + v68;
              v67 = v69;
              break;
            }
            default:
              {
              int v70 = 2;
              int v71 = v0 + v70;
              v67 = v71;
              break;
            }
            case 2:
              {
              int v72 = 0;
              int v73 = v0 + v72;
              v67 = v73;
              break;
            }
          }
          v48 = v67;
          break;
        }
        case 2:
          {
          int v74 = 0;
          int v75 = 0;
          int v76;
          int v77;
          v76 = v74;
          v77 = v75;
          while (true) {
            int v78 = 4;
            int v79 = v3 % v78;
            int v80 = 1;
            int v81 = v79 + v80;
            bool v82 = v77 < v81;
            v76 = v76;
            v77 = v77;
            if (!v82) break;
            int v83 = 3;
            int v84 = v0 + v83;
            int v85 = 1;
            int v86 = v77 + v85;
            v76 = v84;
            v77 = v86;
          }
          v48 = v76;
          break;
        }
      }
      int v87 = 1;
      int v88 = v0 + v87;
      v12 = v48;
    }
    case 1:
      {
      int v89 = 4;
      int v90 = v3 % v89;
      int v91 = 2;
      int v92 = v0 + v91;
      int v93;
      v93 = v92;
      switch (v90) {
        default:
          {
          int v94 = 4;
          int v95 = v3 % v94;
          int v96 = 0;
          int v97 = v0 + v96;
          int v98;
          v98 = v97;
          switch (v95) {
            case 0:
              {
              v98 = v0;
              break;
            }
            case 1:
              {
              v98 = v0;
              break;
            }
            default:
              {
              int v99 = 2;
              v98 = v99;
              break;
            }
            case 2:
              {
              v98 = v0;
              break;
            }
          }
          v93 = v98;
        }
        case 0:
          {
          int v100 = 0;
          int v101 = 0;
          int v102;
          int v103;
          v102 = v100;
          v103 = v101;
          while (true) {
            int v104 = 4;
            int v105 = v3 % v104;
            int v106 = 1;
            int v107 = v105 + v106;
            bool v108 = v103 < v107;
            v102 = v102;
            v103 = v103;
            if (!v108) break;
            int v109 = 1;
            int v110 = v103 + v109;
            v102 = v0;
            v103 = v110;
          }
          v93 = v102;
        }
        case 1:
          {
          int v111 = 0;
          int v112 = 0;
          int v113;
          int v114;
          v113 = v111;
          v114 = v112;
          while (true) {
            int v115 = 4;
            int v116 = v3 % v115;
            int v117 = 1;
            int v118 = v116 + v117;
            bool v119 = v114 < v118;
            v113 = v113;
            v114 = v114;
            if (!v119) break;
            int v120 = 3;
            int v121 = 1;
            int v122 = v114 + v121;
            v113 = v120;
            v114 = v122;
          }
          v93 = v113;
        }
        case 2:
          {
          int v123 = 0;
          int v124 = 0;
          int v125;
          int v126;
          v125 = v123;
          v126 = v124;
          while (true) {
            int v127 = 4;
            int v128 = v3 % v127;
            int v129 = 1;
            int v130 = v128 + v129;
            bool v131 = v126 < v130;
            v125 = v125;
            v126 = v126;
            if (!v131) break;
            int v132 = 4;
            int v133 = 1;
            int v134 = v126 + v133;
            v125 = v132;
            v126 = v134;
          }
          v93 = v125;
          break;
        }
      }
      int v135 = 1;
      int v136 = v0 + v135;
      v12 = v93;
      break;
    }
  }
  bool v137 = true;
  int v138 = simt_wave_count_bits(v137);
  int v139 = 16;
  int v140 = v139 + v0;
  v1[v140] = v138;
  int v141 = 0;
  bool v142 = v2 != v141;
  int v143 = v142 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v144 [[buffer(0)]], device int* v145 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v146 = static_cast<int>(__simt_tid3.x);
  int v147 = 0;
  int v148 = v147 + v146;
  int v149 = v145[v148];
  int v150 = 4;
  int v151 = v150 + v146;
  int v152 = v145[v151];
  helper0(v146, v144, v149, v152, static_cast<int>(__simt_tid3.x));
  int v153 = 8;
  int v154 = v153 + v146;
  int v155 = v145[v154];
  uint v156 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v157 = (int)(v156);
  int v158;
  v158 = v157;
  switch (v155) {
    case 0:
      {
      v158 = v146;
      break;
    }
    default:
      {
      int v159 = 0;
      int v160 = 0;
      int v161;
      int v162;
      v161 = v159;
      v162 = v160;
      while (true) {
        int v163 = 4;
        int v164 = v162 * v163;
        int v165 = v164 + v146;
        int v166 = 12;
        int v167 = v166 + v165;
        int v168 = v145[v167];
        int v169 = 0;
        bool v170 = v168 != v169;
        v161 = v161;
        v162 = v162;
        if (!v170) break;
        int v171 = v161 + v162;
        int v172 = 1;
        int v173 = v162 + v172;
        bool v174 = true;
        v161 = v171;
        v162 = v173;
      }
      v158 = v161;
      break;
    }
  }
  bool v175 = true;
  int v176 = 32;
  int v177 = v176 + v146;
  bool v178 = true;
  int v179 = simt_wave_count_bits(v178);
  v144[v177] = v179;
  int v180 = 0;
  int v181 = 0;
  int v182;
  int v183;
  v182 = v180;
  v183 = v181;
  while (true) {
    int v184 = 4;
    int v185 = v183 * v184;
    int v186 = v185 + v146;
    int v187 = 32;
    int v188 = v187 + v186;
    int v189 = v145[v188];
    int v190 = 0;
    bool v191 = v189 != v190;
    v182 = v182;
    v183 = v183;
    if (!v191) break;
    int v192 = v182 + v183;
    int v193 = 1;
    int v194 = v183 + v193;
    bool v195 = true;
    int v196 = 48;
    int v197 = 4;
    int v198 = v183 * v197;
    int v199 = v196 + v198;
    int v200 = v199 + v146;
    bool v201 = true;
    int v202 = simt_wave_count_bits(v201);
    v144[v200] = v202;
    v182 = v192;
    v183 = v194;
  }
  int v203 = 52;
  int v204 = v203 + v146;
  int v205 = v145[v204];
  int v206 = 0;
  bool v207 = v205 != v206;
  int v208;
  if (v207) {
    int v209 = 0;
    int v210 = 0;
    int v211;
    int v212;
    v211 = v209;
    v212 = v210;
    while (true) {
      int v213 = 4;
      int v214 = v212 * v213;
      int v215 = v214 + v146;
      int v216 = 56;
      int v217 = v216 + v215;
      int v218 = v145[v217];
      int v219 = 0;
      bool v220 = v218 != v219;
      v211 = v211;
      v212 = v212;
      if (!v220) break;
      uint v221 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v222 = (int)(v221);
      int v223 = v211 + v222;
      int v224 = 1;
      int v225 = v212 + v224;
      bool v226 = true;
      int v227 = 64;
      int v228 = 4;
      int v229 = v212 * v228;
      int v230 = v227 + v229;
      int v231 = v230 + v146;
      bool v232 = true;
      int v233 = simt_wave_count_bits(v232);
      v144[v231] = v233;
      v211 = v223;
      v212 = v225;
      continue;
      ;
    }
    v208 = v211;
  } else {
    int v234 = 76;
    int v235 = v234 + v146;
    int v236 = v145[v235];
    int v237 = 0;
    bool v238 = v236 != v237;
    int v239;
    if (v238) {
      uint v240 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v241 = (int)(v240);
      v239 = v241;
    } else {
      int v242 = 3;
      v239 = v242;
    }
    int v243 = 80;
    int v244 = v243 + v146;
    bool v245 = true;
    int v246 = simt_wave_count_bits(v245);
    v144[v244] = v246;
    v208 = v239;
  }
  int v247 = 96;
  int v248 = v247 + v146;
  bool v249 = true;
  int v250 = simt_wave_count_bits(v249);
  v144[v248] = v250;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
