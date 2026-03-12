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
    int v9 = 0;
    int v10;
    v10 = v9;
    switch (v8) {
      case 0:
        {
        v10 = v0;
        break;
      }
      default:
        {
        int v11 = 2;
        int v12 = v3 % v11;
        int v13 = 1;
        int v14;
        v14 = v13;
        switch (v12) {
          case 0:
            {
            v14 = v0;
            break;
          }
          case 1:
            {
            v14 = v0;
            break;
          }
          default:
            {
            v14 = v0;
            break;
          }
        }
        int v15 = 1;
        int v16 = v0 + v15;
        v10 = v14;
        break;
      }
      case 1:
        {
        int v17 = 2;
        int v18 = v0 + v17;
        v10 = v18;
        break;
      }
      case 2:
        {
        int v19 = 4;
        int v20 = v3 % v19;
        int v21;
        v21 = v0;
        switch (v20) {
          case 0:
            {
            v21 = v0;
          }
          default:
            {
            int v22 = 1;
            v21 = v22;
            break;
          }
          case 1:
            {
            v21 = v0;
          }
          case 2:
            {
            int v23 = 4;
            int v24 = v0 + v23;
            v21 = v24;
            break;
          }
        }
        int v25 = 2;
        v10 = v21;
        break;
      }
    }
    int v26 = 3;
    v6 = v10;
  } else {
    int v27 = 3;
    int v28 = v3 % v27;
    int v29;
    v29 = v0;
    switch (v28) {
      default:
        {
        int v30 = 2;
        int v31 = v0 + v30;
        v29 = v31;
        break;
      }
      case 0:
        {
        int v32 = 0;
        bool v33 = v2 != v32;
        int v34;
        if (v33) {
          int v35 = 2;
          v34 = v35;
        } else {
          int v36 = 4;
          v34 = v36;
        }
        v29 = v34;
      }
      case 1:
        {
        int v37 = 0;
        bool v38 = v2 != v37;
        int v39;
        if (v38) {
          int v40 = 1;
          int v41 = v0 + v40;
          v39 = v41;
        } else {
          v39 = v0;
        }
        int v42 = 2;
        int v43 = v0 + v42;
        v29 = v39;
        break;
      }
    }
    int v44 = 1;
    v6 = v29;
  }
  bool v45 = true;
  int v46 = simt_wave_count_bits(v45);
  int v47 = 0;
  int v48 = v47 + v0;
  v1[v48] = v46;
  return;
}

kernel void kernel_main(device int* v49 [[buffer(0)]], device int* v50 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v51 = static_cast<int>(__simt_tid3.x);
  int v52 = 0;
  int v53 = v52 + v51;
  int v54 = v50[v53];
  int v55 = 4;
  int v56 = v55 + v51;
  int v57 = v50[v56];
  helper0(v51, v49, v54, v57, static_cast<int>(__simt_tid3.x));
  int v58 = 8;
  int v59 = v58 + v51;
  int v60 = v50[v59];
  int v61 = 0;
  bool v62 = v60 != v61;
  int v63;
  if (v62) {
    int v64 = 0;
    int v65 = 0;
    int v66;
    int v67;
    v66 = v64;
    v67 = v65;
    while (true) {
      int v68 = 4;
      int v69 = v67 * v68;
      int v70 = v69 + v51;
      int v71 = 12;
      int v72 = v71 + v70;
      int v73 = v50[v72];
      int v74 = 0;
      bool v75 = v73 != v74;
      v66 = v66;
      v67 = v67;
      if (!v75) break;
      int v76 = v66 + v67;
      int v77 = 1;
      int v78 = v67 + v77;
      v66 = v76;
      v67 = v78;
      break;
      ;
    }
    bool v79 = true;
    v63 = v66;
  } else {
    int v80 = 32;
    int v81 = v80 + v51;
    int v82 = v50[v81];
    int v83 = 0;
    bool v84 = v82 != v83;
    int v85;
    if (v84) {
      int v86 = 36;
      int v87 = v86 + v51;
      int v88 = v50[v87];
      int v89 = 0;
      bool v90 = v88 != v89;
      int v91;
      if (v90) {
        int v92 = 0;
        int v93 = v51 + v92;
        v91 = v93;
      } else {
        int v94 = 2;
        v91 = v94;
      }
      v85 = v91;
    } else {
      uint v95 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v96 = (int)(v95);
      v85 = v96;
    }
    v63 = v85;
  }
  int v97 = 16;
  int v98 = v97 + v51;
  bool v99 = true;
  int v100 = simt_wave_count_bits(v99);
  v49[v98] = v100;
  int v101 = 0;
  int v102 = 0;
  int v103;
  int v104;
  v103 = v101;
  v104 = v102;
  while (true) {
    int v105 = 4;
    int v106 = v104 * v105;
    int v107 = v106 + v51;
    int v108 = 40;
    int v109 = v108 + v107;
    int v110 = v50[v109];
    int v111 = 0;
    bool v112 = v110 != v111;
    v103 = v103;
    v104 = v104;
    if (!v112) break;
    int v113 = v103 + v104;
    int v114 = 1;
    int v115 = v104 + v114;
    v103 = v113;
    v104 = v115;
    break;
    ;
  }
  bool v116 = true;
  int v117 = 32;
  int v118 = v117 + v51;
  bool v119 = true;
  int v120 = simt_wave_count_bits(v119);
  v49[v118] = v120;
  int v121 = 60;
  int v122 = v121 + v51;
  int v123 = v50[v122];
  uint v124 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v125 = (int)(v124);
  int v126;
  v126 = v125;
  switch (v123) {
    case 0:
      {
      v126 = v51;
    }
    default:
      {
      int v127 = 64;
      int v128 = v127 + v51;
      int v129 = v50[v128];
      int v130 = 0;
      int v131;
      v131 = v130;
      switch (v129) {
        default:
          {
          int v132 = 68;
          int v133 = v132 + v51;
          int v134 = v50[v133];
          int v135 = 0;
          bool v136 = v134 != v135;
          int v137;
          if (v136) {
            v137 = v51;
          } else {
            int v138 = 3;
            v137 = v138;
          }
          v131 = v137;
          break;
        }
        case 0:
          {
          int v139 = 0;
          int v140 = 0;
          int v141;
          int v142;
          v141 = v139;
          v142 = v140;
          while (true) {
            int v143 = 4;
            int v144 = v142 * v143;
            int v145 = v144 + v51;
            int v146 = 72;
            int v147 = v146 + v145;
            int v148 = v50[v147];
            int v149 = 0;
            bool v150 = v148 != v149;
            v141 = v141;
            v142 = v142;
            if (!v150) break;
            int v151 = v141 + v142;
            int v152 = 1;
            int v153 = v142 + v152;
            v141 = v151;
            v142 = v153;
            continue;
            ;
          }
          bool v154 = true;
          v131 = v141;
          break;
        }
        case 1:
          {
          int v155 = 92;
          int v156 = v155 + v51;
          int v157 = v50[v156];
          int v158;
          v158 = v51;
          switch (v157) {
            case 0:
              {
              v158 = v51;
              break;
            }
            case 1:
              {
              v158 = v51;
              break;
            }
            default:
              {
              v158 = v51;
              break;
            }
            case 2:
              {
              v158 = v51;
              break;
            }
          }
          bool v159 = true;
          v131 = v158;
          break;
        }
      }
      bool v160 = true;
      v126 = v131;
      break;
    }
    case 1:
      {
      int v161 = 96;
      int v162 = v161 + v51;
      int v163 = v50[v162];
      int v164 = 0;
      bool v165 = v163 != v164;
      int v166;
      if (v165) {
        int v167 = 4;
        int v168 = v51 + v167;
        v166 = v168;
      } else {
        int v169 = 100;
        int v170 = v169 + v51;
        int v171 = v50[v170];
        int v172 = 0;
        bool v173 = v171 != v172;
        int v174;
        if (v173) {
          int v175 = 4;
          v174 = v175;
        } else {
          int v176 = 1;
          int v177 = v51 + v176;
          v174 = v177;
        }
        v166 = v174;
      }
      v126 = v166;
      break;
    }
  }
  bool v178 = true;
  int v179 = 48;
  int v180 = v179 + v51;
  bool v181 = true;
  int v182 = simt_wave_count_bits(v181);
  v49[v180] = v182;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
