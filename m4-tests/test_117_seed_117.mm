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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 2;
  int v9 = v3 % v8;
  uint v10 = simt_subgroup_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    default:
      {
      v12 = v0;
      break;
    }
    case 0:
      {
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
        int v22 = 0;
        bool v23 = v2 != v22;
        int v24;
        if (v23) {
          int v25 = 0;
          v24 = v25;
        } else {
          int v26 = 3;
          int v27 = v0 + v26;
          v24 = v27;
        }
        int v28 = 1;
        int v29 = v16 + v28;
        v15 = v24;
        v16 = v29;
      }
      v12 = v15;
      break;
    }
    case 1:
      {
      int v30 = 0;
      bool v31 = v2 != v30;
      int v32;
      if (v31) {
        int v33 = 3;
        v32 = v33;
      } else {
        int v34 = 4;
        int v35 = v3 % v34;
        int v36 = 4;
        int v37;
        v37 = v36;
        switch (v35) {
          case 0:
            {
            int v38 = 0;
            v37 = v38;
            break;
          }
          case 1:
            {
            int v39 = 2;
            v37 = v39;
            break;
          }
          default:
            {
            int v40 = 1;
            v37 = v40;
            break;
          }
          case 2:
            {
            v37 = v0;
            break;
          }
        }
        v32 = v37;
      }
      v12 = v32;
      break;
    }
  }
  int v41 = 0;
  bool v42 = v2 != v41;
  int v43 = v42 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v44 [[buffer(0)]], device int* v45 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v46 = static_cast<int>(__simt_tid3.x);
  int v47 = 0;
  int v48 = v47 + v46;
  int v49 = v45[v48];
  int v50 = 4;
  int v51 = v50 + v46;
  int v52 = v45[v51];
  int v53 = 0;
  bool v54 = v49 != v53;
  if (v54) {
    int v55 = 0;
    int v56 = 0;
    int v57;
    int v58;
    v57 = v55;
    v58 = v56;
    while (true) {
      int v59 = 2;
      bool v60 = v58 < v59;
      v57 = v57;
      v58 = v58;
      if (!v60) break;
      int v61 = 3;
      int v62 = v46 % v61;
      uint v63 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v64 = (int)(v63);
      int v65;
      v65 = v64;
      switch (v62) {
        case 0:
          {
          int v66 = 4;
          int v67 = v65 + v66;
          v65 = v67;
          break;
        }
        case 1:
          {
          int v68 = 2;
          int v69 = v65 + v68;
          v65 = v69;
          break;
        }
        default:
          {
          int v70 = 4;
          int v71 = v65 + v70;
          v65 = v71;
          break;
        }
      }
      helper0(v46, v44, v49, v52, static_cast<int>(__simt_tid3.x));
      int v72 = 1;
      int v73 = v58 + v72;
      v57 = v57;
      v58 = v73;
    }
  } else {
  }
  int v74 = 8;
  int v75 = v74 + v46;
  int v76 = v45[v75];
  uint v77 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v78 = (int)(v77);
  int v79;
  v79 = v78;
  switch (v76) {
    case 0:
      {
      int v80 = 0;
      int v81 = v46 + v80;
      v79 = v81;
      break;
    }
    default:
      {
      int v82 = 12;
      int v83 = v82 + v46;
      int v84 = v45[v83];
      int v85 = 0;
      int v86 = v46 + v85;
      int v87;
      v87 = v86;
      switch (v84) {
        case 0:
          {
          int v88 = 16;
          int v89 = v88 + v46;
          int v90 = v45[v89];
          int v91 = 0;
          bool v92 = v90 != v91;
          int v93;
          if (v92) {
            v93 = v46;
          } else {
            int v94 = 0;
            int v95 = v46 + v94;
            v93 = v95;
          }
          v87 = v93;
          break;
        }
        case 1:
          {
          int v96 = 4;
          v87 = v96;
          break;
        }
        default:
          {
          int v97 = 0;
          int v98 = 0;
          int v99;
          int v100;
          v99 = v97;
          v100 = v98;
          while (true) {
            int v101 = 4;
            int v102 = v100 * v101;
            int v103 = v102 + v46;
            int v104 = 20;
            int v105 = v104 + v103;
            int v106 = v45[v105];
            int v107 = 0;
            bool v108 = v106 != v107;
            v99 = v99;
            v100 = v100;
            if (!v108) break;
            int v109 = v99 + v100;
            int v110 = 1;
            int v111 = v100 + v110;
            bool v112 = true;
            v99 = v109;
            v100 = v111;
          }
          v87 = v99;
          break;
        }
      }
      v79 = v87;
      break;
    }
  }
  int v113 = 40;
  int v114 = v113 + v46;
  int v115 = v45[v114];
  int v116 = 0;
  bool v117 = v115 != v116;
  int v118;
  if (v117) {
    int v119 = 44;
    int v120 = v119 + v46;
    int v121 = v45[v120];
    int v122 = 0;
    int v123;
    v123 = v122;
    switch (v121) {
      case 0:
        {
        int v124 = 0;
        int v125 = 0;
        int v126;
        int v127;
        v126 = v124;
        v127 = v125;
        while (true) {
          int v128 = 4;
          int v129 = v127 * v128;
          int v130 = v129 + v46;
          int v131 = 48;
          int v132 = v131 + v130;
          int v133 = v45[v132];
          int v134 = 0;
          bool v135 = v133 != v134;
          v126 = v126;
          v127 = v127;
          if (!v135) break;
          int v136 = v126 + v127;
          int v137 = 1;
          int v138 = v127 + v137;
          bool v139 = true;
          v126 = v136;
          v127 = v138;
          break;
          ;
        }
        v123 = v126;
        break;
      }
      default:
        {
        int v140 = 68;
        int v141 = v140 + v46;
        int v142 = v45[v141];
        int v143 = 2;
        int v144;
        v144 = v143;
        switch (v142) {
          default:
            {
            int v145 = 0;
            int v146 = v46 + v145;
            v144 = v146;
            break;
          }
          case 0:
            {
            int v147 = 0;
            v144 = v147;
            break;
          }
          case 1:
            {
            int v148 = 2;
            v144 = v148;
            break;
          }
        }
        bool v149 = true;
        v123 = v144;
        break;
      }
    }
    v118 = v123;
  } else {
    int v150 = 0;
    int v151 = 0;
    int v152;
    int v153;
    v152 = v150;
    v153 = v151;
    while (true) {
      int v154 = 4;
      int v155 = v153 * v154;
      int v156 = v155 + v46;
      int v157 = 72;
      int v158 = v157 + v156;
      int v159 = v45[v158];
      int v160 = 0;
      bool v161 = v159 != v160;
      v152 = v152;
      v153 = v153;
      if (!v161) break;
      int v162 = v152 + v153;
      int v163 = 1;
      int v164 = v153 + v163;
      bool v165 = true;
      int v166 = 16;
      int v167 = 4;
      int v168 = v153 * v167;
      int v169 = v166 + v168;
      int v170 = v169 + v46;
      bool v171 = true;
      int v172 = simt_wave_count_bits(v171);
      v44[v170] = v172;
      v152 = v162;
      v153 = v164;
    }
    v118 = v152;
  }
  int v173 = 32;
  int v174 = v173 + v46;
  bool v175 = true;
  int v176 = simt_wave_count_bits(v175);
  v44[v174] = v176;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 92; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
