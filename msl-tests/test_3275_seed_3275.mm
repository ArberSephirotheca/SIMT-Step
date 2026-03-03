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
    int v13 = 0;
    int v14 = 0;
    int v15;
    int v16;
    v15 = v13;
    v16 = v14;
    while (true) {
      int v17 = 4;
      int v18 = v3 % v17;
      int v19 = 1;
      int v20 = v18 + v19;
      bool v21 = v16 < v20;
      v15 = v15;
      v16 = v16;
      if (!v21) break;
      int v22 = 3;
      int v23 = v0 + v22;
      int v24 = 1;
      int v25 = v16 + v24;
      v15 = v23;
      v16 = v25;
    }
    uint v26 = simt_subgroup_id(__simt_tid);
    int v27 = (int)(v26);
    int v28 = 1;
    int v29 = v7 + v28;
    v6 = v15;
    v7 = v29;
    break;
    ;
  }
  bool v30 = true;
  int v31 = simt_wave_count_bits(v30);
  int v32 = 0;
  int v33 = v32 + v0;
  v1[v33] = v31;
  int v34 = 2;
  int v35 = v3 % v34;
  uint v36 = simt_subgroup_id(__simt_tid);
  int v37 = (int)(v36);
  int v38;
  v38 = v37;
  switch (v35) {
    default:
      {
      int v39 = 3;
      int v40 = v3 % v39;
      int v41 = 1;
      int v42;
      v42 = v41;
      switch (v40) {
        case 0:
          {
          int v43 = 4;
          int v44 = v0 + v43;
          int v45;
          v45 = v44;
          switch (v3) {
            case 0:
              {
              int v46 = 2;
              int v47 = v0 + v46;
              v45 = v47;
              break;
            }
            default:
              {
              v45 = v0;
              break;
            }
          }
          int v48 = 1;
          int v49 = v0 + v48;
          v42 = v45;
        }
        case 1:
          {
          int v50 = 0;
          v42 = v50;
        }
        default:
          {
          int v51 = 3;
          int v52 = v3 % v51;
          int v53 = 0;
          int v54;
          v54 = v53;
          switch (v52) {
            default:
              {
              v54 = v0;
              break;
            }
            case 0:
              {
              int v55 = 0;
              v54 = v55;
              break;
            }
            case 1:
              {
              int v56 = 4;
              int v57 = v0 + v56;
              v54 = v57;
              break;
            }
          }
          v42 = v54;
          break;
        }
        case 2:
          {
          int v58 = 0;
          bool v59 = v2 != v58;
          int v60;
          if (v59) {
            int v61 = 0;
            v60 = v61;
          } else {
            int v62 = 4;
            int v63 = v0 + v62;
            v60 = v63;
          }
          int v64 = 0;
          v42 = v60;
          break;
        }
      }
      v38 = v42;
      break;
    }
    case 0:
      {
      int v65 = 0;
      bool v66 = v2 != v65;
      int v67;
      if (v66) {
        int v68 = 2;
        int v69 = v3 % v68;
        int v70;
        v70 = v0;
        switch (v69) {
          default:
            {
            v70 = v0;
            break;
          }
          case 0:
            {
            v70 = v0;
            break;
          }
          case 1:
            {
            int v71 = 0;
            int v72 = v0 + v71;
            v70 = v72;
            break;
          }
        }
        int v73 = 4;
        v67 = v70;
      } else {
        int v74 = 3;
        int v75 = v3 % v74;
        int v76;
        v76 = v0;
        switch (v75) {
          case 0:
            {
            v76 = v0;
            break;
          }
          case 1:
            {
            int v77 = 3;
            int v78 = v0 + v77;
            v76 = v78;
            break;
          }
          default:
            {
            int v79 = 3;
            int v80 = v0 + v79;
            v76 = v80;
            break;
          }
        }
        int v81 = 1;
        int v82 = v0 + v81;
        v67 = v76;
      }
      v38 = v67;
      break;
    }
    case 1:
      {
      int v83 = 0;
      bool v84 = v2 != v83;
      int v85;
      if (v84) {
        int v86 = 3;
        int v87 = v3 % v86;
        int v88 = 0;
        int v89 = v0 + v88;
        int v90;
        v90 = v89;
        switch (v87) {
          default:
            {
            int v91 = 0;
            int v92 = v0 + v91;
            v90 = v92;
            break;
          }
          case 0:
            {
            v90 = v0;
            break;
          }
          case 1:
            {
            v90 = v0;
            break;
          }
        }
        v85 = v90;
      } else {
        int v93 = 0;
        bool v94 = v2 != v93;
        int v95;
        if (v94) {
          int v96 = 0;
          v95 = v96;
        } else {
          v95 = v0;
        }
        int v97 = 2;
        int v98 = v0 + v97;
        v85 = v95;
      }
      int v99 = 4;
      int v100 = v0 + v99;
      v38 = v85;
      break;
    }
  }
  bool v101 = true;
  int v102 = simt_wave_count_bits(v101);
  int v103 = 16;
  int v104 = v103 + v0;
  v1[v104] = v102;
  int v105 = 0;
  bool v106 = v2 != v105;
  int v107 = v106 ? v6 : v38;
  return;
}

kernel void kernel_main(device int* v108 [[buffer(0)]], device int* v109 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v110 = static_cast<int>(__simt_tid3.x);
  int v111 = 0;
  int v112 = v111 + v110;
  int v113 = v109[v112];
  int v114 = 4;
  int v115 = v114 + v110;
  int v116 = v109[v115];
  helper0(v110, v108, v113, v116, static_cast<int>(__simt_tid3.x));
  int v117 = 8;
  int v118 = v117 + v110;
  int v119 = v109[v118];
  int v120 = 0;
  bool v121 = v119 != v120;
  int v122;
  if (v121) {
    int v123 = 12;
    int v124 = v123 + v110;
    int v125 = v109[v124];
    uint v126 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v127 = (int)(v126);
    int v128;
    v128 = v127;
    switch (v125) {
      case 0:
        {
        int v129 = 2;
        int v130 = v110 + v129;
        v128 = v130;
        break;
      }
      default:
        {
        int v131 = 2;
        v128 = v131;
        break;
      }
      case 1:
        {
        int v132 = 0;
        int v133 = 0;
        int v134;
        int v135;
        v134 = v132;
        v135 = v133;
        while (true) {
          int v136 = 4;
          int v137 = v135 * v136;
          int v138 = v137 + v110;
          int v139 = 16;
          int v140 = v139 + v138;
          int v141 = v109[v140];
          int v142 = 0;
          bool v143 = v141 != v142;
          v134 = v134;
          v135 = v135;
          if (!v143) break;
          int v144 = v134 + v135;
          int v145 = 1;
          int v146 = v135 + v145;
          v134 = v144;
          v135 = v146;
        }
        bool v147 = true;
        v128 = v134;
        break;
      }
      case 2:
        {
        int v148 = 36;
        int v149 = v148 + v110;
        int v150 = v109[v149];
        int v151 = 3;
        int v152;
        v152 = v151;
        switch (v150) {
          default:
            {
            int v153 = 3;
            int v154 = v110 + v153;
            v152 = v154;
            break;
          }
          case 0:
            {
            v152 = v110;
            break;
          }
        }
        bool v155 = true;
        v128 = v152;
        break;
      }
    }
    bool v156 = true;
    v122 = v128;
  } else {
    int v157 = 40;
    int v158 = v157 + v110;
    int v159 = v109[v158];
    uint v160 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v161 = (int)(v160);
    int v162;
    v162 = v161;
    switch (v159) {
      case 0:
        {
        int v163 = 0;
        int v164 = 0;
        int v165;
        int v166;
        v165 = v163;
        v166 = v164;
        while (true) {
          int v167 = 4;
          int v168 = v166 * v167;
          int v169 = v168 + v110;
          int v170 = 44;
          int v171 = v170 + v169;
          int v172 = v109[v171];
          int v173 = 0;
          bool v174 = v172 != v173;
          v165 = v165;
          v166 = v166;
          if (!v174) break;
          int v175 = v165 + v166;
          int v176 = 1;
          int v177 = v166 + v176;
          v165 = v175;
          v166 = v177;
          break;
          ;
        }
        bool v178 = true;
        v162 = v165;
      }
      case 1:
        {
        int v179 = 64;
        int v180 = v179 + v110;
        int v181 = v109[v180];
        int v182;
        v182 = v110;
        switch (v181) {
          default:
            {
            int v183 = 0;
            v182 = v183;
            break;
          }
          case 0:
            {
            v182 = v110;
            break;
          }
          case 1:
            {
            v182 = v110;
            break;
          }
        }
        bool v184 = true;
        v162 = v182;
      }
      case 2:
        {
        int v185 = 68;
        int v186 = v185 + v110;
        int v187 = v109[v186];
        int v188;
        v188 = v110;
        switch (v187) {
          default:
            {
            v188 = v110;
          }
          case 0:
            {
            int v189 = 0;
            v188 = v189;
          }
          case 1:
            {
            int v190 = 4;
            v188 = v190;
            break;
          }
        }
        bool v191 = true;
        v162 = v188;
        break;
      }
      default:
        {
        int v192 = 72;
        int v193 = v192 + v110;
        int v194 = v109[v193];
        int v195;
        v195 = v110;
        switch (v194) {
          case 0:
            {
            int v196 = 4;
            int v197 = v110 + v196;
            v195 = v197;
            break;
          }
          default:
            {
            v195 = v110;
            break;
          }
        }
        bool v198 = true;
        v162 = v195;
        break;
      }
    }
    bool v199 = true;
    v122 = v162;
  }
  int v200 = 32;
  int v201 = v200 + v110;
  bool v202 = true;
  int v203 = simt_wave_count_bits(v202);
  v108[v201] = v203;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
