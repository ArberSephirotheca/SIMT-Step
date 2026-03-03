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
  int v6 = 0;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 2;
      int v9 = v3 % v8;
      int v10 = 3;
      int v11;
      v11 = v10;
      switch (v9) {
        case 0:
          {
          int v12 = 2;
          int v13 = v3 % v12;
          int v14;
          v14 = v0;
          switch (v13) {
            case 0:
              {
              int v15 = 3;
              v14 = v15;
              break;
            }
            case 1:
              {
              int v16 = 0;
              int v17 = v0 + v16;
              v14 = v17;
            }
            default:
              {
              int v18 = 1;
              v14 = v18;
              break;
            }
          }
          v11 = v14;
          break;
        }
        default:
          {
          int v19 = 2;
          int v20 = v0 + v19;
          v11 = v20;
          break;
        }
      }
      v7 = v11;
      break;
    }
    default:
      {
      int v21 = 3;
      int v22 = v3 % v21;
      int v23 = 3;
      int v24 = v0 + v23;
      int v25;
      v25 = v24;
      switch (v22) {
        case 0:
          {
          int v26 = 0;
          int v27 = 0;
          int v28;
          int v29;
          v28 = v26;
          v29 = v27;
          while (true) {
            int v30 = 4;
            int v31 = v3 % v30;
            int v32 = 1;
            int v33 = v31 + v32;
            bool v34 = v29 < v33;
            v28 = v28;
            v29 = v29;
            if (!v34) break;
            int v35 = 4;
            int v36 = 1;
            int v37 = v29 + v36;
            v28 = v35;
            v29 = v37;
          }
          v25 = v28;
          break;
        }
        default:
          {
          int v38 = 4;
          int v39 = v3 % v38;
          int v40 = 1;
          int v41;
          v41 = v40;
          switch (v39) {
            case 0:
              {
              int v42 = 1;
              int v43 = v0 + v42;
              v41 = v43;
            }
            case 1:
              {
              v41 = v0;
              break;
            }
            case 2:
              {
              int v44 = 1;
              int v45 = v0 + v44;
              v41 = v45;
              break;
            }
            default:
              {
              int v46 = 1;
              v41 = v46;
              break;
            }
          }
          v25 = v41;
          break;
        }
        case 1:
          {
          int v47 = 0;
          bool v48 = v2 != v47;
          int v49;
          if (v48) {
            v49 = v0;
          } else {
            int v50 = 3;
            int v51 = v0 + v50;
            v49 = v51;
          }
          v25 = v49;
          break;
        }
        case 2:
          {
          int v52 = 0;
          bool v53 = v2 != v52;
          int v54;
          if (v53) {
            v54 = v0;
          } else {
            int v55 = 0;
            v54 = v55;
          }
          v25 = v54;
          break;
        }
      }
      int v56 = 0;
      int v57 = v0 + v56;
      v7 = v25;
      break;
    }
    case 1:
      {
      int v58 = 0;
      int v59 = 0;
      int v60;
      int v61;
      v60 = v58;
      v61 = v59;
      while (true) {
        int v62 = 4;
        int v63 = v3 % v62;
        int v64 = 1;
        int v65 = v63 + v64;
        bool v66 = v61 < v65;
        v60 = v60;
        v61 = v61;
        if (!v66) break;
        int v67 = 1;
        int v68 = v61 + v67;
        v60 = v0;
        v61 = v68;
        continue;
        ;
      }
      int v69 = 0;
      v7 = v60;
      break;
    }
    case 2:
      {
      int v70 = 0;
      bool v71 = v2 != v70;
      int v72;
      if (v71) {
        int v73 = 3;
        int v74 = v3 % v73;
        int v75;
        v75 = v0;
        switch (v74) {
          case 0:
            {
            int v76 = 0;
            int v77 = v0 + v76;
            v75 = v77;
            break;
          }
          case 1:
            {
            v75 = v0;
            break;
          }
          default:
            {
            v75 = v0;
            break;
          }
        }
        int v78 = 1;
        v72 = v75;
      } else {
        int v79 = 3;
        int v80 = v3 % v79;
        int v81 = 2;
        int v82 = v0 + v81;
        int v83;
        v83 = v82;
        switch (v80) {
          default:
            {
            int v84 = 1;
            int v85 = v0 + v84;
            v83 = v85;
            break;
          }
          case 0:
            {
            v83 = v0;
            break;
          }
          case 1:
            {
            int v86 = 3;
            v83 = v86;
            break;
          }
          case 2:
            {
            v83 = v0;
            break;
          }
        }
        int v87 = 3;
        v72 = v83;
      }
      v7 = v72;
      break;
    }
  }
  bool v88 = true;
  int v89 = simt_wave_count_bits(v88);
  int v90 = 0;
  int v91 = v90 + v0;
  v1[v91] = v89;
  return;
}

kernel void kernel_main(device int* v92 [[buffer(0)]], device int* v93 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v94 = static_cast<int>(__simt_tid3.x);
  int v95 = 0;
  int v96 = v95 + v94;
  int v97 = v93[v96];
  int v98 = 4;
  int v99 = v98 + v94;
  int v100 = v93[v99];
  helper0(v94, v92, v97, v100, static_cast<int>(__simt_tid3.x));
  int v101 = 3;
  int v102 = v94 + v101;
  int v103 = 0;
  int v104 = 0;
  int v105;
  int v106;
  v105 = v103;
  v106 = v104;
  while (true) {
    int v107 = 4;
    int v108 = v106 * v107;
    int v109 = v108 + v94;
    int v110 = 8;
    int v111 = v110 + v109;
    int v112 = v93[v111];
    int v113 = 0;
    bool v114 = v112 != v113;
    v105 = v105;
    v106 = v106;
    if (!v114) break;
    int v115 = v105 + v106;
    int v116 = 1;
    int v117 = v106 + v116;
    v105 = v115;
    v106 = v117;
  }
  bool v118 = true;
  int v119 = 16;
  int v120 = v119 + v94;
  bool v121 = true;
  int v122 = simt_wave_count_bits(v121);
  v92[v120] = v122;
  int v123 = 28;
  int v124 = v123 + v94;
  int v125 = v93[v124];
  int v126 = 0;
  bool v127 = v125 != v126;
  int v128;
  if (v127) {
    int v129 = 2;
    int v130 = v94 + v129;
    v128 = v130;
  } else {
    int v131 = 32;
    int v132 = v131 + v94;
    int v133 = v93[v132];
    uint v134 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v135 = (int)(v134);
    int v136;
    v136 = v135;
    switch (v133) {
      case 0:
        {
        int v137 = 1;
        v136 = v137;
        break;
      }
      default:
        {
        v136 = v94;
        break;
      }
    }
    bool v138 = true;
    v128 = v136;
  }
  int v139 = 32;
  int v140 = v139 + v94;
  bool v141 = true;
  int v142 = simt_wave_count_bits(v141);
  v92[v140] = v142;
  int v143 = 36;
  int v144 = v143 + v94;
  int v145 = v93[v144];
  uint v146 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v147 = (int)(v146);
  int v148;
  v148 = v147;
  switch (v145) {
    case 0:
      {
      int v149 = 40;
      int v150 = v149 + v94;
      int v151 = v93[v150];
      int v152 = 0;
      bool v153 = v151 != v152;
      int v154;
      if (v153) {
        int v155 = 44;
        int v156 = v155 + v94;
        int v157 = v93[v156];
        int v158 = 3;
        int v159 = v94 + v158;
        int v160;
        v160 = v159;
        switch (v157) {
          default:
            {
            int v161 = 4;
            v160 = v161;
            break;
          }
          case 0:
            {
            int v162 = 1;
            int v163 = v94 + v162;
            v160 = v163;
            break;
          }
          case 1:
            {
            int v164 = 2;
            v160 = v164;
            break;
          }
        }
        bool v165 = true;
        v154 = v160;
      } else {
        int v166 = 48;
        int v167 = v166 + v94;
        int v168 = v93[v167];
        int v169;
        v169 = v94;
        switch (v168) {
          case 0:
            {
            v169 = v94;
            break;
          }
          default:
            {
            v169 = v94;
            break;
          }
        }
        bool v170 = true;
        v154 = v169;
      }
      v148 = v154;
    }
    case 1:
      {
      int v171 = 1;
      v148 = v171;
      break;
    }
    case 2:
      {
      v148 = v94;
      break;
    }
    default:
      {
      int v172 = 0;
      int v173 = 0;
      int v174;
      int v175;
      v174 = v172;
      v175 = v173;
      while (true) {
        int v176 = 4;
        int v177 = v175 * v176;
        int v178 = v177 + v94;
        int v179 = 52;
        int v180 = v179 + v178;
        int v181 = v93[v180];
        int v182 = 0;
        bool v183 = v181 != v182;
        v174 = v174;
        v175 = v175;
        if (!v183) break;
        int v184 = 72;
        int v185 = v184 + v94;
        int v186 = v93[v185];
        int v187 = 0;
        bool v188 = v186 != v187;
        int v189;
        if (v188) {
          v189 = v94;
        } else {
          int v190 = 1;
          int v191 = v94 + v190;
          v189 = v191;
        }
        int v192 = v174 + v189;
        int v193 = 1;
        int v194 = v175 + v193;
        v174 = v192;
        v175 = v194;
      }
      bool v195 = true;
      v148 = v174;
      break;
    }
  }
  bool v196 = true;
  int v197 = 48;
  int v198 = v197 + v94;
  bool v199 = true;
  int v200 = simt_wave_count_bits(v199);
  v92[v198] = v200;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
