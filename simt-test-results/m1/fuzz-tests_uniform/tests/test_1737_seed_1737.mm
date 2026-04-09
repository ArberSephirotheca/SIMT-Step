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
    bool v14 = v2 != v13;
    int v15;
    if (v14) {
      int v16 = 0;
      bool v17 = v2 != v16;
      int v18;
      if (v17) {
        uint v19 = simt_subgroup_id(__simt_tid);
        int v20 = (int)(v19);
        v18 = v20;
      } else {
        uint v21 = simt_subgroup_id(__simt_tid);
        int v22 = (int)(v21);
        v18 = v22;
      }
      int v23 = 2;
      int v24 = v0 + v23;
      v15 = v18;
    } else {
      int v25 = 2;
      v15 = v25;
    }
    int v26 = 2;
    int v27 = v0 + v26;
    int v28 = 1;
    int v29 = v7 + v28;
    v6 = v15;
    v7 = v29;
  }
  bool v30 = true;
  int v31 = simt_wave_count_bits(v30);
  int v32 = 0;
  int v33 = v32 + v0;
  v1[v33] = v31;
  int v34 = 0;
  bool v35 = v2 != v34;
  int v36 = v35 ? v0 : v6;
  return;
}

kernel void kernel_main(device int* v37 [[buffer(0)]], device int* v38 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v39 = static_cast<int>(__simt_tid3.x);
  int v40 = 0;
  int v41 = v40 + v39;
  int v42 = v38[v41];
  int v43 = 4;
  int v44 = v43 + v39;
  int v45 = v38[v44];
  helper0(v39, v37, v42, v45, static_cast<int>(__simt_tid3.x));
  int v46 = 8;
  int v47 = v46 + v39;
  int v48 = v38[v47];
  uint v49 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v50 = (int)(v49);
  int v51;
  v51 = v50;
  switch (v48) {
    default:
      {
      int v52 = 12;
      int v53 = v52 + v39;
      int v54 = v38[v53];
      int v55 = 2;
      int v56 = v39 + v55;
      int v57;
      v57 = v56;
      switch (v54) {
        default:
          {
          int v58 = 0;
          int v59 = 0;
          int v60;
          int v61;
          v60 = v58;
          v61 = v59;
          while (true) {
            int v62 = 4;
            int v63 = v61 * v62;
            int v64 = v63 + v39;
            int v65 = 16;
            int v66 = v65 + v64;
            int v67 = v38[v66];
            int v68 = 0;
            bool v69 = v67 != v68;
            v60 = v60;
            v61 = v61;
            if (!v69) break;
            int v70 = v60 + v61;
            int v71 = 1;
            int v72 = v61 + v71;
            v60 = v70;
            v61 = v72;
          }
          bool v73 = true;
          v57 = v60;
        }
        case 0:
          {
          v57 = v39;
          break;
        }
        case 1:
          {
          int v74 = 36;
          int v75 = v74 + v39;
          int v76 = v38[v75];
          int v77 = 4;
          int v78 = v39 + v77;
          int v79;
          v79 = v78;
          switch (v76) {
            case 0:
              {
              v79 = v39;
              break;
            }
            case 1:
              {
              int v80 = 3;
              int v81 = v39 + v80;
              v79 = v81;
              break;
            }
            default:
              {
              int v82 = 3;
              v79 = v82;
              break;
            }
          }
          bool v83 = true;
          v57 = v79;
          break;
        }
      }
      bool v84 = true;
      v51 = v57;
      break;
    }
    case 0:
      {
      int v85 = 40;
      int v86 = v85 + v39;
      int v87 = v38[v86];
      int v88;
      v88 = v39;
      switch (v87) {
        default:
          {
          int v89 = 44;
          int v90 = v89 + v39;
          int v91 = v38[v90];
          int v92 = 0;
          bool v93 = v91 != v92;
          int v94;
          if (v93) {
            v94 = v39;
          } else {
            v94 = v39;
          }
          v88 = v94;
          break;
        }
        case 0:
          {
          int v95 = 48;
          int v96 = v95 + v39;
          int v97 = v38[v96];
          int v98;
          v98 = v39;
          switch (v97) {
            case 0:
              {
              int v99 = 1;
              v98 = v99;
              break;
            }
            default:
              {
              int v100 = 0;
              int v101 = v39 + v100;
              v98 = v101;
            }
            case 1:
              {
              v98 = v39;
              break;
            }
          }
          bool v102 = true;
          v88 = v98;
          break;
        }
        case 1:
          {
          int v103 = 52;
          int v104 = v103 + v39;
          int v105 = v38[v104];
          int v106 = 0;
          bool v107 = v105 != v106;
          int v108;
          if (v107) {
            int v109 = 2;
            int v110 = v39 + v109;
            v108 = v110;
          } else {
            int v111 = 0;
            v108 = v111;
          }
          v88 = v108;
          break;
        }
      }
      bool v112 = true;
      v51 = v88;
      break;
    }
    case 1:
      {
      int v113 = 56;
      int v114 = v113 + v39;
      int v115 = v38[v114];
      int v116 = 0;
      bool v117 = v115 != v116;
      int v118;
      if (v117) {
        int v119 = 60;
        int v120 = v119 + v39;
        int v121 = v38[v120];
        int v122 = 1;
        int v123 = v39 + v122;
        int v124;
        v124 = v123;
        switch (v121) {
          case 0:
            {
            int v125 = 3;
            v124 = v125;
            break;
          }
          case 1:
            {
            int v126 = 1;
            v124 = v126;
            break;
          }
          case 2:
            {
            int v127 = 3;
            v124 = v127;
            break;
          }
          default:
            {
            int v128 = 4;
            int v129 = v39 + v128;
            v124 = v129;
            break;
          }
        }
        bool v130 = true;
        v118 = v124;
      } else {
        int v131 = 64;
        int v132 = v131 + v39;
        int v133 = v38[v132];
        int v134 = 0;
        bool v135 = v133 != v134;
        int v136;
        if (v135) {
          int v137 = 3;
          int v138 = v39 + v137;
          v136 = v138;
        } else {
          int v139 = 1;
          int v140 = v39 + v139;
          v136 = v140;
        }
        v118 = v136;
      }
      v51 = v118;
      break;
    }
  }
  bool v141 = true;
  int v142 = 16;
  int v143 = v142 + v39;
  bool v144 = true;
  int v145 = simt_wave_count_bits(v144);
  v37[v143] = v145;
  int v146 = 68;
  int v147 = v146 + v39;
  int v148 = v38[v147];
  int v149 = 0;
  bool v150 = v148 != v149;
  int v151;
  if (v150) {
    int v152 = 72;
    int v153 = v152 + v39;
    int v154 = v38[v153];
    uint v155 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v156 = (int)(v155);
    int v157;
    v157 = v156;
    switch (v154) {
      default:
        {
        int v158 = 76;
        int v159 = v158 + v39;
        int v160 = v38[v159];
        int v161 = 0;
        bool v162 = v160 != v161;
        int v163;
        if (v162) {
          v163 = v39;
        } else {
          v163 = v39;
        }
        v157 = v163;
      }
      case 0:
        {
        int v164 = 0;
        int v165 = 0;
        int v166;
        int v167;
        v166 = v164;
        v167 = v165;
        while (true) {
          int v168 = 4;
          int v169 = v167 * v168;
          int v170 = v169 + v39;
          int v171 = 80;
          int v172 = v171 + v170;
          int v173 = v38[v172];
          int v174 = 0;
          bool v175 = v173 != v174;
          v166 = v166;
          v167 = v167;
          if (!v175) break;
          int v176 = v166 + v167;
          int v177 = 1;
          int v178 = v167 + v177;
          v166 = v176;
          v167 = v178;
          break;
          ;
        }
        bool v179 = true;
        v157 = v166;
      }
      case 1:
        {
        int v180 = 100;
        int v181 = v180 + v39;
        int v182 = v38[v181];
        int v183 = 1;
        int v184;
        v184 = v183;
        switch (v182) {
          case 0:
            {
            int v185 = 4;
            int v186 = v39 + v185;
            v184 = v186;
            break;
          }
          default:
            {
            int v187 = 0;
            int v188 = v39 + v187;
            v184 = v188;
            break;
          }
          case 1:
            {
            v184 = v39;
          }
          case 2:
            {
            int v189 = 0;
            int v190 = v39 + v189;
            v184 = v190;
            break;
          }
        }
        bool v191 = true;
        v157 = v184;
        break;
      }
    }
    bool v192 = true;
    v151 = v157;
  } else {
    v151 = v39;
  }
  int v193 = 32;
  int v194 = v193 + v39;
  bool v195 = true;
  int v196 = simt_wave_count_bits(v195);
  v37[v194] = v196;
  int v197 = 104;
  int v198 = v197 + v39;
  int v199 = v38[v198];
  int v200 = 0;
  bool v201 = v199 != v200;
  int v202;
  if (v201) {
    int v203 = 108;
    int v204 = v203 + v39;
    int v205 = v38[v204];
    int v206 = 0;
    bool v207 = v205 != v206;
    int v208;
    if (v207) {
      int v209 = 1;
      int v210 = v39 + v209;
      v208 = v210;
    } else {
      int v211 = 112;
      int v212 = v211 + v39;
      int v213 = v38[v212];
      uint v214 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v215 = (int)(v214);
      int v216;
      v216 = v215;
      switch (v213) {
        default:
          {
          int v217 = 1;
          v216 = v217;
          break;
        }
        case 0:
          {
          v216 = v39;
          break;
        }
      }
      bool v218 = true;
      v208 = v216;
    }
    v202 = v208;
  } else {
    int v219 = 116;
    int v220 = v219 + v39;
    int v221 = v38[v220];
    int v222 = 0;
    int v223;
    v223 = v222;
    switch (v221) {
      default:
        {
        int v224 = 120;
        int v225 = v224 + v39;
        int v226 = v38[v225];
        int v227 = 0;
        bool v228 = v226 != v227;
        int v229;
        if (v228) {
          int v230 = 2;
          v229 = v230;
        } else {
          int v231 = 4;
          int v232 = v39 + v231;
          v229 = v232;
        }
        v223 = v229;
        break;
      }
      case 0:
        {
        int v233 = 4;
        int v234 = v39 + v233;
        v223 = v234;
        break;
      }
      case 1:
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
          int v241 = v240 + v39;
          int v242 = 124;
          int v243 = v242 + v241;
          int v244 = v38[v243];
          int v245 = 0;
          bool v246 = v244 != v245;
          v237 = v237;
          v238 = v238;
          if (!v246) break;
          int v247 = v237 + v238;
          int v248 = 1;
          int v249 = v238 + v248;
          v237 = v247;
          v238 = v249;
        }
        bool v250 = true;
        v223 = v237;
        break;
      }
    }
    bool v251 = true;
    v202 = v223;
  }
  int v252 = 48;
  int v253 = v252 + v39;
  bool v254 = true;
  int v255 = simt_wave_count_bits(v254);
  v37[v253] = v255;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
