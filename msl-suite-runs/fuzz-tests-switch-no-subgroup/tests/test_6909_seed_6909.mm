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
    int v7 = 3;
    int v8 = v3 % v7;
    int v9;
    v9 = v0;
    switch (v8) {
      case 0:
        {
        int v10 = 0;
        int v11 = 0;
        int v12;
        int v13;
        v12 = v10;
        v13 = v11;
        while (true) {
          int v14 = 4;
          int v15 = v3 % v14;
          int v16 = 1;
          int v17 = v15 + v16;
          bool v18 = v13 < v17;
          v12 = v12;
          v13 = v13;
          if (!v18) break;
          int v19 = 2;
          int v20 = v0 + v19;
          int v21 = 1;
          int v22 = v13 + v21;
          v12 = v20;
          v13 = v22;
          continue;
          ;
        }
        v9 = v12;
        break;
      }
      default:
        {
        int v23 = 3;
        int v24 = v3 % v23;
        int v25 = 2;
        int v26 = v0 + v25;
        int v27;
        v27 = v26;
        switch (v24) {
          default:
            {
            int v28 = 4;
            int v29 = v0 + v28;
            v27 = v29;
            break;
          }
          case 0:
            {
            int v30 = 4;
            v27 = v30;
            break;
          }
          case 1:
            {
            int v31 = 2;
            v27 = v31;
            break;
          }
          case 2:
            {
            v27 = v0;
            break;
          }
        }
        int v32 = 4;
        int v33 = v0 + v32;
        v9 = v27;
        break;
      }
      case 1:
        {
        int v34 = 0;
        int v35 = 0;
        int v36;
        int v37;
        v36 = v34;
        v37 = v35;
        while (true) {
          int v38 = 4;
          int v39 = v3 % v38;
          int v40 = 1;
          int v41 = v39 + v40;
          bool v42 = v37 < v41;
          v36 = v36;
          v37 = v37;
          if (!v42) break;
          int v43 = 0;
          int v44 = 1;
          int v45 = v37 + v44;
          v36 = v43;
          v37 = v45;
          break;
          ;
        }
        v9 = v36;
        break;
      }
      case 2:
        {
        int v46 = 0;
        bool v47 = v2 != v46;
        int v48;
        if (v47) {
          v48 = v0;
        } else {
          int v49 = 1;
          int v50 = v0 + v49;
          v48 = v50;
        }
        v9 = v48;
        break;
      }
    }
    bool v51 = true;
    int v52 = simt_wave_count_bits(v51);
    int v53 = 0;
    int v54 = v53 + v0;
    v1[v54] = v52;
    v6 = v9;
  } else {
    int v55 = 0;
    bool v56 = v2 != v55;
    int v57;
    if (v56) {
      bool v58 = true;
      int v59 = simt_wave_count_bits(v58);
      int v60 = 16;
      int v61 = v60 + v0;
      v1[v61] = v59;
      v57 = v59;
    } else {
      int v62 = 3;
      int v63 = v3 % v62;
      uint v64 = simt_lane_id(__simt_tid);
      int v65 = (int)(v64);
      int v66;
      v66 = v65;
      switch (v63) {
        case 0:
          {
          int v67 = 2;
          v66 = v67;
          break;
        }
        default:
          {
          int v68 = 0;
          v66 = v68;
          break;
        }
        case 1:
          {
          v66 = v0;
        }
        case 2:
          {
          v66 = v0;
          break;
        }
      }
      v57 = v66;
    }
    v6 = v57;
  }
  return;
}

kernel void kernel_main(device int* v69 [[buffer(0)]], device int* v70 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v71 = static_cast<int>(__simt_tid3.x);
  int v72 = 0;
  int v73 = v72 + v71;
  int v74 = v70[v73];
  int v75 = 4;
  int v76 = v75 + v71;
  int v77 = v70[v76];
  helper0(v71, v69, v74, v77, static_cast<int>(__simt_tid3.x));
  uint v78 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v79 = (int)(v78);
  int v80 = 8;
  int v81 = v80 + v71;
  int v82 = v70[v81];
  int v83 = 0;
  bool v84 = v82 != v83;
  int v85;
  if (v84) {
    int v86 = 1;
    v85 = v86;
  } else {
    v85 = v71;
  }
  int v87 = 32;
  int v88 = v87 + v71;
  bool v89 = true;
  int v90 = simt_wave_count_bits(v89);
  v69[v88] = v90;
  int v91 = 12;
  int v92 = v91 + v71;
  int v93 = v70[v92];
  int v94 = 0;
  bool v95 = v93 != v94;
  int v96;
  if (v95) {
    v96 = v71;
  } else {
    int v97 = 0;
    int v98 = 0;
    int v99;
    int v100;
    v99 = v97;
    v100 = v98;
    while (true) {
      int v101 = 4;
      int v102 = v100 * v101;
      int v103 = v102 + v71;
      int v104 = 16;
      int v105 = v104 + v103;
      int v106 = v70[v105];
      int v107 = 0;
      bool v108 = v106 != v107;
      v99 = v99;
      v100 = v100;
      if (!v108) break;
      int v109 = v99 + v100;
      int v110 = 1;
      int v111 = v100 + v110;
      bool v112 = true;
      int v113 = 48;
      int v114 = 4;
      int v115 = v100 * v114;
      int v116 = v113 + v115;
      int v117 = v116 + v71;
      bool v118 = true;
      int v119 = simt_wave_count_bits(v118);
      v69[v117] = v119;
      v99 = v109;
      v100 = v111;
      continue;
      ;
    }
    v96 = v99;
  }
  int v120 = 64;
  int v121 = v120 + v71;
  bool v122 = true;
  int v123 = simt_wave_count_bits(v122);
  v69[v121] = v123;
  int v124 = 36;
  int v125 = v124 + v71;
  int v126 = v70[v125];
  int v127 = 3;
  int v128 = v71 + v127;
  int v129;
  v129 = v128;
  switch (v126) {
    case 0:
      {
      int v130 = 40;
      int v131 = v130 + v71;
      int v132 = v70[v131];
      int v133 = 3;
      int v134;
      v134 = v133;
      switch (v132) {
        default:
          {
          int v135 = 44;
          int v136 = v135 + v71;
          int v137 = v70[v136];
          int v138 = 0;
          bool v139 = v137 != v138;
          int v140;
          if (v139) {
            int v141 = 1;
            int v142 = v71 + v141;
            v140 = v142;
          } else {
            v140 = v71;
          }
          v134 = v140;
        }
        case 0:
          {
          int v143 = 48;
          int v144 = v143 + v71;
          int v145 = v70[v144];
          int v146 = 0;
          bool v147 = v145 != v146;
          int v148;
          if (v147) {
            int v149 = 3;
            v148 = v149;
          } else {
            v148 = v71;
          }
          v134 = v148;
          break;
        }
      }
      v129 = v134;
      break;
    }
    default:
      {
      int v150 = 52;
      int v151 = v150 + v71;
      int v152 = v70[v151];
      int v153;
      v153 = v71;
      switch (v152) {
        case 0:
          {
          int v154 = 56;
          int v155 = v154 + v71;
          int v156 = v70[v155];
          int v157 = 0;
          bool v158 = v156 != v157;
          int v159;
          if (v158) {
            int v160 = 3;
            v159 = v160;
          } else {
            int v161 = 2;
            int v162 = v71 + v161;
            v159 = v162;
          }
          v153 = v159;
          break;
        }
        case 1:
          {
          v153 = v71;
        }
        default:
          {
          int v163 = 0;
          int v164 = 0;
          int v165;
          int v166;
          v165 = v163;
          v166 = v164;
          while (true) {
            int v167 = 4;
            int v168 = v166 * v167;
            int v169 = v168 + v71;
            int v170 = 60;
            int v171 = v170 + v169;
            int v172 = v70[v171];
            int v173 = 0;
            bool v174 = v172 != v173;
            v165 = v165;
            v166 = v166;
            if (!v174) break;
            int v175 = v165 + v166;
            int v176 = 1;
            int v177 = v166 + v176;
            bool v178 = true;
            v165 = v175;
            v166 = v177;
          }
          v153 = v165;
          break;
        }
      }
      v129 = v153;
      break;
    }
  }
  bool v179 = true;
  int v180 = 80;
  int v181 = v180 + v71;
  bool v182 = true;
  int v183 = simt_wave_count_bits(v182);
  v69[v181] = v183;
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
    static int32_t expected0[] = {static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
