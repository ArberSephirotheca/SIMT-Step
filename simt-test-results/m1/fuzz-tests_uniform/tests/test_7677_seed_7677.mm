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
  int v5 = v0 + v4;
  int v6 = 2;
  int v7 = v3 % v6;
  int v8 = 4;
  int v9;
  v9 = v8;
  switch (v7) {
    case 0:
      {
      int v10 = 2;
      v9 = v10;
      break;
    }
    default:
      {
      int v11 = 4;
      v9 = v11;
      break;
    }
  }
  bool v12 = true;
  int v13 = simt_wave_count_bits(v12);
  int v14 = 0;
  int v15 = v14 + v0;
  v1[v15] = v13;
  int v16 = 0;
  bool v17 = v2 != v16;
  int v18 = v17 ? v5 : v9;
  int v19 = 4;
  int v20 = v3 % v19;
  uint v21 = simt_subgroup_id(__simt_tid);
  int v22 = (int)(v21);
  int v23;
  v23 = v22;
  switch (v20) {
    case 0:
      {
      int v24 = 0;
      int v25 = 0;
      int v26;
      int v27;
      v26 = v24;
      v27 = v25;
      while (true) {
        int v28 = 4;
        int v29 = v3 % v28;
        int v30 = 1;
        int v31 = v29 + v30;
        bool v32 = v27 < v31;
        v26 = v26;
        v27 = v27;
        if (!v32) break;
        int v33 = 4;
        int v34 = 1;
        int v35 = v27 + v34;
        v26 = v33;
        v27 = v35;
      }
      v23 = v26;
    }
    default:
      {
      int v36 = 3;
      int v37 = v3 % v36;
      int v38;
      v38 = v0;
      switch (v37) {
        default:
          {
          v38 = v0;
          break;
        }
        case 0:
          {
          int v39 = 0;
          bool v40 = v2 != v39;
          int v41;
          if (v40) {
            v41 = v0;
          } else {
            int v42 = 0;
            int v43 = v0 + v42;
            v41 = v43;
          }
          v38 = v41;
          break;
        }
        case 1:
          {
          int v44 = 2;
          int v45 = v3 % v44;
          int v46 = 0;
          int v47 = v0 + v46;
          int v48;
          v48 = v47;
          switch (v45) {
            default:
              {
              v48 = v0;
            }
            case 0:
              {
              v48 = v0;
              break;
            }
            case 1:
              {
              v48 = v0;
              break;
            }
          }
          int v49 = 3;
          int v50 = v0 + v49;
          v38 = v48;
          break;
        }
        case 2:
          {
          int v51 = 3;
          v38 = v51;
          break;
        }
      }
      int v52 = 0;
      int v53 = v0 + v52;
      v23 = v38;
    }
    case 1:
      {
      int v54 = 0;
      bool v55 = v2 != v54;
      int v56;
      if (v55) {
        int v57 = 0;
        int v58 = 0;
        int v59;
        int v60;
        v59 = v57;
        v60 = v58;
        while (true) {
          int v61 = 4;
          int v62 = v3 % v61;
          int v63 = 1;
          int v64 = v62 + v63;
          bool v65 = v60 < v64;
          v59 = v59;
          v60 = v60;
          if (!v65) break;
          int v66 = 1;
          int v67 = v60 + v66;
          v59 = v0;
          v60 = v67;
          break;
          ;
        }
        v56 = v59;
      } else {
        int v68 = 0;
        bool v69 = v2 != v68;
        int v70;
        if (v69) {
          int v71 = 0;
          int v72 = v0 + v71;
          v70 = v72;
        } else {
          int v73 = 4;
          v70 = v73;
        }
        int v74 = 1;
        int v75 = v0 + v74;
        v56 = v70;
      }
      int v76 = 3;
      v23 = v56;
      break;
    }
    case 2:
      {
      int v77 = 0;
      int v78 = 0;
      int v79;
      int v80;
      v79 = v77;
      v80 = v78;
      while (true) {
        int v81 = 4;
        int v82 = v3 % v81;
        int v83 = 1;
        int v84 = v82 + v83;
        bool v85 = v80 < v84;
        v79 = v79;
        v80 = v80;
        if (!v85) break;
        int v86 = 0;
        bool v87 = v2 != v86;
        int v88;
        if (v87) {
          int v89 = 1;
          v88 = v89;
        } else {
          int v90 = 2;
          v88 = v90;
        }
        int v91 = 1;
        int v92 = v80 + v91;
        v79 = v88;
        v80 = v92;
      }
      int v93 = 3;
      v23 = v79;
      break;
    }
  }
  bool v94 = true;
  int v95 = simt_wave_count_bits(v94);
  int v96 = 16;
  int v97 = v96 + v0;
  v1[v97] = v95;
  int v98 = 0;
  bool v99 = v2 != v98;
  int v100 = v99 ? v18 : v23;
  return;
}

kernel void kernel_main(device int* v101 [[buffer(0)]], device int* v102 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v103 = static_cast<int>(__simt_tid3.x);
  int v104 = 0;
  int v105 = v104 + v103;
  int v106 = v102[v105];
  int v107 = 4;
  int v108 = v107 + v103;
  int v109 = v102[v108];
  helper0(v103, v101, v106, v109, static_cast<int>(__simt_tid3.x));
  int v110 = 8;
  int v111 = v110 + v103;
  int v112 = v102[v111];
  int v113 = 0;
  bool v114 = v112 != v113;
  int v115;
  if (v114) {
    int v116 = 12;
    int v117 = v116 + v103;
    int v118 = v102[v117];
    int v119 = 0;
    bool v120 = v118 != v119;
    int v121;
    if (v120) {
      int v122 = 16;
      int v123 = v122 + v103;
      int v124 = v102[v123];
      uint v125 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v126 = (int)(v125);
      int v127;
      v127 = v126;
      switch (v124) {
        default:
          {
          int v128 = 1;
          int v129 = v103 + v128;
          v127 = v129;
          break;
        }
        case 0:
          {
          int v130 = 3;
          int v131 = v103 + v130;
          v127 = v131;
          break;
        }
      }
      bool v132 = true;
      v121 = v127;
    } else {
      int v133 = 0;
      int v134 = 0;
      int v135;
      int v136;
      v135 = v133;
      v136 = v134;
      while (true) {
        int v137 = 4;
        int v138 = v136 * v137;
        int v139 = v138 + v103;
        int v140 = 20;
        int v141 = v140 + v139;
        int v142 = v102[v141];
        int v143 = 0;
        bool v144 = v142 != v143;
        v135 = v135;
        v136 = v136;
        if (!v144) break;
        int v145 = v135 + v136;
        int v146 = 1;
        int v147 = v136 + v146;
        v135 = v145;
        v136 = v147;
      }
      bool v148 = true;
      v121 = v135;
    }
    v115 = v121;
  } else {
    int v149 = 0;
    int v150 = 0;
    int v151;
    int v152;
    v151 = v149;
    v152 = v150;
    while (true) {
      int v153 = 4;
      int v154 = v152 * v153;
      int v155 = v154 + v103;
      int v156 = 40;
      int v157 = v156 + v155;
      int v158 = v102[v157];
      int v159 = 0;
      bool v160 = v158 != v159;
      v151 = v151;
      v152 = v152;
      if (!v160) break;
      int v161 = v151 + v152;
      int v162 = 1;
      int v163 = v152 + v162;
      v151 = v161;
      v152 = v163;
      continue;
      ;
    }
    bool v164 = true;
    v115 = v151;
  }
  int v165 = 32;
  int v166 = v165 + v103;
  bool v167 = true;
  int v168 = simt_wave_count_bits(v167);
  v101[v166] = v168;
  int v169 = 0;
  int v170 = 0;
  int v171;
  int v172;
  v171 = v169;
  v172 = v170;
  while (true) {
    int v173 = 4;
    int v174 = v172 * v173;
    int v175 = v174 + v103;
    int v176 = 60;
    int v177 = v176 + v175;
    int v178 = v102[v177];
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
  int v186 = v185 + v103;
  bool v187 = true;
  int v188 = simt_wave_count_bits(v187);
  v101[v186] = v188;
  int v189 = 80;
  int v190 = v189 + v103;
  int v191 = v102[v190];
  int v192 = 0;
  bool v193 = v191 != v192;
  int v194;
  if (v193) {
    int v195 = 4;
    v194 = v195;
  } else {
    uint v196 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v197 = (int)(v196);
    v194 = v197;
  }
  int v198 = 64;
  int v199 = v198 + v103;
  bool v200 = true;
  int v201 = simt_wave_count_bits(v200);
  v101[v199] = v201;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
