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
  int v5 = v0 + v4;
  int v6 = 0;
  int v7 = 0;
  int v8;
  int v9;
  v8 = v6;
  v9 = v7;
  while (true) {
    int v10 = 4;
    int v11 = v3 % v10;
    int v12 = 1;
    int v13 = v11 + v12;
    bool v14 = v9 < v13;
    v8 = v8;
    v9 = v9;
    if (!v14) break;
    int v15 = 1;
    int v16 = v9 + v15;
    v8 = v0;
    v9 = v16;
    break;
    ;
  }
  bool v17 = true;
  int v18 = simt_wave_count_bits(v17);
  int v19 = 0;
  int v20 = v19 + v0;
  v1[v20] = v18;
  int v21 = 0;
  bool v22 = v2 != v21;
  int v23 = v22 ? v5 : v8;
  int v24 = 2;
  int v25 = v3 % v24;
  int v26 = 0;
  int v27;
  v27 = v26;
  switch (v25) {
    default:
      {
      int v28 = 0;
      bool v29 = v2 != v28;
      int v30;
      if (v29) {
        int v31 = 2;
        int v32 = v3 % v31;
        int v33;
        v33 = v0;
        switch (v32) {
          default:
            {
            int v34 = 0;
            int v35 = v0 + v34;
            v33 = v35;
            break;
          }
          case 0:
            {
            v33 = v0;
          }
          case 1:
            {
            v33 = v0;
            break;
          }
        }
        int v36 = 2;
        int v37 = v0 + v36;
        v30 = v33;
      } else {
        int v38 = 0;
        bool v39 = v2 != v38;
        int v40;
        if (v39) {
          int v41 = 4;
          v40 = v41;
        } else {
          int v42 = 2;
          int v43 = v0 + v42;
          v40 = v43;
        }
        int v44 = 3;
        v30 = v40;
      }
      int v45 = 1;
      v27 = v30;
      break;
    }
    case 0:
      {
      int v46 = 4;
      int v47;
      v47 = v46;
      switch (v3) {
        default:
          {
          int v48;
          v48 = v0;
          switch (v3) {
            default:
              {
              int v49 = 2;
              v48 = v49;
              break;
            }
            case 0:
              {
              int v50 = 4;
              int v51 = v0 + v50;
              v48 = v51;
              break;
            }
          }
          int v52 = 2;
          int v53 = v0 + v52;
          v47 = v48;
          break;
        }
        case 0:
          {
          int v54 = 0;
          bool v55 = v2 != v54;
          int v56;
          if (v55) {
            v56 = v0;
          } else {
            int v57 = 3;
            int v58 = v0 + v57;
            v56 = v58;
          }
          v47 = v56;
          break;
        }
      }
      v27 = v47;
      break;
    }
    case 1:
      {
      int v59 = 0;
      int v60 = 0;
      int v61;
      int v62;
      v61 = v59;
      v62 = v60;
      while (true) {
        int v63 = 4;
        int v64 = v3 % v63;
        int v65 = 1;
        int v66 = v64 + v65;
        bool v67 = v62 < v66;
        v61 = v61;
        v62 = v62;
        if (!v67) break;
        int v68 = 0;
        int v69 = v0 + v68;
        int v70 = 1;
        int v71 = v62 + v70;
        v61 = v69;
        v62 = v71;
      }
      int v72 = 4;
      int v73 = v0 + v72;
      v27 = v61;
      break;
    }
  }
  bool v74 = true;
  int v75 = simt_wave_count_bits(v74);
  int v76 = 16;
  int v77 = v76 + v0;
  v1[v77] = v75;
  int v78 = 0;
  bool v79 = v2 != v78;
  int v80 = v79 ? v23 : v27;
  return;
}

kernel void kernel_main(device int* v81 [[buffer(0)]], device int* v82 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v83 = static_cast<int>(__simt_tid3.x);
  int v84 = 0;
  int v85 = v84 + v83;
  int v86 = v82[v85];
  int v87 = 4;
  int v88 = v87 + v83;
  int v89 = v82[v88];
  helper0(v83, v81, v86, v89, static_cast<int>(__simt_tid3.x));
  int v90 = 8;
  int v91 = v90 + v83;
  int v92 = v82[v91];
  int v93 = 0;
  bool v94 = v92 != v93;
  int v95;
  if (v94) {
    uint v96 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v97 = (int)(v96);
    v95 = v97;
  } else {
    uint v98 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v99 = (int)(v98);
    v95 = v99;
  }
  int v100 = 32;
  int v101 = v100 + v83;
  bool v102 = true;
  int v103 = simt_wave_count_bits(v102);
  v81[v101] = v103;
  int v104 = 0;
  int v105 = 0;
  int v106;
  int v107;
  v106 = v104;
  v107 = v105;
  while (true) {
    int v108 = 4;
    int v109 = v107 * v108;
    int v110 = v109 + v83;
    int v111 = 12;
    int v112 = v111 + v110;
    int v113 = v82[v112];
    int v114 = 0;
    bool v115 = v113 != v114;
    v106 = v106;
    v107 = v107;
    if (!v115) break;
    int v116 = v106 + v107;
    int v117 = 1;
    int v118 = v107 + v117;
    v106 = v116;
    v107 = v118;
    break;
    ;
  }
  bool v119 = true;
  int v120 = 48;
  int v121 = v120 + v83;
  bool v122 = true;
  int v123 = simt_wave_count_bits(v122);
  v81[v121] = v123;
  int v124 = 32;
  int v125 = v124 + v83;
  int v126 = v82[v125];
  int v127 = 0;
  bool v128 = v126 != v127;
  int v129;
  if (v128) {
    int v130 = 0;
    int v131 = 0;
    int v132;
    int v133;
    v132 = v130;
    v133 = v131;
    while (true) {
      int v134 = 4;
      int v135 = v133 * v134;
      int v136 = v135 + v83;
      int v137 = 36;
      int v138 = v137 + v136;
      int v139 = v82[v138];
      int v140 = 0;
      bool v141 = v139 != v140;
      v132 = v132;
      v133 = v133;
      if (!v141) break;
      int v142 = v132 + v133;
      int v143 = 1;
      int v144 = v133 + v143;
      v132 = v142;
      v133 = v144;
    }
    bool v145 = true;
    v129 = v132;
  } else {
    int v146 = 56;
    int v147 = v146 + v83;
    int v148 = v82[v147];
    uint v149 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v150 = (int)(v149);
    int v151;
    v151 = v150;
    switch (v148) {
      case 0:
        {
        int v152 = 60;
        int v153 = v152 + v83;
        int v154 = v82[v153];
        int v155 = 0;
        bool v156 = v154 != v155;
        int v157;
        if (v156) {
          v157 = v83;
        } else {
          v157 = v83;
        }
        v151 = v157;
        break;
      }
      case 1:
        {
        int v158 = 64;
        int v159 = v158 + v83;
        int v160 = v82[v159];
        int v161 = 2;
        int v162 = v83 + v161;
        int v163;
        v163 = v162;
        switch (v160) {
          case 0:
            {
            int v164 = 3;
            int v165 = v83 + v164;
            v163 = v165;
            break;
          }
          default:
            {
            int v166 = 3;
            v163 = v166;
            break;
          }
          case 1:
            {
            int v167 = 3;
            int v168 = v83 + v167;
            v163 = v168;
            break;
          }
        }
        bool v169 = true;
        v151 = v163;
        break;
      }
      default:
        {
        int v170 = 68;
        int v171 = v170 + v83;
        int v172 = v82[v171];
        int v173 = 1;
        int v174;
        v174 = v173;
        switch (v172) {
          default:
            {
            int v175 = 4;
            v174 = v175;
            break;
          }
          case 0:
            {
            v174 = v83;
            break;
          }
        }
        bool v176 = true;
        v151 = v174;
        break;
      }
    }
    bool v177 = true;
    v129 = v151;
  }
  int v178 = 64;
  int v179 = v178 + v83;
  bool v180 = true;
  int v181 = simt_wave_count_bits(v180);
  v81[v179] = v181;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
