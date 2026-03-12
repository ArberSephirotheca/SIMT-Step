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
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 4;
        v11 = v12;
      } else {
        int v13 = 1;
        v11 = v13;
      }
      int v14 = 3;
      v8 = v11;
      break;
    }
    case 1:
      {
      int v15 = 0;
      int v16 = 0;
      int v17;
      int v18;
      v17 = v15;
      v18 = v16;
      while (true) {
        int v19 = 4;
        int v20 = v3 % v19;
        int v21 = 1;
        int v22 = v20 + v21;
        bool v23 = v18 < v22;
        v17 = v17;
        v18 = v18;
        if (!v23) break;
        int v24 = 0;
        bool v25 = v2 != v24;
        int v26;
        if (v25) {
          int v27 = 4;
          v26 = v27;
        } else {
          int v28 = 3;
          v26 = v28;
        }
        int v29 = 1;
        int v30 = 1;
        int v31 = v18 + v30;
        v17 = v26;
        v18 = v31;
      }
      v8 = v17;
      break;
    }
    case 2:
      {
      int v32 = 0;
      int v33 = 0;
      int v34;
      int v35;
      v34 = v32;
      v35 = v33;
      while (true) {
        int v36 = 4;
        int v37 = v3 % v36;
        int v38 = 1;
        int v39 = v37 + v38;
        bool v40 = v35 < v39;
        v34 = v34;
        v35 = v35;
        if (!v40) break;
        int v41 = 4;
        int v42 = v3 % v41;
        int v43 = 0;
        int v44;
        v44 = v43;
        switch (v42) {
          case 0:
            {
            int v45 = 2;
            v44 = v45;
            break;
          }
          default:
            {
            v44 = v0;
            break;
          }
          case 1:
            {
            v44 = v0;
            break;
          }
          case 2:
            {
            int v46 = 0;
            v44 = v46;
            break;
          }
        }
        int v47 = 2;
        int v48 = v0 + v47;
        int v49 = 1;
        int v50 = v35 + v49;
        v34 = v44;
        v35 = v50;
      }
      v8 = v34;
      break;
    }
    default:
      {
      int v51 = 4;
      int v52 = v3 % v51;
      int v53 = 3;
      int v54 = v0 + v53;
      int v55;
      v55 = v54;
      switch (v52) {
        default:
          {
          int v56 = 3;
          int v57 = v3 % v56;
          int v58 = 2;
          int v59 = v0 + v58;
          int v60;
          v60 = v59;
          switch (v57) {
            case 0:
              {
              int v61 = 3;
              v60 = v61;
              break;
            }
            case 1:
              {
              v60 = v0;
              break;
            }
            default:
              {
              int v62 = 1;
              v60 = v62;
              break;
            }
          }
          v55 = v60;
          break;
        }
        case 0:
          {
          int v63 = 3;
          int v64 = v0 + v63;
          v55 = v64;
          break;
        }
        case 1:
          {
          int v65 = 3;
          int v66 = v3 % v65;
          int v67;
          v67 = v0;
          switch (v66) {
            default:
              {
              v67 = v0;
              break;
            }
            case 0:
              {
              int v68 = 4;
              v67 = v68;
              break;
            }
            case 1:
              {
              v67 = v0;
              break;
            }
          }
          v55 = v67;
          break;
        }
        case 2:
          {
          int v69 = 0;
          int v70 = 0;
          int v71;
          int v72;
          v71 = v69;
          v72 = v70;
          while (true) {
            int v73 = 4;
            int v74 = v3 % v73;
            int v75 = 1;
            int v76 = v74 + v75;
            bool v77 = v72 < v76;
            v71 = v71;
            v72 = v72;
            if (!v77) break;
            int v78 = 1;
            int v79 = v72 + v78;
            v71 = v0;
            v72 = v79;
          }
          int v80 = 4;
          v55 = v71;
          break;
        }
      }
      int v81 = 2;
      int v82 = v0 + v81;
      v8 = v55;
      break;
    }
  }
  bool v83 = true;
  int v84 = simt_wave_count_bits(v83);
  int v85 = 0;
  int v86 = v85 + v0;
  v1[v86] = v84;
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
  int v100;
  v100 = v99;
  switch (v98) {
    case 0:
      {
      int v101 = 12;
      int v102 = v101 + v89;
      int v103 = v88[v102];
      int v104 = 0;
      bool v105 = v103 != v104;
      int v106;
      if (v105) {
        int v107 = 16;
        int v108 = v107 + v89;
        int v109 = v88[v108];
        int v110 = 0;
        bool v111 = v109 != v110;
        int v112;
        if (v111) {
          int v113 = 4;
          v112 = v113;
        } else {
          v112 = v89;
        }
        v106 = v112;
      } else {
        int v114 = 20;
        int v115 = v114 + v89;
        int v116 = v88[v115];
        int v117 = 0;
        int v118;
        v118 = v117;
        switch (v116) {
          case 0:
            {
            int v119 = 2;
            int v120 = v89 + v119;
            v118 = v120;
          }
          case 1:
            {
            v118 = v89;
            break;
          }
          default:
            {
            int v121 = 4;
            v118 = v121;
            break;
          }
        }
        bool v122 = true;
        v106 = v118;
      }
      v100 = v106;
    }
    default:
      {
      int v123 = 24;
      int v124 = v123 + v89;
      int v125 = v88[v124];
      int v126 = 0;
      int v127;
      v127 = v126;
      switch (v125) {
        default:
          {
          v127 = v89;
          break;
        }
        case 0:
          {
          int v128 = 28;
          int v129 = v128 + v89;
          int v130 = v88[v129];
          int v131 = 4;
          int v132;
          v132 = v131;
          switch (v130) {
            default:
              {
              int v133 = 4;
              int v134 = v89 + v133;
              v132 = v134;
            }
            case 0:
              {
              int v135 = 3;
              int v136 = v89 + v135;
              v132 = v136;
            }
            case 1:
              {
              int v137 = 4;
              int v138 = v89 + v137;
              v132 = v138;
              break;
            }
          }
          bool v139 = true;
          v127 = v132;
          break;
        }
      }
      bool v140 = true;
      v100 = v127;
      break;
    }
    case 1:
      {
      int v141 = 0;
      int v142 = 0;
      int v143;
      int v144;
      v143 = v141;
      v144 = v142;
      while (true) {
        int v145 = 4;
        int v146 = v144 * v145;
        int v147 = v146 + v89;
        int v148 = 32;
        int v149 = v148 + v147;
        int v150 = v88[v149];
        int v151 = 0;
        bool v152 = v150 != v151;
        v143 = v143;
        v144 = v144;
        if (!v152) break;
        int v153 = 52;
        int v154 = v153 + v89;
        int v155 = v88[v154];
        int v156 = 0;
        bool v157 = v155 != v156;
        int v158;
        if (v157) {
          int v159 = 4;
          int v160 = v89 + v159;
          v158 = v160;
        } else {
          int v161 = 0;
          v158 = v161;
        }
        int v162 = v143 + v158;
        int v163 = 1;
        int v164 = v144 + v163;
        v143 = v162;
        v144 = v164;
        continue;
        ;
      }
      bool v165 = true;
      v100 = v143;
      break;
    }
  }
  bool v166 = true;
  int v167 = 16;
  int v168 = v167 + v89;
  bool v169 = true;
  int v170 = simt_wave_count_bits(v169);
  v87[v168] = v170;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
