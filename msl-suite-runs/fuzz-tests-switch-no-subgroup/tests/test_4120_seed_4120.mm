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
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      int v10 = 0;
      int v11 = 0;
      int v12;
      int v13;
      v12 = v10;
      v13 = v11;
      while (true) {
        int v14 = 4;
        int v15 = v3 % v14;
        int v16 = 1;
        int v17 = v15 + v16;
        bool v18 = v13 < v17;
        v12 = v12;
        v13 = v13;
        if (!v18) break;
        bool v19 = true;
        int v20 = simt_wave_count_bits(v19);
        int v21 = 0;
        int v22 = 4;
        int v23 = v13 * v22;
        int v24 = v21 + v23;
        int v25 = v24 + v0;
        v1[v25] = v20;
        int v26 = 1;
        int v27 = v13 + v26;
        v12 = v20;
        v13 = v27;
      }
      v9 = v12;
    } else {
      int v28 = 2;
      int v29 = v3 % v28;
      uint v30 = simt_subgroup_id(__simt_tid);
      int v31 = (int)(v30);
      int v32;
      v32 = v31;
      switch (v29) {
        case 0:
          {
          int v33 = 0;
          int v34 = v0 + v33;
          v32 = v34;
          break;
        }
        case 1:
          {
          v32 = v0;
          break;
        }
        default:
          {
          int v35 = 2;
          int v36 = v0 + v35;
          v32 = v36;
          break;
        }
      }
      bool v37 = true;
      int v38 = simt_wave_count_bits(v37);
      int v39 = 16;
      int v40 = v39 + v0;
      v1[v40] = v38;
      v9 = v32;
    }
    v6 = v9;
  } else {
    int v41 = 0;
    bool v42 = v2 != v41;
    int v43;
    if (v42) {
      int v44 = 0;
      int v45 = 0;
      int v46;
      int v47;
      v46 = v44;
      v47 = v45;
      while (true) {
        int v48 = 4;
        int v49 = v3 % v48;
        int v50 = 1;
        int v51 = v49 + v50;
        bool v52 = v47 < v51;
        v46 = v46;
        v47 = v47;
        if (!v52) break;
        bool v53 = true;
        int v54 = simt_wave_count_bits(v53);
        int v55 = 32;
        int v56 = 4;
        int v57 = v47 * v56;
        int v58 = v55 + v57;
        int v59 = v58 + v0;
        v1[v59] = v54;
        int v60 = 1;
        int v61 = v47 + v60;
        v46 = v54;
        v47 = v61;
      }
      v43 = v46;
    } else {
      int v62 = 0;
      bool v63 = v2 != v62;
      int v64;
      if (v63) {
        bool v65 = true;
        int v66 = simt_wave_count_bits(v65);
        int v67 = 48;
        int v68 = v67 + v0;
        v1[v68] = v66;
        v64 = v66;
      } else {
        bool v69 = true;
        int v70 = simt_wave_count_bits(v69);
        int v71 = 64;
        int v72 = v71 + v0;
        v1[v72] = v70;
        v64 = v70;
      }
      v43 = v64;
    }
    v6 = v43;
  }
  return;
}

kernel void kernel_main(device int* v73 [[buffer(0)]], device int* v74 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v75 = static_cast<int>(__simt_tid3.x);
  int v76 = 0;
  int v77 = v76 + v75;
  int v78 = v74[v77];
  int v79 = 4;
  int v80 = v79 + v75;
  int v81 = v74[v80];
  helper0(v75, v73, v78, v81, static_cast<int>(__simt_tid3.x));
  int v82 = 8;
  int v83 = v82 + v75;
  int v84 = v74[v83];
  int v85;
  v85 = v75;
  switch (v84) {
    default:
      {
      int v86 = 0;
      v85 = v86;
      break;
    }
    case 0:
      {
      int v87 = 4;
      int v88 = v75 + v87;
      v85 = v88;
      break;
    }
  }
  int v89 = 12;
  int v90 = v89 + v75;
  int v91 = v74[v90];
  int v92;
  v92 = v75;
  switch (v91) {
    case 0:
      {
      int v93 = 16;
      int v94 = v93 + v75;
      int v95 = v74[v94];
      int v96 = 0;
      bool v97 = v95 != v96;
      int v98;
      if (v97) {
        int v99 = 0;
        int v100 = 0;
        int v101;
        int v102;
        v101 = v99;
        v102 = v100;
        while (true) {
          int v103 = 4;
          int v104 = v102 * v103;
          int v105 = v104 + v75;
          int v106 = 20;
          int v107 = v106 + v105;
          int v108 = v74[v107];
          int v109 = 0;
          bool v110 = v108 != v109;
          v101 = v101;
          v102 = v102;
          if (!v110) break;
          int v111 = v101 + v102;
          int v112 = 1;
          int v113 = v102 + v112;
          bool v114 = true;
          v101 = v111;
          v102 = v113;
        }
        v98 = v101;
      } else {
        int v115 = 40;
        int v116 = v115 + v75;
        int v117 = v74[v116];
        int v118 = 0;
        bool v119 = v117 != v118;
        int v120;
        if (v119) {
          v120 = v75;
        } else {
          int v121 = 2;
          int v122 = v75 + v121;
          v120 = v122;
        }
        v98 = v120;
      }
      v92 = v98;
      break;
    }
    case 1:
      {
      int v123 = 44;
      int v124 = v123 + v75;
      int v125 = v74[v124];
      int v126;
      v126 = v75;
      switch (v125) {
        default:
          {
          int v127 = 48;
          int v128 = v127 + v75;
          int v129 = v74[v128];
          int v130 = 0;
          bool v131 = v129 != v130;
          int v132;
          if (v131) {
            int v133 = 4;
            int v134 = v75 + v133;
            v132 = v134;
          } else {
            int v135 = 0;
            int v136 = v75 + v135;
            v132 = v136;
          }
          v126 = v132;
          break;
        }
        case 0:
          {
          int v137 = 52;
          int v138 = v137 + v75;
          int v139 = v74[v138];
          int v140 = 0;
          bool v141 = v139 != v140;
          int v142;
          if (v141) {
            int v143 = 3;
            v142 = v143;
          } else {
            int v144 = 2;
            v142 = v144;
          }
          v126 = v142;
          break;
        }
        case 1:
          {
          int v145 = 56;
          int v146 = v145 + v75;
          int v147 = v74[v146];
          int v148 = 1;
          int v149;
          v149 = v148;
          switch (v147) {
            default:
              {
              int v150 = 3;
              v149 = v150;
            }
            case 0:
              {
              int v151 = 1;
              v149 = v151;
              break;
            }
          }
          v126 = v149;
          break;
        }
        case 2:
          {
          int v152 = 3;
          v126 = v152;
          break;
        }
      }
      bool v153 = true;
      v92 = v126;
      break;
    }
    default:
      {
      int v154 = 60;
      int v155 = v154 + v75;
      int v156 = v74[v155];
      int v157 = 1;
      int v158 = v75 + v157;
      int v159;
      v159 = v158;
      switch (v156) {
        case 0:
          {
          int v160 = 64;
          int v161 = v160 + v75;
          int v162 = v74[v161];
          int v163;
          v163 = v75;
          switch (v162) {
            case 0:
              {
              v163 = v75;
              break;
            }
            default:
              {
              int v164 = 1;
              int v165 = v75 + v164;
              v163 = v165;
              break;
            }
          }
          v159 = v163;
          break;
        }
        default:
          {
          int v166 = 0;
          int v167 = 0;
          int v168;
          int v169;
          v168 = v166;
          v169 = v167;
          while (true) {
            int v170 = 4;
            int v171 = v169 * v170;
            int v172 = v171 + v75;
            int v173 = 68;
            int v174 = v173 + v172;
            int v175 = v74[v174];
            int v176 = 0;
            bool v177 = v175 != v176;
            v168 = v168;
            v169 = v169;
            if (!v177) break;
            int v178 = v168 + v169;
            int v179 = 1;
            int v180 = v169 + v179;
            bool v181 = true;
            v168 = v178;
            v169 = v180;
            continue;
            ;
          }
          v159 = v168;
          break;
        }
        case 1:
          {
          int v182 = 88;
          int v183 = v182 + v75;
          int v184 = v74[v183];
          int v185;
          v185 = v75;
          switch (v184) {
            case 0:
              {
              int v186 = 4;
              v185 = v186;
              break;
            }
            default:
              {
              v185 = v75;
            }
            case 1:
              {
              int v187 = 0;
              v185 = v187;
              break;
            }
          }
          bool v188 = true;
          v159 = v185;
          break;
        }
        case 2:
          {
          int v189 = 92;
          int v190 = v189 + v75;
          int v191 = v74[v190];
          int v192 = 4;
          int v193;
          v193 = v192;
          switch (v191) {
            default:
              {
              int v194 = 1;
              v193 = v194;
              break;
            }
            case 0:
              {
              int v195 = 4;
              v193 = v195;
              break;
            }
          }
          v159 = v193;
          break;
        }
      }
      v92 = v159;
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
    static int32_t expected0[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
