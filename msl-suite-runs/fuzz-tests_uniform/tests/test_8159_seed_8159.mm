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
    int v13;
    v13 = v0;
    switch (v3) {
      default:
        {
        int v14 = 1;
        int v15 = v0 + v14;
        v13 = v15;
      }
      case 0:
        {
        int v16 = 3;
        int v17 = v0 + v16;
        v13 = v17;
        break;
      }
    }
    uint v18 = simt_lane_id(__simt_tid);
    int v19 = (int)(v18);
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v13;
    v7 = v21;
  }
  bool v22 = true;
  int v23 = simt_wave_count_bits(v22);
  int v24 = 0;
  int v25 = v24 + v0;
  v1[v25] = v23;
  int v26 = 3;
  int v27 = v3 % v26;
  int v28 = 2;
  int v29 = v0 + v28;
  int v30;
  v30 = v29;
  switch (v27) {
    case 0:
      {
      int v31 = 0;
      int v32 = 0;
      int v33;
      int v34;
      v33 = v31;
      v34 = v32;
      while (true) {
        int v35 = 4;
        int v36 = v3 % v35;
        int v37 = 1;
        int v38 = v36 + v37;
        bool v39 = v34 < v38;
        v33 = v33;
        v34 = v34;
        if (!v39) break;
        int v40 = 0;
        int v41 = 0;
        int v42;
        int v43;
        v42 = v40;
        v43 = v41;
        while (true) {
          int v44 = 4;
          int v45 = v3 % v44;
          int v46 = 1;
          int v47 = v45 + v46;
          bool v48 = v43 < v47;
          v42 = v42;
          v43 = v43;
          if (!v48) break;
          int v49 = 1;
          int v50 = v43 + v49;
          v42 = v0;
          v43 = v50;
        }
        int v51 = 1;
        int v52 = 1;
        int v53 = v34 + v52;
        v33 = v42;
        v34 = v53;
      }
      int v54 = 3;
      v30 = v33;
      break;
    }
    default:
      {
      int v55 = 1;
      int v56 = v0 + v55;
      int v57;
      v57 = v56;
      switch (v3) {
        case 0:
          {
          int v58 = 0;
          int v59 = 0;
          int v60;
          int v61;
          v60 = v58;
          v61 = v59;
          while (true) {
            int v62 = 4;
            int v63 = v3 % v62;
            int v64 = 1;
            int v65 = v63 + v64;
            bool v66 = v61 < v65;
            v60 = v60;
            v61 = v61;
            if (!v66) break;
            int v67 = 1;
            int v68 = v61 + v67;
            v60 = v0;
            v61 = v68;
            break;
            ;
          }
          v57 = v60;
        }
        default:
          {
          int v69 = 4;
          v57 = v69;
          break;
        }
      }
      v30 = v57;
      break;
    }
    case 1:
      {
      int v70 = 0;
      bool v71 = v2 != v70;
      int v72;
      if (v71) {
        int v73 = 0;
        bool v74 = v2 != v73;
        int v75;
        if (v74) {
          v75 = v0;
        } else {
          int v76 = 0;
          v75 = v76;
        }
        int v77 = 2;
        int v78 = v0 + v77;
        v72 = v75;
      } else {
        int v79 = 0;
        int v80 = 0;
        int v81;
        int v82;
        v81 = v79;
        v82 = v80;
        while (true) {
          int v83 = 4;
          int v84 = v3 % v83;
          int v85 = 1;
          int v86 = v84 + v85;
          bool v87 = v82 < v86;
          v81 = v81;
          v82 = v82;
          if (!v87) break;
          int v88 = 1;
          int v89 = v82 + v88;
          v81 = v0;
          v82 = v89;
        }
        int v90 = 0;
        int v91 = v0 + v90;
        v72 = v81;
      }
      int v92 = 0;
      v30 = v72;
      break;
    }
  }
  bool v93 = true;
  int v94 = simt_wave_count_bits(v93);
  int v95 = 16;
  int v96 = v95 + v0;
  v1[v96] = v94;
  int v97 = 0;
  bool v98 = v2 != v97;
  int v99 = v98 ? v6 : v30;
  return;
}

kernel void kernel_main(device int* v100 [[buffer(0)]], device int* v101 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v102 = static_cast<int>(__simt_tid3.x);
  int v103 = 0;
  int v104 = v103 + v102;
  int v105 = v101[v104];
  int v106 = 4;
  int v107 = v106 + v102;
  int v108 = v101[v107];
  helper0(v102, v100, v105, v108, static_cast<int>(__simt_tid3.x));
  int v109 = 8;
  int v110 = v109 + v102;
  int v111 = v101[v110];
  int v112 = 0;
  bool v113 = v111 != v112;
  int v114;
  if (v113) {
    int v115 = 12;
    int v116 = v115 + v102;
    int v117 = v101[v116];
    int v118;
    v118 = v102;
    switch (v117) {
      case 0:
        {
        int v119 = 16;
        int v120 = v119 + v102;
        int v121 = v101[v120];
        int v122 = 0;
        int v123;
        v123 = v122;
        switch (v121) {
          case 0:
            {
            int v124 = 4;
            int v125 = v102 + v124;
            v123 = v125;
            break;
          }
          case 1:
            {
            int v126 = 1;
            int v127 = v102 + v126;
            v123 = v127;
          }
          default:
            {
            int v128 = 0;
            int v129 = v102 + v128;
            v123 = v129;
            break;
          }
          case 2:
            {
            int v130 = 3;
            int v131 = v102 + v130;
            v123 = v131;
            break;
          }
        }
        bool v132 = true;
        v118 = v123;
      }
      case 1:
        {
        int v133 = 20;
        int v134 = v133 + v102;
        int v135 = v101[v134];
        int v136 = 3;
        int v137 = v102 + v136;
        int v138;
        v138 = v137;
        switch (v135) {
          case 0:
            {
            v138 = v102;
            break;
          }
          case 1:
            {
            int v139 = 3;
            int v140 = v102 + v139;
            v138 = v140;
            break;
          }
          case 2:
            {
            v138 = v102;
            break;
          }
          default:
            {
            v138 = v102;
            break;
          }
        }
        bool v141 = true;
        v118 = v138;
        break;
      }
      case 2:
        {
        int v142 = 4;
        int v143 = v102 + v142;
        v118 = v143;
      }
      default:
        {
        int v144 = 24;
        int v145 = v144 + v102;
        int v146 = v101[v145];
        int v147 = 0;
        bool v148 = v146 != v147;
        int v149;
        if (v148) {
          int v150 = 3;
          v149 = v150;
        } else {
          v149 = v102;
        }
        v118 = v149;
        break;
      }
    }
    bool v151 = true;
    v114 = v118;
  } else {
    int v152 = 28;
    int v153 = v152 + v102;
    int v154 = v101[v153];
    int v155 = 2;
    int v156;
    v156 = v155;
    switch (v154) {
      default:
        {
        int v157 = 32;
        int v158 = v157 + v102;
        int v159 = v101[v158];
        int v160;
        v160 = v102;
        switch (v159) {
          case 0:
            {
            int v161 = 2;
            v160 = v161;
            break;
          }
          case 1:
            {
            v160 = v102;
            break;
          }
          default:
            {
            int v162 = 4;
            v160 = v162;
            break;
          }
          case 2:
            {
            v160 = v102;
            break;
          }
        }
        bool v163 = true;
        v156 = v160;
      }
      case 0:
        {
        int v164 = 36;
        int v165 = v164 + v102;
        int v166 = v101[v165];
        int v167 = 0;
        bool v168 = v166 != v167;
        int v169;
        if (v168) {
          v169 = v102;
        } else {
          int v170 = 2;
          v169 = v170;
        }
        v156 = v169;
        break;
      }
    }
    bool v171 = true;
    v114 = v156;
  }
  int v172 = 32;
  int v173 = v172 + v102;
  bool v174 = true;
  int v175 = simt_wave_count_bits(v174);
  v100[v173] = v175;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 40; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
