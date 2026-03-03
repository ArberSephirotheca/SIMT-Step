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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 3;
  int v9 = v3 % v8;
  int v10 = 3;
  int v11;
  v11 = v10;
  switch (v9) {
    case 0:
      {
      int v12 = 2;
      int v13 = v3 % v12;
      int v14 = 2;
      int v15;
      v15 = v14;
      switch (v13) {
        case 0:
          {
          int v16 = 0;
          int v17 = 0;
          int v18;
          int v19;
          v18 = v16;
          v19 = v17;
          while (true) {
            int v20 = 4;
            int v21 = v3 % v20;
            int v22 = 1;
            int v23 = v21 + v22;
            bool v24 = v19 < v23;
            v18 = v18;
            v19 = v19;
            if (!v24) break;
            int v25 = 2;
            int v26 = v0 + v25;
            int v27 = 1;
            int v28 = v19 + v27;
            v18 = v26;
            v19 = v28;
          }
          v15 = v18;
          break;
        }
        default:
          {
          int v29 = 0;
          int v30 = 0;
          int v31;
          int v32;
          v31 = v29;
          v32 = v30;
          while (true) {
            int v33 = 4;
            int v34 = v3 % v33;
            int v35 = 1;
            int v36 = v34 + v35;
            bool v37 = v32 < v36;
            v31 = v31;
            v32 = v32;
            if (!v37) break;
            int v38 = 2;
            int v39 = 1;
            int v40 = v32 + v39;
            v31 = v38;
            v32 = v40;
          }
          v15 = v31;
        }
        case 1:
          {
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
            int v51 = v0 + v50;
            int v52 = 1;
            int v53 = v44 + v52;
            v43 = v51;
            v44 = v53;
          }
          v15 = v43;
          break;
        }
      }
      int v54 = 3;
      v11 = v15;
      break;
    }
    default:
      {
      v11 = v0;
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
        int v60 = 0;
        int v61 = v0 + v60;
        int v62;
        v62 = v61;
        switch (v59) {
          default:
            {
            v62 = v0;
            break;
          }
          case 0:
            {
            v62 = v0;
            break;
          }
          case 1:
            {
            int v63 = 1;
            int v64 = v0 + v63;
            v62 = v64;
            break;
          }
        }
        v57 = v62;
      } else {
        int v65 = 2;
        int v66 = v3 % v65;
        int v67 = 2;
        int v68 = v0 + v67;
        int v69;
        v69 = v68;
        switch (v66) {
          case 0:
            {
            int v70 = 4;
            v69 = v70;
            break;
          }
          default:
            {
            v69 = v0;
            break;
          }
          case 1:
            {
            int v71 = 3;
            int v72 = v0 + v71;
            v69 = v72;
            break;
          }
        }
        v57 = v69;
      }
      v11 = v57;
      break;
    }
    case 2:
      {
      int v73;
      v73 = v0;
      switch (v3) {
        case 0:
          {
          int v74 = 0;
          bool v75 = v2 != v74;
          int v76;
          if (v75) {
            int v77 = 1;
            int v78 = v0 + v77;
            v76 = v78;
          } else {
            int v79 = 1;
            int v80 = v0 + v79;
            v76 = v80;
          }
          v73 = v76;
          break;
        }
        default:
          {
          int v81 = 0;
          int v82 = 0;
          int v83;
          int v84;
          v83 = v81;
          v84 = v82;
          while (true) {
            int v85 = 4;
            int v86 = v3 % v85;
            int v87 = 1;
            int v88 = v86 + v87;
            bool v89 = v84 < v88;
            v83 = v83;
            v84 = v84;
            if (!v89) break;
            int v90 = 2;
            int v91 = 1;
            int v92 = v84 + v91;
            v83 = v90;
            v84 = v92;
          }
          v73 = v83;
          break;
        }
      }
      int v93 = 1;
      v11 = v73;
      break;
    }
  }
  bool v94 = true;
  int v95 = simt_wave_count_bits(v94);
  int v96 = 16;
  int v97 = v96 + v0;
  v1[v97] = v95;
  int v98 = 0;
  bool v99 = v2 != v98;
  int v100 = v99 ? v5 : v11;
  return;
}

kernel void kernel_main(device int* v101 [[buffer(0)]], device int* v102 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v103 = static_cast<int>(__simt_tid3.x);
  int v104 = 0;
  int v105 = v104 + v103;
  int v106 = v102[v105];
  int v107 = 4;
  int v108 = v107 + v103;
  int v109 = v102[v108];
  int v110 = 0;
  bool v111 = v106 != v110;
  if (v111) {
  } else {
    int v112 = 8;
    int v113 = v112 + v103;
    int v114 = v102[v113];
    int v115 = 0;
    bool v116 = v114 != v115;
    if (v116) {
    } else {
      helper0(v103, v101, v106, v109, static_cast<int>(__simt_tid3.x));
    }
  }
  int v117 = 12;
  int v118 = v117 + v103;
  int v119 = v102[v118];
  uint v120 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v121 = (int)(v120);
  int v122;
  v122 = v121;
  switch (v119) {
    default:
      {
      int v123 = 16;
      int v124 = v123 + v103;
      int v125 = v102[v124];
      int v126 = 2;
      int v127 = v103 + v126;
      int v128;
      v128 = v127;
      switch (v125) {
        default:
          {
          v128 = v103;
        }
        case 0:
          {
          int v129 = 1;
          v128 = v129;
          break;
        }
        case 1:
          {
          int v130 = 0;
          v128 = v130;
          break;
        }
      }
      v122 = v128;
      break;
    }
    case 0:
      {
      int v131 = 0;
      int v132 = 0;
      int v133;
      int v134;
      v133 = v131;
      v134 = v132;
      while (true) {
        int v135 = 4;
        int v136 = v134 * v135;
        int v137 = v136 + v103;
        int v138 = 20;
        int v139 = v138 + v137;
        int v140 = v102[v139];
        int v141 = 0;
        bool v142 = v140 != v141;
        v133 = v133;
        v134 = v134;
        if (!v142) break;
        int v143 = v133 + v134;
        int v144 = 1;
        int v145 = v134 + v144;
        bool v146 = true;
        v133 = v143;
        v134 = v145;
        break;
        ;
      }
      v122 = v133;
      break;
    }
    case 1:
      {
      int v147 = 40;
      int v148 = v147 + v103;
      int v149 = v102[v148];
      int v150 = 0;
      bool v151 = v149 != v150;
      int v152;
      if (v151) {
        int v153 = 44;
        int v154 = v153 + v103;
        int v155 = v102[v154];
        int v156 = 0;
        bool v157 = v155 != v156;
        int v158;
        if (v157) {
          int v159 = 4;
          v158 = v159;
        } else {
          v158 = v103;
        }
        v152 = v158;
      } else {
        int v160 = 2;
        v152 = v160;
      }
      v122 = v152;
      break;
    }
    case 2:
      {
      int v161 = 48;
      int v162 = v161 + v103;
      int v163 = v102[v162];
      int v164 = 0;
      bool v165 = v163 != v164;
      int v166;
      if (v165) {
        int v167 = 52;
        int v168 = v167 + v103;
        int v169 = v102[v168];
        int v170;
        v170 = v103;
        switch (v169) {
          case 0:
            {
            v170 = v103;
          }
          default:
            {
            int v171 = 4;
            v170 = v171;
            break;
          }
        }
        v166 = v170;
      } else {
        int v172 = 4;
        int v173 = v103 + v172;
        v166 = v173;
      }
      v122 = v166;
      break;
    }
  }
  int v174 = 56;
  int v175 = v174 + v103;
  int v176 = v102[v175];
  int v177 = 0;
  bool v178 = v176 != v177;
  int v179;
  if (v178) {
    int v180 = 4;
    v179 = v180;
  } else {
    uint v181 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v182 = (int)(v181);
    v179 = v182;
  }
  int v183 = 32;
  int v184 = v183 + v103;
  bool v185 = true;
  int v186 = simt_wave_count_bits(v185);
  v101[v184] = v186;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 60; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
