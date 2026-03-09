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
    int v7 = 4;
    int v8 = v3 % v7;
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      default:
        {
        int v12 = 3;
        int v13 = v3 % v12;
        int v14;
        v14 = v0;
        switch (v13) {
          case 0:
            {
            int v15 = 2;
            v14 = v15;
            break;
          }
          default:
            {
            int v16 = 0;
            v14 = v16;
            break;
          }
          case 1:
            {
            int v17 = 0;
            int v18 = v0 + v17;
            v14 = v18;
            break;
          }
          case 2:
            {
            int v19 = 4;
            v14 = v19;
            break;
          }
        }
        int v20 = 4;
        int v21 = v0 + v20;
        v11 = v14;
        break;
      }
      case 0:
        {
        int v22 = 3;
        int v23 = v3 % v22;
        int v24;
        v24 = v0;
        switch (v23) {
          case 0:
            {
            int v25 = 2;
            v24 = v25;
            break;
          }
          default:
            {
            int v26 = 1;
            int v27 = v0 + v26;
            v24 = v27;
            break;
          }
          case 1:
            {
            int v28 = 3;
            int v29 = v0 + v28;
            v24 = v29;
            break;
          }
        }
        v11 = v24;
      }
      case 1:
        {
        int v30 = 0;
        int v31 = 0;
        int v32;
        int v33;
        v32 = v30;
        v33 = v31;
        while (true) {
          int v34 = 4;
          int v35 = v3 % v34;
          int v36 = 1;
          int v37 = v35 + v36;
          bool v38 = v33 < v37;
          v32 = v32;
          v33 = v33;
          if (!v38) break;
          int v39 = 1;
          int v40 = v33 + v39;
          v32 = v0;
          v33 = v40;
        }
        int v41 = 4;
        v11 = v32;
        break;
      }
      case 2:
        {
        v11 = v0;
        break;
      }
    }
    int v42 = 1;
    int v43 = v0 + v42;
    v6 = v11;
  } else {
    int v44 = 0;
    bool v45 = v2 != v44;
    int v46;
    if (v45) {
      int v47 = 3;
      v46 = v47;
    } else {
      int v48 = 2;
      int v49 = v3 % v48;
      int v50;
      v50 = v0;
      switch (v49) {
        case 0:
          {
          int v51 = 0;
          int v52 = v0 + v51;
          v50 = v52;
          break;
        }
        case 1:
          {
          v50 = v0;
          break;
        }
        default:
          {
          v50 = v0;
          break;
        }
      }
      uint v53 = simt_lane_id(__simt_tid);
      int v54 = (int)(v53);
      v46 = v50;
    }
    uint v55 = simt_lane_id(__simt_tid);
    int v56 = (int)(v55);
    v6 = v46;
  }
  bool v57 = true;
  int v58 = simt_wave_count_bits(v57);
  int v59 = 0;
  int v60 = v59 + v0;
  v1[v60] = v58;
  return;
}

kernel void kernel_main(device int* v61 [[buffer(0)]], device int* v62 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v63 = static_cast<int>(__simt_tid3.x);
  int v64 = 0;
  int v65 = v64 + v63;
  int v66 = v62[v65];
  int v67 = 4;
  int v68 = v67 + v63;
  int v69 = v62[v68];
  helper0(v63, v61, v66, v69, static_cast<int>(__simt_tid3.x));
  int v70 = 8;
  int v71 = v70 + v63;
  int v72 = v62[v71];
  int v73;
  v73 = v63;
  switch (v72) {
    default:
      {
      int v74 = 12;
      int v75 = v74 + v63;
      int v76 = v62[v75];
      int v77 = 0;
      bool v78 = v76 != v77;
      int v79;
      if (v78) {
        int v80 = 0;
        int v81 = 0;
        int v82;
        int v83;
        v82 = v80;
        v83 = v81;
        while (true) {
          int v84 = 4;
          int v85 = v83 * v84;
          int v86 = v85 + v63;
          int v87 = 16;
          int v88 = v87 + v86;
          int v89 = v62[v88];
          int v90 = 0;
          bool v91 = v89 != v90;
          v82 = v82;
          v83 = v83;
          if (!v91) break;
          int v92 = v82 + v83;
          int v93 = 1;
          int v94 = v83 + v93;
          v82 = v92;
          v83 = v94;
        }
        bool v95 = true;
        v79 = v82;
      } else {
        int v96 = 36;
        int v97 = v96 + v63;
        int v98 = v62[v97];
        int v99;
        v99 = v63;
        switch (v98) {
          case 0:
            {
            int v100 = 1;
            v99 = v100;
            break;
          }
          default:
            {
            v99 = v63;
            break;
          }
          case 1:
            {
            int v101 = 2;
            int v102 = v63 + v101;
            v99 = v102;
            break;
          }
          case 2:
            {
            int v103 = 3;
            v99 = v103;
            break;
          }
        }
        bool v104 = true;
        v79 = v99;
      }
      v73 = v79;
      break;
    }
    case 0:
      {
      int v105 = 40;
      int v106 = v105 + v63;
      int v107 = v62[v106];
      int v108 = 2;
      int v109 = v63 + v108;
      int v110;
      v110 = v109;
      switch (v107) {
        case 0:
          {
          int v111 = 44;
          int v112 = v111 + v63;
          int v113 = v62[v112];
          int v114 = 1;
          int v115 = v63 + v114;
          int v116;
          v116 = v115;
          switch (v113) {
            case 0:
              {
              int v117 = 0;
              int v118 = v63 + v117;
              v116 = v118;
            }
            case 1:
              {
              int v119 = 0;
              int v120 = v63 + v119;
              v116 = v120;
              break;
            }
            default:
              {
              v116 = v63;
            }
            case 2:
              {
              int v121 = 0;
              v116 = v121;
              break;
            }
          }
          bool v122 = true;
          v110 = v116;
          break;
        }
        default:
          {
          int v123 = 48;
          int v124 = v123 + v63;
          int v125 = v62[v124];
          int v126 = 0;
          bool v127 = v125 != v126;
          int v128;
          if (v127) {
            int v129 = 2;
            int v130 = v63 + v129;
            v128 = v130;
          } else {
            int v131 = 0;
            v128 = v131;
          }
          v110 = v128;
          break;
        }
      }
      bool v132 = true;
      v73 = v110;
      break;
    }
    case 1:
      {
      int v133 = 52;
      int v134 = v133 + v63;
      int v135 = v62[v134];
      int v136 = 1;
      int v137;
      v137 = v136;
      switch (v135) {
        case 0:
          {
          int v138 = 56;
          int v139 = v138 + v63;
          int v140 = v62[v139];
          int v141;
          v141 = v63;
          switch (v140) {
            case 0:
              {
              int v142 = 1;
              v141 = v142;
              break;
            }
            case 1:
              {
              v141 = v63;
              break;
            }
            default:
              {
              int v143 = 1;
              v141 = v143;
              break;
            }
            case 2:
              {
              int v144 = 2;
              v141 = v144;
              break;
            }
          }
          bool v145 = true;
          v137 = v141;
        }
        default:
          {
          v137 = v63;
        }
        case 1:
          {
          int v146 = 60;
          int v147 = v146 + v63;
          int v148 = v62[v147];
          int v149;
          v149 = v63;
          switch (v148) {
            case 0:
              {
              int v150 = 3;
              v149 = v150;
              break;
            }
            default:
              {
              int v151 = 0;
              int v152 = v63 + v151;
              v149 = v152;
              break;
            }
            case 1:
              {
              int v153 = 1;
              int v154 = v63 + v153;
              v149 = v154;
              break;
            }
            case 2:
              {
              v149 = v63;
              break;
            }
          }
          bool v155 = true;
          v137 = v149;
          break;
        }
        case 2:
          {
          v137 = v63;
          break;
        }
      }
      bool v156 = true;
      v73 = v137;
      break;
    }
    case 2:
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
        int v163 = v162 + v63;
        int v164 = 64;
        int v165 = v164 + v163;
        int v166 = v62[v165];
        int v167 = 0;
        bool v168 = v166 != v167;
        v159 = v159;
        v160 = v160;
        if (!v168) break;
        int v169 = 0;
        int v170 = 0;
        int v171;
        int v172;
        v171 = v169;
        v172 = v170;
        while (true) {
          int v173 = 4;
          int v174 = v172 * v173;
          int v175 = v174 + v63;
          int v176 = 84;
          int v177 = v176 + v175;
          int v178 = v62[v177];
          int v179 = 0;
          bool v180 = v178 != v179;
          v171 = v171;
          v172 = v172;
          if (!v180) break;
          int v181 = v171 + v172;
          int v182 = 1;
          int v183 = v172 + v182;
          v171 = v181;
          v172 = v183;
          break;
          ;
        }
        bool v184 = true;
        int v185 = v159 + v171;
        int v186 = 1;
        int v187 = v160 + v186;
        v159 = v185;
        v160 = v187;
      }
      bool v188 = true;
      v73 = v159;
      break;
    }
  }
  bool v189 = true;
  int v190 = 16;
  int v191 = v190 + v63;
  bool v192 = true;
  int v193 = simt_wave_count_bits(v192);
  v61[v191] = v193;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
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
