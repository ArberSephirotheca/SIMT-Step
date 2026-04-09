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
    bool v14 = v2 != v13;
    int v15;
    if (v14) {
      int v16 = 2;
      v15 = v16;
    } else {
      int v17 = 3;
      int v18 = v0 + v17;
      v15 = v18;
    }
    uint v19 = simt_subgroup_id(__simt_tid);
    int v20 = (int)(v19);
    int v21 = 1;
    int v22 = v7 + v21;
    v6 = v15;
    v7 = v22;
  }
  bool v23 = true;
  int v24 = simt_wave_count_bits(v23);
  int v25 = 0;
  int v26 = v25 + v0;
  v1[v26] = v24;
  int v27 = 0;
  bool v28 = v2 != v27;
  int v29;
  if (v28) {
    int v30 = 0;
    int v31 = 0;
    int v32;
    int v33;
    v32 = v30;
    v33 = v31;
    while (true) {
      int v34 = 4;
      int v35 = v3 % v34;
      int v36 = 1;
      int v37 = v35 + v36;
      bool v38 = v33 < v37;
      v32 = v32;
      v33 = v33;
      if (!v38) break;
      int v39 = 0;
      bool v40 = v2 != v39;
      int v41;
      if (v40) {
        uint v42 = simt_lane_id(__simt_tid);
        int v43 = (int)(v42);
        v41 = v43;
      } else {
        int v44 = 2;
        v41 = v44;
      }
      int v45 = 3;
      int v46 = v0 + v45;
      int v47 = 1;
      int v48 = v33 + v47;
      v32 = v41;
      v33 = v48;
      break;
      ;
    }
    int v49 = 2;
    int v50 = v0 + v49;
    v29 = v32;
  } else {
    int v51 = 3;
    int v52 = v3 % v51;
    int v53;
    v53 = v0;
    switch (v52) {
      case 0:
        {
        int v54 = 0;
        int v55 = 0;
        int v56;
        int v57;
        v56 = v54;
        v57 = v55;
        while (true) {
          int v58 = 4;
          int v59 = v3 % v58;
          int v60 = 1;
          int v61 = v59 + v60;
          bool v62 = v57 < v61;
          v56 = v56;
          v57 = v57;
          if (!v62) break;
          int v63 = 1;
          int v64 = v57 + v63;
          v56 = v0;
          v57 = v64;
          continue;
          ;
        }
        int v65 = 3;
        v53 = v56;
        break;
      }
      case 1:
        {
        int v66 = 0;
        int v67 = 0;
        int v68;
        int v69;
        v68 = v66;
        v69 = v67;
        while (true) {
          int v70 = 4;
          int v71 = v3 % v70;
          int v72 = 1;
          int v73 = v71 + v72;
          bool v74 = v69 < v73;
          v68 = v68;
          v69 = v69;
          if (!v74) break;
          int v75 = 2;
          int v76 = v0 + v75;
          int v77 = 1;
          int v78 = v69 + v77;
          v68 = v76;
          v69 = v78;
        }
        int v79 = 2;
        int v80 = v0 + v79;
        v53 = v68;
        break;
      }
      default:
        {
        int v81 = 0;
        bool v82 = v2 != v81;
        int v83;
        if (v82) {
          int v84 = 1;
          v83 = v84;
        } else {
          int v85 = 1;
          int v86 = v0 + v85;
          v83 = v86;
        }
        v53 = v83;
        break;
      }
    }
    uint v87 = simt_lane_id(__simt_tid);
    int v88 = (int)(v87);
    v29 = v53;
  }
  bool v89 = true;
  int v90 = simt_wave_count_bits(v89);
  int v91 = 16;
  int v92 = v91 + v0;
  v1[v92] = v90;
  int v93 = 0;
  bool v94 = v2 != v93;
  int v95 = v94 ? v6 : v29;
  return;
}

kernel void kernel_main(device int* v96 [[buffer(0)]], device int* v97 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v98 = static_cast<int>(__simt_tid3.x);
  int v99 = 0;
  int v100 = v99 + v98;
  int v101 = v97[v100];
  int v102 = 4;
  int v103 = v102 + v98;
  int v104 = v97[v103];
  helper0(v98, v96, v101, v104, static_cast<int>(__simt_tid3.x));
  int v105 = 0;
  int v106 = 0;
  int v107;
  int v108;
  v107 = v105;
  v108 = v106;
  while (true) {
    int v109 = 4;
    int v110 = v108 * v109;
    int v111 = v110 + v98;
    int v112 = 8;
    int v113 = v112 + v111;
    int v114 = v97[v113];
    int v115 = 0;
    bool v116 = v114 != v115;
    v107 = v107;
    v108 = v108;
    if (!v116) break;
    int v117 = v107 + v108;
    int v118 = 1;
    int v119 = v108 + v118;
    v107 = v117;
    v108 = v119;
  }
  bool v120 = true;
  int v121 = 32;
  int v122 = v121 + v98;
  bool v123 = true;
  int v124 = simt_wave_count_bits(v123);
  v96[v122] = v124;
  int v125 = 28;
  int v126 = v125 + v98;
  int v127 = v97[v126];
  int v128;
  v128 = v98;
  switch (v127) {
    case 0:
      {
      int v129 = 32;
      int v130 = v129 + v98;
      int v131 = v97[v130];
      int v132 = 0;
      bool v133 = v131 != v132;
      int v134;
      if (v133) {
        int v135 = 0;
        int v136 = 0;
        int v137;
        int v138;
        v137 = v135;
        v138 = v136;
        while (true) {
          int v139 = 4;
          int v140 = v138 * v139;
          int v141 = v140 + v98;
          int v142 = 36;
          int v143 = v142 + v141;
          int v144 = v97[v143];
          int v145 = 0;
          bool v146 = v144 != v145;
          v137 = v137;
          v138 = v138;
          if (!v146) break;
          int v147 = v137 + v138;
          int v148 = 1;
          int v149 = v138 + v148;
          v137 = v147;
          v138 = v149;
        }
        bool v150 = true;
        v134 = v137;
      } else {
        int v151 = 1;
        int v152 = v98 + v151;
        v134 = v152;
      }
      v128 = v134;
      break;
    }
    default:
      {
      int v153 = 56;
      int v154 = v153 + v98;
      int v155 = v97[v154];
      int v156 = 4;
      int v157 = v98 + v156;
      int v158;
      v158 = v157;
      switch (v155) {
        case 0:
          {
          int v159 = 60;
          int v160 = v159 + v98;
          int v161 = v97[v160];
          int v162 = 0;
          bool v163 = v161 != v162;
          int v164;
          if (v163) {
            int v165 = 1;
            int v166 = v98 + v165;
            v164 = v166;
          } else {
            int v167 = 4;
            v164 = v167;
          }
          v158 = v164;
          break;
        }
        default:
          {
          int v168 = 64;
          int v169 = v168 + v98;
          int v170 = v97[v169];
          int v171;
          v171 = v98;
          switch (v170) {
            default:
              {
              v171 = v98;
              break;
            }
            case 0:
              {
              v171 = v98;
              break;
            }
            case 1:
              {
              int v172 = 1;
              int v173 = v98 + v172;
              v171 = v173;
              break;
            }
          }
          bool v174 = true;
          v158 = v171;
          break;
        }
      }
      bool v175 = true;
      v128 = v158;
      break;
    }
  }
  bool v176 = true;
  int v177 = 48;
  int v178 = v177 + v98;
  bool v179 = true;
  int v180 = simt_wave_count_bits(v179);
  v96[v178] = v180;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
