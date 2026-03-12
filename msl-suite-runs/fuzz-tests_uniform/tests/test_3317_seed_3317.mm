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
    int v13 = 4;
    int v14 = 1;
    int v15 = v7 + v14;
    v6 = v13;
    v7 = v15;
  }
  bool v16 = true;
  int v17 = simt_wave_count_bits(v16);
  int v18 = 0;
  int v19 = v18 + v0;
  v1[v19] = v17;
  int v20 = 3;
  int v21 = v3 % v20;
  uint v22 = simt_lane_id(__simt_tid);
  int v23 = (int)(v22);
  int v24;
  v24 = v23;
  switch (v21) {
    default:
      {
      int v25 = 0;
      bool v26 = v2 != v25;
      int v27;
      if (v26) {
        int v28 = 0;
        int v29 = 0;
        int v30;
        int v31;
        v30 = v28;
        v31 = v29;
        while (true) {
          int v32 = 4;
          int v33 = v3 % v32;
          int v34 = 1;
          int v35 = v33 + v34;
          bool v36 = v31 < v35;
          v30 = v30;
          v31 = v31;
          if (!v36) break;
          int v37 = 1;
          int v38 = 1;
          int v39 = v31 + v38;
          v30 = v37;
          v31 = v39;
        }
        int v40 = 2;
        int v41 = v0 + v40;
        v27 = v30;
      } else {
        v27 = v0;
      }
      v24 = v27;
      break;
    }
    case 0:
      {
      int v42 = 0;
      bool v43 = v2 != v42;
      int v44;
      if (v43) {
        int v45 = 3;
        int v46 = v3 % v45;
        int v47 = 1;
        int v48;
        v48 = v47;
        switch (v46) {
          default:
            {
            int v49 = 3;
            int v50 = v0 + v49;
            v48 = v50;
            break;
          }
          case 0:
            {
            int v51 = 4;
            int v52 = v0 + v51;
            v48 = v52;
            break;
          }
          case 1:
            {
            v48 = v0;
            break;
          }
          case 2:
            {
            v48 = v0;
            break;
          }
        }
        int v53 = 3;
        int v54 = v0 + v53;
        v44 = v48;
      } else {
        int v55 = 2;
        int v56 = v3 % v55;
        int v57 = 1;
        int v58;
        v58 = v57;
        switch (v56) {
          default:
            {
            int v59 = 3;
            v58 = v59;
          }
          case 0:
            {
            int v60 = 0;
            v58 = v60;
            break;
          }
        }
        int v61 = 3;
        v44 = v58;
      }
      int v62 = 1;
      int v63 = v0 + v62;
      v24 = v44;
      break;
    }
    case 1:
      {
      int v64 = 4;
      int v65 = v3 % v64;
      int v66 = 3;
      int v67 = v0 + v66;
      int v68;
      v68 = v67;
      switch (v65) {
        default:
          {
          int v69 = 0;
          bool v70 = v2 != v69;
          int v71;
          if (v70) {
            v71 = v0;
          } else {
            v71 = v0;
          }
          v68 = v71;
          break;
        }
        case 0:
          {
          int v72 = 4;
          v68 = v72;
          break;
        }
        case 1:
          {
          int v73 = 1;
          v68 = v73;
          break;
        }
        case 2:
          {
          int v74 = 0;
          bool v75 = v2 != v74;
          int v76;
          if (v75) {
            int v77 = 2;
            v76 = v77;
          } else {
            int v78 = 3;
            v76 = v78;
          }
          int v79 = 3;
          v68 = v76;
          break;
        }
      }
      int v80 = 1;
      int v81 = v0 + v80;
      v24 = v68;
      break;
    }
    case 2:
      {
      int v82 = 0;
      bool v83 = v2 != v82;
      int v84;
      if (v83) {
        int v85 = 0;
        bool v86 = v2 != v85;
        int v87;
        if (v86) {
          int v88 = 1;
          v87 = v88;
        } else {
          v87 = v0;
        }
        int v89 = 3;
        v84 = v87;
      } else {
        int v90 = 2;
        v84 = v90;
      }
      int v91 = 4;
      int v92 = v0 + v91;
      v24 = v84;
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
  int v99 = v98 ? v6 : v24;
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
  uint v109 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v110 = (int)(v109);
  int v111 = 8;
  int v112 = v111 + v102;
  int v113 = v101[v112];
  int v114;
  v114 = v102;
  switch (v113) {
    case 0:
      {
      int v115 = 12;
      int v116 = v115 + v102;
      int v117 = v101[v116];
      int v118 = 0;
      int v119 = v102 + v118;
      int v120;
      v120 = v119;
      switch (v117) {
        case 0:
          {
          int v121 = 0;
          int v122 = 0;
          int v123;
          int v124;
          v123 = v121;
          v124 = v122;
          while (true) {
            int v125 = 4;
            int v126 = v124 * v125;
            int v127 = v126 + v102;
            int v128 = 16;
            int v129 = v128 + v127;
            int v130 = v101[v129];
            int v131 = 0;
            bool v132 = v130 != v131;
            v123 = v123;
            v124 = v124;
            if (!v132) break;
            int v133 = v123 + v124;
            int v134 = 1;
            int v135 = v124 + v134;
            v123 = v133;
            v124 = v135;
            continue;
            ;
          }
          bool v136 = true;
          v120 = v123;
          break;
        }
        default:
          {
          v120 = v102;
          break;
        }
      }
      bool v137 = true;
      v114 = v120;
      break;
    }
    default:
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
        int v144 = v143 + v102;
        int v145 = 36;
        int v146 = v145 + v144;
        int v147 = v101[v146];
        int v148 = 0;
        bool v149 = v147 != v148;
        v140 = v140;
        v141 = v141;
        if (!v149) break;
        int v150 = v140 + v141;
        int v151 = 1;
        int v152 = v141 + v151;
        v140 = v150;
        v141 = v152;
        break;
        ;
      }
      bool v153 = true;
      v114 = v140;
      break;
    }
    case 1:
      {
      int v154 = 3;
      int v155 = v102 + v154;
      v114 = v155;
      break;
    }
    case 2:
      {
      int v156 = 56;
      int v157 = v156 + v102;
      int v158 = v101[v157];
      int v159 = 2;
      int v160 = v102 + v159;
      int v161;
      v161 = v160;
      switch (v158) {
        default:
          {
          int v162 = 1;
          int v163 = v102 + v162;
          v161 = v163;
          break;
        }
        case 0:
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
            int v170 = v169 + v102;
            int v171 = 60;
            int v172 = v171 + v170;
            int v173 = v101[v172];
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
            break;
            ;
          }
          bool v179 = true;
          v161 = v166;
          break;
        }
      }
      bool v180 = true;
      v114 = v161;
      break;
    }
  }
  bool v181 = true;
  int v182 = 32;
  int v183 = v182 + v102;
  bool v184 = true;
  int v185 = simt_wave_count_bits(v184);
  v100[v183] = v185;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
