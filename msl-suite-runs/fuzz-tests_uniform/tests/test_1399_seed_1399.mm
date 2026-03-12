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
  int v6 = 3;
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
        bool v19 = v2 != v18;
        int v20;
        if (v19) {
          int v21 = 1;
          int v22 = v0 + v21;
          v20 = v22;
        } else {
          v20 = v0;
        }
        int v23 = 4;
        int v24 = 1;
        int v25 = v12 + v24;
        v11 = v20;
        v12 = v25;
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v26 = 3;
      int v27 = v0 + v26;
      v8 = v27;
      break;
    }
    default:
      {
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
        int v37 = 0;
        int v38 = 0;
        int v39;
        int v40;
        v39 = v37;
        v40 = v38;
        while (true) {
          int v41 = 4;
          int v42 = v3 % v41;
          int v43 = 1;
          int v44 = v42 + v43;
          bool v45 = v40 < v44;
          v39 = v39;
          v40 = v40;
          if (!v45) break;
          int v46 = 1;
          int v47 = v40 + v46;
          v39 = v0;
          v40 = v47;
        }
        int v48 = 1;
        int v49 = v31 + v48;
        v30 = v39;
        v31 = v49;
      }
      int v50 = 0;
      int v51 = v0 + v50;
      v8 = v30;
      break;
    }
  }
  bool v52 = true;
  int v53 = simt_wave_count_bits(v52);
  int v54 = 0;
  int v55 = v54 + v0;
  v1[v55] = v53;
  return;
}

kernel void kernel_main(device int* v56 [[buffer(0)]], device int* v57 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v58 = static_cast<int>(__simt_tid3.x);
  int v59 = 0;
  int v60 = v59 + v58;
  int v61 = v57[v60];
  int v62 = 4;
  int v63 = v62 + v58;
  int v64 = v57[v63];
  helper0(v58, v56, v61, v64, static_cast<int>(__simt_tid3.x));
  int v65 = 0;
  int v66 = 0;
  int v67;
  int v68;
  v67 = v65;
  v68 = v66;
  while (true) {
    int v69 = 4;
    int v70 = v68 * v69;
    int v71 = v70 + v58;
    int v72 = 8;
    int v73 = v72 + v71;
    int v74 = v57[v73];
    int v75 = 0;
    bool v76 = v74 != v75;
    v67 = v67;
    v68 = v68;
    if (!v76) break;
    int v77 = 0;
    int v78 = 0;
    int v79;
    int v80;
    v79 = v77;
    v80 = v78;
    while (true) {
      int v81 = 4;
      int v82 = v80 * v81;
      int v83 = v82 + v58;
      int v84 = 28;
      int v85 = v84 + v83;
      int v86 = v57[v85];
      int v87 = 0;
      bool v88 = v86 != v87;
      v79 = v79;
      v80 = v80;
      if (!v88) break;
      int v89 = 48;
      int v90 = v89 + v58;
      int v91 = v57[v90];
      int v92 = 0;
      bool v93 = v91 != v92;
      int v94;
      if (v93) {
        uint v95 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v96 = (int)(v95);
        v94 = v96;
      } else {
        uint v97 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v98 = (int)(v97);
        v94 = v98;
      }
      int v99 = v79 + v94;
      int v100 = 1;
      int v101 = v80 + v100;
      v79 = v99;
      v80 = v101;
    }
    bool v102 = true;
    int v103 = v67 + v79;
    int v104 = 1;
    int v105 = v68 + v104;
    v67 = v103;
    v68 = v105;
    continue;
    ;
  }
  bool v106 = true;
  int v107 = 16;
  int v108 = v107 + v58;
  bool v109 = true;
  int v110 = simt_wave_count_bits(v109);
  v56[v108] = v110;
  int v111 = 52;
  int v112 = v111 + v58;
  int v113 = v57[v112];
  int v114 = 0;
  bool v115 = v113 != v114;
  int v116;
  if (v115) {
    int v117 = 56;
    int v118 = v117 + v58;
    int v119 = v57[v118];
    uint v120 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v121 = (int)(v120);
    int v122;
    v122 = v121;
    switch (v119) {
      default:
        {
        int v123 = 60;
        int v124 = v123 + v58;
        int v125 = v57[v124];
        int v126 = 3;
        int v127;
        v127 = v126;
        switch (v125) {
          case 0:
            {
            v127 = v58;
            break;
          }
          default:
            {
            int v128 = 2;
            v127 = v128;
            break;
          }
          case 1:
            {
            int v129 = 1;
            v127 = v129;
            break;
          }
          case 2:
            {
            v127 = v58;
            break;
          }
        }
        bool v130 = true;
        v122 = v127;
        break;
      }
      case 0:
        {
        int v131 = 0;
        int v132 = 0;
        int v133;
        int v134;
        v133 = v131;
        v134 = v132;
        while (true) {
          int v135 = 4;
          int v136 = v134 * v135;
          int v137 = v136 + v58;
          int v138 = 64;
          int v139 = v138 + v137;
          int v140 = v57[v139];
          int v141 = 0;
          bool v142 = v140 != v141;
          v133 = v133;
          v134 = v134;
          if (!v142) break;
          int v143 = v133 + v134;
          int v144 = 1;
          int v145 = v134 + v144;
          v133 = v143;
          v134 = v145;
        }
        bool v146 = true;
        v122 = v133;
        break;
      }
      case 1:
        {
        int v147 = 84;
        int v148 = v147 + v58;
        int v149 = v57[v148];
        int v150 = 0;
        bool v151 = v149 != v150;
        int v152;
        if (v151) {
          int v153 = 4;
          int v154 = v58 + v153;
          v152 = v154;
        } else {
          v152 = v58;
        }
        v122 = v152;
        break;
      }
    }
    bool v155 = true;
    v116 = v122;
  } else {
    int v156 = 88;
    int v157 = v156 + v58;
    int v158 = v57[v157];
    int v159 = 0;
    bool v160 = v158 != v159;
    int v161;
    if (v160) {
      int v162 = 92;
      int v163 = v162 + v58;
      int v164 = v57[v163];
      uint v165 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v166 = (int)(v165);
      int v167;
      v167 = v166;
      switch (v164) {
        case 0:
          {
          int v168 = 0;
          int v169 = v58 + v168;
          v167 = v169;
          break;
        }
        default:
          {
          int v170 = 3;
          int v171 = v58 + v170;
          v167 = v171;
          break;
        }
      }
      bool v172 = true;
      v161 = v167;
    } else {
      int v173 = 0;
      int v174 = 0;
      int v175;
      int v176;
      v175 = v173;
      v176 = v174;
      while (true) {
        int v177 = 4;
        int v178 = v176 * v177;
        int v179 = v178 + v58;
        int v180 = 96;
        int v181 = v180 + v179;
        int v182 = v57[v181];
        int v183 = 0;
        bool v184 = v182 != v183;
        v175 = v175;
        v176 = v176;
        if (!v184) break;
        int v185 = v175 + v176;
        int v186 = 1;
        int v187 = v176 + v186;
        v175 = v185;
        v176 = v187;
      }
      bool v188 = true;
      v161 = v175;
    }
    v116 = v161;
  }
  int v189 = 32;
  int v190 = v189 + v58;
  bool v191 = true;
  int v192 = simt_wave_count_bits(v191);
  v56[v190] = v192;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 116; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
