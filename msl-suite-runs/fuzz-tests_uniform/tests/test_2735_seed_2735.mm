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
    int v7 = 2;
    int v8 = v0 + v7;
    v6 = v8;
  } else {
    int v9 = 0;
    bool v10 = v2 != v9;
    int v11;
    if (v10) {
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
        int v21 = 3;
        int v22 = 1;
        int v23 = v15 + v22;
        v14 = v21;
        v15 = v23;
      }
      uint v24 = simt_subgroup_id(__simt_tid);
      int v25 = (int)(v24);
      v11 = v14;
    } else {
      uint v26 = simt_subgroup_id(__simt_tid);
      int v27 = (int)(v26);
      v11 = v27;
    }
    int v28 = 2;
    int v29 = v0 + v28;
    v6 = v11;
  }
  bool v30 = true;
  int v31 = simt_wave_count_bits(v30);
  int v32 = 0;
  int v33 = v32 + v0;
  v1[v33] = v31;
  int v34 = 0;
  bool v35 = v2 != v34;
  int v36 = v35 ? v0 : v6;
  return;
}

kernel void kernel_main(device int* v37 [[buffer(0)]], device int* v38 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v39 = static_cast<int>(__simt_tid3.x);
  int v40 = 0;
  int v41 = v40 + v39;
  int v42 = v38[v41];
  int v43 = 4;
  int v44 = v43 + v39;
  int v45 = v38[v44];
  helper0(v39, v37, v42, v45, static_cast<int>(__simt_tid3.x));
  int v46 = 8;
  int v47 = v46 + v39;
  int v48 = v38[v47];
  uint v49 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v50 = (int)(v49);
  int v51;
  v51 = v50;
  switch (v48) {
    case 0:
      {
      int v52 = 12;
      int v53 = v52 + v39;
      int v54 = v38[v53];
      int v55 = 2;
      int v56;
      v56 = v55;
      switch (v54) {
        case 0:
          {
          int v57 = 0;
          int v58 = 0;
          int v59;
          int v60;
          v59 = v57;
          v60 = v58;
          while (true) {
            int v61 = 4;
            int v62 = v60 * v61;
            int v63 = v62 + v39;
            int v64 = 16;
            int v65 = v64 + v63;
            int v66 = v38[v65];
            int v67 = 0;
            bool v68 = v66 != v67;
            v59 = v59;
            v60 = v60;
            if (!v68) break;
            int v69 = v59 + v60;
            int v70 = 1;
            int v71 = v60 + v70;
            v59 = v69;
            v60 = v71;
          }
          bool v72 = true;
          v56 = v59;
          break;
        }
        default:
          {
          int v73 = 0;
          int v74 = 0;
          int v75;
          int v76;
          v75 = v73;
          v76 = v74;
          while (true) {
            int v77 = 4;
            int v78 = v76 * v77;
            int v79 = v78 + v39;
            int v80 = 36;
            int v81 = v80 + v79;
            int v82 = v38[v81];
            int v83 = 0;
            bool v84 = v82 != v83;
            v75 = v75;
            v76 = v76;
            if (!v84) break;
            int v85 = v75 + v76;
            int v86 = 1;
            int v87 = v76 + v86;
            v75 = v85;
            v76 = v87;
          }
          bool v88 = true;
          v56 = v75;
          break;
        }
      }
      bool v89 = true;
      v51 = v56;
      break;
    }
    case 1:
      {
      int v90 = 56;
      int v91 = v90 + v39;
      int v92 = v38[v91];
      int v93 = 0;
      bool v94 = v92 != v93;
      int v95;
      if (v94) {
        int v96 = 0;
        int v97 = 0;
        int v98;
        int v99;
        v98 = v96;
        v99 = v97;
        while (true) {
          int v100 = 4;
          int v101 = v99 * v100;
          int v102 = v101 + v39;
          int v103 = 60;
          int v104 = v103 + v102;
          int v105 = v38[v104];
          int v106 = 0;
          bool v107 = v105 != v106;
          v98 = v98;
          v99 = v99;
          if (!v107) break;
          int v108 = v98 + v99;
          int v109 = 1;
          int v110 = v99 + v109;
          v98 = v108;
          v99 = v110;
        }
        bool v111 = true;
        v95 = v98;
      } else {
        int v112 = 0;
        int v113 = 0;
        int v114;
        int v115;
        v114 = v112;
        v115 = v113;
        while (true) {
          int v116 = 4;
          int v117 = v115 * v116;
          int v118 = v117 + v39;
          int v119 = 80;
          int v120 = v119 + v118;
          int v121 = v38[v120];
          int v122 = 0;
          bool v123 = v121 != v122;
          v114 = v114;
          v115 = v115;
          if (!v123) break;
          int v124 = v114 + v115;
          int v125 = 1;
          int v126 = v115 + v125;
          v114 = v124;
          v115 = v126;
          continue;
          ;
        }
        bool v127 = true;
        v95 = v114;
      }
      v51 = v95;
      break;
    }
    default:
      {
      int v128 = 100;
      int v129 = v128 + v39;
      int v130 = v38[v129];
      int v131 = 2;
      int v132 = v39 + v131;
      int v133;
      v133 = v132;
      switch (v130) {
        case 0:
          {
          int v134 = 104;
          int v135 = v134 + v39;
          int v136 = v38[v135];
          int v137 = 0;
          int v138 = v39 + v137;
          int v139;
          v139 = v138;
          switch (v136) {
            case 0:
              {
              v139 = v39;
              break;
            }
            default:
              {
              v139 = v39;
              break;
            }
          }
          bool v140 = true;
          v133 = v139;
          break;
        }
        default:
          {
          int v141 = 108;
          int v142 = v141 + v39;
          int v143 = v38[v142];
          int v144;
          v144 = v39;
          switch (v143) {
            case 0:
              {
              int v145 = 2;
              v144 = v145;
            }
            default:
              {
              int v146 = 3;
              int v147 = v39 + v146;
              v144 = v147;
            }
            case 1:
              {
              int v148 = 4;
              int v149 = v39 + v148;
              v144 = v149;
            }
            case 2:
              {
              v144 = v39;
              break;
            }
          }
          bool v150 = true;
          v133 = v144;
          break;
        }
        case 1:
          {
          int v151 = 112;
          int v152 = v151 + v39;
          int v153 = v38[v152];
          int v154 = 2;
          int v155;
          v155 = v154;
          switch (v153) {
            case 0:
              {
              v155 = v39;
              break;
            }
            case 1:
              {
              int v156 = 4;
              int v157 = v39 + v156;
              v155 = v157;
            }
            default:
              {
              int v158 = 1;
              v155 = v158;
              break;
            }
            case 2:
              {
              int v159 = 2;
              v155 = v159;
              break;
            }
          }
          bool v160 = true;
          v133 = v155;
          break;
        }
        case 2:
          {
          int v161 = 116;
          int v162 = v161 + v39;
          int v163 = v38[v162];
          int v164 = 0;
          bool v165 = v163 != v164;
          int v166;
          if (v165) {
            v166 = v39;
          } else {
            int v167 = 4;
            int v168 = v39 + v167;
            v166 = v168;
          }
          v133 = v166;
          break;
        }
      }
      bool v169 = true;
      v51 = v133;
      break;
    }
  }
  bool v170 = true;
  int v171 = 16;
  int v172 = v171 + v39;
  bool v173 = true;
  int v174 = simt_wave_count_bits(v173);
  v37[v172] = v174;
  int v175 = 0;
  int v176 = 1;
  int v177 = v39 + v176;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
