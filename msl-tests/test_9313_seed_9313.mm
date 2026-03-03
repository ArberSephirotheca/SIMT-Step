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
    int v13 = 3;
    int v14 = v3 % v13;
    int v15 = 3;
    int v16;
    v16 = v15;
    switch (v14) {
      case 0:
        {
        int v17 = 0;
        int v18 = 0;
        int v19;
        int v20;
        v19 = v17;
        v20 = v18;
        while (true) {
          int v21 = 4;
          int v22 = v3 % v21;
          int v23 = 1;
          int v24 = v22 + v23;
          bool v25 = v20 < v24;
          v19 = v19;
          v20 = v20;
          if (!v25) break;
          int v26 = 1;
          int v27 = 1;
          int v28 = v20 + v27;
          v19 = v26;
          v20 = v28;
        }
        int v29 = 1;
        v16 = v19;
        break;
      }
      case 1:
        {
        v16 = v0;
        break;
      }
      default:
        {
        int v30 = 3;
        int v31 = v3 % v30;
        int v32;
        v32 = v0;
        switch (v31) {
          case 0:
            {
            v32 = v0;
            break;
          }
          case 1:
            {
            v32 = v0;
            break;
          }
          default:
            {
            int v33 = 3;
            v32 = v33;
            break;
          }
          case 2:
            {
            v32 = v0;
            break;
          }
        }
        v16 = v32;
        break;
      }
    }
    int v34 = 0;
    int v35 = v0 + v34;
    int v36 = 1;
    int v37 = v7 + v36;
    v6 = v16;
    v7 = v37;
  }
  bool v38 = true;
  int v39 = simt_wave_count_bits(v38);
  int v40 = 0;
  int v41 = v40 + v0;
  v1[v41] = v39;
  return;
}

kernel void kernel_main(device int* v42 [[buffer(0)]], device int* v43 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v44 = static_cast<int>(__simt_tid3.x);
  int v45 = 0;
  int v46 = v45 + v44;
  int v47 = v43[v46];
  int v48 = 4;
  int v49 = v48 + v44;
  int v50 = v43[v49];
  helper0(v44, v42, v47, v50, static_cast<int>(__simt_tid3.x));
  int v51 = 0;
  int v52 = 0;
  int v53;
  int v54;
  v53 = v51;
  v54 = v52;
  while (true) {
    int v55 = 4;
    int v56 = v54 * v55;
    int v57 = v56 + v44;
    int v58 = 8;
    int v59 = v58 + v57;
    int v60 = v43[v59];
    int v61 = 0;
    bool v62 = v60 != v61;
    v53 = v53;
    v54 = v54;
    if (!v62) break;
    int v63 = 28;
    int v64 = v63 + v44;
    int v65 = v43[v64];
    int v66 = 0;
    bool v67 = v65 != v66;
    int v68;
    if (v67) {
      int v69 = 32;
      int v70 = v69 + v44;
      int v71 = v43[v70];
      int v72;
      v72 = v44;
      switch (v71) {
        case 0:
          {
          int v73 = 4;
          int v74 = v44 + v73;
          v72 = v74;
          break;
        }
        default:
          {
          v72 = v44;
          break;
        }
      }
      bool v75 = true;
      v68 = v72;
    } else {
      int v76 = 3;
      v68 = v76;
    }
    int v77 = v53 + v68;
    int v78 = 1;
    int v79 = v54 + v78;
    v53 = v77;
    v54 = v79;
  }
  bool v80 = true;
  int v81 = 16;
  int v82 = v81 + v44;
  bool v83 = true;
  int v84 = simt_wave_count_bits(v83);
  v42[v82] = v84;
  int v85 = 36;
  int v86 = v85 + v44;
  int v87 = v43[v86];
  int v88;
  v88 = v44;
  switch (v87) {
    case 0:
      {
      int v89 = 0;
      int v90 = 0;
      int v91;
      int v92;
      v91 = v89;
      v92 = v90;
      while (true) {
        int v93 = 4;
        int v94 = v92 * v93;
        int v95 = v94 + v44;
        int v96 = 40;
        int v97 = v96 + v95;
        int v98 = v43[v97];
        int v99 = 0;
        bool v100 = v98 != v99;
        v91 = v91;
        v92 = v92;
        if (!v100) break;
        int v101 = v91 + v92;
        int v102 = 1;
        int v103 = v92 + v102;
        v91 = v101;
        v92 = v103;
      }
      bool v104 = true;
      v88 = v91;
      break;
    }
    case 1:
      {
      int v105 = 60;
      int v106 = v105 + v44;
      int v107 = v43[v106];
      int v108 = 0;
      bool v109 = v107 != v108;
      int v110;
      if (v109) {
        int v111 = 0;
        int v112 = 0;
        int v113;
        int v114;
        v113 = v111;
        v114 = v112;
        while (true) {
          int v115 = 4;
          int v116 = v114 * v115;
          int v117 = v116 + v44;
          int v118 = 64;
          int v119 = v118 + v117;
          int v120 = v43[v119];
          int v121 = 0;
          bool v122 = v120 != v121;
          v113 = v113;
          v114 = v114;
          if (!v122) break;
          int v123 = v113 + v114;
          int v124 = 1;
          int v125 = v114 + v124;
          v113 = v123;
          v114 = v125;
        }
        bool v126 = true;
        v110 = v113;
      } else {
        int v127 = 84;
        int v128 = v127 + v44;
        int v129 = v43[v128];
        int v130 = 0;
        int v131 = v44 + v130;
        int v132;
        v132 = v131;
        switch (v129) {
          case 0:
            {
            v132 = v44;
            break;
          }
          default:
            {
            int v133 = 3;
            v132 = v133;
            break;
          }
          case 1:
            {
            int v134 = 3;
            int v135 = v44 + v134;
            v132 = v135;
            break;
          }
        }
        bool v136 = true;
        v110 = v132;
      }
      v88 = v110;
    }
    default:
      {
      int v137 = 2;
      v88 = v137;
    }
    case 2:
      {
      int v138 = 0;
      int v139 = 0;
      int v140;
      int v141;
      v140 = v138;
      v141 = v139;
      while (true) {
        int v142 = 4;
        int v143 = v141 * v142;
        int v144 = v143 + v44;
        int v145 = 88;
        int v146 = v145 + v144;
        int v147 = v43[v146];
        int v148 = 0;
        bool v149 = v147 != v148;
        v140 = v140;
        v141 = v141;
        if (!v149) break;
        int v150 = 0;
        int v151 = 0;
        int v152;
        int v153;
        v152 = v150;
        v153 = v151;
        while (true) {
          int v154 = 4;
          int v155 = v153 * v154;
          int v156 = v155 + v44;
          int v157 = 108;
          int v158 = v157 + v156;
          int v159 = v43[v158];
          int v160 = 0;
          bool v161 = v159 != v160;
          v152 = v152;
          v153 = v153;
          if (!v161) break;
          int v162 = v152 + v153;
          int v163 = 1;
          int v164 = v153 + v163;
          v152 = v162;
          v153 = v164;
        }
        bool v165 = true;
        int v166 = v140 + v152;
        int v167 = 1;
        int v168 = v141 + v167;
        v140 = v166;
        v141 = v168;
        break;
        ;
      }
      bool v169 = true;
      v88 = v140;
      break;
    }
  }
  bool v170 = true;
  int v171 = 32;
  int v172 = v171 + v44;
  bool v173 = true;
  int v174 = simt_wave_count_bits(v173);
  v42[v172] = v174;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
