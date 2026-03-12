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
      int v16 = 4;
      int v17 = v0 + v16;
      v15 = v17;
    } else {
      int v18 = 3;
      int v19 = v3 % v18;
      uint v20 = simt_subgroup_id(__simt_tid);
      int v21 = (int)(v20);
      int v22;
      v22 = v21;
      switch (v19) {
        case 0:
          {
          int v23 = 3;
          int v24 = v0 + v23;
          v22 = v24;
          break;
        }
        case 1:
          {
          int v25 = 0;
          v22 = v25;
          break;
        }
        default:
          {
          int v26 = 3;
          v22 = v26;
          break;
        }
        case 2:
          {
          int v27 = 0;
          int v28 = v0 + v27;
          v22 = v28;
          break;
        }
      }
      uint v29 = simt_subgroup_id(__simt_tid);
      int v30 = (int)(v29);
      v15 = v22;
    }
    uint v31 = simt_subgroup_id(__simt_tid);
    int v32 = (int)(v31);
    int v33 = 1;
    int v34 = v7 + v33;
    v6 = v15;
    v7 = v34;
  }
  bool v35 = true;
  int v36 = simt_wave_count_bits(v35);
  int v37 = 0;
  int v38 = v37 + v0;
  v1[v38] = v36;
  return;
}

kernel void kernel_main(device int* v39 [[buffer(0)]], device int* v40 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v41 = static_cast<int>(__simt_tid3.x);
  int v42 = 0;
  int v43 = v42 + v41;
  int v44 = v40[v43];
  int v45 = 4;
  int v46 = v45 + v41;
  int v47 = v40[v46];
  helper0(v41, v39, v44, v47, static_cast<int>(__simt_tid3.x));
  int v48 = 8;
  int v49 = v48 + v41;
  int v50 = v40[v49];
  uint v51 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v52 = (int)(v51);
  int v53;
  v53 = v52;
  switch (v50) {
    default:
      {
      int v54 = 12;
      int v55 = v54 + v41;
      int v56 = v40[v55];
      int v57 = 2;
      int v58 = v41 + v57;
      int v59;
      v59 = v58;
      switch (v56) {
        case 0:
          {
          int v60 = 16;
          int v61 = v60 + v41;
          int v62 = v40[v61];
          int v63 = 1;
          int v64;
          v64 = v63;
          switch (v62) {
            case 0:
              {
              int v65 = 4;
              int v66 = v41 + v65;
              v64 = v66;
            }
            default:
              {
              v64 = v41;
            }
            case 1:
              {
              v64 = v41;
            }
            case 2:
              {
              int v67 = 0;
              v64 = v67;
              break;
            }
          }
          bool v68 = true;
          v59 = v64;
        }
        default:
          {
          int v69 = 20;
          int v70 = v69 + v41;
          int v71 = v40[v70];
          int v72 = 0;
          bool v73 = v71 != v72;
          int v74;
          if (v73) {
            int v75 = 4;
            int v76 = v41 + v75;
            v74 = v76;
          } else {
            int v77 = 2;
            v74 = v77;
          }
          v59 = v74;
          break;
        }
      }
      bool v78 = true;
      v53 = v59;
    }
    case 0:
      {
      int v79 = 0;
      int v80 = 0;
      int v81;
      int v82;
      v81 = v79;
      v82 = v80;
      while (true) {
        int v83 = 4;
        int v84 = v82 * v83;
        int v85 = v84 + v41;
        int v86 = 24;
        int v87 = v86 + v85;
        int v88 = v40[v87];
        int v89 = 0;
        bool v90 = v88 != v89;
        v81 = v81;
        v82 = v82;
        if (!v90) break;
        int v91 = 44;
        int v92 = v91 + v41;
        int v93 = v40[v92];
        int v94;
        v94 = v41;
        switch (v93) {
          case 0:
            {
            int v95 = 4;
            v94 = v95;
            break;
          }
          default:
            {
            int v96 = 4;
            int v97 = v41 + v96;
            v94 = v97;
            break;
          }
        }
        bool v98 = true;
        int v99 = v81 + v94;
        int v100 = 1;
        int v101 = v82 + v100;
        v81 = v99;
        v82 = v101;
      }
      bool v102 = true;
      v53 = v81;
      break;
    }
  }
  bool v103 = true;
  int v104 = 16;
  int v105 = v104 + v41;
  bool v106 = true;
  int v107 = simt_wave_count_bits(v106);
  v39[v105] = v107;
  int v108 = 0;
  int v109 = 0;
  int v110;
  int v111;
  v110 = v108;
  v111 = v109;
  while (true) {
    int v112 = 4;
    int v113 = v111 * v112;
    int v114 = v113 + v41;
    int v115 = 48;
    int v116 = v115 + v114;
    int v117 = v40[v116];
    int v118 = 0;
    bool v119 = v117 != v118;
    v110 = v110;
    v111 = v111;
    if (!v119) break;
    int v120 = 68;
    int v121 = v120 + v41;
    int v122 = v40[v121];
    uint v123 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v124 = (int)(v123);
    int v125;
    v125 = v124;
    switch (v122) {
      default:
        {
        int v126 = 72;
        int v127 = v126 + v41;
        int v128 = v40[v127];
        int v129;
        v129 = v41;
        switch (v128) {
          case 0:
            {
            int v130 = 3;
            int v131 = v41 + v130;
            v129 = v131;
          }
          default:
            {
            int v132 = 3;
            int v133 = v41 + v132;
            v129 = v133;
            break;
          }
        }
        bool v134 = true;
        v125 = v129;
        break;
      }
      case 0:
        {
        int v135 = 76;
        int v136 = v135 + v41;
        int v137 = v40[v136];
        int v138 = 0;
        bool v139 = v137 != v138;
        int v140;
        if (v139) {
          int v141 = 0;
          v140 = v141;
        } else {
          int v142 = 4;
          int v143 = v41 + v142;
          v140 = v143;
        }
        v125 = v140;
        break;
      }
      case 1:
        {
        int v144 = 80;
        int v145 = v144 + v41;
        int v146 = v40[v145];
        int v147 = 0;
        bool v148 = v146 != v147;
        int v149;
        if (v148) {
          int v150 = 4;
          v149 = v150;
        } else {
          v149 = v41;
        }
        v125 = v149;
        break;
      }
      case 2:
        {
        int v151 = 84;
        int v152 = v151 + v41;
        int v153 = v40[v152];
        int v154 = 0;
        bool v155 = v153 != v154;
        int v156;
        if (v155) {
          int v157 = 2;
          int v158 = v41 + v157;
          v156 = v158;
        } else {
          v156 = v41;
        }
        v125 = v156;
        break;
      }
    }
    bool v159 = true;
    int v160 = v110 + v125;
    int v161 = 1;
    int v162 = v111 + v161;
    v110 = v160;
    v111 = v162;
  }
  bool v163 = true;
  int v164 = 32;
  int v165 = v164 + v41;
  bool v166 = true;
  int v167 = simt_wave_count_bits(v166);
  v39[v165] = v167;
  int v168 = 88;
  int v169 = v168 + v41;
  int v170 = v40[v169];
  int v171 = 1;
  int v172;
  v172 = v171;
  switch (v170) {
    default:
      {
      int v173 = 92;
      int v174 = v173 + v41;
      int v175 = v40[v174];
      int v176 = 3;
      int v177;
      v177 = v176;
      switch (v175) {
        case 0:
          {
          int v178 = 96;
          int v179 = v178 + v41;
          int v180 = v40[v179];
          int v181 = 0;
          bool v182 = v180 != v181;
          int v183;
          if (v182) {
            int v184 = 3;
            int v185 = v41 + v184;
            v183 = v185;
          } else {
            int v186 = 1;
            v183 = v186;
          }
          v177 = v183;
          break;
        }
        case 1:
          {
          int v187 = 4;
          v177 = v187;
          break;
        }
        default:
          {
          int v188 = 0;
          int v189 = 0;
          int v190;
          int v191;
          v190 = v188;
          v191 = v189;
          while (true) {
            int v192 = 4;
            int v193 = v191 * v192;
            int v194 = v193 + v41;
            int v195 = 100;
            int v196 = v195 + v194;
            int v197 = v40[v196];
            int v198 = 0;
            bool v199 = v197 != v198;
            v190 = v190;
            v191 = v191;
            if (!v199) break;
            int v200 = v190 + v191;
            int v201 = 1;
            int v202 = v191 + v201;
            v190 = v200;
            v191 = v202;
            break;
            ;
          }
          bool v203 = true;
          v177 = v190;
          break;
        }
        case 2:
          {
          int v204 = 0;
          int v205 = 0;
          int v206;
          int v207;
          v206 = v204;
          v207 = v205;
          while (true) {
            int v208 = 4;
            int v209 = v207 * v208;
            int v210 = v209 + v41;
            int v211 = 120;
            int v212 = v211 + v210;
            int v213 = v40[v212];
            int v214 = 0;
            bool v215 = v213 != v214;
            v206 = v206;
            v207 = v207;
            if (!v215) break;
            int v216 = v206 + v207;
            int v217 = 1;
            int v218 = v207 + v217;
            v206 = v216;
            v207 = v218;
            break;
            ;
          }
          bool v219 = true;
          v177 = v206;
          break;
        }
      }
      bool v220 = true;
      v172 = v177;
      break;
    }
    case 0:
      {
      int v221 = 0;
      int v222 = 0;
      int v223;
      int v224;
      v223 = v221;
      v224 = v222;
      while (true) {
        int v225 = 4;
        int v226 = v224 * v225;
        int v227 = v226 + v41;
        int v228 = 140;
        int v229 = v228 + v227;
        int v230 = v40[v229];
        int v231 = 0;
        bool v232 = v230 != v231;
        v223 = v223;
        v224 = v224;
        if (!v232) break;
        int v233 = v223 + v224;
        int v234 = 1;
        int v235 = v224 + v234;
        v223 = v233;
        v224 = v235;
        break;
        ;
      }
      bool v236 = true;
      v172 = v223;
      break;
    }
  }
  bool v237 = true;
  int v238 = 48;
  int v239 = v238 + v41;
  bool v240 = true;
  int v241 = simt_wave_count_bits(v240);
  v39[v239] = v241;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 160; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
