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
  int v4 = 4;
  int v5 = v3 % v4;
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      v6 = v0;
    }
    case 1:
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
        int v16 = 4;
        int v17 = v0 + v16;
        int v18 = 1;
        int v19 = v10 + v18;
        v9 = v17;
        v10 = v19;
      }
      int v20 = 4;
      v6 = v9;
      break;
    }
    default:
      {
      int v21 = 2;
      int v22 = v3 % v21;
      int v23;
      v23 = v0;
      switch (v22) {
        default:
          {
          int v24 = 2;
          int v25 = v3 % v24;
          int v26;
          v26 = v0;
          switch (v25) {
            case 0:
              {
              int v27 = 0;
              int v28 = v0 + v27;
              v26 = v28;
              break;
            }
            case 1:
              {
              v26 = v0;
            }
            default:
              {
              int v29 = 4;
              int v30 = v0 + v29;
              v26 = v30;
              break;
            }
          }
          int v31 = 0;
          int v32 = v0 + v31;
          v23 = v26;
          break;
        }
        case 0:
          {
          int v33 = 3;
          int v34 = v3 % v33;
          int v35 = 0;
          int v36 = v0 + v35;
          int v37;
          v37 = v36;
          switch (v34) {
            case 0:
              {
              int v38 = 3;
              int v39 = v0 + v38;
              v37 = v39;
              break;
            }
            default:
              {
              int v40 = 2;
              int v41 = v0 + v40;
              v37 = v41;
            }
            case 1:
              {
              int v42 = 3;
              int v43 = v0 + v42;
              v37 = v43;
            }
            case 2:
              {
              int v44 = 4;
              int v45 = v0 + v44;
              v37 = v45;
              break;
            }
          }
          int v46 = 1;
          v23 = v37;
          break;
        }
        case 1:
          {
          int v47 = 4;
          int v48 = v3 % v47;
          int v49 = 4;
          int v50 = v0 + v49;
          int v51;
          v51 = v50;
          switch (v48) {
            case 0:
              {
              v51 = v0;
              break;
            }
            case 1:
              {
              v51 = v0;
              break;
            }
            case 2:
              {
              int v52 = 2;
              v51 = v52;
              break;
            }
            default:
              {
              v51 = v0;
              break;
            }
          }
          int v53 = 1;
          int v54 = v0 + v53;
          v23 = v51;
          break;
        }
      }
      int v55 = 2;
      v6 = v23;
      break;
    }
    case 2:
      {
      int v56 = 0;
      bool v57 = v2 != v56;
      int v58;
      if (v57) {
        int v59 = 0;
        bool v60 = v2 != v59;
        int v61;
        if (v60) {
          int v62 = 1;
          v61 = v62;
        } else {
          int v63 = 0;
          v61 = v63;
        }
        v58 = v61;
      } else {
        int v64 = 0;
        bool v65 = v2 != v64;
        int v66;
        if (v65) {
          v66 = v0;
        } else {
          int v67 = 4;
          v66 = v67;
        }
        v58 = v66;
      }
      v6 = v58;
      break;
    }
  }
  bool v68 = true;
  int v69 = simt_wave_count_bits(v68);
  int v70 = 0;
  int v71 = v70 + v0;
  v1[v71] = v69;
  return;
}

kernel void kernel_main(device int* v72 [[buffer(0)]], device int* v73 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v74 = static_cast<int>(__simt_tid3.x);
  int v75 = 0;
  int v76 = v75 + v74;
  int v77 = v73[v76];
  int v78 = 4;
  int v79 = v78 + v74;
  int v80 = v73[v79];
  helper0(v74, v72, v77, v80, static_cast<int>(__simt_tid3.x));
  int v81 = 8;
  int v82 = v81 + v74;
  int v83 = v73[v82];
  int v84 = 2;
  int v85;
  v85 = v84;
  switch (v83) {
    case 0:
      {
      int v86 = 12;
      int v87 = v86 + v74;
      int v88 = v73[v87];
      int v89 = 0;
      bool v90 = v88 != v89;
      int v91;
      if (v90) {
        int v92 = 0;
        int v93 = 0;
        int v94;
        int v95;
        v94 = v92;
        v95 = v93;
        while (true) {
          int v96 = 4;
          int v97 = v95 * v96;
          int v98 = v97 + v74;
          int v99 = 16;
          int v100 = v99 + v98;
          int v101 = v73[v100];
          int v102 = 0;
          bool v103 = v101 != v102;
          v94 = v94;
          v95 = v95;
          if (!v103) break;
          int v104 = v94 + v95;
          int v105 = 1;
          int v106 = v95 + v105;
          v94 = v104;
          v95 = v106;
        }
        bool v107 = true;
        v91 = v94;
      } else {
        int v108 = 36;
        int v109 = v108 + v74;
        int v110 = v73[v109];
        int v111 = 0;
        bool v112 = v110 != v111;
        int v113;
        if (v112) {
          v113 = v74;
        } else {
          int v114 = 4;
          v113 = v114;
        }
        v91 = v113;
      }
      v85 = v91;
    }
    case 1:
      {
      v85 = v74;
      break;
    }
    default:
      {
      int v115 = 3;
      int v116 = v74 + v115;
      v85 = v116;
      break;
    }
  }
  bool v117 = true;
  int v118 = 16;
  int v119 = v118 + v74;
  bool v120 = true;
  int v121 = simt_wave_count_bits(v120);
  v72[v119] = v121;
  int v122 = 40;
  int v123 = v122 + v74;
  int v124 = v73[v123];
  int v125 = 0;
  bool v126 = v124 != v125;
  int v127;
  if (v126) {
    int v128 = 44;
    int v129 = v128 + v74;
    int v130 = v73[v129];
    uint v131 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v132 = (int)(v131);
    int v133;
    v133 = v132;
    switch (v130) {
      default:
        {
        int v134 = 48;
        int v135 = v134 + v74;
        int v136 = v73[v135];
        int v137;
        v137 = v74;
        switch (v136) {
          case 0:
            {
            int v138 = 2;
            int v139 = v74 + v138;
            v137 = v139;
            break;
          }
          default:
            {
            int v140 = 0;
            int v141 = v74 + v140;
            v137 = v141;
            break;
          }
        }
        bool v142 = true;
        v133 = v137;
      }
      case 0:
        {
        v133 = v74;
        break;
      }
      case 1:
        {
        int v143 = 52;
        int v144 = v143 + v74;
        int v145 = v73[v144];
        int v146 = 0;
        bool v147 = v145 != v146;
        int v148;
        if (v147) {
          int v149 = 2;
          v148 = v149;
        } else {
          int v150 = 3;
          v148 = v150;
        }
        v133 = v148;
      }
      case 2:
        {
        int v151 = 56;
        int v152 = v151 + v74;
        int v153 = v73[v152];
        int v154 = 0;
        bool v155 = v153 != v154;
        int v156;
        if (v155) {
          int v157 = 2;
          int v158 = v74 + v157;
          v156 = v158;
        } else {
          int v159 = 1;
          int v160 = v74 + v159;
          v156 = v160;
        }
        v133 = v156;
        break;
      }
    }
    bool v161 = true;
    v127 = v133;
  } else {
    int v162 = 60;
    int v163 = v162 + v74;
    int v164 = v73[v163];
    int v165 = 0;
    bool v166 = v164 != v165;
    int v167;
    if (v166) {
      int v168 = 0;
      int v169 = 0;
      int v170;
      int v171;
      v170 = v168;
      v171 = v169;
      while (true) {
        int v172 = 4;
        int v173 = v171 * v172;
        int v174 = v173 + v74;
        int v175 = 64;
        int v176 = v175 + v174;
        int v177 = v73[v176];
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
      v167 = v170;
    } else {
      int v184 = 84;
      int v185 = v184 + v74;
      int v186 = v73[v185];
      int v187 = 1;
      int v188 = v74 + v187;
      int v189;
      v189 = v188;
      switch (v186) {
        case 0:
          {
          int v190 = 1;
          v189 = v190;
          break;
        }
        default:
          {
          int v191 = 0;
          v189 = v191;
          break;
        }
      }
      bool v192 = true;
      v167 = v189;
    }
    v127 = v167;
  }
  int v193 = 32;
  int v194 = v193 + v74;
  bool v195 = true;
  int v196 = simt_wave_count_bits(v195);
  v72[v194] = v196;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
