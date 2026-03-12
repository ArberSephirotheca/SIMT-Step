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
  int v8 = 0;
  bool v9 = v2 != v8;
  int v10;
  if (v9) {
    int v11 = 0;
    int v12 = 0;
    int v13;
    int v14;
    v13 = v11;
    v14 = v12;
    while (true) {
      int v15 = 4;
      int v16 = v3 % v15;
      int v17 = 1;
      int v18 = v16 + v17;
      bool v19 = v14 < v18;
      v13 = v13;
      v14 = v14;
      if (!v19) break;
      int v20 = 2;
      int v21 = v3 % v20;
      uint v22 = simt_lane_id(__simt_tid);
      int v23 = (int)(v22);
      int v24;
      v24 = v23;
      switch (v21) {
        case 0:
          {
          int v25 = 0;
          int v26 = v0 + v25;
          v24 = v26;
        }
        default:
          {
          int v27 = 4;
          int v28 = v0 + v27;
          v24 = v28;
          break;
        }
      }
      int v29 = 1;
      int v30 = v14 + v29;
      v13 = v24;
      v14 = v30;
    }
    v10 = v13;
  } else {
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
      bool v40 = true;
      int v41 = simt_wave_count_bits(v40);
      int v42 = 16;
      int v43 = 4;
      int v44 = v34 * v43;
      int v45 = v42 + v44;
      int v46 = v45 + v0;
      v1[v46] = v41;
      int v47 = 1;
      int v48 = v34 + v47;
      v33 = v41;
      v34 = v48;
      break;
      ;
    }
    v10 = v33;
  }
  int v49 = 0;
  bool v50 = v2 != v49;
  int v51 = v50 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v52 [[buffer(0)]], device int* v53 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v54 = static_cast<int>(__simt_tid3.x);
  int v55 = 0;
  int v56 = v55 + v54;
  int v57 = v53[v56];
  int v58 = 4;
  int v59 = v58 + v54;
  int v60 = v53[v59];
  helper0(v54, v52, v57, v60, static_cast<int>(__simt_tid3.x));
  int v61 = 8;
  int v62 = v61 + v54;
  int v63 = v53[v62];
  int v64;
  v64 = v54;
  switch (v63) {
    default:
      {
      int v65 = 12;
      int v66 = v65 + v54;
      int v67 = v53[v66];
      int v68 = 0;
      bool v69 = v67 != v68;
      int v70;
      if (v69) {
        int v71 = 16;
        int v72 = v71 + v54;
        int v73 = v53[v72];
        int v74 = 0;
        bool v75 = v73 != v74;
        int v76;
        if (v75) {
          v76 = v54;
        } else {
          int v77 = 2;
          int v78 = v54 + v77;
          v76 = v78;
        }
        v70 = v76;
      } else {
        int v79 = 20;
        int v80 = v79 + v54;
        int v81 = v53[v80];
        int v82 = 0;
        bool v83 = v81 != v82;
        int v84;
        if (v83) {
          int v85 = 3;
          v84 = v85;
        } else {
          v84 = v54;
        }
        v70 = v84;
      }
      v64 = v70;
    }
    case 0:
      {
      int v86 = 24;
      int v87 = v86 + v54;
      int v88 = v53[v87];
      int v89 = 3;
      int v90;
      v90 = v89;
      switch (v88) {
        case 0:
          {
          int v91 = 28;
          int v92 = v91 + v54;
          int v93 = v53[v92];
          int v94 = 3;
          int v95 = v54 + v94;
          int v96;
          v96 = v95;
          switch (v93) {
            case 0:
              {
              v96 = v54;
              break;
            }
            case 1:
              {
              v96 = v54;
              break;
            }
            default:
              {
              v96 = v54;
              break;
            }
          }
          bool v97 = true;
          v90 = v96;
          break;
        }
        default:
          {
          int v98 = 0;
          int v99 = 0;
          int v100;
          int v101;
          v100 = v98;
          v101 = v99;
          while (true) {
            int v102 = 4;
            int v103 = v101 * v102;
            int v104 = v103 + v54;
            int v105 = 32;
            int v106 = v105 + v104;
            int v107 = v53[v106];
            int v108 = 0;
            bool v109 = v107 != v108;
            v100 = v100;
            v101 = v101;
            if (!v109) break;
            int v110 = v100 + v101;
            int v111 = 1;
            int v112 = v101 + v111;
            bool v113 = true;
            v100 = v110;
            v101 = v112;
            continue;
            ;
          }
          v90 = v100;
          break;
        }
      }
      bool v114 = true;
      v64 = v90;
      break;
    }
  }
  bool v115 = true;
  int v116 = 32;
  int v117 = v116 + v54;
  bool v118 = true;
  int v119 = simt_wave_count_bits(v118);
  v52[v117] = v119;
  int v120 = 52;
  int v121 = v120 + v54;
  int v122 = v53[v121];
  uint v123 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v124 = (int)(v123);
  int v125;
  v125 = v124;
  switch (v122) {
    case 0:
      {
      int v126 = 0;
      int v127 = 0;
      int v128;
      int v129;
      v128 = v126;
      v129 = v127;
      while (true) {
        int v130 = 4;
        int v131 = v129 * v130;
        int v132 = v131 + v54;
        int v133 = 56;
        int v134 = v133 + v132;
        int v135 = v53[v134];
        int v136 = 0;
        bool v137 = v135 != v136;
        v128 = v128;
        v129 = v129;
        if (!v137) break;
        int v138 = v128 + v129;
        int v139 = 1;
        int v140 = v129 + v139;
        bool v141 = true;
        v128 = v138;
        v129 = v140;
        continue;
        ;
      }
      v125 = v128;
      break;
    }
    case 1:
      {
      int v142 = 76;
      int v143 = v142 + v54;
      int v144 = v53[v143];
      int v145 = 0;
      bool v146 = v144 != v145;
      int v147;
      if (v146) {
        int v148 = 0;
        int v149 = 0;
        int v150;
        int v151;
        v150 = v148;
        v151 = v149;
        while (true) {
          int v152 = 4;
          int v153 = v151 * v152;
          int v154 = v153 + v54;
          int v155 = 80;
          int v156 = v155 + v154;
          int v157 = v53[v156];
          int v158 = 0;
          bool v159 = v157 != v158;
          v150 = v150;
          v151 = v151;
          if (!v159) break;
          int v160 = v150 + v151;
          int v161 = 1;
          int v162 = v151 + v161;
          bool v163 = true;
          v150 = v160;
          v151 = v162;
          continue;
          ;
        }
        v147 = v150;
      } else {
        int v164 = 100;
        int v165 = v164 + v54;
        int v166 = v53[v165];
        int v167 = 2;
        int v168;
        v168 = v167;
        switch (v166) {
          default:
            {
            v168 = v54;
            break;
          }
          case 0:
            {
            v168 = v54;
            break;
          }
        }
        v147 = v168;
      }
      v125 = v147;
      break;
    }
    case 2:
      {
      int v169 = 0;
      int v170 = 0;
      int v171;
      int v172;
      v171 = v169;
      v172 = v170;
      while (true) {
        int v173 = 4;
        int v174 = v172 * v173;
        int v175 = v174 + v54;
        int v176 = 104;
        int v177 = v176 + v175;
        int v178 = v53[v177];
        int v179 = 0;
        bool v180 = v178 != v179;
        v171 = v171;
        v172 = v172;
        if (!v180) break;
        int v181 = 0;
        int v182 = 0;
        int v183;
        int v184;
        v183 = v181;
        v184 = v182;
        while (true) {
          int v185 = 4;
          int v186 = v184 * v185;
          int v187 = v186 + v54;
          int v188 = 124;
          int v189 = v188 + v187;
          int v190 = v53[v189];
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
        int v197 = v171 + v183;
        int v198 = 1;
        int v199 = v172 + v198;
        bool v200 = true;
        v171 = v197;
        v172 = v199;
      }
      v125 = v171;
      break;
    }
    default:
      {
      int v201 = 144;
      int v202 = v201 + v54;
      int v203 = v53[v202];
      int v204 = 0;
      bool v205 = v203 != v204;
      int v206;
      if (v205) {
        int v207 = 0;
        int v208 = 0;
        int v209;
        int v210;
        v209 = v207;
        v210 = v208;
        while (true) {
          int v211 = 4;
          int v212 = v210 * v211;
          int v213 = v212 + v54;
          int v214 = 148;
          int v215 = v214 + v213;
          int v216 = v53[v215];
          int v217 = 0;
          bool v218 = v216 != v217;
          v209 = v209;
          v210 = v210;
          if (!v218) break;
          int v219 = v209 + v210;
          int v220 = 1;
          int v221 = v210 + v220;
          bool v222 = true;
          v209 = v219;
          v210 = v221;
        }
        v206 = v209;
      } else {
        int v223 = 168;
        int v224 = v223 + v54;
        int v225 = v53[v224];
        int v226 = 0;
        bool v227 = v225 != v226;
        int v228;
        if (v227) {
          int v229 = 2;
          int v230 = v54 + v229;
          v228 = v230;
        } else {
          int v231 = 0;
          int v232 = v54 + v231;
          v228 = v232;
        }
        v206 = v228;
      }
      v125 = v206;
      break;
    }
  }
  bool v233 = true;
  int v234 = 48;
  int v235 = v234 + v54;
  bool v236 = true;
  int v237 = simt_wave_count_bits(v236);
  v52[v235] = v237;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 172; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
