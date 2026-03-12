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
    int v7 = 3;
    v6 = v7;
  } else {
    int v8 = 0;
    int v9 = 0;
    int v10;
    int v11;
    v10 = v8;
    v11 = v9;
    while (true) {
      int v12 = 4;
      int v13 = v3 % v12;
      int v14 = 1;
      int v15 = v13 + v14;
      bool v16 = v11 < v15;
      v10 = v10;
      v11 = v11;
      if (!v16) break;
      int v17 = 0;
      bool v18 = v2 != v17;
      int v19;
      if (v18) {
        uint v20 = simt_subgroup_id(__simt_tid);
        int v21 = (int)(v20);
        v19 = v21;
      } else {
        uint v22 = simt_lane_id(__simt_tid);
        int v23 = (int)(v22);
        v19 = v23;
      }
      int v24 = 1;
      int v25 = v11 + v24;
      v10 = v19;
      v11 = v25;
    }
    int v26 = 4;
    int v27 = v0 + v26;
    v6 = v10;
  }
  bool v28 = true;
  int v29 = simt_wave_count_bits(v28);
  int v30 = 0;
  int v31 = v30 + v0;
  v1[v31] = v29;
  return;
}

kernel void kernel_main(device int* v32 [[buffer(0)]], device int* v33 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v34 = static_cast<int>(__simt_tid3.x);
  int v35 = 0;
  int v36 = v35 + v34;
  int v37 = v33[v36];
  int v38 = 4;
  int v39 = v38 + v34;
  int v40 = v33[v39];
  helper0(v34, v32, v37, v40, static_cast<int>(__simt_tid3.x));
  int v41 = 8;
  int v42 = v41 + v34;
  int v43 = v33[v42];
  uint v44 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v45 = (int)(v44);
  int v46;
  v46 = v45;
  switch (v43) {
    default:
      {
      int v47 = 12;
      int v48 = v47 + v34;
      int v49 = v33[v48];
      int v50 = 0;
      bool v51 = v49 != v50;
      int v52;
      if (v51) {
        int v53 = 16;
        int v54 = v53 + v34;
        int v55 = v33[v54];
        int v56 = 1;
        int v57;
        v57 = v56;
        switch (v55) {
          case 0:
            {
            int v58 = 4;
            v57 = v58;
          }
          default:
            {
            int v59 = 1;
            int v60 = v34 + v59;
            v57 = v60;
            break;
          }
        }
        bool v61 = true;
        v52 = v57;
      } else {
        int v62 = 20;
        int v63 = v62 + v34;
        int v64 = v33[v63];
        int v65 = 2;
        int v66;
        v66 = v65;
        switch (v64) {
          default:
            {
            int v67 = 3;
            v66 = v67;
            break;
          }
          case 0:
            {
            int v68 = 1;
            v66 = v68;
            break;
          }
          case 1:
            {
            int v69 = 2;
            v66 = v69;
            break;
          }
          case 2:
            {
            v66 = v34;
            break;
          }
        }
        bool v70 = true;
        v52 = v66;
      }
      v46 = v52;
      break;
    }
    case 0:
      {
      int v71 = 24;
      int v72 = v71 + v34;
      int v73 = v33[v72];
      int v74 = 2;
      int v75;
      v75 = v74;
      switch (v73) {
        default:
          {
          int v76 = 28;
          int v77 = v76 + v34;
          int v78 = v33[v77];
          int v79 = 0;
          bool v80 = v78 != v79;
          int v81;
          if (v80) {
            int v82 = 1;
            v81 = v82;
          } else {
            v81 = v34;
          }
          v75 = v81;
          break;
        }
        case 0:
          {
          int v83 = 0;
          int v84 = 0;
          int v85;
          int v86;
          v85 = v83;
          v86 = v84;
          while (true) {
            int v87 = 4;
            int v88 = v86 * v87;
            int v89 = v88 + v34;
            int v90 = 32;
            int v91 = v90 + v89;
            int v92 = v33[v91];
            int v93 = 0;
            bool v94 = v92 != v93;
            v85 = v85;
            v86 = v86;
            if (!v94) break;
            int v95 = v85 + v86;
            int v96 = 1;
            int v97 = v86 + v96;
            v85 = v95;
            v86 = v97;
            continue;
            ;
          }
          bool v98 = true;
          v75 = v85;
          break;
        }
      }
      bool v99 = true;
      v46 = v75;
      break;
    }
    case 1:
      {
      int v100 = 52;
      int v101 = v100 + v34;
      int v102 = v33[v101];
      int v103 = 0;
      bool v104 = v102 != v103;
      int v105;
      if (v104) {
        int v106 = 56;
        int v107 = v106 + v34;
        int v108 = v33[v107];
        int v109 = 0;
        bool v110 = v108 != v109;
        int v111;
        if (v110) {
          v111 = v34;
        } else {
          int v112 = 2;
          v111 = v112;
        }
        v105 = v111;
      } else {
        int v113 = 60;
        int v114 = v113 + v34;
        int v115 = v33[v114];
        int v116 = 2;
        int v117 = v34 + v116;
        int v118;
        v118 = v117;
        switch (v115) {
          case 0:
            {
            int v119 = 0;
            v118 = v119;
          }
          case 1:
            {
            int v120 = 1;
            int v121 = v34 + v120;
            v118 = v121;
            break;
          }
          case 2:
            {
            v118 = v34;
          }
          default:
            {
            int v122 = 4;
            v118 = v122;
            break;
          }
        }
        bool v123 = true;
        v105 = v118;
      }
      v46 = v105;
      break;
    }
    case 2:
      {
      int v124 = 0;
      int v125 = 0;
      int v126;
      int v127;
      v126 = v124;
      v127 = v125;
      while (true) {
        int v128 = 4;
        int v129 = v127 * v128;
        int v130 = v129 + v34;
        int v131 = 64;
        int v132 = v131 + v130;
        int v133 = v33[v132];
        int v134 = 0;
        bool v135 = v133 != v134;
        v126 = v126;
        v127 = v127;
        if (!v135) break;
        int v136 = v126 + v127;
        int v137 = 1;
        int v138 = v127 + v137;
        v126 = v136;
        v127 = v138;
      }
      bool v139 = true;
      v46 = v126;
      break;
    }
  }
  bool v140 = true;
  int v141 = 16;
  int v142 = v141 + v34;
  bool v143 = true;
  int v144 = simt_wave_count_bits(v143);
  v32[v142] = v144;
  int v145 = 84;
  int v146 = v145 + v34;
  int v147 = v33[v146];
  int v148;
  v148 = v34;
  switch (v147) {
    case 0:
      {
      int v149 = 88;
      int v150 = v149 + v34;
      int v151 = v33[v150];
      int v152 = 0;
      bool v153 = v151 != v152;
      int v154;
      if (v153) {
        int v155 = 92;
        int v156 = v155 + v34;
        int v157 = v33[v156];
        int v158 = 4;
        int v159;
        v159 = v158;
        switch (v157) {
          case 0:
            {
            int v160 = 2;
            int v161 = v34 + v160;
            v159 = v161;
            break;
          }
          default:
            {
            int v162 = 0;
            v159 = v162;
            break;
          }
          case 1:
            {
            v159 = v34;
            break;
          }
        }
        bool v163 = true;
        v154 = v159;
      } else {
        int v164 = 96;
        int v165 = v164 + v34;
        int v166 = v33[v165];
        int v167 = 0;
        bool v168 = v166 != v167;
        int v169;
        if (v168) {
          int v170 = 4;
          int v171 = v34 + v170;
          v169 = v171;
        } else {
          int v172 = 1;
          v169 = v172;
        }
        v154 = v169;
      }
      v148 = v154;
      break;
    }
    case 1:
      {
      int v173 = 100;
      int v174 = v173 + v34;
      int v175 = v33[v174];
      int v176 = 4;
      int v177 = v34 + v176;
      int v178;
      v178 = v177;
      switch (v175) {
        case 0:
          {
          int v179 = 104;
          int v180 = v179 + v34;
          int v181 = v33[v180];
          int v182;
          v182 = v34;
          switch (v181) {
            default:
              {
              v182 = v34;
            }
            case 0:
              {
              int v183 = 3;
              v182 = v183;
              break;
            }
          }
          bool v184 = true;
          v178 = v182;
        }
        default:
          {
          int v185 = 4;
          v178 = v185;
          break;
        }
      }
      bool v186 = true;
      v148 = v178;
      break;
    }
    case 2:
      {
      v148 = v34;
      break;
    }
    default:
      {
      int v187 = 108;
      int v188 = v187 + v34;
      int v189 = v33[v188];
      int v190 = 0;
      bool v191 = v189 != v190;
      int v192;
      if (v191) {
        int v193 = 112;
        int v194 = v193 + v34;
        int v195 = v33[v194];
        int v196;
        v196 = v34;
        switch (v195) {
          case 0:
            {
            int v197 = 1;
            int v198 = v34 + v197;
            v196 = v198;
            break;
          }
          default:
            {
            int v199 = 3;
            v196 = v199;
            break;
          }
          case 1:
            {
            v196 = v34;
            break;
          }
          case 2:
            {
            v196 = v34;
            break;
          }
        }
        bool v200 = true;
        v192 = v196;
      } else {
        int v201 = 4;
        v192 = v201;
      }
      v148 = v192;
      break;
    }
  }
  bool v202 = true;
  int v203 = 32;
  int v204 = v203 + v34;
  bool v205 = true;
  int v206 = simt_wave_count_bits(v205);
  v32[v204] = v206;
  int v207 = 0;
  int v208 = 0;
  int v209;
  int v210;
  v209 = v207;
  v210 = v208;
  while (true) {
    int v211 = 4;
    int v212 = v210 * v211;
    int v213 = v212 + v34;
    int v214 = 116;
    int v215 = v214 + v213;
    int v216 = v33[v215];
    int v217 = 0;
    bool v218 = v216 != v217;
    v209 = v209;
    v210 = v210;
    if (!v218) break;
    int v219 = 4;
    int v220 = v209 + v219;
    int v221 = 1;
    int v222 = v210 + v221;
    v209 = v220;
    v210 = v222;
  }
  bool v223 = true;
  int v224 = 48;
  int v225 = v224 + v34;
  bool v226 = true;
  int v227 = simt_wave_count_bits(v226);
  v32[v225] = v227;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 136; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
