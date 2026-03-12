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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 3;
  int v9 = v3 % v8;
  int v10 = 4;
  int v11;
  v11 = v10;
  switch (v9) {
    case 0:
      {
      int v12 = 3;
      int v13 = v3 % v12;
      int v14 = 1;
      int v15 = v0 + v14;
      int v16;
      v16 = v15;
      switch (v13) {
        case 0:
          {
          int v17 = 0;
          bool v18 = v2 != v17;
          int v19;
          if (v18) {
            int v20 = 2;
            v19 = v20;
          } else {
            int v21 = 2;
            int v22 = v0 + v21;
            v19 = v22;
          }
          v16 = v19;
        }
        case 1:
          {
          int v23 = 4;
          int v24 = v0 + v23;
          v16 = v24;
          break;
        }
        case 2:
          {
          int v25 = 0;
          bool v26 = v2 != v25;
          int v27;
          if (v26) {
            v27 = v0;
          } else {
            int v28 = 0;
            v27 = v28;
          }
          v16 = v27;
          break;
        }
        default:
          {
          int v29 = 0;
          bool v30 = v2 != v29;
          int v31;
          if (v30) {
            int v32 = 3;
            v31 = v32;
          } else {
            int v33 = 4;
            v31 = v33;
          }
          v16 = v31;
          break;
        }
      }
      v11 = v16;
      break;
    }
    default:
      {
      int v34 = 3;
      int v35 = v3 % v34;
      int v36;
      v36 = v0;
      switch (v35) {
        case 0:
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
            int v46 = 0;
            int v47 = v0 + v46;
            int v48 = 1;
            int v49 = v40 + v48;
            v39 = v47;
            v40 = v49;
          }
          v36 = v39;
        }
        default:
          {
          int v50 = 0;
          bool v51 = v2 != v50;
          int v52;
          if (v51) {
            v52 = v0;
          } else {
            int v53 = 2;
            int v54 = v0 + v53;
            v52 = v54;
          }
          v36 = v52;
        }
        case 1:
          {
          int v55 = 0;
          int v56 = 0;
          int v57;
          int v58;
          v57 = v55;
          v58 = v56;
          while (true) {
            int v59 = 4;
            int v60 = v3 % v59;
            int v61 = 1;
            int v62 = v60 + v61;
            bool v63 = v58 < v62;
            v57 = v57;
            v58 = v58;
            if (!v63) break;
            int v64 = 1;
            int v65 = v58 + v64;
            v57 = v0;
            v58 = v65;
          }
          v36 = v57;
          break;
        }
      }
      v11 = v36;
      break;
    }
    case 1:
      {
      int v66 = 0;
      int v67 = 0;
      int v68;
      int v69;
      v68 = v66;
      v69 = v67;
      while (true) {
        int v70 = 4;
        int v71 = v3 % v70;
        int v72 = 1;
        int v73 = v71 + v72;
        bool v74 = v69 < v73;
        v68 = v68;
        v69 = v69;
        if (!v74) break;
        int v75 = 0;
        int v76 = 0;
        int v77;
        int v78;
        v77 = v75;
        v78 = v76;
        while (true) {
          int v79 = 4;
          int v80 = v3 % v79;
          int v81 = 1;
          int v82 = v80 + v81;
          bool v83 = v78 < v82;
          v77 = v77;
          v78 = v78;
          if (!v83) break;
          int v84 = 1;
          int v85 = v78 + v84;
          v77 = v0;
          v78 = v85;
        }
        int v86 = 1;
        int v87 = v69 + v86;
        v68 = v77;
        v69 = v87;
      }
      v11 = v68;
      break;
    }
  }
  int v88 = 0;
  bool v89 = v2 != v88;
  int v90 = v89 ? v5 : v11;
  return;
}

kernel void kernel_main(device int* v91 [[buffer(0)]], device int* v92 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v93 = static_cast<int>(__simt_tid3.x);
  int v94 = 0;
  int v95 = v94 + v93;
  int v96 = v92[v95];
  int v97 = 4;
  int v98 = v97 + v93;
  int v99 = v92[v98];
  helper0(v93, v91, v96, v99, static_cast<int>(__simt_tid3.x));
  int v100 = 8;
  int v101 = v100 + v93;
  int v102 = v92[v101];
  int v103;
  v103 = v93;
  switch (v102) {
    default:
      {
      int v104 = 12;
      int v105 = v104 + v93;
      int v106 = v92[v105];
      int v107 = 0;
      bool v108 = v106 != v107;
      int v109;
      if (v108) {
        int v110 = 16;
        int v111 = v110 + v93;
        int v112 = v92[v111];
        int v113 = 4;
        int v114 = v93 + v113;
        int v115;
        v115 = v114;
        switch (v112) {
          default:
            {
            int v116 = 4;
            v115 = v116;
            break;
          }
          case 0:
            {
            int v117 = 4;
            int v118 = v93 + v117;
            v115 = v118;
            break;
          }
          case 1:
            {
            int v119 = 0;
            int v120 = v93 + v119;
            v115 = v120;
            break;
          }
          case 2:
            {
            int v121 = 3;
            v115 = v121;
            break;
          }
        }
        v109 = v115;
      } else {
        int v122 = 0;
        int v123 = v93 + v122;
        v109 = v123;
      }
      v103 = v109;
      break;
    }
    case 0:
      {
      int v124 = 20;
      int v125 = v124 + v93;
      int v126 = v92[v125];
      int v127 = 2;
      int v128 = v93 + v127;
      int v129;
      v129 = v128;
      switch (v126) {
        default:
          {
          int v130 = 0;
          int v131 = 0;
          int v132;
          int v133;
          v132 = v130;
          v133 = v131;
          while (true) {
            int v134 = 4;
            int v135 = v133 * v134;
            int v136 = v135 + v93;
            int v137 = 24;
            int v138 = v137 + v136;
            int v139 = v92[v138];
            int v140 = 0;
            bool v141 = v139 != v140;
            v132 = v132;
            v133 = v133;
            if (!v141) break;
            int v142 = v132 + v133;
            int v143 = 1;
            int v144 = v133 + v143;
            bool v145 = true;
            v132 = v142;
            v133 = v144;
            continue;
            ;
          }
          v129 = v132;
          break;
        }
        case 0:
          {
          int v146 = 3;
          int v147 = v93 + v146;
          v129 = v147;
          break;
        }
      }
      v103 = v129;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
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
