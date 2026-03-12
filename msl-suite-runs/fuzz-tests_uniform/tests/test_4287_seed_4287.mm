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
  int v4 = 2;
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11 = 3;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        case 0:
          {
          int v14 = 2;
          int v15 = v3 % v14;
          int v16;
          v16 = v0;
          switch (v15) {
            default:
              {
              v16 = v0;
              break;
            }
            case 0:
              {
              v16 = v0;
              break;
            }
          }
          int v17 = 3;
          int v18 = v0 + v17;
          v13 = v16;
          break;
        }
        case 1:
          {
          int v19 = 0;
          bool v20 = v2 != v19;
          int v21;
          if (v20) {
            int v22 = 0;
            int v23 = v0 + v22;
            v21 = v23;
          } else {
            int v24 = 4;
            int v25 = v0 + v24;
            v21 = v25;
          }
          v13 = v21;
          break;
        }
        default:
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
            int v36 = v0 + v35;
            int v37 = 1;
            int v38 = v29 + v37;
            v28 = v36;
            v29 = v38;
          }
          int v39 = 1;
          v13 = v28;
          break;
        }
        case 2:
          {
          v13 = v0;
          break;
        }
      }
      int v40 = 0;
      int v41 = v0 + v40;
      v8 = v13;
      break;
    }
    case 0:
      {
      int v42 = 3;
      int v43 = v3 % v42;
      int v44 = 3;
      int v45;
      v45 = v44;
      switch (v43) {
        default:
          {
          int v46 = 2;
          int v47 = v3 % v46;
          int v48 = 3;
          int v49;
          v49 = v48;
          switch (v47) {
            case 0:
              {
              int v50 = 1;
              int v51 = v0 + v50;
              v49 = v51;
              break;
            }
            default:
              {
              int v52 = 0;
              int v53 = v0 + v52;
              v49 = v53;
            }
            case 1:
              {
              v49 = v0;
              break;
            }
          }
          int v54 = 2;
          v45 = v49;
          break;
        }
        case 0:
          {
          int v55 = 2;
          int v56 = v3 % v55;
          int v57 = 4;
          int v58;
          v58 = v57;
          switch (v56) {
            default:
              {
              v58 = v0;
              break;
            }
            case 0:
              {
              v58 = v0;
              break;
            }
          }
          int v59 = 2;
          v45 = v58;
          break;
        }
        case 1:
          {
          v45 = v0;
          break;
        }
        case 2:
          {
          int v60 = 2;
          v45 = v60;
          break;
        }
      }
      v8 = v45;
      break;
    }
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
  uint v77 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v78 = (int)(v77);
  int v79;
  v79 = v78;
  switch (v76) {
    default:
      {
      int v80 = 12;
      int v81 = v80 + v67;
      int v82 = v66[v81];
      int v83 = 0;
      bool v84 = v82 != v83;
      int v85;
      if (v84) {
        int v86 = 16;
        int v87 = v86 + v67;
        int v88 = v66[v87];
        int v89;
        v89 = v67;
        switch (v88) {
          case 0:
            {
            v89 = v67;
            break;
          }
          case 1:
            {
            v89 = v67;
          }
          default:
            {
            int v90 = 4;
            v89 = v90;
            break;
          }
          case 2:
            {
            v89 = v67;
            break;
          }
        }
        bool v91 = true;
        v85 = v89;
      } else {
        int v92 = 20;
        int v93 = v92 + v67;
        int v94 = v66[v93];
        int v95 = 0;
        bool v96 = v94 != v95;
        int v97;
        if (v96) {
          int v98 = 0;
          int v99 = v67 + v98;
          v97 = v99;
        } else {
          int v100 = 2;
          int v101 = v67 + v100;
          v97 = v101;
        }
        v85 = v97;
      }
      v79 = v85;
    }
    case 0:
      {
      int v102 = 24;
      int v103 = v102 + v67;
      int v104 = v66[v103];
      int v105 = 1;
      int v106 = v67 + v105;
      int v107;
      v107 = v106;
      switch (v104) {
        case 0:
          {
          int v108 = 4;
          int v109 = v67 + v108;
          v107 = v109;
          break;
        }
        default:
          {
          int v110 = 28;
          int v111 = v110 + v67;
          int v112 = v66[v111];
          int v113 = 1;
          int v114 = v67 + v113;
          int v115;
          v115 = v114;
          switch (v112) {
            default:
              {
              v115 = v67;
              break;
            }
            case 0:
              {
              int v116 = 2;
              v115 = v116;
              break;
            }
            case 1:
              {
              int v117 = 2;
              v115 = v117;
              break;
            }
          }
          bool v118 = true;
          v107 = v115;
          break;
        }
        case 1:
          {
          int v119 = 32;
          int v120 = v119 + v67;
          int v121 = v66[v120];
          int v122 = 1;
          int v123;
          v123 = v122;
          switch (v121) {
            default:
              {
              int v124 = 4;
              int v125 = v67 + v124;
              v123 = v125;
              break;
            }
            case 0:
              {
              v123 = v67;
              break;
            }
            case 1:
              {
              v123 = v67;
              break;
            }
            case 2:
              {
              int v126 = 1;
              int v127 = v67 + v126;
              v123 = v127;
              break;
            }
          }
          bool v128 = true;
          v107 = v123;
          break;
        }
        case 2:
          {
          int v129 = 0;
          int v130 = 0;
          int v131;
          int v132;
          v131 = v129;
          v132 = v130;
          while (true) {
            int v133 = 4;
            int v134 = v132 * v133;
            int v135 = v134 + v67;
            int v136 = 36;
            int v137 = v136 + v135;
            int v138 = v66[v137];
            int v139 = 0;
            bool v140 = v138 != v139;
            v131 = v131;
            v132 = v132;
            if (!v140) break;
            int v141 = v131 + v132;
            int v142 = 1;
            int v143 = v132 + v142;
            v131 = v141;
            v132 = v143;
            break;
            ;
          }
          bool v144 = true;
          v107 = v131;
          break;
        }
      }
      bool v145 = true;
      v79 = v107;
      break;
    }
  }
  bool v146 = true;
  int v147 = 16;
  int v148 = v147 + v67;
  bool v149 = true;
  int v150 = simt_wave_count_bits(v149);
  v65[v148] = v150;
  int v151 = 56;
  int v152 = v151 + v67;
  int v153 = v66[v152];
  int v154 = 1;
  int v155 = v67 + v154;
  int v156;
  v156 = v155;
  switch (v153) {
    default:
      {
      int v157 = 60;
      int v158 = v157 + v67;
      int v159 = v66[v158];
      int v160 = 0;
      bool v161 = v159 != v160;
      int v162;
      if (v161) {
        int v163 = 64;
        int v164 = v163 + v67;
        int v165 = v66[v164];
        int v166 = 0;
        int v167 = v67 + v166;
        int v168;
        v168 = v167;
        switch (v165) {
          default:
            {
            int v169 = 0;
            v168 = v169;
            break;
          }
          case 0:
            {
            v168 = v67;
            break;
          }
        }
        bool v170 = true;
        v162 = v168;
      } else {
        int v171 = 68;
        int v172 = v171 + v67;
        int v173 = v66[v172];
        int v174;
        v174 = v67;
        switch (v173) {
          case 0:
            {
            int v175 = 1;
            int v176 = v67 + v175;
            v174 = v176;
            break;
          }
          case 1:
            {
            int v177 = 1;
            v174 = v177;
            break;
          }
          default:
            {
            int v178 = 2;
            v174 = v178;
            break;
          }
        }
        bool v179 = true;
        v162 = v174;
      }
      v156 = v162;
    }
    case 0:
      {
      int v180 = 2;
      int v181 = v67 + v180;
      v156 = v181;
      break;
    }
  }
  bool v182 = true;
  int v183 = 32;
  int v184 = v183 + v67;
  bool v185 = true;
  int v186 = simt_wave_count_bits(v185);
  v65[v184] = v186;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
