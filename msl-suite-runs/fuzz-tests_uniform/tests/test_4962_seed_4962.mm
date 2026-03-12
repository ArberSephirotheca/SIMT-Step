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
      int v11 = v0 + v10;
      int v12;
      v12 = v11;
      switch (v3) {
        default:
          {
          v12 = v0;
        }
        case 0:
          {
          v12 = v0;
          break;
        }
      }
      int v13 = 0;
      int v14 = v0 + v13;
      v9 = v12;
    } else {
      int v15 = 0;
      bool v16 = v2 != v15;
      int v17;
      if (v16) {
        v17 = v0;
      } else {
        int v18 = 4;
        int v19 = v0 + v18;
        v17 = v19;
      }
      v9 = v17;
    }
    uint v20 = simt_subgroup_id(__simt_tid);
    int v21 = (int)(v20);
    v6 = v9;
  } else {
    int v22 = 3;
    int v23 = v3 % v22;
    int v24 = 2;
    int v25;
    v25 = v24;
    switch (v23) {
      case 0:
        {
        int v26 = 0;
        int v27 = 0;
        int v28;
        int v29;
        v28 = v26;
        v29 = v27;
        while (true) {
          int v30 = 4;
          int v31 = v3 % v30;
          int v32 = 1;
          int v33 = v31 + v32;
          bool v34 = v29 < v33;
          v28 = v28;
          v29 = v29;
          if (!v34) break;
          int v35 = 1;
          int v36 = v29 + v35;
          v28 = v0;
          v29 = v36;
        }
        v25 = v28;
        break;
      }
      default:
        {
        int v37 = 0;
        int v38 = 0;
        int v39;
        int v40;
        v39 = v37;
        v40 = v38;
        while (true) {
          int v41 = 4;
          int v42 = v3 % v41;
          int v43 = 1;
          int v44 = v42 + v43;
          bool v45 = v40 < v44;
          v39 = v39;
          v40 = v40;
          if (!v45) break;
          int v46 = 1;
          int v47 = v40 + v46;
          v39 = v0;
          v40 = v47;
          break;
          ;
        }
        int v48 = 2;
        int v49 = v0 + v48;
        v25 = v39;
        break;
      }
      case 1:
        {
        int v50 = 2;
        int v51 = v3 % v50;
        int v52;
        v52 = v0;
        switch (v51) {
          case 0:
            {
            int v53 = 2;
            int v54 = v0 + v53;
            v52 = v54;
            break;
          }
          default:
            {
            int v55 = 4;
            v52 = v55;
            break;
          }
          case 1:
            {
            int v56 = 1;
            v52 = v56;
            break;
          }
        }
        int v57 = 2;
        int v58 = v0 + v57;
        v25 = v52;
        break;
      }
    }
    uint v59 = simt_subgroup_id(__simt_tid);
    int v60 = (int)(v59);
    v6 = v25;
  }
  bool v61 = true;
  int v62 = simt_wave_count_bits(v61);
  int v63 = 0;
  int v64 = v63 + v0;
  v1[v64] = v62;
  return;
}

kernel void kernel_main(device int* v65 [[buffer(0)]], device int* v66 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v67 = static_cast<int>(__simt_tid3.x);
  int v68 = 0;
  int v69 = v68 + v67;
  int v70 = v66[v69];
  int v71 = 4;
  int v72 = v71 + v67;
  int v73 = v66[v72];
  helper0(v67, v65, v70, v73, static_cast<int>(__simt_tid3.x));
  int v74 = 8;
  int v75 = v74 + v67;
  int v76 = v66[v75];
  int v77 = 0;
  bool v78 = v76 != v77;
  int v79;
  if (v78) {
    int v80 = 1;
    int v81 = v67 + v80;
    v79 = v81;
  } else {
    int v82 = 3;
    int v83 = v67 + v82;
    v79 = v83;
  }
  int v84 = 16;
  int v85 = v84 + v67;
  bool v86 = true;
  int v87 = simt_wave_count_bits(v86);
  v65[v85] = v87;
  int v88 = 12;
  int v89 = v88 + v67;
  int v90 = v66[v89];
  int v91 = 1;
  int v92;
  v92 = v91;
  switch (v90) {
    case 0:
      {
      int v93 = 0;
      int v94 = 0;
      int v95;
      int v96;
      v95 = v93;
      v96 = v94;
      while (true) {
        int v97 = 4;
        int v98 = v96 * v97;
        int v99 = v98 + v67;
        int v100 = 16;
        int v101 = v100 + v99;
        int v102 = v66[v101];
        int v103 = 0;
        bool v104 = v102 != v103;
        v95 = v95;
        v96 = v96;
        if (!v104) break;
        int v105 = 36;
        int v106 = v105 + v67;
        int v107 = v66[v106];
        int v108 = 0;
        bool v109 = v107 != v108;
        int v110;
        if (v109) {
          int v111 = 0;
          int v112 = v67 + v111;
          v110 = v112;
        } else {
          v110 = v67;
        }
        int v113 = v95 + v110;
        int v114 = 1;
        int v115 = v96 + v114;
        v95 = v113;
        v96 = v115;
      }
      bool v116 = true;
      v92 = v95;
      break;
    }
    case 1:
      {
      int v117 = 40;
      int v118 = v117 + v67;
      int v119 = v66[v118];
      int v120 = 4;
      int v121;
      v121 = v120;
      switch (v119) {
        default:
          {
          int v122 = 0;
          int v123 = v67 + v122;
          v121 = v123;
          break;
        }
        case 0:
          {
          int v124 = 44;
          int v125 = v124 + v67;
          int v126 = v66[v125];
          int v127 = 0;
          bool v128 = v126 != v127;
          int v129;
          if (v128) {
            v129 = v67;
          } else {
            int v130 = 0;
            v129 = v130;
          }
          v121 = v129;
          break;
        }
      }
      bool v131 = true;
      v92 = v121;
      break;
    }
    case 2:
      {
      int v132 = 48;
      int v133 = v132 + v67;
      int v134 = v66[v133];
      int v135 = 0;
      int v136 = v67 + v135;
      int v137;
      v137 = v136;
      switch (v134) {
        default:
          {
          int v138 = 52;
          int v139 = v138 + v67;
          int v140 = v66[v139];
          int v141 = 1;
          int v142 = v67 + v141;
          int v143;
          v143 = v142;
          switch (v140) {
            case 0:
              {
              int v144 = 1;
              int v145 = v67 + v144;
              v143 = v145;
              break;
            }
            case 1:
              {
              int v146 = 3;
              int v147 = v67 + v146;
              v143 = v147;
              break;
            }
            case 2:
              {
              int v148 = 1;
              int v149 = v67 + v148;
              v143 = v149;
              break;
            }
            default:
              {
              v143 = v67;
              break;
            }
          }
          bool v150 = true;
          v137 = v143;
          break;
        }
        case 0:
          {
          int v151 = 56;
          int v152 = v151 + v67;
          int v153 = v66[v152];
          int v154 = 0;
          bool v155 = v153 != v154;
          int v156;
          if (v155) {
            v156 = v67;
          } else {
            int v157 = 4;
            int v158 = v67 + v157;
            v156 = v158;
          }
          v137 = v156;
          break;
        }
      }
      bool v159 = true;
      v92 = v137;
      break;
    }
    default:
      {
      int v160 = 60;
      int v161 = v160 + v67;
      int v162 = v66[v161];
      int v163 = 0;
      int v164;
      v164 = v163;
      switch (v162) {
        default:
          {
          int v165 = 64;
          int v166 = v165 + v67;
          int v167 = v66[v166];
          int v168 = 3;
          int v169;
          v169 = v168;
          switch (v167) {
            case 0:
              {
              v169 = v67;
              break;
            }
            case 1:
              {
              int v170 = 2;
              int v171 = v67 + v170;
              v169 = v171;
              break;
            }
            default:
              {
              int v172 = 4;
              int v173 = v67 + v172;
              v169 = v173;
              break;
            }
          }
          bool v174 = true;
          v164 = v169;
          break;
        }
        case 0:
          {
          int v175 = 68;
          int v176 = v175 + v67;
          int v177 = v66[v176];
          int v178 = 0;
          bool v179 = v177 != v178;
          int v180;
          if (v179) {
            int v181 = 3;
            int v182 = v67 + v181;
            v180 = v182;
          } else {
            v180 = v67;
          }
          v164 = v180;
          break;
        }
        case 1:
          {
          int v183 = 4;
          int v184 = v67 + v183;
          v164 = v184;
          break;
        }
        case 2:
          {
          int v185 = 72;
          int v186 = v185 + v67;
          int v187 = v66[v186];
          int v188 = 0;
          bool v189 = v187 != v188;
          int v190;
          if (v189) {
            v190 = v67;
          } else {
            int v191 = 4;
            int v192 = v67 + v191;
            v190 = v192;
          }
          v164 = v190;
          break;
        }
      }
      bool v193 = true;
      v92 = v164;
      break;
    }
  }
  bool v194 = true;
  int v195 = 32;
  int v196 = v195 + v67;
  bool v197 = true;
  int v198 = simt_wave_count_bits(v197);
  v65[v196] = v198;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
