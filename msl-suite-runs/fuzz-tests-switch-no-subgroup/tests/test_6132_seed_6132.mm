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
  int v4 = 0;
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    int v13 = 0;
    bool v14 = v2 != v13;
    int v15;
    if (v14) {
      bool v16 = true;
      int v17 = simt_wave_count_bits(v16);
      int v18 = 0;
      int v19 = 4;
      int v20 = v7 * v19;
      int v21 = v18 + v20;
      int v22 = v21 + v0;
      v1[v22] = v17;
      v15 = v17;
    } else {
      int v23 = 2;
      int v24 = v3 % v23;
      int v25 = 4;
      int v26;
      v26 = v25;
      switch (v24) {
        case 0:
          {
          v26 = v0;
          break;
        }
        default:
          {
          int v27 = 4;
          v26 = v27;
          break;
        }
      }
      v15 = v26;
    }
    int v28 = 1;
    int v29 = v7 + v28;
    v6 = v15;
    v7 = v29;
    continue;
    ;
  }
  return;
}

kernel void kernel_main(device int* v30 [[buffer(0)]], device int* v31 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v32 = static_cast<int>(__simt_tid3.x);
  int v33 = 0;
  int v34 = v33 + v32;
  int v35 = v31[v34];
  int v36 = 4;
  int v37 = v36 + v32;
  int v38 = v31[v37];
  helper0(v32, v30, v35, v38, static_cast<int>(__simt_tid3.x));
  int v39 = 8;
  int v40 = v39 + v32;
  int v41 = v31[v40];
  int v42;
  v42 = v32;
  switch (v41) {
    case 0:
      {
      int v43 = 0;
      int v44 = 0;
      int v45;
      int v46;
      v45 = v43;
      v46 = v44;
      while (true) {
        int v47 = 4;
        int v48 = v46 * v47;
        int v49 = v48 + v32;
        int v50 = 12;
        int v51 = v50 + v49;
        int v52 = v31[v51];
        int v53 = 0;
        bool v54 = v52 != v53;
        v45 = v45;
        v46 = v46;
        if (!v54) break;
        int v55 = v45 + v46;
        int v56 = 1;
        int v57 = v46 + v56;
        bool v58 = true;
        v45 = v55;
        v46 = v57;
      }
      v42 = v45;
    }
    default:
      {
      int v59 = 2;
      int v60 = v32 + v59;
      v42 = v60;
    }
    case 1:
      {
      v42 = v32;
    }
    case 2:
      {
      int v61 = 32;
      int v62 = v61 + v32;
      int v63 = v31[v62];
      int v64 = 0;
      bool v65 = v63 != v64;
      int v66;
      if (v65) {
        int v67 = 36;
        int v68 = v67 + v32;
        int v69 = v31[v68];
        int v70 = 0;
        bool v71 = v69 != v70;
        int v72;
        if (v71) {
          v72 = v32;
        } else {
          v72 = v32;
        }
        v66 = v72;
      } else {
        int v73 = 40;
        int v74 = v73 + v32;
        int v75 = v31[v74];
        int v76 = 3;
        int v77;
        v77 = v76;
        switch (v75) {
          case 0:
            {
            int v78 = 0;
            v77 = v78;
            break;
          }
          case 1:
            {
            int v79 = 0;
            v77 = v79;
            break;
          }
          default:
            {
            v77 = v32;
            break;
          }
        }
        v66 = v77;
      }
      v42 = v66;
      break;
    }
  }
  int v80 = 44;
  int v81 = v80 + v32;
  int v82 = v31[v81];
  uint v83 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v84 = (int)(v83);
  int v85;
  v85 = v84;
  switch (v82) {
    case 0:
      {
      int v86 = 2;
      int v87 = v32 + v86;
      v85 = v87;
      break;
    }
    case 1:
      {
      int v88 = 48;
      int v89 = v88 + v32;
      int v90 = v31[v89];
      int v91 = 0;
      bool v92 = v90 != v91;
      int v93;
      if (v92) {
        int v94 = 52;
        int v95 = v94 + v32;
        int v96 = v31[v95];
        int v97;
        v97 = v32;
        switch (v96) {
          case 0:
            {
            v97 = v32;
          }
          case 1:
            {
            v97 = v32;
            break;
          }
          default:
            {
            int v98 = 0;
            v97 = v98;
          }
          case 2:
            {
            v97 = v32;
            break;
          }
        }
        bool v99 = true;
        v93 = v97;
      } else {
        int v100 = 4;
        v93 = v100;
      }
      v85 = v93;
      break;
    }
    case 2:
      {
      int v101 = 3;
      v85 = v101;
      break;
    }
    default:
      {
      int v102 = 0;
      int v103 = 0;
      int v104;
      int v105;
      v104 = v102;
      v105 = v103;
      while (true) {
        int v106 = 4;
        int v107 = v105 * v106;
        int v108 = v107 + v32;
        int v109 = 56;
        int v110 = v109 + v108;
        int v111 = v31[v110];
        int v112 = 0;
        bool v113 = v111 != v112;
        v104 = v104;
        v105 = v105;
        if (!v113) break;
        int v114 = v104 + v105;
        int v115 = 1;
        int v116 = v105 + v115;
        bool v117 = true;
        v104 = v114;
        v105 = v116;
      }
      v85 = v104;
      break;
    }
  }
  int v118 = 76;
  int v119 = v118 + v32;
  int v120 = v31[v119];
  int v121 = 0;
  bool v122 = v120 != v121;
  int v123;
  if (v122) {
    uint v124 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v125 = (int)(v124);
    v123 = v125;
  } else {
    int v126 = 80;
    int v127 = v126 + v32;
    int v128 = v31[v127];
    int v129 = 2;
    int v130 = v32 + v129;
    int v131;
    v131 = v130;
    switch (v128) {
      default:
        {
        int v132 = 0;
        int v133 = 0;
        int v134;
        int v135;
        v134 = v132;
        v135 = v133;
        while (true) {
          int v136 = 4;
          int v137 = v135 * v136;
          int v138 = v137 + v32;
          int v139 = 84;
          int v140 = v139 + v138;
          int v141 = v31[v140];
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
        break;
      }
      case 0:
        {
        int v148 = 104;
        int v149 = v148 + v32;
        int v150 = v31[v149];
        int v151 = 0;
        bool v152 = v150 != v151;
        int v153;
        if (v152) {
          int v154 = 4;
          v153 = v154;
        } else {
          int v155 = 0;
          v153 = v155;
        }
        v131 = v153;
      }
      case 1:
        {
        int v156 = 108;
        int v157 = v156 + v32;
        int v158 = v31[v157];
        int v159 = 0;
        bool v160 = v158 != v159;
        int v161;
        if (v160) {
          int v162 = 1;
          v161 = v162;
        } else {
          int v163 = 3;
          int v164 = v32 + v163;
          v161 = v164;
        }
        v131 = v161;
        break;
      }
    }
    v123 = v131;
  }
  int v165 = 16;
  int v166 = v165 + v32;
  bool v167 = true;
  int v168 = simt_wave_count_bits(v167);
  v30[v166] = v168;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
