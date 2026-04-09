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
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
  }
  int v22 = 3;
  int v23 = v3 % v22;
  uint v24 = simt_lane_id(__simt_tid);
  int v25 = (int)(v24);
  int v26;
  v26 = v25;
  switch (v23) {
    default:
      {
      int v27 = 1;
      int v28 = v0 + v27;
      v26 = v28;
    }
    case 0:
      {
      int v29 = 2;
      int v30 = v3 % v29;
      int v31;
      v31 = v0;
      switch (v30) {
        case 0:
          {
          int v32 = 0;
          int v33 = 0;
          int v34;
          int v35;
          v34 = v32;
          v35 = v33;
          while (true) {
            int v36 = 4;
            int v37 = v3 % v36;
            int v38 = 1;
            int v39 = v37 + v38;
            bool v40 = v35 < v39;
            v34 = v34;
            v35 = v35;
            if (!v40) break;
            int v41 = 4;
            int v42 = 1;
            int v43 = v35 + v42;
            v34 = v41;
            v35 = v43;
            continue;
            ;
          }
          v31 = v34;
          break;
        }
        default:
          {
          v31 = v0;
          break;
        }
      }
      v26 = v31;
      break;
    }
    case 1:
      {
      int v44 = 0;
      bool v45 = v2 != v44;
      int v46;
      if (v45) {
        int v47 = 0;
        int v48 = 0;
        int v49;
        int v50;
        v49 = v47;
        v50 = v48;
        while (true) {
          int v51 = 4;
          int v52 = v3 % v51;
          int v53 = 1;
          int v54 = v52 + v53;
          bool v55 = v50 < v54;
          v49 = v49;
          v50 = v50;
          if (!v55) break;
          int v56 = 0;
          int v57 = 1;
          int v58 = v50 + v57;
          v49 = v56;
          v50 = v58;
        }
        v46 = v49;
      } else {
        int v59 = 2;
        int v60 = v3 % v59;
        int v61 = 2;
        int v62;
        v62 = v61;
        switch (v60) {
          default:
            {
            int v63 = 1;
            v62 = v63;
            break;
          }
          case 0:
            {
            int v64 = 2;
            int v65 = v0 + v64;
            v62 = v65;
            break;
          }
        }
        int v66 = 2;
        v46 = v62;
      }
      v26 = v46;
    }
    case 2:
      {
      int v67 = 0;
      bool v68 = v2 != v67;
      int v69;
      if (v68) {
        int v70 = 0;
        bool v71 = v2 != v70;
        int v72;
        if (v71) {
          int v73 = 0;
          int v74 = v0 + v73;
          v72 = v74;
        } else {
          v72 = v0;
        }
        v69 = v72;
      } else {
        int v75 = 0;
        int v76 = 0;
        int v77;
        int v78;
        v77 = v75;
        v78 = v76;
        while (true) {
          int v79 = 4;
          int v80 = v3 % v79;
          int v81 = 1;
          int v82 = v80 + v81;
          bool v83 = v78 < v82;
          v77 = v77;
          v78 = v78;
          if (!v83) break;
          int v84 = 1;
          int v85 = v78 + v84;
          v77 = v0;
          v78 = v85;
          break;
          ;
        }
        v69 = v77;
      }
      v26 = v69;
      break;
    }
  }
  int v86 = 0;
  bool v87 = v2 != v86;
  int v88 = v87 ? v6 : v26;
  return;
}

kernel void kernel_main(device int* v89 [[buffer(0)]], device int* v90 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v91 = static_cast<int>(__simt_tid3.x);
  int v92 = 0;
  int v93 = v92 + v91;
  int v94 = v90[v93];
  int v95 = 4;
  int v96 = v95 + v91;
  int v97 = v90[v96];
  helper0(v91, v89, v94, v97, static_cast<int>(__simt_tid3.x));
  int v98 = 0;
  int v99 = 0;
  int v100;
  int v101;
  v100 = v98;
  v101 = v99;
  while (true) {
    int v102 = 4;
    int v103 = v101 * v102;
    int v104 = v103 + v91;
    int v105 = 8;
    int v106 = v105 + v104;
    int v107 = v90[v106];
    int v108 = 0;
    bool v109 = v107 != v108;
    v100 = v100;
    v101 = v101;
    if (!v109) break;
    int v110 = v100 + v101;
    int v111 = 1;
    int v112 = v101 + v111;
    bool v113 = true;
    int v114 = 16;
    int v115 = 4;
    int v116 = v101 * v115;
    int v117 = v114 + v116;
    int v118 = v117 + v91;
    bool v119 = true;
    int v120 = simt_wave_count_bits(v119);
    v89[v118] = v120;
    v100 = v110;
    v101 = v112;
  }
  int v121 = 28;
  int v122 = v121 + v91;
  int v123 = v90[v122];
  int v124 = 2;
  int v125 = v91 + v124;
  int v126;
  v126 = v125;
  switch (v123) {
    case 0:
      {
      int v127 = 32;
      int v128 = v127 + v91;
      int v129 = v90[v128];
      int v130 = 0;
      bool v131 = v129 != v130;
      int v132;
      if (v131) {
        int v133 = 36;
        int v134 = v133 + v91;
        int v135 = v90[v134];
        int v136;
        v136 = v91;
        switch (v135) {
          default:
            {
            v136 = v91;
            break;
          }
          case 0:
            {
            v136 = v91;
            break;
          }
        }
        v132 = v136;
      } else {
        int v137 = 40;
        int v138 = v137 + v91;
        int v139 = v90[v138];
        int v140 = 0;
        bool v141 = v139 != v140;
        int v142;
        if (v141) {
          int v143 = 2;
          int v144 = v91 + v143;
          v142 = v144;
        } else {
          int v145 = 3;
          v142 = v145;
        }
        v132 = v142;
      }
      v126 = v132;
      break;
    }
    default:
      {
      int v146 = 44;
      int v147 = v146 + v91;
      int v148 = v90[v147];
      int v149 = 0;
      bool v150 = v148 != v149;
      int v151;
      if (v150) {
        int v152 = 48;
        int v153 = v152 + v91;
        int v154 = v90[v153];
        int v155 = 0;
        bool v156 = v154 != v155;
        int v157;
        if (v156) {
          int v158 = 1;
          int v159 = v91 + v158;
          v157 = v159;
        } else {
          int v160 = 2;
          v157 = v160;
        }
        v151 = v157;
      } else {
        int v161 = 52;
        int v162 = v161 + v91;
        int v163 = v90[v162];
        int v164;
        v164 = v91;
        switch (v163) {
          default:
            {
            int v165 = 1;
            v164 = v165;
            break;
          }
          case 0:
            {
            int v166 = 4;
            v164 = v166;
            break;
          }
          case 1:
            {
            int v167 = 0;
            int v168 = v91 + v167;
            v164 = v168;
            break;
          }
        }
        v151 = v164;
      }
      v126 = v151;
      break;
    }
  }
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 32; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
