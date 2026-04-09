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
    int v13 = 1;
    int v14 = v0 + v13;
    int v15 = 1;
    int v16 = v7 + v15;
    v6 = v14;
    v7 = v16;
  }
  bool v17 = true;
  int v18 = simt_wave_count_bits(v17);
  int v19 = 0;
  int v20 = v19 + v0;
  v1[v20] = v18;
  int v21 = 2;
  int v22 = v3 % v21;
  uint v23 = simt_lane_id(__simt_tid);
  int v24 = (int)(v23);
  int v25;
  v25 = v24;
  switch (v22) {
    case 0:
      {
      int v26 = 2;
      int v27 = v3 % v26;
      int v28 = 0;
      int v29 = v0 + v28;
      int v30;
      v30 = v29;
      switch (v27) {
        case 0:
          {
          int v31 = 3;
          int v32 = v3 % v31;
          int v33;
          v33 = v0;
          switch (v32) {
            case 0:
              {
              int v34 = 4;
              int v35 = v0 + v34;
              v33 = v35;
              break;
            }
            case 1:
              {
              v33 = v0;
              break;
            }
            case 2:
              {
              int v36 = 2;
              int v37 = v0 + v36;
              v33 = v37;
              break;
            }
            default:
              {
              v33 = v0;
              break;
            }
          }
          int v38 = 3;
          int v39 = v0 + v38;
          v30 = v33;
        }
        default:
          {
          int v40 = 3;
          int v41 = v3 % v40;
          int v42 = 0;
          int v43;
          v43 = v42;
          switch (v41) {
            case 0:
              {
              v43 = v0;
              break;
            }
            default:
              {
              int v44 = 1;
              v43 = v44;
              break;
            }
            case 1:
              {
              int v45 = 0;
              v43 = v45;
              break;
            }
            case 2:
              {
              int v46 = 3;
              int v47 = v0 + v46;
              v43 = v47;
              break;
            }
          }
          v30 = v43;
          break;
        }
        case 1:
          {
          int v48 = 0;
          int v49 = 0;
          int v50;
          int v51;
          v50 = v48;
          v51 = v49;
          while (true) {
            int v52 = 4;
            int v53 = v3 % v52;
            int v54 = 1;
            int v55 = v53 + v54;
            bool v56 = v51 < v55;
            v50 = v50;
            v51 = v51;
            if (!v56) break;
            int v57 = 2;
            int v58 = v0 + v57;
            int v59 = 1;
            int v60 = v51 + v59;
            v50 = v58;
            v51 = v60;
          }
          int v61 = 4;
          int v62 = v0 + v61;
          v30 = v50;
          break;
        }
      }
      int v63 = 2;
      v25 = v30;
      break;
    }
    default:
      {
      int v64 = 0;
      int v65 = 0;
      int v66;
      int v67;
      v66 = v64;
      v67 = v65;
      while (true) {
        int v68 = 4;
        int v69 = v3 % v68;
        int v70 = 1;
        int v71 = v69 + v70;
        bool v72 = v67 < v71;
        v66 = v66;
        v67 = v67;
        if (!v72) break;
        int v73 = 3;
        int v74 = v3 % v73;
        int v75 = 3;
        int v76;
        v76 = v75;
        switch (v74) {
          case 0:
            {
            int v77 = 4;
            int v78 = v0 + v77;
            v76 = v78;
            break;
          }
          case 1:
            {
            int v79 = 4;
            v76 = v79;
            break;
          }
          default:
            {
            int v80 = 4;
            v76 = v80;
            break;
          }
        }
        int v81 = 1;
        int v82 = v67 + v81;
        v66 = v76;
        v67 = v82;
      }
      v25 = v66;
      break;
    }
  }
  bool v83 = true;
  int v84 = simt_wave_count_bits(v83);
  int v85 = 16;
  int v86 = v85 + v0;
  v1[v86] = v84;
  int v87 = 0;
  bool v88 = v2 != v87;
  int v89 = v88 ? v6 : v25;
  return;
}

kernel void kernel_main(device int* v90 [[buffer(0)]], device int* v91 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v92 = static_cast<int>(__simt_tid3.x);
  int v93 = 0;
  int v94 = v93 + v92;
  int v95 = v91[v94];
  int v96 = 4;
  int v97 = v96 + v92;
  int v98 = v91[v97];
  helper0(v92, v90, v95, v98, static_cast<int>(__simt_tid3.x));
  int v99 = 0;
  int v100 = 0;
  int v101;
  int v102;
  v101 = v99;
  v102 = v100;
  while (true) {
    int v103 = 4;
    int v104 = v102 * v103;
    int v105 = v104 + v92;
    int v106 = 8;
    int v107 = v106 + v105;
    int v108 = v91[v107];
    int v109 = 0;
    bool v110 = v108 != v109;
    v101 = v101;
    v102 = v102;
    if (!v110) break;
    int v111 = v101 + v102;
    int v112 = 1;
    int v113 = v102 + v112;
    v101 = v111;
    v102 = v113;
  }
  bool v114 = true;
  int v115 = 32;
  int v116 = v115 + v92;
  bool v117 = true;
  int v118 = simt_wave_count_bits(v117);
  v90[v116] = v118;
  int v119 = 0;
  int v120 = 0;
  int v121;
  int v122;
  v121 = v119;
  v122 = v120;
  while (true) {
    int v123 = 4;
    int v124 = v122 * v123;
    int v125 = v124 + v92;
    int v126 = 28;
    int v127 = v126 + v125;
    int v128 = v91[v127];
    int v129 = 0;
    bool v130 = v128 != v129;
    v121 = v121;
    v122 = v122;
    if (!v130) break;
    int v131 = v121 + v122;
    int v132 = 1;
    int v133 = v122 + v132;
    v121 = v131;
    v122 = v133;
    break;
    ;
  }
  bool v134 = true;
  int v135 = 48;
  int v136 = v135 + v92;
  bool v137 = true;
  int v138 = simt_wave_count_bits(v137);
  v90[v136] = v138;
  int v139 = 48;
  int v140 = v139 + v92;
  int v141 = v91[v140];
  int v142 = 0;
  bool v143 = v141 != v142;
  int v144;
  if (v143) {
    int v145 = 52;
    int v146 = v145 + v92;
    int v147 = v91[v146];
    int v148 = 0;
    bool v149 = v147 != v148;
    int v150;
    if (v149) {
      int v151 = 56;
      int v152 = v151 + v92;
      int v153 = v91[v152];
      uint v154 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v155 = (int)(v154);
      int v156;
      v156 = v155;
      switch (v153) {
        case 0:
          {
          v156 = v92;
        }
        default:
          {
          int v157 = 3;
          v156 = v157;
          break;
        }
      }
      bool v158 = true;
      v150 = v156;
    } else {
      int v159 = 3;
      v150 = v159;
    }
    v144 = v150;
  } else {
    int v160 = 0;
    int v161 = 0;
    int v162;
    int v163;
    v162 = v160;
    v163 = v161;
    while (true) {
      int v164 = 4;
      int v165 = v163 * v164;
      int v166 = v165 + v92;
      int v167 = 60;
      int v168 = v167 + v166;
      int v169 = v91[v168];
      int v170 = 0;
      bool v171 = v169 != v170;
      v162 = v162;
      v163 = v163;
      if (!v171) break;
      int v172 = 80;
      int v173 = v172 + v92;
      int v174 = v91[v173];
      int v175 = 0;
      bool v176 = v174 != v175;
      int v177;
      if (v176) {
        uint v178 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v179 = (int)(v178);
        v177 = v179;
      } else {
        uint v180 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v181 = (int)(v180);
        v177 = v181;
      }
      int v182 = v162 + v177;
      int v183 = 1;
      int v184 = v163 + v183;
      v162 = v182;
      v163 = v184;
    }
    bool v185 = true;
    v144 = v162;
  }
  int v186 = 64;
  int v187 = v186 + v92;
  bool v188 = true;
  int v189 = simt_wave_count_bits(v188);
  v90[v187] = v189;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
