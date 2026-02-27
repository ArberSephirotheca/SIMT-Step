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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
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
        int v18 = 0;
        int v19 = 0;
        int v20;
        int v21;
        v20 = v18;
        v21 = v19;
        while (true) {
          int v22 = 4;
          int v23 = v3 % v22;
          int v24 = 1;
          int v25 = v23 + v24;
          bool v26 = v21 < v25;
          v20 = v20;
          v21 = v21;
          if (!v26) break;
          int v27 = 1;
          int v28 = v21 + v27;
          v20 = v0;
          v21 = v28;
        }
        int v29 = 1;
        int v30 = v12 + v29;
        v11 = v20;
        v12 = v30;
      }
      v8 = v11;
      break;
    }
    case 0:
      {
      int v31 = 2;
      int v32 = v3 % v31;
      int v33;
      v33 = v0;
      switch (v32) {
        default:
          {
          int v34 = 3;
          int v35 = v3 % v34;
          int v36 = 3;
          int v37;
          v37 = v36;
          switch (v35) {
            default:
              {
              int v38 = 0;
              int v39 = v0 + v38;
              v37 = v39;
            }
            case 0:
              {
              int v40 = 4;
              v37 = v40;
            }
            case 1:
              {
              int v41 = 0;
              int v42 = v0 + v41;
              v37 = v42;
            }
            case 2:
              {
              int v43 = 3;
              int v44 = v0 + v43;
              v37 = v44;
              break;
            }
          }
          v33 = v37;
        }
        case 0:
          {
          int v45 = 0;
          int v46 = 0;
          int v47;
          int v48;
          v47 = v45;
          v48 = v46;
          while (true) {
            int v49 = 4;
            int v50 = v3 % v49;
            int v51 = 1;
            int v52 = v50 + v51;
            bool v53 = v48 < v52;
            v47 = v47;
            v48 = v48;
            if (!v53) break;
            int v54 = 3;
            int v55 = 1;
            int v56 = v48 + v55;
            v47 = v54;
            v48 = v56;
          }
          v33 = v47;
          break;
        }
      }
      v8 = v33;
      break;
    }
    case 1:
      {
      int v57 = 0;
      bool v58 = v2 != v57;
      int v59;
      if (v58) {
        int v60 = 0;
        bool v61 = v2 != v60;
        int v62;
        if (v61) {
          v62 = v0;
        } else {
          v62 = v0;
        }
        v59 = v62;
      } else {
        int v63 = 0;
        bool v64 = v2 != v63;
        int v65;
        if (v64) {
          int v66 = 0;
          int v67 = v0 + v66;
          v65 = v67;
        } else {
          int v68 = 3;
          int v69 = v0 + v68;
          v65 = v69;
        }
        v59 = v65;
      }
      v8 = v59;
      break;
    }
    case 2:
      {
      int v70 = 3;
      int v71 = v0 + v70;
      int v72;
      v72 = v71;
      switch (v3) {
        default:
          {
          int v73 = 0;
          bool v74 = v2 != v73;
          int v75;
          if (v74) {
            v75 = v0;
          } else {
            v75 = v0;
          }
          v72 = v75;
          break;
        }
        case 0:
          {
          int v76 = 0;
          bool v77 = v2 != v76;
          int v78;
          if (v77) {
            int v79 = 1;
            v78 = v79;
          } else {
            v78 = v0;
          }
          v72 = v78;
          break;
        }
      }
      v8 = v72;
      break;
    }
  }
  bool v80 = true;
  int v81 = simt_wave_count_bits(v80);
  int v82 = 0;
  int v83 = v82 + v0;
  v1[v83] = v81;
  return;
}

kernel void kernel_main(device int* v84 [[buffer(0)]], device int* v85 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v86 = static_cast<int>(__simt_tid3.x);
  int v87 = 0;
  int v88 = v87 + v86;
  int v89 = v85[v88];
  int v90 = 4;
  int v91 = v90 + v86;
  int v92 = v85[v91];
  helper0(v86, v84, v89, v92, static_cast<int>(__simt_tid3.x));
  int v93 = 8;
  int v94 = v93 + v86;
  int v95 = v85[v94];
  uint v96 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v97 = (int)(v96);
  int v98;
  v98 = v97;
  switch (v95) {
    default:
      {
      int v99 = 0;
      int v100 = 0;
      int v101;
      int v102;
      v101 = v99;
      v102 = v100;
      while (true) {
        int v103 = 4;
        int v104 = v102 * v103;
        int v105 = v104 + v86;
        int v106 = 12;
        int v107 = v106 + v105;
        int v108 = v85[v107];
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
      break;
    }
    case 0:
      {
      int v115 = 32;
      int v116 = v115 + v86;
      int v117 = v85[v116];
      int v118;
      v118 = v86;
      switch (v117) {
        default:
          {
          int v119 = 36;
          int v120 = v119 + v86;
          int v121 = v85[v120];
          int v122 = 0;
          int v123 = v86 + v122;
          int v124;
          v124 = v123;
          switch (v121) {
            case 0:
              {
              int v125 = 2;
              int v126 = v86 + v125;
              v124 = v126;
              break;
            }
            default:
              {
              int v127 = 0;
              v124 = v127;
              break;
            }
            case 1:
              {
              int v128 = 1;
              int v129 = v86 + v128;
              v124 = v129;
              break;
            }
            case 2:
              {
              int v130 = 0;
              int v131 = v86 + v130;
              v124 = v131;
              break;
            }
          }
          v118 = v124;
          break;
        }
        case 0:
          {
          int v132 = 40;
          int v133 = v132 + v86;
          int v134 = v85[v133];
          int v135 = 0;
          bool v136 = v134 != v135;
          int v137;
          if (v136) {
            int v138 = 2;
            v137 = v138;
          } else {
            int v139 = 2;
            int v140 = v86 + v139;
            v137 = v140;
          }
          v118 = v137;
          break;
        }
      }
      v98 = v118;
      break;
    }
  }
  bool v141 = true;
  int v142 = 16;
  int v143 = v142 + v86;
  bool v144 = true;
  int v145 = simt_wave_count_bits(v144);
  v84[v143] = v145;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 44; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
