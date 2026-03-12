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
        int v18 = 1;
        int v19 = v12 + v18;
        v11 = v0;
        v12 = v19;
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v20 = 0;
      bool v21 = v2 != v20;
      int v22;
      if (v21) {
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
          int v32 = 4;
          int v33 = v0 + v32;
          int v34 = 1;
          int v35 = v26 + v34;
          v25 = v33;
          v26 = v35;
        }
        v22 = v25;
      } else {
        int v36 = 3;
        int v37 = v0 + v36;
        v22 = v37;
      }
      v8 = v22;
    }
    case 2:
      {
      int v38 = 3;
      int v39 = v3 % v38;
      int v40 = 2;
      int v41 = v0 + v40;
      int v42;
      v42 = v41;
      switch (v39) {
        default:
          {
          int v43 = 0;
          int v44 = 0;
          int v45;
          int v46;
          v45 = v43;
          v46 = v44;
          while (true) {
            int v47 = 4;
            int v48 = v3 % v47;
            int v49 = 1;
            int v50 = v48 + v49;
            bool v51 = v46 < v50;
            v45 = v45;
            v46 = v46;
            if (!v51) break;
            int v52 = 1;
            int v53 = 1;
            int v54 = v46 + v53;
            v45 = v52;
            v46 = v54;
          }
          v42 = v45;
          break;
        }
        case 0:
          {
          int v55 = 3;
          int v56 = v3 % v55;
          int v57 = 0;
          int v58;
          v58 = v57;
          switch (v56) {
            default:
              {
              int v59 = 3;
              int v60 = v0 + v59;
              v58 = v60;
              break;
            }
            case 0:
              {
              v58 = v0;
              break;
            }
            case 1:
              {
              v58 = v0;
              break;
            }
          }
          v42 = v58;
        }
        case 1:
          {
          int v61 = 0;
          int v62 = 0;
          int v63;
          int v64;
          v63 = v61;
          v64 = v62;
          while (true) {
            int v65 = 4;
            int v66 = v3 % v65;
            int v67 = 1;
            int v68 = v66 + v67;
            bool v69 = v64 < v68;
            v63 = v63;
            v64 = v64;
            if (!v69) break;
            int v70 = 1;
            int v71 = v64 + v70;
            v63 = v0;
            v64 = v71;
          }
          v42 = v63;
        }
        case 2:
          {
          int v72 = 0;
          bool v73 = v2 != v72;
          int v74;
          if (v73) {
            v74 = v0;
          } else {
            int v75 = 1;
            v74 = v75;
          }
          v42 = v74;
          break;
        }
      }
      v8 = v42;
    }
    default:
      {
      int v76 = 0;
      bool v77 = v2 != v76;
      int v78;
      if (v77) {
        int v79 = 2;
        int v80 = v3 % v79;
        int v81 = 0;
        int v82;
        v82 = v81;
        switch (v80) {
          default:
            {
            v82 = v0;
          }
          case 0:
            {
            int v83 = 3;
            v82 = v83;
            break;
          }
        }
        v78 = v82;
      } else {
        v78 = v0;
      }
      v8 = v78;
      break;
    }
  }
  bool v84 = true;
  int v85 = simt_wave_count_bits(v84);
  int v86 = 0;
  int v87 = v86 + v0;
  v1[v87] = v85;
  return;
}

kernel void kernel_main(device int* v88 [[buffer(0)]], device int* v89 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v90 = static_cast<int>(__simt_tid3.x);
  int v91 = 0;
  int v92 = v91 + v90;
  int v93 = v89[v92];
  int v94 = 4;
  int v95 = v94 + v90;
  int v96 = v89[v95];
  int v97 = 0;
  bool v98 = v93 != v97;
  if (v98) {
    int v99 = 0;
    int v100 = 0;
    int v101;
    int v102;
    v101 = v99;
    v102 = v100;
    while (true) {
      int v103 = 1;
      bool v104 = v102 < v103;
      v101 = v101;
      v102 = v102;
      if (!v104) break;
      helper0(v90, v88, v93, v96, static_cast<int>(__simt_tid3.x));
      int v105 = 1;
      int v106 = v102 + v105;
      v101 = v101;
      v102 = v106;
    }
  } else {
  }
  int v107 = 8;
  int v108 = v107 + v90;
  int v109 = v89[v108];
  int v110 = 0;
  bool v111 = v109 != v110;
  int v112;
  if (v111) {
    int v113 = 12;
    int v114 = v113 + v90;
    int v115 = v89[v114];
    int v116 = 0;
    bool v117 = v115 != v116;
    int v118;
    if (v117) {
      int v119 = 16;
      int v120 = v119 + v90;
      int v121 = v89[v120];
      int v122 = 0;
      bool v123 = v121 != v122;
      int v124;
      if (v123) {
        int v125 = 0;
        int v126 = v90 + v125;
        v124 = v126;
      } else {
        uint v127 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v128 = (int)(v127);
        v124 = v128;
      }
      int v129 = 16;
      int v130 = v129 + v90;
      bool v131 = true;
      int v132 = simt_wave_count_bits(v131);
      v88[v130] = v132;
      v118 = v124;
    } else {
      int v133 = 20;
      int v134 = v133 + v90;
      int v135 = v89[v134];
      int v136;
      v136 = v90;
      switch (v135) {
        case 0:
          {
          int v137 = 3;
          int v138 = v90 + v137;
          v136 = v138;
          break;
        }
        case 1:
          {
          int v139 = 2;
          v136 = v139;
          break;
        }
        default:
          {
          int v140 = 3;
          v136 = v140;
          break;
        }
      }
      v118 = v136;
    }
    int v141 = 32;
    int v142 = v141 + v90;
    bool v143 = true;
    int v144 = simt_wave_count_bits(v143);
    v88[v142] = v144;
    v112 = v118;
  } else {
    v112 = v90;
  }
  int v145 = 48;
  int v146 = v145 + v90;
  bool v147 = true;
  int v148 = simt_wave_count_bits(v147);
  v88[v146] = v148;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 24; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
