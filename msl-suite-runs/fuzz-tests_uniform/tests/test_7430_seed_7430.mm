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
    int v8 = v0 + v7;
    v6 = v8;
  } else {
    int v9 = 1;
    v6 = v9;
  }
  bool v10 = true;
  int v11 = simt_wave_count_bits(v10);
  int v12 = 0;
  int v13 = v12 + v0;
  v1[v13] = v11;
  int v14 = 0;
  bool v15 = v2 != v14;
  int v16;
  if (v15) {
    int v17 = 0;
    bool v18 = v2 != v17;
    int v19;
    if (v18) {
      int v20 = 2;
      v19 = v20;
    } else {
      uint v21 = simt_lane_id(__simt_tid);
      int v22 = (int)(v21);
      v19 = v22;
    }
    uint v23 = simt_subgroup_id(__simt_tid);
    int v24 = (int)(v23);
    v16 = v19;
  } else {
    int v25 = 0;
    bool v26 = v2 != v25;
    int v27;
    if (v26) {
      int v28 = 0;
      int v29 = 0;
      int v30;
      int v31;
      v30 = v28;
      v31 = v29;
      while (true) {
        int v32 = 4;
        int v33 = v3 % v32;
        int v34 = 1;
        int v35 = v33 + v34;
        bool v36 = v31 < v35;
        v30 = v30;
        v31 = v31;
        if (!v36) break;
        int v37 = 1;
        int v38 = v31 + v37;
        v30 = v0;
        v31 = v38;
        continue;
        ;
      }
      int v39 = 0;
      int v40 = v0 + v39;
      v27 = v30;
    } else {
      int v41 = 0;
      bool v42 = v2 != v41;
      int v43;
      if (v42) {
        v43 = v0;
      } else {
        int v44 = 2;
        int v45 = v0 + v44;
        v43 = v45;
      }
      v27 = v43;
    }
    uint v46 = simt_subgroup_id(__simt_tid);
    int v47 = (int)(v46);
    v16 = v27;
  }
  bool v48 = true;
  int v49 = simt_wave_count_bits(v48);
  int v50 = 16;
  int v51 = v50 + v0;
  v1[v51] = v49;
  int v52 = 0;
  bool v53 = v2 != v52;
  int v54 = v53 ? v6 : v16;
  return;
}

kernel void kernel_main(device int* v55 [[buffer(0)]], device int* v56 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v57 = static_cast<int>(__simt_tid3.x);
  int v58 = 0;
  int v59 = v58 + v57;
  int v60 = v56[v59];
  int v61 = 4;
  int v62 = v61 + v57;
  int v63 = v56[v62];
  helper0(v57, v55, v60, v63, static_cast<int>(__simt_tid3.x));
  int v64 = 0;
  int v65 = 0;
  int v66;
  int v67;
  v66 = v64;
  v67 = v65;
  while (true) {
    int v68 = 4;
    int v69 = v67 * v68;
    int v70 = v69 + v57;
    int v71 = 8;
    int v72 = v71 + v70;
    int v73 = v56[v72];
    int v74 = 0;
    bool v75 = v73 != v74;
    v66 = v66;
    v67 = v67;
    if (!v75) break;
    int v76 = 28;
    int v77 = v76 + v57;
    int v78 = v56[v77];
    uint v79 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v80 = (int)(v79);
    int v81;
    v81 = v80;
    switch (v78) {
      case 0:
        {
        int v82 = 32;
        int v83 = v82 + v57;
        int v84 = v56[v83];
        int v85 = 0;
        bool v86 = v84 != v85;
        int v87;
        if (v86) {
          v87 = v57;
        } else {
          int v88 = 0;
          int v89 = v57 + v88;
          v87 = v89;
        }
        v81 = v87;
        break;
      }
      default:
        {
        int v90 = 36;
        int v91 = v90 + v57;
        int v92 = v56[v91];
        int v93 = 2;
        int v94;
        v94 = v93;
        switch (v92) {
          default:
            {
            int v95 = 3;
            int v96 = v57 + v95;
            v94 = v96;
            break;
          }
          case 0:
            {
            int v97 = 4;
            v94 = v97;
            break;
          }
        }
        bool v98 = true;
        v81 = v94;
        break;
      }
      case 1:
        {
        int v99 = 40;
        int v100 = v99 + v57;
        int v101 = v56[v100];
        int v102;
        v102 = v57;
        switch (v101) {
          default:
            {
            int v103 = 0;
            v102 = v103;
            break;
          }
          case 0:
            {
            v102 = v57;
            break;
          }
        }
        bool v104 = true;
        v81 = v102;
        break;
      }
    }
    bool v105 = true;
    int v106 = v66 + v81;
    int v107 = 1;
    int v108 = v67 + v107;
    v66 = v106;
    v67 = v108;
  }
  bool v109 = true;
  int v110 = 32;
  int v111 = v110 + v57;
  bool v112 = true;
  int v113 = simt_wave_count_bits(v112);
  v55[v111] = v113;
  int v114 = 44;
  int v115 = v114 + v57;
  int v116 = v56[v115];
  int v117;
  v117 = v57;
  switch (v116) {
    case 0:
      {
      int v118 = 48;
      int v119 = v118 + v57;
      int v120 = v56[v119];
      int v121 = 3;
      int v122 = v57 + v121;
      int v123;
      v123 = v122;
      switch (v120) {
        case 0:
          {
          int v124 = 52;
          int v125 = v124 + v57;
          int v126 = v56[v125];
          int v127 = 0;
          bool v128 = v126 != v127;
          int v129;
          if (v128) {
            v129 = v57;
          } else {
            int v130 = 0;
            v129 = v130;
          }
          v123 = v129;
        }
        case 1:
          {
          int v131 = 56;
          int v132 = v131 + v57;
          int v133 = v56[v132];
          int v134 = 1;
          int v135;
          v135 = v134;
          switch (v133) {
            default:
              {
              int v136 = 4;
              v135 = v136;
              break;
            }
            case 0:
              {
              int v137 = 3;
              int v138 = v57 + v137;
              v135 = v138;
              break;
            }
          }
          bool v139 = true;
          v123 = v135;
        }
        default:
          {
          int v140 = 60;
          int v141 = v140 + v57;
          int v142 = v56[v141];
          int v143 = 0;
          bool v144 = v142 != v143;
          int v145;
          if (v144) {
            v145 = v57;
          } else {
            v145 = v57;
          }
          v123 = v145;
          break;
        }
        case 2:
          {
          int v146 = 64;
          int v147 = v146 + v57;
          int v148 = v56[v147];
          int v149 = 1;
          int v150 = v57 + v149;
          int v151;
          v151 = v150;
          switch (v148) {
            default:
              {
              v151 = v57;
            }
            case 0:
              {
              int v152 = 0;
              v151 = v152;
              break;
            }
          }
          bool v153 = true;
          v123 = v151;
          break;
        }
      }
      bool v154 = true;
      v117 = v123;
      break;
    }
    case 1:
      {
      int v155 = 68;
      int v156 = v155 + v57;
      int v157 = v56[v156];
      int v158 = 0;
      bool v159 = v157 != v158;
      int v160;
      if (v159) {
        int v161 = 72;
        int v162 = v161 + v57;
        int v163 = v56[v162];
        int v164 = 4;
        int v165;
        v165 = v164;
        switch (v163) {
          default:
            {
            int v166 = 2;
            v165 = v166;
            break;
          }
          case 0:
            {
            v165 = v57;
            break;
          }
          case 1:
            {
            int v167 = 0;
            int v168 = v57 + v167;
            v165 = v168;
            break;
          }
          case 2:
            {
            int v169 = 1;
            v165 = v169;
            break;
          }
        }
        bool v170 = true;
        v160 = v165;
      } else {
        int v171 = 0;
        int v172 = 0;
        int v173;
        int v174;
        v173 = v171;
        v174 = v172;
        while (true) {
          int v175 = 4;
          int v176 = v174 * v175;
          int v177 = v176 + v57;
          int v178 = 76;
          int v179 = v178 + v177;
          int v180 = v56[v179];
          int v181 = 0;
          bool v182 = v180 != v181;
          v173 = v173;
          v174 = v174;
          if (!v182) break;
          int v183 = v173 + v174;
          int v184 = 1;
          int v185 = v174 + v184;
          v173 = v183;
          v174 = v185;
          break;
          ;
        }
        bool v186 = true;
        v160 = v173;
      }
      v117 = v160;
      break;
    }
    default:
      {
      v117 = v57;
      break;
    }
  }
  bool v187 = true;
  int v188 = 48;
  int v189 = v188 + v57;
  bool v190 = true;
  int v191 = simt_wave_count_bits(v190);
  v55[v189] = v191;
  int v192 = 96;
  int v193 = v192 + v57;
  int v194 = v56[v193];
  int v195 = 0;
  int v196;
  v196 = v195;
  switch (v194) {
    default:
      {
      int v197 = 0;
      int v198 = 0;
      int v199;
      int v200;
      v199 = v197;
      v200 = v198;
      while (true) {
        int v201 = 4;
        int v202 = v200 * v201;
        int v203 = v202 + v57;
        int v204 = 100;
        int v205 = v204 + v203;
        int v206 = v56[v205];
        int v207 = 0;
        bool v208 = v206 != v207;
        v199 = v199;
        v200 = v200;
        if (!v208) break;
        int v209 = v199 + v200;
        int v210 = 1;
        int v211 = v200 + v210;
        v199 = v209;
        v200 = v211;
        break;
        ;
      }
      bool v212 = true;
      v196 = v199;
      break;
    }
    case 0:
      {
      int v213 = 120;
      int v214 = v213 + v57;
      int v215 = v56[v214];
      int v216 = 0;
      bool v217 = v215 != v216;
      int v218;
      if (v217) {
        int v219 = 124;
        int v220 = v219 + v57;
        int v221 = v56[v220];
        int v222;
        v222 = v57;
        switch (v221) {
          default:
            {
            int v223 = 3;
            int v224 = v57 + v223;
            v222 = v224;
            break;
          }
          case 0:
            {
            int v225 = 2;
            int v226 = v57 + v225;
            v222 = v226;
            break;
          }
        }
        bool v227 = true;
        v218 = v222;
      } else {
        v218 = v57;
      }
      v196 = v218;
      break;
    }
  }
  bool v228 = true;
  int v229 = 64;
  int v230 = v229 + v57;
  bool v231 = true;
  int v232 = simt_wave_count_bits(v231);
  v55[v230] = v232;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
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
