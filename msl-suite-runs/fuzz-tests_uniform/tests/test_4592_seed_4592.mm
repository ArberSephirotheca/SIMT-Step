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
    v6 = v0;
  } else {
    int v7 = 0;
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      uint v16 = simt_subgroup_id(__simt_tid);
      int v17 = (int)(v16);
      int v18 = 1;
      int v19 = v10 + v18;
      v9 = v17;
      v10 = v19;
    }
    uint v20 = simt_subgroup_id(__simt_tid);
    int v21 = (int)(v20);
    v6 = v9;
  }
  bool v22 = true;
  int v23 = simt_wave_count_bits(v22);
  int v24 = 0;
  int v25 = v24 + v0;
  v1[v25] = v23;
  int v26 = 0;
  bool v27 = v2 != v26;
  int v28 = v27 ? v0 : v6;
  int v29 = 2;
  int v30 = v3 % v29;
  uint v31 = simt_lane_id(__simt_tid);
  int v32 = (int)(v31);
  int v33;
  v33 = v32;
  switch (v30) {
    default:
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
        int v43 = 0;
        int v44 = 0;
        int v45;
        int v46;
        v45 = v43;
        v46 = v44;
        while (true) {
          int v47 = 4;
          int v48 = v3 % v47;
          int v49 = 1;
          int v50 = v48 + v49;
          bool v51 = v46 < v50;
          v45 = v45;
          v46 = v46;
          if (!v51) break;
          int v52 = 0;
          int v53 = v0 + v52;
          int v54 = 1;
          int v55 = v46 + v54;
          v45 = v53;
          v46 = v55;
          continue;
          ;
        }
        int v56 = 1;
        int v57 = v37 + v56;
        v36 = v45;
        v37 = v57;
      }
      v33 = v36;
      break;
    }
    case 0:
      {
      int v58 = 2;
      int v59 = v3 % v58;
      int v60 = 0;
      int v61 = v0 + v60;
      int v62;
      v62 = v61;
      switch (v59) {
        case 0:
          {
          int v63 = 2;
          int v64 = v3 % v63;
          int v65 = 0;
          int v66;
          v66 = v65;
          switch (v64) {
            case 0:
              {
              v66 = v0;
            }
            case 1:
              {
              int v67 = 0;
              v66 = v67;
            }
            default:
              {
              int v68 = 4;
              int v69 = v0 + v68;
              v66 = v69;
              break;
            }
          }
          v62 = v66;
        }
        default:
          {
          int v70 = 1;
          int v71 = v0 + v70;
          v62 = v71;
          break;
        }
      }
      int v72 = 4;
      v33 = v62;
      break;
    }
  }
  bool v73 = true;
  int v74 = simt_wave_count_bits(v73);
  int v75 = 16;
  int v76 = v75 + v0;
  v1[v76] = v74;
  int v77 = 0;
  bool v78 = v2 != v77;
  int v79 = v78 ? v28 : v33;
  return;
}

kernel void kernel_main(device int* v80 [[buffer(0)]], device int* v81 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v82 = static_cast<int>(__simt_tid3.x);
  int v83 = 0;
  int v84 = v83 + v82;
  int v85 = v81[v84];
  int v86 = 4;
  int v87 = v86 + v82;
  int v88 = v81[v87];
  helper0(v82, v80, v85, v88, static_cast<int>(__simt_tid3.x));
  int v89 = 4;
  int v90 = v82 + v89;
  int v91 = 4;
  int v92 = 8;
  int v93 = v92 + v82;
  int v94 = v81[v93];
  uint v95 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v96 = (int)(v95);
  int v97;
  v97 = v96;
  switch (v94) {
    case 0:
      {
      int v98 = 12;
      int v99 = v98 + v82;
      int v100 = v81[v99];
      int v101 = 0;
      bool v102 = v100 != v101;
      int v103;
      if (v102) {
        int v104 = 16;
        int v105 = v104 + v82;
        int v106 = v81[v105];
        int v107 = 0;
        int v108 = v82 + v107;
        int v109;
        v109 = v108;
        switch (v106) {
          default:
            {
            int v110 = 3;
            int v111 = v82 + v110;
            v109 = v111;
            break;
          }
          case 0:
            {
            v109 = v82;
            break;
          }
        }
        bool v112 = true;
        v103 = v109;
      } else {
        int v113 = 20;
        int v114 = v113 + v82;
        int v115 = v81[v114];
        int v116 = 0;
        bool v117 = v115 != v116;
        int v118;
        if (v117) {
          v118 = v82;
        } else {
          int v119 = 4;
          v118 = v119;
        }
        v103 = v118;
      }
      v97 = v103;
      break;
    }
    case 1:
      {
      int v120 = 24;
      int v121 = v120 + v82;
      int v122 = v81[v121];
      int v123 = 4;
      int v124 = v82 + v123;
      int v125;
      v125 = v124;
      switch (v122) {
        default:
          {
          int v126 = 28;
          int v127 = v126 + v82;
          int v128 = v81[v127];
          int v129 = 2;
          int v130;
          v130 = v129;
          switch (v128) {
            default:
              {
              int v131 = 3;
              int v132 = v82 + v131;
              v130 = v132;
            }
            case 0:
              {
              v130 = v82;
              break;
            }
          }
          bool v133 = true;
          v125 = v130;
          break;
        }
        case 0:
          {
          int v134 = 0;
          int v135 = 0;
          int v136;
          int v137;
          v136 = v134;
          v137 = v135;
          while (true) {
            int v138 = 4;
            int v139 = v137 * v138;
            int v140 = v139 + v82;
            int v141 = 32;
            int v142 = v141 + v140;
            int v143 = v81[v142];
            int v144 = 0;
            bool v145 = v143 != v144;
            v136 = v136;
            v137 = v137;
            if (!v145) break;
            int v146 = v136 + v137;
            int v147 = 1;
            int v148 = v137 + v147;
            v136 = v146;
            v137 = v148;
          }
          bool v149 = true;
          v125 = v136;
          break;
        }
      }
      bool v150 = true;
      v97 = v125;
      break;
    }
    case 2:
      {
      int v151 = 0;
      int v152 = 0;
      int v153;
      int v154;
      v153 = v151;
      v154 = v152;
      while (true) {
        int v155 = 4;
        int v156 = v154 * v155;
        int v157 = v156 + v82;
        int v158 = 52;
        int v159 = v158 + v157;
        int v160 = v81[v159];
        int v161 = 0;
        bool v162 = v160 != v161;
        v153 = v153;
        v154 = v154;
        if (!v162) break;
        int v163 = 72;
        int v164 = v163 + v82;
        int v165 = v81[v164];
        int v166 = 0;
        bool v167 = v165 != v166;
        int v168;
        if (v167) {
          v168 = v82;
        } else {
          v168 = v82;
        }
        int v169 = v153 + v168;
        int v170 = 1;
        int v171 = v154 + v170;
        v153 = v169;
        v154 = v171;
      }
      bool v172 = true;
      v97 = v153;
      break;
    }
    default:
      {
      int v173 = 3;
      v97 = v173;
      break;
    }
  }
  bool v174 = true;
  int v175 = 32;
  int v176 = v175 + v82;
  bool v177 = true;
  int v178 = simt_wave_count_bits(v177);
  v80[v176] = v178;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
