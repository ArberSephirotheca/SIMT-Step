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
  int v5;
  v5 = v4;
  switch (v3) {
    case 0:
      {
      int v6 = 0;
      bool v7 = v2 != v6;
      int v8;
      if (v7) {
        int v9 = 1;
        int v10;
        v10 = v9;
        switch (v3) {
          default:
            {
            int v11 = 1;
            int v12 = v0 + v11;
            v10 = v12;
          }
          case 0:
            {
            int v13 = 2;
            v10 = v13;
            break;
          }
        }
        v8 = v10;
      } else {
        int v14 = 0;
        bool v15 = v2 != v14;
        int v16;
        if (v15) {
          int v17 = 0;
          int v18 = v0 + v17;
          v16 = v18;
        } else {
          int v19 = 4;
          v16 = v19;
        }
        v8 = v16;
      }
      v5 = v8;
      break;
    }
    default:
      {
      int v20 = 0;
      bool v21 = v2 != v20;
      int v22;
      if (v21) {
        int v23 = 0;
        int v24 = 0;
        int v25;
        int v26;
        v25 = v23;
        v26 = v24;
        while (true) {
          int v27 = 4;
          int v28 = v3 % v27;
          int v29 = 1;
          int v30 = v28 + v29;
          bool v31 = v26 < v30;
          v25 = v25;
          v26 = v26;
          if (!v31) break;
          int v32 = 0;
          int v33 = 1;
          int v34 = v26 + v33;
          v25 = v32;
          v26 = v34;
        }
        v22 = v25;
      } else {
        int v35 = 3;
        int v36 = v3 % v35;
        int v37 = 4;
        int v38;
        v38 = v37;
        switch (v36) {
          default:
            {
            int v39 = 0;
            int v40 = v0 + v39;
            v38 = v40;
          }
          case 0:
            {
            int v41 = 2;
            int v42 = v0 + v41;
            v38 = v42;
            break;
          }
          case 1:
            {
            v38 = v0;
            break;
          }
          case 2:
            {
            v38 = v0;
            break;
          }
        }
        v22 = v38;
      }
      v5 = v22;
      break;
    }
  }
  bool v43 = true;
  int v44 = simt_wave_count_bits(v43);
  int v45 = 0;
  int v46 = v45 + v0;
  v1[v46] = v44;
  return;
}

kernel void kernel_main(device int* v47 [[buffer(0)]], device int* v48 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v49 = static_cast<int>(__simt_tid3.x);
  int v50 = 0;
  int v51 = v50 + v49;
  int v52 = v48[v51];
  int v53 = 4;
  int v54 = v53 + v49;
  int v55 = v48[v54];
  helper0(v49, v47, v52, v55, static_cast<int>(__simt_tid3.x));
  uint v56 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v57 = (int)(v56);
  int v58 = 0;
  int v59 = 0;
  int v60;
  int v61;
  v60 = v58;
  v61 = v59;
  while (true) {
    int v62 = 4;
    int v63 = v61 * v62;
    int v64 = v63 + v49;
    int v65 = 8;
    int v66 = v65 + v64;
    int v67 = v48[v66];
    int v68 = 0;
    bool v69 = v67 != v68;
    v60 = v60;
    v61 = v61;
    if (!v69) break;
    int v70 = 0;
    int v71 = 0;
    int v72;
    int v73;
    v72 = v70;
    v73 = v71;
    while (true) {
      int v74 = 4;
      int v75 = v73 * v74;
      int v76 = v75 + v49;
      int v77 = 28;
      int v78 = v77 + v76;
      int v79 = v48[v78];
      int v80 = 0;
      bool v81 = v79 != v80;
      v72 = v72;
      v73 = v73;
      if (!v81) break;
      int v82 = 0;
      int v83 = 0;
      int v84;
      int v85;
      v84 = v82;
      v85 = v83;
      while (true) {
        int v86 = 4;
        int v87 = v85 * v86;
        int v88 = v87 + v49;
        int v89 = 48;
        int v90 = v89 + v88;
        int v91 = v48[v90];
        int v92 = 0;
        bool v93 = v91 != v92;
        v84 = v84;
        v85 = v85;
        if (!v93) break;
        int v94 = v84 + v85;
        int v95 = 1;
        int v96 = v85 + v95;
        bool v97 = true;
        int v98 = 16;
        int v99 = 4;
        int v100 = v85 * v99;
        int v101 = v98 + v100;
        int v102 = v101 + v49;
        bool v103 = true;
        int v104 = simt_wave_count_bits(v103);
        v47[v102] = v104;
        v84 = v94;
        v85 = v96;
      }
      int v105 = v72 + v84;
      int v106 = 1;
      int v107 = v73 + v106;
      bool v108 = true;
      int v109 = 32;
      int v110 = 4;
      int v111 = v73 * v110;
      int v112 = v109 + v111;
      int v113 = v112 + v49;
      bool v114 = true;
      int v115 = simt_wave_count_bits(v114);
      v47[v113] = v115;
      v72 = v105;
      v73 = v107;
      break;
      ;
    }
    int v116 = v60 + v72;
    int v117 = 1;
    int v118 = v61 + v117;
    bool v119 = true;
    int v120 = 48;
    int v121 = 4;
    int v122 = v61 * v121;
    int v123 = v120 + v122;
    int v124 = v123 + v49;
    bool v125 = true;
    int v126 = simt_wave_count_bits(v125);
    v47[v124] = v126;
    v60 = v116;
    v61 = v118;
  }
  int v127 = 68;
  int v128 = v127 + v49;
  int v129 = v48[v128];
  int v130 = 2;
  int v131;
  v131 = v130;
  switch (v129) {
    case 0:
      {
      int v132 = 0;
      int v133 = 0;
      int v134;
      int v135;
      v134 = v132;
      v135 = v133;
      while (true) {
        int v136 = 4;
        int v137 = v135 * v136;
        int v138 = v137 + v49;
        int v139 = 72;
        int v140 = v139 + v138;
        int v141 = v48[v140];
        int v142 = 0;
        bool v143 = v141 != v142;
        v134 = v134;
        v135 = v135;
        if (!v143) break;
        int v144 = v134 + v135;
        int v145 = 1;
        int v146 = v135 + v145;
        bool v147 = true;
        v134 = v144;
        v135 = v146;
      }
      v131 = v134;
      break;
    }
    default:
      {
      int v148 = 92;
      int v149 = v148 + v49;
      int v150 = v48[v149];
      int v151 = 4;
      int v152 = v49 + v151;
      int v153;
      v153 = v152;
      switch (v150) {
        case 0:
          {
          int v154 = 0;
          int v155 = 0;
          int v156;
          int v157;
          v156 = v154;
          v157 = v155;
          while (true) {
            int v158 = 4;
            int v159 = v157 * v158;
            int v160 = v159 + v49;
            int v161 = 96;
            int v162 = v161 + v160;
            int v163 = v48[v162];
            int v164 = 0;
            bool v165 = v163 != v164;
            v156 = v156;
            v157 = v157;
            if (!v165) break;
            int v166 = v156 + v157;
            int v167 = 1;
            int v168 = v157 + v167;
            bool v169 = true;
            v156 = v166;
            v157 = v168;
          }
          v153 = v156;
          break;
        }
        default:
          {
          int v170 = 116;
          int v171 = v170 + v49;
          int v172 = v48[v171];
          int v173 = 0;
          int v174 = v49 + v173;
          int v175;
          v175 = v174;
          switch (v172) {
            default:
              {
              int v176 = 2;
              int v177 = v49 + v176;
              v175 = v177;
            }
            case 0:
              {
              int v178 = 0;
              int v179 = v49 + v178;
              v175 = v179;
              break;
            }
          }
          v153 = v175;
          break;
        }
        case 1:
          {
          int v180 = 120;
          int v181 = v180 + v49;
          int v182 = v48[v181];
          int v183 = 0;
          bool v184 = v182 != v183;
          int v185;
          if (v184) {
            int v186 = 4;
            v185 = v186;
          } else {
            int v187 = 4;
            v185 = v187;
          }
          v153 = v185;
          break;
        }
        case 2:
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
            int v194 = v193 + v49;
            int v195 = 124;
            int v196 = v195 + v194;
            int v197 = v48[v196];
            int v198 = 0;
            bool v199 = v197 != v198;
            v190 = v190;
            v191 = v191;
            if (!v199) break;
            int v200 = v190 + v191;
            int v201 = 1;
            int v202 = v191 + v201;
            bool v203 = true;
            v190 = v200;
            v191 = v202;
          }
          v153 = v190;
          break;
        }
      }
      v131 = v153;
      break;
    }
    case 1:
      {
      int v204 = 144;
      int v205 = v204 + v49;
      int v206 = v48[v205];
      int v207 = 0;
      bool v208 = v206 != v207;
      int v209;
      if (v208) {
        int v210 = 148;
        int v211 = v210 + v49;
        int v212 = v48[v211];
        int v213;
        v213 = v49;
        switch (v212) {
          case 0:
            {
            v213 = v49;
            break;
          }
          case 1:
            {
            int v214 = 0;
            v213 = v214;
            break;
          }
          default:
            {
            int v215 = 2;
            v213 = v215;
            break;
          }
        }
        v209 = v213;
      } else {
        int v216 = 152;
        int v217 = v216 + v49;
        int v218 = v48[v217];
        int v219 = 0;
        bool v220 = v218 != v219;
        int v221;
        if (v220) {
          v221 = v49;
        } else {
          int v222 = 3;
          v221 = v222;
        }
        v209 = v221;
      }
      v131 = v209;
      break;
    }
    case 2:
      {
      int v223 = 156;
      int v224 = v223 + v49;
      int v225 = v48[v224];
      int v226 = 3;
      int v227;
      v227 = v226;
      switch (v225) {
        default:
          {
          v227 = v49;
          break;
        }
        case 0:
          {
          int v228 = 160;
          int v229 = v228 + v49;
          int v230 = v48[v229];
          int v231 = 0;
          bool v232 = v230 != v231;
          int v233;
          if (v232) {
            v233 = v49;
          } else {
            int v234 = 1;
            v233 = v234;
          }
          v227 = v233;
          break;
        }
      }
      v131 = v227;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 59; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 164; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
