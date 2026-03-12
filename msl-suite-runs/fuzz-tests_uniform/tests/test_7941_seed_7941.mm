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
  int v4 = 3;
  int v5 = v3 % v4;
  int v6 = 0;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      int v10 = 0;
      int v11;
      int v12;
      v11 = v9;
      v12 = v10;
      while (true) {
        int v13 = 4;
        int v14 = v3 % v13;
        int v15 = 1;
        int v16 = v14 + v15;
        bool v17 = v12 < v16;
        v11 = v11;
        v12 = v12;
        if (!v17) break;
        int v18 = 0;
        int v19 = 0;
        int v20;
        int v21;
        v20 = v18;
        v21 = v19;
        while (true) {
          int v22 = 4;
          int v23 = v3 % v22;
          int v24 = 1;
          int v25 = v23 + v24;
          bool v26 = v21 < v25;
          v20 = v20;
          v21 = v21;
          if (!v26) break;
          int v27 = 3;
          int v28 = 1;
          int v29 = v21 + v28;
          v20 = v27;
          v21 = v29;
        }
        int v30 = 4;
        int v31 = v0 + v30;
        int v32 = 1;
        int v33 = v12 + v32;
        v11 = v20;
        v12 = v33;
      }
      int v34 = 3;
      v8 = v11;
      break;
    }
    default:
      {
      int v35 = 0;
      bool v36 = v2 != v35;
      int v37;
      if (v36) {
        int v38 = 3;
        int v39;
        v39 = v38;
        switch (v3) {
          case 0:
            {
            v39 = v0;
            break;
          }
          default:
            {
            v39 = v0;
            break;
          }
        }
        int v40 = 2;
        v37 = v39;
      } else {
        int v41 = 0;
        bool v42 = v2 != v41;
        int v43;
        if (v42) {
          v43 = v0;
        } else {
          int v44 = 3;
          int v45 = v0 + v44;
          v43 = v45;
        }
        int v46 = 1;
        int v47 = v0 + v46;
        v37 = v43;
      }
      int v48 = 0;
      v8 = v37;
      break;
    }
    case 1:
      {
      int v49 = 4;
      int v50 = v3 % v49;
      int v51 = 4;
      int v52 = v0 + v51;
      int v53;
      v53 = v52;
      switch (v50) {
        case 0:
          {
          int v54 = 0;
          bool v55 = v2 != v54;
          int v56;
          if (v55) {
            v56 = v0;
          } else {
            v56 = v0;
          }
          int v57 = 4;
          int v58 = v0 + v57;
          v53 = v56;
          break;
        }
        default:
          {
          int v59 = 0;
          bool v60 = v2 != v59;
          int v61;
          if (v60) {
            v61 = v0;
          } else {
            int v62 = 1;
            v61 = v62;
          }
          int v63 = 2;
          v53 = v61;
          break;
        }
        case 1:
          {
          int v64 = 0;
          int v65 = 0;
          int v66;
          int v67;
          v66 = v64;
          v67 = v65;
          while (true) {
            int v68 = 4;
            int v69 = v3 % v68;
            int v70 = 1;
            int v71 = v69 + v70;
            bool v72 = v67 < v71;
            v66 = v66;
            v67 = v67;
            if (!v72) break;
            int v73 = 1;
            int v74 = v67 + v73;
            v66 = v0;
            v67 = v74;
            break;
            ;
          }
          v53 = v66;
        }
        case 2:
          {
          int v75 = 0;
          bool v76 = v2 != v75;
          int v77;
          if (v76) {
            int v78 = 1;
            v77 = v78;
          } else {
            int v79 = 4;
            v77 = v79;
          }
          int v80 = 2;
          v53 = v77;
          break;
        }
      }
      int v81 = 2;
      v8 = v53;
      break;
    }
    case 2:
      {
      int v82 = 3;
      int v83 = v3 % v82;
      int v84 = 2;
      int v85 = v0 + v84;
      int v86;
      v86 = v85;
      switch (v83) {
        case 0:
          {
          int v87 = 0;
          bool v88 = v2 != v87;
          int v89;
          if (v88) {
            int v90 = 0;
            v89 = v90;
          } else {
            int v91 = 2;
            v89 = v91;
          }
          v86 = v89;
          break;
        }
        default:
          {
          int v92 = 0;
          bool v93 = v2 != v92;
          int v94;
          if (v93) {
            int v95 = 0;
            int v96 = v0 + v95;
            v94 = v96;
          } else {
            v94 = v0;
          }
          v86 = v94;
          break;
        }
        case 1:
          {
          int v97 = 0;
          bool v98 = v2 != v97;
          int v99;
          if (v98) {
            v99 = v0;
          } else {
            int v100 = 1;
            int v101 = v0 + v100;
            v99 = v101;
          }
          int v102 = 2;
          int v103 = v0 + v102;
          v86 = v99;
          break;
        }
      }
      int v104 = 4;
      int v105 = v0 + v104;
      v8 = v86;
      break;
    }
  }
  bool v106 = true;
  int v107 = simt_wave_count_bits(v106);
  int v108 = 0;
  int v109 = v108 + v0;
  v1[v109] = v107;
  return;
}

kernel void kernel_main(device int* v110 [[buffer(0)]], device int* v111 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v112 = static_cast<int>(__simt_tid3.x);
  int v113 = 0;
  int v114 = v113 + v112;
  int v115 = v111[v114];
  int v116 = 4;
  int v117 = v116 + v112;
  int v118 = v111[v117];
  helper0(v112, v110, v115, v118, static_cast<int>(__simt_tid3.x));
  int v119 = 8;
  int v120 = v119 + v112;
  int v121 = v111[v120];
  int v122 = 0;
  bool v123 = v121 != v122;
  int v124;
  if (v123) {
    int v125 = 3;
    int v126 = v112 + v125;
    v124 = v126;
  } else {
    int v127 = 3;
    int v128 = v112 + v127;
    v124 = v128;
  }
  int v129 = 16;
  int v130 = v129 + v112;
  bool v131 = true;
  int v132 = simt_wave_count_bits(v131);
  v110[v130] = v132;
  int v133 = 0;
  int v134 = 0;
  int v135;
  int v136;
  v135 = v133;
  v136 = v134;
  while (true) {
    int v137 = 4;
    int v138 = v136 * v137;
    int v139 = v138 + v112;
    int v140 = 12;
    int v141 = v140 + v139;
    int v142 = v111[v141];
    int v143 = 0;
    bool v144 = v142 != v143;
    v135 = v135;
    v136 = v136;
    if (!v144) break;
    int v145 = 0;
    int v146 = 0;
    int v147;
    int v148;
    v147 = v145;
    v148 = v146;
    while (true) {
      int v149 = 4;
      int v150 = v148 * v149;
      int v151 = v150 + v112;
      int v152 = 32;
      int v153 = v152 + v151;
      int v154 = v111[v153];
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
    int v161 = v135 + v147;
    int v162 = 1;
    int v163 = v136 + v162;
    v135 = v161;
    v136 = v163;
    break;
    ;
  }
  bool v164 = true;
  int v165 = 32;
  int v166 = v165 + v112;
  bool v167 = true;
  int v168 = simt_wave_count_bits(v167);
  v110[v166] = v168;
  int v169 = 0;
  int v170 = 0;
  int v171;
  int v172;
  v171 = v169;
  v172 = v170;
  while (true) {
    int v173 = 4;
    int v174 = v172 * v173;
    int v175 = v174 + v112;
    int v176 = 52;
    int v177 = v176 + v175;
    int v178 = v111[v177];
    int v179 = 0;
    bool v180 = v178 != v179;
    v171 = v171;
    v172 = v172;
    if (!v180) break;
    int v181 = v171 + v172;
    int v182 = 1;
    int v183 = v172 + v182;
    v171 = v181;
    v172 = v183;
  }
  bool v184 = true;
  int v185 = 48;
  int v186 = v185 + v112;
  bool v187 = true;
  int v188 = simt_wave_count_bits(v187);
  v110[v186] = v188;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
