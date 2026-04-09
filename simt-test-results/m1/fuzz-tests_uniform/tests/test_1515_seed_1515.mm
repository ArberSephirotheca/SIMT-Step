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
    int v13 = 1;
    int v14 = v0 + v13;
    int v15 = 1;
    int v16 = v7 + v15;
    v6 = v14;
    v7 = v16;
  }
  bool v17 = true;
  int v18 = simt_wave_count_bits(v17);
  int v19 = 0;
  int v20 = v19 + v0;
  v1[v20] = v18;
  int v21 = 3;
  int v22 = v3 % v21;
  int v23 = 0;
  int v24;
  v24 = v23;
  switch (v22) {
    case 0:
      {
      int v25 = 0;
      bool v26 = v2 != v25;
      int v27;
      if (v26) {
        int v28 = 0;
        int v29 = 0;
        int v30;
        int v31;
        v30 = v28;
        v31 = v29;
        while (true) {
          int v32 = 4;
          int v33 = v3 % v32;
          int v34 = 1;
          int v35 = v33 + v34;
          bool v36 = v31 < v35;
          v30 = v30;
          v31 = v31;
          if (!v36) break;
          int v37 = 2;
          int v38 = 1;
          int v39 = v31 + v38;
          v30 = v37;
          v31 = v39;
        }
        int v40 = 2;
        v27 = v30;
      } else {
        int v41 = 4;
        int v42 = v0 + v41;
        v27 = v42;
      }
      int v43 = 3;
      v24 = v27;
      break;
    }
    case 1:
      {
      int v44 = 3;
      v24 = v44;
      break;
    }
    default:
      {
      int v45 = 0;
      int v46 = 0;
      int v47;
      int v48;
      v47 = v45;
      v48 = v46;
      while (true) {
        int v49 = 4;
        int v50 = v3 % v49;
        int v51 = 1;
        int v52 = v50 + v51;
        bool v53 = v48 < v52;
        v47 = v47;
        v48 = v48;
        if (!v53) break;
        int v54 = 2;
        int v55 = v3 % v54;
        int v56;
        v56 = v0;
        switch (v55) {
          case 0:
            {
            v56 = v0;
            break;
          }
          default:
            {
            int v57 = 1;
            int v58 = v0 + v57;
            v56 = v58;
            break;
          }
          case 1:
            {
            int v59 = 1;
            int v60 = v0 + v59;
            v56 = v60;
            break;
          }
        }
        int v61 = 1;
        int v62 = 1;
        int v63 = v48 + v62;
        v47 = v56;
        v48 = v63;
      }
      v24 = v47;
      break;
    }
    case 2:
      {
      int v64 = 0;
      bool v65 = v2 != v64;
      int v66;
      if (v65) {
        int v67 = 0;
        bool v68 = v2 != v67;
        int v69;
        if (v68) {
          v69 = v0;
        } else {
          int v70 = 1;
          int v71 = v0 + v70;
          v69 = v71;
        }
        int v72 = 4;
        int v73 = v0 + v72;
        v66 = v69;
      } else {
        int v74 = 1;
        int v75;
        v75 = v74;
        switch (v3) {
          default:
            {
            v75 = v0;
            break;
          }
          case 0:
            {
            int v76 = 0;
            v75 = v76;
            break;
          }
        }
        int v77 = 3;
        v66 = v75;
      }
      int v78 = 3;
      v24 = v66;
      break;
    }
  }
  bool v79 = true;
  int v80 = simt_wave_count_bits(v79);
  int v81 = 16;
  int v82 = v81 + v0;
  v1[v82] = v80;
  int v83 = 0;
  bool v84 = v2 != v83;
  int v85 = v84 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v86 [[buffer(0)]], device int* v87 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v88 = static_cast<int>(__simt_tid3.x);
  int v89 = 0;
  int v90 = v89 + v88;
  int v91 = v87[v90];
  int v92 = 4;
  int v93 = v92 + v88;
  int v94 = v87[v93];
  helper0(v88, v86, v91, v94, static_cast<int>(__simt_tid3.x));
  uint v95 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v96 = (int)(v95);
  int v97 = 0;
  int v98 = 0;
  int v99;
  int v100;
  v99 = v97;
  v100 = v98;
  while (true) {
    int v101 = 4;
    int v102 = v100 * v101;
    int v103 = v102 + v88;
    int v104 = 8;
    int v105 = v104 + v103;
    int v106 = v87[v105];
    int v107 = 0;
    bool v108 = v106 != v107;
    v99 = v99;
    v100 = v100;
    if (!v108) break;
    int v109 = v99 + v100;
    int v110 = 1;
    int v111 = v100 + v110;
    v99 = v109;
    v100 = v111;
  }
  bool v112 = true;
  int v113 = 32;
  int v114 = v113 + v88;
  bool v115 = true;
  int v116 = simt_wave_count_bits(v115);
  v86[v114] = v116;
  int v117 = 28;
  int v118 = v117 + v88;
  int v119 = v87[v118];
  int v120 = 0;
  bool v121 = v119 != v120;
  int v122;
  if (v121) {
    int v123 = 32;
    int v124 = v123 + v88;
    int v125 = v87[v124];
    int v126 = 3;
    int v127 = v88 + v126;
    int v128;
    v128 = v127;
    switch (v125) {
      case 0:
        {
        v128 = v88;
        break;
      }
      case 1:
        {
        int v129 = 0;
        int v130 = 0;
        int v131;
        int v132;
        v131 = v129;
        v132 = v130;
        while (true) {
          int v133 = 4;
          int v134 = v132 * v133;
          int v135 = v134 + v88;
          int v136 = 36;
          int v137 = v136 + v135;
          int v138 = v87[v137];
          int v139 = 0;
          bool v140 = v138 != v139;
          v131 = v131;
          v132 = v132;
          if (!v140) break;
          int v141 = v131 + v132;
          int v142 = 1;
          int v143 = v132 + v142;
          v131 = v141;
          v132 = v143;
        }
        bool v144 = true;
        v128 = v131;
        break;
      }
      case 2:
        {
        int v145 = 56;
        int v146 = v145 + v88;
        int v147 = v87[v146];
        int v148 = 0;
        bool v149 = v147 != v148;
        int v150;
        if (v149) {
          int v151 = 0;
          int v152 = v88 + v151;
          v150 = v152;
        } else {
          int v153 = 4;
          int v154 = v88 + v153;
          v150 = v154;
        }
        v128 = v150;
      }
      default:
        {
        int v155 = 60;
        int v156 = v155 + v88;
        int v157 = v87[v156];
        int v158 = 0;
        int v159 = v88 + v158;
        int v160;
        v160 = v159;
        switch (v157) {
          case 0:
            {
            int v161 = 1;
            v160 = v161;
            break;
          }
          case 1:
            {
            v160 = v88;
            break;
          }
          default:
            {
            v160 = v88;
            break;
          }
          case 2:
            {
            int v162 = 1;
            v160 = v162;
            break;
          }
        }
        bool v163 = true;
        v128 = v160;
        break;
      }
    }
    bool v164 = true;
    v122 = v128;
  } else {
    int v165 = 64;
    int v166 = v165 + v88;
    int v167 = v87[v166];
    int v168;
    v168 = v88;
    switch (v167) {
      default:
        {
        int v169 = 68;
        int v170 = v169 + v88;
        int v171 = v87[v170];
        int v172 = 1;
        int v173;
        v173 = v172;
        switch (v171) {
          default:
            {
            int v174 = 0;
            int v175 = v88 + v174;
            v173 = v175;
            break;
          }
          case 0:
            {
            int v176 = 0;
            int v177 = v88 + v176;
            v173 = v177;
            break;
          }
          case 1:
            {
            int v178 = 0;
            int v179 = v88 + v178;
            v173 = v179;
            break;
          }
        }
        bool v180 = true;
        v168 = v173;
        break;
      }
      case 0:
        {
        int v181 = 72;
        int v182 = v181 + v88;
        int v183 = v87[v182];
        int v184;
        v184 = v88;
        switch (v183) {
          default:
            {
            int v185 = 0;
            v184 = v185;
            break;
          }
          case 0:
            {
            int v186 = 0;
            v184 = v186;
            break;
          }
          case 1:
            {
            int v187 = 0;
            int v188 = v88 + v187;
            v184 = v188;
            break;
          }
          case 2:
            {
            int v189 = 2;
            int v190 = v88 + v189;
            v184 = v190;
            break;
          }
        }
        bool v191 = true;
        v168 = v184;
        break;
      }
    }
    bool v192 = true;
    v122 = v168;
  }
  int v193 = 48;
  int v194 = v193 + v88;
  bool v195 = true;
  int v196 = simt_wave_count_bits(v195);
  v86[v194] = v196;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
