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
    default:
      {
      int v7 = 0;
      int v8 = 0;
      int v9;
      int v10;
      v9 = v7;
      v10 = v8;
      while (true) {
        int v11 = 4;
        int v12 = v3 % v11;
        int v13 = 1;
        int v14 = v12 + v13;
        bool v15 = v10 < v14;
        v9 = v9;
        v10 = v10;
        if (!v15) break;
        int v16 = 0;
        bool v17 = v2 != v16;
        int v18;
        if (v17) {
          v18 = v0;
        } else {
          int v19 = 3;
          int v20 = v0 + v19;
          v18 = v20;
        }
        int v21 = 1;
        int v22 = v10 + v21;
        v9 = v18;
        v10 = v22;
      }
      v6 = v9;
      break;
    }
    case 0:
      {
      int v23 = 0;
      bool v24 = v2 != v23;
      int v25;
      if (v24) {
        int v26 = 2;
        int v27 = v3 % v26;
        int v28 = 1;
        int v29 = v0 + v28;
        int v30;
        v30 = v29;
        switch (v27) {
          case 0:
            {
            v30 = v0;
            break;
          }
          case 1:
            {
            int v31 = 2;
            int v32 = v0 + v31;
            v30 = v32;
            break;
          }
          default:
            {
            v30 = v0;
            break;
          }
        }
        v25 = v30;
      } else {
        int v33 = 1;
        int v34 = v0 + v33;
        int v35;
        v35 = v34;
        switch (v3) {
          default:
            {
            v35 = v0;
            break;
          }
          case 0:
            {
            int v36 = 4;
            v35 = v36;
            break;
          }
        }
        int v37 = 1;
        v25 = v35;
      }
      v6 = v25;
      break;
    }
  }
  bool v38 = true;
  int v39 = simt_wave_count_bits(v38);
  int v40 = 0;
  int v41 = v40 + v0;
  v1[v41] = v39;
  return;
}

kernel void kernel_main(device int* v42 [[buffer(0)]], device int* v43 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v44 = static_cast<int>(__simt_tid3.x);
  int v45 = 0;
  int v46 = v45 + v44;
  int v47 = v43[v46];
  int v48 = 4;
  int v49 = v48 + v44;
  int v50 = v43[v49];
  helper0(v44, v42, v47, v50, static_cast<int>(__simt_tid3.x));
  int v51 = 8;
  int v52 = v51 + v44;
  int v53 = v43[v52];
  uint v54 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v55 = (int)(v54);
  int v56;
  v56 = v55;
  switch (v53) {
    case 0:
      {
      int v57 = 12;
      int v58 = v57 + v44;
      int v59 = v43[v58];
      int v60 = 0;
      bool v61 = v59 != v60;
      int v62;
      if (v61) {
        int v63 = 16;
        int v64 = v63 + v44;
        int v65 = v43[v64];
        int v66 = 0;
        bool v67 = v65 != v66;
        int v68;
        if (v67) {
          int v69 = 2;
          int v70 = v44 + v69;
          v68 = v70;
        } else {
          v68 = v44;
        }
        v62 = v68;
      } else {
        int v71 = 20;
        int v72 = v71 + v44;
        int v73 = v43[v72];
        int v74 = 2;
        int v75 = v44 + v74;
        int v76;
        v76 = v75;
        switch (v73) {
          default:
            {
            int v77 = 2;
            v76 = v77;
            break;
          }
          case 0:
            {
            int v78 = 3;
            int v79 = v44 + v78;
            v76 = v79;
          }
          case 1:
            {
            int v80 = 4;
            v76 = v80;
            break;
          }
        }
        bool v81 = true;
        v62 = v76;
      }
      v56 = v62;
    }
    default:
      {
      int v82 = 0;
      int v83 = 0;
      int v84;
      int v85;
      v84 = v82;
      v85 = v83;
      while (true) {
        int v86 = 4;
        int v87 = v85 * v86;
        int v88 = v87 + v44;
        int v89 = 24;
        int v90 = v89 + v88;
        int v91 = v43[v90];
        int v92 = 0;
        bool v93 = v91 != v92;
        v84 = v84;
        v85 = v85;
        if (!v93) break;
        int v94 = 2;
        int v95 = v84 + v94;
        int v96 = 1;
        int v97 = v85 + v96;
        bool v98 = true;
        v84 = v95;
        v85 = v97;
      }
      v56 = v84;
      break;
    }
  }
  int v99 = 44;
  int v100 = v99 + v44;
  int v101 = v43[v100];
  uint v102 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v103 = (int)(v102);
  int v104;
  v104 = v103;
  switch (v101) {
    case 0:
      {
      int v105 = 48;
      int v106 = v105 + v44;
      int v107 = v43[v106];
      int v108 = 0;
      bool v109 = v107 != v108;
      int v110;
      if (v109) {
        int v111 = 52;
        int v112 = v111 + v44;
        int v113 = v43[v112];
        int v114 = 0;
        bool v115 = v113 != v114;
        int v116;
        if (v115) {
          v116 = v44;
        } else {
          int v117 = 4;
          v116 = v117;
        }
        v110 = v116;
      } else {
        int v118 = 0;
        int v119 = v44 + v118;
        v110 = v119;
      }
      v104 = v110;
      break;
    }
    default:
      {
      int v120 = 56;
      int v121 = v120 + v44;
      int v122 = v43[v121];
      int v123 = 2;
      int v124;
      v124 = v123;
      switch (v122) {
        case 0:
          {
          int v125 = 0;
          int v126 = 0;
          int v127;
          int v128;
          v127 = v125;
          v128 = v126;
          while (true) {
            int v129 = 4;
            int v130 = v128 * v129;
            int v131 = v130 + v44;
            int v132 = 60;
            int v133 = v132 + v131;
            int v134 = v43[v133];
            int v135 = 0;
            bool v136 = v134 != v135;
            v127 = v127;
            v128 = v128;
            if (!v136) break;
            int v137 = v127 + v128;
            int v138 = 1;
            int v139 = v128 + v138;
            bool v140 = true;
            v127 = v137;
            v128 = v139;
          }
          v124 = v127;
          break;
        }
        default:
          {
          int v141 = 80;
          int v142 = v141 + v44;
          int v143 = v43[v142];
          int v144 = 2;
          int v145;
          v145 = v144;
          switch (v143) {
            default:
              {
              int v146 = 0;
              int v147 = v44 + v146;
              v145 = v147;
              break;
            }
            case 0:
              {
              int v148 = 4;
              v145 = v148;
              break;
            }
          }
          v124 = v145;
          break;
        }
        case 1:
          {
          int v149 = 0;
          int v150 = 0;
          int v151;
          int v152;
          v151 = v149;
          v152 = v150;
          while (true) {
            int v153 = 4;
            int v154 = v152 * v153;
            int v155 = v154 + v44;
            int v156 = 84;
            int v157 = v156 + v155;
            int v158 = v43[v157];
            int v159 = 0;
            bool v160 = v158 != v159;
            v151 = v151;
            v152 = v152;
            if (!v160) break;
            int v161 = v151 + v152;
            int v162 = 1;
            int v163 = v152 + v162;
            bool v164 = true;
            v151 = v161;
            v152 = v163;
            continue;
            ;
          }
          v124 = v151;
          break;
        }
      }
      bool v165 = true;
      v104 = v124;
      break;
    }
    case 1:
      {
      int v166 = 0;
      int v167 = v44 + v166;
      v104 = v167;
      break;
    }
    case 2:
      {
      int v168 = 104;
      int v169 = v168 + v44;
      int v170 = v43[v169];
      int v171 = 0;
      bool v172 = v170 != v171;
      int v173;
      if (v172) {
        int v174 = 108;
        int v175 = v174 + v44;
        int v176 = v43[v175];
        int v177 = 0;
        bool v178 = v176 != v177;
        int v179;
        if (v178) {
          v179 = v44;
        } else {
          v179 = v44;
        }
        v173 = v179;
      } else {
        int v180 = 112;
        int v181 = v180 + v44;
        int v182 = v43[v181];
        int v183 = 0;
        bool v184 = v182 != v183;
        int v185;
        if (v184) {
          v185 = v44;
        } else {
          int v186 = 3;
          v185 = v186;
        }
        v173 = v185;
      }
      v104 = v173;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 116; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
