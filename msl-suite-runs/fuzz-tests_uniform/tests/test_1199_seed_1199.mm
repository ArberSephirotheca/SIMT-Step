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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6;
  v6 = v5;
  switch (v3) {
    default:
      {
      int v7 = 3;
      int v8 = v3 % v7;
      int v9 = 4;
      int v10 = v0 + v9;
      int v11;
      v11 = v10;
      switch (v8) {
        default:
          {
          int v12 = 0;
          bool v13 = v2 != v12;
          int v14;
          if (v13) {
            int v15 = 0;
            int v16 = v0 + v15;
            v14 = v16;
          } else {
            int v17 = 0;
            int v18 = v0 + v17;
            v14 = v18;
          }
          int v19 = 3;
          int v20 = v0 + v19;
          v11 = v14;
        }
        case 0:
          {
          int v21 = 0;
          int v22 = 0;
          int v23;
          int v24;
          v23 = v21;
          v24 = v22;
          while (true) {
            int v25 = 4;
            int v26 = v3 % v25;
            int v27 = 1;
            int v28 = v26 + v27;
            bool v29 = v24 < v28;
            v23 = v23;
            v24 = v24;
            if (!v29) break;
            int v30 = 1;
            int v31 = v24 + v30;
            v23 = v0;
            v24 = v31;
            break;
            ;
          }
          int v32 = 1;
          v11 = v23;
        }
        case 1:
          {
          int v33 = 4;
          int v34 = v0 + v33;
          v11 = v34;
          break;
        }
      }
      v6 = v11;
      break;
    }
    case 0:
      {
      int v35 = 2;
      int v36 = v3 % v35;
      int v37 = 1;
      int v38 = v0 + v37;
      int v39;
      v39 = v38;
      switch (v36) {
        case 0:
          {
          int v40 = 3;
          int v41 = v3 % v40;
          int v42 = 4;
          int v43 = v0 + v42;
          int v44;
          v44 = v43;
          switch (v41) {
            default:
              {
              int v45 = 2;
              v44 = v45;
              break;
            }
            case 0:
              {
              v44 = v0;
              break;
            }
            case 1:
              {
              int v46 = 0;
              int v47 = v0 + v46;
              v44 = v47;
              break;
            }
            case 2:
              {
              int v48 = 2;
              int v49 = v0 + v48;
              v44 = v49;
              break;
            }
          }
          int v50 = 4;
          int v51 = v0 + v50;
          v39 = v44;
        }
        case 1:
          {
          int v52 = 0;
          bool v53 = v2 != v52;
          int v54;
          if (v53) {
            v54 = v0;
          } else {
            v54 = v0;
          }
          int v55 = 3;
          v39 = v54;
          break;
        }
        default:
          {
          int v56 = 2;
          int v57 = v3 % v56;
          int v58 = 0;
          int v59 = v0 + v58;
          int v60;
          v60 = v59;
          switch (v57) {
            default:
              {
              v60 = v0;
              break;
            }
            case 0:
              {
              v60 = v0;
              break;
            }
            case 1:
              {
              v60 = v0;
              break;
            }
          }
          int v61 = 2;
          v39 = v60;
          break;
        }
      }
      int v62 = 1;
      v6 = v39;
      break;
    }
  }
  bool v63 = true;
  int v64 = simt_wave_count_bits(v63);
  int v65 = 0;
  int v66 = v65 + v0;
  v1[v66] = v64;
  return;
}

kernel void kernel_main(device int* v67 [[buffer(0)]], device int* v68 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v69 = static_cast<int>(__simt_tid3.x);
  int v70 = 0;
  int v71 = v70 + v69;
  int v72 = v68[v71];
  int v73 = 4;
  int v74 = v73 + v69;
  int v75 = v68[v74];
  helper0(v69, v67, v72, v75, static_cast<int>(__simt_tid3.x));
  int v76 = 0;
  int v77 = 0;
  int v78;
  int v79;
  v78 = v76;
  v79 = v77;
  while (true) {
    int v80 = 4;
    int v81 = v79 * v80;
    int v82 = v81 + v69;
    int v83 = 8;
    int v84 = v83 + v82;
    int v85 = v68[v84];
    int v86 = 0;
    bool v87 = v85 != v86;
    v78 = v78;
    v79 = v79;
    if (!v87) break;
    int v88 = v78 + v79;
    int v89 = 1;
    int v90 = v79 + v89;
    v78 = v88;
    v79 = v90;
  }
  bool v91 = true;
  int v92 = 16;
  int v93 = v92 + v69;
  bool v94 = true;
  int v95 = simt_wave_count_bits(v94);
  v67[v93] = v95;
  int v96 = 28;
  int v97 = v96 + v69;
  int v98 = v68[v97];
  int v99 = 3;
  int v100;
  v100 = v99;
  switch (v98) {
    case 0:
      {
      int v101 = 0;
      int v102 = 0;
      int v103;
      int v104;
      v103 = v101;
      v104 = v102;
      while (true) {
        int v105 = 4;
        int v106 = v104 * v105;
        int v107 = v106 + v69;
        int v108 = 32;
        int v109 = v108 + v107;
        int v110 = v68[v109];
        int v111 = 0;
        bool v112 = v110 != v111;
        v103 = v103;
        v104 = v104;
        if (!v112) break;
        int v113 = 52;
        int v114 = v113 + v69;
        int v115 = v68[v114];
        int v116 = 1;
        int v117 = v69 + v116;
        int v118;
        v118 = v117;
        switch (v115) {
          case 0:
            {
            v118 = v69;
          }
          case 1:
            {
            int v119 = 3;
            int v120 = v69 + v119;
            v118 = v120;
            break;
          }
          default:
            {
            v118 = v69;
            break;
          }
        }
        bool v121 = true;
        int v122 = v103 + v118;
        int v123 = 1;
        int v124 = v104 + v123;
        v103 = v122;
        v104 = v124;
      }
      bool v125 = true;
      v100 = v103;
      break;
    }
    default:
      {
      v100 = v69;
      break;
    }
    case 1:
      {
      int v126 = 4;
      int v127 = v69 + v126;
      v100 = v127;
    }
    case 2:
      {
      int v128 = 56;
      int v129 = v128 + v69;
      int v130 = v68[v129];
      int v131 = 2;
      int v132;
      v132 = v131;
      switch (v130) {
        case 0:
          {
          int v133 = 0;
          int v134 = 0;
          int v135;
          int v136;
          v135 = v133;
          v136 = v134;
          while (true) {
            int v137 = 4;
            int v138 = v136 * v137;
            int v139 = v138 + v69;
            int v140 = 60;
            int v141 = v140 + v139;
            int v142 = v68[v141];
            int v143 = 0;
            bool v144 = v142 != v143;
            v135 = v135;
            v136 = v136;
            if (!v144) break;
            int v145 = v135 + v136;
            int v146 = 1;
            int v147 = v136 + v146;
            v135 = v145;
            v136 = v147;
          }
          bool v148 = true;
          v132 = v135;
        }
        case 1:
          {
          int v149 = 80;
          int v150 = v149 + v69;
          int v151 = v68[v150];
          int v152 = 4;
          int v153;
          v153 = v152;
          switch (v151) {
            case 0:
              {
              int v154 = 2;
              v153 = v154;
            }
            default:
              {
              int v155 = 3;
              int v156 = v69 + v155;
              v153 = v156;
              break;
            }
          }
          bool v157 = true;
          v132 = v153;
          break;
        }
        case 2:
          {
          int v158 = 3;
          v132 = v158;
          break;
        }
        default:
          {
          int v159 = 0;
          int v160 = 0;
          int v161;
          int v162;
          v161 = v159;
          v162 = v160;
          while (true) {
            int v163 = 4;
            int v164 = v162 * v163;
            int v165 = v164 + v69;
            int v166 = 84;
            int v167 = v166 + v165;
            int v168 = v68[v167];
            int v169 = 0;
            bool v170 = v168 != v169;
            v161 = v161;
            v162 = v162;
            if (!v170) break;
            int v171 = v161 + v162;
            int v172 = 1;
            int v173 = v162 + v172;
            v161 = v171;
            v162 = v173;
            continue;
            ;
          }
          bool v174 = true;
          v132 = v161;
          break;
        }
      }
      bool v175 = true;
      v100 = v132;
      break;
    }
  }
  bool v176 = true;
  int v177 = 32;
  int v178 = v177 + v69;
  bool v179 = true;
  int v180 = simt_wave_count_bits(v179);
  v67[v178] = v180;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
