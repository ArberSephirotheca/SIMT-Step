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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    int v9 = 3;
    v8 = v9;
  } else {
    int v10 = 2;
    v8 = v10;
  }
  bool v11 = true;
  int v12 = simt_wave_count_bits(v11);
  int v13 = 0;
  int v14 = v13 + v0;
  v1[v14] = v12;
  int v15 = 0;
  bool v16 = v2 != v15;
  int v17 = v16 ? v5 : v8;
  int v18 = 4;
  int v19 = v3 % v18;
  int v20 = 3;
  int v21 = v0 + v20;
  int v22;
  v22 = v21;
  switch (v19) {
    case 0:
      {
      int v23 = 0;
      bool v24 = v2 != v23;
      int v25;
      if (v24) {
        int v26 = 0;
        bool v27 = v2 != v26;
        int v28;
        if (v27) {
          int v29 = 0;
          v28 = v29;
        } else {
          int v30 = 4;
          int v31 = v0 + v30;
          v28 = v31;
        }
        int v32 = 2;
        v25 = v28;
      } else {
        int v33 = 0;
        bool v34 = v2 != v33;
        int v35;
        if (v34) {
          int v36 = 0;
          int v37 = v0 + v36;
          v35 = v37;
        } else {
          int v38 = 0;
          int v39 = v0 + v38;
          v35 = v39;
        }
        int v40 = 2;
        int v41 = v0 + v40;
        v25 = v35;
      }
      int v42 = 0;
      int v43 = v0 + v42;
      v22 = v25;
      break;
    }
    case 1:
      {
      int v44 = 3;
      int v45 = v3 % v44;
      int v46 = 0;
      int v47;
      v47 = v46;
      switch (v45) {
        default:
          {
          int v48 = 3;
          int v49 = v0 + v48;
          v47 = v49;
          break;
        }
        case 0:
          {
          v47 = v0;
          break;
        }
        case 1:
          {
          int v50 = 0;
          bool v51 = v2 != v50;
          int v52;
          if (v51) {
            int v53 = 2;
            int v54 = v0 + v53;
            v52 = v54;
          } else {
            v52 = v0;
          }
          int v55 = 2;
          int v56 = v0 + v55;
          v47 = v52;
          break;
        }
      }
      int v57 = 0;
      int v58 = v0 + v57;
      v22 = v47;
      break;
    }
    default:
      {
      int v59 = 4;
      int v60 = v0 + v59;
      v22 = v60;
      break;
    }
    case 2:
      {
      int v61 = 0;
      bool v62 = v2 != v61;
      int v63;
      if (v62) {
        int v64 = 4;
        v63 = v64;
      } else {
        int v65 = 0;
        bool v66 = v2 != v65;
        int v67;
        if (v66) {
          int v68 = 2;
          v67 = v68;
        } else {
          int v69 = 0;
          v67 = v69;
        }
        int v70 = 3;
        v63 = v67;
      }
      int v71 = 0;
      int v72 = v0 + v71;
      v22 = v63;
      break;
    }
  }
  bool v73 = true;
  int v74 = simt_wave_count_bits(v73);
  int v75 = 16;
  int v76 = v75 + v0;
  v1[v76] = v74;
  int v77 = 0;
  bool v78 = v2 != v77;
  int v79 = v78 ? v17 : v22;
  return;
}

kernel void kernel_main(device int* v80 [[buffer(0)]], device int* v81 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v82 = static_cast<int>(__simt_tid3.x);
  int v83 = 0;
  int v84 = v83 + v82;
  int v85 = v81[v84];
  int v86 = 4;
  int v87 = v86 + v82;
  int v88 = v81[v87];
  helper0(v82, v80, v85, v88, static_cast<int>(__simt_tid3.x));
  int v89 = 8;
  int v90 = v89 + v82;
  int v91 = v81[v90];
  uint v92 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v93 = (int)(v92);
  int v94;
  v94 = v93;
  switch (v91) {
    case 0:
      {
      int v95 = 12;
      int v96 = v95 + v82;
      int v97 = v81[v96];
      int v98 = 0;
      bool v99 = v97 != v98;
      int v100;
      if (v99) {
        int v101 = 0;
        int v102 = 0;
        int v103;
        int v104;
        v103 = v101;
        v104 = v102;
        while (true) {
          int v105 = 4;
          int v106 = v104 * v105;
          int v107 = v106 + v82;
          int v108 = 16;
          int v109 = v108 + v107;
          int v110 = v81[v109];
          int v111 = 0;
          bool v112 = v110 != v111;
          v103 = v103;
          v104 = v104;
          if (!v112) break;
          int v113 = v103 + v104;
          int v114 = 1;
          int v115 = v104 + v114;
          v103 = v113;
          v104 = v115;
        }
        bool v116 = true;
        v100 = v103;
      } else {
        int v117 = 4;
        v100 = v117;
      }
      v94 = v100;
      break;
    }
    case 1:
      {
      int v118 = 0;
      int v119 = v82 + v118;
      v94 = v119;
      break;
    }
    default:
      {
      int v120 = 0;
      int v121 = 0;
      int v122;
      int v123;
      v122 = v120;
      v123 = v121;
      while (true) {
        int v124 = 4;
        int v125 = v123 * v124;
        int v126 = v125 + v82;
        int v127 = 36;
        int v128 = v127 + v126;
        int v129 = v81[v128];
        int v130 = 0;
        bool v131 = v129 != v130;
        v122 = v122;
        v123 = v123;
        if (!v131) break;
        int v132 = 56;
        int v133 = v132 + v82;
        int v134 = v81[v133];
        int v135 = 3;
        int v136 = v82 + v135;
        int v137;
        v137 = v136;
        switch (v134) {
          case 0:
            {
            int v138 = 3;
            int v139 = v82 + v138;
            v137 = v139;
            break;
          }
          default:
            {
            int v140 = 3;
            int v141 = v82 + v140;
            v137 = v141;
          }
          case 1:
            {
            int v142 = 3;
            v137 = v142;
            break;
          }
        }
        bool v143 = true;
        int v144 = v122 + v137;
        int v145 = 1;
        int v146 = v123 + v145;
        v122 = v144;
        v123 = v146;
      }
      bool v147 = true;
      v94 = v122;
      break;
    }
    case 2:
      {
      int v148 = 60;
      int v149 = v148 + v82;
      int v150 = v81[v149];
      int v151 = 0;
      bool v152 = v150 != v151;
      int v153;
      if (v152) {
        int v154 = 64;
        int v155 = v154 + v82;
        int v156 = v81[v155];
        int v157 = 0;
        bool v158 = v156 != v157;
        int v159;
        if (v158) {
          int v160 = 0;
          int v161 = v82 + v160;
          v159 = v161;
        } else {
          int v162 = 1;
          v159 = v162;
        }
        v153 = v159;
      } else {
        int v163 = 2;
        v153 = v163;
      }
      v94 = v153;
      break;
    }
  }
  bool v164 = true;
  int v165 = 32;
  int v166 = v165 + v82;
  bool v167 = true;
  int v168 = simt_wave_count_bits(v167);
  v80[v166] = v168;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
