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
    int v8 = v3 % v7;
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      default:
        {
        int v12 = 4;
        int v13 = v0 + v12;
        int v14;
        v14 = v13;
        switch (v3) {
          case 0:
            {
            int v15 = 0;
            v14 = v15;
          }
          default:
            {
            int v16 = 0;
            int v17 = v0 + v16;
            v14 = v17;
            break;
          }
        }
        v11 = v14;
        break;
      }
      case 0:
        {
        int v18 = 0;
        bool v19 = v2 != v18;
        int v20;
        if (v19) {
          v20 = v0;
        } else {
          int v21 = 1;
          int v22 = v0 + v21;
          v20 = v22;
        }
        int v23 = 3;
        int v24 = v0 + v23;
        v11 = v20;
        break;
      }
      case 1:
        {
        int v25 = 0;
        int v26 = 0;
        int v27;
        int v28;
        v27 = v25;
        v28 = v26;
        while (true) {
          int v29 = 4;
          int v30 = v3 % v29;
          int v31 = 1;
          int v32 = v30 + v31;
          bool v33 = v28 < v32;
          v27 = v27;
          v28 = v28;
          if (!v33) break;
          int v34 = 0;
          int v35 = 1;
          int v36 = v28 + v35;
          v27 = v34;
          v28 = v36;
        }
        int v37 = 4;
        v11 = v27;
        break;
      }
    }
    uint v38 = simt_subgroup_id(__simt_tid);
    int v39 = (int)(v38);
    v6 = v11;
  } else {
    int v40 = 3;
    int v41 = v3 % v40;
    uint v42 = simt_subgroup_id(__simt_tid);
    int v43 = (int)(v42);
    int v44;
    v44 = v43;
    switch (v41) {
      default:
        {
        int v45 = 0;
        bool v46 = v2 != v45;
        int v47;
        if (v46) {
          int v48 = 0;
          int v49 = v0 + v48;
          v47 = v49;
        } else {
          v47 = v0;
        }
        int v50 = 2;
        v44 = v47;
        break;
      }
      case 0:
        {
        int v51 = 3;
        int v52 = v3 % v51;
        int v53;
        v53 = v0;
        switch (v52) {
          default:
            {
            v53 = v0;
            break;
          }
          case 0:
            {
            int v54 = 0;
            v53 = v54;
            break;
          }
          case 1:
            {
            int v55 = 4;
            v53 = v55;
            break;
          }
        }
        v44 = v53;
        break;
      }
      case 1:
        {
        int v56 = 0;
        v44 = v56;
        break;
      }
      case 2:
        {
        v44 = v0;
        break;
      }
    }
    uint v57 = simt_subgroup_id(__simt_tid);
    int v58 = (int)(v57);
    v6 = v44;
  }
  bool v59 = true;
  int v60 = simt_wave_count_bits(v59);
  int v61 = 0;
  int v62 = v61 + v0;
  v1[v62] = v60;
  return;
}

kernel void kernel_main(device int* v63 [[buffer(0)]], device int* v64 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v65 = static_cast<int>(__simt_tid3.x);
  int v66 = 0;
  int v67 = v66 + v65;
  int v68 = v64[v67];
  int v69 = 4;
  int v70 = v69 + v65;
  int v71 = v64[v70];
  helper0(v65, v63, v68, v71, static_cast<int>(__simt_tid3.x));
  int v72 = 8;
  int v73 = v72 + v65;
  int v74 = v64[v73];
  int v75 = 0;
  bool v76 = v74 != v75;
  int v77;
  if (v76) {
    int v78 = 0;
    int v79 = v65 + v78;
    v77 = v79;
  } else {
    int v80 = 1;
    int v81 = v65 + v80;
    v77 = v81;
  }
  int v82 = 16;
  int v83 = v82 + v65;
  bool v84 = true;
  int v85 = simt_wave_count_bits(v84);
  v63[v83] = v85;
  int v86 = 12;
  int v87 = v86 + v65;
  int v88 = v64[v87];
  int v89 = 0;
  int v90 = v65 + v89;
  int v91;
  v91 = v90;
  switch (v88) {
    case 0:
      {
      int v92 = 16;
      int v93 = v92 + v65;
      int v94 = v64[v93];
      int v95 = 0;
      bool v96 = v94 != v95;
      int v97;
      if (v96) {
        int v98 = 0;
        int v99 = 0;
        int v100;
        int v101;
        v100 = v98;
        v101 = v99;
        while (true) {
          int v102 = 4;
          int v103 = v101 * v102;
          int v104 = v103 + v65;
          int v105 = 20;
          int v106 = v105 + v104;
          int v107 = v64[v106];
          int v108 = 0;
          bool v109 = v107 != v108;
          v100 = v100;
          v101 = v101;
          if (!v109) break;
          int v110 = v100 + v101;
          int v111 = 1;
          int v112 = v101 + v111;
          v100 = v110;
          v101 = v112;
        }
        bool v113 = true;
        v97 = v100;
      } else {
        int v114 = 1;
        v97 = v114;
      }
      v91 = v97;
      break;
    }
    case 1:
      {
      v91 = v65;
      break;
    }
    default:
      {
      int v115 = 40;
      int v116 = v115 + v65;
      int v117 = v64[v116];
      int v118 = 0;
      bool v119 = v117 != v118;
      int v120;
      if (v119) {
        int v121 = 44;
        int v122 = v121 + v65;
        int v123 = v64[v122];
        int v124 = 4;
        int v125;
        v125 = v124;
        switch (v123) {
          default:
            {
            v125 = v65;
            break;
          }
          case 0:
            {
            int v126 = 2;
            int v127 = v65 + v126;
            v125 = v127;
            break;
          }
        }
        bool v128 = true;
        v120 = v125;
      } else {
        int v129 = 48;
        int v130 = v129 + v65;
        int v131 = v64[v130];
        int v132 = 0;
        bool v133 = v131 != v132;
        int v134;
        if (v133) {
          int v135 = 2;
          int v136 = v65 + v135;
          v134 = v136;
        } else {
          int v137 = 0;
          int v138 = v65 + v137;
          v134 = v138;
        }
        v120 = v134;
      }
      v91 = v120;
      break;
    }
    case 2:
      {
      int v139 = 52;
      int v140 = v139 + v65;
      int v141 = v64[v140];
      int v142 = 3;
      int v143;
      v143 = v142;
      switch (v141) {
        case 0:
          {
          int v144 = 56;
          int v145 = v144 + v65;
          int v146 = v64[v145];
          int v147 = 2;
          int v148 = v65 + v147;
          int v149;
          v149 = v148;
          switch (v146) {
            case 0:
              {
              v149 = v65;
              break;
            }
            default:
              {
              int v150 = 2;
              v149 = v150;
              break;
            }
            case 1:
              {
              int v151 = 4;
              v149 = v151;
              break;
            }
            case 2:
              {
              v149 = v65;
              break;
            }
          }
          bool v152 = true;
          v143 = v149;
          break;
        }
        case 1:
          {
          int v153 = 60;
          int v154 = v153 + v65;
          int v155 = v64[v154];
          int v156 = 0;
          bool v157 = v155 != v156;
          int v158;
          if (v157) {
            int v159 = 1;
            int v160 = v65 + v159;
            v158 = v160;
          } else {
            int v161 = 4;
            int v162 = v65 + v161;
            v158 = v162;
          }
          v143 = v158;
          break;
        }
        default:
          {
          int v163 = 3;
          v143 = v163;
          break;
        }
      }
      bool v164 = true;
      v91 = v143;
      break;
    }
  }
  bool v165 = true;
  int v166 = 32;
  int v167 = v166 + v65;
  bool v168 = true;
  int v169 = simt_wave_count_bits(v168);
  v63[v167] = v169;
  int v170 = 1;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
