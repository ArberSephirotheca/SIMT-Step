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
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
    break;
    ;
  }
  int v22 = 3;
  int v23 = v3 % v22;
  int v24 = 4;
  int v25;
  v25 = v24;
  switch (v23) {
    case 0:
      {
      int v26 = 4;
      int v27 = v3 % v26;
      int v28 = 4;
      int v29;
      v29 = v28;
      switch (v27) {
        default:
          {
          v29 = v0;
        }
        case 0:
          {
          int v30 = 4;
          int v31 = v0 + v30;
          v29 = v31;
          break;
        }
        case 1:
          {
          int v32 = 1;
          int v33 = v0 + v32;
          int v34;
          v34 = v33;
          switch (v3) {
            default:
              {
              v34 = v0;
              break;
            }
            case 0:
              {
              v34 = v0;
              break;
            }
          }
          int v35 = 2;
          v29 = v34;
          break;
        }
        case 2:
          {
          int v36 = 2;
          int v37 = v3 % v36;
          int v38 = 3;
          int v39;
          v39 = v38;
          switch (v37) {
            case 0:
              {
              int v40 = 1;
              int v41 = v0 + v40;
              v39 = v41;
            }
            default:
              {
              int v42 = 4;
              int v43 = v0 + v42;
              v39 = v43;
              break;
            }
          }
          int v44 = 2;
          v29 = v39;
          break;
        }
      }
      int v45 = 1;
      v25 = v29;
      break;
    }
    case 1:
      {
      int v46 = 0;
      int v47 = 0;
      int v48;
      int v49;
      v48 = v46;
      v49 = v47;
      while (true) {
        int v50 = 4;
        int v51 = v3 % v50;
        int v52 = 1;
        int v53 = v51 + v52;
        bool v54 = v49 < v53;
        v48 = v48;
        v49 = v49;
        if (!v54) break;
        int v55 = 2;
        int v56 = 1;
        int v57 = v49 + v56;
        v48 = v55;
        v49 = v57;
      }
      v25 = v48;
      break;
    }
    default:
      {
      int v58 = 0;
      int v59 = 0;
      int v60;
      int v61;
      v60 = v58;
      v61 = v59;
      while (true) {
        int v62 = 4;
        int v63 = v3 % v62;
        int v64 = 1;
        int v65 = v63 + v64;
        bool v66 = v61 < v65;
        v60 = v60;
        v61 = v61;
        if (!v66) break;
        int v67 = 3;
        int v68 = v3 % v67;
        int v69 = 3;
        int v70;
        v70 = v69;
        switch (v68) {
          default:
            {
            int v71 = 4;
            int v72 = v0 + v71;
            v70 = v72;
            break;
          }
          case 0:
            {
            int v73 = 0;
            int v74 = v0 + v73;
            v70 = v74;
            break;
          }
          case 1:
            {
            v70 = v0;
            break;
          }
        }
        int v75 = 1;
        int v76 = v61 + v75;
        v60 = v70;
        v61 = v76;
        continue;
        ;
      }
      v25 = v60;
      break;
    }
  }
  int v77 = 0;
  bool v78 = v2 != v77;
  int v79 = v78 ? v6 : v25;
  return;
}

kernel void kernel_main(device int* v80 [[buffer(0)]], device int* v81 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v82 = static_cast<int>(__simt_tid3.x);
  int v83 = 0;
  int v84 = v83 + v82;
  int v85 = v81[v84];
  int v86 = 4;
  int v87 = v86 + v82;
  int v88 = v81[v87];
  int v89 = 0;
  bool v90 = v85 != v89;
  if (v90) {
  } else {
    int v91 = 0;
    int v92 = 0;
    int v93;
    int v94;
    v93 = v91;
    v94 = v92;
    while (true) {
      int v95 = 1;
      bool v96 = v94 < v95;
      v93 = v93;
      v94 = v94;
      if (!v96) break;
      helper0(v82, v80, v85, v88, static_cast<int>(__simt_tid3.x));
      int v97 = 1;
      int v98 = v94 + v97;
      v93 = v93;
      v94 = v98;
    }
  }
  int v99 = 8;
  int v100 = v99 + v82;
  int v101 = v81[v100];
  int v102 = 0;
  int v103;
  v103 = v102;
  switch (v101) {
    case 0:
      {
      int v104 = 12;
      int v105 = v104 + v82;
      int v106 = v81[v105];
      int v107;
      v107 = v82;
      switch (v106) {
        default:
          {
          v107 = v82;
          break;
        }
        case 0:
          {
          int v108 = 0;
          int v109 = 0;
          int v110;
          int v111;
          v110 = v108;
          v111 = v109;
          while (true) {
            int v112 = 4;
            int v113 = v111 * v112;
            int v114 = v113 + v82;
            int v115 = 16;
            int v116 = v115 + v114;
            int v117 = v81[v116];
            int v118 = 0;
            bool v119 = v117 != v118;
            v110 = v110;
            v111 = v111;
            if (!v119) break;
            int v120 = v110 + v111;
            int v121 = 1;
            int v122 = v111 + v121;
            bool v123 = true;
            v110 = v120;
            v111 = v122;
            continue;
            ;
          }
          v107 = v110;
        }
        case 1:
          {
          int v124 = 36;
          int v125 = v124 + v82;
          int v126 = v81[v125];
          int v127 = 4;
          int v128 = v82 + v127;
          int v129;
          v129 = v128;
          switch (v126) {
            default:
              {
              int v130 = 3;
              v129 = v130;
              break;
            }
            case 0:
              {
              int v131 = 4;
              int v132 = v82 + v131;
              v129 = v132;
              break;
            }
          }
          v107 = v129;
          break;
        }
      }
      bool v133 = true;
      v103 = v107;
      break;
    }
    default:
      {
      int v134 = 0;
      int v135 = 0;
      int v136;
      int v137;
      v136 = v134;
      v137 = v135;
      while (true) {
        int v138 = 4;
        int v139 = v137 * v138;
        int v140 = v139 + v82;
        int v141 = 40;
        int v142 = v141 + v140;
        int v143 = v81[v142];
        int v144 = 0;
        bool v145 = v143 != v144;
        v136 = v136;
        v137 = v137;
        if (!v145) break;
        int v146 = v136 + v137;
        int v147 = 1;
        int v148 = v137 + v147;
        bool v149 = true;
        v136 = v146;
        v137 = v148;
      }
      v103 = v136;
      break;
    }
    case 1:
      {
      v103 = v82;
      break;
    }
    case 2:
      {
      int v150 = 2;
      v103 = v150;
      break;
    }
  }
  bool v151 = true;
  int v152 = 16;
  int v153 = v152 + v82;
  bool v154 = true;
  int v155 = simt_wave_count_bits(v154);
  v80[v153] = v155;
  int v156 = 60;
  int v157 = v156 + v82;
  int v158 = v81[v157];
  uint v159 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v160 = (int)(v159);
  int v161;
  v161 = v160;
  switch (v158) {
    case 0:
      {
      int v162 = 0;
      int v163 = v82 + v162;
      v161 = v163;
      break;
    }
    case 1:
      {
      int v164 = 3;
      v161 = v164;
    }
    default:
      {
      int v165 = 64;
      int v166 = v165 + v82;
      int v167 = v81[v166];
      int v168 = 0;
      bool v169 = v167 != v168;
      int v170;
      if (v169) {
        int v171 = 68;
        int v172 = v171 + v82;
        int v173 = v81[v172];
        int v174 = 0;
        bool v175 = v173 != v174;
        int v176;
        if (v175) {
          v176 = v82;
        } else {
          int v177 = 2;
          int v178 = v82 + v177;
          v176 = v178;
        }
        v170 = v176;
      } else {
        int v179 = 72;
        int v180 = v179 + v82;
        int v181 = v81[v180];
        int v182 = 0;
        int v183 = v82 + v182;
        int v184;
        v184 = v183;
        switch (v181) {
          case 0:
            {
            int v185 = 0;
            v184 = v185;
            break;
          }
          default:
            {
            int v186 = 4;
            v184 = v186;
            break;
          }
        }
        v170 = v184;
      }
      v161 = v170;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
