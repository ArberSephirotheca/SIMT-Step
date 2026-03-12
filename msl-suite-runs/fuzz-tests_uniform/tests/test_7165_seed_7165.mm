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
    case 0:
      {
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
        int v18 = 0;
        bool v19 = v2 != v18;
        int v20;
        if (v19) {
          int v21 = 3;
          int v22 = v0 + v21;
          v20 = v22;
        } else {
          int v23 = 2;
          v20 = v23;
        }
        int v24 = 0;
        int v25 = 1;
        int v26 = v12 + v25;
        v11 = v20;
        v12 = v26;
      }
      int v27 = 2;
      int v28 = v0 + v27;
      v8 = v11;
      break;
    }
    default:
      {
      int v29 = 0;
      bool v30 = v2 != v29;
      int v31;
      if (v30) {
        int v32 = 3;
        int v33 = v3 % v32;
        int v34 = 0;
        int v35 = v0 + v34;
        int v36;
        v36 = v35;
        switch (v33) {
          default:
            {
            v36 = v0;
            break;
          }
          case 0:
            {
            v36 = v0;
          }
          case 1:
            {
            int v37 = 2;
            int v38 = v0 + v37;
            v36 = v38;
            break;
          }
          case 2:
            {
            int v39 = 4;
            int v40 = v0 + v39;
            v36 = v40;
            break;
          }
        }
        v31 = v36;
      } else {
        int v41 = 0;
        int v42 = 0;
        int v43;
        int v44;
        v43 = v41;
        v44 = v42;
        while (true) {
          int v45 = 4;
          int v46 = v3 % v45;
          int v47 = 1;
          int v48 = v46 + v47;
          bool v49 = v44 < v48;
          v43 = v43;
          v44 = v44;
          if (!v49) break;
          int v50 = 1;
          int v51 = v44 + v50;
          v43 = v0;
          v44 = v51;
        }
        int v52 = 0;
        v31 = v43;
      }
      int v53 = 1;
      int v54 = v0 + v53;
      v8 = v31;
      break;
    }
    case 1:
      {
      int v55 = 0;
      bool v56 = v2 != v55;
      int v57;
      if (v56) {
        int v58 = 2;
        int v59 = v3 % v58;
        int v60 = 1;
        int v61 = v0 + v60;
        int v62;
        v62 = v61;
        switch (v59) {
          case 0:
            {
            int v63 = 3;
            v62 = v63;
            break;
          }
          default:
            {
            v62 = v0;
            break;
          }
        }
        v57 = v62;
      } else {
        int v64 = 2;
        int v65 = v3 % v64;
        int v66 = 0;
        int v67 = v0 + v66;
        int v68;
        v68 = v67;
        switch (v65) {
          default:
            {
            int v69 = 4;
            int v70 = v0 + v69;
            v68 = v70;
            break;
          }
          case 0:
            {
            int v71 = 4;
            v68 = v71;
            break;
          }
          case 1:
            {
            int v72 = 2;
            int v73 = v0 + v72;
            v68 = v73;
            break;
          }
        }
        int v74 = 2;
        int v75 = v0 + v74;
        v57 = v68;
      }
      v8 = v57;
      break;
    }
  }
  bool v76 = true;
  int v77 = simt_wave_count_bits(v76);
  int v78 = 0;
  int v79 = v78 + v0;
  v1[v79] = v77;
  return;
}

kernel void kernel_main(device int* v80 [[buffer(0)]], device int* v81 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v82 = static_cast<int>(__simt_tid3.x);
  int v83 = 0;
  int v84 = v83 + v82;
  int v85 = v81[v84];
  int v86 = 4;
  int v87 = v86 + v82;
  int v88 = v81[v87];
  helper0(v82, v80, v85, v88, static_cast<int>(__simt_tid3.x));
  int v89 = 0;
  int v90 = 0;
  int v91;
  int v92;
  v91 = v89;
  v92 = v90;
  while (true) {
    int v93 = 4;
    int v94 = v92 * v93;
    int v95 = v94 + v82;
    int v96 = 8;
    int v97 = v96 + v95;
    int v98 = v81[v97];
    int v99 = 0;
    bool v100 = v98 != v99;
    v91 = v91;
    v92 = v92;
    if (!v100) break;
    uint v101 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v102 = (int)(v101);
    int v103 = v91 + v102;
    int v104 = 1;
    int v105 = v92 + v104;
    v91 = v103;
    v92 = v105;
    break;
    ;
  }
  bool v106 = true;
  int v107 = 16;
  int v108 = v107 + v82;
  bool v109 = true;
  int v110 = simt_wave_count_bits(v109);
  v80[v108] = v110;
  int v111 = 28;
  int v112 = v111 + v82;
  int v113 = v81[v112];
  int v114 = 0;
  bool v115 = v113 != v114;
  int v116;
  if (v115) {
    uint v117 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v118 = (int)(v117);
    v116 = v118;
  } else {
    uint v119 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v120 = (int)(v119);
    v116 = v120;
  }
  int v121 = 32;
  int v122 = v121 + v82;
  bool v123 = true;
  int v124 = simt_wave_count_bits(v123);
  v80[v122] = v124;
  int v125 = 32;
  int v126 = v125 + v82;
  int v127 = v81[v126];
  int v128 = 0;
  bool v129 = v127 != v128;
  int v130;
  if (v129) {
    int v131 = 0;
    int v132 = 0;
    int v133;
    int v134;
    v133 = v131;
    v134 = v132;
    while (true) {
      int v135 = 4;
      int v136 = v134 * v135;
      int v137 = v136 + v82;
      int v138 = 36;
      int v139 = v138 + v137;
      int v140 = v81[v139];
      int v141 = 0;
      bool v142 = v140 != v141;
      v133 = v133;
      v134 = v134;
      if (!v142) break;
      int v143 = 56;
      int v144 = v143 + v82;
      int v145 = v81[v144];
      int v146 = 4;
      int v147;
      v147 = v146;
      switch (v145) {
        default:
          {
          v147 = v82;
          break;
        }
        case 0:
          {
          v147 = v82;
          break;
        }
        case 1:
          {
          v147 = v82;
          break;
        }
      }
      bool v148 = true;
      int v149 = v133 + v147;
      int v150 = 1;
      int v151 = v134 + v150;
      v133 = v149;
      v134 = v151;
      continue;
      ;
    }
    bool v152 = true;
    v130 = v133;
  } else {
    int v153 = 60;
    int v154 = v153 + v82;
    int v155 = v81[v154];
    int v156;
    v156 = v82;
    switch (v155) {
      case 0:
        {
        v156 = v82;
        break;
      }
      default:
        {
        int v157 = 64;
        int v158 = v157 + v82;
        int v159 = v81[v158];
        int v160 = 2;
        int v161;
        v161 = v160;
        switch (v159) {
          default:
            {
            v161 = v82;
            break;
          }
          case 0:
            {
            int v162 = 4;
            v161 = v162;
            break;
          }
        }
        bool v163 = true;
        v156 = v161;
        break;
      }
      case 1:
        {
        int v164 = 0;
        int v165 = 0;
        int v166;
        int v167;
        v166 = v164;
        v167 = v165;
        while (true) {
          int v168 = 4;
          int v169 = v167 * v168;
          int v170 = v169 + v82;
          int v171 = 68;
          int v172 = v171 + v170;
          int v173 = v81[v172];
          int v174 = 0;
          bool v175 = v173 != v174;
          v166 = v166;
          v167 = v167;
          if (!v175) break;
          int v176 = v166 + v167;
          int v177 = 1;
          int v178 = v167 + v177;
          v166 = v176;
          v167 = v178;
        }
        bool v179 = true;
        v156 = v166;
        break;
      }
    }
    bool v180 = true;
    v130 = v156;
  }
  int v181 = 48;
  int v182 = v181 + v82;
  bool v183 = true;
  int v184 = simt_wave_count_bits(v183);
  v80[v182] = v184;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
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
