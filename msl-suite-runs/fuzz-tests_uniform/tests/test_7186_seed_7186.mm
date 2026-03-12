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
    int v7 = 2;
    int v8 = v3 % v7;
    uint v9 = simt_lane_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      case 0:
        {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          v14 = v0;
        } else {
          v14 = v0;
        }
        int v15 = 3;
        v11 = v14;
        break;
      }
      case 1:
        {
        int v16 = 0;
        bool v17 = v2 != v16;
        int v18;
        if (v17) {
          int v19 = 4;
          v18 = v19;
        } else {
          int v20 = 4;
          int v21 = v0 + v20;
          v18 = v21;
        }
        v11 = v18;
        break;
      }
      default:
        {
        int v22 = 2;
        int v23 = v3 % v22;
        int v24 = 4;
        int v25;
        v25 = v24;
        switch (v23) {
          case 0:
            {
            int v26 = 4;
            int v27 = v0 + v26;
            v25 = v27;
            break;
          }
          case 1:
            {
            v25 = v0;
            break;
          }
          default:
            {
            int v28 = 1;
            int v29 = v0 + v28;
            v25 = v29;
            break;
          }
        }
        int v30 = 3;
        v11 = v25;
        break;
      }
    }
    v6 = v11;
  } else {
    int v31 = 2;
    int v32 = v3 % v31;
    int v33 = 0;
    int v34;
    v34 = v33;
    switch (v32) {
      case 0:
        {
        int v35 = 2;
        int v36 = v0 + v35;
        v34 = v36;
      }
      case 1:
        {
        int v37 = 3;
        int v38 = v3 % v37;
        int v39 = 4;
        int v40;
        v40 = v39;
        switch (v38) {
          case 0:
            {
            v40 = v0;
            break;
          }
          case 1:
            {
            v40 = v0;
            break;
          }
          case 2:
            {
            v40 = v0;
            break;
          }
          default:
            {
            v40 = v0;
            break;
          }
        }
        int v41 = 3;
        int v42 = v0 + v41;
        v34 = v40;
        break;
      }
      default:
        {
        int v43 = 0;
        int v44 = 0;
        int v45;
        int v46;
        v45 = v43;
        v46 = v44;
        while (true) {
          int v47 = 4;
          int v48 = v3 % v47;
          int v49 = 1;
          int v50 = v48 + v49;
          bool v51 = v46 < v50;
          v45 = v45;
          v46 = v46;
          if (!v51) break;
          int v52 = 1;
          int v53 = v46 + v52;
          v45 = v0;
          v46 = v53;
        }
        v34 = v45;
        break;
      }
    }
    uint v54 = simt_subgroup_id(__simt_tid);
    int v55 = (int)(v54);
    v6 = v34;
  }
  bool v56 = true;
  int v57 = simt_wave_count_bits(v56);
  int v58 = 0;
  int v59 = v58 + v0;
  v1[v59] = v57;
  return;
}

kernel void kernel_main(device int* v60 [[buffer(0)]], device int* v61 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v62 = static_cast<int>(__simt_tid3.x);
  int v63 = 0;
  int v64 = v63 + v62;
  int v65 = v61[v64];
  int v66 = 4;
  int v67 = v66 + v62;
  int v68 = v61[v67];
  helper0(v62, v60, v65, v68, static_cast<int>(__simt_tid3.x));
  int v69 = 8;
  int v70 = v69 + v62;
  int v71 = v61[v70];
  int v72 = 0;
  bool v73 = v71 != v72;
  int v74;
  if (v73) {
    int v75 = 12;
    int v76 = v75 + v62;
    int v77 = v61[v76];
    uint v78 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v79 = (int)(v78);
    int v80;
    v80 = v79;
    switch (v77) {
      default:
        {
        int v81 = 16;
        int v82 = v81 + v62;
        int v83 = v61[v82];
        int v84;
        v84 = v62;
        switch (v83) {
          case 0:
            {
            int v85 = 0;
            v84 = v85;
          }
          default:
            {
            int v86 = 2;
            int v87 = v62 + v86;
            v84 = v87;
            break;
          }
          case 1:
            {
            int v88 = 2;
            int v89 = v62 + v88;
            v84 = v89;
            break;
          }
          case 2:
            {
            int v90 = 3;
            int v91 = v62 + v90;
            v84 = v91;
            break;
          }
        }
        bool v92 = true;
        v80 = v84;
        break;
      }
      case 0:
        {
        int v93 = 4;
        int v94 = v62 + v93;
        v80 = v94;
      }
      case 1:
        {
        int v95 = 20;
        int v96 = v95 + v62;
        int v97 = v61[v96];
        int v98;
        v98 = v62;
        switch (v97) {
          default:
            {
            int v99 = 3;
            int v100 = v62 + v99;
            v98 = v100;
            break;
          }
          case 0:
            {
            v98 = v62;
            break;
          }
        }
        bool v101 = true;
        v80 = v98;
        break;
      }
      case 2:
        {
        int v102 = 0;
        int v103 = v62 + v102;
        v80 = v103;
        break;
      }
    }
    bool v104 = true;
    v74 = v80;
  } else {
    v74 = v62;
  }
  int v105 = 16;
  int v106 = v105 + v62;
  bool v107 = true;
  int v108 = simt_wave_count_bits(v107);
  v60[v106] = v108;
  int v109 = 24;
  int v110 = v109 + v62;
  int v111 = v61[v110];
  uint v112 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v113 = (int)(v112);
  int v114;
  v114 = v113;
  switch (v111) {
    case 0:
      {
      int v115 = 28;
      int v116 = v115 + v62;
      int v117 = v61[v116];
      int v118 = 0;
      bool v119 = v117 != v118;
      int v120;
      if (v119) {
        int v121 = 0;
        int v122 = 0;
        int v123;
        int v124;
        v123 = v121;
        v124 = v122;
        while (true) {
          int v125 = 4;
          int v126 = v124 * v125;
          int v127 = v126 + v62;
          int v128 = 32;
          int v129 = v128 + v127;
          int v130 = v61[v129];
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
          break;
          ;
        }
        bool v136 = true;
        v120 = v123;
      } else {
        int v137 = 52;
        int v138 = v137 + v62;
        int v139 = v61[v138];
        int v140;
        v140 = v62;
        switch (v139) {
          case 0:
            {
            int v141 = 1;
            v140 = v141;
          }
          default:
            {
            int v142 = 1;
            v140 = v142;
            break;
          }
          case 1:
            {
            int v143 = 3;
            int v144 = v62 + v143;
            v140 = v144;
            break;
          }
        }
        bool v145 = true;
        v120 = v140;
      }
      v114 = v120;
      break;
    }
    case 1:
      {
      int v146 = 56;
      int v147 = v146 + v62;
      int v148 = v61[v147];
      int v149;
      v149 = v62;
      switch (v148) {
        case 0:
          {
          int v150 = 60;
          int v151 = v150 + v62;
          int v152 = v61[v151];
          int v153 = 4;
          int v154;
          v154 = v153;
          switch (v152) {
            case 0:
              {
              v154 = v62;
              break;
            }
            case 1:
              {
              int v155 = 3;
              int v156 = v62 + v155;
              v154 = v156;
              break;
            }
            default:
              {
              int v157 = 1;
              v154 = v157;
              break;
            }
          }
          bool v158 = true;
          v149 = v154;
          break;
        }
        case 1:
          {
          int v159 = 64;
          int v160 = v159 + v62;
          int v161 = v61[v160];
          int v162 = 0;
          int v163;
          v163 = v162;
          switch (v161) {
            default:
              {
              v163 = v62;
              break;
            }
            case 0:
              {
              v163 = v62;
              break;
            }
          }
          bool v164 = true;
          v149 = v163;
          break;
        }
        default:
          {
          int v165 = 68;
          int v166 = v165 + v62;
          int v167 = v61[v166];
          int v168 = 0;
          bool v169 = v167 != v168;
          int v170;
          if (v169) {
            v170 = v62;
          } else {
            v170 = v62;
          }
          v149 = v170;
          break;
        }
      }
      bool v171 = true;
      v114 = v149;
      break;
    }
    case 2:
      {
      int v172 = 0;
      int v173 = 0;
      int v174;
      int v175;
      v174 = v172;
      v175 = v173;
      while (true) {
        int v176 = 4;
        int v177 = v175 * v176;
        int v178 = v177 + v62;
        int v179 = 72;
        int v180 = v179 + v178;
        int v181 = v61[v180];
        int v182 = 0;
        bool v183 = v181 != v182;
        v174 = v174;
        v175 = v175;
        if (!v183) break;
        int v184 = 4;
        int v185 = v174 + v184;
        int v186 = 1;
        int v187 = v175 + v186;
        v174 = v185;
        v175 = v187;
      }
      bool v188 = true;
      v114 = v174;
      break;
    }
    default:
      {
      int v189 = 92;
      int v190 = v189 + v62;
      int v191 = v61[v190];
      int v192 = 3;
      int v193 = v62 + v192;
      int v194;
      v194 = v193;
      switch (v191) {
        default:
          {
          int v195 = 96;
          int v196 = v195 + v62;
          int v197 = v61[v196];
          int v198 = 0;
          bool v199 = v197 != v198;
          int v200;
          if (v199) {
            int v201 = 2;
            v200 = v201;
          } else {
            int v202 = 3;
            v200 = v202;
          }
          v194 = v200;
        }
        case 0:
          {
          int v203 = 100;
          int v204 = v203 + v62;
          int v205 = v61[v204];
          int v206;
          v206 = v62;
          switch (v205) {
            case 0:
              {
              int v207 = 4;
              v206 = v207;
              break;
            }
            case 1:
              {
              v206 = v62;
              break;
            }
            default:
              {
              v206 = v62;
              break;
            }
            case 2:
              {
              int v208 = 1;
              int v209 = v62 + v208;
              v206 = v209;
              break;
            }
          }
          bool v210 = true;
          v194 = v206;
          break;
        }
      }
      bool v211 = true;
      v114 = v194;
      break;
    }
  }
  bool v212 = true;
  int v213 = 32;
  int v214 = v213 + v62;
  bool v215 = true;
  int v216 = simt_wave_count_bits(v215);
  v60[v214] = v216;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
