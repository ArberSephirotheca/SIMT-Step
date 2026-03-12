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
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      case 0:
        {
        int v12 = 2;
        int v13 = v0 + v12;
        v11 = v13;
      }
      case 1:
        {
        int v14 = 4;
        v11 = v14;
        break;
      }
      default:
        {
        int v15 = 0;
        bool v16 = v2 != v15;
        int v17;
        if (v16) {
          int v18 = 3;
          v17 = v18;
        } else {
          int v19 = 0;
          int v20 = v0 + v19;
          v17 = v20;
        }
        int v21 = 1;
        int v22 = v0 + v21;
        v11 = v17;
      }
      case 2:
        {
        int v23 = 3;
        int v24 = v3 % v23;
        int v25 = 0;
        int v26 = v0 + v25;
        int v27;
        v27 = v26;
        switch (v24) {
          default:
            {
            v27 = v0;
            break;
          }
          case 0:
            {
            v27 = v0;
            break;
          }
          case 1:
            {
            int v28 = 4;
            int v29 = v0 + v28;
            v27 = v29;
            break;
          }
        }
        int v30 = 0;
        int v31 = v0 + v30;
        v11 = v27;
        break;
      }
    }
    int v32 = 3;
    v6 = v11;
  } else {
    int v33 = 0;
    bool v34 = v2 != v33;
    int v35;
    if (v34) {
      int v36 = 2;
      int v37 = v3 % v36;
      uint v38 = simt_subgroup_id(__simt_tid);
      int v39 = (int)(v38);
      int v40;
      v40 = v39;
      switch (v37) {
        default:
          {
          int v41 = 3;
          int v42 = v0 + v41;
          v40 = v42;
          break;
        }
        case 0:
          {
          int v43 = 3;
          int v44 = v0 + v43;
          v40 = v44;
          break;
        }
        case 1:
          {
          int v45 = 4;
          int v46 = v0 + v45;
          v40 = v46;
          break;
        }
      }
      int v47 = 3;
      int v48 = v0 + v47;
      v35 = v40;
    } else {
      v35 = v0;
    }
    int v49 = 3;
    int v50 = v0 + v49;
    v6 = v35;
  }
  bool v51 = true;
  int v52 = simt_wave_count_bits(v51);
  int v53 = 0;
  int v54 = v53 + v0;
  v1[v54] = v52;
  return;
}

kernel void kernel_main(device int* v55 [[buffer(0)]], device int* v56 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v57 = static_cast<int>(__simt_tid3.x);
  int v58 = 0;
  int v59 = v58 + v57;
  int v60 = v56[v59];
  int v61 = 4;
  int v62 = v61 + v57;
  int v63 = v56[v62];
  helper0(v57, v55, v60, v63, static_cast<int>(__simt_tid3.x));
  int v64 = 8;
  int v65 = v64 + v57;
  int v66 = v56[v65];
  int v67 = 4;
  int v68;
  v68 = v67;
  switch (v66) {
    default:
      {
      int v69 = 12;
      int v70 = v69 + v57;
      int v71 = v56[v70];
      int v72;
      v72 = v57;
      switch (v71) {
        default:
          {
          int v73 = 16;
          int v74 = v73 + v57;
          int v75 = v56[v74];
          int v76 = 1;
          int v77 = v57 + v76;
          int v78;
          v78 = v77;
          switch (v75) {
            case 0:
              {
              int v79 = 4;
              int v80 = v57 + v79;
              v78 = v80;
              break;
            }
            case 1:
              {
              v78 = v57;
              break;
            }
            default:
              {
              v78 = v57;
              break;
            }
            case 2:
              {
              v78 = v57;
              break;
            }
          }
          bool v81 = true;
          v72 = v78;
          break;
        }
        case 0:
          {
          int v82 = 20;
          int v83 = v82 + v57;
          int v84 = v56[v83];
          int v85 = 0;
          bool v86 = v84 != v85;
          int v87;
          if (v86) {
            v87 = v57;
          } else {
            v87 = v57;
          }
          v72 = v87;
          break;
        }
      }
      bool v88 = true;
      v68 = v72;
    }
    case 0:
      {
      int v89 = 0;
      int v90 = 0;
      int v91;
      int v92;
      v91 = v89;
      v92 = v90;
      while (true) {
        int v93 = 4;
        int v94 = v92 * v93;
        int v95 = v94 + v57;
        int v96 = 24;
        int v97 = v96 + v95;
        int v98 = v56[v97];
        int v99 = 0;
        bool v100 = v98 != v99;
        v91 = v91;
        v92 = v92;
        if (!v100) break;
        int v101 = 0;
        int v102 = 0;
        int v103;
        int v104;
        v103 = v101;
        v104 = v102;
        while (true) {
          int v105 = 4;
          int v106 = v104 * v105;
          int v107 = v106 + v57;
          int v108 = 44;
          int v109 = v108 + v107;
          int v110 = v56[v109];
          int v111 = 0;
          bool v112 = v110 != v111;
          v103 = v103;
          v104 = v104;
          if (!v112) break;
          int v113 = v103 + v104;
          int v114 = 1;
          int v115 = v104 + v114;
          v103 = v113;
          v104 = v115;
        }
        bool v116 = true;
        int v117 = v91 + v103;
        int v118 = 1;
        int v119 = v92 + v118;
        v91 = v117;
        v92 = v119;
      }
      bool v120 = true;
      v68 = v91;
    }
    case 1:
      {
      int v121 = 0;
      int v122 = 0;
      int v123;
      int v124;
      v123 = v121;
      v124 = v122;
      while (true) {
        int v125 = 4;
        int v126 = v124 * v125;
        int v127 = v126 + v57;
        int v128 = 64;
        int v129 = v128 + v127;
        int v130 = v56[v129];
        int v131 = 0;
        bool v132 = v130 != v131;
        v123 = v123;
        v124 = v124;
        if (!v132) break;
        int v133 = 84;
        int v134 = v133 + v57;
        int v135 = v56[v134];
        int v136;
        v136 = v57;
        switch (v135) {
          case 0:
            {
            v136 = v57;
            break;
          }
          default:
            {
            int v137 = 1;
            v136 = v137;
            break;
          }
        }
        bool v138 = true;
        int v139 = v123 + v136;
        int v140 = 1;
        int v141 = v124 + v140;
        v123 = v139;
        v124 = v141;
      }
      bool v142 = true;
      v68 = v123;
      break;
    }
    case 2:
      {
      int v143 = 88;
      int v144 = v143 + v57;
      int v145 = v56[v144];
      int v146 = 2;
      int v147 = v57 + v146;
      int v148;
      v148 = v147;
      switch (v145) {
        case 0:
          {
          int v149 = 92;
          int v150 = v149 + v57;
          int v151 = v56[v150];
          int v152 = 2;
          int v153 = v57 + v152;
          int v154;
          v154 = v153;
          switch (v151) {
            case 0:
              {
              int v155 = 3;
              int v156 = v57 + v155;
              v154 = v156;
              break;
            }
            default:
              {
              int v157 = 0;
              int v158 = v57 + v157;
              v154 = v158;
              break;
            }
            case 1:
              {
              int v159 = 2;
              int v160 = v57 + v159;
              v154 = v160;
              break;
            }
            case 2:
              {
              v154 = v57;
              break;
            }
          }
          bool v161 = true;
          v148 = v154;
          break;
        }
        case 1:
          {
          int v162 = 96;
          int v163 = v162 + v57;
          int v164 = v56[v163];
          int v165 = 0;
          bool v166 = v164 != v165;
          int v167;
          if (v166) {
            int v168 = 2;
            int v169 = v57 + v168;
            v167 = v169;
          } else {
            int v170 = 4;
            v167 = v170;
          }
          v148 = v167;
          break;
        }
        default:
          {
          int v171 = 0;
          int v172 = 0;
          int v173;
          int v174;
          v173 = v171;
          v174 = v172;
          while (true) {
            int v175 = 4;
            int v176 = v174 * v175;
            int v177 = v176 + v57;
            int v178 = 100;
            int v179 = v178 + v177;
            int v180 = v56[v179];
            int v181 = 0;
            bool v182 = v180 != v181;
            v173 = v173;
            v174 = v174;
            if (!v182) break;
            int v183 = v173 + v174;
            int v184 = 1;
            int v185 = v174 + v184;
            v173 = v183;
            v174 = v185;
            continue;
            ;
          }
          bool v186 = true;
          v148 = v173;
        }
        case 2:
          {
          int v187 = 120;
          int v188 = v187 + v57;
          int v189 = v56[v188];
          int v190 = 0;
          bool v191 = v189 != v190;
          int v192;
          if (v191) {
            int v193 = 4;
            v192 = v193;
          } else {
            v192 = v57;
          }
          v148 = v192;
          break;
        }
      }
      bool v194 = true;
      v68 = v148;
      break;
    }
  }
  bool v195 = true;
  int v196 = 16;
  int v197 = v196 + v57;
  bool v198 = true;
  int v199 = simt_wave_count_bits(v198);
  v55[v197] = v199;
  int v200 = 124;
  int v201 = v200 + v57;
  int v202 = v56[v201];
  uint v203 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v204 = (int)(v203);
  int v205;
  v205 = v204;
  switch (v202) {
    default:
      {
      int v206 = 128;
      int v207 = v206 + v57;
      int v208 = v56[v207];
      int v209 = 0;
      bool v210 = v208 != v209;
      int v211;
      if (v210) {
        int v212 = 132;
        int v213 = v212 + v57;
        int v214 = v56[v213];
        int v215;
        v215 = v57;
        switch (v214) {
          case 0:
            {
            int v216 = 1;
            int v217 = v57 + v216;
            v215 = v217;
            break;
          }
          case 1:
            {
            v215 = v57;
            break;
          }
          default:
            {
            v215 = v57;
            break;
          }
        }
        bool v218 = true;
        v211 = v215;
      } else {
        int v219 = 136;
        int v220 = v219 + v57;
        int v221 = v56[v220];
        int v222 = 0;
        int v223;
        v223 = v222;
        switch (v221) {
          case 0:
            {
            int v224 = 2;
            v223 = v224;
            break;
          }
          default:
            {
            int v225 = 0;
            int v226 = v57 + v225;
            v223 = v226;
            break;
          }
          case 1:
            {
            int v227 = 1;
            int v228 = v57 + v227;
            v223 = v228;
            break;
          }
        }
        bool v229 = true;
        v211 = v223;
      }
      v205 = v211;
      break;
    }
    case 0:
      {
      int v230 = 140;
      int v231 = v230 + v57;
      int v232 = v56[v231];
      int v233 = 0;
      bool v234 = v232 != v233;
      int v235;
      if (v234) {
        int v236 = 144;
        int v237 = v236 + v57;
        int v238 = v56[v237];
        int v239 = 2;
        int v240;
        v240 = v239;
        switch (v238) {
          default:
            {
            int v241 = 1;
            v240 = v241;
          }
          case 0:
            {
            int v242 = 0;
            v240 = v242;
            break;
          }
        }
        bool v243 = true;
        v235 = v240;
      } else {
        int v244 = 148;
        int v245 = v244 + v57;
        int v246 = v56[v245];
        int v247 = 0;
        bool v248 = v246 != v247;
        int v249;
        if (v248) {
          v249 = v57;
        } else {
          int v250 = 4;
          v249 = v250;
        }
        v235 = v249;
      }
      v205 = v235;
      break;
    }
  }
  bool v251 = true;
  int v252 = 32;
  int v253 = v252 + v57;
  bool v254 = true;
  int v255 = simt_wave_count_bits(v254);
  v55[v253] = v255;
  uint v256 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v257 = (int)(v256);
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
