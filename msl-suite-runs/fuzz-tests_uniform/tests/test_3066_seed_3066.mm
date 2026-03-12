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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    int v9 = 0;
    bool v10 = v2 != v9;
    int v11;
    if (v10) {
      int v12 = 0;
      int v13 = 0;
      int v14;
      int v15;
      v14 = v12;
      v15 = v13;
      while (true) {
        int v16 = 4;
        int v17 = v3 % v16;
        int v18 = 1;
        int v19 = v17 + v18;
        bool v20 = v15 < v19;
        v14 = v14;
        v15 = v15;
        if (!v20) break;
        uint v21 = simt_lane_id(__simt_tid);
        int v22 = (int)(v21);
        int v23 = 1;
        int v24 = v15 + v23;
        v14 = v22;
        v15 = v24;
      }
      uint v25 = simt_subgroup_id(__simt_tid);
      int v26 = (int)(v25);
      v11 = v14;
    } else {
      int v27 = 4;
      int v28 = v3 % v27;
      int v29 = 0;
      int v30 = v0 + v29;
      int v31;
      v31 = v30;
      switch (v28) {
        default:
          {
          v31 = v0;
          break;
        }
        case 0:
          {
          int v32 = 4;
          v31 = v32;
          break;
        }
        case 1:
          {
          int v33 = 1;
          int v34 = v0 + v33;
          v31 = v34;
          break;
        }
        case 2:
          {
          int v35 = 0;
          int v36 = v0 + v35;
          v31 = v36;
          break;
        }
      }
      uint v37 = simt_subgroup_id(__simt_tid);
      int v38 = (int)(v37);
      v11 = v31;
    }
    v8 = v11;
  } else {
    int v39 = 4;
    int v40 = v3 % v39;
    int v41;
    v41 = v0;
    switch (v40) {
      default:
        {
        int v42 = 0;
        int v43 = 0;
        int v44;
        int v45;
        v44 = v42;
        v45 = v43;
        while (true) {
          int v46 = 4;
          int v47 = v3 % v46;
          int v48 = 1;
          int v49 = v47 + v48;
          bool v50 = v45 < v49;
          v44 = v44;
          v45 = v45;
          if (!v50) break;
          int v51 = 3;
          int v52 = 1;
          int v53 = v45 + v52;
          v44 = v51;
          v45 = v53;
        }
        int v54 = 0;
        int v55 = v0 + v54;
        v41 = v44;
        break;
      }
      case 0:
        {
        int v56 = 0;
        int v57 = 0;
        int v58;
        int v59;
        v58 = v56;
        v59 = v57;
        while (true) {
          int v60 = 4;
          int v61 = v3 % v60;
          int v62 = 1;
          int v63 = v61 + v62;
          bool v64 = v59 < v63;
          v58 = v58;
          v59 = v59;
          if (!v64) break;
          int v65 = 1;
          int v66 = v59 + v65;
          v58 = v0;
          v59 = v66;
          continue;
          ;
        }
        int v67 = 3;
        v41 = v58;
        break;
      }
      case 1:
        {
        int v68 = 0;
        int v69 = v0 + v68;
        v41 = v69;
        break;
      }
      case 2:
        {
        int v70 = 3;
        int v71 = v3 % v70;
        int v72 = 1;
        int v73 = v0 + v72;
        int v74;
        v74 = v73;
        switch (v71) {
          case 0:
            {
            int v75 = 2;
            int v76 = v0 + v75;
            v74 = v76;
          }
          default:
            {
            v74 = v0;
            break;
          }
          case 1:
            {
            v74 = v0;
            break;
          }
        }
        int v77 = 1;
        v41 = v74;
        break;
      }
    }
    uint v78 = simt_lane_id(__simt_tid);
    int v79 = (int)(v78);
    v8 = v41;
  }
  bool v80 = true;
  int v81 = simt_wave_count_bits(v80);
  int v82 = 0;
  int v83 = v82 + v0;
  v1[v83] = v81;
  int v84 = 0;
  bool v85 = v2 != v84;
  int v86 = v85 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v87 [[buffer(0)]], device int* v88 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v89 = static_cast<int>(__simt_tid3.x);
  int v90 = 0;
  int v91 = v90 + v89;
  int v92 = v88[v91];
  int v93 = 4;
  int v94 = v93 + v89;
  int v95 = v88[v94];
  helper0(v89, v87, v92, v95, static_cast<int>(__simt_tid3.x));
  int v96 = 8;
  int v97 = v96 + v89;
  int v98 = v88[v97];
  int v99 = 0;
  bool v100 = v98 != v99;
  int v101;
  if (v100) {
    int v102 = 12;
    int v103 = v102 + v89;
    int v104 = v88[v103];
    int v105 = 4;
    int v106;
    v106 = v105;
    switch (v104) {
      case 0:
        {
        int v107 = 16;
        int v108 = v107 + v89;
        int v109 = v88[v108];
        int v110;
        v110 = v89;
        switch (v109) {
          case 0:
            {
            v110 = v89;
            break;
          }
          default:
            {
            int v111 = 3;
            v110 = v111;
            break;
          }
        }
        bool v112 = true;
        v106 = v110;
        break;
      }
      case 1:
        {
        int v113 = 20;
        int v114 = v113 + v89;
        int v115 = v88[v114];
        int v116;
        v116 = v89;
        switch (v115) {
          default:
            {
            v116 = v89;
            break;
          }
          case 0:
            {
            int v117 = 2;
            v116 = v117;
          }
          case 1:
            {
            int v118 = 0;
            int v119 = v89 + v118;
            v116 = v119;
          }
          case 2:
            {
            int v120 = 0;
            v116 = v120;
            break;
          }
        }
        bool v121 = true;
        v106 = v116;
        break;
      }
      default:
        {
        int v122 = 24;
        int v123 = v122 + v89;
        int v124 = v88[v123];
        int v125 = 0;
        bool v126 = v124 != v125;
        int v127;
        if (v126) {
          v127 = v89;
        } else {
          v127 = v89;
        }
        v106 = v127;
        break;
      }
    }
    bool v128 = true;
    v101 = v106;
  } else {
    int v129 = 28;
    int v130 = v129 + v89;
    int v131 = v88[v130];
    int v132 = 2;
    int v133 = v89 + v132;
    int v134;
    v134 = v133;
    switch (v131) {
      case 0:
        {
        int v135 = 32;
        int v136 = v135 + v89;
        int v137 = v88[v136];
        int v138;
        v138 = v89;
        switch (v137) {
          default:
            {
            int v139 = 3;
            v138 = v139;
          }
          case 0:
            {
            int v140 = 1;
            v138 = v140;
            break;
          }
          case 1:
            {
            int v141 = 0;
            v138 = v141;
            break;
          }
        }
        bool v142 = true;
        v134 = v138;
        break;
      }
      default:
        {
        int v143 = 36;
        int v144 = v143 + v89;
        int v145 = v88[v144];
        int v146;
        v146 = v89;
        switch (v145) {
          case 0:
            {
            v146 = v89;
          }
          default:
            {
            int v147 = 2;
            int v148 = v89 + v147;
            v146 = v148;
          }
          case 1:
            {
            int v149 = 4;
            v146 = v149;
            break;
          }
        }
        bool v150 = true;
        v134 = v146;
        break;
      }
    }
    bool v151 = true;
    v101 = v134;
  }
  int v152 = 16;
  int v153 = v152 + v89;
  bool v154 = true;
  int v155 = simt_wave_count_bits(v154);
  v87[v153] = v155;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 40; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
