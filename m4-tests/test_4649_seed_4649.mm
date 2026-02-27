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
        bool v25 = true;
        int v26 = simt_wave_count_bits(v25);
        int v27 = 0;
        int v28 = 4;
        int v29 = v19 * v28;
        int v30 = v27 + v29;
        int v31 = v30 + v0;
        v1[v31] = v26;
        int v32 = 1;
        int v33 = v19 + v32;
        v18 = v26;
        v19 = v33;
        break;
        ;
      }
      v15 = v18;
    } else {
      int v34 = 3;
      int v35 = v3 % v34;
      uint v36 = simt_lane_id(__simt_tid);
      int v37 = (int)(v36);
      int v38;
      v38 = v37;
      switch (v35) {
        case 0:
          {
          int v39 = 4;
          v38 = v39;
          break;
        }
        case 1:
          {
          int v40 = 1;
          v38 = v40;
        }
        default:
          {
          int v41 = 1;
          v38 = v41;
          break;
        }
        case 2:
          {
          int v42 = 2;
          int v43 = v0 + v42;
          v38 = v43;
          break;
        }
      }
      v15 = v38;
    }
    int v44 = 1;
    int v45 = v7 + v44;
    v6 = v15;
    v7 = v45;
    continue;
    ;
  }
  return;
}

kernel void kernel_main(device int* v46 [[buffer(0)]], device int* v47 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v48 = static_cast<int>(__simt_tid3.x);
  int v49 = 0;
  int v50 = v49 + v48;
  int v51 = v47[v50];
  int v52 = 4;
  int v53 = v52 + v48;
  int v54 = v47[v53];
  int v55 = 0;
  bool v56 = v51 != v55;
  if (v56) {
  } else {
    int v57 = 8;
    int v58 = v57 + v48;
    int v59 = v47[v58];
    int v60 = 0;
    bool v61 = v59 != v60;
    if (v61) {
    } else {
      helper0(v48, v46, v51, v54, static_cast<int>(__simt_tid3.x));
    }
  }
  int v62 = 0;
  int v63 = v48 + v62;
  int v64 = 12;
  int v65 = v64 + v48;
  int v66 = v47[v65];
  uint v67 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v68 = (int)(v67);
  int v69;
  v69 = v68;
  switch (v66) {
    default:
      {
      int v70 = 0;
      int v71 = 0;
      int v72;
      int v73;
      v72 = v70;
      v73 = v71;
      while (true) {
        int v74 = 4;
        int v75 = v73 * v74;
        int v76 = v75 + v48;
        int v77 = 16;
        int v78 = v77 + v76;
        int v79 = v47[v78];
        int v80 = 0;
        bool v81 = v79 != v80;
        v72 = v72;
        v73 = v73;
        if (!v81) break;
        int v82 = 1;
        int v83 = v48 + v82;
        int v84 = v72 + v83;
        int v85 = 1;
        int v86 = v73 + v85;
        bool v87 = true;
        v72 = v84;
        v73 = v86;
        break;
        ;
      }
      v69 = v72;
      break;
    }
    case 0:
      {
      int v88 = 36;
      int v89 = v88 + v48;
      int v90 = v47[v89];
      int v91 = 0;
      bool v92 = v90 != v91;
      int v93;
      if (v92) {
        int v94 = 0;
        int v95 = 0;
        int v96;
        int v97;
        v96 = v94;
        v97 = v95;
        while (true) {
          int v98 = 4;
          int v99 = v97 * v98;
          int v100 = v99 + v48;
          int v101 = 40;
          int v102 = v101 + v100;
          int v103 = v47[v102];
          int v104 = 0;
          bool v105 = v103 != v104;
          v96 = v96;
          v97 = v97;
          if (!v105) break;
          int v106 = v96 + v97;
          int v107 = 1;
          int v108 = v97 + v107;
          bool v109 = true;
          v96 = v106;
          v97 = v108;
        }
        v93 = v96;
      } else {
        int v110 = 60;
        int v111 = v110 + v48;
        int v112 = v47[v111];
        int v113 = 0;
        int v114;
        v114 = v113;
        switch (v112) {
          case 0:
            {
            int v115 = 3;
            int v116 = v48 + v115;
            v114 = v116;
          }
          default:
            {
            v114 = v48;
            break;
          }
        }
        v93 = v114;
      }
      v69 = v93;
    }
    case 1:
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
        int v123 = v122 + v48;
        int v124 = 64;
        int v125 = v124 + v123;
        int v126 = v47[v125];
        int v127 = 0;
        bool v128 = v126 != v127;
        v119 = v119;
        v120 = v120;
        if (!v128) break;
        int v129 = 84;
        int v130 = v129 + v48;
        int v131 = v47[v130];
        int v132 = 1;
        int v133;
        v133 = v132;
        switch (v131) {
          case 0:
            {
            int v134 = 3;
            v133 = v134;
            break;
          }
          case 1:
            {
            int v135 = 0;
            int v136 = v48 + v135;
            v133 = v136;
            break;
          }
          case 2:
            {
            v133 = v48;
            break;
          }
          default:
            {
            int v137 = 0;
            v133 = v137;
            break;
          }
        }
        int v138 = v119 + v133;
        int v139 = 1;
        int v140 = v120 + v139;
        bool v141 = true;
        v119 = v138;
        v120 = v140;
      }
      v69 = v119;
      break;
    }
  }
  bool v142 = true;
  int v143 = 16;
  int v144 = v143 + v48;
  bool v145 = true;
  int v146 = simt_wave_count_bits(v145);
  v46[v144] = v146;
  int v147 = 88;
  int v148 = v147 + v48;
  int v149 = v47[v148];
  int v150 = 0;
  bool v151 = v149 != v150;
  int v152;
  if (v151) {
    int v153 = 92;
    int v154 = v153 + v48;
    int v155 = v47[v154];
    int v156 = 4;
    int v157 = v48 + v156;
    int v158;
    v158 = v157;
    switch (v155) {
      case 0:
        {
        int v159 = 1;
        int v160 = v48 + v159;
        v158 = v160;
        break;
      }
      case 1:
        {
        int v161 = 96;
        int v162 = v161 + v48;
        int v163 = v47[v162];
        int v164 = 4;
        int v165 = v48 + v164;
        int v166;
        v166 = v165;
        switch (v163) {
          case 0:
            {
            int v167 = 0;
            int v168 = v48 + v167;
            v166 = v168;
            break;
          }
          default:
            {
            int v169 = 1;
            int v170 = v48 + v169;
            v166 = v170;
            break;
          }
          case 1:
            {
            v166 = v48;
            break;
          }
        }
        v158 = v166;
        break;
      }
      case 2:
        {
        int v171 = 100;
        int v172 = v171 + v48;
        int v173 = v47[v172];
        int v174;
        v174 = v48;
        switch (v173) {
          case 0:
            {
            v174 = v48;
            break;
          }
          case 1:
            {
            int v175 = 0;
            v174 = v175;
            break;
          }
          default:
            {
            int v176 = 1;
            v174 = v176;
            break;
          }
        }
        bool v177 = true;
        v158 = v174;
        break;
      }
      default:
        {
        int v178 = 0;
        int v179 = 0;
        int v180;
        int v181;
        v180 = v178;
        v181 = v179;
        while (true) {
          int v182 = 4;
          int v183 = v181 * v182;
          int v184 = v183 + v48;
          int v185 = 104;
          int v186 = v185 + v184;
          int v187 = v47[v186];
          int v188 = 0;
          bool v189 = v187 != v188;
          v180 = v180;
          v181 = v181;
          if (!v189) break;
          int v190 = v180 + v181;
          int v191 = 1;
          int v192 = v181 + v191;
          bool v193 = true;
          v180 = v190;
          v181 = v192;
          continue;
          ;
        }
        v158 = v180;
        break;
      }
    }
    v152 = v158;
  } else {
    int v194 = 124;
    int v195 = v194 + v48;
    int v196 = v47[v195];
    int v197 = 0;
    bool v198 = v196 != v197;
    int v199;
    if (v198) {
      int v200 = 0;
      int v201 = 0;
      int v202;
      int v203;
      v202 = v200;
      v203 = v201;
      while (true) {
        int v204 = 4;
        int v205 = v203 * v204;
        int v206 = v205 + v48;
        int v207 = 128;
        int v208 = v207 + v206;
        int v209 = v47[v208];
        int v210 = 0;
        bool v211 = v209 != v210;
        v202 = v202;
        v203 = v203;
        if (!v211) break;
        int v212 = v202 + v203;
        int v213 = 1;
        int v214 = v203 + v213;
        bool v215 = true;
        int v216 = 32;
        int v217 = 4;
        int v218 = v203 * v217;
        int v219 = v216 + v218;
        int v220 = v219 + v48;
        bool v221 = true;
        int v222 = simt_wave_count_bits(v221);
        v46[v220] = v222;
        v202 = v212;
        v203 = v214;
      }
      v199 = v202;
    } else {
      int v223 = 0;
      int v224 = 0;
      int v225;
      int v226;
      v225 = v223;
      v226 = v224;
      while (true) {
        int v227 = 4;
        int v228 = v226 * v227;
        int v229 = v228 + v48;
        int v230 = 148;
        int v231 = v230 + v229;
        int v232 = v47[v231];
        int v233 = 0;
        bool v234 = v232 != v233;
        v225 = v225;
        v226 = v226;
        if (!v234) break;
        int v235 = v225 + v226;
        int v236 = 1;
        int v237 = v226 + v236;
        bool v238 = true;
        int v239 = 48;
        int v240 = 4;
        int v241 = v226 * v240;
        int v242 = v239 + v241;
        int v243 = v242 + v48;
        bool v244 = true;
        int v245 = simt_wave_count_bits(v244);
        v46[v243] = v245;
        v225 = v235;
        v226 = v237;
      }
      v199 = v225;
    }
    int v246 = 64;
    int v247 = v246 + v48;
    bool v248 = true;
    int v249 = simt_wave_count_bits(v248);
    v46[v247] = v249;
    v152 = v199;
  }
  int v250 = 80;
  int v251 = v250 + v48;
  bool v252 = true;
  int v253 = simt_wave_count_bits(v252);
  v46[v251] = v253;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 168; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
