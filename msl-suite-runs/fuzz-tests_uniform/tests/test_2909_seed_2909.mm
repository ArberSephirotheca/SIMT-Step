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
    v6 = v0;
  } else {
    int v7 = 0;
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      int v16 = 3;
      int v17 = 1;
      int v18 = v10 + v17;
      v9 = v16;
      v10 = v18;
    }
    int v19 = 1;
    int v20 = v0 + v19;
    v6 = v9;
  }
  bool v21 = true;
  int v22 = simt_wave_count_bits(v21);
  int v23 = 0;
  int v24 = v23 + v0;
  v1[v24] = v22;
  int v25 = 0;
  bool v26 = v2 != v25;
  int v27;
  if (v26) {
    v27 = v0;
  } else {
    int v28 = 1;
    v27 = v28;
  }
  bool v29 = true;
  int v30 = simt_wave_count_bits(v29);
  int v31 = 16;
  int v32 = v31 + v0;
  v1[v32] = v30;
  int v33 = 0;
  bool v34 = v2 != v33;
  int v35 = v34 ? v6 : v27;
  return;
}

kernel void kernel_main(device int* v36 [[buffer(0)]], device int* v37 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v38 = static_cast<int>(__simt_tid3.x);
  int v39 = 0;
  int v40 = v39 + v38;
  int v41 = v37[v40];
  int v42 = 4;
  int v43 = v42 + v38;
  int v44 = v37[v43];
  helper0(v38, v36, v41, v44, static_cast<int>(__simt_tid3.x));
  int v45 = 8;
  int v46 = v45 + v38;
  int v47 = v37[v46];
  uint v48 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v49 = (int)(v48);
  int v50;
  v50 = v49;
  switch (v47) {
    default:
      {
      int v51 = 12;
      int v52 = v51 + v38;
      int v53 = v37[v52];
      int v54 = 0;
      bool v55 = v53 != v54;
      int v56;
      if (v55) {
        v56 = v38;
      } else {
        int v57 = 0;
        int v58 = 0;
        int v59;
        int v60;
        v59 = v57;
        v60 = v58;
        while (true) {
          int v61 = 4;
          int v62 = v60 * v61;
          int v63 = v62 + v38;
          int v64 = 16;
          int v65 = v64 + v63;
          int v66 = v37[v65];
          int v67 = 0;
          bool v68 = v66 != v67;
          v59 = v59;
          v60 = v60;
          if (!v68) break;
          int v69 = v59 + v60;
          int v70 = 1;
          int v71 = v60 + v70;
          v59 = v69;
          v60 = v71;
        }
        bool v72 = true;
        v56 = v59;
      }
      v50 = v56;
      break;
    }
    case 0:
      {
      int v73 = 36;
      int v74 = v73 + v38;
      int v75 = v37[v74];
      int v76 = 3;
      int v77 = v38 + v76;
      int v78;
      v78 = v77;
      switch (v75) {
        case 0:
          {
          int v79 = 4;
          int v80 = v38 + v79;
          v78 = v80;
          break;
        }
        case 1:
          {
          int v81 = 40;
          int v82 = v81 + v38;
          int v83 = v37[v82];
          int v84;
          v84 = v38;
          switch (v83) {
            case 0:
              {
              int v85 = 1;
              int v86 = v38 + v85;
              v84 = v86;
              break;
            }
            default:
              {
              v84 = v38;
              break;
            }
            case 1:
              {
              int v87 = 4;
              int v88 = v38 + v87;
              v84 = v88;
              break;
            }
            case 2:
              {
              v84 = v38;
              break;
            }
          }
          bool v89 = true;
          v78 = v84;
          break;
        }
        default:
          {
          v78 = v38;
          break;
        }
      }
      bool v90 = true;
      v50 = v78;
      break;
    }
    case 1:
      {
      int v91 = 44;
      int v92 = v91 + v38;
      int v93 = v37[v92];
      int v94 = 0;
      bool v95 = v93 != v94;
      int v96;
      if (v95) {
        int v97 = 0;
        int v98 = 0;
        int v99;
        int v100;
        v99 = v97;
        v100 = v98;
        while (true) {
          int v101 = 4;
          int v102 = v100 * v101;
          int v103 = v102 + v38;
          int v104 = 48;
          int v105 = v104 + v103;
          int v106 = v37[v105];
          int v107 = 0;
          bool v108 = v106 != v107;
          v99 = v99;
          v100 = v100;
          if (!v108) break;
          int v109 = v99 + v100;
          int v110 = 1;
          int v111 = v100 + v110;
          v99 = v109;
          v100 = v111;
          continue;
          ;
        }
        bool v112 = true;
        v96 = v99;
      } else {
        int v113 = 68;
        int v114 = v113 + v38;
        int v115 = v37[v114];
        int v116 = 0;
        bool v117 = v115 != v116;
        int v118;
        if (v117) {
          v118 = v38;
        } else {
          int v119 = 3;
          int v120 = v38 + v119;
          v118 = v120;
        }
        v96 = v118;
      }
      v50 = v96;
      break;
    }
    case 2:
      {
      int v121 = 72;
      int v122 = v121 + v38;
      int v123 = v37[v122];
      int v124 = 0;
      bool v125 = v123 != v124;
      int v126;
      if (v125) {
        int v127 = 76;
        int v128 = v127 + v38;
        int v129 = v37[v128];
        int v130 = 4;
        int v131 = v38 + v130;
        int v132;
        v132 = v131;
        switch (v129) {
          case 0:
            {
            int v133 = 3;
            int v134 = v38 + v133;
            v132 = v134;
            break;
          }
          default:
            {
            int v135 = 1;
            v132 = v135;
            break;
          }
        }
        bool v136 = true;
        v126 = v132;
      } else {
        int v137 = 80;
        int v138 = v137 + v38;
        int v139 = v37[v138];
        int v140 = 0;
        bool v141 = v139 != v140;
        int v142;
        if (v141) {
          v142 = v38;
        } else {
          int v143 = 4;
          int v144 = v38 + v143;
          v142 = v144;
        }
        v126 = v142;
      }
      v50 = v126;
      break;
    }
  }
  bool v145 = true;
  int v146 = 32;
  int v147 = v146 + v38;
  bool v148 = true;
  int v149 = simt_wave_count_bits(v148);
  v36[v147] = v149;
  int v150 = 84;
  int v151 = v150 + v38;
  int v152 = v37[v151];
  uint v153 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v154 = (int)(v153);
  int v155;
  v155 = v154;
  switch (v152) {
    case 0:
      {
      int v156 = 0;
      int v157 = 0;
      int v158;
      int v159;
      v158 = v156;
      v159 = v157;
      while (true) {
        int v160 = 4;
        int v161 = v159 * v160;
        int v162 = v161 + v38;
        int v163 = 88;
        int v164 = v163 + v162;
        int v165 = v37[v164];
        int v166 = 0;
        bool v167 = v165 != v166;
        v158 = v158;
        v159 = v159;
        if (!v167) break;
        int v168 = 1;
        int v169 = v38 + v168;
        int v170 = v158 + v169;
        int v171 = 1;
        int v172 = v159 + v171;
        v158 = v170;
        v159 = v172;
        continue;
        ;
      }
      bool v173 = true;
      v155 = v158;
      break;
    }
    case 1:
      {
      int v174 = 0;
      int v175 = 0;
      int v176;
      int v177;
      v176 = v174;
      v177 = v175;
      while (true) {
        int v178 = 4;
        int v179 = v177 * v178;
        int v180 = v179 + v38;
        int v181 = 108;
        int v182 = v181 + v180;
        int v183 = v37[v182];
        int v184 = 0;
        bool v185 = v183 != v184;
        v176 = v176;
        v177 = v177;
        if (!v185) break;
        int v186 = v176 + v177;
        int v187 = 1;
        int v188 = v177 + v187;
        v176 = v186;
        v177 = v188;
      }
      bool v189 = true;
      v155 = v176;
      break;
    }
    default:
      {
      int v190 = 128;
      int v191 = v190 + v38;
      int v192 = v37[v191];
      int v193 = 4;
      int v194 = v38 + v193;
      int v195;
      v195 = v194;
      switch (v192) {
        case 0:
          {
          int v196 = 132;
          int v197 = v196 + v38;
          int v198 = v37[v197];
          int v199 = 0;
          bool v200 = v198 != v199;
          int v201;
          if (v200) {
            int v202 = 0;
            int v203 = v38 + v202;
            v201 = v203;
          } else {
            v201 = v38;
          }
          v195 = v201;
          break;
        }
        case 1:
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
            int v210 = v209 + v38;
            int v211 = 136;
            int v212 = v211 + v210;
            int v213 = v37[v212];
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
          }
          bool v219 = true;
          v195 = v206;
          break;
        }
        default:
          {
          int v220 = 156;
          int v221 = v220 + v38;
          int v222 = v37[v221];
          int v223 = 0;
          bool v224 = v222 != v223;
          int v225;
          if (v224) {
            int v226 = 0;
            v225 = v226;
          } else {
            v225 = v38;
          }
          v195 = v225;
          break;
        }
      }
      bool v227 = true;
      v155 = v195;
    }
    case 2:
      {
      int v228 = 1;
      int v229 = v38 + v228;
      v155 = v229;
      break;
    }
  }
  bool v230 = true;
  int v231 = 48;
  int v232 = v231 + v38;
  bool v233 = true;
  int v234 = simt_wave_count_bits(v233);
  v36[v232] = v234;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
