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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 3;
    int v8 = v3 % v7;
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      default:
        {
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
          int v22 = 1;
          int v23 = v15 + v22;
          v14 = v21;
          v15 = v23;
          break;
          ;
        }
        v11 = v14;
        break;
      }
      case 0:
        {
        int v24 = 0;
        bool v25 = v2 != v24;
        int v26;
        if (v25) {
          v26 = v0;
        } else {
          int v27 = 4;
          int v28 = v0 + v27;
          v26 = v28;
        }
        v11 = v26;
        break;
      }
      case 1:
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
          continue;
          ;
        }
        v11 = v31;
        break;
      }
    }
    v6 = v11;
  } else {
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
      int v49 = 2;
      int v50 = v3 % v49;
      int v51 = 2;
      int v52 = v0 + v51;
      int v53;
      v53 = v52;
      switch (v50) {
        default:
          {
          v53 = v0;
        }
        case 0:
          {
          int v54 = 4;
          int v55 = v0 + v54;
          v53 = v55;
          break;
        }
      }
      int v56 = 1;
      int v57 = v43 + v56;
      v42 = v53;
      v43 = v57;
    }
    v6 = v42;
  }
  bool v58 = true;
  int v59 = simt_wave_count_bits(v58);
  int v60 = 0;
  int v61 = v60 + v0;
  v1[v61] = v59;
  return;
}

kernel void kernel_main(device int* v62 [[buffer(0)]], device int* v63 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v64 = static_cast<int>(__simt_tid3.x);
  int v65 = 0;
  int v66 = v65 + v64;
  int v67 = v63[v66];
  int v68 = 4;
  int v69 = v68 + v64;
  int v70 = v63[v69];
  int v71 = 0;
  bool v72 = v67 != v71;
  if (v72) {
    int v73 = 0;
    int v74 = 0;
    int v75;
    int v76;
    v75 = v73;
    v76 = v74;
    while (true) {
      int v77 = 1;
      bool v78 = v76 < v77;
      v75 = v75;
      v76 = v76;
      if (!v78) break;
      helper0(v64, v62, v67, v70, static_cast<int>(__simt_tid3.x));
      int v79 = 1;
      int v80 = v76 + v79;
      v75 = v75;
      v76 = v80;
    }
  } else {
  }
  int v81 = 8;
  int v82 = v81 + v64;
  int v83 = v63[v82];
  uint v84 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v85 = (int)(v84);
  int v86;
  v86 = v85;
  switch (v83) {
    case 0:
      {
      int v87 = 12;
      int v88 = v87 + v64;
      int v89 = v63[v88];
      int v90 = 0;
      bool v91 = v89 != v90;
      int v92;
      if (v91) {
        int v93 = 16;
        int v94 = v93 + v64;
        int v95 = v63[v94];
        int v96 = 0;
        bool v97 = v95 != v96;
        int v98;
        if (v97) {
          int v99 = 1;
          v98 = v99;
        } else {
          int v100 = 2;
          v98 = v100;
        }
        v92 = v98;
      } else {
        int v101 = 20;
        int v102 = v101 + v64;
        int v103 = v63[v102];
        int v104 = 4;
        int v105 = v64 + v104;
        int v106;
        v106 = v105;
        switch (v103) {
          case 0:
            {
            int v107 = 0;
            int v108 = v64 + v107;
            v106 = v108;
            break;
          }
          default:
            {
            v106 = v64;
            break;
          }
          case 1:
            {
            v106 = v64;
            break;
          }
          case 2:
            {
            v106 = v64;
            break;
          }
        }
        bool v109 = true;
        v92 = v106;
      }
      v86 = v92;
      break;
    }
    case 1:
      {
      v86 = v64;
      break;
    }
    case 2:
      {
      int v110 = 24;
      int v111 = v110 + v64;
      int v112 = v63[v111];
      int v113 = 0;
      bool v114 = v112 != v113;
      int v115;
      if (v114) {
        int v116 = 28;
        int v117 = v116 + v64;
        int v118 = v63[v117];
        int v119 = 0;
        bool v120 = v118 != v119;
        int v121;
        if (v120) {
          int v122 = 1;
          int v123 = v64 + v122;
          v121 = v123;
        } else {
          int v124 = 3;
          int v125 = v64 + v124;
          v121 = v125;
        }
        v115 = v121;
      } else {
        int v126 = 32;
        int v127 = v126 + v64;
        int v128 = v63[v127];
        int v129 = 1;
        int v130 = v64 + v129;
        int v131;
        v131 = v130;
        switch (v128) {
          default:
            {
            int v132 = 2;
            int v133 = v64 + v132;
            v131 = v133;
          }
          case 0:
            {
            int v134 = 1;
            v131 = v134;
            break;
          }
        }
        bool v135 = true;
        v115 = v131;
      }
      v86 = v115;
      break;
    }
    default:
      {
      int v136 = 36;
      int v137 = v136 + v64;
      int v138 = v63[v137];
      int v139 = 0;
      bool v140 = v138 != v139;
      int v141;
      if (v140) {
        int v142 = 1;
        v141 = v142;
      } else {
        int v143 = 1;
        int v144 = v64 + v143;
        v141 = v144;
      }
      v86 = v141;
      break;
    }
  }
  int v145 = 40;
  int v146 = v145 + v64;
  int v147 = v63[v146];
  int v148 = 3;
  int v149;
  v149 = v148;
  switch (v147) {
    case 0:
      {
      int v150 = 44;
      int v151 = v150 + v64;
      int v152 = v63[v151];
      int v153 = 0;
      bool v154 = v152 != v153;
      int v155;
      if (v154) {
        int v156 = 48;
        int v157 = v156 + v64;
        int v158 = v63[v157];
        int v159 = 0;
        bool v160 = v158 != v159;
        int v161;
        if (v160) {
          int v162 = 4;
          int v163 = v64 + v162;
          v161 = v163;
        } else {
          v161 = v64;
        }
        v155 = v161;
      } else {
        int v164 = 1;
        int v165 = v64 + v164;
        v155 = v165;
      }
      v149 = v155;
      break;
    }
    default:
      {
      int v166 = 52;
      int v167 = v166 + v64;
      int v168 = v63[v167];
      int v169 = 0;
      bool v170 = v168 != v169;
      int v171;
      if (v170) {
        int v172 = 56;
        int v173 = v172 + v64;
        int v174 = v63[v173];
        int v175 = 0;
        int v176;
        v176 = v175;
        switch (v174) {
          case 0:
            {
            int v177 = 3;
            v176 = v177;
            break;
          }
          default:
            {
            int v178 = 4;
            v176 = v178;
            break;
          }
          case 1:
            {
            int v179 = 2;
            v176 = v179;
            break;
          }
        }
        v171 = v176;
      } else {
        int v180 = 60;
        int v181 = v180 + v64;
        int v182 = v63[v181];
        int v183 = 3;
        int v184;
        v184 = v183;
        switch (v182) {
          case 0:
            {
            int v185 = 2;
            v184 = v185;
            break;
          }
          default:
            {
            v184 = v64;
            break;
          }
          case 1:
            {
            int v186 = 3;
            v184 = v186;
            break;
          }
        }
        v171 = v184;
      }
      v149 = v171;
      break;
    }
  }
  bool v187 = true;
  int v188 = 16;
  int v189 = v188 + v64;
  bool v190 = true;
  int v191 = simt_wave_count_bits(v190);
  v62[v189] = v191;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
