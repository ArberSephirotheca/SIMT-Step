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
    int v7 = 4;
    int v8 = v3 % v7;
    int v9 = 1;
    int v10 = v0 + v9;
    int v11;
    v11 = v10;
    switch (v8) {
      default:
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
            int v17 = 4;
            v16 = v17;
            break;
          }
          case 1:
            {
            v16 = v0;
            break;
          }
          default:
            {
            int v18 = 1;
            v16 = v18;
            break;
          }
          case 2:
            {
            v16 = v0;
            break;
          }
        }
        v11 = v16;
        break;
      }
      case 0:
        {
        v11 = v0;
        break;
      }
      case 1:
        {
        v11 = v0;
        break;
      }
      case 2:
        {
        int v19 = 0;
        int v20 = 0;
        int v21;
        int v22;
        v21 = v19;
        v22 = v20;
        while (true) {
          int v23 = 4;
          int v24 = v3 % v23;
          int v25 = 1;
          int v26 = v24 + v25;
          bool v27 = v22 < v26;
          v21 = v21;
          v22 = v22;
          if (!v27) break;
          int v28 = 4;
          int v29 = v0 + v28;
          int v30 = 1;
          int v31 = v22 + v30;
          v21 = v29;
          v22 = v31;
        }
        v11 = v21;
        break;
      }
    }
    uint v32 = simt_lane_id(__simt_tid);
    int v33 = (int)(v32);
    v6 = v11;
  } else {
    int v34 = 2;
    int v35 = v3 % v34;
    int v36;
    v36 = v0;
    switch (v35) {
      case 0:
        {
        int v37 = 0;
        bool v38 = v2 != v37;
        int v39;
        if (v38) {
          v39 = v0;
        } else {
          v39 = v0;
        }
        int v40 = 0;
        int v41 = v0 + v40;
        v36 = v39;
        break;
      }
      default:
        {
        int v42 = 0;
        bool v43 = v2 != v42;
        int v44;
        if (v43) {
          int v45 = 0;
          int v46 = v0 + v45;
          v44 = v46;
        } else {
          v44 = v0;
        }
        int v47 = 2;
        v36 = v44;
        break;
      }
      case 1:
        {
        int v48 = 3;
        int v49 = v3 % v48;
        int v50 = 4;
        int v51;
        v51 = v50;
        switch (v49) {
          case 0:
            {
            int v52 = 3;
            v51 = v52;
            break;
          }
          default:
            {
            int v53 = 1;
            v51 = v53;
            break;
          }
          case 1:
            {
            v51 = v0;
            break;
          }
        }
        v36 = v51;
        break;
      }
    }
    v6 = v36;
  }
  bool v54 = true;
  int v55 = simt_wave_count_bits(v54);
  int v56 = 0;
  int v57 = v56 + v0;
  v1[v57] = v55;
  return;
}

kernel void kernel_main(device int* v58 [[buffer(0)]], device int* v59 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v60 = static_cast<int>(__simt_tid3.x);
  int v61 = 0;
  int v62 = v61 + v60;
  int v63 = v59[v62];
  int v64 = 4;
  int v65 = v64 + v60;
  int v66 = v59[v65];
  helper0(v60, v58, v63, v66, static_cast<int>(__simt_tid3.x));
  int v67 = 0;
  int v68 = 0;
  int v69;
  int v70;
  v69 = v67;
  v70 = v68;
  while (true) {
    int v71 = 4;
    int v72 = v70 * v71;
    int v73 = v72 + v60;
    int v74 = 8;
    int v75 = v74 + v73;
    int v76 = v59[v75];
    int v77 = 0;
    bool v78 = v76 != v77;
    v69 = v69;
    v70 = v70;
    if (!v78) break;
    int v79 = 28;
    int v80 = v79 + v60;
    int v81 = v59[v80];
    int v82 = 3;
    int v83;
    v83 = v82;
    switch (v81) {
      case 0:
        {
        int v84 = 2;
        int v85 = v60 + v84;
        v83 = v85;
        break;
      }
      case 1:
        {
        int v86 = 32;
        int v87 = v86 + v60;
        int v88 = v59[v87];
        int v89 = 0;
        bool v90 = v88 != v89;
        int v91;
        if (v90) {
          v91 = v60;
        } else {
          v91 = v60;
        }
        v83 = v91;
        break;
      }
      case 2:
        {
        int v92 = 36;
        int v93 = v92 + v60;
        int v94 = v59[v93];
        int v95 = 0;
        bool v96 = v94 != v95;
        int v97;
        if (v96) {
          v97 = v60;
        } else {
          int v98 = 3;
          int v99 = v60 + v98;
          v97 = v99;
        }
        v83 = v97;
      }
      default:
        {
        int v100 = 0;
        v83 = v100;
        break;
      }
    }
    bool v101 = true;
    int v102 = v69 + v83;
    int v103 = 1;
    int v104 = v70 + v103;
    v69 = v102;
    v70 = v104;
  }
  bool v105 = true;
  int v106 = 16;
  int v107 = v106 + v60;
  bool v108 = true;
  int v109 = simt_wave_count_bits(v108);
  v58[v107] = v109;
  uint v110 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v111 = (int)(v110);
  int v112 = 40;
  int v113 = v112 + v60;
  int v114 = v59[v113];
  int v115 = 0;
  bool v116 = v114 != v115;
  int v117;
  if (v116) {
    uint v118 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v119 = (int)(v118);
    v117 = v119;
  } else {
    int v120 = 44;
    int v121 = v120 + v60;
    int v122 = v59[v121];
    int v123 = 0;
    bool v124 = v122 != v123;
    int v125;
    if (v124) {
      int v126 = 0;
      int v127 = 0;
      int v128;
      int v129;
      v128 = v126;
      v129 = v127;
      while (true) {
        int v130 = 4;
        int v131 = v129 * v130;
        int v132 = v131 + v60;
        int v133 = 48;
        int v134 = v133 + v132;
        int v135 = v59[v134];
        int v136 = 0;
        bool v137 = v135 != v136;
        v128 = v128;
        v129 = v129;
        if (!v137) break;
        int v138 = v128 + v129;
        int v139 = 1;
        int v140 = v129 + v139;
        v128 = v138;
        v129 = v140;
      }
      bool v141 = true;
      v125 = v128;
    } else {
      int v142 = 0;
      int v143 = 0;
      int v144;
      int v145;
      v144 = v142;
      v145 = v143;
      while (true) {
        int v146 = 4;
        int v147 = v145 * v146;
        int v148 = v147 + v60;
        int v149 = 68;
        int v150 = v149 + v148;
        int v151 = v59[v150];
        int v152 = 0;
        bool v153 = v151 != v152;
        v144 = v144;
        v145 = v145;
        if (!v153) break;
        int v154 = v144 + v145;
        int v155 = 1;
        int v156 = v145 + v155;
        v144 = v154;
        v145 = v156;
      }
      bool v157 = true;
      v125 = v144;
    }
    v117 = v125;
  }
  int v158 = 32;
  int v159 = v158 + v60;
  bool v160 = true;
  int v161 = simt_wave_count_bits(v160);
  v58[v159] = v161;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
