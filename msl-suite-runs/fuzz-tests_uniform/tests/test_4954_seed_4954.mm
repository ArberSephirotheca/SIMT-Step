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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
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
      int v18;
      v18 = v0;
      switch (v3) {
        case 0:
          {
          int v19 = 1;
          int v20 = v0 + v19;
          v18 = v20;
          break;
        }
        default:
          {
          v18 = v0;
          break;
        }
      }
      int v21 = 0;
      int v22 = v0 + v21;
      int v23 = 1;
      int v24 = v12 + v23;
      v11 = v18;
      v12 = v24;
    }
    v8 = v11;
  } else {
    v8 = v0;
  }
  bool v25 = true;
  int v26 = simt_wave_count_bits(v25);
  int v27 = 0;
  int v28 = v27 + v0;
  v1[v28] = v26;
  int v29 = 0;
  bool v30 = v2 != v29;
  int v31 = v30 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v32 [[buffer(0)]], device int* v33 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v34 = static_cast<int>(__simt_tid3.x);
  int v35 = 0;
  int v36 = v35 + v34;
  int v37 = v33[v36];
  int v38 = 4;
  int v39 = v38 + v34;
  int v40 = v33[v39];
  helper0(v34, v32, v37, v40, static_cast<int>(__simt_tid3.x));
  int v41 = 0;
  int v42 = 8;
  int v43 = v42 + v34;
  int v44 = v33[v43];
  int v45 = 1;
  int v46 = v34 + v45;
  int v47;
  v47 = v46;
  switch (v44) {
    case 0:
      {
      int v48 = 12;
      int v49 = v48 + v34;
      int v50 = v33[v49];
      int v51 = 0;
      int v52 = v34 + v51;
      int v53;
      v53 = v52;
      switch (v50) {
        case 0:
          {
          v53 = v34;
          break;
        }
        case 1:
          {
          int v54 = 0;
          int v55 = 0;
          int v56;
          int v57;
          v56 = v54;
          v57 = v55;
          while (true) {
            int v58 = 4;
            int v59 = v57 * v58;
            int v60 = v59 + v34;
            int v61 = 16;
            int v62 = v61 + v60;
            int v63 = v33[v62];
            int v64 = 0;
            bool v65 = v63 != v64;
            v56 = v56;
            v57 = v57;
            if (!v65) break;
            int v66 = v56 + v57;
            int v67 = 1;
            int v68 = v57 + v67;
            v56 = v66;
            v57 = v68;
          }
          bool v69 = true;
          v53 = v56;
          break;
        }
        default:
          {
          int v70 = 0;
          int v71 = 0;
          int v72;
          int v73;
          v72 = v70;
          v73 = v71;
          while (true) {
            int v74 = 4;
            int v75 = v73 * v74;
            int v76 = v75 + v34;
            int v77 = 36;
            int v78 = v77 + v76;
            int v79 = v33[v78];
            int v80 = 0;
            bool v81 = v79 != v80;
            v72 = v72;
            v73 = v73;
            if (!v81) break;
            int v82 = v72 + v73;
            int v83 = 1;
            int v84 = v73 + v83;
            v72 = v82;
            v73 = v84;
          }
          bool v85 = true;
          v53 = v72;
          break;
        }
        case 2:
          {
          int v86 = 56;
          int v87 = v86 + v34;
          int v88 = v33[v87];
          int v89 = 3;
          int v90;
          v90 = v89;
          switch (v88) {
            default:
              {
              v90 = v34;
              break;
            }
            case 0:
              {
              int v91 = 0;
              int v92 = v34 + v91;
              v90 = v92;
            }
            case 1:
              {
              int v93 = 3;
              v90 = v93;
            }
            case 2:
              {
              int v94 = 1;
              v90 = v94;
              break;
            }
          }
          bool v95 = true;
          v53 = v90;
          break;
        }
      }
      bool v96 = true;
      v47 = v53;
      break;
    }
    case 1:
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
        int v103 = v102 + v34;
        int v104 = 60;
        int v105 = v104 + v103;
        int v106 = v33[v105];
        int v107 = 0;
        bool v108 = v106 != v107;
        v99 = v99;
        v100 = v100;
        if (!v108) break;
        int v109 = 80;
        int v110 = v109 + v34;
        int v111 = v33[v110];
        int v112 = 2;
        int v113 = v34 + v112;
        int v114;
        v114 = v113;
        switch (v111) {
          case 0:
            {
            int v115 = 1;
            v114 = v115;
            break;
          }
          default:
            {
            v114 = v34;
            break;
          }
          case 1:
            {
            int v116 = 2;
            v114 = v116;
            break;
          }
          case 2:
            {
            int v117 = 1;
            v114 = v117;
            break;
          }
        }
        bool v118 = true;
        int v119 = v99 + v114;
        int v120 = 1;
        int v121 = v100 + v120;
        v99 = v119;
        v100 = v121;
        break;
        ;
      }
      bool v122 = true;
      v47 = v99;
      break;
    }
    default:
      {
      int v123 = 84;
      int v124 = v123 + v34;
      int v125 = v33[v124];
      int v126;
      v126 = v34;
      switch (v125) {
        default:
          {
          int v127 = 88;
          int v128 = v127 + v34;
          int v129 = v33[v128];
          int v130 = 0;
          bool v131 = v129 != v130;
          int v132;
          if (v131) {
            int v133 = 2;
            v132 = v133;
          } else {
            int v134 = 1;
            v132 = v134;
          }
          v126 = v132;
          break;
        }
        case 0:
          {
          int v135 = 0;
          int v136 = 0;
          int v137;
          int v138;
          v137 = v135;
          v138 = v136;
          while (true) {
            int v139 = 4;
            int v140 = v138 * v139;
            int v141 = v140 + v34;
            int v142 = 92;
            int v143 = v142 + v141;
            int v144 = v33[v143];
            int v145 = 0;
            bool v146 = v144 != v145;
            v137 = v137;
            v138 = v138;
            if (!v146) break;
            int v147 = v137 + v138;
            int v148 = 1;
            int v149 = v138 + v148;
            v137 = v147;
            v138 = v149;
          }
          bool v150 = true;
          v126 = v137;
          break;
        }
        case 1:
          {
          int v151 = 112;
          int v152 = v151 + v34;
          int v153 = v33[v152];
          int v154 = 2;
          int v155;
          v155 = v154;
          switch (v153) {
            case 0:
              {
              int v156 = 1;
              v155 = v156;
              break;
            }
            default:
              {
              int v157 = 0;
              v155 = v157;
              break;
            }
          }
          bool v158 = true;
          v126 = v155;
          break;
        }
        case 2:
          {
          int v159 = 116;
          int v160 = v159 + v34;
          int v161 = v33[v160];
          int v162 = 0;
          bool v163 = v161 != v162;
          int v164;
          if (v163) {
            v164 = v34;
          } else {
            v164 = v34;
          }
          v126 = v164;
          break;
        }
      }
      bool v165 = true;
      v47 = v126;
      break;
    }
  }
  bool v166 = true;
  int v167 = 16;
  int v168 = v167 + v34;
  bool v169 = true;
  int v170 = simt_wave_count_bits(v169);
  v32[v168] = v170;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
