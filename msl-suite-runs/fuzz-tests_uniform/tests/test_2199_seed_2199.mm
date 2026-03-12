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
        int v15 = 3;
        int v16 = v3 % v15;
        int v17 = 2;
        int v18;
        v18 = v17;
        switch (v16) {
          case 0:
            {
            int v19 = 1;
            int v20 = v0 + v19;
            v18 = v20;
            break;
          }
          default:
            {
            int v21 = 0;
            int v22 = v0 + v21;
            v18 = v22;
            break;
          }
          case 1:
            {
            int v23 = 4;
            v18 = v23;
            break;
          }
        }
        int v24 = 2;
        int v25 = 1;
        int v26 = v9 + v25;
        v8 = v18;
        v9 = v26;
        break;
        ;
      }
      int v27 = 2;
      int v28 = v0 + v27;
      v5 = v8;
    }
    default:
      {
      int v29 = 0;
      bool v30 = v2 != v29;
      int v31;
      if (v30) {
        int v32 = 0;
        bool v33 = v2 != v32;
        int v34;
        if (v33) {
          int v35 = 2;
          int v36 = v0 + v35;
          v34 = v36;
        } else {
          v34 = v0;
        }
        int v37 = 2;
        int v38 = v0 + v37;
        v31 = v34;
      } else {
        int v39 = 0;
        bool v40 = v2 != v39;
        int v41;
        if (v40) {
          int v42 = 3;
          int v43 = v0 + v42;
          v41 = v43;
        } else {
          int v44 = 0;
          int v45 = v0 + v44;
          v41 = v45;
        }
        v31 = v41;
      }
      v5 = v31;
      break;
    }
  }
  bool v46 = true;
  int v47 = simt_wave_count_bits(v46);
  int v48 = 0;
  int v49 = v48 + v0;
  v1[v49] = v47;
  return;
}

kernel void kernel_main(device int* v50 [[buffer(0)]], device int* v51 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v52 = static_cast<int>(__simt_tid3.x);
  int v53 = 0;
  int v54 = v53 + v52;
  int v55 = v51[v54];
  int v56 = 4;
  int v57 = v56 + v52;
  int v58 = v51[v57];
  helper0(v52, v50, v55, v58, static_cast<int>(__simt_tid3.x));
  int v59 = 8;
  int v60 = v59 + v52;
  int v61 = v51[v60];
  int v62 = 0;
  bool v63 = v61 != v62;
  int v64;
  if (v63) {
    int v65 = 12;
    int v66 = v65 + v52;
    int v67 = v51[v66];
    int v68 = 0;
    bool v69 = v67 != v68;
    int v70;
    if (v69) {
      v70 = v52;
    } else {
      int v71 = 16;
      int v72 = v71 + v52;
      int v73 = v51[v72];
      uint v74 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v75 = (int)(v74);
      int v76;
      v76 = v75;
      switch (v73) {
        default:
          {
          v76 = v52;
        }
        case 0:
          {
          int v77 = 1;
          int v78 = v52 + v77;
          v76 = v78;
          break;
        }
        case 1:
          {
          int v79 = 4;
          v76 = v79;
          break;
        }
        case 2:
          {
          v76 = v52;
          break;
        }
      }
      bool v80 = true;
      v70 = v76;
    }
    v64 = v70;
  } else {
    int v81 = 20;
    int v82 = v81 + v52;
    int v83 = v51[v82];
    int v84;
    v84 = v52;
    switch (v83) {
      case 0:
        {
        int v85 = 24;
        int v86 = v85 + v52;
        int v87 = v51[v86];
        int v88 = 0;
        bool v89 = v87 != v88;
        int v90;
        if (v89) {
          int v91 = 3;
          int v92 = v52 + v91;
          v90 = v92;
        } else {
          int v93 = 1;
          int v94 = v52 + v93;
          v90 = v94;
        }
        v84 = v90;
        break;
      }
      case 1:
        {
        int v95 = 2;
        int v96 = v52 + v95;
        v84 = v96;
        break;
      }
      default:
        {
        v84 = v52;
        break;
      }
      case 2:
        {
        v84 = v52;
        break;
      }
    }
    bool v97 = true;
    v64 = v84;
  }
  int v98 = 16;
  int v99 = v98 + v52;
  bool v100 = true;
  int v101 = simt_wave_count_bits(v100);
  v50[v99] = v101;
  int v102 = 0;
  int v103 = 0;
  int v104;
  int v105;
  v104 = v102;
  v105 = v103;
  while (true) {
    int v106 = 4;
    int v107 = v105 * v106;
    int v108 = v107 + v52;
    int v109 = 28;
    int v110 = v109 + v108;
    int v111 = v51[v110];
    int v112 = 0;
    bool v113 = v111 != v112;
    v104 = v104;
    v105 = v105;
    if (!v113) break;
    int v114 = v104 + v105;
    int v115 = 1;
    int v116 = v105 + v115;
    v104 = v114;
    v105 = v116;
    break;
    ;
  }
  bool v117 = true;
  int v118 = 32;
  int v119 = v118 + v52;
  bool v120 = true;
  int v121 = simt_wave_count_bits(v120);
  v50[v119] = v121;
  int v122 = 48;
  int v123 = v122 + v52;
  int v124 = v51[v123];
  int v125 = 0;
  int v126;
  v126 = v125;
  switch (v124) {
    case 0:
      {
      int v127 = 52;
      int v128 = v127 + v52;
      int v129 = v51[v128];
      int v130;
      v130 = v52;
      switch (v129) {
        case 0:
          {
          int v131 = 56;
          int v132 = v131 + v52;
          int v133 = v51[v132];
          int v134 = 1;
          int v135 = v52 + v134;
          int v136;
          v136 = v135;
          switch (v133) {
            default:
              {
              int v137 = 2;
              v136 = v137;
              break;
            }
            case 0:
              {
              int v138 = 0;
              v136 = v138;
              break;
            }
          }
          bool v139 = true;
          v130 = v136;
        }
        case 1:
          {
          int v140 = 60;
          int v141 = v140 + v52;
          int v142 = v51[v141];
          int v143 = 2;
          int v144 = v52 + v143;
          int v145;
          v145 = v144;
          switch (v142) {
            default:
              {
              int v146 = 4;
              v145 = v146;
              break;
            }
            case 0:
              {
              v145 = v52;
              break;
            }
            case 1:
              {
              v145 = v52;
              break;
            }
          }
          bool v147 = true;
          v130 = v145;
          break;
        }
        default:
          {
          int v148 = 1;
          v130 = v148;
          break;
        }
        case 2:
          {
          int v149 = 64;
          int v150 = v149 + v52;
          int v151 = v51[v150];
          int v152 = 0;
          bool v153 = v151 != v152;
          int v154;
          if (v153) {
            int v155 = 0;
            v154 = v155;
          } else {
            int v156 = 2;
            v154 = v156;
          }
          v130 = v154;
          break;
        }
      }
      bool v157 = true;
      v126 = v130;
      break;
    }
    default:
      {
      v126 = v52;
      break;
    }
    case 1:
      {
      int v158 = 68;
      int v159 = v158 + v52;
      int v160 = v51[v159];
      int v161 = 0;
      bool v162 = v160 != v161;
      int v163;
      if (v162) {
        int v164 = 72;
        int v165 = v164 + v52;
        int v166 = v51[v165];
        int v167 = 0;
        bool v168 = v166 != v167;
        int v169;
        if (v168) {
          int v170 = 3;
          int v171 = v52 + v170;
          v169 = v171;
        } else {
          v169 = v52;
        }
        v163 = v169;
      } else {
        int v172 = 76;
        int v173 = v172 + v52;
        int v174 = v51[v173];
        int v175 = 4;
        int v176 = v52 + v175;
        int v177;
        v177 = v176;
        switch (v174) {
          case 0:
            {
            v177 = v52;
            break;
          }
          default:
            {
            int v178 = 0;
            v177 = v178;
            break;
          }
          case 1:
            {
            int v179 = 0;
            int v180 = v52 + v179;
            v177 = v180;
            break;
          }
          case 2:
            {
            v177 = v52;
            break;
          }
        }
        bool v181 = true;
        v163 = v177;
      }
      v126 = v163;
      break;
    }
  }
  bool v182 = true;
  int v183 = 48;
  int v184 = v183 + v52;
  bool v185 = true;
  int v186 = simt_wave_count_bits(v185);
  v50[v184] = v186;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
