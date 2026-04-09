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
  int v8 = 0;
  int v9 = 0;
  int v10;
  int v11;
  v10 = v8;
  v11 = v9;
  while (true) {
    int v12 = 4;
    int v13 = v3 % v12;
    int v14 = 1;
    int v15 = v13 + v14;
    bool v16 = v11 < v15;
    v10 = v10;
    v11 = v11;
    if (!v16) break;
    int v17 = 4;
    int v18 = v3 % v17;
    int v19;
    v19 = v0;
    switch (v18) {
      case 0:
        {
        int v20 = 3;
        int v21 = v3 % v20;
        int v22;
        v22 = v0;
        switch (v21) {
          case 0:
            {
            v22 = v0;
          }
          case 1:
            {
            v22 = v0;
          }
          case 2:
            {
            int v23 = 2;
            v22 = v23;
          }
          default:
            {
            int v24 = 1;
            int v25 = v0 + v24;
            v22 = v25;
            break;
          }
        }
        v19 = v22;
      }
      case 1:
        {
        int v26 = 0;
        bool v27 = v2 != v26;
        int v28;
        if (v27) {
          v28 = v0;
        } else {
          v28 = v0;
        }
        v19 = v28;
        break;
      }
      default:
        {
        int v29 = 0;
        bool v30 = v2 != v29;
        int v31;
        if (v30) {
          int v32 = 3;
          int v33 = v0 + v32;
          v31 = v33;
        } else {
          int v34 = 2;
          v31 = v34;
        }
        v19 = v31;
      }
      case 2:
        {
        int v35 = 0;
        bool v36 = v2 != v35;
        int v37;
        if (v36) {
          int v38 = 0;
          int v39 = v0 + v38;
          v37 = v39;
        } else {
          int v40 = 4;
          v37 = v40;
        }
        v19 = v37;
        break;
      }
    }
    bool v41 = true;
    int v42 = simt_wave_count_bits(v41);
    int v43 = 16;
    int v44 = 4;
    int v45 = v11 * v44;
    int v46 = v43 + v45;
    int v47 = v46 + v0;
    v1[v47] = v42;
    int v48 = 1;
    int v49 = v11 + v48;
    v10 = v19;
    v11 = v49;
    break;
    ;
  }
  int v50 = 0;
  bool v51 = v2 != v50;
  int v52 = v51 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v53 [[buffer(0)]], device int* v54 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v55 = static_cast<int>(__simt_tid3.x);
  int v56 = 0;
  int v57 = v56 + v55;
  int v58 = v54[v57];
  int v59 = 4;
  int v60 = v59 + v55;
  int v61 = v54[v60];
  helper0(v55, v53, v58, v61, static_cast<int>(__simt_tid3.x));
  int v62 = 0;
  int v63 = 0;
  int v64;
  int v65;
  v64 = v62;
  v65 = v63;
  while (true) {
    int v66 = 4;
    int v67 = v65 * v66;
    int v68 = v67 + v55;
    int v69 = 8;
    int v70 = v69 + v68;
    int v71 = v54[v70];
    int v72 = 0;
    bool v73 = v71 != v72;
    v64 = v64;
    v65 = v65;
    if (!v73) break;
    int v74 = v64 + v65;
    int v75 = 1;
    int v76 = v65 + v75;
    bool v77 = true;
    int v78 = 32;
    int v79 = 4;
    int v80 = v65 * v79;
    int v81 = v78 + v80;
    int v82 = v81 + v55;
    bool v83 = true;
    int v84 = simt_wave_count_bits(v83);
    v53[v82] = v84;
    v64 = v74;
    v65 = v76;
  }
  int v85 = 28;
  int v86 = v85 + v55;
  int v87 = v54[v86];
  uint v88 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v89 = (int)(v88);
  int v90;
  v90 = v89;
  switch (v87) {
    case 0:
      {
      int v91 = 32;
      int v92 = v91 + v55;
      int v93 = v54[v92];
      int v94 = 0;
      int v95 = v55 + v94;
      int v96;
      v96 = v95;
      switch (v93) {
        default:
          {
          int v97 = 0;
          int v98 = 0;
          int v99;
          int v100;
          v99 = v97;
          v100 = v98;
          while (true) {
            int v101 = 4;
            int v102 = v100 * v101;
            int v103 = v102 + v55;
            int v104 = 36;
            int v105 = v104 + v103;
            int v106 = v54[v105];
            int v107 = 0;
            bool v108 = v106 != v107;
            v99 = v99;
            v100 = v100;
            if (!v108) break;
            int v109 = v99 + v100;
            int v110 = 1;
            int v111 = v100 + v110;
            bool v112 = true;
            v99 = v109;
            v100 = v111;
          }
          v96 = v99;
        }
        case 0:
          {
          int v113 = 56;
          int v114 = v113 + v55;
          int v115 = v54[v114];
          int v116 = 0;
          bool v117 = v115 != v116;
          int v118;
          if (v117) {
            int v119 = 0;
            v118 = v119;
          } else {
            int v120 = 1;
            int v121 = v55 + v120;
            v118 = v121;
          }
          v96 = v118;
          break;
        }
      }
      v90 = v96;
      break;
    }
    default:
      {
      int v122 = 60;
      int v123 = v122 + v55;
      int v124 = v54[v123];
      int v125 = 0;
      bool v126 = v124 != v125;
      int v127;
      if (v126) {
        int v128 = 64;
        int v129 = v128 + v55;
        int v130 = v54[v129];
        int v131 = 0;
        bool v132 = v130 != v131;
        int v133;
        if (v132) {
          v133 = v55;
        } else {
          int v134 = 1;
          int v135 = v55 + v134;
          v133 = v135;
        }
        v127 = v133;
      } else {
        int v136 = 0;
        int v137 = 0;
        int v138;
        int v139;
        v138 = v136;
        v139 = v137;
        while (true) {
          int v140 = 4;
          int v141 = v139 * v140;
          int v142 = v141 + v55;
          int v143 = 68;
          int v144 = v143 + v142;
          int v145 = v54[v144];
          int v146 = 0;
          bool v147 = v145 != v146;
          v138 = v138;
          v139 = v139;
          if (!v147) break;
          int v148 = v138 + v139;
          int v149 = 1;
          int v150 = v139 + v149;
          bool v151 = true;
          v138 = v148;
          v139 = v150;
          continue;
          ;
        }
        v127 = v138;
      }
      v90 = v127;
      break;
    }
    case 1:
      {
      int v152 = 88;
      int v153 = v152 + v55;
      int v154 = v54[v153];
      int v155 = 0;
      bool v156 = v154 != v155;
      int v157;
      if (v156) {
        int v158 = 92;
        int v159 = v158 + v55;
        int v160 = v54[v159];
        int v161 = 4;
        int v162 = v55 + v161;
        int v163;
        v163 = v162;
        switch (v160) {
          default:
            {
            int v164 = 2;
            v163 = v164;
          }
          case 0:
            {
            int v165 = 2;
            v163 = v165;
          }
          case 1:
            {
            int v166 = 2;
            int v167 = v55 + v166;
            v163 = v167;
            break;
          }
          case 2:
            {
            int v168 = 2;
            int v169 = v55 + v168;
            v163 = v169;
            break;
          }
        }
        v157 = v163;
      } else {
        v157 = v55;
      }
      v90 = v157;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
