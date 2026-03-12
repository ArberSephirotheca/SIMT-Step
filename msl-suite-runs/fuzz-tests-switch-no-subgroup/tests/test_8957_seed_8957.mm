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
  int v4 = 4;
  int v5 = v0 + v4;
  int v6;
  v6 = v5;
  switch (v3) {
    case 0:
      {
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
          int v19 = 1;
          int v20 = v0 + v19;
          int v21 = 1;
          int v22 = v13 + v21;
          v12 = v20;
          v13 = v22;
        }
        v9 = v12;
      } else {
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
          int v32 = 1;
          int v33 = v26 + v32;
          v25 = v0;
          v26 = v33;
        }
        v9 = v25;
      }
      v6 = v9;
      break;
    }
    default:
      {
      int v34 = 0;
      int v35 = 0;
      int v36;
      int v37;
      v36 = v34;
      v37 = v35;
      while (true) {
        int v38 = 4;
        int v39 = v3 % v38;
        int v40 = 1;
        int v41 = v39 + v40;
        bool v42 = v37 < v41;
        v36 = v36;
        v37 = v37;
        if (!v42) break;
        int v43 = 0;
        bool v44 = v2 != v43;
        int v45;
        if (v44) {
          v45 = v0;
        } else {
          int v46 = 2;
          v45 = v46;
        }
        int v47 = 1;
        int v48 = v37 + v47;
        v36 = v45;
        v37 = v48;
      }
      v6 = v36;
      break;
    }
  }
  bool v49 = true;
  int v50 = simt_wave_count_bits(v49);
  int v51 = 0;
  int v52 = v51 + v0;
  v1[v52] = v50;
  return;
}

kernel void kernel_main(device int* v53 [[buffer(0)]], device int* v54 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v55 = static_cast<int>(__simt_tid3.x);
  int v56 = 0;
  int v57 = v56 + v55;
  int v58 = v54[v57];
  int v59 = 4;
  int v60 = v59 + v55;
  int v61 = v54[v60];
  int v62 = 0;
  bool v63 = v58 != v62;
  if (v63) {
  } else {
    int v64 = 0;
    int v65 = 0;
    int v66;
    int v67;
    v66 = v64;
    v67 = v65;
    while (true) {
      int v68 = 2;
      bool v69 = v67 < v68;
      v66 = v66;
      v67 = v67;
      if (!v69) break;
      helper0(v55, v53, v58, v61, static_cast<int>(__simt_tid3.x));
      int v70 = 1;
      int v71 = v67 + v70;
      v66 = v66;
      v67 = v71;
    }
  }
  int v72 = 0;
  int v73 = 0;
  int v74;
  int v75;
  v74 = v72;
  v75 = v73;
  while (true) {
    int v76 = 4;
    int v77 = v75 * v76;
    int v78 = v77 + v55;
    int v79 = 8;
    int v80 = v79 + v78;
    int v81 = v54[v80];
    int v82 = 0;
    bool v83 = v81 != v82;
    v74 = v74;
    v75 = v75;
    if (!v83) break;
    int v84 = v74 + v75;
    int v85 = 1;
    int v86 = v75 + v85;
    bool v87 = true;
    int v88 = 16;
    int v89 = 4;
    int v90 = v75 * v89;
    int v91 = v88 + v90;
    int v92 = v91 + v55;
    bool v93 = true;
    int v94 = simt_wave_count_bits(v93);
    v53[v92] = v94;
    v74 = v84;
    v75 = v86;
  }
  int v95 = 28;
  int v96 = v95 + v55;
  int v97 = v54[v96];
  uint v98 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v99 = (int)(v98);
  int v100;
  v100 = v99;
  switch (v97) {
    default:
      {
      int v101 = 32;
      int v102 = v101 + v55;
      int v103 = v54[v102];
      int v104 = 3;
      int v105 = v55 + v104;
      int v106;
      v106 = v105;
      switch (v103) {
        case 0:
          {
          int v107 = 36;
          int v108 = v107 + v55;
          int v109 = v54[v108];
          int v110 = 0;
          bool v111 = v109 != v110;
          int v112;
          if (v111) {
            v112 = v55;
          } else {
            int v113 = 1;
            v112 = v113;
          }
          v106 = v112;
          break;
        }
        case 1:
          {
          int v114 = 2;
          int v115 = v55 + v114;
          v106 = v115;
          break;
        }
        default:
          {
          int v116 = 40;
          int v117 = v116 + v55;
          int v118 = v54[v117];
          int v119 = 3;
          int v120 = v55 + v119;
          int v121;
          v121 = v120;
          switch (v118) {
            default:
              {
              int v122 = 1;
              int v123 = v55 + v122;
              v121 = v123;
            }
            case 0:
              {
              int v124 = 4;
              v121 = v124;
              break;
            }
            case 1:
              {
              int v125 = 3;
              int v126 = v55 + v125;
              v121 = v126;
            }
            case 2:
              {
              int v127 = 0;
              v121 = v127;
              break;
            }
          }
          bool v128 = true;
          v106 = v121;
          break;
        }
        case 2:
          {
          int v129 = 44;
          int v130 = v129 + v55;
          int v131 = v54[v130];
          int v132 = 0;
          bool v133 = v131 != v132;
          int v134;
          if (v133) {
            int v135 = 3;
            int v136 = v55 + v135;
            v134 = v136;
          } else {
            int v137 = 1;
            v134 = v137;
          }
          v106 = v134;
          break;
        }
      }
      v100 = v106;
    }
    case 0:
      {
      int v138 = 0;
      int v139 = 0;
      int v140;
      int v141;
      v140 = v138;
      v141 = v139;
      while (true) {
        int v142 = 4;
        int v143 = v141 * v142;
        int v144 = v143 + v55;
        int v145 = 48;
        int v146 = v145 + v144;
        int v147 = v54[v146];
        int v148 = 0;
        bool v149 = v147 != v148;
        v140 = v140;
        v141 = v141;
        if (!v149) break;
        int v150 = 68;
        int v151 = v150 + v55;
        int v152 = v54[v151];
        int v153 = 4;
        int v154;
        v154 = v153;
        switch (v152) {
          case 0:
            {
            int v155 = 2;
            v154 = v155;
            break;
          }
          default:
            {
            int v156 = 3;
            v154 = v156;
            break;
          }
          case 1:
            {
            int v157 = 0;
            int v158 = v55 + v157;
            v154 = v158;
            break;
          }
        }
        bool v159 = true;
        int v160 = v140 + v154;
        int v161 = 1;
        int v162 = v141 + v161;
        bool v163 = true;
        v140 = v160;
        v141 = v162;
      }
      v100 = v140;
    }
    case 1:
      {
      int v164 = 72;
      int v165 = v164 + v55;
      int v166 = v54[v165];
      int v167 = 2;
      int v168 = v55 + v167;
      int v169;
      v169 = v168;
      switch (v166) {
        default:
          {
          int v170 = 76;
          int v171 = v170 + v55;
          int v172 = v54[v171];
          int v173 = 0;
          bool v174 = v172 != v173;
          int v175;
          if (v174) {
            v175 = v55;
          } else {
            int v176 = 1;
            v175 = v176;
          }
          v169 = v175;
          break;
        }
        case 0:
          {
          int v177 = 0;
          v169 = v177;
          break;
        }
        case 1:
          {
          int v178 = 80;
          int v179 = v178 + v55;
          int v180 = v54[v179];
          int v181 = 2;
          int v182 = v55 + v181;
          int v183;
          v183 = v182;
          switch (v180) {
            case 0:
              {
              int v184 = 0;
              int v185 = v55 + v184;
              v183 = v185;
            }
            case 1:
              {
              int v186 = 2;
              v183 = v186;
            }
            default:
              {
              int v187 = 1;
              int v188 = v55 + v187;
              v183 = v188;
              break;
            }
          }
          bool v189 = true;
          v169 = v183;
          break;
        }
        case 2:
          {
          int v190 = 84;
          int v191 = v190 + v55;
          int v192 = v54[v191];
          int v193;
          v193 = v55;
          switch (v192) {
            default:
              {
              int v194 = 1;
              int v195 = v55 + v194;
              v193 = v195;
            }
            case 0:
              {
              int v196 = 0;
              v193 = v196;
              break;
            }
          }
          v169 = v193;
          break;
        }
      }
      bool v197 = true;
      v100 = v169;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 24; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
