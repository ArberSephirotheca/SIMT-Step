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
      bool v22 = true;
      int v23 = simt_wave_count_bits(v22);
      int v24 = 0;
      int v25 = 4;
      int v26 = v16 * v25;
      int v27 = v24 + v26;
      int v28 = v27 + v0;
      v1[v28] = v23;
      int v29 = 1;
      int v30 = v16 + v29;
      v15 = v23;
      v16 = v30;
    }
    int v31 = 1;
    int v32 = v7 + v31;
    v6 = v15;
    v7 = v32;
    continue;
    ;
  }
  int v33 = 3;
  int v34 = v3 % v33;
  uint v35 = simt_lane_id(__simt_tid);
  int v36 = (int)(v35);
  int v37;
  v37 = v36;
  switch (v34) {
    case 0:
      {
      int v38 = 1;
      int v39 = v0 + v38;
      v37 = v39;
      break;
    }
    default:
      {
      int v40 = 0;
      bool v41 = v2 != v40;
      int v42;
      if (v41) {
        int v43 = 0;
        int v44 = v0 + v43;
        v42 = v44;
      } else {
        int v45 = 4;
        int v46 = v3 % v45;
        int v47;
        v47 = v0;
        switch (v46) {
          case 0:
            {
            v47 = v0;
          }
          case 1:
            {
            int v48 = 4;
            int v49 = v0 + v48;
            v47 = v49;
            break;
          }
          case 2:
            {
            int v50 = 4;
            v47 = v50;
          }
          default:
            {
            int v51 = 4;
            int v52 = v0 + v51;
            v47 = v52;
            break;
          }
        }
        v42 = v47;
      }
      v37 = v42;
      break;
    }
    case 1:
      {
      v37 = v0;
    }
    case 2:
      {
      int v53 = 0;
      bool v54 = v2 != v53;
      int v55;
      if (v54) {
        int v56 = 2;
        int v57 = v3 % v56;
        int v58 = 4;
        int v59;
        v59 = v58;
        switch (v57) {
          case 0:
            {
            v59 = v0;
            break;
          }
          default:
            {
            int v60 = 0;
            v59 = v60;
            break;
          }
        }
        v55 = v59;
      } else {
        int v61 = 0;
        int v62 = 0;
        int v63;
        int v64;
        v63 = v61;
        v64 = v62;
        while (true) {
          int v65 = 4;
          int v66 = v3 % v65;
          int v67 = 1;
          int v68 = v66 + v67;
          bool v69 = v64 < v68;
          v63 = v63;
          v64 = v64;
          if (!v69) break;
          int v70 = 3;
          int v71 = 1;
          int v72 = v64 + v71;
          v63 = v70;
          v64 = v72;
        }
        v55 = v63;
      }
      v37 = v55;
      break;
    }
  }
  int v73 = 0;
  bool v74 = v2 != v73;
  int v75 = v74 ? v6 : v37;
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
  int v85 = 0;
  int v86 = 0;
  int v87;
  int v88;
  v87 = v85;
  v88 = v86;
  while (true) {
    int v89 = 4;
    int v90 = v88 * v89;
    int v91 = v90 + v78;
    int v92 = 8;
    int v93 = v92 + v91;
    int v94 = v77[v93];
    int v95 = 0;
    bool v96 = v94 != v95;
    v87 = v87;
    v88 = v88;
    if (!v96) break;
    int v97 = 28;
    int v98 = v97 + v78;
    int v99 = v77[v98];
    int v100 = 0;
    bool v101 = v99 != v100;
    int v102;
    if (v101) {
      int v103 = 0;
      int v104 = 0;
      int v105;
      int v106;
      v105 = v103;
      v106 = v104;
      while (true) {
        int v107 = 4;
        int v108 = v106 * v107;
        int v109 = v108 + v78;
        int v110 = 32;
        int v111 = v110 + v109;
        int v112 = v77[v111];
        int v113 = 0;
        bool v114 = v112 != v113;
        v105 = v105;
        v106 = v106;
        if (!v114) break;
        int v115 = v105 + v106;
        int v116 = 1;
        int v117 = v106 + v116;
        bool v118 = true;
        int v119 = 16;
        int v120 = 4;
        int v121 = v106 * v120;
        int v122 = v119 + v121;
        int v123 = v122 + v78;
        bool v124 = true;
        int v125 = simt_wave_count_bits(v124);
        v76[v123] = v125;
        v105 = v115;
        v106 = v117;
        break;
        ;
      }
      v102 = v105;
    } else {
      int v126 = 0;
      int v127 = 0;
      int v128;
      int v129;
      v128 = v126;
      v129 = v127;
      while (true) {
        int v130 = 4;
        int v131 = v129 * v130;
        int v132 = v131 + v78;
        int v133 = 52;
        int v134 = v133 + v132;
        int v135 = v77[v134];
        int v136 = 0;
        bool v137 = v135 != v136;
        v128 = v128;
        v129 = v129;
        if (!v137) break;
        int v138 = v128 + v129;
        int v139 = 1;
        int v140 = v129 + v139;
        bool v141 = true;
        int v142 = 32;
        int v143 = 4;
        int v144 = v129 * v143;
        int v145 = v142 + v144;
        int v146 = v145 + v78;
        bool v147 = true;
        int v148 = simt_wave_count_bits(v147);
        v76[v146] = v148;
        v128 = v138;
        v129 = v140;
      }
      v102 = v128;
    }
    int v149 = 48;
    int v150 = v149 + v78;
    bool v151 = true;
    int v152 = simt_wave_count_bits(v151);
    v76[v150] = v152;
    int v153 = v87 + v102;
    int v154 = 1;
    int v155 = v88 + v154;
    bool v156 = true;
    int v157 = 64;
    int v158 = 4;
    int v159 = v88 * v158;
    int v160 = v157 + v159;
    int v161 = v160 + v78;
    bool v162 = true;
    int v163 = simt_wave_count_bits(v162);
    v76[v161] = v163;
    v87 = v153;
    v88 = v155;
  }
  int v164 = 72;
  int v165 = v164 + v78;
  int v166 = v77[v165];
  int v167 = 0;
  bool v168 = v166 != v167;
  int v169;
  if (v168) {
    int v170 = 76;
    int v171 = v170 + v78;
    int v172 = v77[v171];
    int v173 = 0;
    bool v174 = v172 != v173;
    int v175;
    if (v174) {
      int v176 = 80;
      int v177 = v176 + v78;
      int v178 = v77[v177];
      int v179 = 0;
      bool v180 = v178 != v179;
      int v181;
      if (v180) {
        int v182 = 3;
        v181 = v182;
      } else {
        uint v183 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v184 = (int)(v183);
        v181 = v184;
      }
      int v185 = 80;
      int v186 = v185 + v78;
      bool v187 = true;
      int v188 = simt_wave_count_bits(v187);
      v76[v186] = v188;
      v175 = v181;
    } else {
      uint v189 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v190 = (int)(v189);
      v175 = v190;
    }
    int v191 = 96;
    int v192 = v191 + v78;
    bool v193 = true;
    int v194 = simt_wave_count_bits(v193);
    v76[v192] = v194;
    v169 = v175;
  } else {
    int v195 = 84;
    int v196 = v195 + v78;
    int v197 = v77[v196];
    int v198 = 0;
    int v199;
    v199 = v198;
    switch (v197) {
      case 0:
        {
        int v200 = 0;
        int v201 = 0;
        int v202;
        int v203;
        v202 = v200;
        v203 = v201;
        while (true) {
          int v204 = 4;
          int v205 = v203 * v204;
          int v206 = v205 + v78;
          int v207 = 88;
          int v208 = v207 + v206;
          int v209 = v77[v208];
          int v210 = 0;
          bool v211 = v209 != v210;
          v202 = v202;
          v203 = v203;
          if (!v211) break;
          int v212 = v202 + v203;
          int v213 = 1;
          int v214 = v203 + v213;
          bool v215 = true;
          v202 = v212;
          v203 = v214;
          break;
          ;
        }
        v199 = v202;
        break;
      }
      case 1:
        {
        int v216 = 108;
        int v217 = v216 + v78;
        int v218 = v77[v217];
        int v219 = 3;
        int v220;
        v220 = v219;
        switch (v218) {
          case 0:
            {
            int v221 = 2;
            v220 = v221;
          }
          case 1:
            {
            int v222 = 3;
            int v223 = v78 + v222;
            v220 = v223;
          }
          default:
            {
            int v224 = 2;
            int v225 = v78 + v224;
            v220 = v225;
            break;
          }
        }
        v199 = v220;
        break;
      }
      case 2:
        {
        int v226 = 112;
        int v227 = v226 + v78;
        int v228 = v77[v227];
        int v229 = 0;
        bool v230 = v228 != v229;
        int v231;
        if (v230) {
          v231 = v78;
        } else {
          int v232 = 2;
          v231 = v232;
        }
        v199 = v231;
        break;
      }
      default:
        {
        v199 = v78;
        break;
      }
    }
    bool v233 = true;
    int v234 = 112;
    int v235 = v234 + v78;
    bool v236 = true;
    int v237 = simt_wave_count_bits(v236);
    v76[v235] = v237;
    v169 = v199;
  }
  int v238 = 128;
  int v239 = v238 + v78;
  bool v240 = true;
  int v241 = simt_wave_count_bits(v240);
  v76[v239] = v241;
  uint v242 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v243 = (int)(v242);
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
    static int32_t expected0[] = {static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 132; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 116; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
