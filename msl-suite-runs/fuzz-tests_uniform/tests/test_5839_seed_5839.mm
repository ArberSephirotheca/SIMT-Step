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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    v8 = v0;
  } else {
    int v9 = 4;
    int v10;
    v10 = v9;
    switch (v3) {
      case 0:
        {
        int v11 = 0;
        bool v12 = v2 != v11;
        int v13;
        if (v12) {
          int v14 = 1;
          int v15 = v0 + v14;
          v13 = v15;
        } else {
          int v16 = 1;
          int v17 = v0 + v16;
          v13 = v17;
        }
        int v18 = 0;
        v10 = v13;
        break;
      }
      default:
        {
        int v19 = 3;
        int v20 = v3 % v19;
        int v21 = 2;
        int v22;
        v22 = v21;
        switch (v20) {
          default:
            {
            int v23 = 4;
            v22 = v23;
            break;
          }
          case 0:
            {
            int v24 = 1;
            int v25 = v0 + v24;
            v22 = v25;
          }
          case 1:
            {
            int v26 = 4;
            int v27 = v0 + v26;
            v22 = v27;
            break;
          }
          case 2:
            {
            int v28 = 0;
            v22 = v28;
            break;
          }
        }
        v10 = v22;
        break;
      }
    }
    uint v29 = simt_lane_id(__simt_tid);
    int v30 = (int)(v29);
    v8 = v10;
  }
  bool v31 = true;
  int v32 = simt_wave_count_bits(v31);
  int v33 = 0;
  int v34 = v33 + v0;
  v1[v34] = v32;
  int v35 = 0;
  bool v36 = v2 != v35;
  int v37 = v36 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v38 [[buffer(0)]], device int* v39 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v40 = static_cast<int>(__simt_tid3.x);
  int v41 = 0;
  int v42 = v41 + v40;
  int v43 = v39[v42];
  int v44 = 4;
  int v45 = v44 + v40;
  int v46 = v39[v45];
  helper0(v40, v38, v43, v46, static_cast<int>(__simt_tid3.x));
  int v47 = 0;
  int v48 = 0;
  int v49;
  int v50;
  v49 = v47;
  v50 = v48;
  while (true) {
    int v51 = 4;
    int v52 = v50 * v51;
    int v53 = v52 + v40;
    int v54 = 8;
    int v55 = v54 + v53;
    int v56 = v39[v55];
    int v57 = 0;
    bool v58 = v56 != v57;
    v49 = v49;
    v50 = v50;
    if (!v58) break;
    int v59 = v49 + v50;
    int v60 = 1;
    int v61 = v50 + v60;
    v49 = v59;
    v50 = v61;
    continue;
    ;
  }
  bool v62 = true;
  int v63 = 16;
  int v64 = v63 + v40;
  bool v65 = true;
  int v66 = simt_wave_count_bits(v65);
  v38[v64] = v66;
  int v67 = 28;
  int v68 = v67 + v40;
  int v69 = v39[v68];
  int v70 = 3;
  int v71 = v40 + v70;
  int v72;
  v72 = v71;
  switch (v69) {
    case 0:
      {
      int v73 = 4;
      int v74 = v40 + v73;
      v72 = v74;
    }
    default:
      {
      int v75 = 32;
      int v76 = v75 + v40;
      int v77 = v39[v76];
      int v78 = 0;
      int v79;
      v79 = v78;
      switch (v77) {
        default:
          {
          int v80 = 0;
          int v81 = 0;
          int v82;
          int v83;
          v82 = v80;
          v83 = v81;
          while (true) {
            int v84 = 4;
            int v85 = v83 * v84;
            int v86 = v85 + v40;
            int v87 = 36;
            int v88 = v87 + v86;
            int v89 = v39[v88];
            int v90 = 0;
            bool v91 = v89 != v90;
            v82 = v82;
            v83 = v83;
            if (!v91) break;
            int v92 = v82 + v83;
            int v93 = 1;
            int v94 = v83 + v93;
            v82 = v92;
            v83 = v94;
          }
          bool v95 = true;
          v79 = v82;
          break;
        }
        case 0:
          {
          v79 = v40;
        }
        case 1:
          {
          int v96 = 56;
          int v97 = v96 + v40;
          int v98 = v39[v97];
          int v99 = 0;
          bool v100 = v98 != v99;
          int v101;
          if (v100) {
            int v102 = 4;
            v101 = v102;
          } else {
            int v103 = 2;
            v101 = v103;
          }
          v79 = v101;
        }
        case 2:
          {
          v79 = v40;
          break;
        }
      }
      bool v104 = true;
      v72 = v79;
    }
    case 1:
      {
      int v105 = 60;
      int v106 = v105 + v40;
      int v107 = v39[v106];
      int v108 = 0;
      bool v109 = v107 != v108;
      int v110;
      if (v109) {
        int v111 = 64;
        int v112 = v111 + v40;
        int v113 = v39[v112];
        int v114;
        v114 = v40;
        switch (v113) {
          case 0:
            {
            v114 = v40;
            break;
          }
          case 1:
            {
            v114 = v40;
            break;
          }
          default:
            {
            int v115 = 3;
            int v116 = v40 + v115;
            v114 = v116;
            break;
          }
          case 2:
            {
            int v117 = 0;
            v114 = v117;
            break;
          }
        }
        bool v118 = true;
        v110 = v114;
      } else {
        int v119 = 68;
        int v120 = v119 + v40;
        int v121 = v39[v120];
        int v122 = 0;
        bool v123 = v121 != v122;
        int v124;
        if (v123) {
          int v125 = 1;
          v124 = v125;
        } else {
          int v126 = 3;
          v124 = v126;
        }
        v110 = v124;
      }
      v72 = v110;
    }
    case 2:
      {
      int v127 = 72;
      int v128 = v127 + v40;
      int v129 = v39[v128];
      int v130 = 2;
      int v131 = v40 + v130;
      int v132;
      v132 = v131;
      switch (v129) {
        default:
          {
          v132 = v40;
          break;
        }
        case 0:
          {
          int v133 = 76;
          int v134 = v133 + v40;
          int v135 = v39[v134];
          int v136 = 0;
          bool v137 = v135 != v136;
          int v138;
          if (v137) {
            v138 = v40;
          } else {
            int v139 = 0;
            int v140 = v40 + v139;
            v138 = v140;
          }
          v132 = v138;
          break;
        }
        case 1:
          {
          int v141 = 0;
          int v142 = 0;
          int v143;
          int v144;
          v143 = v141;
          v144 = v142;
          while (true) {
            int v145 = 4;
            int v146 = v144 * v145;
            int v147 = v146 + v40;
            int v148 = 80;
            int v149 = v148 + v147;
            int v150 = v39[v149];
            int v151 = 0;
            bool v152 = v150 != v151;
            v143 = v143;
            v144 = v144;
            if (!v152) break;
            int v153 = v143 + v144;
            int v154 = 1;
            int v155 = v144 + v154;
            v143 = v153;
            v144 = v155;
          }
          bool v156 = true;
          v132 = v143;
          break;
        }
        case 2:
          {
          int v157 = 100;
          int v158 = v157 + v40;
          int v159 = v39[v158];
          int v160;
          v160 = v40;
          switch (v159) {
            default:
              {
              int v161 = 0;
              v160 = v161;
              break;
            }
            case 0:
              {
              v160 = v40;
              break;
            }
            case 1:
              {
              int v162 = 0;
              v160 = v162;
              break;
            }
          }
          bool v163 = true;
          v132 = v160;
          break;
        }
      }
      bool v164 = true;
      v72 = v132;
      break;
    }
  }
  bool v165 = true;
  int v166 = 32;
  int v167 = v166 + v40;
  bool v168 = true;
  int v169 = simt_wave_count_bits(v168);
  v38[v167] = v169;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
