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
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      uint v10 = simt_lane_id(__simt_tid);
      int v11 = (int)(v10);
      int v12;
      v12 = v11;
      switch (v3) {
        default:
          {
          int v13 = 1;
          v12 = v13;
        }
        case 0:
          {
          int v14 = 0;
          v12 = v14;
          break;
        }
      }
      uint v15 = simt_subgroup_id(__simt_tid);
      int v16 = (int)(v15);
      v9 = v12;
    } else {
      int v17 = 2;
      int v18 = v3 % v17;
      int v19 = 1;
      int v20;
      v20 = v19;
      switch (v18) {
        case 0:
          {
          v20 = v0;
        }
        default:
          {
          v20 = v0;
          break;
        }
      }
      v9 = v20;
    }
    v6 = v9;
  } else {
    int v21 = 0;
    bool v22 = v2 != v21;
    int v23;
    if (v22) {
      uint v24 = simt_subgroup_id(__simt_tid);
      int v25 = (int)(v24);
      v23 = v25;
    } else {
      int v26 = 0;
      int v27 = 0;
      int v28;
      int v29;
      v28 = v26;
      v29 = v27;
      while (true) {
        int v30 = 4;
        int v31 = v3 % v30;
        int v32 = 1;
        int v33 = v31 + v32;
        bool v34 = v29 < v33;
        v28 = v28;
        v29 = v29;
        if (!v34) break;
        int v35 = 1;
        int v36 = v29 + v35;
        v28 = v0;
        v29 = v36;
      }
      uint v37 = simt_subgroup_id(__simt_tid);
      int v38 = (int)(v37);
      v23 = v28;
    }
    uint v39 = simt_lane_id(__simt_tid);
    int v40 = (int)(v39);
    v6 = v23;
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
  int v54 = 0;
  int v55 = 0;
  int v56;
  int v57;
  v56 = v54;
  v57 = v55;
  while (true) {
    int v58 = 4;
    int v59 = v57 * v58;
    int v60 = v59 + v47;
    int v61 = 8;
    int v62 = v61 + v60;
    int v63 = v46[v62];
    int v64 = 0;
    bool v65 = v63 != v64;
    v56 = v56;
    v57 = v57;
    if (!v65) break;
    int v66 = 28;
    int v67 = v66 + v47;
    int v68 = v46[v67];
    uint v69 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v70 = (int)(v69);
    int v71;
    v71 = v70;
    switch (v68) {
      case 0:
        {
        int v72 = 32;
        int v73 = v72 + v47;
        int v74 = v46[v73];
        int v75 = 0;
        bool v76 = v74 != v75;
        int v77;
        if (v76) {
          v77 = v47;
        } else {
          int v78 = 3;
          v77 = v78;
        }
        v71 = v77;
        break;
      }
      default:
        {
        int v79 = 36;
        int v80 = v79 + v47;
        int v81 = v46[v80];
        int v82 = 0;
        bool v83 = v81 != v82;
        int v84;
        if (v83) {
          v84 = v47;
        } else {
          v84 = v47;
        }
        v71 = v84;
      }
      case 1:
        {
        int v85 = 40;
        int v86 = v85 + v47;
        int v87 = v46[v86];
        int v88 = 4;
        int v89;
        v89 = v88;
        switch (v87) {
          default:
            {
            int v90 = 0;
            v89 = v90;
          }
          case 0:
            {
            int v91 = 2;
            v89 = v91;
          }
          case 1:
            {
            int v92 = 0;
            int v93 = v47 + v92;
            v89 = v93;
            break;
          }
        }
        bool v94 = true;
        v71 = v89;
      }
      case 2:
        {
        int v95 = 44;
        int v96 = v95 + v47;
        int v97 = v46[v96];
        int v98 = 0;
        bool v99 = v97 != v98;
        int v100;
        if (v99) {
          int v101 = 0;
          int v102 = v47 + v101;
          v100 = v102;
        } else {
          int v103 = 0;
          v100 = v103;
        }
        v71 = v100;
        break;
      }
    }
    bool v104 = true;
    int v105 = v56 + v71;
    int v106 = 1;
    int v107 = v57 + v106;
    v56 = v105;
    v57 = v107;
    continue;
    ;
  }
  bool v108 = true;
  int v109 = 16;
  int v110 = v109 + v47;
  bool v111 = true;
  int v112 = simt_wave_count_bits(v111);
  v45[v110] = v112;
  int v113 = 48;
  int v114 = v113 + v47;
  int v115 = v46[v114];
  int v116 = 3;
  int v117 = v47 + v116;
  int v118;
  v118 = v117;
  switch (v115) {
    case 0:
      {
      int v119 = 52;
      int v120 = v119 + v47;
      int v121 = v46[v120];
      int v122;
      v122 = v47;
      switch (v121) {
        case 0:
          {
          int v123 = 56;
          int v124 = v123 + v47;
          int v125 = v46[v124];
          int v126 = 0;
          bool v127 = v125 != v126;
          int v128;
          if (v127) {
            int v129 = 2;
            int v130 = v47 + v129;
            v128 = v130;
          } else {
            int v131 = 3;
            v128 = v131;
          }
          v122 = v128;
          break;
        }
        default:
          {
          int v132 = 0;
          int v133 = 0;
          int v134;
          int v135;
          v134 = v132;
          v135 = v133;
          while (true) {
            int v136 = 4;
            int v137 = v135 * v136;
            int v138 = v137 + v47;
            int v139 = 60;
            int v140 = v139 + v138;
            int v141 = v46[v140];
            int v142 = 0;
            bool v143 = v141 != v142;
            v134 = v134;
            v135 = v135;
            if (!v143) break;
            int v144 = v134 + v135;
            int v145 = 1;
            int v146 = v135 + v145;
            v134 = v144;
            v135 = v146;
            continue;
            ;
          }
          bool v147 = true;
          v122 = v134;
          break;
        }
        case 1:
          {
          int v148 = 80;
          int v149 = v148 + v47;
          int v150 = v46[v149];
          int v151 = 0;
          bool v152 = v150 != v151;
          int v153;
          if (v152) {
            int v154 = 2;
            int v155 = v47 + v154;
            v153 = v155;
          } else {
            v153 = v47;
          }
          v122 = v153;
          break;
        }
      }
      bool v156 = true;
      v118 = v122;
    }
    default:
      {
      int v157 = 84;
      int v158 = v157 + v47;
      int v159 = v46[v158];
      int v160 = 4;
      int v161 = v47 + v160;
      int v162;
      v162 = v161;
      switch (v159) {
        case 0:
          {
          int v163 = 3;
          int v164 = v47 + v163;
          v162 = v164;
          break;
        }
        case 1:
          {
          int v165 = 2;
          int v166 = v47 + v165;
          v162 = v166;
        }
        default:
          {
          int v167 = 4;
          int v168 = v47 + v167;
          v162 = v168;
          break;
        }
      }
      bool v169 = true;
      v118 = v162;
      break;
    }
  }
  bool v170 = true;
  int v171 = 32;
  int v172 = v171 + v47;
  bool v173 = true;
  int v174 = simt_wave_count_bits(v173);
  v45[v172] = v174;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
