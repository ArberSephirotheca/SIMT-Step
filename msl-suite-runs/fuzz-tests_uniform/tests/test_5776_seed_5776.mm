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
  int v6 = 1;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 4;
        int v13 = v3 % v12;
        int v14 = 2;
        int v15 = v0 + v14;
        int v16;
        v16 = v15;
        switch (v13) {
          default:
            {
            v16 = v0;
            break;
          }
          case 0:
            {
            int v17 = 3;
            v16 = v17;
            break;
          }
          case 1:
            {
            int v18 = 4;
            v16 = v18;
            break;
          }
          case 2:
            {
            int v19 = 1;
            v16 = v19;
            break;
          }
        }
        int v20 = 4;
        int v21 = v0 + v20;
        v11 = v16;
      } else {
        int v22 = 0;
        bool v23 = v2 != v22;
        int v24;
        if (v23) {
          int v25 = 0;
          int v26 = v0 + v25;
          v24 = v26;
        } else {
          int v27 = 1;
          int v28 = v0 + v27;
          v24 = v28;
        }
        v11 = v24;
      }
      int v29 = 0;
      int v30 = v0 + v29;
      v8 = v11;
      break;
    }
    case 1:
      {
      int v31 = 0;
      bool v32 = v2 != v31;
      int v33;
      if (v32) {
        int v34 = 0;
        bool v35 = v2 != v34;
        int v36;
        if (v35) {
          v36 = v0;
        } else {
          int v37 = 3;
          int v38 = v0 + v37;
          v36 = v38;
        }
        int v39 = 2;
        int v40 = v0 + v39;
        v33 = v36;
      } else {
        int v41 = 1;
        int v42 = v0 + v41;
        int v43;
        v43 = v42;
        switch (v3) {
          default:
            {
            int v44 = 3;
            int v45 = v0 + v44;
            v43 = v45;
            break;
          }
          case 0:
            {
            int v46 = 4;
            int v47 = v0 + v46;
            v43 = v47;
            break;
          }
        }
        v33 = v43;
      }
      int v48 = 0;
      v8 = v33;
      break;
    }
    case 2:
      {
      int v49 = 0;
      bool v50 = v2 != v49;
      int v51;
      if (v50) {
        int v52 = 0;
        int v53 = 0;
        int v54;
        int v55;
        v54 = v52;
        v55 = v53;
        while (true) {
          int v56 = 4;
          int v57 = v3 % v56;
          int v58 = 1;
          int v59 = v57 + v58;
          bool v60 = v55 < v59;
          v54 = v54;
          v55 = v55;
          if (!v60) break;
          int v61 = 4;
          int v62 = v0 + v61;
          int v63 = 1;
          int v64 = v55 + v63;
          v54 = v62;
          v55 = v64;
        }
        v51 = v54;
      } else {
        int v65 = 0;
        int v66 = 0;
        int v67;
        int v68;
        v67 = v65;
        v68 = v66;
        while (true) {
          int v69 = 4;
          int v70 = v3 % v69;
          int v71 = 1;
          int v72 = v70 + v71;
          bool v73 = v68 < v72;
          v67 = v67;
          v68 = v68;
          if (!v73) break;
          int v74 = 3;
          int v75 = v0 + v74;
          int v76 = 1;
          int v77 = v68 + v76;
          v67 = v75;
          v68 = v77;
        }
        v51 = v67;
      }
      v8 = v51;
      break;
    }
    default:
      {
      int v78 = 0;
      v8 = v78;
      break;
    }
  }
  bool v79 = true;
  int v80 = simt_wave_count_bits(v79);
  int v81 = 0;
  int v82 = v81 + v0;
  v1[v82] = v80;
  return;
}

kernel void kernel_main(device int* v83 [[buffer(0)]], device int* v84 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v85 = static_cast<int>(__simt_tid3.x);
  int v86 = 0;
  int v87 = v86 + v85;
  int v88 = v84[v87];
  int v89 = 4;
  int v90 = v89 + v85;
  int v91 = v84[v90];
  helper0(v85, v83, v88, v91, static_cast<int>(__simt_tid3.x));
  int v92 = 8;
  int v93 = v92 + v85;
  int v94 = v84[v93];
  int v95 = 0;
  int v96;
  v96 = v95;
  switch (v94) {
    default:
      {
      int v97 = 12;
      int v98 = v97 + v85;
      int v99 = v84[v98];
      int v100 = 0;
      bool v101 = v99 != v100;
      int v102;
      if (v101) {
        v102 = v85;
      } else {
        int v103 = 16;
        int v104 = v103 + v85;
        int v105 = v84[v104];
        int v106 = 0;
        bool v107 = v105 != v106;
        int v108;
        if (v107) {
          v108 = v85;
        } else {
          int v109 = 3;
          int v110 = v85 + v109;
          v108 = v110;
        }
        v102 = v108;
      }
      v96 = v102;
      break;
    }
    case 0:
      {
      int v111 = 20;
      int v112 = v111 + v85;
      int v113 = v84[v112];
      int v114 = 0;
      bool v115 = v113 != v114;
      int v116;
      if (v115) {
        int v117 = 0;
        int v118 = 0;
        int v119;
        int v120;
        v119 = v117;
        v120 = v118;
        while (true) {
          int v121 = 4;
          int v122 = v120 * v121;
          int v123 = v122 + v85;
          int v124 = 24;
          int v125 = v124 + v123;
          int v126 = v84[v125];
          int v127 = 0;
          bool v128 = v126 != v127;
          v119 = v119;
          v120 = v120;
          if (!v128) break;
          int v129 = v119 + v120;
          int v130 = 1;
          int v131 = v120 + v130;
          v119 = v129;
          v120 = v131;
        }
        bool v132 = true;
        v116 = v119;
      } else {
        int v133 = 44;
        int v134 = v133 + v85;
        int v135 = v84[v134];
        int v136 = 0;
        bool v137 = v135 != v136;
        int v138;
        if (v137) {
          int v139 = 4;
          v138 = v139;
        } else {
          v138 = v85;
        }
        v116 = v138;
      }
      v96 = v116;
      break;
    }
  }
  bool v140 = true;
  int v141 = 16;
  int v142 = v141 + v85;
  bool v143 = true;
  int v144 = simt_wave_count_bits(v143);
  v83[v142] = v144;
  int v145 = 0;
  int v146 = 0;
  int v147;
  int v148;
  v147 = v145;
  v148 = v146;
  while (true) {
    int v149 = 4;
    int v150 = v148 * v149;
    int v151 = v150 + v85;
    int v152 = 48;
    int v153 = v152 + v151;
    int v154 = v84[v153];
    int v155 = 0;
    bool v156 = v154 != v155;
    v147 = v147;
    v148 = v148;
    if (!v156) break;
    int v157 = v147 + v148;
    int v158 = 1;
    int v159 = v148 + v158;
    v147 = v157;
    v148 = v159;
  }
  bool v160 = true;
  int v161 = 32;
  int v162 = v161 + v85;
  bool v163 = true;
  int v164 = simt_wave_count_bits(v163);
  v83[v162] = v164;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
