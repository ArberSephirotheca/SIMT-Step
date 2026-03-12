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
  int v8 = 2;
  int v9 = v3 % v8;
  uint v10 = simt_subgroup_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    default:
      {
      int v13 = 0;
      bool v14 = v2 != v13;
      int v15;
      if (v14) {
        int v16 = 0;
        int v17 = 0;
        int v18;
        int v19;
        v18 = v16;
        v19 = v17;
        while (true) {
          int v20 = 4;
          int v21 = v3 % v20;
          int v22 = 1;
          int v23 = v21 + v22;
          bool v24 = v19 < v23;
          v18 = v18;
          v19 = v19;
          if (!v24) break;
          int v25 = 1;
          int v26 = 1;
          int v27 = v19 + v26;
          v18 = v25;
          v19 = v27;
          break;
          ;
        }
        v15 = v18;
      } else {
        v15 = v0;
      }
      v12 = v15;
      break;
    }
    case 0:
      {
      int v28 = 0;
      bool v29 = v2 != v28;
      int v30;
      if (v29) {
        int v31 = 2;
        int v32 = v3 % v31;
        int v33;
        v33 = v0;
        switch (v32) {
          default:
            {
            int v34 = 3;
            int v35 = v0 + v34;
            v33 = v35;
            break;
          }
          case 0:
            {
            int v36 = 4;
            v33 = v36;
            break;
          }
          case 1:
            {
            int v37 = 4;
            v33 = v37;
            break;
          }
        }
        int v38 = 4;
        v30 = v33;
      } else {
        int v39 = 4;
        int v40 = v3 % v39;
        int v41 = 0;
        int v42 = v0 + v41;
        int v43;
        v43 = v42;
        switch (v40) {
          default:
            {
            v43 = v0;
            break;
          }
          case 0:
            {
            v43 = v0;
          }
          case 1:
            {
            int v44 = 4;
            v43 = v44;
            break;
          }
          case 2:
            {
            int v45 = 4;
            v43 = v45;
            break;
          }
        }
        v30 = v43;
      }
      v12 = v30;
      break;
    }
    case 1:
      {
      int v46 = 0;
      bool v47 = v2 != v46;
      int v48;
      if (v47) {
        int v49 = 0;
        bool v50 = v2 != v49;
        int v51;
        if (v50) {
          int v52 = 1;
          v51 = v52;
        } else {
          int v53 = 3;
          v51 = v53;
        }
        v48 = v51;
      } else {
        int v54 = 0;
        int v55 = 0;
        int v56;
        int v57;
        v56 = v54;
        v57 = v55;
        while (true) {
          int v58 = 4;
          int v59 = v3 % v58;
          int v60 = 1;
          int v61 = v59 + v60;
          bool v62 = v57 < v61;
          v56 = v56;
          v57 = v57;
          if (!v62) break;
          int v63 = 1;
          int v64 = v57 + v63;
          v56 = v0;
          v57 = v64;
          break;
          ;
        }
        v48 = v56;
      }
      v12 = v48;
      break;
    }
  }
  int v65 = 0;
  bool v66 = v2 != v65;
  int v67 = v66 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v68 [[buffer(0)]], device int* v69 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v70 = static_cast<int>(__simt_tid3.x);
  int v71 = 0;
  int v72 = v71 + v70;
  int v73 = v69[v72];
  int v74 = 4;
  int v75 = v74 + v70;
  int v76 = v69[v75];
  helper0(v70, v68, v73, v76, static_cast<int>(__simt_tid3.x));
  int v77 = 8;
  int v78 = v77 + v70;
  int v79 = v69[v78];
  int v80 = 0;
  bool v81 = v79 != v80;
  int v82;
  if (v81) {
    int v83 = 0;
    int v84 = 0;
    int v85;
    int v86;
    v85 = v83;
    v86 = v84;
    while (true) {
      int v87 = 4;
      int v88 = v86 * v87;
      int v89 = v88 + v70;
      int v90 = 12;
      int v91 = v90 + v89;
      int v92 = v69[v91];
      int v93 = 0;
      bool v94 = v92 != v93;
      v85 = v85;
      v86 = v86;
      if (!v94) break;
      int v95 = v85 + v86;
      int v96 = 1;
      int v97 = v86 + v96;
      bool v98 = true;
      int v99 = 16;
      int v100 = 4;
      int v101 = v86 * v100;
      int v102 = v99 + v101;
      int v103 = v102 + v70;
      bool v104 = true;
      int v105 = simt_wave_count_bits(v104);
      v68[v103] = v105;
      v85 = v95;
      v86 = v97;
      continue;
      ;
    }
    v82 = v85;
  } else {
    int v106 = 32;
    int v107 = v106 + v70;
    int v108 = v69[v107];
    uint v109 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v110 = (int)(v109);
    int v111;
    v111 = v110;
    switch (v108) {
      case 0:
        {
        int v112 = 0;
        int v113 = 0;
        int v114;
        int v115;
        v114 = v112;
        v115 = v113;
        while (true) {
          int v116 = 4;
          int v117 = v115 * v116;
          int v118 = v117 + v70;
          int v119 = 36;
          int v120 = v119 + v118;
          int v121 = v69[v120];
          int v122 = 0;
          bool v123 = v121 != v122;
          v114 = v114;
          v115 = v115;
          if (!v123) break;
          int v124 = v114 + v115;
          int v125 = 1;
          int v126 = v115 + v125;
          bool v127 = true;
          v114 = v124;
          v115 = v126;
          break;
          ;
        }
        v111 = v114;
        break;
      }
      case 1:
        {
        int v128 = 56;
        int v129 = v128 + v70;
        int v130 = v69[v129];
        int v131 = 0;
        bool v132 = v130 != v131;
        int v133;
        if (v132) {
          v133 = v70;
        } else {
          int v134 = 4;
          v133 = v134;
        }
        v111 = v133;
        break;
      }
      default:
        {
        int v135 = 60;
        int v136 = v135 + v70;
        int v137 = v69[v136];
        int v138;
        v138 = v70;
        switch (v137) {
          case 0:
            {
            int v139 = 0;
            int v140 = v70 + v139;
            v138 = v140;
            break;
          }
          case 1:
            {
            int v141 = 3;
            v138 = v141;
            break;
          }
          default:
            {
            int v142 = 1;
            int v143 = v70 + v142;
            v138 = v143;
            break;
          }
        }
        bool v144 = true;
        v111 = v138;
        break;
      }
      case 2:
        {
        int v145 = 0;
        int v146 = 0;
        int v147;
        int v148;
        v147 = v145;
        v148 = v146;
        while (true) {
          int v149 = 4;
          int v150 = v148 * v149;
          int v151 = v150 + v70;
          int v152 = 64;
          int v153 = v152 + v151;
          int v154 = v69[v153];
          int v155 = 0;
          bool v156 = v154 != v155;
          v147 = v147;
          v148 = v148;
          if (!v156) break;
          int v157 = v147 + v148;
          int v158 = 1;
          int v159 = v148 + v158;
          bool v160 = true;
          v147 = v157;
          v148 = v159;
          break;
          ;
        }
        v111 = v147;
        break;
      }
    }
    v82 = v111;
  }
  int v161 = 32;
  int v162 = v161 + v70;
  bool v163 = true;
  int v164 = simt_wave_count_bits(v163);
  v68[v162] = v164;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
