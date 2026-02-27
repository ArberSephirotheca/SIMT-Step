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
    int v13 = 4;
    int v14 = v3 % v13;
    uint v15 = simt_lane_id(__simt_tid);
    int v16 = (int)(v15);
    int v17;
    v17 = v16;
    switch (v14) {
      case 0:
        {
        int v18 = 0;
        int v19 = 0;
        int v20;
        int v21;
        v20 = v18;
        v21 = v19;
        while (true) {
          int v22 = 4;
          int v23 = v3 % v22;
          int v24 = 1;
          int v25 = v23 + v24;
          bool v26 = v21 < v25;
          v20 = v20;
          v21 = v21;
          if (!v26) break;
          int v27 = 1;
          int v28 = v21 + v27;
          v20 = v0;
          v21 = v28;
        }
        v17 = v20;
        break;
      }
      case 1:
        {
        int v29 = 0;
        bool v30 = v2 != v29;
        int v31;
        if (v30) {
          int v32 = 1;
          v31 = v32;
        } else {
          int v33 = 0;
          int v34 = v0 + v33;
          v31 = v34;
        }
        v17 = v31;
        break;
      }
      default:
        {
        v17 = v0;
        break;
      }
      case 2:
        {
        int v35 = 1;
        int v36 = v0 + v35;
        v17 = v36;
        break;
      }
    }
    bool v37 = true;
    int v38 = simt_wave_count_bits(v37);
    int v39 = 0;
    int v40 = 4;
    int v41 = v7 * v40;
    int v42 = v39 + v41;
    int v43 = v42 + v0;
    v1[v43] = v38;
    int v44 = 1;
    int v45 = v7 + v44;
    v6 = v17;
    v7 = v45;
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
  helper0(v48, v46, v51, v54, static_cast<int>(__simt_tid3.x));
  int v55 = 8;
  int v56 = v55 + v48;
  int v57 = v47[v56];
  int v58 = 0;
  bool v59 = v57 != v58;
  int v60;
  if (v59) {
    v60 = v48;
  } else {
    int v61 = 12;
    int v62 = v61 + v48;
    int v63 = v47[v62];
    int v64 = 0;
    bool v65 = v63 != v64;
    int v66;
    if (v65) {
      int v67 = 16;
      int v68 = v67 + v48;
      int v69 = v47[v68];
      int v70 = 0;
      bool v71 = v69 != v70;
      int v72;
      if (v71) {
        uint v73 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v74 = (int)(v73);
        v72 = v74;
      } else {
        uint v75 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v76 = (int)(v75);
        v72 = v76;
      }
      int v77 = 16;
      int v78 = v77 + v48;
      bool v79 = true;
      int v80 = simt_wave_count_bits(v79);
      v46[v78] = v80;
      v66 = v72;
    } else {
      int v81 = 0;
      int v82 = 0;
      int v83;
      int v84;
      v83 = v81;
      v84 = v82;
      while (true) {
        int v85 = 4;
        int v86 = v84 * v85;
        int v87 = v86 + v48;
        int v88 = 20;
        int v89 = v88 + v87;
        int v90 = v47[v89];
        int v91 = 0;
        bool v92 = v90 != v91;
        v83 = v83;
        v84 = v84;
        if (!v92) break;
        int v93 = v83 + v84;
        int v94 = 1;
        int v95 = v84 + v94;
        bool v96 = true;
        int v97 = 32;
        int v98 = 4;
        int v99 = v84 * v98;
        int v100 = v97 + v99;
        int v101 = v100 + v48;
        bool v102 = true;
        int v103 = simt_wave_count_bits(v102);
        v46[v101] = v103;
        v83 = v93;
        v84 = v95;
        break;
        ;
      }
      v66 = v83;
    }
    int v104 = 48;
    int v105 = v104 + v48;
    bool v106 = true;
    int v107 = simt_wave_count_bits(v106);
    v46[v105] = v107;
    v60 = v66;
  }
  int v108 = 64;
  int v109 = v108 + v48;
  bool v110 = true;
  int v111 = simt_wave_count_bits(v110);
  v46[v109] = v111;
  int v112 = 0;
  int v113 = 0;
  int v114;
  int v115;
  v114 = v112;
  v115 = v113;
  while (true) {
    int v116 = 4;
    int v117 = v115 * v116;
    int v118 = v117 + v48;
    int v119 = 40;
    int v120 = v119 + v118;
    int v121 = v47[v120];
    int v122 = 0;
    bool v123 = v121 != v122;
    v114 = v114;
    v115 = v115;
    if (!v123) break;
    int v124 = 60;
    int v125 = v124 + v48;
    int v126 = v47[v125];
    int v127 = 4;
    int v128;
    v128 = v127;
    switch (v126) {
      case 0:
        {
        int v129 = 64;
        int v130 = v129 + v48;
        int v131 = v47[v130];
        int v132 = 4;
        int v133;
        v133 = v132;
        switch (v131) {
          default:
            {
            v133 = v48;
            break;
          }
          case 0:
            {
            int v134 = 3;
            int v135 = v48 + v134;
            v133 = v135;
            break;
          }
        }
        v128 = v133;
        break;
      }
      default:
        {
        int v136 = 68;
        int v137 = v136 + v48;
        int v138 = v47[v137];
        int v139 = 0;
        bool v140 = v138 != v139;
        int v141;
        if (v140) {
          v141 = v48;
        } else {
          int v142 = 1;
          int v143 = v48 + v142;
          v141 = v143;
        }
        v128 = v141;
        break;
      }
      case 1:
        {
        int v144 = 72;
        int v145 = v144 + v48;
        int v146 = v47[v145];
        int v147 = 0;
        bool v148 = v146 != v147;
        int v149;
        if (v148) {
          int v150 = 4;
          v149 = v150;
        } else {
          v149 = v48;
        }
        v128 = v149;
        break;
      }
      case 2:
        {
        int v151 = 76;
        int v152 = v151 + v48;
        int v153 = v47[v152];
        int v154 = 0;
        bool v155 = v153 != v154;
        int v156;
        if (v155) {
          v156 = v48;
        } else {
          int v157 = 3;
          int v158 = v48 + v157;
          v156 = v158;
        }
        v128 = v156;
        break;
      }
    }
    int v159 = v114 + v128;
    int v160 = 1;
    int v161 = v115 + v160;
    bool v162 = true;
    int v163 = 80;
    int v164 = 4;
    int v165 = v115 * v164;
    int v166 = v163 + v165;
    int v167 = v166 + v48;
    bool v168 = true;
    int v169 = simt_wave_count_bits(v168);
    v46[v167] = v169;
    v114 = v159;
    v115 = v161;
  }
  int v170 = 80;
  int v171 = v170 + v48;
  int v172 = v47[v171];
  int v173;
  v173 = v48;
  switch (v172) {
    default:
      {
      int v174 = 84;
      int v175 = v174 + v48;
      int v176 = v47[v175];
      int v177 = 0;
      bool v178 = v176 != v177;
      int v179;
      if (v178) {
        int v180 = 0;
        int v181 = 0;
        int v182;
        int v183;
        v182 = v180;
        v183 = v181;
        while (true) {
          int v184 = 4;
          int v185 = v183 * v184;
          int v186 = v185 + v48;
          int v187 = 88;
          int v188 = v187 + v186;
          int v189 = v47[v188];
          int v190 = 0;
          bool v191 = v189 != v190;
          v182 = v182;
          v183 = v183;
          if (!v191) break;
          int v192 = v182 + v183;
          int v193 = 1;
          int v194 = v183 + v193;
          bool v195 = true;
          v182 = v192;
          v183 = v194;
          break;
          ;
        }
        v179 = v182;
      } else {
        int v196 = 108;
        int v197 = v196 + v48;
        int v198 = v47[v197];
        int v199 = 0;
        bool v200 = v198 != v199;
        int v201;
        if (v200) {
          int v202 = 3;
          int v203 = v48 + v202;
          v201 = v203;
        } else {
          int v204 = 0;
          int v205 = v48 + v204;
          v201 = v205;
        }
        v179 = v201;
      }
      v173 = v179;
    }
    case 0:
      {
      int v206 = 0;
      int v207 = 0;
      int v208;
      int v209;
      v208 = v206;
      v209 = v207;
      while (true) {
        int v210 = 4;
        int v211 = v209 * v210;
        int v212 = v211 + v48;
        int v213 = 112;
        int v214 = v213 + v212;
        int v215 = v47[v214];
        int v216 = 0;
        bool v217 = v215 != v216;
        v208 = v208;
        v209 = v209;
        if (!v217) break;
        int v218 = v208 + v209;
        int v219 = 1;
        int v220 = v209 + v219;
        bool v221 = true;
        v208 = v218;
        v209 = v220;
        continue;
        ;
      }
      v173 = v208;
    }
    case 1:
      {
      int v222 = 132;
      int v223 = v222 + v48;
      int v224 = v47[v223];
      int v225 = 0;
      bool v226 = v224 != v225;
      int v227;
      if (v226) {
        v227 = v48;
      } else {
        int v228 = 136;
        int v229 = v228 + v48;
        int v230 = v47[v229];
        int v231 = 0;
        bool v232 = v230 != v231;
        int v233;
        if (v232) {
          v233 = v48;
        } else {
          int v234 = 2;
          v233 = v234;
        }
        v227 = v233;
      }
      v173 = v227;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 140; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
