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
  int v8 = 3;
  int v9 = v3 % v8;
  int v10 = 2;
  int v11 = v0 + v10;
  int v12;
  v12 = v11;
  switch (v9) {
    case 0:
      {
      int v13 = 2;
      int v14 = v3 % v13;
      int v15 = 2;
      int v16;
      v16 = v15;
      switch (v14) {
        case 0:
          {
          int v17 = 0;
          int v18 = v0 + v17;
          v16 = v18;
          break;
        }
        case 1:
          {
          int v19 = 0;
          int v20 = 0;
          int v21;
          int v22;
          v21 = v19;
          v22 = v20;
          while (true) {
            int v23 = 4;
            int v24 = v3 % v23;
            int v25 = 1;
            int v26 = v24 + v25;
            bool v27 = v22 < v26;
            v21 = v21;
            v22 = v22;
            if (!v27) break;
            int v28 = 3;
            int v29 = 1;
            int v30 = v22 + v29;
            v21 = v28;
            v22 = v30;
          }
          v16 = v21;
          break;
        }
        default:
          {
          int v31 = 0;
          int v32 = 0;
          int v33;
          int v34;
          v33 = v31;
          v34 = v32;
          while (true) {
            int v35 = 4;
            int v36 = v3 % v35;
            int v37 = 1;
            int v38 = v36 + v37;
            bool v39 = v34 < v38;
            v33 = v33;
            v34 = v34;
            if (!v39) break;
            int v40 = 1;
            int v41 = v34 + v40;
            v33 = v0;
            v34 = v41;
          }
          v16 = v33;
          break;
        }
      }
      v12 = v16;
      break;
    }
    case 1:
      {
      int v42 = 4;
      int v43 = v3 % v42;
      int v44 = 1;
      int v45 = v0 + v44;
      int v46;
      v46 = v45;
      switch (v43) {
        case 0:
          {
          int v47 = 2;
          int v48 = v3 % v47;
          int v49 = 2;
          int v50 = v0 + v49;
          int v51;
          v51 = v50;
          switch (v48) {
            case 0:
              {
              int v52 = 4;
              v51 = v52;
              break;
            }
            default:
              {
              v51 = v0;
            }
            case 1:
              {
              int v53 = 1;
              v51 = v53;
              break;
            }
          }
          v46 = v51;
          break;
        }
        case 1:
          {
          int v54 = 0;
          bool v55 = v2 != v54;
          int v56;
          if (v55) {
            int v57 = 1;
            v56 = v57;
          } else {
            v56 = v0;
          }
          v46 = v56;
          break;
        }
        default:
          {
          int v58 = 2;
          int v59 = v3 % v58;
          int v60 = 2;
          int v61 = v0 + v60;
          int v62;
          v62 = v61;
          switch (v59) {
            case 0:
              {
              v62 = v0;
              break;
            }
            default:
              {
              int v63 = 4;
              int v64 = v0 + v63;
              v62 = v64;
              break;
            }
          }
          v46 = v62;
        }
        case 2:
          {
          int v65 = 0;
          bool v66 = v2 != v65;
          int v67;
          if (v66) {
            int v68 = 0;
            int v69 = v0 + v68;
            v67 = v69;
          } else {
            v67 = v0;
          }
          v46 = v67;
          break;
        }
      }
      v12 = v46;
      break;
    }
    default:
      {
      int v70 = 0;
      bool v71 = v2 != v70;
      int v72;
      if (v71) {
        int v73 = 0;
        int v74 = 0;
        int v75;
        int v76;
        v75 = v73;
        v76 = v74;
        while (true) {
          int v77 = 4;
          int v78 = v3 % v77;
          int v79 = 1;
          int v80 = v78 + v79;
          bool v81 = v76 < v80;
          v75 = v75;
          v76 = v76;
          if (!v81) break;
          int v82 = 2;
          int v83 = v0 + v82;
          int v84 = 1;
          int v85 = v76 + v84;
          v75 = v83;
          v76 = v85;
          continue;
          ;
        }
        v72 = v75;
      } else {
        int v86 = 0;
        int v87 = 0;
        int v88;
        int v89;
        v88 = v86;
        v89 = v87;
        while (true) {
          int v90 = 4;
          int v91 = v3 % v90;
          int v92 = 1;
          int v93 = v91 + v92;
          bool v94 = v89 < v93;
          v88 = v88;
          v89 = v89;
          if (!v94) break;
          int v95 = 3;
          int v96 = 1;
          int v97 = v89 + v96;
          v88 = v95;
          v89 = v97;
        }
        v72 = v88;
      }
      v12 = v72;
      break;
    }
    case 2:
      {
      int v98 = 0;
      bool v99 = v2 != v98;
      int v100;
      if (v99) {
        int v101 = 4;
        v100 = v101;
      } else {
        v100 = v0;
      }
      v12 = v100;
      break;
    }
  }
  int v102 = 0;
  bool v103 = v2 != v102;
  int v104 = v103 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v105 [[buffer(0)]], device int* v106 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v107 = static_cast<int>(__simt_tid3.x);
  int v108 = 0;
  int v109 = v108 + v107;
  int v110 = v106[v109];
  int v111 = 4;
  int v112 = v111 + v107;
  int v113 = v106[v112];
  int v114 = 0;
  bool v115 = v110 != v114;
  if (v115) {
  } else {
    int v116 = 8;
    int v117 = v116 + v107;
    int v118 = v106[v117];
    int v119 = 0;
    bool v120 = v118 != v119;
    if (v120) {
      helper0(v107, v105, v110, v113, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v121 = 12;
  int v122 = v121 + v107;
  int v123 = v106[v122];
  int v124 = 1;
  int v125 = v107 + v124;
  int v126;
  v126 = v125;
  switch (v123) {
    case 0:
      {
      int v127 = 16;
      int v128 = v127 + v107;
      int v129 = v106[v128];
      int v130 = 0;
      bool v131 = v129 != v130;
      int v132;
      if (v131) {
        int v133 = 20;
        int v134 = v133 + v107;
        int v135 = v106[v134];
        int v136 = 0;
        bool v137 = v135 != v136;
        int v138;
        if (v137) {
          int v139 = 1;
          int v140 = v107 + v139;
          v138 = v140;
        } else {
          int v141 = 1;
          int v142 = v107 + v141;
          v138 = v142;
        }
        v132 = v138;
      } else {
        int v143 = 0;
        int v144 = 0;
        int v145;
        int v146;
        v145 = v143;
        v146 = v144;
        while (true) {
          int v147 = 4;
          int v148 = v146 * v147;
          int v149 = v148 + v107;
          int v150 = 24;
          int v151 = v150 + v149;
          int v152 = v106[v151];
          int v153 = 0;
          bool v154 = v152 != v153;
          v145 = v145;
          v146 = v146;
          if (!v154) break;
          int v155 = v145 + v146;
          int v156 = 1;
          int v157 = v146 + v156;
          bool v158 = true;
          v145 = v155;
          v146 = v157;
          break;
          ;
        }
        v132 = v145;
      }
      v126 = v132;
      break;
    }
    case 1:
      {
      int v159 = 44;
      int v160 = v159 + v107;
      int v161 = v106[v160];
      int v162 = 0;
      bool v163 = v161 != v162;
      int v164;
      if (v163) {
        int v165 = 0;
        int v166 = 0;
        int v167;
        int v168;
        v167 = v165;
        v168 = v166;
        while (true) {
          int v169 = 4;
          int v170 = v168 * v169;
          int v171 = v170 + v107;
          int v172 = 48;
          int v173 = v172 + v171;
          int v174 = v106[v173];
          int v175 = 0;
          bool v176 = v174 != v175;
          v167 = v167;
          v168 = v168;
          if (!v176) break;
          int v177 = v167 + v168;
          int v178 = 1;
          int v179 = v168 + v178;
          bool v180 = true;
          v167 = v177;
          v168 = v179;
          continue;
          ;
        }
        v164 = v167;
      } else {
        int v181 = 0;
        int v182 = 0;
        int v183;
        int v184;
        v183 = v181;
        v184 = v182;
        while (true) {
          int v185 = 4;
          int v186 = v184 * v185;
          int v187 = v186 + v107;
          int v188 = 68;
          int v189 = v188 + v187;
          int v190 = v106[v189];
          int v191 = 0;
          bool v192 = v190 != v191;
          v183 = v183;
          v184 = v184;
          if (!v192) break;
          int v193 = v183 + v184;
          int v194 = 1;
          int v195 = v184 + v194;
          bool v196 = true;
          v183 = v193;
          v184 = v195;
        }
        v164 = v183;
      }
      v126 = v164;
      break;
    }
    default:
      {
      int v197 = 88;
      int v198 = v197 + v107;
      int v199 = v106[v198];
      int v200 = 0;
      bool v201 = v199 != v200;
      int v202;
      if (v201) {
        int v203 = 92;
        int v204 = v203 + v107;
        int v205 = v106[v204];
        int v206 = 0;
        int v207;
        v207 = v206;
        switch (v205) {
          default:
            {
            int v208 = 1;
            v207 = v208;
            break;
          }
          case 0:
            {
            int v209 = 4;
            v207 = v209;
            break;
          }
        }
        v202 = v207;
      } else {
        int v210 = 96;
        int v211 = v210 + v107;
        int v212 = v106[v211];
        int v213 = 4;
        int v214;
        v214 = v213;
        switch (v212) {
          default:
            {
            int v215 = 0;
            int v216 = v107 + v215;
            v214 = v216;
            break;
          }
          case 0:
            {
            int v217 = 1;
            v214 = v217;
            break;
          }
          case 1:
            {
            int v218 = 2;
            int v219 = v107 + v218;
            v214 = v219;
            break;
          }
        }
        v202 = v214;
      }
      v126 = v202;
      break;
    }
    case 2:
      {
      int v220 = 100;
      int v221 = v220 + v107;
      int v222 = v106[v221];
      int v223 = 4;
      int v224 = v107 + v223;
      int v225;
      v225 = v224;
      switch (v222) {
        default:
          {
          int v226 = 104;
          int v227 = v226 + v107;
          int v228 = v106[v227];
          int v229 = 0;
          bool v230 = v228 != v229;
          int v231;
          if (v230) {
            int v232 = 4;
            int v233 = v107 + v232;
            v231 = v233;
          } else {
            int v234 = 2;
            v231 = v234;
          }
          v225 = v231;
          break;
        }
        case 0:
          {
          int v235 = 0;
          int v236 = 0;
          int v237;
          int v238;
          v237 = v235;
          v238 = v236;
          while (true) {
            int v239 = 4;
            int v240 = v238 * v239;
            int v241 = v240 + v107;
            int v242 = 108;
            int v243 = v242 + v241;
            int v244 = v106[v243];
            int v245 = 0;
            bool v246 = v244 != v245;
            v237 = v237;
            v238 = v238;
            if (!v246) break;
            int v247 = v237 + v238;
            int v248 = 1;
            int v249 = v238 + v248;
            bool v250 = true;
            v237 = v247;
            v238 = v249;
            break;
            ;
          }
          v225 = v237;
          break;
        }
        case 1:
          {
          v225 = v107;
          break;
        }
      }
      v126 = v225;
      break;
    }
  }
  bool v251 = true;
  int v252 = 16;
  int v253 = v252 + v107;
  bool v254 = true;
  int v255 = simt_wave_count_bits(v254);
  v105[v253] = v255;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
