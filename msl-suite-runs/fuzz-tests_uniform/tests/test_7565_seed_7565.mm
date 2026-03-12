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
  int v4 = 3;
  int v5 = v3 % v4;
  int v6 = 0;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8;
      v8 = v0;
      switch (v3) {
        case 0:
          {
          int v9 = 3;
          int v10 = v0 + v9;
          v8 = v10;
        }
        default:
          {
          int v11 = 0;
          int v12 = 0;
          int v13;
          int v14;
          v13 = v11;
          v14 = v12;
          while (true) {
            int v15 = 4;
            int v16 = v3 % v15;
            int v17 = 1;
            int v18 = v16 + v17;
            bool v19 = v14 < v18;
            v13 = v13;
            v14 = v14;
            if (!v19) break;
            int v20 = 1;
            int v21 = v14 + v20;
            v13 = v0;
            v14 = v21;
          }
          int v22 = 3;
          int v23 = v0 + v22;
          v8 = v13;
          break;
        }
      }
      int v24 = 4;
      int v25 = v0 + v24;
      v7 = v8;
      break;
    }
    case 1:
      {
      int v26 = 0;
      int v27 = v0 + v26;
      int v28;
      v28 = v27;
      switch (v3) {
        case 0:
          {
          int v29 = 0;
          int v30 = 0;
          int v31;
          int v32;
          v31 = v29;
          v32 = v30;
          while (true) {
            int v33 = 4;
            int v34 = v3 % v33;
            int v35 = 1;
            int v36 = v34 + v35;
            bool v37 = v32 < v36;
            v31 = v31;
            v32 = v32;
            if (!v37) break;
            int v38 = 0;
            int v39 = 1;
            int v40 = v32 + v39;
            v31 = v38;
            v32 = v40;
          }
          int v41 = 0;
          int v42 = v0 + v41;
          v28 = v31;
          break;
        }
        default:
          {
          int v43 = 0;
          bool v44 = v2 != v43;
          int v45;
          if (v44) {
            int v46 = 1;
            v45 = v46;
          } else {
            int v47 = 1;
            int v48 = v0 + v47;
            v45 = v48;
          }
          int v49 = 1;
          v28 = v45;
          break;
        }
      }
      int v50 = 4;
      int v51 = v0 + v50;
      v7 = v28;
      break;
    }
    default:
      {
      int v52 = 0;
      int v53 = 0;
      int v54;
      int v55;
      v54 = v52;
      v55 = v53;
      while (true) {
        int v56 = 4;
        int v57 = v3 % v56;
        int v58 = 1;
        int v59 = v57 + v58;
        bool v60 = v55 < v59;
        v54 = v54;
        v55 = v55;
        if (!v60) break;
        int v61 = 0;
        int v62 = v0 + v61;
        int v63;
        v63 = v62;
        switch (v3) {
          case 0:
            {
            int v64 = 4;
            v63 = v64;
            break;
          }
          default:
            {
            v63 = v0;
            break;
          }
        }
        int v65 = 1;
        int v66 = v55 + v65;
        v54 = v63;
        v55 = v66;
      }
      int v67 = 4;
      v7 = v54;
      break;
    }
    case 2:
      {
      int v68 = 0;
      int v69 = v0 + v68;
      int v70;
      v70 = v69;
      switch (v3) {
        case 0:
          {
          int v71 = 3;
          int v72 = v3 % v71;
          int v73 = 2;
          int v74;
          v74 = v73;
          switch (v72) {
            case 0:
              {
              int v75 = 2;
              v74 = v75;
              break;
            }
            default:
              {
              v74 = v0;
              break;
            }
            case 1:
              {
              int v76 = 2;
              v74 = v76;
              break;
            }
          }
          int v77 = 0;
          v70 = v74;
          break;
        }
        default:
          {
          int v78 = 0;
          int v79 = 0;
          int v80;
          int v81;
          v80 = v78;
          v81 = v79;
          while (true) {
            int v82 = 4;
            int v83 = v3 % v82;
            int v84 = 1;
            int v85 = v83 + v84;
            bool v86 = v81 < v85;
            v80 = v80;
            v81 = v81;
            if (!v86) break;
            int v87 = 3;
            int v88 = 1;
            int v89 = v81 + v88;
            v80 = v87;
            v81 = v89;
          }
          v70 = v80;
          break;
        }
      }
      int v90 = 1;
      v7 = v70;
      break;
    }
  }
  bool v91 = true;
  int v92 = simt_wave_count_bits(v91);
  int v93 = 0;
  int v94 = v93 + v0;
  v1[v94] = v92;
  return;
}

kernel void kernel_main(device int* v95 [[buffer(0)]], device int* v96 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v97 = static_cast<int>(__simt_tid3.x);
  int v98 = 0;
  int v99 = v98 + v97;
  int v100 = v96[v99];
  int v101 = 4;
  int v102 = v101 + v97;
  int v103 = v96[v102];
  helper0(v97, v95, v100, v103, static_cast<int>(__simt_tid3.x));
  int v104 = 8;
  int v105 = v104 + v97;
  int v106 = v96[v105];
  int v107 = 0;
  bool v108 = v106 != v107;
  int v109;
  if (v108) {
    int v110 = 12;
    int v111 = v110 + v97;
    int v112 = v96[v111];
    int v113 = 3;
    int v114;
    v114 = v113;
    switch (v112) {
      default:
        {
        int v115 = 4;
        int v116 = v97 + v115;
        v114 = v116;
        break;
      }
      case 0:
        {
        int v117 = 16;
        int v118 = v117 + v97;
        int v119 = v96[v118];
        int v120;
        v120 = v97;
        switch (v119) {
          case 0:
            {
            int v121 = 4;
            int v122 = v97 + v121;
            v120 = v122;
          }
          case 1:
            {
            int v123 = 1;
            int v124 = v97 + v123;
            v120 = v124;
            break;
          }
          case 2:
            {
            int v125 = 2;
            int v126 = v97 + v125;
            v120 = v126;
            break;
          }
          default:
            {
            int v127 = 0;
            int v128 = v97 + v127;
            v120 = v128;
            break;
          }
        }
        bool v129 = true;
        v114 = v120;
      }
      case 1:
        {
        int v130 = 20;
        int v131 = v130 + v97;
        int v132 = v96[v131];
        int v133 = 2;
        int v134;
        v134 = v133;
        switch (v132) {
          case 0:
            {
            v134 = v97;
            break;
          }
          case 1:
            {
            int v135 = 1;
            int v136 = v97 + v135;
            v134 = v136;
            break;
          }
          case 2:
            {
            int v137 = 4;
            int v138 = v97 + v137;
            v134 = v138;
            break;
          }
          default:
            {
            int v139 = 0;
            v134 = v139;
            break;
          }
        }
        bool v140 = true;
        v114 = v134;
        break;
      }
      case 2:
        {
        int v141 = 24;
        int v142 = v141 + v97;
        int v143 = v96[v142];
        int v144 = 0;
        int v145;
        v145 = v144;
        switch (v143) {
          case 0:
            {
            v145 = v97;
          }
          default:
            {
            int v146 = 4;
            v145 = v146;
            break;
          }
          case 1:
            {
            int v147 = 3;
            v145 = v147;
          }
          case 2:
            {
            int v148 = 4;
            int v149 = v97 + v148;
            v145 = v149;
            break;
          }
        }
        bool v150 = true;
        v114 = v145;
        break;
      }
    }
    bool v151 = true;
    v109 = v114;
  } else {
    int v152 = 28;
    int v153 = v152 + v97;
    int v154 = v96[v153];
    int v155;
    v155 = v97;
    switch (v154) {
      default:
        {
        int v156 = 1;
        v155 = v156;
        break;
      }
      case 0:
        {
        int v157 = 32;
        int v158 = v157 + v97;
        int v159 = v96[v158];
        int v160 = 3;
        int v161 = v97 + v160;
        int v162;
        v162 = v161;
        switch (v159) {
          case 0:
            {
            int v163 = 0;
            int v164 = v97 + v163;
            v162 = v164;
          }
          default:
            {
            int v165 = 4;
            v162 = v165;
            break;
          }
        }
        bool v166 = true;
        v155 = v162;
        break;
      }
    }
    bool v167 = true;
    v109 = v155;
  }
  int v168 = 16;
  int v169 = v168 + v97;
  bool v170 = true;
  int v171 = simt_wave_count_bits(v170);
  v95[v169] = v171;
  int v172 = 0;
  int v173 = 0;
  int v174;
  int v175;
  v174 = v172;
  v175 = v173;
  while (true) {
    int v176 = 4;
    int v177 = v175 * v176;
    int v178 = v177 + v97;
    int v179 = 36;
    int v180 = v179 + v178;
    int v181 = v96[v180];
    int v182 = 0;
    bool v183 = v181 != v182;
    v174 = v174;
    v175 = v175;
    if (!v183) break;
    int v184 = v174 + v175;
    int v185 = 1;
    int v186 = v175 + v185;
    v174 = v184;
    v175 = v186;
    continue;
    ;
  }
  bool v187 = true;
  int v188 = 32;
  int v189 = v188 + v97;
  bool v190 = true;
  int v191 = simt_wave_count_bits(v190);
  v95[v189] = v191;
  uint v192 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v193 = (int)(v192);
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
