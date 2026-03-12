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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
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
        int v17 = v3 % v16;
        int v18 = 0;
        int v19 = v0 + v18;
        int v20;
        v20 = v19;
        switch (v17) {
          case 0:
            {
            int v21 = 0;
            v20 = v21;
          }
          case 1:
            {
            int v22 = 0;
            int v23 = v0 + v22;
            v20 = v23;
          }
          default:
            {
            int v24 = 1;
            v20 = v24;
            break;
          }
          case 2:
            {
            int v25 = 2;
            v20 = v25;
            break;
          }
        }
        int v26 = 1;
        int v27 = v10 + v26;
        v9 = v20;
        v10 = v27;
      }
      v6 = v9;
      break;
    }
    case 1:
      {
      int v28 = 4;
      int v29 = v3 % v28;
      int v30 = 0;
      int v31;
      v31 = v30;
      switch (v29) {
        case 0:
          {
          int v32 = 0;
          bool v33 = v2 != v32;
          int v34;
          if (v33) {
            v34 = v0;
          } else {
            v34 = v0;
          }
          v31 = v34;
        }
        case 1:
          {
          int v35 = 0;
          bool v36 = v2 != v35;
          int v37;
          if (v36) {
            int v38 = 3;
            v37 = v38;
          } else {
            v37 = v0;
          }
          v31 = v37;
        }
        default:
          {
          int v39 = 3;
          int v40 = v3 % v39;
          int v41;
          v41 = v0;
          switch (v40) {
            case 0:
              {
              int v42 = 0;
              v41 = v42;
              break;
            }
            case 1:
              {
              int v43 = 3;
              int v44 = v0 + v43;
              v41 = v44;
              break;
            }
            default:
              {
              int v45 = 2;
              int v46 = v0 + v45;
              v41 = v46;
              break;
            }
          }
          v31 = v41;
        }
        case 2:
          {
          int v47 = 1;
          int v48 = v0 + v47;
          v31 = v48;
          break;
        }
      }
      v6 = v31;
      break;
    }
    case 2:
      {
      int v49 = 3;
      int v50 = v3 % v49;
      int v51 = 3;
      int v52 = v0 + v51;
      int v53;
      v53 = v52;
      switch (v50) {
        case 0:
          {
          int v54 = 4;
          int v55 = v3 % v54;
          int v56 = 4;
          int v57;
          v57 = v56;
          switch (v55) {
            case 0:
              {
              v57 = v0;
              break;
            }
            default:
              {
              v57 = v0;
              break;
            }
            case 1:
              {
              int v58 = 1;
              int v59 = v0 + v58;
              v57 = v59;
              break;
            }
            case 2:
              {
              int v60 = 4;
              v57 = v60;
              break;
            }
          }
          v53 = v57;
          break;
        }
        case 1:
          {
          int v61 = 4;
          int v62 = v0 + v61;
          int v63;
          v63 = v62;
          switch (v3) {
            case 0:
              {
              int v64 = 0;
              int v65 = v0 + v64;
              v63 = v65;
              break;
            }
            default:
              {
              v63 = v0;
              break;
            }
          }
          int v66 = 0;
          int v67 = v0 + v66;
          v53 = v63;
        }
        case 2:
          {
          int v68 = 0;
          int v69 = 0;
          int v70;
          int v71;
          v70 = v68;
          v71 = v69;
          while (true) {
            int v72 = 4;
            int v73 = v3 % v72;
            int v74 = 1;
            int v75 = v73 + v74;
            bool v76 = v71 < v75;
            v70 = v70;
            v71 = v71;
            if (!v76) break;
            int v77 = 1;
            int v78 = v71 + v77;
            v70 = v0;
            v71 = v78;
          }
          v53 = v70;
          break;
        }
        default:
          {
          int v79 = 0;
          bool v80 = v2 != v79;
          int v81;
          if (v80) {
            v81 = v0;
          } else {
            int v82 = 4;
            v81 = v82;
          }
          v53 = v81;
          break;
        }
      }
      v6 = v53;
      break;
    }
    default:
      {
      int v83 = 0;
      bool v84 = v2 != v83;
      int v85;
      if (v84) {
        v85 = v0;
      } else {
        int v86 = 0;
        int v87 = 0;
        int v88;
        int v89;
        v88 = v86;
        v89 = v87;
        while (true) {
          int v90 = 4;
          int v91 = v3 % v90;
          int v92 = 1;
          int v93 = v91 + v92;
          bool v94 = v89 < v93;
          v88 = v88;
          v89 = v89;
          if (!v94) break;
          int v95 = 1;
          int v96 = v89 + v95;
          v88 = v0;
          v89 = v96;
          continue;
          ;
        }
        v85 = v88;
      }
      v6 = v85;
      break;
    }
  }
  bool v97 = true;
  int v98 = simt_wave_count_bits(v97);
  int v99 = 0;
  int v100 = v99 + v0;
  v1[v100] = v98;
  return;
}

kernel void kernel_main(device int* v101 [[buffer(0)]], device int* v102 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v103 = static_cast<int>(__simt_tid3.x);
  int v104 = 0;
  int v105 = v104 + v103;
  int v106 = v102[v105];
  int v107 = 4;
  int v108 = v107 + v103;
  int v109 = v102[v108];
  helper0(v103, v101, v106, v109, static_cast<int>(__simt_tid3.x));
  int v110 = 0;
  int v111 = 0;
  int v112;
  int v113;
  v112 = v110;
  v113 = v111;
  while (true) {
    int v114 = 4;
    int v115 = v113 * v114;
    int v116 = v115 + v103;
    int v117 = 8;
    int v118 = v117 + v116;
    int v119 = v102[v118];
    int v120 = 0;
    bool v121 = v119 != v120;
    v112 = v112;
    v113 = v113;
    if (!v121) break;
    int v122 = 4;
    int v123 = v103 + v122;
    int v124 = v112 + v123;
    int v125 = 1;
    int v126 = v113 + v125;
    bool v127 = true;
    int v128 = 16;
    int v129 = 4;
    int v130 = v113 * v129;
    int v131 = v128 + v130;
    int v132 = v131 + v103;
    bool v133 = true;
    int v134 = simt_wave_count_bits(v133);
    v101[v132] = v134;
    v112 = v124;
    v113 = v126;
  }
  int v135 = 28;
  int v136 = v135 + v103;
  int v137 = v102[v136];
  int v138 = 0;
  bool v139 = v137 != v138;
  int v140;
  if (v139) {
    int v141 = 0;
    int v142 = 0;
    int v143;
    int v144;
    v143 = v141;
    v144 = v142;
    while (true) {
      int v145 = 4;
      int v146 = v144 * v145;
      int v147 = v146 + v103;
      int v148 = 32;
      int v149 = v148 + v147;
      int v150 = v102[v149];
      int v151 = 0;
      bool v152 = v150 != v151;
      v143 = v143;
      v144 = v144;
      if (!v152) break;
      int v153 = v143 + v144;
      int v154 = 1;
      int v155 = v144 + v154;
      bool v156 = true;
      int v157 = 32;
      int v158 = 4;
      int v159 = v144 * v158;
      int v160 = v157 + v159;
      int v161 = v160 + v103;
      bool v162 = true;
      int v163 = simt_wave_count_bits(v162);
      v101[v161] = v163;
      v143 = v153;
      v144 = v155;
    }
    v140 = v143;
  } else {
    int v164 = 0;
    int v165 = 0;
    int v166;
    int v167;
    v166 = v164;
    v167 = v165;
    while (true) {
      int v168 = 4;
      int v169 = v167 * v168;
      int v170 = v169 + v103;
      int v171 = 52;
      int v172 = v171 + v170;
      int v173 = v102[v172];
      int v174 = 0;
      bool v175 = v173 != v174;
      v166 = v166;
      v167 = v167;
      if (!v175) break;
      int v176 = v166 + v167;
      int v177 = 1;
      int v178 = v167 + v177;
      bool v179 = true;
      int v180 = 48;
      int v181 = 4;
      int v182 = v167 * v181;
      int v183 = v180 + v182;
      int v184 = v183 + v103;
      bool v185 = true;
      int v186 = simt_wave_count_bits(v185);
      v101[v184] = v186;
      v166 = v176;
      v167 = v178;
      break;
      ;
    }
    v140 = v166;
  }
  int v187 = 64;
  int v188 = v187 + v103;
  bool v189 = true;
  int v190 = simt_wave_count_bits(v189);
  v101[v188] = v190;
  int v191 = 72;
  int v192 = v191 + v103;
  int v193 = v102[v192];
  int v194 = 0;
  bool v195 = v193 != v194;
  int v196;
  if (v195) {
    uint v197 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v198 = (int)(v197);
    v196 = v198;
  } else {
    uint v199 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v200 = (int)(v199);
    v196 = v200;
  }
  int v201 = 80;
  int v202 = v201 + v103;
  bool v203 = true;
  int v204 = simt_wave_count_bits(v203);
  v101[v202] = v204;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
