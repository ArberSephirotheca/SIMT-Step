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
  int v4 = 3;
  int v5 = v3 % v4;
  int v6 = 3;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 3;
      int v12;
      v12 = v11;
      switch (v10) {
        default:
          {
          int v13 = 0;
          bool v14 = v2 != v13;
          int v15;
          if (v14) {
            int v16 = 1;
            int v17 = v0 + v16;
            v15 = v17;
          } else {
            v15 = v0;
          }
          int v18 = 3;
          int v19 = v0 + v18;
          v12 = v15;
        }
        case 0:
          {
          int v20 = 4;
          int v21 = v3 % v20;
          int v22 = 3;
          int v23;
          v23 = v22;
          switch (v21) {
            case 0:
              {
              int v24 = 4;
              int v25 = v0 + v24;
              v23 = v25;
              break;
            }
            case 1:
              {
              v23 = v0;
              break;
            }
            case 2:
              {
              int v26 = 4;
              int v27 = v0 + v26;
              v23 = v27;
              break;
            }
            default:
              {
              v23 = v0;
              break;
            }
          }
          v12 = v23;
        }
        case 1:
          {
          int v28 = 0;
          v12 = v28;
        }
        case 2:
          {
          int v29 = 2;
          int v30 = v3 % v29;
          int v31;
          v31 = v0;
          switch (v30) {
            case 0:
              {
              v31 = v0;
              break;
            }
            default:
              {
              int v32 = 4;
              int v33 = v0 + v32;
              v31 = v33;
              break;
            }
            case 1:
              {
              int v34 = 4;
              v31 = v34;
              break;
            }
          }
          int v35 = 0;
          v12 = v31;
          break;
        }
      }
      int v36 = 0;
      v8 = v12;
      break;
    }
    case 0:
      {
      int v37 = 0;
      bool v38 = v2 != v37;
      int v39;
      if (v38) {
        int v40 = 2;
        int v41 = v0 + v40;
        v39 = v41;
      } else {
        int v42 = 0;
        bool v43 = v2 != v42;
        int v44;
        if (v43) {
          v44 = v0;
        } else {
          v44 = v0;
        }
        int v45 = 3;
        int v46 = v0 + v45;
        v39 = v44;
      }
      int v47 = 2;
      v8 = v39;
      break;
    }
    case 1:
      {
      int v48 = 2;
      int v49 = v3 % v48;
      int v50 = 4;
      int v51 = v0 + v50;
      int v52;
      v52 = v51;
      switch (v49) {
        default:
          {
          int v53 = 2;
          int v54 = v3 % v53;
          int v55 = 0;
          int v56 = v0 + v55;
          int v57;
          v57 = v56;
          switch (v54) {
            case 0:
              {
              v57 = v0;
            }
            default:
              {
              int v58 = 2;
              v57 = v58;
              break;
            }
          }
          int v59 = 2;
          int v60 = v0 + v59;
          v52 = v57;
          break;
        }
        case 0:
          {
          int v61 = 2;
          int v62 = v3 % v61;
          int v63 = 3;
          int v64 = v0 + v63;
          int v65;
          v65 = v64;
          switch (v62) {
            default:
              {
              v65 = v0;
              break;
            }
            case 0:
              {
              int v66 = 3;
              int v67 = v0 + v66;
              v65 = v67;
              break;
            }
          }
          int v68 = 0;
          v52 = v65;
          break;
        }
        case 1:
          {
          int v69 = 0;
          int v70 = 0;
          int v71;
          int v72;
          v71 = v69;
          v72 = v70;
          while (true) {
            int v73 = 4;
            int v74 = v3 % v73;
            int v75 = 1;
            int v76 = v74 + v75;
            bool v77 = v72 < v76;
            v71 = v71;
            v72 = v72;
            if (!v77) break;
            int v78 = 1;
            int v79 = v72 + v78;
            v71 = v0;
            v72 = v79;
          }
          int v80 = 1;
          int v81 = v0 + v80;
          v52 = v71;
          break;
        }
      }
      int v82 = 0;
      v8 = v52;
      break;
    }
  }
  bool v83 = true;
  int v84 = simt_wave_count_bits(v83);
  int v85 = 0;
  int v86 = v85 + v0;
  v1[v86] = v84;
  return;
}

kernel void kernel_main(device int* v87 [[buffer(0)]], device int* v88 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v89 = static_cast<int>(__simt_tid3.x);
  int v90 = 0;
  int v91 = v90 + v89;
  int v92 = v88[v91];
  int v93 = 4;
  int v94 = v93 + v89;
  int v95 = v88[v94];
  helper0(v89, v87, v92, v95, static_cast<int>(__simt_tid3.x));
  int v96 = 0;
  int v97 = 0;
  int v98;
  int v99;
  v98 = v96;
  v99 = v97;
  while (true) {
    int v100 = 4;
    int v101 = v99 * v100;
    int v102 = v101 + v89;
    int v103 = 8;
    int v104 = v103 + v102;
    int v105 = v88[v104];
    int v106 = 0;
    bool v107 = v105 != v106;
    v98 = v98;
    v99 = v99;
    if (!v107) break;
    int v108 = 28;
    int v109 = v108 + v89;
    int v110 = v88[v109];
    int v111 = 0;
    bool v112 = v110 != v111;
    int v113;
    if (v112) {
      int v114 = 32;
      int v115 = v114 + v89;
      int v116 = v88[v115];
      int v117;
      v117 = v89;
      switch (v116) {
        case 0:
          {
          int v118 = 1;
          int v119 = v89 + v118;
          v117 = v119;
          break;
        }
        case 1:
          {
          int v120 = 2;
          v117 = v120;
          break;
        }
        case 2:
          {
          int v121 = 1;
          int v122 = v89 + v121;
          v117 = v122;
          break;
        }
        default:
          {
          int v123 = 2;
          v117 = v123;
          break;
        }
      }
      bool v124 = true;
      v113 = v117;
    } else {
      int v125 = 36;
      int v126 = v125 + v89;
      int v127 = v88[v126];
      int v128 = 0;
      bool v129 = v127 != v128;
      int v130;
      if (v129) {
        uint v131 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v132 = (int)(v131);
        v130 = v132;
      } else {
        uint v133 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v134 = (int)(v133);
        v130 = v134;
      }
      v113 = v130;
    }
    int v135 = v98 + v113;
    int v136 = 1;
    int v137 = v99 + v136;
    v98 = v135;
    v99 = v137;
  }
  bool v138 = true;
  int v139 = 16;
  int v140 = v139 + v89;
  bool v141 = true;
  int v142 = simt_wave_count_bits(v141);
  v87[v140] = v142;
  int v143 = 40;
  int v144 = v143 + v89;
  int v145 = v88[v144];
  int v146;
  v146 = v89;
  switch (v145) {
    case 0:
      {
      int v147 = 44;
      int v148 = v147 + v89;
      int v149 = v88[v148];
      int v150 = 0;
      int v151 = v89 + v150;
      int v152;
      v152 = v151;
      switch (v149) {
        case 0:
          {
          v152 = v89;
          break;
        }
        case 1:
          {
          int v153 = 4;
          int v154 = v89 + v153;
          v152 = v154;
          break;
        }
        default:
          {
          int v155 = 48;
          int v156 = v155 + v89;
          int v157 = v88[v156];
          int v158 = 3;
          int v159;
          v159 = v158;
          switch (v157) {
            case 0:
              {
              int v160 = 4;
              int v161 = v89 + v160;
              v159 = v161;
            }
            case 1:
              {
              int v162 = 1;
              v159 = v162;
              break;
            }
            default:
              {
              int v163 = 0;
              int v164 = v89 + v163;
              v159 = v164;
              break;
            }
          }
          bool v165 = true;
          v152 = v159;
          break;
        }
        case 2:
          {
          int v166 = 52;
          int v167 = v166 + v89;
          int v168 = v88[v167];
          int v169;
          v169 = v89;
          switch (v168) {
            case 0:
              {
              int v170 = 0;
              v169 = v170;
              break;
            }
            case 1:
              {
              int v171 = 2;
              v169 = v171;
              break;
            }
            default:
              {
              int v172 = 4;
              v169 = v172;
              break;
            }
          }
          bool v173 = true;
          v152 = v169;
          break;
        }
      }
      bool v174 = true;
      v146 = v152;
      break;
    }
    case 1:
      {
      int v175 = 0;
      v146 = v175;
      break;
    }
    case 2:
      {
      int v176 = 56;
      int v177 = v176 + v89;
      int v178 = v88[v177];
      int v179 = 0;
      int v180;
      v180 = v179;
      switch (v178) {
        default:
          {
          int v181 = 0;
          int v182 = 0;
          int v183;
          int v184;
          v183 = v181;
          v184 = v182;
          while (true) {
            int v185 = 4;
            int v186 = v184 * v185;
            int v187 = v186 + v89;
            int v188 = 60;
            int v189 = v188 + v187;
            int v190 = v88[v189];
            int v191 = 0;
            bool v192 = v190 != v191;
            v183 = v183;
            v184 = v184;
            if (!v192) break;
            int v193 = v183 + v184;
            int v194 = 1;
            int v195 = v184 + v194;
            v183 = v193;
            v184 = v195;
          }
          bool v196 = true;
          v180 = v183;
          break;
        }
        case 0:
          {
          int v197 = 80;
          int v198 = v197 + v89;
          int v199 = v88[v198];
          int v200 = 1;
          int v201;
          v201 = v200;
          switch (v199) {
            default:
              {
              int v202 = 4;
              int v203 = v89 + v202;
              v201 = v203;
            }
            case 0:
              {
              int v204 = 2;
              v201 = v204;
              break;
            }
            case 1:
              {
              int v205 = 0;
              v201 = v205;
              break;
            }
            case 2:
              {
              v201 = v89;
              break;
            }
          }
          bool v206 = true;
          v180 = v201;
          break;
        }
      }
      bool v207 = true;
      v146 = v180;
      break;
    }
    default:
      {
      int v208 = 84;
      int v209 = v208 + v89;
      int v210 = v88[v209];
      int v211 = 0;
      bool v212 = v210 != v211;
      int v213;
      if (v212) {
        int v214 = 0;
        int v215 = 0;
        int v216;
        int v217;
        v216 = v214;
        v217 = v215;
        while (true) {
          int v218 = 4;
          int v219 = v217 * v218;
          int v220 = v219 + v89;
          int v221 = 88;
          int v222 = v221 + v220;
          int v223 = v88[v222];
          int v224 = 0;
          bool v225 = v223 != v224;
          v216 = v216;
          v217 = v217;
          if (!v225) break;
          int v226 = v216 + v217;
          int v227 = 1;
          int v228 = v217 + v227;
          v216 = v226;
          v217 = v228;
        }
        bool v229 = true;
        v213 = v216;
      } else {
        int v230 = 108;
        int v231 = v230 + v89;
        int v232 = v88[v231];
        int v233 = 4;
        int v234 = v89 + v233;
        int v235;
        v235 = v234;
        switch (v232) {
          default:
            {
            int v236 = 1;
            int v237 = v89 + v236;
            v235 = v237;
            break;
          }
          case 0:
            {
            int v238 = 2;
            v235 = v238;
            break;
          }
          case 1:
            {
            v235 = v89;
            break;
          }
          case 2:
            {
            v235 = v89;
            break;
          }
        }
        bool v239 = true;
        v213 = v235;
      }
      v146 = v213;
      break;
    }
  }
  bool v240 = true;
  int v241 = 32;
  int v242 = v241 + v89;
  bool v243 = true;
  int v244 = simt_wave_count_bits(v243);
  v87[v242] = v244;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
