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
      int v18 = 1;
      int v19 = v12 + v18;
      v11 = v0;
      v12 = v19;
      break;
      ;
    }
    int v20 = 2;
    v8 = v11;
  } else {
    int v21 = 3;
    int v22 = v3 % v21;
    uint v23 = simt_subgroup_id(__simt_tid);
    int v24 = (int)(v23);
    int v25;
    v25 = v24;
    switch (v22) {
      default:
        {
        int v26 = 0;
        bool v27 = v2 != v26;
        int v28;
        if (v27) {
          v28 = v0;
        } else {
          int v29 = 3;
          int v30 = v0 + v29;
          v28 = v30;
        }
        int v31 = 3;
        int v32 = v0 + v31;
        v25 = v28;
      }
      case 0:
        {
        int v33 = 3;
        int v34 = v3 % v33;
        int v35 = 4;
        int v36 = v0 + v35;
        int v37;
        v37 = v36;
        switch (v34) {
          case 0:
            {
            int v38 = 3;
            int v39 = v0 + v38;
            v37 = v39;
            break;
          }
          default:
            {
            int v40 = 0;
            v37 = v40;
            break;
          }
          case 1:
            {
            int v41 = 1;
            v37 = v41;
            break;
          }
          case 2:
            {
            int v42 = 3;
            int v43 = v0 + v42;
            v37 = v43;
            break;
          }
        }
        int v44 = 1;
        v25 = v37;
      }
      case 1:
        {
        int v45 = 0;
        bool v46 = v2 != v45;
        int v47;
        if (v46) {
          int v48 = 2;
          int v49 = v0 + v48;
          v47 = v49;
        } else {
          int v50 = 3;
          v47 = v50;
        }
        v25 = v47;
      }
      case 2:
        {
        int v51 = 1;
        v25 = v51;
        break;
      }
    }
    uint v52 = simt_lane_id(__simt_tid);
    int v53 = (int)(v52);
    v8 = v25;
  }
  bool v54 = true;
  int v55 = simt_wave_count_bits(v54);
  int v56 = 0;
  int v57 = v56 + v0;
  v1[v57] = v55;
  int v58 = 0;
  bool v59 = v2 != v58;
  int v60 = v59 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v61 [[buffer(0)]], device int* v62 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v63 = static_cast<int>(__simt_tid3.x);
  int v64 = 0;
  int v65 = v64 + v63;
  int v66 = v62[v65];
  int v67 = 4;
  int v68 = v67 + v63;
  int v69 = v62[v68];
  helper0(v63, v61, v66, v69, static_cast<int>(__simt_tid3.x));
  int v70 = 8;
  int v71 = v70 + v63;
  int v72 = v62[v71];
  int v73;
  v73 = v63;
  switch (v72) {
    case 0:
      {
      int v74 = 0;
      int v75 = v63 + v74;
      v73 = v75;
      break;
    }
    default:
      {
      int v76 = 0;
      int v77 = 0;
      int v78;
      int v79;
      v78 = v76;
      v79 = v77;
      while (true) {
        int v80 = 4;
        int v81 = v79 * v80;
        int v82 = v81 + v63;
        int v83 = 12;
        int v84 = v83 + v82;
        int v85 = v62[v84];
        int v86 = 0;
        bool v87 = v85 != v86;
        v78 = v78;
        v79 = v79;
        if (!v87) break;
        int v88 = v78 + v79;
        int v89 = 1;
        int v90 = v79 + v89;
        v78 = v88;
        v79 = v90;
      }
      bool v91 = true;
      v73 = v78;
      break;
    }
    case 1:
      {
      int v92 = 32;
      int v93 = v92 + v63;
      int v94 = v62[v93];
      int v95;
      v95 = v63;
      switch (v94) {
        case 0:
          {
          int v96 = 2;
          v95 = v96;
          break;
        }
        default:
          {
          v95 = v63;
          break;
        }
        case 1:
          {
          int v97 = 36;
          int v98 = v97 + v63;
          int v99 = v62[v98];
          int v100 = 4;
          int v101;
          v101 = v100;
          switch (v99) {
            case 0:
              {
              v101 = v63;
              break;
            }
            case 1:
              {
              int v102 = 1;
              int v103 = v63 + v102;
              v101 = v103;
              break;
            }
            default:
              {
              int v104 = 4;
              int v105 = v63 + v104;
              v101 = v105;
              break;
            }
            case 2:
              {
              int v106 = 4;
              v101 = v106;
              break;
            }
          }
          bool v107 = true;
          v95 = v101;
          break;
        }
        case 2:
          {
          int v108 = 40;
          int v109 = v108 + v63;
          int v110 = v62[v109];
          int v111 = 2;
          int v112 = v63 + v111;
          int v113;
          v113 = v112;
          switch (v110) {
            case 0:
              {
              v113 = v63;
              break;
            }
            default:
              {
              int v114 = 2;
              v113 = v114;
              break;
            }
            case 1:
              {
              int v115 = 4;
              v113 = v115;
              break;
            }
          }
          bool v116 = true;
          v95 = v113;
          break;
        }
      }
      bool v117 = true;
      v73 = v95;
      break;
    }
  }
  bool v118 = true;
  int v119 = 16;
  int v120 = v119 + v63;
  bool v121 = true;
  int v122 = simt_wave_count_bits(v121);
  v61[v120] = v122;
  int v123 = 44;
  int v124 = v123 + v63;
  int v125 = v62[v124];
  int v126 = 0;
  bool v127 = v125 != v126;
  int v128;
  if (v127) {
    v128 = v63;
  } else {
    int v129 = 48;
    int v130 = v129 + v63;
    int v131 = v62[v130];
    int v132;
    v132 = v63;
    switch (v131) {
      default:
        {
        int v133 = 52;
        int v134 = v133 + v63;
        int v135 = v62[v134];
        int v136 = 3;
        int v137 = v63 + v136;
        int v138;
        v138 = v137;
        switch (v135) {
          case 0:
            {
            int v139 = 1;
            v138 = v139;
            break;
          }
          case 1:
            {
            int v140 = 1;
            int v141 = v63 + v140;
            v138 = v141;
            break;
          }
          default:
            {
            int v142 = 1;
            int v143 = v63 + v142;
            v138 = v143;
            break;
          }
          case 2:
            {
            v138 = v63;
            break;
          }
        }
        bool v144 = true;
        v132 = v138;
        break;
      }
      case 0:
        {
        int v145 = 56;
        int v146 = v145 + v63;
        int v147 = v62[v146];
        int v148 = 4;
        int v149;
        v149 = v148;
        switch (v147) {
          case 0:
            {
            int v150 = 4;
            v149 = v150;
            break;
          }
          default:
            {
            int v151 = 2;
            int v152 = v63 + v151;
            v149 = v152;
            break;
          }
        }
        bool v153 = true;
        v132 = v149;
        break;
      }
      case 1:
        {
        int v154 = 60;
        int v155 = v154 + v63;
        int v156 = v62[v155];
        int v157 = 0;
        bool v158 = v156 != v157;
        int v159;
        if (v158) {
          int v160 = 0;
          v159 = v160;
        } else {
          int v161 = 1;
          v159 = v161;
        }
        v132 = v159;
        break;
      }
    }
    bool v162 = true;
    v128 = v132;
  }
  int v163 = 32;
  int v164 = v163 + v63;
  bool v165 = true;
  int v166 = simt_wave_count_bits(v165);
  v61[v164] = v166;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
