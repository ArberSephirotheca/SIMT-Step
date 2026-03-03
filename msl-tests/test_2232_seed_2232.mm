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
    int v7 = 1;
    v6 = v7;
  } else {
    uint v8 = simt_lane_id(__simt_tid);
    int v9 = (int)(v8);
    int v10;
    v10 = v9;
    switch (v3) {
      case 0:
        {
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
          int v20 = 3;
          int v21 = v0 + v20;
          int v22 = 1;
          int v23 = v14 + v22;
          v13 = v21;
          v14 = v23;
        }
        int v24 = 0;
        v10 = v13;
        break;
      }
      default:
        {
        int v25 = 0;
        bool v26 = v2 != v25;
        int v27;
        if (v26) {
          int v28 = 3;
          int v29 = v0 + v28;
          v27 = v29;
        } else {
          int v30 = 0;
          v27 = v30;
        }
        int v31 = 0;
        int v32 = v0 + v31;
        v10 = v27;
        break;
      }
    }
    int v33 = 3;
    int v34 = v0 + v33;
    v6 = v10;
  }
  bool v35 = true;
  int v36 = simt_wave_count_bits(v35);
  int v37 = 0;
  int v38 = v37 + v0;
  v1[v38] = v36;
  int v39 = 0;
  bool v40 = v2 != v39;
  int v41 = v40 ? v0 : v6;
  return;
}

kernel void kernel_main(device int* v42 [[buffer(0)]], device int* v43 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v44 = static_cast<int>(__simt_tid3.x);
  int v45 = 0;
  int v46 = v45 + v44;
  int v47 = v43[v46];
  int v48 = 4;
  int v49 = v48 + v44;
  int v50 = v43[v49];
  helper0(v44, v42, v47, v50, static_cast<int>(__simt_tid3.x));
  int v51 = 0;
  int v52 = 0;
  int v53;
  int v54;
  v53 = v51;
  v54 = v52;
  while (true) {
    int v55 = 4;
    int v56 = v54 * v55;
    int v57 = v56 + v44;
    int v58 = 8;
    int v59 = v58 + v57;
    int v60 = v43[v59];
    int v61 = 0;
    bool v62 = v60 != v61;
    v53 = v53;
    v54 = v54;
    if (!v62) break;
    int v63 = 28;
    int v64 = v63 + v44;
    int v65 = v43[v64];
    int v66 = 0;
    bool v67 = v65 != v66;
    int v68;
    if (v67) {
      int v69 = 32;
      int v70 = v69 + v44;
      int v71 = v43[v70];
      int v72 = 0;
      bool v73 = v71 != v72;
      int v74;
      if (v73) {
        uint v75 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v76 = (int)(v75);
        v74 = v76;
      } else {
        uint v77 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v78 = (int)(v77);
        v74 = v78;
      }
      v68 = v74;
    } else {
      int v79 = 36;
      int v80 = v79 + v44;
      int v81 = v43[v80];
      int v82 = 0;
      bool v83 = v81 != v82;
      int v84;
      if (v83) {
        v84 = v44;
      } else {
        int v85 = 4;
        int v86 = v44 + v85;
        v84 = v86;
      }
      v68 = v84;
    }
    int v87 = v53 + v68;
    int v88 = 1;
    int v89 = v54 + v88;
    v53 = v87;
    v54 = v89;
    break;
    ;
  }
  bool v90 = true;
  int v91 = 16;
  int v92 = v91 + v44;
  bool v93 = true;
  int v94 = simt_wave_count_bits(v93);
  v42[v92] = v94;
  int v95 = 0;
  int v96 = 0;
  int v97;
  int v98;
  v97 = v95;
  v98 = v96;
  while (true) {
    int v99 = 4;
    int v100 = v98 * v99;
    int v101 = v100 + v44;
    int v102 = 40;
    int v103 = v102 + v101;
    int v104 = v43[v103];
    int v105 = 0;
    bool v106 = v104 != v105;
    v97 = v97;
    v98 = v98;
    if (!v106) break;
    int v107 = 60;
    int v108 = v107 + v44;
    int v109 = v43[v108];
    uint v110 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v111 = (int)(v110);
    int v112;
    v112 = v111;
    switch (v109) {
      default:
        {
        int v113 = 1;
        int v114 = v44 + v113;
        v112 = v114;
      }
      case 0:
        {
        int v115 = 1;
        int v116 = v44 + v115;
        v112 = v116;
      }
      case 1:
        {
        int v117 = 2;
        v112 = v117;
        break;
      }
      case 2:
        {
        int v118 = 64;
        int v119 = v118 + v44;
        int v120 = v43[v119];
        int v121 = 0;
        bool v122 = v120 != v121;
        int v123;
        if (v122) {
          int v124 = 0;
          int v125 = v44 + v124;
          v123 = v125;
        } else {
          int v126 = 0;
          int v127 = v44 + v126;
          v123 = v127;
        }
        v112 = v123;
        break;
      }
    }
    bool v128 = true;
    int v129 = v97 + v112;
    int v130 = 1;
    int v131 = v98 + v130;
    v97 = v129;
    v98 = v131;
  }
  bool v132 = true;
  int v133 = 32;
  int v134 = v133 + v44;
  bool v135 = true;
  int v136 = simt_wave_count_bits(v135);
  v42[v134] = v136;
  int v137 = 68;
  int v138 = v137 + v44;
  int v139 = v43[v138];
  uint v140 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v141 = (int)(v140);
  int v142;
  v142 = v141;
  switch (v139) {
    default:
      {
      int v143 = 72;
      int v144 = v143 + v44;
      int v145 = v43[v144];
      int v146 = 0;
      bool v147 = v145 != v146;
      int v148;
      if (v147) {
        int v149 = 2;
        int v150 = v44 + v149;
        v148 = v150;
      } else {
        int v151 = 76;
        int v152 = v151 + v44;
        int v153 = v43[v152];
        int v154 = 3;
        int v155 = v44 + v154;
        int v156;
        v156 = v155;
        switch (v153) {
          case 0:
            {
            int v157 = 4;
            int v158 = v44 + v157;
            v156 = v158;
            break;
          }
          default:
            {
            int v159 = 3;
            int v160 = v44 + v159;
            v156 = v160;
            break;
          }
          case 1:
            {
            int v161 = 0;
            int v162 = v44 + v161;
            v156 = v162;
            break;
          }
        }
        bool v163 = true;
        v148 = v156;
      }
      v142 = v148;
      break;
    }
    case 0:
      {
      int v164 = 80;
      int v165 = v164 + v44;
      int v166 = v43[v165];
      int v167;
      v167 = v44;
      switch (v166) {
        case 0:
          {
          int v168 = 4;
          v167 = v168;
          break;
        }
        default:
          {
          int v169 = 84;
          int v170 = v169 + v44;
          int v171 = v43[v170];
          int v172 = 0;
          bool v173 = v171 != v172;
          int v174;
          if (v173) {
            int v175 = 3;
            int v176 = v44 + v175;
            v174 = v176;
          } else {
            int v177 = 3;
            v174 = v177;
          }
          v167 = v174;
          break;
        }
      }
      bool v178 = true;
      v142 = v167;
      break;
    }
    case 1:
      {
      int v179 = 88;
      int v180 = v179 + v44;
      int v181 = v43[v180];
      int v182 = 0;
      int v183 = v44 + v182;
      int v184;
      v184 = v183;
      switch (v181) {
        default:
          {
          int v185 = 92;
          int v186 = v185 + v44;
          int v187 = v43[v186];
          int v188 = 1;
          int v189 = v44 + v188;
          int v190;
          v190 = v189;
          switch (v187) {
            case 0:
              {
              int v191 = 0;
              v190 = v191;
              break;
            }
            default:
              {
              int v192 = 1;
              int v193 = v44 + v192;
              v190 = v193;
            }
            case 1:
              {
              int v194 = 2;
              int v195 = v44 + v194;
              v190 = v195;
            }
            case 2:
              {
              int v196 = 4;
              int v197 = v44 + v196;
              v190 = v197;
              break;
            }
          }
          bool v198 = true;
          v184 = v190;
          break;
        }
        case 0:
          {
          int v199 = 96;
          int v200 = v199 + v44;
          int v201 = v43[v200];
          int v202 = 0;
          bool v203 = v201 != v202;
          int v204;
          if (v203) {
            v204 = v44;
          } else {
            v204 = v44;
          }
          v184 = v204;
          break;
        }
        case 1:
          {
          int v205 = 1;
          v184 = v205;
          break;
        }
        case 2:
          {
          int v206 = 100;
          int v207 = v206 + v44;
          int v208 = v43[v207];
          int v209 = 4;
          int v210;
          v210 = v209;
          switch (v208) {
            case 0:
              {
              v210 = v44;
              break;
            }
            case 1:
              {
              int v211 = 1;
              v210 = v211;
              break;
            }
            default:
              {
              int v212 = 4;
              int v213 = v44 + v212;
              v210 = v213;
              break;
            }
          }
          bool v214 = true;
          v184 = v210;
          break;
        }
      }
      bool v215 = true;
      v142 = v184;
      break;
    }
    case 2:
      {
      int v216 = 1;
      int v217 = v44 + v216;
      v142 = v217;
      break;
    }
  }
  bool v218 = true;
  int v219 = 48;
  int v220 = v219 + v44;
  bool v221 = true;
  int v222 = simt_wave_count_bits(v221);
  v42[v220] = v222;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
