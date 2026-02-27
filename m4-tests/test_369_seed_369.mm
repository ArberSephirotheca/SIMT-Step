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
  int v4 = 2;
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          int v15 = 4;
          int v16 = v0 + v15;
          v14 = v16;
        } else {
          int v17 = 1;
          int v18 = v0 + v17;
          v14 = v18;
        }
        v11 = v14;
      } else {
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
          int v28 = 1;
          int v29 = v22 + v28;
          v21 = v0;
          v22 = v29;
        }
        v11 = v21;
      }
      v8 = v11;
    }
    case 1:
      {
      int v30 = 2;
      int v31 = v0 + v30;
      int v32;
      v32 = v31;
      switch (v3) {
        default:
          {
          int v33 = 0;
          bool v34 = v2 != v33;
          int v35;
          if (v34) {
            int v36 = 4;
            int v37 = v0 + v36;
            v35 = v37;
          } else {
            int v38 = 1;
            v35 = v38;
          }
          v32 = v35;
          break;
        }
        case 0:
          {
          int v39 = 2;
          int v40 = v0 + v39;
          v32 = v40;
          break;
        }
      }
      v8 = v32;
    }
    default:
      {
      int v41 = 2;
      int v42 = v3 % v41;
      int v43;
      v43 = v0;
      switch (v42) {
        case 0:
          {
          int v44 = 1;
          int v45 = v0 + v44;
          v43 = v45;
          break;
        }
        default:
          {
          int v46 = 0;
          int v47 = 0;
          int v48;
          int v49;
          v48 = v46;
          v49 = v47;
          while (true) {
            int v50 = 4;
            int v51 = v3 % v50;
            int v52 = 1;
            int v53 = v51 + v52;
            bool v54 = v49 < v53;
            v48 = v48;
            v49 = v49;
            if (!v54) break;
            int v55 = 1;
            int v56 = v49 + v55;
            v48 = v0;
            v49 = v56;
          }
          v43 = v48;
          break;
        }
      }
      v8 = v43;
      break;
    }
  }
  bool v57 = true;
  int v58 = simt_wave_count_bits(v57);
  int v59 = 0;
  int v60 = v59 + v0;
  v1[v60] = v58;
  return;
}

kernel void kernel_main(device int* v61 [[buffer(0)]], device int* v62 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v63 = static_cast<int>(__simt_tid3.x);
  int v64 = 0;
  int v65 = v64 + v63;
  int v66 = v62[v65];
  int v67 = 4;
  int v68 = v67 + v63;
  int v69 = v62[v68];
  helper0(v63, v61, v66, v69, static_cast<int>(__simt_tid3.x));
  int v70 = 8;
  int v71 = v70 + v63;
  int v72 = v62[v71];
  int v73 = 1;
  int v74;
  v74 = v73;
  switch (v72) {
    default:
      {
      int v75 = 0;
      int v76 = 0;
      int v77;
      int v78;
      v77 = v75;
      v78 = v76;
      while (true) {
        int v79 = 4;
        int v80 = v78 * v79;
        int v81 = v80 + v63;
        int v82 = 12;
        int v83 = v82 + v81;
        int v84 = v62[v83];
        int v85 = 0;
        bool v86 = v84 != v85;
        v77 = v77;
        v78 = v78;
        if (!v86) break;
        int v87 = 32;
        int v88 = v87 + v63;
        int v89 = v62[v88];
        int v90 = 0;
        bool v91 = v89 != v90;
        int v92;
        if (v91) {
          int v93 = 4;
          int v94 = v63 + v93;
          v92 = v94;
        } else {
          int v95 = 0;
          v92 = v95;
        }
        int v96 = v77 + v92;
        int v97 = 1;
        int v98 = v78 + v97;
        bool v99 = true;
        v77 = v96;
        v78 = v98;
      }
      v74 = v77;
      break;
    }
    case 0:
      {
      int v100 = 36;
      int v101 = v100 + v63;
      int v102 = v62[v101];
      int v103;
      v103 = v63;
      switch (v102) {
        case 0:
          {
          int v104 = 40;
          int v105 = v104 + v63;
          int v106 = v62[v105];
          int v107 = 0;
          bool v108 = v106 != v107;
          int v109;
          if (v108) {
            v109 = v63;
          } else {
            v109 = v63;
          }
          v103 = v109;
          break;
        }
        default:
          {
          int v110 = 0;
          int v111 = 0;
          int v112;
          int v113;
          v112 = v110;
          v113 = v111;
          while (true) {
            int v114 = 4;
            int v115 = v113 * v114;
            int v116 = v115 + v63;
            int v117 = 44;
            int v118 = v117 + v116;
            int v119 = v62[v118];
            int v120 = 0;
            bool v121 = v119 != v120;
            v112 = v112;
            v113 = v113;
            if (!v121) break;
            int v122 = v112 + v113;
            int v123 = 1;
            int v124 = v113 + v123;
            bool v125 = true;
            v112 = v122;
            v113 = v124;
            break;
            ;
          }
          v103 = v112;
          break;
        }
      }
      v74 = v103;
      break;
    }
    case 1:
      {
      int v126 = 64;
      int v127 = v126 + v63;
      int v128 = v62[v127];
      int v129 = 0;
      bool v130 = v128 != v129;
      int v131;
      if (v130) {
        int v132 = 0;
        int v133 = 0;
        int v134;
        int v135;
        v134 = v132;
        v135 = v133;
        while (true) {
          int v136 = 4;
          int v137 = v135 * v136;
          int v138 = v137 + v63;
          int v139 = 68;
          int v140 = v139 + v138;
          int v141 = v62[v140];
          int v142 = 0;
          bool v143 = v141 != v142;
          v134 = v134;
          v135 = v135;
          if (!v143) break;
          int v144 = v134 + v135;
          int v145 = 1;
          int v146 = v135 + v145;
          bool v147 = true;
          v134 = v144;
          v135 = v146;
        }
        v131 = v134;
      } else {
        int v148 = 0;
        int v149 = 0;
        int v150;
        int v151;
        v150 = v148;
        v151 = v149;
        while (true) {
          int v152 = 4;
          int v153 = v151 * v152;
          int v154 = v153 + v63;
          int v155 = 88;
          int v156 = v155 + v154;
          int v157 = v62[v156];
          int v158 = 0;
          bool v159 = v157 != v158;
          v150 = v150;
          v151 = v151;
          if (!v159) break;
          int v160 = v150 + v151;
          int v161 = 1;
          int v162 = v151 + v161;
          bool v163 = true;
          v150 = v160;
          v151 = v162;
        }
        v131 = v150;
      }
      v74 = v131;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
