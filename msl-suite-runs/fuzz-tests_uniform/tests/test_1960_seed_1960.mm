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
    uint v13 = simt_subgroup_id(__simt_tid);
    int v14 = (int)(v13);
    int v15;
    v15 = v14;
    switch (v3) {
      case 0:
        {
        v15 = v0;
      }
      default:
        {
        int v16 = 4;
        int v17 = v0 + v16;
        v15 = v17;
        break;
      }
    }
    int v18 = 1;
    int v19 = v0 + v18;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v15;
    v7 = v21;
  }
  bool v22 = true;
  int v23 = simt_wave_count_bits(v22);
  int v24 = 0;
  int v25 = v24 + v0;
  v1[v25] = v23;
  int v26 = 3;
  int v27 = v3 % v26;
  uint v28 = simt_subgroup_id(__simt_tid);
  int v29 = (int)(v28);
  int v30;
  v30 = v29;
  switch (v27) {
    case 0:
      {
      int v31 = 3;
      int v32 = v3 % v31;
      int v33 = 3;
      int v34;
      v34 = v33;
      switch (v32) {
        case 0:
          {
          int v35 = 0;
          int v36 = 0;
          int v37;
          int v38;
          v37 = v35;
          v38 = v36;
          while (true) {
            int v39 = 4;
            int v40 = v3 % v39;
            int v41 = 1;
            int v42 = v40 + v41;
            bool v43 = v38 < v42;
            v37 = v37;
            v38 = v38;
            if (!v43) break;
            int v44 = 1;
            int v45 = v38 + v44;
            v37 = v0;
            v38 = v45;
          }
          int v46 = 0;
          v34 = v37;
          break;
        }
        case 1:
          {
          v34 = v0;
          break;
        }
        case 2:
          {
          int v47 = 4;
          int v48 = v3 % v47;
          int v49;
          v49 = v0;
          switch (v48) {
            case 0:
              {
              int v50 = 3;
              v49 = v50;
              break;
            }
            case 1:
              {
              v49 = v0;
              break;
            }
            default:
              {
              int v51 = 0;
              int v52 = v0 + v51;
              v49 = v52;
              break;
            }
            case 2:
              {
              int v53 = 1;
              v49 = v53;
              break;
            }
          }
          v34 = v49;
          break;
        }
        default:
          {
          int v54 = 4;
          int v55 = v3 % v54;
          int v56;
          v56 = v0;
          switch (v55) {
            case 0:
              {
              v56 = v0;
            }
            case 1:
              {
              int v57 = 1;
              int v58 = v0 + v57;
              v56 = v58;
            }
            default:
              {
              v56 = v0;
              break;
            }
            case 2:
              {
              v56 = v0;
              break;
            }
          }
          int v59 = 1;
          v34 = v56;
          break;
        }
      }
      int v60 = 2;
      int v61 = v0 + v60;
      v30 = v34;
    }
    case 1:
      {
      int v62 = 0;
      int v63 = 0;
      int v64;
      int v65;
      v64 = v62;
      v65 = v63;
      while (true) {
        int v66 = 4;
        int v67 = v3 % v66;
        int v68 = 1;
        int v69 = v67 + v68;
        bool v70 = v65 < v69;
        v64 = v64;
        v65 = v65;
        if (!v70) break;
        int v71 = 0;
        int v72 = 0;
        int v73;
        int v74;
        v73 = v71;
        v74 = v72;
        while (true) {
          int v75 = 4;
          int v76 = v3 % v75;
          int v77 = 1;
          int v78 = v76 + v77;
          bool v79 = v74 < v78;
          v73 = v73;
          v74 = v74;
          if (!v79) break;
          int v80 = 1;
          int v81 = v0 + v80;
          int v82 = 1;
          int v83 = v74 + v82;
          v73 = v81;
          v74 = v83;
        }
        int v84 = 1;
        int v85 = v65 + v84;
        v64 = v73;
        v65 = v85;
      }
      int v86 = 1;
      int v87 = v0 + v86;
      v30 = v64;
      break;
    }
    default:
      {
      int v88 = 0;
      bool v89 = v2 != v88;
      int v90;
      if (v89) {
        int v91 = 2;
        int v92 = v0 + v91;
        v90 = v92;
      } else {
        int v93 = 2;
        int v94 = v3 % v93;
        int v95;
        v95 = v0;
        switch (v94) {
          case 0:
            {
            int v96 = 4;
            int v97 = v0 + v96;
            v95 = v97;
            break;
          }
          default:
            {
            int v98 = 1;
            int v99 = v0 + v98;
            v95 = v99;
            break;
          }
        }
        v90 = v95;
      }
      int v100 = 0;
      int v101 = v0 + v100;
      v30 = v90;
      break;
    }
  }
  bool v102 = true;
  int v103 = simt_wave_count_bits(v102);
  int v104 = 16;
  int v105 = v104 + v0;
  v1[v105] = v103;
  int v106 = 0;
  bool v107 = v2 != v106;
  int v108 = v107 ? v6 : v30;
  return;
}

kernel void kernel_main(device int* v109 [[buffer(0)]], device int* v110 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v111 = static_cast<int>(__simt_tid3.x);
  int v112 = 0;
  int v113 = v112 + v111;
  int v114 = v110[v113];
  int v115 = 4;
  int v116 = v115 + v111;
  int v117 = v110[v116];
  helper0(v111, v109, v114, v117, static_cast<int>(__simt_tid3.x));
  int v118 = 1;
  int v119 = 2;
  int v120 = v111 + v119;
  int v121 = 0;
  int v122 = 0;
  int v123;
  int v124;
  v123 = v121;
  v124 = v122;
  while (true) {
    int v125 = 4;
    int v126 = v124 * v125;
    int v127 = v126 + v111;
    int v128 = 8;
    int v129 = v128 + v127;
    int v130 = v110[v129];
    int v131 = 0;
    bool v132 = v130 != v131;
    v123 = v123;
    v124 = v124;
    if (!v132) break;
    int v133 = v123 + v124;
    int v134 = 1;
    int v135 = v124 + v134;
    v123 = v133;
    v124 = v135;
  }
  bool v136 = true;
  int v137 = 32;
  int v138 = v137 + v111;
  bool v139 = true;
  int v140 = simt_wave_count_bits(v139);
  v109[v138] = v140;
  int v141 = 28;
  int v142 = v141 + v111;
  int v143 = v110[v142];
  int v144;
  v144 = v111;
  switch (v143) {
    case 0:
      {
      int v145 = 32;
      int v146 = v145 + v111;
      int v147 = v110[v146];
      int v148 = 2;
      int v149 = v111 + v148;
      int v150;
      v150 = v149;
      switch (v147) {
        case 0:
          {
          int v151 = 0;
          int v152 = 0;
          int v153;
          int v154;
          v153 = v151;
          v154 = v152;
          while (true) {
            int v155 = 4;
            int v156 = v154 * v155;
            int v157 = v156 + v111;
            int v158 = 36;
            int v159 = v158 + v157;
            int v160 = v110[v159];
            int v161 = 0;
            bool v162 = v160 != v161;
            v153 = v153;
            v154 = v154;
            if (!v162) break;
            int v163 = v153 + v154;
            int v164 = 1;
            int v165 = v154 + v164;
            v153 = v163;
            v154 = v165;
          }
          bool v166 = true;
          v150 = v153;
          break;
        }
        case 1:
          {
          int v167 = 0;
          int v168 = 0;
          int v169;
          int v170;
          v169 = v167;
          v170 = v168;
          while (true) {
            int v171 = 4;
            int v172 = v170 * v171;
            int v173 = v172 + v111;
            int v174 = 56;
            int v175 = v174 + v173;
            int v176 = v110[v175];
            int v177 = 0;
            bool v178 = v176 != v177;
            v169 = v169;
            v170 = v170;
            if (!v178) break;
            int v179 = v169 + v170;
            int v180 = 1;
            int v181 = v170 + v180;
            v169 = v179;
            v170 = v181;
          }
          bool v182 = true;
          v150 = v169;
        }
        default:
          {
          int v183 = 0;
          int v184 = 0;
          int v185;
          int v186;
          v185 = v183;
          v186 = v184;
          while (true) {
            int v187 = 4;
            int v188 = v186 * v187;
            int v189 = v188 + v111;
            int v190 = 76;
            int v191 = v190 + v189;
            int v192 = v110[v191];
            int v193 = 0;
            bool v194 = v192 != v193;
            v185 = v185;
            v186 = v186;
            if (!v194) break;
            int v195 = v185 + v186;
            int v196 = 1;
            int v197 = v186 + v196;
            v185 = v195;
            v186 = v197;
          }
          bool v198 = true;
          v150 = v185;
          break;
        }
      }
      bool v199 = true;
      v144 = v150;
      break;
    }
    default:
      {
      int v200 = 96;
      int v201 = v200 + v111;
      int v202 = v110[v201];
      int v203 = 1;
      int v204;
      v204 = v203;
      switch (v202) {
        case 0:
          {
          int v205 = 100;
          int v206 = v205 + v111;
          int v207 = v110[v206];
          int v208 = 1;
          int v209 = v111 + v208;
          int v210;
          v210 = v209;
          switch (v207) {
            default:
              {
              int v211 = 3;
              int v212 = v111 + v211;
              v210 = v212;
            }
            case 0:
              {
              int v213 = 2;
              int v214 = v111 + v213;
              v210 = v214;
              break;
            }
          }
          bool v215 = true;
          v204 = v210;
          break;
        }
        case 1:
          {
          int v216 = 104;
          int v217 = v216 + v111;
          int v218 = v110[v217];
          int v219 = 0;
          bool v220 = v218 != v219;
          int v221;
          if (v220) {
            v221 = v111;
          } else {
            int v222 = 2;
            v221 = v222;
          }
          v204 = v221;
          break;
        }
        default:
          {
          int v223 = 0;
          int v224 = 0;
          int v225;
          int v226;
          v225 = v223;
          v226 = v224;
          while (true) {
            int v227 = 4;
            int v228 = v226 * v227;
            int v229 = v228 + v111;
            int v230 = 108;
            int v231 = v230 + v229;
            int v232 = v110[v231];
            int v233 = 0;
            bool v234 = v232 != v233;
            v225 = v225;
            v226 = v226;
            if (!v234) break;
            int v235 = v225 + v226;
            int v236 = 1;
            int v237 = v226 + v236;
            v225 = v235;
            v226 = v237;
          }
          bool v238 = true;
          v204 = v225;
          break;
        }
      }
      bool v239 = true;
      v144 = v204;
      break;
    }
  }
  bool v240 = true;
  int v241 = 48;
  int v242 = v241 + v111;
  bool v243 = true;
  int v244 = simt_wave_count_bits(v243);
  v109[v242] = v244;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
