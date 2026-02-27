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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
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
        int v18 = 3;
        int v19 = v3 % v18;
        int v20 = 3;
        int v21;
        v21 = v20;
        switch (v19) {
          case 0:
            {
            int v22 = 3;
            int v23 = v0 + v22;
            v21 = v23;
          }
          case 1:
            {
            int v24 = 4;
            int v25 = v0 + v24;
            v21 = v25;
          }
          case 2:
            {
            int v26 = 3;
            int v27 = v0 + v26;
            v21 = v27;
          }
          default:
            {
            int v28 = 0;
            v21 = v28;
            break;
          }
        }
        int v29 = 1;
        int v30 = v12 + v29;
        v11 = v21;
        v12 = v30;
        break;
        ;
      }
      v8 = v11;
      break;
    }
    default:
      {
      int v31 = 1;
      int v32 = v0 + v31;
      int v33;
      v33 = v32;
      switch (v3) {
        case 0:
          {
          int v34 = 0;
          int v35 = 0;
          int v36;
          int v37;
          v36 = v34;
          v37 = v35;
          while (true) {
            int v38 = 4;
            int v39 = v3 % v38;
            int v40 = 1;
            int v41 = v39 + v40;
            bool v42 = v37 < v41;
            v36 = v36;
            v37 = v37;
            if (!v42) break;
            int v43 = 1;
            int v44 = v37 + v43;
            v36 = v0;
            v37 = v44;
            break;
            ;
          }
          v33 = v36;
          break;
        }
        default:
          {
          int v45 = 0;
          bool v46 = v2 != v45;
          int v47;
          if (v46) {
            int v48 = 2;
            v47 = v48;
          } else {
            v47 = v0;
          }
          v33 = v47;
          break;
        }
      }
      v8 = v33;
      break;
    }
    case 1:
      {
      int v49 = 3;
      int v50 = v0 + v49;
      v8 = v50;
      break;
    }
  }
  bool v51 = true;
  int v52 = simt_wave_count_bits(v51);
  int v53 = 0;
  int v54 = v53 + v0;
  v1[v54] = v52;
  return;
}

kernel void kernel_main(device int* v55 [[buffer(0)]], device int* v56 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v57 = static_cast<int>(__simt_tid3.x);
  int v58 = 0;
  int v59 = v58 + v57;
  int v60 = v56[v59];
  int v61 = 4;
  int v62 = v61 + v57;
  int v63 = v56[v62];
  int v64 = 0;
  bool v65 = v60 != v64;
  if (v65) {
    int v66 = 8;
    int v67 = v66 + v57;
    int v68 = v56[v67];
    int v69 = 0;
    bool v70 = v68 != v69;
    if (v70) {
      helper0(v57, v55, v60, v63, static_cast<int>(__simt_tid3.x));
    } else {
    }
  } else {
  }
  uint v71 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v72 = (int)(v71);
  int v73 = 3;
  int v74 = 0;
  int v75 = 0;
  int v76;
  int v77;
  v76 = v74;
  v77 = v75;
  while (true) {
    int v78 = 4;
    int v79 = v77 * v78;
    int v80 = v79 + v57;
    int v81 = 12;
    int v82 = v81 + v80;
    int v83 = v56[v82];
    int v84 = 0;
    bool v85 = v83 != v84;
    v76 = v76;
    v77 = v77;
    if (!v85) break;
    int v86 = v76 + v57;
    int v87 = 1;
    int v88 = v77 + v87;
    bool v89 = true;
    int v90 = 16;
    int v91 = 4;
    int v92 = v77 * v91;
    int v93 = v90 + v92;
    int v94 = v93 + v57;
    bool v95 = true;
    int v96 = simt_wave_count_bits(v95);
    v55[v94] = v96;
    v76 = v86;
    v77 = v88;
    continue;
    ;
  }
  int v97 = 32;
  int v98 = v97 + v57;
  int v99 = v56[v98];
  int v100 = 4;
  int v101;
  v101 = v100;
  switch (v99) {
    case 0:
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
        int v108 = v107 + v57;
        int v109 = 36;
        int v110 = v109 + v108;
        int v111 = v56[v110];
        int v112 = 0;
        bool v113 = v111 != v112;
        v104 = v104;
        v105 = v105;
        if (!v113) break;
        int v114 = 56;
        int v115 = v114 + v57;
        int v116 = v56[v115];
        int v117 = 3;
        int v118;
        v118 = v117;
        switch (v116) {
          case 0:
            {
            int v119 = 1;
            v118 = v119;
            break;
          }
          case 1:
            {
            v118 = v57;
          }
          default:
            {
            v118 = v57;
            break;
          }
        }
        int v120 = v104 + v118;
        int v121 = 1;
        int v122 = v105 + v121;
        bool v123 = true;
        v104 = v120;
        v105 = v122;
        continue;
        ;
      }
      v101 = v104;
      break;
    }
    case 1:
      {
      int v124 = 60;
      int v125 = v124 + v57;
      int v126 = v56[v125];
      int v127 = 0;
      bool v128 = v126 != v127;
      int v129;
      if (v128) {
        int v130 = 0;
        int v131 = 0;
        int v132;
        int v133;
        v132 = v130;
        v133 = v131;
        while (true) {
          int v134 = 4;
          int v135 = v133 * v134;
          int v136 = v135 + v57;
          int v137 = 64;
          int v138 = v137 + v136;
          int v139 = v56[v138];
          int v140 = 0;
          bool v141 = v139 != v140;
          v132 = v132;
          v133 = v133;
          if (!v141) break;
          int v142 = v132 + v133;
          int v143 = 1;
          int v144 = v133 + v143;
          bool v145 = true;
          v132 = v142;
          v133 = v144;
          break;
          ;
        }
        v129 = v132;
      } else {
        int v146 = 0;
        int v147 = 0;
        int v148;
        int v149;
        v148 = v146;
        v149 = v147;
        while (true) {
          int v150 = 4;
          int v151 = v149 * v150;
          int v152 = v151 + v57;
          int v153 = 84;
          int v154 = v153 + v152;
          int v155 = v56[v154];
          int v156 = 0;
          bool v157 = v155 != v156;
          v148 = v148;
          v149 = v149;
          if (!v157) break;
          int v158 = v148 + v149;
          int v159 = 1;
          int v160 = v149 + v159;
          bool v161 = true;
          v148 = v158;
          v149 = v160;
        }
        v129 = v148;
      }
      v101 = v129;
      break;
    }
    default:
      {
      v101 = v57;
      break;
    }
    case 2:
      {
      int v162 = 104;
      int v163 = v162 + v57;
      int v164 = v56[v163];
      int v165 = 0;
      bool v166 = v164 != v165;
      int v167;
      if (v166) {
        int v168 = 108;
        int v169 = v168 + v57;
        int v170 = v56[v169];
        int v171;
        v171 = v57;
        switch (v170) {
          case 0:
            {
            v171 = v57;
          }
          default:
            {
            int v172 = 2;
            int v173 = v57 + v172;
            v171 = v173;
          }
          case 1:
            {
            int v174 = 3;
            int v175 = v57 + v174;
            v171 = v175;
            break;
          }
        }
        bool v176 = true;
        v167 = v171;
      } else {
        int v177 = 112;
        int v178 = v177 + v57;
        int v179 = v56[v178];
        int v180 = 4;
        int v181;
        v181 = v180;
        switch (v179) {
          case 0:
            {
            v181 = v57;
            break;
          }
          case 1:
            {
            v181 = v57;
          }
          default:
            {
            int v182 = 0;
            int v183 = v57 + v182;
            v181 = v183;
          }
          case 2:
            {
            int v184 = 3;
            v181 = v184;
            break;
          }
        }
        v167 = v181;
      }
      v101 = v167;
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
    static int32_t expected0[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 24; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 116; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
