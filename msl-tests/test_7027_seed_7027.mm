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
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      case 0:
        {
        int v12 = 2;
        int v13 = v3 % v12;
        int v14;
        v14 = v0;
        switch (v13) {
          case 0:
            {
            int v15 = 2;
            int v16 = v0 + v15;
            v14 = v16;
            break;
          }
          case 1:
            {
            int v17 = 2;
            int v18 = v0 + v17;
            v14 = v18;
          }
          default:
            {
            int v19 = 1;
            int v20 = v0 + v19;
            v14 = v20;
            break;
          }
        }
        v11 = v14;
        break;
      }
      default:
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
        }
        v11 = v23;
        break;
      }
      case 1:
        {
        int v32 = 3;
        v11 = v32;
        break;
      }
      case 2:
        {
        int v33 = 2;
        int v34 = v3 % v33;
        int v35;
        v35 = v0;
        switch (v34) {
          case 0:
            {
            int v36 = 4;
            v35 = v36;
            break;
          }
          default:
            {
            int v37 = 3;
            int v38 = v0 + v37;
            v35 = v38;
            break;
          }
        }
        int v39 = 3;
        int v40 = v0 + v39;
        v11 = v35;
        break;
      }
    }
    uint v41 = simt_subgroup_id(__simt_tid);
    int v42 = (int)(v41);
    v6 = v11;
  } else {
    int v43 = 4;
    int v44 = v3 % v43;
    int v45 = 0;
    int v46;
    v46 = v45;
    switch (v44) {
      case 0:
        {
        int v47 = 1;
        int v48 = v0 + v47;
        int v49;
        v49 = v48;
        switch (v3) {
          case 0:
            {
            v49 = v0;
            break;
          }
          default:
            {
            int v50 = 0;
            v49 = v50;
            break;
          }
        }
        v46 = v49;
        break;
      }
      case 1:
        {
        int v51 = 2;
        int v52 = v3 % v51;
        int v53 = 1;
        int v54 = v0 + v53;
        int v55;
        v55 = v54;
        switch (v52) {
          case 0:
            {
            int v56 = 2;
            v55 = v56;
          }
          default:
            {
            int v57 = 3;
            int v58 = v0 + v57;
            v55 = v58;
            break;
          }
        }
        int v59 = 1;
        v46 = v55;
        break;
      }
      case 2:
        {
        int v60 = 0;
        bool v61 = v2 != v60;
        int v62;
        if (v61) {
          int v63 = 1;
          v62 = v63;
        } else {
          int v64 = 3;
          int v65 = v0 + v64;
          v62 = v65;
        }
        int v66 = 0;
        v46 = v62;
        break;
      }
      default:
        {
        int v67 = 3;
        int v68 = v3 % v67;
        int v69 = 0;
        int v70;
        v70 = v69;
        switch (v68) {
          case 0:
            {
            int v71 = 2;
            v70 = v71;
            break;
          }
          default:
            {
            int v72 = 2;
            int v73 = v0 + v72;
            v70 = v73;
            break;
          }
          case 1:
            {
            int v74 = 0;
            v70 = v74;
            break;
          }
        }
        int v75 = 4;
        int v76 = v0 + v75;
        v46 = v70;
        break;
      }
    }
    int v77 = 4;
    v6 = v46;
  }
  bool v78 = true;
  int v79 = simt_wave_count_bits(v78);
  int v80 = 0;
  int v81 = v80 + v0;
  v1[v81] = v79;
  return;
}

kernel void kernel_main(device int* v82 [[buffer(0)]], device int* v83 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v84 = static_cast<int>(__simt_tid3.x);
  int v85 = 0;
  int v86 = v85 + v84;
  int v87 = v83[v86];
  int v88 = 4;
  int v89 = v88 + v84;
  int v90 = v83[v89];
  helper0(v84, v82, v87, v90, static_cast<int>(__simt_tid3.x));
  int v91 = 8;
  int v92 = v91 + v84;
  int v93 = v83[v92];
  int v94 = 0;
  bool v95 = v93 != v94;
  int v96;
  if (v95) {
    int v97 = 12;
    int v98 = v97 + v84;
    int v99 = v83[v98];
    int v100 = 0;
    bool v101 = v99 != v100;
    int v102;
    if (v101) {
      uint v103 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v104 = (int)(v103);
      v102 = v104;
    } else {
      v102 = v84;
    }
    v96 = v102;
  } else {
    v96 = v84;
  }
  int v105 = 16;
  int v106 = v105 + v84;
  bool v107 = true;
  int v108 = simt_wave_count_bits(v107);
  v82[v106] = v108;
  int v109 = 16;
  int v110 = v109 + v84;
  int v111 = v83[v110];
  int v112 = 0;
  bool v113 = v111 != v112;
  int v114;
  if (v113) {
    int v115 = 20;
    int v116 = v115 + v84;
    int v117 = v83[v116];
    uint v118 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v119 = (int)(v118);
    int v120;
    v120 = v119;
    switch (v117) {
      case 0:
        {
        int v121 = 24;
        int v122 = v121 + v84;
        int v123 = v83[v122];
        int v124 = 0;
        bool v125 = v123 != v124;
        int v126;
        if (v125) {
          int v127 = 4;
          int v128 = v84 + v127;
          v126 = v128;
        } else {
          int v129 = 2;
          int v130 = v84 + v129;
          v126 = v130;
        }
        v120 = v126;
        break;
      }
      case 1:
        {
        int v131 = 28;
        int v132 = v131 + v84;
        int v133 = v83[v132];
        int v134 = 0;
        int v135 = v84 + v134;
        int v136;
        v136 = v135;
        switch (v133) {
          default:
            {
            int v137 = 2;
            v136 = v137;
            break;
          }
          case 0:
            {
            int v138 = 4;
            int v139 = v84 + v138;
            v136 = v139;
            break;
          }
          case 1:
            {
            int v140 = 3;
            v136 = v140;
            break;
          }
        }
        bool v141 = true;
        v120 = v136;
        break;
      }
      default:
        {
        int v142 = 0;
        int v143 = 0;
        int v144;
        int v145;
        v144 = v142;
        v145 = v143;
        while (true) {
          int v146 = 4;
          int v147 = v145 * v146;
          int v148 = v147 + v84;
          int v149 = 32;
          int v150 = v149 + v148;
          int v151 = v83[v150];
          int v152 = 0;
          bool v153 = v151 != v152;
          v144 = v144;
          v145 = v145;
          if (!v153) break;
          int v154 = v144 + v145;
          int v155 = 1;
          int v156 = v145 + v155;
          v144 = v154;
          v145 = v156;
        }
        bool v157 = true;
        v120 = v144;
        break;
      }
    }
    bool v158 = true;
    v114 = v120;
  } else {
    int v159 = 52;
    int v160 = v159 + v84;
    int v161 = v83[v160];
    int v162;
    v162 = v84;
    switch (v161) {
      case 0:
        {
        int v163 = 2;
        int v164 = v84 + v163;
        v162 = v164;
      }
      case 1:
        {
        int v165 = 3;
        v162 = v165;
      }
      case 2:
        {
        int v166 = 56;
        int v167 = v166 + v84;
        int v168 = v83[v167];
        int v169 = 0;
        bool v170 = v168 != v169;
        int v171;
        if (v170) {
          int v172 = 2;
          int v173 = v84 + v172;
          v171 = v173;
        } else {
          int v174 = 1;
          int v175 = v84 + v174;
          v171 = v175;
        }
        v162 = v171;
      }
      default:
        {
        int v176 = 0;
        int v177 = 0;
        int v178;
        int v179;
        v178 = v176;
        v179 = v177;
        while (true) {
          int v180 = 4;
          int v181 = v179 * v180;
          int v182 = v181 + v84;
          int v183 = 60;
          int v184 = v183 + v182;
          int v185 = v83[v184];
          int v186 = 0;
          bool v187 = v185 != v186;
          v178 = v178;
          v179 = v179;
          if (!v187) break;
          int v188 = v178 + v179;
          int v189 = 1;
          int v190 = v179 + v189;
          v178 = v188;
          v179 = v190;
        }
        bool v191 = true;
        v162 = v178;
        break;
      }
    }
    bool v192 = true;
    v114 = v162;
  }
  int v193 = 32;
  int v194 = v193 + v84;
  bool v195 = true;
  int v196 = simt_wave_count_bits(v195);
  v82[v194] = v196;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
