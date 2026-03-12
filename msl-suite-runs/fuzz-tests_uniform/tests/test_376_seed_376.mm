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
      int v23 = 0;
      int v24;
      int v25;
      v24 = v22;
      v25 = v23;
      while (true) {
        int v26 = 4;
        int v27 = v3 % v26;
        int v28 = 1;
        int v29 = v27 + v28;
        bool v30 = v25 < v29;
        v24 = v24;
        v25 = v25;
        if (!v30) break;
        int v31 = 1;
        int v32 = v25 + v31;
        v24 = v0;
        v25 = v32;
      }
      int v33 = 4;
      int v34 = v0 + v33;
      int v35 = 1;
      int v36 = v16 + v35;
      v15 = v24;
      v16 = v36;
    }
    uint v37 = simt_lane_id(__simt_tid);
    int v38 = (int)(v37);
    int v39 = 1;
    int v40 = v7 + v39;
    v6 = v15;
    v7 = v40;
  }
  bool v41 = true;
  int v42 = simt_wave_count_bits(v41);
  int v43 = 0;
  int v44 = v43 + v0;
  v1[v44] = v42;
  return;
}

kernel void kernel_main(device int* v45 [[buffer(0)]], device int* v46 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v47 = static_cast<int>(__simt_tid3.x);
  int v48 = 0;
  int v49 = v48 + v47;
  int v50 = v46[v49];
  int v51 = 4;
  int v52 = v51 + v47;
  int v53 = v46[v52];
  helper0(v47, v45, v50, v53, static_cast<int>(__simt_tid3.x));
  uint v54 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v55 = (int)(v54);
  int v56 = 8;
  int v57 = v56 + v47;
  int v58 = v46[v57];
  uint v59 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v60 = (int)(v59);
  int v61;
  v61 = v60;
  switch (v58) {
    case 0:
      {
      int v62 = 12;
      int v63 = v62 + v47;
      int v64 = v46[v63];
      int v65;
      v65 = v47;
      switch (v64) {
        case 0:
          {
          int v66 = 3;
          v65 = v66;
          break;
        }
        default:
          {
          int v67 = 16;
          int v68 = v67 + v47;
          int v69 = v46[v68];
          int v70 = 0;
          bool v71 = v69 != v70;
          int v72;
          if (v71) {
            int v73 = 3;
            v72 = v73;
          } else {
            v72 = v47;
          }
          v65 = v72;
          break;
        }
      }
      bool v74 = true;
      v61 = v65;
      break;
    }
    default:
      {
      int v75 = 20;
      int v76 = v75 + v47;
      int v77 = v46[v76];
      int v78 = 0;
      bool v79 = v77 != v78;
      int v80;
      if (v79) {
        int v81 = 24;
        int v82 = v81 + v47;
        int v83 = v46[v82];
        int v84 = 1;
        int v85;
        v85 = v84;
        switch (v83) {
          case 0:
            {
            int v86 = 2;
            int v87 = v47 + v86;
            v85 = v87;
            break;
          }
          case 1:
            {
            v85 = v47;
            break;
          }
          case 2:
            {
            int v88 = 0;
            int v89 = v47 + v88;
            v85 = v89;
          }
          default:
            {
            int v90 = 3;
            v85 = v90;
            break;
          }
        }
        bool v91 = true;
        v80 = v85;
      } else {
        int v92 = 28;
        int v93 = v92 + v47;
        int v94 = v46[v93];
        int v95 = 0;
        int v96;
        v96 = v95;
        switch (v94) {
          default:
            {
            int v97 = 4;
            v96 = v97;
          }
          case 0:
            {
            int v98 = 3;
            int v99 = v47 + v98;
            v96 = v99;
            break;
          }
        }
        bool v100 = true;
        v80 = v96;
      }
      v61 = v80;
      break;
    }
    case 1:
      {
      int v101 = 0;
      int v102 = 0;
      int v103;
      int v104;
      v103 = v101;
      v104 = v102;
      while (true) {
        int v105 = 4;
        int v106 = v104 * v105;
        int v107 = v106 + v47;
        int v108 = 32;
        int v109 = v108 + v107;
        int v110 = v46[v109];
        int v111 = 0;
        bool v112 = v110 != v111;
        v103 = v103;
        v104 = v104;
        if (!v112) break;
        int v113 = v103 + v104;
        int v114 = 1;
        int v115 = v104 + v114;
        v103 = v113;
        v104 = v115;
        continue;
        ;
      }
      bool v116 = true;
      v61 = v103;
      break;
    }
  }
  bool v117 = true;
  int v118 = 16;
  int v119 = v118 + v47;
  bool v120 = true;
  int v121 = simt_wave_count_bits(v120);
  v45[v119] = v121;
  int v122 = 52;
  int v123 = v122 + v47;
  int v124 = v46[v123];
  int v125 = 2;
  int v126;
  v126 = v125;
  switch (v124) {
    case 0:
      {
      int v127 = 56;
      int v128 = v127 + v47;
      int v129 = v46[v128];
      int v130 = 0;
      bool v131 = v129 != v130;
      int v132;
      if (v131) {
        int v133 = 60;
        int v134 = v133 + v47;
        int v135 = v46[v134];
        int v136 = 0;
        bool v137 = v135 != v136;
        int v138;
        if (v137) {
          int v139 = 4;
          int v140 = v47 + v139;
          v138 = v140;
        } else {
          v138 = v47;
        }
        v132 = v138;
      } else {
        int v141 = 64;
        int v142 = v141 + v47;
        int v143 = v46[v142];
        int v144 = 0;
        bool v145 = v143 != v144;
        int v146;
        if (v145) {
          int v147 = 1;
          v146 = v147;
        } else {
          int v148 = 0;
          v146 = v148;
        }
        v132 = v146;
      }
      v126 = v132;
      break;
    }
    case 1:
      {
      int v149 = 2;
      v126 = v149;
      break;
    }
    case 2:
      {
      int v150 = 2;
      int v151 = v47 + v150;
      v126 = v151;
      break;
    }
    default:
      {
      int v152 = 68;
      int v153 = v152 + v47;
      int v154 = v46[v153];
      int v155 = 0;
      bool v156 = v154 != v155;
      int v157;
      if (v156) {
        int v158 = 4;
        int v159 = v47 + v158;
        v157 = v159;
      } else {
        int v160 = 0;
        int v161 = 0;
        int v162;
        int v163;
        v162 = v160;
        v163 = v161;
        while (true) {
          int v164 = 4;
          int v165 = v163 * v164;
          int v166 = v165 + v47;
          int v167 = 72;
          int v168 = v167 + v166;
          int v169 = v46[v168];
          int v170 = 0;
          bool v171 = v169 != v170;
          v162 = v162;
          v163 = v163;
          if (!v171) break;
          int v172 = v162 + v163;
          int v173 = 1;
          int v174 = v163 + v173;
          v162 = v172;
          v163 = v174;
        }
        bool v175 = true;
        v157 = v162;
      }
      v126 = v157;
      break;
    }
  }
  bool v176 = true;
  int v177 = 32;
  int v178 = v177 + v47;
  bool v179 = true;
  int v180 = simt_wave_count_bits(v179);
  v45[v178] = v180;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
