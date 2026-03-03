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
      int v7 = 3;
      v6 = v7;
      break;
    }
    case 1:
      {
      int v8 = 0;
      int v9 = 0;
      int v10;
      int v11;
      v10 = v8;
      v11 = v9;
      while (true) {
        int v12 = 4;
        int v13 = v3 % v12;
        int v14 = 1;
        int v15 = v13 + v14;
        bool v16 = v11 < v15;
        v10 = v10;
        v11 = v11;
        if (!v16) break;
        int v17 = 3;
        int v18 = 1;
        int v19 = v11 + v18;
        v10 = v17;
        v11 = v19;
      }
      int v20 = 3;
      v6 = v10;
    }
    default:
      {
      int v21 = 3;
      int v22 = v3 % v21;
      int v23 = 2;
      int v24;
      v24 = v23;
      switch (v22) {
        case 0:
          {
          int v25 = 2;
          int v26 = v3 % v25;
          int v27;
          v27 = v0;
          switch (v26) {
            case 0:
              {
              v27 = v0;
              break;
            }
            default:
              {
              int v28 = 3;
              int v29 = v0 + v28;
              v27 = v29;
              break;
            }
          }
          v24 = v27;
          break;
        }
        default:
          {
          int v30;
          v30 = v0;
          switch (v3) {
            default:
              {
              int v31 = 1;
              v30 = v31;
              break;
            }
            case 0:
              {
              v30 = v0;
              break;
            }
          }
          int v32 = 1;
          int v33 = v0 + v32;
          v24 = v30;
        }
        case 1:
          {
          int v34 = 0;
          v24 = v34;
          break;
        }
        case 2:
          {
          int v35 = 0;
          int v36 = 0;
          int v37;
          int v38;
          v37 = v35;
          v38 = v36;
          while (true) {
            int v39 = 4;
            int v40 = v3 % v39;
            int v41 = 1;
            int v42 = v40 + v41;
            bool v43 = v38 < v42;
            v37 = v37;
            v38 = v38;
            if (!v43) break;
            int v44 = 1;
            int v45 = 1;
            int v46 = v38 + v45;
            v37 = v44;
            v38 = v46;
          }
          v24 = v37;
          break;
        }
      }
      int v47 = 1;
      v6 = v24;
      break;
    }
    case 2:
      {
      int v48 = 0;
      bool v49 = v2 != v48;
      int v50;
      if (v49) {
        int v51 = 0;
        int v52 = 0;
        int v53;
        int v54;
        v53 = v51;
        v54 = v52;
        while (true) {
          int v55 = 4;
          int v56 = v3 % v55;
          int v57 = 1;
          int v58 = v56 + v57;
          bool v59 = v54 < v58;
          v53 = v53;
          v54 = v54;
          if (!v59) break;
          int v60 = 2;
          int v61 = v0 + v60;
          int v62 = 1;
          int v63 = v54 + v62;
          v53 = v61;
          v54 = v63;
          continue;
          ;
        }
        int v64 = 3;
        int v65 = v0 + v64;
        v50 = v53;
      } else {
        int v66 = 2;
        int v67 = v3 % v66;
        int v68 = 2;
        int v69;
        v69 = v68;
        switch (v67) {
          case 0:
            {
            int v70 = 0;
            v69 = v70;
          }
          default:
            {
            v69 = v0;
            break;
          }
          case 1:
            {
            v69 = v0;
            break;
          }
        }
        int v71 = 2;
        v50 = v69;
      }
      v6 = v50;
      break;
    }
  }
  bool v72 = true;
  int v73 = simt_wave_count_bits(v72);
  int v74 = 0;
  int v75 = v74 + v0;
  v1[v75] = v73;
  return;
}

kernel void kernel_main(device int* v76 [[buffer(0)]], device int* v77 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v78 = static_cast<int>(__simt_tid3.x);
  int v79 = 0;
  int v80 = v79 + v78;
  int v81 = v77[v80];
  int v82 = 4;
  int v83 = v82 + v78;
  int v84 = v77[v83];
  helper0(v78, v76, v81, v84, static_cast<int>(__simt_tid3.x));
  uint v85 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v86 = (int)(v85);
  int v87 = 8;
  int v88 = v87 + v78;
  int v89 = v77[v88];
  int v90 = 2;
  int v91;
  v91 = v90;
  switch (v89) {
    case 0:
      {
      int v92 = 0;
      int v93 = 0;
      int v94;
      int v95;
      v94 = v92;
      v95 = v93;
      while (true) {
        int v96 = 4;
        int v97 = v95 * v96;
        int v98 = v97 + v78;
        int v99 = 12;
        int v100 = v99 + v98;
        int v101 = v77[v100];
        int v102 = 0;
        bool v103 = v101 != v102;
        v94 = v94;
        v95 = v95;
        if (!v103) break;
        int v104 = 32;
        int v105 = v104 + v78;
        int v106 = v77[v105];
        int v107 = 0;
        int v108;
        v108 = v107;
        switch (v106) {
          case 0:
            {
            v108 = v78;
            break;
          }
          default:
            {
            int v109 = 4;
            v108 = v109;
            break;
          }
          case 1:
            {
            v108 = v78;
            break;
          }
        }
        bool v110 = true;
        int v111 = v94 + v108;
        int v112 = 1;
        int v113 = v95 + v112;
        v94 = v111;
        v95 = v113;
        break;
        ;
      }
      bool v114 = true;
      v91 = v94;
      break;
    }
    case 1:
      {
      int v115 = 36;
      int v116 = v115 + v78;
      int v117 = v77[v116];
      int v118 = 1;
      int v119;
      v119 = v118;
      switch (v117) {
        case 0:
          {
          int v120 = 40;
          int v121 = v120 + v78;
          int v122 = v77[v121];
          int v123;
          v123 = v78;
          switch (v122) {
            case 0:
              {
              int v124 = 3;
              v123 = v124;
              break;
            }
            default:
              {
              v123 = v78;
              break;
            }
          }
          bool v125 = true;
          v119 = v123;
        }
        default:
          {
          int v126 = 44;
          int v127 = v126 + v78;
          int v128 = v77[v127];
          int v129 = 0;
          bool v130 = v128 != v129;
          int v131;
          if (v130) {
            v131 = v78;
          } else {
            v131 = v78;
          }
          v119 = v131;
          break;
        }
        case 1:
          {
          int v132 = 0;
          int v133 = v78 + v132;
          v119 = v133;
          break;
        }
      }
      bool v134 = true;
      v91 = v119;
      break;
    }
    default:
      {
      int v135 = 48;
      int v136 = v135 + v78;
      int v137 = v77[v136];
      int v138;
      v138 = v78;
      switch (v137) {
        default:
          {
          int v139 = 52;
          int v140 = v139 + v78;
          int v141 = v77[v140];
          int v142 = 0;
          bool v143 = v141 != v142;
          int v144;
          if (v143) {
            v144 = v78;
          } else {
            int v145 = 2;
            v144 = v145;
          }
          v138 = v144;
          break;
        }
        case 0:
          {
          int v146 = 1;
          v138 = v146;
          break;
        }
      }
      bool v147 = true;
      v91 = v138;
      break;
    }
    case 2:
      {
      int v148 = 0;
      int v149 = 0;
      int v150;
      int v151;
      v150 = v148;
      v151 = v149;
      while (true) {
        int v152 = 4;
        int v153 = v151 * v152;
        int v154 = v153 + v78;
        int v155 = 56;
        int v156 = v155 + v154;
        int v157 = v77[v156];
        int v158 = 0;
        bool v159 = v157 != v158;
        v150 = v150;
        v151 = v151;
        if (!v159) break;
        int v160 = v150 + v151;
        int v161 = 1;
        int v162 = v151 + v161;
        v150 = v160;
        v151 = v162;
      }
      bool v163 = true;
      v91 = v150;
      break;
    }
  }
  bool v164 = true;
  int v165 = 16;
  int v166 = v165 + v78;
  bool v167 = true;
  int v168 = simt_wave_count_bits(v167);
  v76[v166] = v168;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
