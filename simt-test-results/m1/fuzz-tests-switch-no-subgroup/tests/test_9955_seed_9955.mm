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
  int v4 = 4;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 2;
      int v10 = v0 + v9;
      int v11;
      v11 = v10;
      switch (v3) {
        case 0:
          {
          int v12 = 0;
          bool v13 = v2 != v12;
          int v14;
          if (v13) {
            int v15 = 4;
            int v16 = v0 + v15;
            v14 = v16;
          } else {
            v14 = v0;
          }
          v11 = v14;
          break;
        }
        default:
          {
          int v17 = 0;
          int v18 = 0;
          int v19;
          int v20;
          v19 = v17;
          v20 = v18;
          while (true) {
            int v21 = 4;
            int v22 = v3 % v21;
            int v23 = 1;
            int v24 = v22 + v23;
            bool v25 = v20 < v24;
            v19 = v19;
            v20 = v20;
            if (!v25) break;
            int v26 = 1;
            int v27 = v20 + v26;
            v19 = v0;
            v20 = v27;
          }
          v11 = v19;
          break;
        }
      }
      int v28 = 1;
      int v29 = v0 + v28;
      v8 = v11;
      break;
    }
    case 1:
      {
      int v30 = 2;
      int v31 = v3 % v30;
      int v32 = 0;
      int v33 = v0 + v32;
      int v34;
      v34 = v33;
      switch (v31) {
        case 0:
          {
          int v35 = 0;
          bool v36 = v2 != v35;
          int v37;
          if (v36) {
            int v38 = 1;
            int v39 = v0 + v38;
            v37 = v39;
          } else {
            int v40 = 0;
            int v41 = v0 + v40;
            v37 = v41;
          }
          v34 = v37;
        }
        default:
          {
          int v42 = 0;
          bool v43 = v2 != v42;
          int v44;
          if (v43) {
            int v45 = 1;
            int v46 = v0 + v45;
            v44 = v46;
          } else {
            v44 = v0;
          }
          v34 = v44;
          break;
        }
      }
      v8 = v34;
      break;
    }
    case 2:
      {
      int v47 = 0;
      bool v48 = v2 != v47;
      int v49;
      if (v48) {
        int v50 = 0;
        bool v51 = v2 != v50;
        int v52;
        if (v51) {
          int v53 = 1;
          int v54 = v0 + v53;
          v52 = v54;
        } else {
          int v55 = 4;
          v52 = v55;
        }
        v49 = v52;
      } else {
        int v56 = 2;
        int v57 = v3 % v56;
        int v58;
        v58 = v0;
        switch (v57) {
          case 0:
            {
            int v59 = 0;
            v58 = v59;
          }
          case 1:
            {
            int v60 = 2;
            v58 = v60;
            break;
          }
          default:
            {
            int v61 = 2;
            int v62 = v0 + v61;
            v58 = v62;
            break;
          }
        }
        v49 = v58;
      }
      v8 = v49;
      break;
    }
    default:
      {
      int v63 = 0;
      bool v64 = v2 != v63;
      int v65;
      if (v64) {
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
          int v76 = v0 + v75;
          int v77 = 1;
          int v78 = v69 + v77;
          v68 = v76;
          v69 = v78;
        }
        v65 = v68;
      } else {
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
          int v88 = 2;
          int v89 = 1;
          int v90 = v82 + v89;
          v81 = v88;
          v82 = v90;
        }
        v65 = v81;
      }
      v8 = v65;
      break;
    }
  }
  bool v91 = true;
  int v92 = simt_wave_count_bits(v91);
  int v93 = 0;
  int v94 = v93 + v0;
  v1[v94] = v92;
  return;
}

kernel void kernel_main(device int* v95 [[buffer(0)]], device int* v96 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v97 = static_cast<int>(__simt_tid3.x);
  int v98 = 0;
  int v99 = v98 + v97;
  int v100 = v96[v99];
  int v101 = 4;
  int v102 = v101 + v97;
  int v103 = v96[v102];
  helper0(v97, v95, v100, v103, static_cast<int>(__simt_tid3.x));
  int v104 = 8;
  int v105 = v104 + v97;
  int v106 = v96[v105];
  uint v107 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v108 = (int)(v107);
  int v109;
  v109 = v108;
  switch (v106) {
    case 0:
      {
      int v110 = 3;
      v109 = v110;
      break;
    }
    default:
      {
      int v111 = 12;
      int v112 = v111 + v97;
      int v113 = v96[v112];
      int v114;
      v114 = v97;
      switch (v113) {
        case 0:
          {
          int v115 = 16;
          int v116 = v115 + v97;
          int v117 = v96[v116];
          int v118;
          v118 = v97;
          switch (v117) {
            case 0:
              {
              int v119 = 2;
              int v120 = v97 + v119;
              v118 = v120;
              break;
            }
            case 1:
              {
              int v121 = 1;
              int v122 = v97 + v121;
              v118 = v122;
              break;
            }
            default:
              {
              int v123 = 3;
              v118 = v123;
              break;
            }
            case 2:
              {
              v118 = v97;
              break;
            }
          }
          v114 = v118;
          break;
        }
        case 1:
          {
          int v124 = 4;
          v114 = v124;
          break;
        }
        default:
          {
          int v125 = 20;
          int v126 = v125 + v97;
          int v127 = v96[v126];
          int v128 = 0;
          bool v129 = v127 != v128;
          int v130;
          if (v129) {
            int v131 = 3;
            v130 = v131;
          } else {
            int v132 = 2;
            int v133 = v97 + v132;
            v130 = v133;
          }
          v114 = v130;
          break;
        }
        case 2:
          {
          int v134 = 24;
          int v135 = v134 + v97;
          int v136 = v96[v135];
          int v137 = 2;
          int v138 = v97 + v137;
          int v139;
          v139 = v138;
          switch (v136) {
            case 0:
              {
              v139 = v97;
              break;
            }
            default:
              {
              int v140 = 4;
              int v141 = v97 + v140;
              v139 = v141;
              break;
            }
          }
          v114 = v139;
          break;
        }
      }
      v109 = v114;
      break;
    }
    case 1:
      {
      int v142 = 0;
      int v143 = 0;
      int v144;
      int v145;
      v144 = v142;
      v145 = v143;
      while (true) {
        int v146 = 4;
        int v147 = v145 * v146;
        int v148 = v147 + v97;
        int v149 = 28;
        int v150 = v149 + v148;
        int v151 = v96[v150];
        int v152 = 0;
        bool v153 = v151 != v152;
        v144 = v144;
        v145 = v145;
        if (!v153) break;
        int v154 = v144 + v145;
        int v155 = 1;
        int v156 = v145 + v155;
        bool v157 = true;
        v144 = v154;
        v145 = v156;
        break;
        ;
      }
      v109 = v144;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
