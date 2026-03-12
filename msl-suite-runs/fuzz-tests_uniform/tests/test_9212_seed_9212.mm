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
  int v4 = 1;
  int v5;
  v5 = v4;
  switch (v3) {
    case 0:
      {
      int v6 = 0;
      int v7 = 0;
      int v8;
      int v9;
      v8 = v6;
      v9 = v7;
      while (true) {
        int v10 = 4;
        int v11 = v3 % v10;
        int v12 = 1;
        int v13 = v11 + v12;
        bool v14 = v9 < v13;
        v8 = v8;
        v9 = v9;
        if (!v14) break;
        int v15 = 0;
        int v16 = v0 + v15;
        int v17 = 1;
        int v18 = v9 + v17;
        v8 = v16;
        v9 = v18;
      }
      int v19 = 1;
      int v20 = v0 + v19;
      v5 = v8;
      break;
    }
    default:
      {
      int v21 = 0;
      bool v22 = v2 != v21;
      int v23;
      if (v22) {
        v23 = v0;
      } else {
        v23 = v0;
      }
      int v24 = 3;
      int v25 = v0 + v24;
      v5 = v23;
      break;
    }
  }
  bool v26 = true;
  int v27 = simt_wave_count_bits(v26);
  int v28 = 0;
  int v29 = v28 + v0;
  v1[v29] = v27;
  return;
}

kernel void kernel_main(device int* v30 [[buffer(0)]], device int* v31 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v32 = static_cast<int>(__simt_tid3.x);
  int v33 = 0;
  int v34 = v33 + v32;
  int v35 = v31[v34];
  int v36 = 4;
  int v37 = v36 + v32;
  int v38 = v31[v37];
  helper0(v32, v30, v35, v38, static_cast<int>(__simt_tid3.x));
  int v39 = 8;
  int v40 = v39 + v32;
  int v41 = v31[v40];
  uint v42 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v43 = (int)(v42);
  int v44;
  v44 = v43;
  switch (v41) {
    default:
      {
      int v45 = 12;
      int v46 = v45 + v32;
      int v47 = v31[v46];
      int v48 = 2;
      int v49;
      v49 = v48;
      switch (v47) {
        case 0:
          {
          int v50 = 16;
          int v51 = v50 + v32;
          int v52 = v31[v51];
          int v53;
          v53 = v32;
          switch (v52) {
            case 0:
              {
              v53 = v32;
              break;
            }
            default:
              {
              v53 = v32;
              break;
            }
          }
          bool v54 = true;
          v49 = v53;
          break;
        }
        default:
          {
          int v55 = 0;
          int v56 = 0;
          int v57;
          int v58;
          v57 = v55;
          v58 = v56;
          while (true) {
            int v59 = 4;
            int v60 = v58 * v59;
            int v61 = v60 + v32;
            int v62 = 20;
            int v63 = v62 + v61;
            int v64 = v31[v63];
            int v65 = 0;
            bool v66 = v64 != v65;
            v57 = v57;
            v58 = v58;
            if (!v66) break;
            int v67 = v57 + v58;
            int v68 = 1;
            int v69 = v58 + v68;
            v57 = v67;
            v58 = v69;
          }
          bool v70 = true;
          v49 = v57;
          break;
        }
      }
      bool v71 = true;
      v44 = v49;
      break;
    }
    case 0:
      {
      int v72 = 40;
      int v73 = v72 + v32;
      int v74 = v31[v73];
      int v75 = 4;
      int v76 = v32 + v75;
      int v77;
      v77 = v76;
      switch (v74) {
        default:
          {
          int v78 = 44;
          int v79 = v78 + v32;
          int v80 = v31[v79];
          int v81 = 2;
          int v82 = v32 + v81;
          int v83;
          v83 = v82;
          switch (v80) {
            case 0:
              {
              v83 = v32;
              break;
            }
            case 1:
              {
              v83 = v32;
              break;
            }
            case 2:
              {
              v83 = v32;
              break;
            }
            default:
              {
              int v84 = 2;
              int v85 = v32 + v84;
              v83 = v85;
              break;
            }
          }
          bool v86 = true;
          v77 = v83;
          break;
        }
        case 0:
          {
          int v87 = 0;
          int v88 = 0;
          int v89;
          int v90;
          v89 = v87;
          v90 = v88;
          while (true) {
            int v91 = 4;
            int v92 = v90 * v91;
            int v93 = v92 + v32;
            int v94 = 48;
            int v95 = v94 + v93;
            int v96 = v31[v95];
            int v97 = 0;
            bool v98 = v96 != v97;
            v89 = v89;
            v90 = v90;
            if (!v98) break;
            int v99 = v89 + v90;
            int v100 = 1;
            int v101 = v90 + v100;
            v89 = v99;
            v90 = v101;
          }
          bool v102 = true;
          v77 = v89;
          break;
        }
      }
      bool v103 = true;
      v44 = v77;
      break;
    }
    case 1:
      {
      int v104 = 68;
      int v105 = v104 + v32;
      int v106 = v31[v105];
      int v107 = 0;
      bool v108 = v106 != v107;
      int v109;
      if (v108) {
        int v110 = 72;
        int v111 = v110 + v32;
        int v112 = v31[v111];
        int v113;
        v113 = v32;
        switch (v112) {
          default:
            {
            v113 = v32;
          }
          case 0:
            {
            v113 = v32;
            break;
          }
          case 1:
            {
            v113 = v32;
            break;
          }
        }
        bool v114 = true;
        v109 = v113;
      } else {
        int v115 = 0;
        int v116 = 0;
        int v117;
        int v118;
        v117 = v115;
        v118 = v116;
        while (true) {
          int v119 = 4;
          int v120 = v118 * v119;
          int v121 = v120 + v32;
          int v122 = 76;
          int v123 = v122 + v121;
          int v124 = v31[v123];
          int v125 = 0;
          bool v126 = v124 != v125;
          v117 = v117;
          v118 = v118;
          if (!v126) break;
          int v127 = v117 + v118;
          int v128 = 1;
          int v129 = v118 + v128;
          v117 = v127;
          v118 = v129;
        }
        bool v130 = true;
        v109 = v117;
      }
      v44 = v109;
      break;
    }
    case 2:
      {
      int v131 = 3;
      int v132 = v32 + v131;
      v44 = v132;
      break;
    }
  }
  bool v133 = true;
  int v134 = 16;
  int v135 = v134 + v32;
  bool v136 = true;
  int v137 = simt_wave_count_bits(v136);
  v30[v135] = v137;
  int v138 = 96;
  int v139 = v138 + v32;
  int v140 = v31[v139];
  int v141 = 0;
  bool v142 = v140 != v141;
  int v143;
  if (v142) {
    int v144 = 1;
    int v145 = v32 + v144;
    v143 = v145;
  } else {
    int v146 = 0;
    int v147 = 0;
    int v148;
    int v149;
    v148 = v146;
    v149 = v147;
    while (true) {
      int v150 = 4;
      int v151 = v149 * v150;
      int v152 = v151 + v32;
      int v153 = 100;
      int v154 = v153 + v152;
      int v155 = v31[v154];
      int v156 = 0;
      bool v157 = v155 != v156;
      v148 = v148;
      v149 = v149;
      if (!v157) break;
      int v158 = 0;
      int v159 = 0;
      int v160;
      int v161;
      v160 = v158;
      v161 = v159;
      while (true) {
        int v162 = 4;
        int v163 = v161 * v162;
        int v164 = v163 + v32;
        int v165 = 120;
        int v166 = v165 + v164;
        int v167 = v31[v166];
        int v168 = 0;
        bool v169 = v167 != v168;
        v160 = v160;
        v161 = v161;
        if (!v169) break;
        int v170 = v160 + v161;
        int v171 = 1;
        int v172 = v161 + v171;
        v160 = v170;
        v161 = v172;
      }
      bool v173 = true;
      int v174 = v148 + v160;
      int v175 = 1;
      int v176 = v149 + v175;
      v148 = v174;
      v149 = v176;
      continue;
      ;
    }
    bool v177 = true;
    v143 = v148;
  }
  int v178 = 32;
  int v179 = v178 + v32;
  bool v180 = true;
  int v181 = simt_wave_count_bits(v180);
  v30[v179] = v181;
  int v182 = 0;
  int v183 = 0;
  int v184;
  int v185;
  v184 = v182;
  v185 = v183;
  while (true) {
    int v186 = 4;
    int v187 = v185 * v186;
    int v188 = v187 + v32;
    int v189 = 140;
    int v190 = v189 + v188;
    int v191 = v31[v190];
    int v192 = 0;
    bool v193 = v191 != v192;
    v184 = v184;
    v185 = v185;
    if (!v193) break;
    int v194 = v184 + v185;
    int v195 = 1;
    int v196 = v185 + v195;
    v184 = v194;
    v185 = v196;
    continue;
    ;
  }
  bool v197 = true;
  int v198 = 48;
  int v199 = v198 + v32;
  bool v200 = true;
  int v201 = simt_wave_count_bits(v200);
  v30[v199] = v201;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
