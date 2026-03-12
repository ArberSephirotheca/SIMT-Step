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
      bool v16 = true;
      int v17 = simt_wave_count_bits(v16);
      int v18 = 0;
      int v19 = 4;
      int v20 = v10 * v19;
      int v21 = v18 + v20;
      int v22 = v21 + v0;
      v1[v22] = v17;
      int v23 = 1;
      int v24 = v10 + v23;
      v9 = v17;
      v10 = v24;
    }
    v6 = v9;
  } else {
    int v25 = 3;
    int v26 = v3 % v25;
    uint v27 = simt_subgroup_id(__simt_tid);
    int v28 = (int)(v27);
    int v29;
    v29 = v28;
    switch (v26) {
      default:
        {
        int v30 = 0;
        int v31 = 0;
        int v32;
        int v33;
        v32 = v30;
        v33 = v31;
        while (true) {
          int v34 = 4;
          int v35 = v3 % v34;
          int v36 = 1;
          int v37 = v35 + v36;
          bool v38 = v33 < v37;
          v32 = v32;
          v33 = v33;
          if (!v38) break;
          int v39 = 1;
          int v40 = v33 + v39;
          v32 = v0;
          v33 = v40;
        }
        v29 = v32;
        break;
      }
      case 0:
        {
        int v41 = 0;
        bool v42 = v2 != v41;
        int v43;
        if (v42) {
          int v44 = 2;
          v43 = v44;
        } else {
          v43 = v0;
        }
        v29 = v43;
        break;
      }
      case 1:
        {
        int v45 = 0;
        bool v46 = v2 != v45;
        int v47;
        if (v46) {
          int v48 = 0;
          int v49 = v0 + v48;
          v47 = v49;
        } else {
          v47 = v0;
        }
        v29 = v47;
        break;
      }
      case 2:
        {
        int v50 = 0;
        bool v51 = v2 != v50;
        int v52;
        if (v51) {
          int v53 = 4;
          int v54 = v0 + v53;
          v52 = v54;
        } else {
          v52 = v0;
        }
        v29 = v52;
        break;
      }
    }
    v6 = v29;
  }
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
  uint v64 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v65 = (int)(v64);
  int v66 = 8;
  int v67 = v66 + v57;
  int v68 = v56[v67];
  int v69 = 0;
  bool v70 = v68 != v69;
  int v71;
  if (v70) {
    v71 = v57;
  } else {
    int v72 = 12;
    int v73 = v72 + v57;
    int v74 = v56[v73];
    int v75 = 1;
    int v76 = v57 + v75;
    int v77;
    v77 = v76;
    switch (v74) {
      default:
        {
        int v78 = 3;
        int v79 = v57 + v78;
        v77 = v79;
        break;
      }
      case 0:
        {
        int v80 = 0;
        int v81 = 0;
        int v82;
        int v83;
        v82 = v80;
        v83 = v81;
        while (true) {
          int v84 = 4;
          int v85 = v83 * v84;
          int v86 = v85 + v57;
          int v87 = 16;
          int v88 = v87 + v86;
          int v89 = v56[v88];
          int v90 = 0;
          bool v91 = v89 != v90;
          v82 = v82;
          v83 = v83;
          if (!v91) break;
          int v92 = v82 + v83;
          int v93 = 1;
          int v94 = v83 + v93;
          bool v95 = true;
          v82 = v92;
          v83 = v94;
          continue;
          ;
        }
        v77 = v82;
      }
      case 1:
        {
        int v96 = 0;
        v77 = v96;
      }
      case 2:
        {
        int v97 = 0;
        int v98 = 0;
        int v99;
        int v100;
        v99 = v97;
        v100 = v98;
        while (true) {
          int v101 = 4;
          int v102 = v100 * v101;
          int v103 = v102 + v57;
          int v104 = 36;
          int v105 = v104 + v103;
          int v106 = v56[v105];
          int v107 = 0;
          bool v108 = v106 != v107;
          v99 = v99;
          v100 = v100;
          if (!v108) break;
          int v109 = v99 + v100;
          int v110 = 1;
          int v111 = v100 + v110;
          bool v112 = true;
          v99 = v109;
          v100 = v111;
          break;
          ;
        }
        v77 = v99;
        break;
      }
    }
    v71 = v77;
  }
  int v113 = 16;
  int v114 = v113 + v57;
  bool v115 = true;
  int v116 = simt_wave_count_bits(v115);
  v55[v114] = v116;
  int v117 = 56;
  int v118 = v117 + v57;
  int v119 = v56[v118];
  int v120 = 0;
  int v121;
  v121 = v120;
  switch (v119) {
    case 0:
      {
      int v122 = 0;
      int v123 = 0;
      int v124;
      int v125;
      v124 = v122;
      v125 = v123;
      while (true) {
        int v126 = 4;
        int v127 = v125 * v126;
        int v128 = v127 + v57;
        int v129 = 60;
        int v130 = v129 + v128;
        int v131 = v56[v130];
        int v132 = 0;
        bool v133 = v131 != v132;
        v124 = v124;
        v125 = v125;
        if (!v133) break;
        int v134 = v124 + v125;
        int v135 = 1;
        int v136 = v125 + v135;
        bool v137 = true;
        v124 = v134;
        v125 = v136;
      }
      v121 = v124;
      break;
    }
    default:
      {
      int v138 = 80;
      int v139 = v138 + v57;
      int v140 = v56[v139];
      int v141 = 0;
      bool v142 = v140 != v141;
      int v143;
      if (v142) {
        int v144 = 84;
        int v145 = v144 + v57;
        int v146 = v56[v145];
        int v147 = 0;
        int v148;
        v148 = v147;
        switch (v146) {
          case 0:
            {
            int v149 = 0;
            v148 = v149;
            break;
          }
          default:
            {
            int v150 = 2;
            int v151 = v57 + v150;
            v148 = v151;
            break;
          }
        }
        v143 = v148;
      } else {
        int v152 = 88;
        int v153 = v152 + v57;
        int v154 = v56[v153];
        int v155 = 4;
        int v156;
        v156 = v155;
        switch (v154) {
          case 0:
            {
            int v157 = 0;
            int v158 = v57 + v157;
            v156 = v158;
            break;
          }
          default:
            {
            int v159 = 4;
            int v160 = v57 + v159;
            v156 = v160;
            break;
          }
        }
        v143 = v156;
      }
      v121 = v143;
      break;
    }
    case 1:
      {
      int v161 = 92;
      int v162 = v161 + v57;
      int v163 = v56[v162];
      int v164 = 4;
      int v165 = v57 + v164;
      int v166;
      v166 = v165;
      switch (v163) {
        case 0:
          {
          int v167 = 96;
          int v168 = v167 + v57;
          int v169 = v56[v168];
          int v170 = 0;
          int v171 = v57 + v170;
          int v172;
          v172 = v171;
          switch (v169) {
            case 0:
              {
              v172 = v57;
              break;
            }
            case 1:
              {
              int v173 = 4;
              v172 = v173;
            }
            default:
              {
              int v174 = 4;
              v172 = v174;
              break;
            }
          }
          v166 = v172;
          break;
        }
        case 1:
          {
          int v175 = 100;
          int v176 = v175 + v57;
          int v177 = v56[v176];
          int v178;
          v178 = v57;
          switch (v177) {
            case 0:
              {
              v178 = v57;
              break;
            }
            default:
              {
              v178 = v57;
              break;
            }
          }
          v166 = v178;
          break;
        }
        default:
          {
          int v179 = 0;
          int v180 = 0;
          int v181;
          int v182;
          v181 = v179;
          v182 = v180;
          while (true) {
            int v183 = 4;
            int v184 = v182 * v183;
            int v185 = v184 + v57;
            int v186 = 104;
            int v187 = v186 + v185;
            int v188 = v56[v187];
            int v189 = 0;
            bool v190 = v188 != v189;
            v181 = v181;
            v182 = v182;
            if (!v190) break;
            int v191 = v181 + v182;
            int v192 = 1;
            int v193 = v182 + v192;
            bool v194 = true;
            v181 = v191;
            v182 = v193;
          }
          v166 = v181;
          break;
        }
      }
      v121 = v166;
      break;
    }
    case 2:
      {
      int v195 = 0;
      int v196 = 0;
      int v197;
      int v198;
      v197 = v195;
      v198 = v196;
      while (true) {
        int v199 = 4;
        int v200 = v198 * v199;
        int v201 = v200 + v57;
        int v202 = 124;
        int v203 = v202 + v201;
        int v204 = v56[v203];
        int v205 = 0;
        bool v206 = v204 != v205;
        v197 = v197;
        v198 = v198;
        if (!v206) break;
        int v207 = v197 + v198;
        int v208 = 1;
        int v209 = v198 + v208;
        bool v210 = true;
        v197 = v207;
        v198 = v209;
      }
      v121 = v197;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 144; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
