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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
  int v6;
  v6 = v5;
  switch (v3) {
    case 0:
      {
      v6 = v0;
      break;
    }
    default:
      {
      int v7 = 2;
      int v8 = v0 + v7;
      v6 = v8;
      break;
    }
  }
  bool v9 = true;
  int v10 = simt_wave_count_bits(v9);
  int v11 = 0;
  int v12 = v11 + v0;
  v1[v12] = v10;
  int v13 = 2;
  int v14 = v3 % v13;
  uint v15 = simt_lane_id(__simt_tid);
  int v16 = (int)(v15);
  int v17;
  v17 = v16;
  switch (v14) {
    default:
      {
      int v18 = 3;
      int v19 = v3 % v18;
      int v20;
      v20 = v0;
      switch (v19) {
        default:
          {
          int v21 = 4;
          int v22 = v3 % v21;
          int v23 = 1;
          int v24;
          v24 = v23;
          switch (v22) {
            case 0:
              {
              v24 = v0;
              break;
            }
            default:
              {
              int v25 = 1;
              int v26 = v0 + v25;
              v24 = v26;
              break;
            }
            case 1:
              {
              int v27 = 2;
              v24 = v27;
              break;
            }
            case 2:
              {
              int v28 = 4;
              int v29 = v0 + v28;
              v24 = v29;
              break;
            }
          }
          int v30 = 0;
          v20 = v24;
        }
        case 0:
          {
          v20 = v0;
        }
        case 1:
          {
          int v31 = 0;
          bool v32 = v2 != v31;
          int v33;
          if (v32) {
            v33 = v0;
          } else {
            int v34 = 4;
            int v35 = v0 + v34;
            v33 = v35;
          }
          v20 = v33;
          break;
        }
      }
      v17 = v20;
      break;
    }
    case 0:
      {
      int v36 = 0;
      int v37 = 0;
      int v38;
      int v39;
      v38 = v36;
      v39 = v37;
      while (true) {
        int v40 = 4;
        int v41 = v3 % v40;
        int v42 = 1;
        int v43 = v41 + v42;
        bool v44 = v39 < v43;
        v38 = v38;
        v39 = v39;
        if (!v44) break;
        int v45 = 4;
        int v46 = v3 % v45;
        int v47 = 2;
        int v48 = v0 + v47;
        int v49;
        v49 = v48;
        switch (v46) {
          case 0:
            {
            int v50 = 3;
            int v51 = v0 + v50;
            v49 = v51;
            break;
          }
          default:
            {
            v49 = v0;
            break;
          }
          case 1:
            {
            int v52 = 2;
            int v53 = v0 + v52;
            v49 = v53;
            break;
          }
          case 2:
            {
            v49 = v0;
            break;
          }
        }
        int v54 = 1;
        int v55 = v39 + v54;
        v38 = v49;
        v39 = v55;
      }
      v17 = v38;
      break;
    }
    case 1:
      {
      int v56 = 0;
      v17 = v56;
      break;
    }
  }
  bool v57 = true;
  int v58 = simt_wave_count_bits(v57);
  int v59 = 16;
  int v60 = v59 + v0;
  v1[v60] = v58;
  int v61 = 0;
  bool v62 = v2 != v61;
  int v63 = v62 ? v6 : v17;
  return;
}

kernel void kernel_main(device int* v64 [[buffer(0)]], device int* v65 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v66 = static_cast<int>(__simt_tid3.x);
  int v67 = 0;
  int v68 = v67 + v66;
  int v69 = v65[v68];
  int v70 = 4;
  int v71 = v70 + v66;
  int v72 = v65[v71];
  helper0(v66, v64, v69, v72, static_cast<int>(__simt_tid3.x));
  uint v73 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v74 = (int)(v73);
  int v75 = 0;
  int v76 = 0;
  int v77;
  int v78;
  v77 = v75;
  v78 = v76;
  while (true) {
    int v79 = 4;
    int v80 = v78 * v79;
    int v81 = v80 + v66;
    int v82 = 8;
    int v83 = v82 + v81;
    int v84 = v65[v83];
    int v85 = 0;
    bool v86 = v84 != v85;
    v77 = v77;
    v78 = v78;
    if (!v86) break;
    int v87 = v77 + v78;
    int v88 = 1;
    int v89 = v78 + v88;
    bool v90 = true;
    int v91 = 32;
    int v92 = 4;
    int v93 = v78 * v92;
    int v94 = v91 + v93;
    int v95 = v94 + v66;
    bool v96 = true;
    int v97 = simt_wave_count_bits(v96);
    v64[v95] = v97;
    v77 = v87;
    v78 = v89;
  }
  uint v98 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v99 = (int)(v98);
  int v100 = 28;
  int v101 = v100 + v66;
  int v102 = v65[v101];
  int v103 = 3;
  int v104;
  v104 = v103;
  switch (v102) {
    default:
      {
      int v105 = 0;
      int v106 = 0;
      int v107;
      int v108;
      v107 = v105;
      v108 = v106;
      while (true) {
        int v109 = 4;
        int v110 = v108 * v109;
        int v111 = v110 + v66;
        int v112 = 32;
        int v113 = v112 + v111;
        int v114 = v65[v113];
        int v115 = 0;
        bool v116 = v114 != v115;
        v107 = v107;
        v108 = v108;
        if (!v116) break;
        int v117 = 52;
        int v118 = v117 + v66;
        int v119 = v65[v118];
        int v120;
        v120 = v66;
        switch (v119) {
          case 0:
            {
            v120 = v66;
          }
          default:
            {
            int v121 = 0;
            int v122 = v66 + v121;
            v120 = v122;
            break;
          }
        }
        int v123 = v107 + v120;
        int v124 = 1;
        int v125 = v108 + v124;
        bool v126 = true;
        v107 = v123;
        v108 = v125;
      }
      v104 = v107;
      break;
    }
    case 0:
      {
      int v127 = 56;
      int v128 = v127 + v66;
      int v129 = v65[v128];
      int v130 = 0;
      bool v131 = v129 != v130;
      int v132;
      if (v131) {
        v132 = v66;
      } else {
        int v133 = 60;
        int v134 = v133 + v66;
        int v135 = v65[v134];
        int v136 = 0;
        bool v137 = v135 != v136;
        int v138;
        if (v137) {
          int v139 = 3;
          int v140 = v66 + v139;
          v138 = v140;
        } else {
          int v141 = 2;
          int v142 = v66 + v141;
          v138 = v142;
        }
        v132 = v138;
      }
      v104 = v132;
      break;
    }
    case 1:
      {
      int v143 = 64;
      int v144 = v143 + v66;
      int v145 = v65[v144];
      int v146 = 1;
      int v147;
      v147 = v146;
      switch (v145) {
        default:
          {
          int v148 = 68;
          int v149 = v148 + v66;
          int v150 = v65[v149];
          int v151 = 0;
          bool v152 = v150 != v151;
          int v153;
          if (v152) {
            int v154 = 4;
            int v155 = v66 + v154;
            v153 = v155;
          } else {
            int v156 = 4;
            v153 = v156;
          }
          v147 = v153;
          break;
        }
        case 0:
          {
          int v157 = 0;
          int v158 = 0;
          int v159;
          int v160;
          v159 = v157;
          v160 = v158;
          while (true) {
            int v161 = 4;
            int v162 = v160 * v161;
            int v163 = v162 + v66;
            int v164 = 72;
            int v165 = v164 + v163;
            int v166 = v65[v165];
            int v167 = 0;
            bool v168 = v166 != v167;
            v159 = v159;
            v160 = v160;
            if (!v168) break;
            int v169 = v159 + v160;
            int v170 = 1;
            int v171 = v160 + v170;
            bool v172 = true;
            v159 = v169;
            v160 = v171;
          }
          v147 = v159;
          break;
        }
        case 1:
          {
          int v173 = 92;
          int v174 = v173 + v66;
          int v175 = v65[v174];
          int v176 = 0;
          bool v177 = v175 != v176;
          int v178;
          if (v177) {
            int v179 = 3;
            int v180 = v66 + v179;
            v178 = v180;
          } else {
            int v181 = 2;
            v178 = v181;
          }
          v147 = v178;
          break;
        }
        case 2:
          {
          v147 = v66;
          break;
        }
      }
      v104 = v147;
      break;
    }
    case 2:
      {
      int v182 = 0;
      int v183 = v66 + v182;
      v104 = v183;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
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
