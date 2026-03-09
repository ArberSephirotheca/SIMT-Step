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
      int v22 = 0;
      bool v23 = v2 != v22;
      int v24;
      if (v23) {
        int v25 = 0;
        int v26 = v0 + v25;
        v24 = v26;
      } else {
        uint v27 = simt_lane_id(__simt_tid);
        int v28 = (int)(v27);
        v24 = v28;
      }
      uint v29 = simt_subgroup_id(__simt_tid);
      int v30 = (int)(v29);
      int v31 = 1;
      int v32 = v16 + v31;
      v15 = v24;
      v16 = v32;
    }
    int v33 = 1;
    int v34 = v7 + v33;
    v6 = v15;
    v7 = v34;
    break;
    ;
  }
  bool v35 = true;
  int v36 = simt_wave_count_bits(v35);
  int v37 = 0;
  int v38 = v37 + v0;
  v1[v38] = v36;
  return;
}

kernel void kernel_main(device int* v39 [[buffer(0)]], device int* v40 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v41 = static_cast<int>(__simt_tid3.x);
  int v42 = 0;
  int v43 = v42 + v41;
  int v44 = v40[v43];
  int v45 = 4;
  int v46 = v45 + v41;
  int v47 = v40[v46];
  helper0(v41, v39, v44, v47, static_cast<int>(__simt_tid3.x));
  int v48 = 8;
  int v49 = v48 + v41;
  int v50 = v40[v49];
  uint v51 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v52 = (int)(v51);
  int v53;
  v53 = v52;
  switch (v50) {
    default:
      {
      int v54 = 12;
      int v55 = v54 + v41;
      int v56 = v40[v55];
      int v57;
      v57 = v41;
      switch (v56) {
        case 0:
          {
          int v58 = 16;
          int v59 = v58 + v41;
          int v60 = v40[v59];
          int v61 = 0;
          bool v62 = v60 != v61;
          int v63;
          if (v62) {
            int v64 = 0;
            v63 = v64;
          } else {
            v63 = v41;
          }
          v57 = v63;
          break;
        }
        case 1:
          {
          int v65 = 20;
          int v66 = v65 + v41;
          int v67 = v40[v66];
          int v68 = 0;
          bool v69 = v67 != v68;
          int v70;
          if (v69) {
            int v71 = 1;
            int v72 = v41 + v71;
            v70 = v72;
          } else {
            int v73 = 2;
            int v74 = v41 + v73;
            v70 = v74;
          }
          v57 = v70;
          break;
        }
        case 2:
          {
          int v75 = 24;
          int v76 = v75 + v41;
          int v77 = v40[v76];
          int v78 = 0;
          bool v79 = v77 != v78;
          int v80;
          if (v79) {
            v80 = v41;
          } else {
            v80 = v41;
          }
          v57 = v80;
          break;
        }
        default:
          {
          int v81 = 28;
          int v82 = v81 + v41;
          int v83 = v40[v82];
          int v84 = 1;
          int v85;
          v85 = v84;
          switch (v83) {
            default:
              {
              int v86 = 1;
              int v87 = v41 + v86;
              v85 = v87;
            }
            case 0:
              {
              int v88 = 4;
              int v89 = v41 + v88;
              v85 = v89;
            }
            case 1:
              {
              v85 = v41;
              break;
            }
            case 2:
              {
              int v90 = 0;
              v85 = v90;
              break;
            }
          }
          bool v91 = true;
          v57 = v85;
          break;
        }
      }
      bool v92 = true;
      v53 = v57;
      break;
    }
    case 0:
      {
      int v93 = 32;
      int v94 = v93 + v41;
      int v95 = v40[v94];
      int v96 = 1;
      int v97 = v41 + v96;
      int v98;
      v98 = v97;
      switch (v95) {
        default:
          {
          int v99 = 36;
          int v100 = v99 + v41;
          int v101 = v40[v100];
          int v102 = 0;
          bool v103 = v101 != v102;
          int v104;
          if (v103) {
            int v105 = 0;
            v104 = v105;
          } else {
            int v106 = 2;
            int v107 = v41 + v106;
            v104 = v107;
          }
          v98 = v104;
          break;
        }
        case 0:
          {
          int v108 = 40;
          int v109 = v108 + v41;
          int v110 = v40[v109];
          int v111 = 3;
          int v112 = v41 + v111;
          int v113;
          v113 = v112;
          switch (v110) {
            case 0:
              {
              int v114 = 4;
              int v115 = v41 + v114;
              v113 = v115;
              break;
            }
            default:
              {
              v113 = v41;
              break;
            }
          }
          bool v116 = true;
          v98 = v113;
          break;
        }
        case 1:
          {
          int v117 = 44;
          int v118 = v117 + v41;
          int v119 = v40[v118];
          int v120 = 4;
          int v121;
          v121 = v120;
          switch (v119) {
            case 0:
              {
              v121 = v41;
              break;
            }
            default:
              {
              int v122 = 0;
              v121 = v122;
              break;
            }
            case 1:
              {
              int v123 = 2;
              v121 = v123;
              break;
            }
          }
          bool v124 = true;
          v98 = v121;
          break;
        }
      }
      bool v125 = true;
      v53 = v98;
      break;
    }
  }
  bool v126 = true;
  int v127 = 16;
  int v128 = v127 + v41;
  bool v129 = true;
  int v130 = simt_wave_count_bits(v129);
  v39[v128] = v130;
  uint v131 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v132 = (int)(v131);
  int v133 = 48;
  int v134 = v133 + v41;
  int v135 = v40[v134];
  int v136 = 0;
  bool v137 = v135 != v136;
  int v138;
  if (v137) {
    int v139 = 52;
    int v140 = v139 + v41;
    int v141 = v40[v140];
    uint v142 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v143 = (int)(v142);
    int v144;
    v144 = v143;
    switch (v141) {
      case 0:
        {
        int v145 = 56;
        int v146 = v145 + v41;
        int v147 = v40[v146];
        int v148 = 3;
        int v149;
        v149 = v148;
        switch (v147) {
          default:
            {
            v149 = v41;
            break;
          }
          case 0:
            {
            int v150 = 4;
            v149 = v150;
            break;
          }
          case 1:
            {
            v149 = v41;
            break;
          }
          case 2:
            {
            int v151 = 0;
            int v152 = v41 + v151;
            v149 = v152;
            break;
          }
        }
        bool v153 = true;
        v144 = v149;
      }
      default:
        {
        int v154 = 0;
        int v155 = 0;
        int v156;
        int v157;
        v156 = v154;
        v157 = v155;
        while (true) {
          int v158 = 4;
          int v159 = v157 * v158;
          int v160 = v159 + v41;
          int v161 = 60;
          int v162 = v161 + v160;
          int v163 = v40[v162];
          int v164 = 0;
          bool v165 = v163 != v164;
          v156 = v156;
          v157 = v157;
          if (!v165) break;
          int v166 = v156 + v157;
          int v167 = 1;
          int v168 = v157 + v167;
          v156 = v166;
          v157 = v168;
          break;
          ;
        }
        bool v169 = true;
        v144 = v156;
        break;
      }
    }
    bool v170 = true;
    v138 = v144;
  } else {
    int v171 = 80;
    int v172 = v171 + v41;
    int v173 = v40[v172];
    int v174 = 0;
    int v175;
    v175 = v174;
    switch (v173) {
      case 0:
        {
        v175 = v41;
        break;
      }
      default:
        {
        int v176 = 84;
        int v177 = v176 + v41;
        int v178 = v40[v177];
        int v179 = 2;
        int v180;
        v180 = v179;
        switch (v178) {
          default:
            {
            int v181 = 2;
            int v182 = v41 + v181;
            v180 = v182;
            break;
          }
          case 0:
            {
            int v183 = 1;
            v180 = v183;
            break;
          }
          case 1:
            {
            v180 = v41;
            break;
          }
        }
        bool v184 = true;
        v175 = v180;
        break;
      }
    }
    bool v185 = true;
    v138 = v175;
  }
  int v186 = 32;
  int v187 = v186 + v41;
  bool v188 = true;
  int v189 = simt_wave_count_bits(v188);
  v39[v187] = v189;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
