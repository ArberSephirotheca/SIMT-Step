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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      int v10 = 0;
      int v11;
      int v12;
      v11 = v9;
      v12 = v10;
      while (true) {
        int v13 = 4;
        int v14 = v3 % v13;
        int v15 = 1;
        int v16 = v14 + v15;
        bool v17 = v12 < v16;
        v11 = v11;
        v12 = v12;
        if (!v17) break;
        int v18 = 4;
        int v19 = v0 + v18;
        int v20;
        v20 = v19;
        switch (v3) {
          case 0:
            {
            int v21 = 1;
            int v22 = v0 + v21;
            v20 = v22;
            break;
          }
          default:
            {
            int v23 = 4;
            v20 = v23;
            break;
          }
        }
        int v24 = 1;
        int v25 = v12 + v24;
        v11 = v20;
        v12 = v25;
        continue;
        ;
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v26 = 1;
      int v27 = v0 + v26;
      int v28;
      v28 = v27;
      switch (v3) {
        case 0:
          {
          v28 = v0;
        }
        default:
          {
          int v29 = 0;
          int v30 = 0;
          int v31;
          int v32;
          v31 = v29;
          v32 = v30;
          while (true) {
            int v33 = 4;
            int v34 = v3 % v33;
            int v35 = 1;
            int v36 = v34 + v35;
            bool v37 = v32 < v36;
            v31 = v31;
            v32 = v32;
            if (!v37) break;
            int v38 = 3;
            int v39 = 1;
            int v40 = v32 + v39;
            v31 = v38;
            v32 = v40;
          }
          v28 = v31;
          break;
        }
      }
      v8 = v28;
      break;
    }
    default:
      {
      int v41 = 4;
      int v42 = v3 % v41;
      int v43;
      v43 = v0;
      switch (v42) {
        case 0:
          {
          int v44 = 0;
          bool v45 = v2 != v44;
          int v46;
          if (v45) {
            int v47 = 3;
            int v48 = v0 + v47;
            v46 = v48;
          } else {
            int v49 = 3;
            int v50 = v0 + v49;
            v46 = v50;
          }
          v43 = v46;
          break;
        }
        default:
          {
          int v51 = 2;
          int v52 = v3 % v51;
          int v53 = 0;
          int v54;
          v54 = v53;
          switch (v52) {
            case 0:
              {
              int v55 = 4;
              int v56 = v0 + v55;
              v54 = v56;
            }
            default:
              {
              v54 = v0;
            }
            case 1:
              {
              v54 = v0;
              break;
            }
          }
          int v57 = 0;
          v43 = v54;
          break;
        }
        case 1:
          {
          int v58 = 2;
          int v59 = v3 % v58;
          int v60 = 0;
          int v61;
          v61 = v60;
          switch (v59) {
            default:
              {
              int v62 = 0;
              v61 = v62;
              break;
            }
            case 0:
              {
              int v63 = 2;
              v61 = v63;
              break;
            }
          }
          v43 = v61;
          break;
        }
        case 2:
          {
          int v64 = 0;
          bool v65 = v2 != v64;
          int v66;
          if (v65) {
            int v67 = 4;
            v66 = v67;
          } else {
            v66 = v0;
          }
          v43 = v66;
          break;
        }
      }
      v8 = v43;
      break;
    }
  }
  bool v68 = true;
  int v69 = simt_wave_count_bits(v68);
  int v70 = 0;
  int v71 = v70 + v0;
  v1[v71] = v69;
  return;
}

kernel void kernel_main(device int* v72 [[buffer(0)]], device int* v73 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v74 = static_cast<int>(__simt_tid3.x);
  int v75 = 0;
  int v76 = v75 + v74;
  int v77 = v73[v76];
  int v78 = 4;
  int v79 = v78 + v74;
  int v80 = v73[v79];
  helper0(v74, v72, v77, v80, static_cast<int>(__simt_tid3.x));
  int v81 = 8;
  int v82 = v81 + v74;
  int v83 = v73[v82];
  int v84 = 0;
  bool v85 = v83 != v84;
  int v86;
  if (v85) {
    int v87 = 12;
    int v88 = v87 + v74;
    int v89 = v73[v88];
    int v90 = 2;
    int v91;
    v91 = v90;
    switch (v89) {
      default:
        {
        int v92 = 16;
        int v93 = v92 + v74;
        int v94 = v73[v93];
        int v95 = 0;
        bool v96 = v94 != v95;
        int v97;
        if (v96) {
          int v98 = 0;
          v97 = v98;
        } else {
          int v99 = 2;
          v97 = v99;
        }
        v91 = v97;
        break;
      }
      case 0:
        {
        int v100 = 20;
        int v101 = v100 + v74;
        int v102 = v73[v101];
        int v103 = 1;
        int v104;
        v104 = v103;
        switch (v102) {
          default:
            {
            v104 = v74;
            break;
          }
          case 0:
            {
            int v105 = 0;
            v104 = v105;
            break;
          }
        }
        v91 = v104;
        break;
      }
      case 1:
        {
        int v106 = 24;
        int v107 = v106 + v74;
        int v108 = v73[v107];
        int v109;
        v109 = v74;
        switch (v108) {
          case 0:
            {
            v109 = v74;
          }
          default:
            {
            int v110 = 0;
            int v111 = v74 + v110;
            v109 = v111;
            break;
          }
          case 1:
            {
            int v112 = 1;
            int v113 = v74 + v112;
            v109 = v113;
            break;
          }
        }
        v91 = v109;
        break;
      }
      case 2:
        {
        int v114 = 28;
        int v115 = v114 + v74;
        int v116 = v73[v115];
        int v117 = 1;
        int v118 = v74 + v117;
        int v119;
        v119 = v118;
        switch (v116) {
          default:
            {
            int v120 = 2;
            v119 = v120;
          }
          case 0:
            {
            int v121 = 4;
            int v122 = v74 + v121;
            v119 = v122;
          }
          case 1:
            {
            v119 = v74;
            break;
          }
          case 2:
            {
            int v123 = 3;
            int v124 = v74 + v123;
            v119 = v124;
            break;
          }
        }
        v91 = v119;
        break;
      }
    }
    v86 = v91;
  } else {
    int v125 = 32;
    int v126 = v125 + v74;
    int v127 = v73[v126];
    int v128 = 2;
    int v129 = v74 + v128;
    int v130;
    v130 = v129;
    switch (v127) {
      default:
        {
        int v131 = 36;
        int v132 = v131 + v74;
        int v133 = v73[v132];
        int v134 = 2;
        int v135;
        v135 = v134;
        switch (v133) {
          case 0:
            {
            v135 = v74;
            break;
          }
          default:
            {
            int v136 = 2;
            v135 = v136;
            break;
          }
          case 1:
            {
            v135 = v74;
            break;
          }
        }
        v130 = v135;
        break;
      }
      case 0:
        {
        int v137 = 40;
        int v138 = v137 + v74;
        int v139 = v73[v138];
        int v140;
        v140 = v74;
        switch (v139) {
          case 0:
            {
            int v141 = 4;
            int v142 = v74 + v141;
            v140 = v142;
            break;
          }
          default:
            {
            int v143 = 3;
            v140 = v143;
            break;
          }
        }
        bool v144 = true;
        v130 = v140;
        break;
      }
      case 1:
        {
        int v145 = 44;
        int v146 = v145 + v74;
        int v147 = v73[v146];
        int v148 = 0;
        bool v149 = v147 != v148;
        int v150;
        if (v149) {
          int v151 = 4;
          v150 = v151;
        } else {
          int v152 = 3;
          int v153 = v74 + v152;
          v150 = v153;
        }
        v130 = v150;
        break;
      }
      case 2:
        {
        int v154 = 48;
        int v155 = v154 + v74;
        int v156 = v73[v155];
        int v157 = 0;
        bool v158 = v156 != v157;
        int v159;
        if (v158) {
          int v160 = 3;
          int v161 = v74 + v160;
          v159 = v161;
        } else {
          int v162 = 3;
          int v163 = v74 + v162;
          v159 = v163;
        }
        v130 = v159;
        break;
      }
    }
    v86 = v130;
  }
  int v164 = 16;
  int v165 = v164 + v74;
  bool v166 = true;
  int v167 = simt_wave_count_bits(v166);
  v72[v165] = v167;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
