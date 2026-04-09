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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 0;
        int v13 = 0;
        int v14;
        int v15;
        v14 = v12;
        v15 = v13;
        while (true) {
          int v16 = 4;
          int v17 = v3 % v16;
          int v18 = 1;
          int v19 = v17 + v18;
          bool v20 = v15 < v19;
          v14 = v14;
          v15 = v15;
          if (!v20) break;
          int v21 = 2;
          int v22 = 1;
          int v23 = v15 + v22;
          v14 = v21;
          v15 = v23;
        }
        int v24 = 0;
        int v25 = v0 + v24;
        v11 = v14;
      } else {
        int v26 = 0;
        int v27 = v0 + v26;
        v11 = v27;
      }
      int v28 = 0;
      int v29 = v0 + v28;
      v8 = v11;
      break;
    }
    case 0:
      {
      int v30 = 2;
      int v31 = v3 % v30;
      int v32 = 3;
      int v33;
      v33 = v32;
      switch (v31) {
        case 0:
          {
          int v34 = 3;
          int v35 = v3 % v34;
          int v36 = 4;
          int v37;
          v37 = v36;
          switch (v35) {
            case 0:
              {
              int v38 = 3;
              int v39 = v0 + v38;
              v37 = v39;
            }
            case 1:
              {
              int v40 = 2;
              int v41 = v0 + v40;
              v37 = v41;
            }
            default:
              {
              int v42 = 1;
              v37 = v42;
              break;
            }
          }
          v33 = v37;
          break;
        }
        default:
          {
          int v43 = 2;
          int v44 = v3 % v43;
          int v45 = 3;
          int v46;
          v46 = v45;
          switch (v44) {
            case 0:
              {
              int v47 = 4;
              v46 = v47;
              break;
            }
            default:
              {
              int v48 = 3;
              v46 = v48;
              break;
            }
            case 1:
              {
              int v49 = 2;
              v46 = v49;
              break;
            }
          }
          v33 = v46;
          break;
        }
      }
      int v50 = 0;
      int v51 = v0 + v50;
      v8 = v33;
      break;
    }
    case 1:
      {
      int v52 = 0;
      bool v53 = v2 != v52;
      int v54;
      if (v53) {
        int v55 = 0;
        bool v56 = v2 != v55;
        int v57;
        if (v56) {
          int v58 = 4;
          int v59 = v0 + v58;
          v57 = v59;
        } else {
          int v60 = 3;
          int v61 = v0 + v60;
          v57 = v61;
        }
        int v62 = 2;
        v54 = v57;
      } else {
        int v63 = 2;
        int v64 = v3 % v63;
        int v65;
        v65 = v0;
        switch (v64) {
          case 0:
            {
            v65 = v0;
          }
          default:
            {
            int v66 = 3;
            v65 = v66;
            break;
          }
          case 1:
            {
            int v67 = 2;
            int v68 = v0 + v67;
            v65 = v68;
            break;
          }
        }
        int v69 = 2;
        v54 = v65;
      }
      int v70 = 1;
      int v71 = v0 + v70;
      v8 = v54;
      break;
    }
  }
  bool v72 = true;
  int v73 = simt_wave_count_bits(v72);
  int v74 = 0;
  int v75 = v74 + v0;
  v1[v75] = v73;
  return;
}

kernel void kernel_main(device int* v76 [[buffer(0)]], device int* v77 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v78 = static_cast<int>(__simt_tid3.x);
  int v79 = 0;
  int v80 = v79 + v78;
  int v81 = v77[v80];
  int v82 = 4;
  int v83 = v82 + v78;
  int v84 = v77[v83];
  helper0(v78, v76, v81, v84, static_cast<int>(__simt_tid3.x));
  int v85 = 8;
  int v86 = v85 + v78;
  int v87 = v77[v86];
  uint v88 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v89 = (int)(v88);
  int v90;
  v90 = v89;
  switch (v87) {
    case 0:
      {
      int v91 = 12;
      int v92 = v91 + v78;
      int v93 = v77[v92];
      int v94 = 4;
      int v95 = v78 + v94;
      int v96;
      v96 = v95;
      switch (v93) {
        case 0:
          {
          int v97 = 16;
          int v98 = v97 + v78;
          int v99 = v77[v98];
          int v100 = 4;
          int v101;
          v101 = v100;
          switch (v99) {
            case 0:
              {
              int v102 = 2;
              int v103 = v78 + v102;
              v101 = v103;
              break;
            }
            default:
              {
              v101 = v78;
              break;
            }
            case 1:
              {
              int v104 = 2;
              int v105 = v78 + v104;
              v101 = v105;
              break;
            }
            case 2:
              {
              int v106 = 2;
              int v107 = v78 + v106;
              v101 = v107;
              break;
            }
          }
          bool v108 = true;
          v96 = v101;
          break;
        }
        case 1:
          {
          int v109 = 20;
          int v110 = v109 + v78;
          int v111 = v77[v110];
          int v112 = 0;
          bool v113 = v111 != v112;
          int v114;
          if (v113) {
            v114 = v78;
          } else {
            int v115 = 1;
            int v116 = v78 + v115;
            v114 = v116;
          }
          v96 = v114;
          break;
        }
        default:
          {
          int v117 = 0;
          int v118 = 0;
          int v119;
          int v120;
          v119 = v117;
          v120 = v118;
          while (true) {
            int v121 = 4;
            int v122 = v120 * v121;
            int v123 = v122 + v78;
            int v124 = 24;
            int v125 = v124 + v123;
            int v126 = v77[v125];
            int v127 = 0;
            bool v128 = v126 != v127;
            v119 = v119;
            v120 = v120;
            if (!v128) break;
            int v129 = v119 + v120;
            int v130 = 1;
            int v131 = v120 + v130;
            v119 = v129;
            v120 = v131;
          }
          bool v132 = true;
          v96 = v119;
          break;
        }
      }
      bool v133 = true;
      v90 = v96;
      break;
    }
    default:
      {
      int v134 = 44;
      int v135 = v134 + v78;
      int v136 = v77[v135];
      int v137 = 0;
      bool v138 = v136 != v137;
      int v139;
      if (v138) {
        int v140 = 48;
        int v141 = v140 + v78;
        int v142 = v77[v141];
        int v143 = 0;
        bool v144 = v142 != v143;
        int v145;
        if (v144) {
          int v146 = 3;
          int v147 = v78 + v146;
          v145 = v147;
        } else {
          v145 = v78;
        }
        v139 = v145;
      } else {
        int v148 = 52;
        int v149 = v148 + v78;
        int v150 = v77[v149];
        int v151;
        v151 = v78;
        switch (v150) {
          case 0:
            {
            int v152 = 1;
            int v153 = v78 + v152;
            v151 = v153;
            break;
          }
          default:
            {
            int v154 = 2;
            v151 = v154;
            break;
          }
          case 1:
            {
            v151 = v78;
            break;
          }
        }
        bool v155 = true;
        v139 = v151;
      }
      v90 = v139;
    }
    case 1:
      {
      int v156 = 4;
      v90 = v156;
      break;
    }
    case 2:
      {
      int v157 = 0;
      int v158 = 0;
      int v159;
      int v160;
      v159 = v157;
      v160 = v158;
      while (true) {
        int v161 = 4;
        int v162 = v160 * v161;
        int v163 = v162 + v78;
        int v164 = 56;
        int v165 = v164 + v163;
        int v166 = v77[v165];
        int v167 = 0;
        bool v168 = v166 != v167;
        v159 = v159;
        v160 = v160;
        if (!v168) break;
        int v169 = 76;
        int v170 = v169 + v78;
        int v171 = v77[v170];
        int v172 = 4;
        int v173 = v78 + v172;
        int v174;
        v174 = v173;
        switch (v171) {
          default:
            {
            int v175 = 4;
            int v176 = v78 + v175;
            v174 = v176;
            break;
          }
          case 0:
            {
            v174 = v78;
            break;
          }
        }
        bool v177 = true;
        int v178 = v159 + v174;
        int v179 = 1;
        int v180 = v160 + v179;
        v159 = v178;
        v160 = v180;
      }
      bool v181 = true;
      v90 = v159;
      break;
    }
  }
  bool v182 = true;
  int v183 = 16;
  int v184 = v183 + v78;
  bool v185 = true;
  int v186 = simt_wave_count_bits(v185);
  v76[v184] = v186;
  int v187 = 80;
  int v188 = v187 + v78;
  int v189 = v77[v188];
  int v190 = 0;
  bool v191 = v189 != v190;
  int v192;
  if (v191) {
    uint v193 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v194 = (int)(v193);
    v192 = v194;
  } else {
    uint v195 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v196 = (int)(v195);
    v192 = v196;
  }
  int v197 = 32;
  int v198 = v197 + v78;
  bool v199 = true;
  int v200 = simt_wave_count_bits(v199);
  v76[v198] = v200;
  int v201 = 0;
  int v202 = 0;
  int v203;
  int v204;
  v203 = v201;
  v204 = v202;
  while (true) {
    int v205 = 4;
    int v206 = v204 * v205;
    int v207 = v206 + v78;
    int v208 = 84;
    int v209 = v208 + v207;
    int v210 = v77[v209];
    int v211 = 0;
    bool v212 = v210 != v211;
    v203 = v203;
    v204 = v204;
    if (!v212) break;
    int v213 = 0;
    int v214 = 0;
    int v215;
    int v216;
    v215 = v213;
    v216 = v214;
    while (true) {
      int v217 = 4;
      int v218 = v216 * v217;
      int v219 = v218 + v78;
      int v220 = 104;
      int v221 = v220 + v219;
      int v222 = v77[v221];
      int v223 = 0;
      bool v224 = v222 != v223;
      v215 = v215;
      v216 = v216;
      if (!v224) break;
      int v225 = 0;
      int v226 = 0;
      int v227;
      int v228;
      v227 = v225;
      v228 = v226;
      while (true) {
        int v229 = 4;
        int v230 = v228 * v229;
        int v231 = v230 + v78;
        int v232 = 124;
        int v233 = v232 + v231;
        int v234 = v77[v233];
        int v235 = 0;
        bool v236 = v234 != v235;
        v227 = v227;
        v228 = v228;
        if (!v236) break;
        int v237 = v227 + v228;
        int v238 = 1;
        int v239 = v228 + v238;
        v227 = v237;
        v228 = v239;
      }
      bool v240 = true;
      int v241 = v215 + v227;
      int v242 = 1;
      int v243 = v216 + v242;
      v215 = v241;
      v216 = v243;
    }
    bool v244 = true;
    int v245 = v203 + v215;
    int v246 = 1;
    int v247 = v204 + v246;
    v203 = v245;
    v204 = v247;
  }
  bool v248 = true;
  int v249 = 48;
  int v250 = v249 + v78;
  bool v251 = true;
  int v252 = simt_wave_count_bits(v251);
  v76[v250] = v252;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 144; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
