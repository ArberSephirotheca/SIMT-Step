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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 4;
  int v7 = v3 % v6;
  int v8 = 2;
  int v9 = v0 + v8;
  int v10;
  v10 = v9;
  switch (v7) {
    case 0:
      {
      int v11 = 0;
      bool v12 = v2 != v11;
      int v13;
      if (v12) {
        int v14 = 0;
        bool v15 = v2 != v14;
        int v16;
        if (v15) {
          v16 = v0;
        } else {
          int v17 = 4;
          int v18 = v0 + v17;
          v16 = v18;
        }
        v13 = v16;
      } else {
        int v19 = 0;
        bool v20 = v2 != v19;
        int v21;
        if (v20) {
          int v22 = 3;
          int v23 = v0 + v22;
          v21 = v23;
        } else {
          int v24 = 2;
          int v25 = v0 + v24;
          v21 = v25;
        }
        int v26 = 2;
        v13 = v21;
      }
      int v27 = 2;
      int v28 = v0 + v27;
      v10 = v13;
      break;
    }
    default:
      {
      int v29 = 0;
      int v30 = 0;
      int v31;
      int v32;
      v31 = v29;
      v32 = v30;
      while (true) {
        int v33 = 4;
        int v34 = v3 % v33;
        int v35 = 1;
        int v36 = v34 + v35;
        bool v37 = v32 < v36;
        v31 = v31;
        v32 = v32;
        if (!v37) break;
        int v38 = 1;
        int v39 = v32 + v38;
        v31 = v0;
        v32 = v39;
      }
      v10 = v31;
      break;
    }
    case 1:
      {
      int v40 = 1;
      int v41 = v0 + v40;
      v10 = v41;
      break;
    }
    case 2:
      {
      int v42 = 4;
      v10 = v42;
      break;
    }
  }
  bool v43 = true;
  int v44 = simt_wave_count_bits(v43);
  int v45 = 0;
  int v46 = v45 + v0;
  v1[v46] = v44;
  int v47 = 0;
  bool v48 = v2 != v47;
  int v49 = v48 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v50 [[buffer(0)]], device int* v51 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v52 = static_cast<int>(__simt_tid3.x);
  int v53 = 0;
  int v54 = v53 + v52;
  int v55 = v51[v54];
  int v56 = 4;
  int v57 = v56 + v52;
  int v58 = v51[v57];
  helper0(v52, v50, v55, v58, static_cast<int>(__simt_tid3.x));
  int v59 = 8;
  int v60 = v59 + v52;
  int v61 = v51[v60];
  int v62 = 2;
  int v63 = v52 + v62;
  int v64;
  v64 = v63;
  switch (v61) {
    case 0:
      {
      int v65 = 12;
      int v66 = v65 + v52;
      int v67 = v51[v66];
      int v68 = 0;
      bool v69 = v67 != v68;
      int v70;
      if (v69) {
        int v71 = 0;
        v70 = v71;
      } else {
        int v72 = 16;
        int v73 = v72 + v52;
        int v74 = v51[v73];
        int v75;
        v75 = v52;
        switch (v74) {
          case 0:
            {
            int v76 = 1;
            v75 = v76;
          }
          default:
            {
            int v77 = 2;
            v75 = v77;
            break;
          }
          case 1:
            {
            v75 = v52;
          }
          case 2:
            {
            v75 = v52;
            break;
          }
        }
        bool v78 = true;
        v70 = v75;
      }
      v64 = v70;
      break;
    }
    case 1:
      {
      int v79 = 0;
      int v80 = 0;
      int v81;
      int v82;
      v81 = v79;
      v82 = v80;
      while (true) {
        int v83 = 4;
        int v84 = v82 * v83;
        int v85 = v84 + v52;
        int v86 = 20;
        int v87 = v86 + v85;
        int v88 = v51[v87];
        int v89 = 0;
        bool v90 = v88 != v89;
        v81 = v81;
        v82 = v82;
        if (!v90) break;
        int v91 = v81 + v82;
        int v92 = 1;
        int v93 = v82 + v92;
        v81 = v91;
        v82 = v93;
      }
      bool v94 = true;
      v64 = v81;
    }
    case 2:
      {
      int v95 = 40;
      int v96 = v95 + v52;
      int v97 = v51[v96];
      int v98 = 0;
      bool v99 = v97 != v98;
      int v100;
      if (v99) {
        int v101 = 44;
        int v102 = v101 + v52;
        int v103 = v51[v102];
        int v104 = 0;
        bool v105 = v103 != v104;
        int v106;
        if (v105) {
          int v107 = 3;
          int v108 = v52 + v107;
          v106 = v108;
        } else {
          int v109 = 0;
          int v110 = v52 + v109;
          v106 = v110;
        }
        v100 = v106;
      } else {
        int v111 = 0;
        int v112 = v52 + v111;
        v100 = v112;
      }
      v64 = v100;
    }
    default:
      {
      int v113 = 0;
      int v114 = 0;
      int v115;
      int v116;
      v115 = v113;
      v116 = v114;
      while (true) {
        int v117 = 4;
        int v118 = v116 * v117;
        int v119 = v118 + v52;
        int v120 = 48;
        int v121 = v120 + v119;
        int v122 = v51[v121];
        int v123 = 0;
        bool v124 = v122 != v123;
        v115 = v115;
        v116 = v116;
        if (!v124) break;
        int v125 = v115 + v116;
        int v126 = 1;
        int v127 = v116 + v126;
        v115 = v125;
        v116 = v127;
      }
      bool v128 = true;
      v64 = v115;
      break;
    }
  }
  bool v129 = true;
  int v130 = 16;
  int v131 = v130 + v52;
  bool v132 = true;
  int v133 = simt_wave_count_bits(v132);
  v50[v131] = v133;
  int v134 = 0;
  int v135 = 0;
  int v136;
  int v137;
  v136 = v134;
  v137 = v135;
  while (true) {
    int v138 = 4;
    int v139 = v137 * v138;
    int v140 = v139 + v52;
    int v141 = 68;
    int v142 = v141 + v140;
    int v143 = v51[v142];
    int v144 = 0;
    bool v145 = v143 != v144;
    v136 = v136;
    v137 = v137;
    if (!v145) break;
    int v146 = 0;
    int v147 = 0;
    int v148;
    int v149;
    v148 = v146;
    v149 = v147;
    while (true) {
      int v150 = 4;
      int v151 = v149 * v150;
      int v152 = v151 + v52;
      int v153 = 88;
      int v154 = v153 + v152;
      int v155 = v51[v154];
      int v156 = 0;
      bool v157 = v155 != v156;
      v148 = v148;
      v149 = v149;
      if (!v157) break;
      int v158 = 0;
      int v159 = 0;
      int v160;
      int v161;
      v160 = v158;
      v161 = v159;
      while (true) {
        int v162 = 4;
        int v163 = v161 * v162;
        int v164 = v163 + v52;
        int v165 = 108;
        int v166 = v165 + v164;
        int v167 = v51[v166];
        int v168 = 0;
        bool v169 = v167 != v168;
        v160 = v160;
        v161 = v161;
        if (!v169) break;
        int v170 = v160 + v161;
        int v171 = 1;
        int v172 = v161 + v171;
        v160 = v170;
        v161 = v172;
      }
      bool v173 = true;
      int v174 = v148 + v160;
      int v175 = 1;
      int v176 = v149 + v175;
      v148 = v174;
      v149 = v176;
    }
    bool v177 = true;
    int v178 = v136 + v148;
    int v179 = 1;
    int v180 = v137 + v179;
    v136 = v178;
    v137 = v180;
  }
  bool v181 = true;
  int v182 = 32;
  int v183 = v182 + v52;
  bool v184 = true;
  int v185 = simt_wave_count_bits(v184);
  v50[v183] = v185;
  uint v186 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v187 = (int)(v186);
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
