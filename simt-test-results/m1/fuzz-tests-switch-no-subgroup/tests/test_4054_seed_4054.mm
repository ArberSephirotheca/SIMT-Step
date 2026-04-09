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
    default:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 3;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        case 0:
          {
          int v14 = 0;
          bool v15 = v2 != v14;
          int v16;
          if (v15) {
            int v17 = 1;
            int v18 = v0 + v17;
            v16 = v18;
          } else {
            int v19 = 2;
            int v20 = v0 + v19;
            v16 = v20;
          }
          v13 = v16;
          break;
        }
        default:
          {
          int v21 = 0;
          int v22 = 0;
          int v23;
          int v24;
          v23 = v21;
          v24 = v22;
          while (true) {
            int v25 = 4;
            int v26 = v3 % v25;
            int v27 = 1;
            int v28 = v26 + v27;
            bool v29 = v24 < v28;
            v23 = v23;
            v24 = v24;
            if (!v29) break;
            int v30 = 4;
            int v31 = v0 + v30;
            int v32 = 1;
            int v33 = v24 + v32;
            v23 = v31;
            v24 = v33;
            continue;
            ;
          }
          v13 = v23;
          break;
        }
        case 1:
          {
          int v34 = 0;
          bool v35 = v2 != v34;
          int v36;
          if (v35) {
            int v37 = 1;
            v36 = v37;
          } else {
            int v38 = 2;
            int v39 = v0 + v38;
            v36 = v39;
          }
          v13 = v36;
          break;
        }
      }
      v8 = v13;
      break;
    }
    case 0:
      {
      int v40 = 2;
      int v41 = v3 % v40;
      int v42 = 1;
      int v43 = v0 + v42;
      int v44;
      v44 = v43;
      switch (v41) {
        case 0:
          {
          int v45 = 0;
          int v46 = 0;
          int v47;
          int v48;
          v47 = v45;
          v48 = v46;
          while (true) {
            int v49 = 4;
            int v50 = v3 % v49;
            int v51 = 1;
            int v52 = v50 + v51;
            bool v53 = v48 < v52;
            v47 = v47;
            v48 = v48;
            if (!v53) break;
            int v54 = 3;
            int v55 = v0 + v54;
            int v56 = 1;
            int v57 = v48 + v56;
            v47 = v55;
            v48 = v57;
          }
          v44 = v47;
          break;
        }
        case 1:
          {
          int v58 = 1;
          int v59;
          v59 = v58;
          switch (v3) {
            default:
              {
              int v60 = 4;
              v59 = v60;
              break;
            }
            case 0:
              {
              v59 = v0;
              break;
            }
          }
          v44 = v59;
          break;
        }
        default:
          {
          int v61 = 0;
          bool v62 = v2 != v61;
          int v63;
          if (v62) {
            int v64 = 2;
            v63 = v64;
          } else {
            int v65 = 0;
            int v66 = v0 + v65;
            v63 = v66;
          }
          v44 = v63;
          break;
        }
      }
      v8 = v44;
      break;
    }
    case 1:
      {
      int v67 = 0;
      bool v68 = v2 != v67;
      int v69;
      if (v68) {
        int v70;
        v70 = v0;
        switch (v3) {
          case 0:
            {
            v70 = v0;
            break;
          }
          default:
            {
            v70 = v0;
            break;
          }
        }
        int v71 = 2;
        v69 = v70;
      } else {
        int v72 = 3;
        int v73 = v3 % v72;
        int v74;
        v74 = v0;
        switch (v73) {
          default:
            {
            int v75 = 4;
            int v76 = v0 + v75;
            v74 = v76;
            break;
          }
          case 0:
            {
            v74 = v0;
            break;
          }
          case 1:
            {
            int v77 = 3;
            int v78 = v0 + v77;
            v74 = v78;
            break;
          }
        }
        int v79 = 1;
        v69 = v74;
      }
      v8 = v69;
      break;
    }
  }
  bool v80 = true;
  int v81 = simt_wave_count_bits(v80);
  int v82 = 0;
  int v83 = v82 + v0;
  v1[v83] = v81;
  return;
}

kernel void kernel_main(device int* v84 [[buffer(0)]], device int* v85 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v86 = static_cast<int>(__simt_tid3.x);
  int v87 = 0;
  int v88 = v87 + v86;
  int v89 = v85[v88];
  int v90 = 4;
  int v91 = v90 + v86;
  int v92 = v85[v91];
  helper0(v86, v84, v89, v92, static_cast<int>(__simt_tid3.x));
  int v93 = 8;
  int v94 = v93 + v86;
  int v95 = v85[v94];
  int v96 = 0;
  bool v97 = v95 != v96;
  int v98;
  if (v97) {
    int v99 = 12;
    int v100 = v99 + v86;
    int v101 = v85[v100];
    int v102 = 1;
    int v103 = v86 + v102;
    int v104;
    v104 = v103;
    switch (v101) {
      case 0:
        {
        int v105 = 16;
        int v106 = v105 + v86;
        int v107 = v85[v106];
        int v108 = 0;
        int v109 = v86 + v108;
        int v110;
        v110 = v109;
        switch (v107) {
          case 0:
            {
            v110 = v86;
            break;
          }
          case 1:
            {
            int v111 = 3;
            int v112 = v86 + v111;
            v110 = v112;
            break;
          }
          default:
            {
            int v113 = 4;
            int v114 = v86 + v113;
            v110 = v114;
            break;
          }
          case 2:
            {
            int v115 = 3;
            int v116 = v86 + v115;
            v110 = v116;
            break;
          }
        }
        v104 = v110;
        break;
      }
      default:
        {
        int v117 = 20;
        int v118 = v117 + v86;
        int v119 = v85[v118];
        int v120 = 1;
        int v121 = v86 + v120;
        int v122;
        v122 = v121;
        switch (v119) {
          case 0:
            {
            v122 = v86;
          }
          default:
            {
            int v123 = 0;
            v122 = v123;
            break;
          }
        }
        v104 = v122;
        break;
      }
      case 1:
        {
        int v124 = 24;
        int v125 = v124 + v86;
        int v126 = v85[v125];
        int v127 = 3;
        int v128 = v86 + v127;
        int v129;
        v129 = v128;
        switch (v126) {
          default:
            {
            int v130 = 1;
            v129 = v130;
            break;
          }
          case 0:
            {
            int v131 = 2;
            int v132 = v86 + v131;
            v129 = v132;
            break;
          }
          case 1:
            {
            int v133 = 4;
            v129 = v133;
            break;
          }
        }
        bool v134 = true;
        v104 = v129;
        break;
      }
      case 2:
        {
        int v135 = 28;
        int v136 = v135 + v86;
        int v137 = v85[v136];
        int v138 = 0;
        bool v139 = v137 != v138;
        int v140;
        if (v139) {
          int v141 = 3;
          int v142 = v86 + v141;
          v140 = v142;
        } else {
          int v143 = 3;
          v140 = v143;
        }
        v104 = v140;
        break;
      }
    }
    v98 = v104;
  } else {
    int v144 = 32;
    int v145 = v144 + v86;
    int v146 = v85[v145];
    int v147;
    v147 = v86;
    switch (v146) {
      default:
        {
        int v148 = 36;
        int v149 = v148 + v86;
        int v150 = v85[v149];
        int v151;
        v151 = v86;
        switch (v150) {
          case 0:
            {
            int v152 = 3;
            v151 = v152;
          }
          default:
            {
            int v153 = 0;
            int v154 = v86 + v153;
            v151 = v154;
            break;
          }
        }
        v147 = v151;
      }
      case 0:
        {
        int v155 = 40;
        int v156 = v155 + v86;
        int v157 = v85[v156];
        int v158 = 0;
        bool v159 = v157 != v158;
        int v160;
        if (v159) {
          int v161 = 0;
          v160 = v161;
        } else {
          v160 = v86;
        }
        v147 = v160;
        break;
      }
    }
    v98 = v147;
  }
  int v162 = 16;
  int v163 = v162 + v86;
  bool v164 = true;
  int v165 = simt_wave_count_bits(v164);
  v84[v163] = v165;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 44; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
