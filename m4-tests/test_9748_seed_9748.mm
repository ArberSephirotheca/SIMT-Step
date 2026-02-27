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
    int v7 = 2;
    int v8 = v3 % v7;
    int v9 = 0;
    int v10;
    v10 = v9;
    switch (v8) {
      default:
        {
        int v11 = 0;
        bool v12 = v2 != v11;
        int v13;
        if (v12) {
          int v14 = 0;
          v13 = v14;
        } else {
          int v15 = 3;
          v13 = v15;
        }
        v10 = v13;
        break;
      }
      case 0:
        {
        int v16 = 3;
        int v17 = v3 % v16;
        int v18 = 4;
        int v19;
        v19 = v18;
        switch (v17) {
          case 0:
            {
            int v20 = 3;
            int v21 = v0 + v20;
            v19 = v21;
            break;
          }
          case 1:
            {
            v19 = v0;
            break;
          }
          case 2:
            {
            int v22 = 1;
            int v23 = v0 + v22;
            v19 = v23;
            break;
          }
          default:
            {
            int v24 = 4;
            v19 = v24;
            break;
          }
        }
        v10 = v19;
        break;
      }
      case 1:
        {
        int v25 = 0;
        bool v26 = v2 != v25;
        int v27;
        if (v26) {
          v27 = v0;
        } else {
          int v28 = 0;
          int v29 = v0 + v28;
          v27 = v29;
        }
        v10 = v27;
        break;
      }
    }
    v6 = v10;
  } else {
    int v30 = 0;
    bool v31 = v2 != v30;
    int v32;
    if (v31) {
      bool v33 = true;
      int v34 = simt_wave_count_bits(v33);
      int v35 = 0;
      int v36 = v35 + v0;
      v1[v36] = v34;
      v32 = v34;
    } else {
      int v37 = 0;
      bool v38 = v2 != v37;
      int v39;
      if (v38) {
        bool v40 = true;
        int v41 = simt_wave_count_bits(v40);
        int v42 = 16;
        int v43 = v42 + v0;
        v1[v43] = v41;
        v39 = v41;
      } else {
        bool v44 = true;
        int v45 = simt_wave_count_bits(v44);
        int v46 = 32;
        int v47 = v46 + v0;
        v1[v47] = v45;
        v39 = v45;
      }
      v32 = v39;
    }
    v6 = v32;
  }
  return;
}

kernel void kernel_main(device int* v48 [[buffer(0)]], device int* v49 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v50 = static_cast<int>(__simt_tid3.x);
  int v51 = 0;
  int v52 = v51 + v50;
  int v53 = v49[v52];
  int v54 = 4;
  int v55 = v54 + v50;
  int v56 = v49[v55];
  helper0(v50, v48, v53, v56, static_cast<int>(__simt_tid3.x));
  int v57 = 8;
  int v58 = v57 + v50;
  int v59 = v49[v58];
  int v60 = 0;
  bool v61 = v59 != v60;
  int v62;
  if (v61) {
    uint v63 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v64 = (int)(v63);
    v62 = v64;
  } else {
    int v65 = 12;
    int v66 = v65 + v50;
    int v67 = v49[v66];
    uint v68 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v69 = (int)(v68);
    int v70;
    v70 = v69;
    switch (v67) {
      default:
        {
        int v71 = 16;
        int v72 = v71 + v50;
        int v73 = v49[v72];
        int v74;
        v74 = v50;
        switch (v73) {
          case 0:
            {
            int v75 = 2;
            int v76 = v50 + v75;
            v74 = v76;
            break;
          }
          default:
            {
            int v77 = 1;
            v74 = v77;
            break;
          }
        }
        v70 = v74;
        break;
      }
      case 0:
        {
        int v78 = 20;
        int v79 = v78 + v50;
        int v80 = v49[v79];
        int v81 = 0;
        bool v82 = v80 != v81;
        int v83;
        if (v82) {
          int v84 = 4;
          int v85 = v50 + v84;
          v83 = v85;
        } else {
          int v86 = 4;
          int v87 = v50 + v86;
          v83 = v87;
        }
        v70 = v83;
        break;
      }
    }
    v62 = v70;
  }
  int v88 = 48;
  int v89 = v88 + v50;
  bool v90 = true;
  int v91 = simt_wave_count_bits(v90);
  v48[v89] = v91;
  int v92 = 24;
  int v93 = v92 + v50;
  int v94 = v49[v93];
  int v95 = 0;
  bool v96 = v94 != v95;
  int v97;
  if (v96) {
    int v98 = 1;
    v97 = v98;
  } else {
    int v99 = 28;
    int v100 = v99 + v50;
    int v101 = v49[v100];
    int v102 = 0;
    bool v103 = v101 != v102;
    int v104;
    if (v103) {
      int v105 = 0;
      int v106 = 0;
      int v107;
      int v108;
      v107 = v105;
      v108 = v106;
      while (true) {
        int v109 = 4;
        int v110 = v108 * v109;
        int v111 = v110 + v50;
        int v112 = 32;
        int v113 = v112 + v111;
        int v114 = v49[v113];
        int v115 = 0;
        bool v116 = v114 != v115;
        v107 = v107;
        v108 = v108;
        if (!v116) break;
        int v117 = v107 + v108;
        int v118 = 1;
        int v119 = v108 + v118;
        bool v120 = true;
        int v121 = 64;
        int v122 = 4;
        int v123 = v108 * v122;
        int v124 = v121 + v123;
        int v125 = v124 + v50;
        bool v126 = true;
        int v127 = simt_wave_count_bits(v126);
        v48[v125] = v127;
        v107 = v117;
        v108 = v119;
        break;
        ;
      }
      v104 = v107;
    } else {
      int v128 = 1;
      v104 = v128;
    }
    int v129 = 80;
    int v130 = v129 + v50;
    bool v131 = true;
    int v132 = simt_wave_count_bits(v131);
    v48[v130] = v132;
    v97 = v104;
  }
  int v133 = 96;
  int v134 = v133 + v50;
  bool v135 = true;
  int v136 = simt_wave_count_bits(v135);
  v48[v134] = v136;
  int v137 = 52;
  int v138 = v137 + v50;
  int v139 = v49[v138];
  uint v140 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v141 = (int)(v140);
  int v142;
  v142 = v141;
  switch (v139) {
    case 0:
      {
      int v143 = 56;
      int v144 = v143 + v50;
      int v145 = v49[v144];
      int v146 = 0;
      bool v147 = v145 != v146;
      int v148;
      if (v147) {
        v148 = v50;
      } else {
        int v149 = 0;
        int v150 = 0;
        int v151;
        int v152;
        v151 = v149;
        v152 = v150;
        while (true) {
          int v153 = 4;
          int v154 = v152 * v153;
          int v155 = v154 + v50;
          int v156 = 60;
          int v157 = v156 + v155;
          int v158 = v49[v157];
          int v159 = 0;
          bool v160 = v158 != v159;
          v151 = v151;
          v152 = v152;
          if (!v160) break;
          int v161 = v151 + v152;
          int v162 = 1;
          int v163 = v152 + v162;
          bool v164 = true;
          v151 = v161;
          v152 = v163;
        }
        v148 = v151;
      }
      v142 = v148;
    }
    case 1:
      {
      int v165 = 80;
      int v166 = v165 + v50;
      int v167 = v49[v166];
      int v168 = 0;
      bool v169 = v167 != v168;
      int v170;
      if (v169) {
        int v171 = 0;
        int v172 = 0;
        int v173;
        int v174;
        v173 = v171;
        v174 = v172;
        while (true) {
          int v175 = 4;
          int v176 = v174 * v175;
          int v177 = v176 + v50;
          int v178 = 84;
          int v179 = v178 + v177;
          int v180 = v49[v179];
          int v181 = 0;
          bool v182 = v180 != v181;
          v173 = v173;
          v174 = v174;
          if (!v182) break;
          int v183 = v173 + v174;
          int v184 = 1;
          int v185 = v174 + v184;
          bool v186 = true;
          v173 = v183;
          v174 = v185;
        }
        v170 = v173;
      } else {
        int v187 = 104;
        int v188 = v187 + v50;
        int v189 = v49[v188];
        int v190 = 0;
        bool v191 = v189 != v190;
        int v192;
        if (v191) {
          v192 = v50;
        } else {
          int v193 = 3;
          v192 = v193;
        }
        v170 = v192;
      }
      v142 = v170;
    }
    case 2:
      {
      int v194 = 1;
      v142 = v194;
    }
    default:
      {
      int v195 = 108;
      int v196 = v195 + v50;
      int v197 = v49[v196];
      int v198 = 1;
      int v199 = v50 + v198;
      int v200;
      v200 = v199;
      switch (v197) {
        case 0:
          {
          int v201 = 0;
          int v202 = 0;
          int v203;
          int v204;
          v203 = v201;
          v204 = v202;
          while (true) {
            int v205 = 4;
            int v206 = v204 * v205;
            int v207 = v206 + v50;
            int v208 = 112;
            int v209 = v208 + v207;
            int v210 = v49[v209];
            int v211 = 0;
            bool v212 = v210 != v211;
            v203 = v203;
            v204 = v204;
            if (!v212) break;
            int v213 = v203 + v204;
            int v214 = 1;
            int v215 = v204 + v214;
            bool v216 = true;
            v203 = v213;
            v204 = v215;
          }
          v200 = v203;
        }
        case 1:
          {
          int v217 = 0;
          int v218 = 0;
          int v219;
          int v220;
          v219 = v217;
          v220 = v218;
          while (true) {
            int v221 = 4;
            int v222 = v220 * v221;
            int v223 = v222 + v50;
            int v224 = 132;
            int v225 = v224 + v223;
            int v226 = v49[v225];
            int v227 = 0;
            bool v228 = v226 != v227;
            v219 = v219;
            v220 = v220;
            if (!v228) break;
            int v229 = v219 + v220;
            int v230 = 1;
            int v231 = v220 + v230;
            bool v232 = true;
            v219 = v229;
            v220 = v231;
          }
          v200 = v219;
          break;
        }
        default:
          {
          int v233 = 152;
          int v234 = v233 + v50;
          int v235 = v49[v234];
          int v236;
          v236 = v50;
          switch (v235) {
            default:
              {
              v236 = v50;
              break;
            }
            case 0:
              {
              int v237 = 3;
              v236 = v237;
              break;
            }
          }
          bool v238 = true;
          v200 = v236;
          break;
        }
      }
      bool v239 = true;
      v142 = v200;
      break;
    }
  }
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 156; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
