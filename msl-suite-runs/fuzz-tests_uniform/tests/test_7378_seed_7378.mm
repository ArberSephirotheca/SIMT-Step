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
    int v14 = 0;
    int v15;
    int v16;
    v15 = v13;
    v16 = v14;
    while (true) {
      int v17 = 4;
      int v18 = v3 % v17;
      int v19 = 1;
      int v20 = v18 + v19;
      bool v21 = v16 < v20;
      v15 = v15;
      v16 = v16;
      if (!v21) break;
      uint v22 = simt_lane_id(__simt_tid);
      int v23 = (int)(v22);
      int v24 = 1;
      int v25 = v16 + v24;
      v15 = v23;
      v16 = v25;
    }
    int v26 = 1;
    int v27 = v7 + v26;
    v6 = v15;
    v7 = v27;
  }
  bool v28 = true;
  int v29 = simt_wave_count_bits(v28);
  int v30 = 0;
  int v31 = v30 + v0;
  v1[v31] = v29;
  int v32 = 0;
  bool v33 = v2 != v32;
  int v34;
  if (v33) {
    int v35 = 2;
    int v36 = v3 % v35;
    uint v37 = simt_lane_id(__simt_tid);
    int v38 = (int)(v37);
    int v39;
    v39 = v38;
    switch (v36) {
      case 0:
        {
        int v40 = 0;
        int v41 = 0;
        int v42;
        int v43;
        v42 = v40;
        v43 = v41;
        while (true) {
          int v44 = 4;
          int v45 = v3 % v44;
          int v46 = 1;
          int v47 = v45 + v46;
          bool v48 = v43 < v47;
          v42 = v42;
          v43 = v43;
          if (!v48) break;
          int v49 = 0;
          int v50 = 1;
          int v51 = v43 + v50;
          v42 = v49;
          v43 = v51;
        }
        v39 = v42;
        break;
      }
      default:
        {
        int v52 = 3;
        int v53 = v3 % v52;
        int v54 = 1;
        int v55;
        v55 = v54;
        switch (v53) {
          case 0:
            {
            int v56 = 2;
            v55 = v56;
            break;
          }
          default:
            {
            v55 = v0;
            break;
          }
          case 1:
            {
            v55 = v0;
            break;
          }
        }
        v39 = v55;
        break;
      }
      case 1:
        {
        int v57 = 0;
        bool v58 = v2 != v57;
        int v59;
        if (v58) {
          int v60 = 0;
          int v61 = v0 + v60;
          v59 = v61;
        } else {
          int v62 = 2;
          v59 = v62;
        }
        int v63 = 2;
        v39 = v59;
        break;
      }
    }
    uint v64 = simt_lane_id(__simt_tid);
    int v65 = (int)(v64);
    v34 = v39;
  } else {
    int v66 = 0;
    bool v67 = v2 != v66;
    int v68;
    if (v67) {
      int v69 = 0;
      bool v70 = v2 != v69;
      int v71;
      if (v70) {
        int v72 = 0;
        int v73 = v0 + v72;
        v71 = v73;
      } else {
        uint v74 = simt_subgroup_id(__simt_tid);
        int v75 = (int)(v74);
        v71 = v75;
      }
      v68 = v71;
    } else {
      int v76 = 0;
      int v77 = 0;
      int v78;
      int v79;
      v78 = v76;
      v79 = v77;
      while (true) {
        int v80 = 4;
        int v81 = v3 % v80;
        int v82 = 1;
        int v83 = v81 + v82;
        bool v84 = v79 < v83;
        v78 = v78;
        v79 = v79;
        if (!v84) break;
        int v85 = 1;
        int v86 = v79 + v85;
        v78 = v0;
        v79 = v86;
        continue;
        ;
      }
      uint v87 = simt_subgroup_id(__simt_tid);
      int v88 = (int)(v87);
      v68 = v78;
    }
    int v89 = 4;
    v34 = v68;
  }
  bool v90 = true;
  int v91 = simt_wave_count_bits(v90);
  int v92 = 16;
  int v93 = v92 + v0;
  v1[v93] = v91;
  int v94 = 0;
  bool v95 = v2 != v94;
  int v96 = v95 ? v6 : v34;
  return;
}

kernel void kernel_main(device int* v97 [[buffer(0)]], device int* v98 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v99 = static_cast<int>(__simt_tid3.x);
  int v100 = 0;
  int v101 = v100 + v99;
  int v102 = v98[v101];
  int v103 = 4;
  int v104 = v103 + v99;
  int v105 = v98[v104];
  helper0(v99, v97, v102, v105, static_cast<int>(__simt_tid3.x));
  int v106 = 8;
  int v107 = v106 + v99;
  int v108 = v98[v107];
  int v109 = 0;
  bool v110 = v108 != v109;
  int v111;
  if (v110) {
    int v112 = 12;
    int v113 = v112 + v99;
    int v114 = v98[v113];
    int v115 = 0;
    bool v116 = v114 != v115;
    int v117;
    if (v116) {
      int v118 = 1;
      int v119 = v99 + v118;
      v117 = v119;
    } else {
      int v120 = 2;
      v117 = v120;
    }
    v111 = v117;
  } else {
    int v121 = 0;
    int v122 = 0;
    int v123;
    int v124;
    v123 = v121;
    v124 = v122;
    while (true) {
      int v125 = 4;
      int v126 = v124 * v125;
      int v127 = v126 + v99;
      int v128 = 16;
      int v129 = v128 + v127;
      int v130 = v98[v129];
      int v131 = 0;
      bool v132 = v130 != v131;
      v123 = v123;
      v124 = v124;
      if (!v132) break;
      int v133 = v123 + v124;
      int v134 = 1;
      int v135 = v124 + v134;
      v123 = v133;
      v124 = v135;
    }
    bool v136 = true;
    v111 = v123;
  }
  int v137 = 32;
  int v138 = v137 + v99;
  bool v139 = true;
  int v140 = simt_wave_count_bits(v139);
  v97[v138] = v140;
  int v141 = 36;
  int v142 = v141 + v99;
  int v143 = v98[v142];
  int v144 = 0;
  bool v145 = v143 != v144;
  int v146;
  if (v145) {
    int v147 = 0;
    int v148 = 0;
    int v149;
    int v150;
    v149 = v147;
    v150 = v148;
    while (true) {
      int v151 = 4;
      int v152 = v150 * v151;
      int v153 = v152 + v99;
      int v154 = 40;
      int v155 = v154 + v153;
      int v156 = v98[v155];
      int v157 = 0;
      bool v158 = v156 != v157;
      v149 = v149;
      v150 = v150;
      if (!v158) break;
      int v159 = v149 + v150;
      int v160 = 1;
      int v161 = v150 + v160;
      v149 = v159;
      v150 = v161;
    }
    bool v162 = true;
    v146 = v149;
  } else {
    int v163 = 0;
    int v164 = 0;
    int v165;
    int v166;
    v165 = v163;
    v166 = v164;
    while (true) {
      int v167 = 4;
      int v168 = v166 * v167;
      int v169 = v168 + v99;
      int v170 = 60;
      int v171 = v170 + v169;
      int v172 = v98[v171];
      int v173 = 0;
      bool v174 = v172 != v173;
      v165 = v165;
      v166 = v166;
      if (!v174) break;
      int v175 = v165 + v166;
      int v176 = 1;
      int v177 = v166 + v176;
      v165 = v175;
      v166 = v177;
    }
    bool v178 = true;
    v146 = v165;
  }
  int v179 = 48;
  int v180 = v179 + v99;
  bool v181 = true;
  int v182 = simt_wave_count_bits(v181);
  v97[v180] = v182;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
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
