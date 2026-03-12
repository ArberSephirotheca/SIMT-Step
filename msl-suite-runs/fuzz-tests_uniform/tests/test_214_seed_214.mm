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
  int v4 = 2;
  int v5 = v3 % v4;
  int v6;
  v6 = v0;
  switch (v5) {
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
        int v16 = 3;
        int v17 = v3 % v16;
        int v18;
        v18 = v0;
        switch (v17) {
          case 0:
            {
            v18 = v0;
            break;
          }
          case 1:
            {
            v18 = v0;
            break;
          }
          case 2:
            {
            int v19 = 0;
            v18 = v19;
            break;
          }
          default:
            {
            int v20 = 4;
            v18 = v20;
            break;
          }
        }
        int v21 = 1;
        int v22 = 1;
        int v23 = v10 + v22;
        v9 = v18;
        v10 = v23;
      }
      v6 = v9;
      break;
    }
    case 0:
      {
      int v24 = 3;
      int v25 = v3 % v24;
      int v26 = 4;
      int v27 = v0 + v26;
      int v28;
      v28 = v27;
      switch (v25) {
        case 0:
          {
          int v29 = 0;
          bool v30 = v2 != v29;
          int v31;
          if (v30) {
            int v32 = 2;
            v31 = v32;
          } else {
            int v33 = 2;
            int v34 = v0 + v33;
            v31 = v34;
          }
          v28 = v31;
          break;
        }
        case 1:
          {
          int v35 = 0;
          bool v36 = v2 != v35;
          int v37;
          if (v36) {
            int v38 = 0;
            v37 = v38;
          } else {
            int v39 = 1;
            v37 = v39;
          }
          int v40 = 0;
          int v41 = v0 + v40;
          v28 = v37;
          break;
        }
        default:
          {
          int v42 = 0;
          bool v43 = v2 != v42;
          int v44;
          if (v43) {
            int v45 = 1;
            v44 = v45;
          } else {
            int v46 = 4;
            v44 = v46;
          }
          int v47 = 4;
          int v48 = v0 + v47;
          v28 = v44;
          break;
        }
      }
      int v49 = 2;
      int v50 = v0 + v49;
      v6 = v28;
      break;
    }
  }
  bool v51 = true;
  int v52 = simt_wave_count_bits(v51);
  int v53 = 0;
  int v54 = v53 + v0;
  v1[v54] = v52;
  return;
}

kernel void kernel_main(device int* v55 [[buffer(0)]], device int* v56 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v57 = static_cast<int>(__simt_tid3.x);
  int v58 = 0;
  int v59 = v58 + v57;
  int v60 = v56[v59];
  int v61 = 4;
  int v62 = v61 + v57;
  int v63 = v56[v62];
  helper0(v57, v55, v60, v63, static_cast<int>(__simt_tid3.x));
  int v64 = 8;
  int v65 = v64 + v57;
  int v66 = v56[v65];
  int v67 = 0;
  bool v68 = v66 != v67;
  int v69;
  if (v68) {
    int v70 = 3;
    v69 = v70;
  } else {
    int v71 = 12;
    int v72 = v71 + v57;
    int v73 = v56[v72];
    int v74 = 2;
    int v75 = v57 + v74;
    int v76;
    v76 = v75;
    switch (v73) {
      case 0:
        {
        int v77 = 16;
        int v78 = v77 + v57;
        int v79 = v56[v78];
        int v80 = 0;
        bool v81 = v79 != v80;
        int v82;
        if (v81) {
          int v83 = 3;
          int v84 = v57 + v83;
          v82 = v84;
        } else {
          int v85 = 3;
          v82 = v85;
        }
        v76 = v82;
        break;
      }
      case 1:
        {
        int v86 = 2;
        int v87 = v57 + v86;
        v76 = v87;
        break;
      }
      default:
        {
        int v88 = 20;
        int v89 = v88 + v57;
        int v90 = v56[v89];
        int v91 = 3;
        int v92;
        v92 = v91;
        switch (v90) {
          case 0:
            {
            int v93 = 3;
            int v94 = v57 + v93;
            v92 = v94;
          }
          default:
            {
            int v95 = 3;
            int v96 = v57 + v95;
            v92 = v96;
            break;
          }
        }
        bool v97 = true;
        v76 = v92;
        break;
      }
    }
    bool v98 = true;
    v69 = v76;
  }
  int v99 = 16;
  int v100 = v99 + v57;
  bool v101 = true;
  int v102 = simt_wave_count_bits(v101);
  v55[v100] = v102;
  int v103 = 24;
  int v104 = v103 + v57;
  int v105 = v56[v104];
  uint v106 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v107 = (int)(v106);
  int v108;
  v108 = v107;
  switch (v105) {
    case 0:
      {
      int v109 = 28;
      int v110 = v109 + v57;
      int v111 = v56[v110];
      int v112 = 2;
      int v113 = v57 + v112;
      int v114;
      v114 = v113;
      switch (v111) {
        case 0:
          {
          int v115 = 32;
          int v116 = v115 + v57;
          int v117 = v56[v116];
          int v118 = 2;
          int v119;
          v119 = v118;
          switch (v117) {
            case 0:
              {
              int v120 = 1;
              v119 = v120;
            }
            case 1:
              {
              int v121 = 2;
              v119 = v121;
            }
            default:
              {
              int v122 = 4;
              v119 = v122;
              break;
            }
          }
          bool v123 = true;
          v114 = v119;
          break;
        }
        default:
          {
          int v124 = 36;
          int v125 = v124 + v57;
          int v126 = v56[v125];
          int v127 = 1;
          int v128 = v57 + v127;
          int v129;
          v129 = v128;
          switch (v126) {
            default:
              {
              int v130 = 4;
              int v131 = v57 + v130;
              v129 = v131;
              break;
            }
            case 0:
              {
              v129 = v57;
              break;
            }
            case 1:
              {
              int v132 = 2;
              v129 = v132;
              break;
            }
            case 2:
              {
              int v133 = 0;
              v129 = v133;
              break;
            }
          }
          bool v134 = true;
          v114 = v129;
          break;
        }
        case 1:
          {
          int v135 = 40;
          int v136 = v135 + v57;
          int v137 = v56[v136];
          int v138;
          v138 = v57;
          switch (v137) {
            default:
              {
              int v139 = 2;
              int v140 = v57 + v139;
              v138 = v140;
            }
            case 0:
              {
              int v141 = 3;
              int v142 = v57 + v141;
              v138 = v142;
              break;
            }
          }
          bool v143 = true;
          v114 = v138;
          break;
        }
      }
      bool v144 = true;
      v108 = v114;
    }
    case 1:
      {
      int v145 = 44;
      int v146 = v145 + v57;
      int v147 = v56[v146];
      int v148 = 1;
      int v149;
      v149 = v148;
      switch (v147) {
        default:
          {
          int v150 = 48;
          int v151 = v150 + v57;
          int v152 = v56[v151];
          int v153;
          v153 = v57;
          switch (v152) {
            case 0:
              {
              v153 = v57;
              break;
            }
            case 1:
              {
              int v154 = 2;
              int v155 = v57 + v154;
              v153 = v155;
              break;
            }
            default:
              {
              int v156 = 1;
              int v157 = v57 + v156;
              v153 = v157;
              break;
            }
          }
          bool v158 = true;
          v149 = v153;
        }
        case 0:
          {
          int v159 = 2;
          v149 = v159;
          break;
        }
        case 1:
          {
          int v160 = 52;
          int v161 = v160 + v57;
          int v162 = v56[v161];
          int v163;
          v163 = v57;
          switch (v162) {
            default:
              {
              int v164 = 4;
              v163 = v164;
              break;
            }
            case 0:
              {
              int v165 = 1;
              int v166 = v57 + v165;
              v163 = v166;
              break;
            }
          }
          bool v167 = true;
          v149 = v163;
          break;
        }
        case 2:
          {
          int v168 = 0;
          int v169 = 0;
          int v170;
          int v171;
          v170 = v168;
          v171 = v169;
          while (true) {
            int v172 = 4;
            int v173 = v171 * v172;
            int v174 = v173 + v57;
            int v175 = 56;
            int v176 = v175 + v174;
            int v177 = v56[v176];
            int v178 = 0;
            bool v179 = v177 != v178;
            v170 = v170;
            v171 = v171;
            if (!v179) break;
            int v180 = v170 + v171;
            int v181 = 1;
            int v182 = v171 + v181;
            v170 = v180;
            v171 = v182;
          }
          bool v183 = true;
          v149 = v170;
          break;
        }
      }
      bool v184 = true;
      v108 = v149;
    }
    default:
      {
      v108 = v57;
      break;
    }
  }
  bool v185 = true;
  int v186 = 32;
  int v187 = v186 + v57;
  bool v188 = true;
  int v189 = simt_wave_count_bits(v188);
  v55[v187] = v189;
  uint v190 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v191 = (int)(v190);
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
