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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 0;
        int v13 = 0;
        int v14;
        int v15;
        v14 = v12;
        v15 = v13;
        while (true) {
          int v16 = 4;
          int v17 = v3 % v16;
          int v18 = 1;
          int v19 = v17 + v18;
          bool v20 = v15 < v19;
          v14 = v14;
          v15 = v15;
          if (!v20) break;
          int v21 = 1;
          int v22 = v15 + v21;
          v14 = v0;
          v15 = v22;
        }
        v11 = v14;
      } else {
        int v23 = 3;
        int v24 = v3 % v23;
        int v25;
        v25 = v0;
        switch (v24) {
          case 0:
            {
            v25 = v0;
          }
          case 1:
            {
            v25 = v0;
            break;
          }
          case 2:
            {
            v25 = v0;
          }
          default:
            {
            int v26 = 2;
            v25 = v26;
            break;
          }
        }
        int v27 = 2;
        int v28 = v0 + v27;
        v11 = v25;
      }
      v8 = v11;
      break;
    }
    case 0:
      {
      int v29 = 3;
      v8 = v29;
    }
    case 1:
      {
      int v30 = 0;
      bool v31 = v2 != v30;
      int v32;
      if (v31) {
        int v33 = 0;
        bool v34 = v2 != v33;
        int v35;
        if (v34) {
          int v36 = 2;
          v35 = v36;
        } else {
          int v37 = 4;
          v35 = v37;
        }
        v32 = v35;
      } else {
        int v38 = 0;
        bool v39 = v2 != v38;
        int v40;
        if (v39) {
          int v41 = 0;
          v40 = v41;
        } else {
          int v42 = 0;
          int v43 = v0 + v42;
          v40 = v43;
        }
        v32 = v40;
      }
      v8 = v32;
    }
    case 2:
      {
      int v44 = 0;
      bool v45 = v2 != v44;
      int v46;
      if (v45) {
        int v47 = 0;
        int v48 = 0;
        int v49;
        int v50;
        v49 = v47;
        v50 = v48;
        while (true) {
          int v51 = 4;
          int v52 = v3 % v51;
          int v53 = 1;
          int v54 = v52 + v53;
          bool v55 = v50 < v54;
          v49 = v49;
          v50 = v50;
          if (!v55) break;
          int v56 = 4;
          int v57 = 1;
          int v58 = v50 + v57;
          v49 = v56;
          v50 = v58;
        }
        v46 = v49;
      } else {
        int v59 = 4;
        int v60 = v3 % v59;
        int v61 = 3;
        int v62 = v0 + v61;
        int v63;
        v63 = v62;
        switch (v60) {
          default:
            {
            int v64 = 0;
            v63 = v64;
          }
          case 0:
            {
            v63 = v0;
          }
          case 1:
            {
            v63 = v0;
            break;
          }
          case 2:
            {
            int v65 = 1;
            v63 = v65;
            break;
          }
        }
        int v66 = 4;
        int v67 = v0 + v66;
        v46 = v63;
      }
      v8 = v46;
      break;
    }
  }
  bool v68 = true;
  int v69 = simt_wave_count_bits(v68);
  int v70 = 0;
  int v71 = v70 + v0;
  v1[v71] = v69;
  return;
}

kernel void kernel_main(device int* v72 [[buffer(0)]], device int* v73 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v74 = static_cast<int>(__simt_tid3.x);
  int v75 = 0;
  int v76 = v75 + v74;
  int v77 = v73[v76];
  int v78 = 4;
  int v79 = v78 + v74;
  int v80 = v73[v79];
  int v81 = 0;
  bool v82 = v77 != v81;
  if (v82) {
  } else {
    int v83 = 8;
    int v84 = v83 + v74;
    int v85 = v73[v84];
    int v86 = 0;
    bool v87 = v85 != v86;
    if (v87) {
      helper0(v74, v72, v77, v80, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v88 = 12;
  int v89 = v88 + v74;
  int v90 = v73[v89];
  int v91 = 0;
  bool v92 = v90 != v91;
  int v93;
  if (v92) {
    int v94 = 0;
    int v95 = 0;
    int v96;
    int v97;
    v96 = v94;
    v97 = v95;
    while (true) {
      int v98 = 4;
      int v99 = v97 * v98;
      int v100 = v99 + v74;
      int v101 = 16;
      int v102 = v101 + v100;
      int v103 = v73[v102];
      int v104 = 0;
      bool v105 = v103 != v104;
      v96 = v96;
      v97 = v97;
      if (!v105) break;
      int v106 = v96 + v97;
      int v107 = 1;
      int v108 = v97 + v107;
      bool v109 = true;
      int v110 = 16;
      int v111 = 4;
      int v112 = v97 * v111;
      int v113 = v110 + v112;
      int v114 = v113 + v74;
      bool v115 = true;
      int v116 = simt_wave_count_bits(v115);
      v72[v114] = v116;
      v96 = v106;
      v97 = v108;
      continue;
      ;
    }
    v93 = v96;
  } else {
    int v117 = 36;
    int v118 = v117 + v74;
    int v119 = v73[v118];
    int v120 = 3;
    int v121;
    v121 = v120;
    switch (v119) {
      case 0:
        {
        int v122 = 40;
        int v123 = v122 + v74;
        int v124 = v73[v123];
        int v125 = 0;
        bool v126 = v124 != v125;
        int v127;
        if (v126) {
          int v128 = 0;
          int v129 = v74 + v128;
          v127 = v129;
        } else {
          int v130 = 3;
          int v131 = v74 + v130;
          v127 = v131;
        }
        v121 = v127;
        break;
      }
      case 1:
        {
        v121 = v74;
      }
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
          int v138 = v137 + v74;
          int v139 = 44;
          int v140 = v139 + v138;
          int v141 = v73[v140];
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
        v121 = v134;
        break;
      }
    }
    v93 = v121;
  }
  int v148 = 32;
  int v149 = v148 + v74;
  bool v150 = true;
  int v151 = simt_wave_count_bits(v150);
  v72[v149] = v151;
  int v152 = 64;
  int v153 = v152 + v74;
  int v154 = v73[v153];
  int v155;
  v155 = v74;
  switch (v154) {
    case 0:
      {
      int v156 = 3;
      int v157 = v74 + v156;
      v155 = v157;
    }
    case 1:
      {
      int v158 = 4;
      int v159 = v74 + v158;
      v155 = v159;
      break;
    }
    case 2:
      {
      v155 = v74;
      break;
    }
    default:
      {
      int v160 = 0;
      int v161 = 0;
      int v162;
      int v163;
      v162 = v160;
      v163 = v161;
      while (true) {
        int v164 = 4;
        int v165 = v163 * v164;
        int v166 = v165 + v74;
        int v167 = 68;
        int v168 = v167 + v166;
        int v169 = v73[v168];
        int v170 = 0;
        bool v171 = v169 != v170;
        v162 = v162;
        v163 = v163;
        if (!v171) break;
        int v172 = v162 + v163;
        int v173 = 1;
        int v174 = v163 + v173;
        bool v175 = true;
        v162 = v172;
        v163 = v174;
      }
      v155 = v162;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
