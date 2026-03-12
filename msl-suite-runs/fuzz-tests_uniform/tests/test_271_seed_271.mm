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
  int v4 = 1;
  int v5 = 3;
  int v6 = v3 % v5;
  int v7 = 3;
  int v8 = v0 + v7;
  int v9;
  v9 = v8;
  switch (v6) {
    case 0:
      {
      int v10 = 0;
      bool v11 = v2 != v10;
      int v12;
      if (v11) {
        int v13 = 3;
        int v14 = v3 % v13;
        int v15 = 1;
        int v16;
        v16 = v15;
        switch (v14) {
          default:
            {
            int v17 = 3;
            v16 = v17;
          }
          case 0:
            {
            v16 = v0;
          }
          case 1:
            {
            int v18 = 3;
            int v19 = v0 + v18;
            v16 = v19;
          }
          case 2:
            {
            v16 = v0;
            break;
          }
        }
        int v20 = 4;
        v12 = v16;
      } else {
        int v21 = 1;
        int v22 = v0 + v21;
        v12 = v22;
      }
      int v23 = 2;
      int v24 = v0 + v23;
      v9 = v12;
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
        bool v35 = v2 != v34;
        int v36;
        if (v35) {
          int v37 = 0;
          int v38 = v0 + v37;
          v36 = v38;
        } else {
          v36 = v0;
        }
        int v39 = 4;
        int v40 = v0 + v39;
        int v41 = 1;
        int v42 = v28 + v41;
        v27 = v36;
        v28 = v42;
      }
      int v43 = 2;
      int v44 = v0 + v43;
      v9 = v27;
      break;
    }
    case 2:
      {
      int v45 = 0;
      bool v46 = v2 != v45;
      int v47;
      if (v46) {
        v47 = v0;
      } else {
        v47 = v0;
      }
      int v48 = 1;
      int v49 = v0 + v48;
      v9 = v47;
      break;
    }
    default:
      {
      int v50 = 0;
      int v51 = v0 + v50;
      v9 = v51;
      break;
    }
  }
  bool v52 = true;
  int v53 = simt_wave_count_bits(v52);
  int v54 = 0;
  int v55 = v54 + v0;
  v1[v55] = v53;
  int v56 = 0;
  bool v57 = v2 != v56;
  int v58 = v57 ? v4 : v9;
  return;
}

kernel void kernel_main(device int* v59 [[buffer(0)]], device int* v60 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v61 = static_cast<int>(__simt_tid3.x);
  int v62 = 0;
  int v63 = v62 + v61;
  int v64 = v60[v63];
  int v65 = 4;
  int v66 = v65 + v61;
  int v67 = v60[v66];
  helper0(v61, v59, v64, v67, static_cast<int>(__simt_tid3.x));
  int v68 = 8;
  int v69 = v68 + v61;
  int v70 = v60[v69];
  uint v71 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v72 = (int)(v71);
  int v73;
  v73 = v72;
  switch (v70) {
    default:
      {
      int v74 = 0;
      int v75 = 0;
      int v76;
      int v77;
      v76 = v74;
      v77 = v75;
      while (true) {
        int v78 = 4;
        int v79 = v77 * v78;
        int v80 = v79 + v61;
        int v81 = 12;
        int v82 = v81 + v80;
        int v83 = v60[v82];
        int v84 = 0;
        bool v85 = v83 != v84;
        v76 = v76;
        v77 = v77;
        if (!v85) break;
        int v86 = v76 + v77;
        int v87 = 1;
        int v88 = v77 + v87;
        v76 = v86;
        v77 = v88;
      }
      bool v89 = true;
      v73 = v76;
      break;
    }
    case 0:
      {
      int v90 = 32;
      int v91 = v90 + v61;
      int v92 = v60[v91];
      int v93;
      v93 = v61;
      switch (v92) {
        default:
          {
          int v94 = 36;
          int v95 = v94 + v61;
          int v96 = v60[v95];
          int v97 = 1;
          int v98;
          v98 = v97;
          switch (v96) {
            case 0:
              {
              int v99 = 3;
              int v100 = v61 + v99;
              v98 = v100;
            }
            default:
              {
              int v101 = 2;
              v98 = v101;
              break;
            }
          }
          bool v102 = true;
          v93 = v98;
        }
        case 0:
          {
          int v103 = 40;
          int v104 = v103 + v61;
          int v105 = v60[v104];
          int v106 = 0;
          bool v107 = v105 != v106;
          int v108;
          if (v107) {
            int v109 = 3;
            int v110 = v61 + v109;
            v108 = v110;
          } else {
            int v111 = 2;
            v108 = v111;
          }
          v93 = v108;
        }
        case 1:
          {
          int v112 = 0;
          int v113 = 0;
          int v114;
          int v115;
          v114 = v112;
          v115 = v113;
          while (true) {
            int v116 = 4;
            int v117 = v115 * v116;
            int v118 = v117 + v61;
            int v119 = 44;
            int v120 = v119 + v118;
            int v121 = v60[v120];
            int v122 = 0;
            bool v123 = v121 != v122;
            v114 = v114;
            v115 = v115;
            if (!v123) break;
            int v124 = v114 + v115;
            int v125 = 1;
            int v126 = v115 + v125;
            v114 = v124;
            v115 = v126;
          }
          bool v127 = true;
          v93 = v114;
          break;
        }
        case 2:
          {
          int v128 = 4;
          v93 = v128;
          break;
        }
      }
      bool v129 = true;
      v73 = v93;
      break;
    }
  }
  bool v130 = true;
  int v131 = 16;
  int v132 = v131 + v61;
  bool v133 = true;
  int v134 = simt_wave_count_bits(v133);
  v59[v132] = v134;
  int v135 = 0;
  int v136 = 0;
  int v137;
  int v138;
  v137 = v135;
  v138 = v136;
  while (true) {
    int v139 = 4;
    int v140 = v138 * v139;
    int v141 = v140 + v61;
    int v142 = 64;
    int v143 = v142 + v141;
    int v144 = v60[v143];
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
  int v151 = 32;
  int v152 = v151 + v61;
  bool v153 = true;
  int v154 = simt_wave_count_bits(v153);
  v59[v152] = v154;
  int v155 = 84;
  int v156 = v155 + v61;
  int v157 = v60[v156];
  int v158 = 0;
  bool v159 = v157 != v158;
  int v160;
  if (v159) {
    int v161 = 88;
    int v162 = v161 + v61;
    int v163 = v60[v162];
    int v164 = 0;
    bool v165 = v163 != v164;
    int v166;
    if (v165) {
      int v167 = 92;
      int v168 = v167 + v61;
      int v169 = v60[v168];
      uint v170 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v171 = (int)(v170);
      int v172;
      v172 = v171;
      switch (v169) {
        default:
          {
          int v173 = 1;
          v172 = v173;
        }
        case 0:
          {
          v172 = v61;
          break;
        }
      }
      bool v174 = true;
      v166 = v172;
    } else {
      uint v175 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v176 = (int)(v175);
      v166 = v176;
    }
    v160 = v166;
  } else {
    v160 = v61;
  }
  int v177 = 48;
  int v178 = v177 + v61;
  bool v179 = true;
  int v180 = simt_wave_count_bits(v179);
  v59[v178] = v180;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
