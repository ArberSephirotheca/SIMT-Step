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
      int v22 = 0;
      int v23 = 1;
      int v24 = v16 + v23;
      v15 = v22;
      v16 = v24;
    }
    uint v25 = simt_lane_id(__simt_tid);
    int v26 = (int)(v25);
    int v27 = 1;
    int v28 = v7 + v27;
    v6 = v15;
    v7 = v28;
  }
  bool v29 = true;
  int v30 = simt_wave_count_bits(v29);
  int v31 = 0;
  int v32 = v31 + v0;
  v1[v32] = v30;
  int v33 = 2;
  int v34 = v3 % v33;
  uint v35 = simt_subgroup_id(__simt_tid);
  int v36 = (int)(v35);
  int v37;
  v37 = v36;
  switch (v34) {
    case 0:
      {
      int v38 = 0;
      bool v39 = v2 != v38;
      int v40;
      if (v39) {
        int v41 = 2;
        int v42 = v3 % v41;
        int v43 = 3;
        int v44 = v0 + v43;
        int v45;
        v45 = v44;
        switch (v42) {
          case 0:
            {
            int v46 = 1;
            v45 = v46;
            break;
          }
          case 1:
            {
            int v47 = 0;
            int v48 = v0 + v47;
            v45 = v48;
            break;
          }
          default:
            {
            v45 = v0;
            break;
          }
        }
        int v49 = 0;
        int v50 = v0 + v49;
        v40 = v45;
      } else {
        int v51 = 0;
        bool v52 = v2 != v51;
        int v53;
        if (v52) {
          int v54 = 4;
          int v55 = v0 + v54;
          v53 = v55;
        } else {
          int v56 = 1;
          v53 = v56;
        }
        int v57 = 0;
        int v58 = v0 + v57;
        v40 = v53;
      }
      v37 = v40;
      break;
    }
    default:
      {
      int v59 = 0;
      bool v60 = v2 != v59;
      int v61;
      if (v60) {
        v61 = v0;
      } else {
        int v62 = 3;
        int v63 = v3 % v62;
        int v64 = 4;
        int v65 = v0 + v64;
        int v66;
        v66 = v65;
        switch (v63) {
          case 0:
            {
            int v67 = 2;
            int v68 = v0 + v67;
            v66 = v68;
            break;
          }
          default:
            {
            v66 = v0;
            break;
          }
          case 1:
            {
            int v69 = 1;
            int v70 = v0 + v69;
            v66 = v70;
            break;
          }
          case 2:
            {
            int v71 = 4;
            int v72 = v0 + v71;
            v66 = v72;
            break;
          }
        }
        v61 = v66;
      }
      v37 = v61;
      break;
    }
    case 1:
      {
      int v73 = 4;
      int v74 = v3 % v73;
      int v75;
      v75 = v0;
      switch (v74) {
        case 0:
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
            int v85 = 2;
            int v86 = 1;
            int v87 = v79 + v86;
            v78 = v85;
            v79 = v87;
          }
          int v88 = 2;
          v75 = v78;
        }
        case 1:
          {
          int v89 = 3;
          int v90 = v3 % v89;
          int v91;
          v91 = v0;
          switch (v90) {
            case 0:
              {
              v91 = v0;
            }
            default:
              {
              int v92 = 2;
              v91 = v92;
              break;
            }
            case 1:
              {
              v91 = v0;
            }
            case 2:
              {
              int v93 = 3;
              int v94 = v0 + v93;
              v91 = v94;
              break;
            }
          }
          int v95 = 3;
          v75 = v91;
          break;
        }
        default:
          {
          int v96 = 0;
          bool v97 = v2 != v96;
          int v98;
          if (v97) {
            v98 = v0;
          } else {
            int v99 = 2;
            v98 = v99;
          }
          int v100 = 0;
          v75 = v98;
          break;
        }
        case 2:
          {
          int v101 = 0;
          bool v102 = v2 != v101;
          int v103;
          if (v102) {
            int v104 = 4;
            v103 = v104;
          } else {
            int v105 = 2;
            int v106 = v0 + v105;
            v103 = v106;
          }
          int v107 = 1;
          v75 = v103;
          break;
        }
      }
      int v108 = 1;
      v37 = v75;
      break;
    }
  }
  bool v109 = true;
  int v110 = simt_wave_count_bits(v109);
  int v111 = 16;
  int v112 = v111 + v0;
  v1[v112] = v110;
  int v113 = 0;
  bool v114 = v2 != v113;
  int v115 = v114 ? v6 : v37;
  return;
}

kernel void kernel_main(device int* v116 [[buffer(0)]], device int* v117 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v118 = static_cast<int>(__simt_tid3.x);
  int v119 = 0;
  int v120 = v119 + v118;
  int v121 = v117[v120];
  int v122 = 4;
  int v123 = v122 + v118;
  int v124 = v117[v123];
  helper0(v118, v116, v121, v124, static_cast<int>(__simt_tid3.x));
  int v125 = 8;
  int v126 = v125 + v118;
  int v127 = v117[v126];
  int v128;
  v128 = v118;
  switch (v127) {
    case 0:
      {
      int v129 = 12;
      int v130 = v129 + v118;
      int v131 = v117[v130];
      int v132 = 0;
      bool v133 = v131 != v132;
      int v134;
      if (v133) {
        int v135 = 0;
        int v136 = 0;
        int v137;
        int v138;
        v137 = v135;
        v138 = v136;
        while (true) {
          int v139 = 4;
          int v140 = v138 * v139;
          int v141 = v140 + v118;
          int v142 = 16;
          int v143 = v142 + v141;
          int v144 = v117[v143];
          int v145 = 0;
          bool v146 = v144 != v145;
          v137 = v137;
          v138 = v138;
          if (!v146) break;
          int v147 = v137 + v138;
          int v148 = 1;
          int v149 = v138 + v148;
          v137 = v147;
          v138 = v149;
        }
        bool v150 = true;
        v134 = v137;
      } else {
        int v151 = 0;
        int v152 = 0;
        int v153;
        int v154;
        v153 = v151;
        v154 = v152;
        while (true) {
          int v155 = 4;
          int v156 = v154 * v155;
          int v157 = v156 + v118;
          int v158 = 36;
          int v159 = v158 + v157;
          int v160 = v117[v159];
          int v161 = 0;
          bool v162 = v160 != v161;
          v153 = v153;
          v154 = v154;
          if (!v162) break;
          int v163 = v153 + v154;
          int v164 = 1;
          int v165 = v154 + v164;
          v153 = v163;
          v154 = v165;
        }
        bool v166 = true;
        v134 = v153;
      }
      v128 = v134;
    }
    default:
      {
      int v167 = 56;
      int v168 = v167 + v118;
      int v169 = v117[v168];
      int v170 = 0;
      bool v171 = v169 != v170;
      int v172;
      if (v171) {
        int v173 = 60;
        int v174 = v173 + v118;
        int v175 = v117[v174];
        int v176;
        v176 = v118;
        switch (v175) {
          default:
            {
            int v177 = 4;
            v176 = v177;
            break;
          }
          case 0:
            {
            int v178 = 4;
            v176 = v178;
            break;
          }
          case 1:
            {
            int v179 = 4;
            v176 = v179;
            break;
          }
        }
        bool v180 = true;
        v172 = v176;
      } else {
        int v181 = 64;
        int v182 = v181 + v118;
        int v183 = v117[v182];
        int v184 = 1;
        int v185 = v118 + v184;
        int v186;
        v186 = v185;
        switch (v183) {
          case 0:
            {
            int v187 = 1;
            v186 = v187;
            break;
          }
          case 1:
            {
            int v188 = 1;
            v186 = v188;
            break;
          }
          default:
            {
            int v189 = 1;
            int v190 = v118 + v189;
            v186 = v190;
            break;
          }
          case 2:
            {
            int v191 = 1;
            v186 = v191;
            break;
          }
        }
        bool v192 = true;
        v172 = v186;
      }
      v128 = v172;
      break;
    }
  }
  bool v193 = true;
  int v194 = 32;
  int v195 = v194 + v118;
  bool v196 = true;
  int v197 = simt_wave_count_bits(v196);
  v116[v195] = v197;
  int v198 = 68;
  int v199 = v198 + v118;
  int v200 = v117[v199];
  int v201 = 0;
  bool v202 = v200 != v201;
  int v203;
  if (v202) {
    int v204 = 72;
    int v205 = v204 + v118;
    int v206 = v117[v205];
    uint v207 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v208 = (int)(v207);
    int v209;
    v209 = v208;
    switch (v206) {
      case 0:
        {
        int v210 = 76;
        int v211 = v210 + v118;
        int v212 = v117[v211];
        int v213 = 0;
        bool v214 = v212 != v213;
        int v215;
        if (v214) {
          int v216 = 1;
          v215 = v216;
        } else {
          int v217 = 2;
          int v218 = v118 + v217;
          v215 = v218;
        }
        v209 = v215;
        break;
      }
      case 1:
        {
        int v219 = 80;
        int v220 = v219 + v118;
        int v221 = v117[v220];
        int v222 = 0;
        bool v223 = v221 != v222;
        int v224;
        if (v223) {
          v224 = v118;
        } else {
          v224 = v118;
        }
        v209 = v224;
        break;
      }
      default:
        {
        int v225 = 84;
        int v226 = v225 + v118;
        int v227 = v117[v226];
        int v228 = 1;
        int v229;
        v229 = v228;
        switch (v227) {
          case 0:
            {
            int v230 = 3;
            v229 = v230;
          }
          case 1:
            {
            int v231 = 0;
            int v232 = v118 + v231;
            v229 = v232;
            break;
          }
          case 2:
            {
            int v233 = 4;
            v229 = v233;
            break;
          }
          default:
            {
            int v234 = 4;
            v229 = v234;
            break;
          }
        }
        bool v235 = true;
        v209 = v229;
        break;
      }
    }
    bool v236 = true;
    v203 = v209;
  } else {
    int v237 = 0;
    int v238 = 0;
    int v239;
    int v240;
    v239 = v237;
    v240 = v238;
    while (true) {
      int v241 = 4;
      int v242 = v240 * v241;
      int v243 = v242 + v118;
      int v244 = 88;
      int v245 = v244 + v243;
      int v246 = v117[v245];
      int v247 = 0;
      bool v248 = v246 != v247;
      v239 = v239;
      v240 = v240;
      if (!v248) break;
      int v249 = v239 + v240;
      int v250 = 1;
      int v251 = v240 + v250;
      v239 = v249;
      v240 = v251;
    }
    bool v252 = true;
    v203 = v239;
  }
  int v253 = 48;
  int v254 = v253 + v118;
  bool v255 = true;
  int v256 = simt_wave_count_bits(v255);
  v116[v254] = v256;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
