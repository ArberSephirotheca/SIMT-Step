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
    int v7 = 0;
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      int v10 = 0;
      int v11 = 0;
      int v12;
      int v13;
      v12 = v10;
      v13 = v11;
      while (true) {
        int v14 = 4;
        int v15 = v3 % v14;
        int v16 = 1;
        int v17 = v15 + v16;
        bool v18 = v13 < v17;
        v12 = v12;
        v13 = v13;
        if (!v18) break;
        int v19 = 1;
        int v20 = v13 + v19;
        v12 = v0;
        v13 = v20;
      }
      v9 = v12;
    } else {
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
        uint v30 = simt_subgroup_id(__simt_tid);
        int v31 = (int)(v30);
        int v32 = 1;
        int v33 = v24 + v32;
        v23 = v31;
        v24 = v33;
      }
      uint v34 = simt_subgroup_id(__simt_tid);
      int v35 = (int)(v34);
      v9 = v23;
    }
    uint v36 = simt_subgroup_id(__simt_tid);
    int v37 = (int)(v36);
    v6 = v9;
  } else {
    int v38 = 2;
    int v39 = v3 % v38;
    uint v40 = simt_lane_id(__simt_tid);
    int v41 = (int)(v40);
    int v42;
    v42 = v41;
    switch (v39) {
      default:
        {
        int v43 = 3;
        int v44 = v3 % v43;
        int v45;
        v45 = v0;
        switch (v44) {
          case 0:
            {
            int v46 = 2;
            v45 = v46;
            break;
          }
          case 1:
            {
            int v47 = 2;
            int v48 = v0 + v47;
            v45 = v48;
          }
          default:
            {
            int v49 = 4;
            int v50 = v0 + v49;
            v45 = v50;
            break;
          }
        }
        v42 = v45;
        break;
      }
      case 0:
        {
        int v51 = 3;
        int v52 = v3 % v51;
        int v53;
        v53 = v0;
        switch (v52) {
          case 0:
            {
            int v54 = 1;
            v53 = v54;
          }
          case 1:
            {
            int v55 = 2;
            int v56 = v0 + v55;
            v53 = v56;
            break;
          }
          default:
            {
            int v57 = 2;
            int v58 = v0 + v57;
            v53 = v58;
          }
          case 2:
            {
            int v59 = 4;
            v53 = v59;
            break;
          }
        }
        int v60 = 4;
        int v61 = v0 + v60;
        v42 = v53;
        break;
      }
    }
    v6 = v42;
  }
  bool v62 = true;
  int v63 = simt_wave_count_bits(v62);
  int v64 = 0;
  int v65 = v64 + v0;
  v1[v65] = v63;
  return;
}

kernel void kernel_main(device int* v66 [[buffer(0)]], device int* v67 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v68 = static_cast<int>(__simt_tid3.x);
  int v69 = 0;
  int v70 = v69 + v68;
  int v71 = v67[v70];
  int v72 = 4;
  int v73 = v72 + v68;
  int v74 = v67[v73];
  helper0(v68, v66, v71, v74, static_cast<int>(__simt_tid3.x));
  int v75 = 8;
  int v76 = v75 + v68;
  int v77 = v67[v76];
  uint v78 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v79 = (int)(v78);
  int v80;
  v80 = v79;
  switch (v77) {
    case 0:
      {
      int v81 = 0;
      int v82 = v68 + v81;
      v80 = v82;
      break;
    }
    case 1:
      {
      int v83 = 12;
      int v84 = v83 + v68;
      int v85 = v67[v84];
      int v86;
      v86 = v68;
      switch (v85) {
        case 0:
          {
          v86 = v68;
          break;
        }
        default:
          {
          int v87 = 16;
          int v88 = v87 + v68;
          int v89 = v67[v88];
          int v90 = 1;
          int v91 = v68 + v90;
          int v92;
          v92 = v91;
          switch (v89) {
            case 0:
              {
              int v93 = 1;
              int v94 = v68 + v93;
              v92 = v94;
              break;
            }
            default:
              {
              int v95 = 3;
              int v96 = v68 + v95;
              v92 = v96;
              break;
            }
            case 1:
              {
              int v97 = 4;
              int v98 = v68 + v97;
              v92 = v98;
              break;
            }
            case 2:
              {
              v92 = v68;
              break;
            }
          }
          bool v99 = true;
          v86 = v92;
          break;
        }
        case 1:
          {
          int v100 = 20;
          int v101 = v100 + v68;
          int v102 = v67[v101];
          int v103 = 0;
          bool v104 = v102 != v103;
          int v105;
          if (v104) {
            int v106 = 3;
            v105 = v106;
          } else {
            int v107 = 3;
            v105 = v107;
          }
          v86 = v105;
          break;
        }
      }
      bool v108 = true;
      v80 = v86;
      break;
    }
    default:
      {
      int v109 = 2;
      v80 = v109;
      break;
    }
    case 2:
      {
      int v110 = 24;
      int v111 = v110 + v68;
      int v112 = v67[v111];
      int v113 = 2;
      int v114;
      v114 = v113;
      switch (v112) {
        case 0:
          {
          int v115 = 0;
          int v116 = 0;
          int v117;
          int v118;
          v117 = v115;
          v118 = v116;
          while (true) {
            int v119 = 4;
            int v120 = v118 * v119;
            int v121 = v120 + v68;
            int v122 = 28;
            int v123 = v122 + v121;
            int v124 = v67[v123];
            int v125 = 0;
            bool v126 = v124 != v125;
            v117 = v117;
            v118 = v118;
            if (!v126) break;
            int v127 = v117 + v118;
            int v128 = 1;
            int v129 = v118 + v128;
            v117 = v127;
            v118 = v129;
          }
          bool v130 = true;
          v114 = v117;
        }
        default:
          {
          int v131 = 48;
          int v132 = v131 + v68;
          int v133 = v67[v132];
          int v134;
          v134 = v68;
          switch (v133) {
            case 0:
              {
              int v135 = 0;
              int v136 = v68 + v135;
              v134 = v136;
              break;
            }
            case 1:
              {
              int v137 = 0;
              int v138 = v68 + v137;
              v134 = v138;
              break;
            }
            default:
              {
              int v139 = 4;
              int v140 = v68 + v139;
              v134 = v140;
              break;
            }
            case 2:
              {
              int v141 = 4;
              int v142 = v68 + v141;
              v134 = v142;
              break;
            }
          }
          bool v143 = true;
          v114 = v134;
          break;
        }
      }
      bool v144 = true;
      v80 = v114;
      break;
    }
  }
  bool v145 = true;
  int v146 = 16;
  int v147 = v146 + v68;
  bool v148 = true;
  int v149 = simt_wave_count_bits(v148);
  v66[v147] = v149;
  uint v150 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v151 = (int)(v150);
  int v152 = 52;
  int v153 = v152 + v68;
  int v154 = v67[v153];
  int v155;
  v155 = v68;
  switch (v154) {
    default:
      {
      int v156 = 3;
      v155 = v156;
      break;
    }
    case 0:
      {
      int v157 = 56;
      int v158 = v157 + v68;
      int v159 = v67[v158];
      int v160 = 0;
      bool v161 = v159 != v160;
      int v162;
      if (v161) {
        int v163 = 0;
        int v164 = 0;
        int v165;
        int v166;
        v165 = v163;
        v166 = v164;
        while (true) {
          int v167 = 4;
          int v168 = v166 * v167;
          int v169 = v168 + v68;
          int v170 = 60;
          int v171 = v170 + v169;
          int v172 = v67[v171];
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
        }
        bool v178 = true;
        v162 = v165;
      } else {
        int v179 = 1;
        v162 = v179;
      }
      v155 = v162;
    }
    case 1:
      {
      int v180 = 3;
      int v181 = v68 + v180;
      v155 = v181;
    }
    case 2:
      {
      int v182 = 0;
      int v183 = 0;
      int v184;
      int v185;
      v184 = v182;
      v185 = v183;
      while (true) {
        int v186 = 4;
        int v187 = v185 * v186;
        int v188 = v187 + v68;
        int v189 = 80;
        int v190 = v189 + v188;
        int v191 = v67[v190];
        int v192 = 0;
        bool v193 = v191 != v192;
        v184 = v184;
        v185 = v185;
        if (!v193) break;
        int v194 = 2;
        int v195 = v184 + v194;
        int v196 = 1;
        int v197 = v185 + v196;
        v184 = v195;
        v185 = v197;
      }
      bool v198 = true;
      v155 = v184;
      break;
    }
  }
  bool v199 = true;
  int v200 = 32;
  int v201 = v200 + v68;
  bool v202 = true;
  int v203 = simt_wave_count_bits(v202);
  v66[v201] = v203;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
