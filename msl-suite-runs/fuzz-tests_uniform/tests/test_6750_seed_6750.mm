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
  int v5 = 3;
  int v6 = v3 % v5;
  uint v7 = simt_lane_id(__simt_tid);
  int v8 = (int)(v7);
  int v9;
  v9 = v8;
  switch (v6) {
    case 0:
      {
      int v10 = 0;
      int v11 = 0;
      int v12;
      int v13;
      v12 = v10;
      v13 = v11;
      while (true) {
        int v14 = 4;
        int v15 = v3 % v14;
        int v16 = 1;
        int v17 = v15 + v16;
        bool v18 = v13 < v17;
        v12 = v12;
        v13 = v13;
        if (!v18) break;
        int v19 = 0;
        bool v20 = v2 != v19;
        int v21;
        if (v20) {
          int v22 = 4;
          int v23 = v0 + v22;
          v21 = v23;
        } else {
          v21 = v0;
        }
        int v24 = 1;
        int v25 = v13 + v24;
        v12 = v21;
        v13 = v25;
      }
      int v26 = 4;
      v9 = v12;
      break;
    }
    default:
      {
      int v27;
      v27 = v0;
      switch (v3) {
        default:
          {
          int v28 = 4;
          int v29 = v3 % v28;
          int v30;
          v30 = v0;
          switch (v29) {
            case 0:
              {
              v30 = v0;
              break;
            }
            default:
              {
              int v31 = 4;
              int v32 = v0 + v31;
              v30 = v32;
            }
            case 1:
              {
              int v33 = 0;
              v30 = v33;
            }
            case 2:
              {
              int v34 = 2;
              v30 = v34;
              break;
            }
          }
          int v35 = 2;
          v27 = v30;
          break;
        }
        case 0:
          {
          int v36 = 3;
          int v37 = v3 % v36;
          int v38 = 2;
          int v39;
          v39 = v38;
          switch (v37) {
            case 0:
              {
              v39 = v0;
              break;
            }
            default:
              {
              int v40 = 2;
              v39 = v40;
            }
            case 1:
              {
              int v41 = 4;
              v39 = v41;
            }
            case 2:
              {
              v39 = v0;
              break;
            }
          }
          int v42 = 3;
          v27 = v39;
          break;
        }
      }
      int v43 = 0;
      int v44 = v0 + v43;
      v9 = v27;
      break;
    }
    case 1:
      {
      int v45 = 0;
      bool v46 = v2 != v45;
      int v47;
      if (v46) {
        int v48 = 3;
        int v49 = v3 % v48;
        int v50 = 3;
        int v51 = v0 + v50;
        int v52;
        v52 = v51;
        switch (v49) {
          default:
            {
            v52 = v0;
            break;
          }
          case 0:
            {
            v52 = v0;
            break;
          }
          case 1:
            {
            int v53 = 3;
            v52 = v53;
            break;
          }
        }
        int v54 = 2;
        int v55 = v0 + v54;
        v47 = v52;
      } else {
        v47 = v0;
      }
      int v56 = 2;
      v9 = v47;
      break;
    }
  }
  bool v57 = true;
  int v58 = simt_wave_count_bits(v57);
  int v59 = 0;
  int v60 = v59 + v0;
  v1[v60] = v58;
  int v61 = 0;
  bool v62 = v2 != v61;
  int v63 = v62 ? v4 : v9;
  return;
}

kernel void kernel_main(device int* v64 [[buffer(0)]], device int* v65 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v66 = static_cast<int>(__simt_tid3.x);
  int v67 = 0;
  int v68 = v67 + v66;
  int v69 = v65[v68];
  int v70 = 4;
  int v71 = v70 + v66;
  int v72 = v65[v71];
  helper0(v66, v64, v69, v72, static_cast<int>(__simt_tid3.x));
  int v73 = 8;
  int v74 = v73 + v66;
  int v75 = v65[v74];
  uint v76 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v77 = (int)(v76);
  int v78;
  v78 = v77;
  switch (v75) {
    case 0:
      {
      int v79 = 1;
      v78 = v79;
    }
    default:
      {
      int v80 = 12;
      int v81 = v80 + v66;
      int v82 = v65[v81];
      int v83 = 0;
      bool v84 = v82 != v83;
      int v85;
      if (v84) {
        int v86 = 16;
        int v87 = v86 + v66;
        int v88 = v65[v87];
        int v89;
        v89 = v66;
        switch (v88) {
          case 0:
            {
            int v90 = 4;
            v89 = v90;
            break;
          }
          case 1:
            {
            int v91 = 2;
            int v92 = v66 + v91;
            v89 = v92;
            break;
          }
          default:
            {
            int v93 = 1;
            int v94 = v66 + v93;
            v89 = v94;
            break;
          }
        }
        bool v95 = true;
        v85 = v89;
      } else {
        int v96 = 20;
        int v97 = v96 + v66;
        int v98 = v65[v97];
        int v99 = 0;
        bool v100 = v98 != v99;
        int v101;
        if (v100) {
          int v102 = 1;
          int v103 = v66 + v102;
          v101 = v103;
        } else {
          v101 = v66;
        }
        v85 = v101;
      }
      v78 = v85;
      break;
    }
    case 1:
      {
      int v104 = 24;
      int v105 = v104 + v66;
      int v106 = v65[v105];
      int v107 = 0;
      bool v108 = v106 != v107;
      int v109;
      if (v108) {
        int v110 = 0;
        int v111 = 0;
        int v112;
        int v113;
        v112 = v110;
        v113 = v111;
        while (true) {
          int v114 = 4;
          int v115 = v113 * v114;
          int v116 = v115 + v66;
          int v117 = 28;
          int v118 = v117 + v116;
          int v119 = v65[v118];
          int v120 = 0;
          bool v121 = v119 != v120;
          v112 = v112;
          v113 = v113;
          if (!v121) break;
          int v122 = v112 + v113;
          int v123 = 1;
          int v124 = v113 + v123;
          v112 = v122;
          v113 = v124;
          break;
          ;
        }
        bool v125 = true;
        v109 = v112;
      } else {
        int v126 = 0;
        int v127 = 0;
        int v128;
        int v129;
        v128 = v126;
        v129 = v127;
        while (true) {
          int v130 = 4;
          int v131 = v129 * v130;
          int v132 = v131 + v66;
          int v133 = 48;
          int v134 = v133 + v132;
          int v135 = v65[v134];
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
        v109 = v128;
      }
      v78 = v109;
      break;
    }
    case 2:
      {
      int v142 = 68;
      int v143 = v142 + v66;
      int v144 = v65[v143];
      int v145 = 0;
      bool v146 = v144 != v145;
      int v147;
      if (v146) {
        int v148 = 72;
        int v149 = v148 + v66;
        int v150 = v65[v149];
        int v151 = 3;
        int v152 = v66 + v151;
        int v153;
        v153 = v152;
        switch (v150) {
          case 0:
            {
            v153 = v66;
            break;
          }
          case 1:
            {
            v153 = v66;
          }
          case 2:
            {
            int v154 = 4;
            v153 = v154;
          }
          default:
            {
            int v155 = 1;
            int v156 = v66 + v155;
            v153 = v156;
            break;
          }
        }
        bool v157 = true;
        v147 = v153;
      } else {
        int v158 = 76;
        int v159 = v158 + v66;
        int v160 = v65[v159];
        int v161 = 3;
        int v162;
        v162 = v161;
        switch (v160) {
          default:
            {
            v162 = v66;
            break;
          }
          case 0:
            {
            int v163 = 2;
            int v164 = v66 + v163;
            v162 = v164;
            break;
          }
        }
        bool v165 = true;
        v147 = v162;
      }
      v78 = v147;
      break;
    }
  }
  bool v166 = true;
  int v167 = 16;
  int v168 = v167 + v66;
  bool v169 = true;
  int v170 = simt_wave_count_bits(v169);
  v64[v168] = v170;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
