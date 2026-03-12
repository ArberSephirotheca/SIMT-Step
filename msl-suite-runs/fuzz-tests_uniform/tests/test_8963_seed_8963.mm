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
    int v13 = 3;
    int v14 = 1;
    int v15 = v7 + v14;
    v6 = v13;
    v7 = v15;
  }
  bool v16 = true;
  int v17 = simt_wave_count_bits(v16);
  int v18 = 0;
  int v19 = v18 + v0;
  v1[v19] = v17;
  int v20 = 0;
  int v21 = 0;
  int v22;
  int v23;
  v22 = v20;
  v23 = v21;
  while (true) {
    int v24 = 4;
    int v25 = v3 % v24;
    int v26 = 1;
    int v27 = v25 + v26;
    bool v28 = v23 < v27;
    v22 = v22;
    v23 = v23;
    if (!v28) break;
    int v29 = 0;
    bool v30 = v2 != v29;
    int v31;
    if (v30) {
      int v32 = 4;
      int v33 = v3 % v32;
      uint v34 = simt_subgroup_id(__simt_tid);
      int v35 = (int)(v34);
      int v36;
      v36 = v35;
      switch (v33) {
        case 0:
          {
          int v37 = 0;
          v36 = v37;
          break;
        }
        case 1:
          {
          int v38 = 1;
          v36 = v38;
        }
        case 2:
          {
          int v39 = 0;
          int v40 = v0 + v39;
          v36 = v40;
          break;
        }
        default:
          {
          int v41 = 4;
          v36 = v41;
          break;
        }
      }
      uint v42 = simt_subgroup_id(__simt_tid);
      int v43 = (int)(v42);
      v31 = v36;
    } else {
      int v44 = 0;
      int v45 = 0;
      int v46;
      int v47;
      v46 = v44;
      v47 = v45;
      while (true) {
        int v48 = 4;
        int v49 = v3 % v48;
        int v50 = 1;
        int v51 = v49 + v50;
        bool v52 = v47 < v51;
        v46 = v46;
        v47 = v47;
        if (!v52) break;
        int v53 = 1;
        int v54 = v47 + v53;
        v46 = v0;
        v47 = v54;
        break;
        ;
      }
      uint v55 = simt_lane_id(__simt_tid);
      int v56 = (int)(v55);
      v31 = v46;
    }
    uint v57 = simt_lane_id(__simt_tid);
    int v58 = (int)(v57);
    int v59 = 1;
    int v60 = v23 + v59;
    v22 = v31;
    v23 = v60;
    continue;
    ;
  }
  bool v61 = true;
  int v62 = simt_wave_count_bits(v61);
  int v63 = 16;
  int v64 = v63 + v0;
  v1[v64] = v62;
  int v65 = 0;
  bool v66 = v2 != v65;
  int v67 = v66 ? v6 : v22;
  return;
}

kernel void kernel_main(device int* v68 [[buffer(0)]], device int* v69 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v70 = static_cast<int>(__simt_tid3.x);
  int v71 = 0;
  int v72 = v71 + v70;
  int v73 = v69[v72];
  int v74 = 4;
  int v75 = v74 + v70;
  int v76 = v69[v75];
  helper0(v70, v68, v73, v76, static_cast<int>(__simt_tid3.x));
  int v77 = 3;
  int v78 = 0;
  int v79 = 0;
  int v80;
  int v81;
  v80 = v78;
  v81 = v79;
  while (true) {
    int v82 = 4;
    int v83 = v81 * v82;
    int v84 = v83 + v70;
    int v85 = 8;
    int v86 = v85 + v84;
    int v87 = v69[v86];
    int v88 = 0;
    bool v89 = v87 != v88;
    v80 = v80;
    v81 = v81;
    if (!v89) break;
    int v90 = 1;
    int v91 = v70 + v90;
    int v92 = v80 + v91;
    int v93 = 1;
    int v94 = v81 + v93;
    v80 = v92;
    v81 = v94;
    continue;
    ;
  }
  bool v95 = true;
  int v96 = 32;
  int v97 = v96 + v70;
  bool v98 = true;
  int v99 = simt_wave_count_bits(v98);
  v68[v97] = v99;
  uint v100 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v101 = (int)(v100);
  int v102 = 28;
  int v103 = v102 + v70;
  int v104 = v69[v103];
  uint v105 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v106 = (int)(v105);
  int v107;
  v107 = v106;
  switch (v104) {
    case 0:
      {
      int v108 = 32;
      int v109 = v108 + v70;
      int v110 = v69[v109];
      int v111 = 0;
      bool v112 = v110 != v111;
      int v113;
      if (v112) {
        int v114 = 36;
        int v115 = v114 + v70;
        int v116 = v69[v115];
        int v117 = 0;
        bool v118 = v116 != v117;
        int v119;
        if (v118) {
          int v120 = 3;
          v119 = v120;
        } else {
          int v121 = 1;
          v119 = v121;
        }
        v113 = v119;
      } else {
        int v122 = 0;
        int v123 = 0;
        int v124;
        int v125;
        v124 = v122;
        v125 = v123;
        while (true) {
          int v126 = 4;
          int v127 = v125 * v126;
          int v128 = v127 + v70;
          int v129 = 40;
          int v130 = v129 + v128;
          int v131 = v69[v130];
          int v132 = 0;
          bool v133 = v131 != v132;
          v124 = v124;
          v125 = v125;
          if (!v133) break;
          int v134 = v124 + v125;
          int v135 = 1;
          int v136 = v125 + v135;
          v124 = v134;
          v125 = v136;
        }
        bool v137 = true;
        v113 = v124;
      }
      v107 = v113;
      break;
    }
    case 1:
      {
      int v138 = 60;
      int v139 = v138 + v70;
      int v140 = v69[v139];
      int v141 = 0;
      bool v142 = v140 != v141;
      int v143;
      if (v142) {
        int v144 = 0;
        int v145 = 0;
        int v146;
        int v147;
        v146 = v144;
        v147 = v145;
        while (true) {
          int v148 = 4;
          int v149 = v147 * v148;
          int v150 = v149 + v70;
          int v151 = 64;
          int v152 = v151 + v150;
          int v153 = v69[v152];
          int v154 = 0;
          bool v155 = v153 != v154;
          v146 = v146;
          v147 = v147;
          if (!v155) break;
          int v156 = v146 + v147;
          int v157 = 1;
          int v158 = v147 + v157;
          v146 = v156;
          v147 = v158;
        }
        bool v159 = true;
        v143 = v146;
      } else {
        int v160 = 0;
        v143 = v160;
      }
      v107 = v143;
      break;
    }
    default:
      {
      int v161 = 0;
      int v162 = 0;
      int v163;
      int v164;
      v163 = v161;
      v164 = v162;
      while (true) {
        int v165 = 4;
        int v166 = v164 * v165;
        int v167 = v166 + v70;
        int v168 = 84;
        int v169 = v168 + v167;
        int v170 = v69[v169];
        int v171 = 0;
        bool v172 = v170 != v171;
        v163 = v163;
        v164 = v164;
        if (!v172) break;
        int v173 = 104;
        int v174 = v173 + v70;
        int v175 = v69[v174];
        int v176 = 0;
        bool v177 = v175 != v176;
        int v178;
        if (v177) {
          int v179 = 0;
          v178 = v179;
        } else {
          v178 = v70;
        }
        int v180 = v163 + v178;
        int v181 = 1;
        int v182 = v164 + v181;
        v163 = v180;
        v164 = v182;
      }
      bool v183 = true;
      v107 = v163;
      break;
    }
    case 2:
      {
      v107 = v70;
      break;
    }
  }
  bool v184 = true;
  int v185 = 48;
  int v186 = v185 + v70;
  bool v187 = true;
  int v188 = simt_wave_count_bits(v187);
  v68[v186] = v188;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
