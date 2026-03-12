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
  int v6 = 2;
  int v7 = v3 % v6;
  int v8 = 4;
  int v9;
  v9 = v8;
  switch (v7) {
    default:
      {
      int v10 = 3;
      int v11 = v3 % v10;
      int v12 = 0;
      int v13 = v0 + v12;
      int v14;
      v14 = v13;
      switch (v11) {
        case 0:
          {
          int v15 = 0;
          bool v16 = v2 != v15;
          int v17;
          if (v16) {
            int v18 = 0;
            int v19 = v0 + v18;
            v17 = v19;
          } else {
            int v20 = 1;
            v17 = v20;
          }
          int v21 = 3;
          int v22 = v0 + v21;
          v14 = v17;
          break;
        }
        case 1:
          {
          int v23 = 0;
          bool v24 = v2 != v23;
          int v25;
          if (v24) {
            int v26 = 2;
            int v27 = v0 + v26;
            v25 = v27;
          } else {
            v25 = v0;
          }
          int v28 = 2;
          v14 = v25;
          break;
        }
        default:
          {
          int v29 = 0;
          bool v30 = v2 != v29;
          int v31;
          if (v30) {
            int v32 = 1;
            v31 = v32;
          } else {
            int v33 = 0;
            v31 = v33;
          }
          v14 = v31;
          break;
        }
        case 2:
          {
          int v34 = 0;
          int v35 = v0 + v34;
          v14 = v35;
          break;
        }
      }
      v9 = v14;
      break;
    }
    case 0:
      {
      int v36 = 0;
      bool v37 = v2 != v36;
      int v38;
      if (v37) {
        int v39 = 4;
        v38 = v39;
      } else {
        int v40 = 0;
        int v41 = 0;
        int v42;
        int v43;
        v42 = v40;
        v43 = v41;
        while (true) {
          int v44 = 4;
          int v45 = v3 % v44;
          int v46 = 1;
          int v47 = v45 + v46;
          bool v48 = v43 < v47;
          v42 = v42;
          v43 = v43;
          if (!v48) break;
          int v49 = 1;
          int v50 = 1;
          int v51 = v43 + v50;
          v42 = v49;
          v43 = v51;
        }
        int v52 = 1;
        v38 = v42;
      }
      v9 = v38;
      break;
    }
    case 1:
      {
      int v53 = 0;
      int v54 = 0;
      int v55;
      int v56;
      v55 = v53;
      v56 = v54;
      while (true) {
        int v57 = 4;
        int v58 = v3 % v57;
        int v59 = 1;
        int v60 = v58 + v59;
        bool v61 = v56 < v60;
        v55 = v55;
        v56 = v56;
        if (!v61) break;
        int v62 = 3;
        int v63 = v0 + v62;
        int v64 = 1;
        int v65 = v56 + v64;
        v55 = v63;
        v56 = v65;
        break;
        ;
      }
      int v66 = 2;
      v9 = v55;
      break;
    }
  }
  bool v67 = true;
  int v68 = simt_wave_count_bits(v67);
  int v69 = 0;
  int v70 = v69 + v0;
  v1[v70] = v68;
  int v71 = 0;
  bool v72 = v2 != v71;
  int v73 = v72 ? v5 : v9;
  return;
}

kernel void kernel_main(device int* v74 [[buffer(0)]], device int* v75 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v76 = static_cast<int>(__simt_tid3.x);
  int v77 = 0;
  int v78 = v77 + v76;
  int v79 = v75[v78];
  int v80 = 4;
  int v81 = v80 + v76;
  int v82 = v75[v81];
  helper0(v76, v74, v79, v82, static_cast<int>(__simt_tid3.x));
  int v83 = 0;
  int v84 = v76 + v83;
  int v85 = 0;
  int v86 = 0;
  int v87;
  int v88;
  v87 = v85;
  v88 = v86;
  while (true) {
    int v89 = 4;
    int v90 = v88 * v89;
    int v91 = v90 + v76;
    int v92 = 8;
    int v93 = v92 + v91;
    int v94 = v75[v93];
    int v95 = 0;
    bool v96 = v94 != v95;
    v87 = v87;
    v88 = v88;
    if (!v96) break;
    int v97 = 28;
    int v98 = v97 + v76;
    int v99 = v75[v98];
    int v100 = 3;
    int v101;
    v101 = v100;
    switch (v99) {
      case 0:
        {
        v101 = v76;
        break;
      }
      default:
        {
        int v102 = 32;
        int v103 = v102 + v76;
        int v104 = v75[v103];
        int v105 = 1;
        int v106;
        v106 = v105;
        switch (v104) {
          case 0:
            {
            int v107 = 0;
            v106 = v107;
            break;
          }
          default:
            {
            v106 = v76;
            break;
          }
          case 1:
            {
            int v108 = 0;
            v106 = v108;
            break;
          }
        }
        bool v109 = true;
        v101 = v106;
        break;
      }
    }
    bool v110 = true;
    int v111 = v87 + v101;
    int v112 = 1;
    int v113 = v88 + v112;
    v87 = v111;
    v88 = v113;
    continue;
    ;
  }
  bool v114 = true;
  int v115 = 16;
  int v116 = v115 + v76;
  bool v117 = true;
  int v118 = simt_wave_count_bits(v117);
  v74[v116] = v118;
  int v119 = 36;
  int v120 = v119 + v76;
  int v121 = v75[v120];
  uint v122 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v123 = (int)(v122);
  int v124;
  v124 = v123;
  switch (v121) {
    case 0:
      {
      int v125 = 0;
      int v126 = 0;
      int v127;
      int v128;
      v127 = v125;
      v128 = v126;
      while (true) {
        int v129 = 4;
        int v130 = v128 * v129;
        int v131 = v130 + v76;
        int v132 = 40;
        int v133 = v132 + v131;
        int v134 = v75[v133];
        int v135 = 0;
        bool v136 = v134 != v135;
        v127 = v127;
        v128 = v128;
        if (!v136) break;
        int v137 = v127 + v128;
        int v138 = 1;
        int v139 = v128 + v138;
        v127 = v137;
        v128 = v139;
      }
      bool v140 = true;
      v124 = v127;
      break;
    }
    default:
      {
      int v141 = 60;
      int v142 = v141 + v76;
      int v143 = v75[v142];
      int v144 = 4;
      int v145;
      v145 = v144;
      switch (v143) {
        case 0:
          {
          v145 = v76;
        }
        case 1:
          {
          int v146 = 64;
          int v147 = v146 + v76;
          int v148 = v75[v147];
          int v149 = 1;
          int v150 = v76 + v149;
          int v151;
          v151 = v150;
          switch (v148) {
            case 0:
              {
              v151 = v76;
              break;
            }
            default:
              {
              v151 = v76;
              break;
            }
            case 1:
              {
              v151 = v76;
              break;
            }
          }
          bool v152 = true;
          v145 = v151;
        }
        default:
          {
          int v153 = 2;
          int v154 = v76 + v153;
          v145 = v154;
          break;
        }
      }
      bool v155 = true;
      v124 = v145;
      break;
    }
  }
  bool v156 = true;
  int v157 = 32;
  int v158 = v157 + v76;
  bool v159 = true;
  int v160 = simt_wave_count_bits(v159);
  v74[v158] = v160;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
