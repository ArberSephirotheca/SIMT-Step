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
  int v6 = 1;
  int v7 = v0 + v6;
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
        int v18 = 2;
        int v19 = v3 % v18;
        int v20;
        v20 = v0;
        switch (v19) {
          case 0:
            {
            int v21 = 0;
            v20 = v21;
            break;
          }
          default:
            {
            int v22 = 3;
            v20 = v22;
            break;
          }
          case 1:
            {
            int v23 = 4;
            int v24 = v0 + v23;
            v20 = v24;
            break;
          }
        }
        int v25 = 1;
        int v26 = v12 + v25;
        v11 = v20;
        v12 = v26;
        continue;
        ;
      }
      int v27 = 0;
      v8 = v11;
      break;
    }
    case 0:
      {
      int v28 = 3;
      int v29 = v3 % v28;
      int v30 = 4;
      int v31;
      v31 = v30;
      switch (v29) {
        default:
          {
          int v32 = 2;
          int v33 = v0 + v32;
          int v34;
          v34 = v33;
          switch (v3) {
            default:
              {
              int v35 = 2;
              int v36 = v0 + v35;
              v34 = v36;
              break;
            }
            case 0:
              {
              v34 = v0;
              break;
            }
          }
          int v37 = 0;
          int v38 = v0 + v37;
          v31 = v34;
          break;
        }
        case 0:
          {
          int v39 = 0;
          bool v40 = v2 != v39;
          int v41;
          if (v40) {
            v41 = v0;
          } else {
            int v42 = 4;
            v41 = v42;
          }
          int v43 = 3;
          int v44 = v0 + v43;
          v31 = v41;
          break;
        }
        case 1:
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
            int v54 = 4;
            int v55 = v0 + v54;
            int v56 = 1;
            int v57 = v48 + v56;
            v47 = v55;
            v48 = v57;
          }
          int v58 = 4;
          v31 = v47;
          break;
        }
        case 2:
          {
          int v59 = 0;
          int v60;
          v60 = v59;
          switch (v3) {
            default:
              {
              int v61 = 2;
              v60 = v61;
              break;
            }
            case 0:
              {
              v60 = v0;
              break;
            }
          }
          int v62 = 4;
          int v63 = v0 + v62;
          v31 = v60;
          break;
        }
      }
      v8 = v31;
    }
    case 1:
      {
      int v64 = 4;
      int v65 = v0 + v64;
      int v66;
      v66 = v65;
      switch (v3) {
        default:
          {
          int v67 = 0;
          int v68 = 0;
          int v69;
          int v70;
          v69 = v67;
          v70 = v68;
          while (true) {
            int v71 = 4;
            int v72 = v3 % v71;
            int v73 = 1;
            int v74 = v72 + v73;
            bool v75 = v70 < v74;
            v69 = v69;
            v70 = v70;
            if (!v75) break;
            int v76 = 0;
            int v77 = 1;
            int v78 = v70 + v77;
            v69 = v76;
            v70 = v78;
          }
          v66 = v69;
        }
        case 0:
          {
          int v79 = 0;
          int v80 = 0;
          int v81;
          int v82;
          v81 = v79;
          v82 = v80;
          while (true) {
            int v83 = 4;
            int v84 = v3 % v83;
            int v85 = 1;
            int v86 = v84 + v85;
            bool v87 = v82 < v86;
            v81 = v81;
            v82 = v82;
            if (!v87) break;
            int v88 = 1;
            int v89 = v82 + v88;
            v81 = v0;
            v82 = v89;
          }
          int v90 = 3;
          int v91 = v0 + v90;
          v66 = v81;
          break;
        }
      }
      v8 = v66;
      break;
    }
  }
  bool v92 = true;
  int v93 = simt_wave_count_bits(v92);
  int v94 = 0;
  int v95 = v94 + v0;
  v1[v95] = v93;
  return;
}

kernel void kernel_main(device int* v96 [[buffer(0)]], device int* v97 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v98 = static_cast<int>(__simt_tid3.x);
  int v99 = 0;
  int v100 = v99 + v98;
  int v101 = v97[v100];
  int v102 = 4;
  int v103 = v102 + v98;
  int v104 = v97[v103];
  helper0(v98, v96, v101, v104, static_cast<int>(__simt_tid3.x));
  int v105 = 1;
  int v106 = 0;
  int v107 = 0;
  int v108;
  int v109;
  v108 = v106;
  v109 = v107;
  while (true) {
    int v110 = 4;
    int v111 = v109 * v110;
    int v112 = v111 + v98;
    int v113 = 8;
    int v114 = v113 + v112;
    int v115 = v97[v114];
    int v116 = 0;
    bool v117 = v115 != v116;
    v108 = v108;
    v109 = v109;
    if (!v117) break;
    int v118 = 28;
    int v119 = v118 + v98;
    int v120 = v97[v119];
    int v121 = 0;
    bool v122 = v120 != v121;
    int v123;
    if (v122) {
      int v124 = 32;
      int v125 = v124 + v98;
      int v126 = v97[v125];
      int v127 = 0;
      bool v128 = v126 != v127;
      int v129;
      if (v128) {
        int v130 = 4;
        int v131 = v98 + v130;
        v129 = v131;
      } else {
        uint v132 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v133 = (int)(v132);
        v129 = v133;
      }
      v123 = v129;
    } else {
      int v134 = 0;
      int v135 = 0;
      int v136;
      int v137;
      v136 = v134;
      v137 = v135;
      while (true) {
        int v138 = 4;
        int v139 = v137 * v138;
        int v140 = v139 + v98;
        int v141 = 36;
        int v142 = v141 + v140;
        int v143 = v97[v142];
        int v144 = 0;
        bool v145 = v143 != v144;
        v136 = v136;
        v137 = v137;
        if (!v145) break;
        int v146 = v136 + v137;
        int v147 = 1;
        int v148 = v137 + v147;
        v136 = v146;
        v137 = v148;
        continue;
        ;
      }
      bool v149 = true;
      v123 = v136;
    }
    int v150 = v108 + v123;
    int v151 = 1;
    int v152 = v109 + v151;
    v108 = v150;
    v109 = v152;
  }
  bool v153 = true;
  int v154 = 16;
  int v155 = v154 + v98;
  bool v156 = true;
  int v157 = simt_wave_count_bits(v156);
  v96[v155] = v157;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
