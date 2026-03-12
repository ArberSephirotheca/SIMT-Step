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
    int v7 = 0;
    v6 = v7;
  } else {
    int v8 = 4;
    int v9 = v3 % v8;
    uint v10 = simt_lane_id(__simt_tid);
    int v11 = (int)(v10);
    int v12;
    v12 = v11;
    switch (v9) {
      default:
        {
        v12 = v0;
      }
      case 0:
        {
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
          int v22 = 1;
          int v23 = v0 + v22;
          int v24 = 1;
          int v25 = v16 + v24;
          v15 = v23;
          v16 = v25;
        }
        int v26 = 0;
        v12 = v15;
        break;
      }
      case 1:
        {
        int v27 = 2;
        int v28 = v3 % v27;
        int v29 = 0;
        int v30;
        v30 = v29;
        switch (v28) {
          default:
            {
            int v31 = 0;
            v30 = v31;
            break;
          }
          case 0:
            {
            int v32 = 4;
            int v33 = v0 + v32;
            v30 = v33;
            break;
          }
        }
        int v34 = 2;
        v12 = v30;
      }
      case 2:
        {
        int v35 = 0;
        int v36 = 0;
        int v37;
        int v38;
        v37 = v35;
        v38 = v36;
        while (true) {
          int v39 = 4;
          int v40 = v3 % v39;
          int v41 = 1;
          int v42 = v40 + v41;
          bool v43 = v38 < v42;
          v37 = v37;
          v38 = v38;
          if (!v43) break;
          int v44 = 1;
          int v45 = v0 + v44;
          int v46 = 1;
          int v47 = v38 + v46;
          v37 = v45;
          v38 = v47;
        }
        int v48 = 4;
        v12 = v37;
        break;
      }
    }
    int v49 = 0;
    v6 = v12;
  }
  bool v50 = true;
  int v51 = simt_wave_count_bits(v50);
  int v52 = 0;
  int v53 = v52 + v0;
  v1[v53] = v51;
  return;
}

kernel void kernel_main(device int* v54 [[buffer(0)]], device int* v55 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v56 = static_cast<int>(__simt_tid3.x);
  int v57 = 0;
  int v58 = v57 + v56;
  int v59 = v55[v58];
  int v60 = 4;
  int v61 = v60 + v56;
  int v62 = v55[v61];
  helper0(v56, v54, v59, v62, static_cast<int>(__simt_tid3.x));
  int v63 = 0;
  int v64 = 0;
  int v65;
  int v66;
  v65 = v63;
  v66 = v64;
  while (true) {
    int v67 = 4;
    int v68 = v66 * v67;
    int v69 = v68 + v56;
    int v70 = 8;
    int v71 = v70 + v69;
    int v72 = v55[v71];
    int v73 = 0;
    bool v74 = v72 != v73;
    v65 = v65;
    v66 = v66;
    if (!v74) break;
    int v75 = 28;
    int v76 = v75 + v56;
    int v77 = v55[v76];
    int v78 = 0;
    int v79;
    v79 = v78;
    switch (v77) {
      case 0:
        {
        int v80 = 32;
        int v81 = v80 + v56;
        int v82 = v55[v81];
        int v83 = 3;
        int v84;
        v84 = v83;
        switch (v82) {
          default:
            {
            int v85 = 4;
            int v86 = v56 + v85;
            v84 = v86;
            break;
          }
          case 0:
            {
            v84 = v56;
            break;
          }
        }
        bool v87 = true;
        v79 = v84;
      }
      default:
        {
        int v88 = 36;
        int v89 = v88 + v56;
        int v90 = v55[v89];
        int v91 = 0;
        bool v92 = v90 != v91;
        int v93;
        if (v92) {
          int v94 = 3;
          int v95 = v56 + v94;
          v93 = v95;
        } else {
          v93 = v56;
        }
        v79 = v93;
      }
      case 1:
        {
        int v96 = 40;
        int v97 = v96 + v56;
        int v98 = v55[v97];
        int v99 = 0;
        bool v100 = v98 != v99;
        int v101;
        if (v100) {
          int v102 = 3;
          v101 = v102;
        } else {
          int v103 = 4;
          int v104 = v56 + v103;
          v101 = v104;
        }
        v79 = v101;
        break;
      }
    }
    bool v105 = true;
    int v106 = v65 + v79;
    int v107 = 1;
    int v108 = v66 + v107;
    v65 = v106;
    v66 = v108;
    break;
    ;
  }
  bool v109 = true;
  int v110 = 16;
  int v111 = v110 + v56;
  bool v112 = true;
  int v113 = simt_wave_count_bits(v112);
  v54[v111] = v113;
  int v114 = 44;
  int v115 = v114 + v56;
  int v116 = v55[v115];
  uint v117 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v118 = (int)(v117);
  int v119;
  v119 = v118;
  switch (v116) {
    case 0:
      {
      int v120 = 0;
      int v121 = 0;
      int v122;
      int v123;
      v122 = v120;
      v123 = v121;
      while (true) {
        int v124 = 4;
        int v125 = v123 * v124;
        int v126 = v125 + v56;
        int v127 = 48;
        int v128 = v127 + v126;
        int v129 = v55[v128];
        int v130 = 0;
        bool v131 = v129 != v130;
        v122 = v122;
        v123 = v123;
        if (!v131) break;
        int v132 = 68;
        int v133 = v132 + v56;
        int v134 = v55[v133];
        int v135 = 0;
        bool v136 = v134 != v135;
        int v137;
        if (v136) {
          int v138 = 0;
          int v139 = v56 + v138;
          v137 = v139;
        } else {
          int v140 = 1;
          int v141 = v56 + v140;
          v137 = v141;
        }
        int v142 = v122 + v137;
        int v143 = 1;
        int v144 = v123 + v143;
        v122 = v142;
        v123 = v144;
        continue;
        ;
      }
      bool v145 = true;
      v119 = v122;
    }
    case 1:
      {
      v119 = v56;
      break;
    }
    default:
      {
      v119 = v56;
    }
    case 2:
      {
      int v146 = 72;
      int v147 = v146 + v56;
      int v148 = v55[v147];
      int v149 = 0;
      bool v150 = v148 != v149;
      int v151;
      if (v150) {
        int v152 = 0;
        int v153 = 0;
        int v154;
        int v155;
        v154 = v152;
        v155 = v153;
        while (true) {
          int v156 = 4;
          int v157 = v155 * v156;
          int v158 = v157 + v56;
          int v159 = 76;
          int v160 = v159 + v158;
          int v161 = v55[v160];
          int v162 = 0;
          bool v163 = v161 != v162;
          v154 = v154;
          v155 = v155;
          if (!v163) break;
          int v164 = v154 + v155;
          int v165 = 1;
          int v166 = v155 + v165;
          v154 = v164;
          v155 = v166;
          continue;
          ;
        }
        bool v167 = true;
        v151 = v154;
      } else {
        int v168 = 96;
        int v169 = v168 + v56;
        int v170 = v55[v169];
        int v171 = 0;
        bool v172 = v170 != v171;
        int v173;
        if (v172) {
          int v174 = 4;
          int v175 = v56 + v174;
          v173 = v175;
        } else {
          v173 = v56;
        }
        v151 = v173;
      }
      v119 = v151;
      break;
    }
  }
  bool v176 = true;
  int v177 = 32;
  int v178 = v177 + v56;
  bool v179 = true;
  int v180 = simt_wave_count_bits(v179);
  v54[v178] = v180;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
