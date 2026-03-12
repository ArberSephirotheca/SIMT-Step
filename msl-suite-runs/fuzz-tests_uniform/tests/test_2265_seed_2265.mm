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
  int v5 = 0;
  bool v6 = v2 != v5;
  int v7;
  if (v6) {
    int v8 = 2;
    int v9 = v3 % v8;
    int v10 = 4;
    int v11 = v0 + v10;
    int v12;
    v12 = v11;
    switch (v9) {
      case 0:
        {
        int v13 = 3;
        int v14 = v0 + v13;
        v12 = v14;
        break;
      }
      default:
        {
        int v15 = 0;
        bool v16 = v2 != v15;
        int v17;
        if (v16) {
          int v18 = 0;
          v17 = v18;
        } else {
          v17 = v0;
        }
        v12 = v17;
        break;
      }
    }
    uint v19 = simt_subgroup_id(__simt_tid);
    int v20 = (int)(v19);
    v7 = v12;
  } else {
    int v21 = 0;
    bool v22 = v2 != v21;
    int v23;
    if (v22) {
      uint v24 = simt_lane_id(__simt_tid);
      int v25 = (int)(v24);
      int v26;
      v26 = v25;
      switch (v3) {
        case 0:
          {
          int v27 = 1;
          v26 = v27;
          break;
        }
        default:
          {
          int v28 = 0;
          v26 = v28;
          break;
        }
      }
      int v29 = 0;
      v23 = v26;
    } else {
      int v30 = 3;
      int v31 = v3 % v30;
      int v32;
      v32 = v0;
      switch (v31) {
        case 0:
          {
          int v33 = 1;
          v32 = v33;
          break;
        }
        default:
          {
          int v34 = 0;
          v32 = v34;
          break;
        }
        case 1:
          {
          int v35 = 3;
          v32 = v35;
          break;
        }
        case 2:
          {
          v32 = v0;
          break;
        }
      }
      uint v36 = simt_subgroup_id(__simt_tid);
      int v37 = (int)(v36);
      v23 = v32;
    }
    int v38 = 3;
    v7 = v23;
  }
  bool v39 = true;
  int v40 = simt_wave_count_bits(v39);
  int v41 = 0;
  int v42 = v41 + v0;
  v1[v42] = v40;
  int v43 = 0;
  bool v44 = v2 != v43;
  int v45 = v44 ? v4 : v7;
  return;
}

kernel void kernel_main(device int* v46 [[buffer(0)]], device int* v47 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v48 = static_cast<int>(__simt_tid3.x);
  int v49 = 0;
  int v50 = v49 + v48;
  int v51 = v47[v50];
  int v52 = 4;
  int v53 = v52 + v48;
  int v54 = v47[v53];
  helper0(v48, v46, v51, v54, static_cast<int>(__simt_tid3.x));
  int v55 = 8;
  int v56 = v55 + v48;
  int v57 = v47[v56];
  int v58 = 1;
  int v59;
  v59 = v58;
  switch (v57) {
    case 0:
      {
      int v60 = 12;
      int v61 = v60 + v48;
      int v62 = v47[v61];
      int v63 = 1;
      int v64 = v48 + v63;
      int v65;
      v65 = v64;
      switch (v62) {
        default:
          {
          int v66 = 16;
          int v67 = v66 + v48;
          int v68 = v47[v67];
          int v69 = 4;
          int v70 = v48 + v69;
          int v71;
          v71 = v70;
          switch (v68) {
            default:
              {
              int v72 = 3;
              v71 = v72;
            }
            case 0:
              {
              int v73 = 2;
              v71 = v73;
              break;
            }
          }
          bool v74 = true;
          v65 = v71;
          break;
        }
        case 0:
          {
          v65 = v48;
          break;
        }
        case 1:
          {
          int v75 = 20;
          int v76 = v75 + v48;
          int v77 = v47[v76];
          int v78 = 0;
          bool v79 = v77 != v78;
          int v80;
          if (v79) {
            v80 = v48;
          } else {
            int v81 = 0;
            v80 = v81;
          }
          v65 = v80;
          break;
        }
        case 2:
          {
          int v82 = 2;
          v65 = v82;
          break;
        }
      }
      bool v83 = true;
      v59 = v65;
    }
    case 1:
      {
      int v84 = 0;
      int v85 = 0;
      int v86;
      int v87;
      v86 = v84;
      v87 = v85;
      while (true) {
        int v88 = 4;
        int v89 = v87 * v88;
        int v90 = v89 + v48;
        int v91 = 24;
        int v92 = v91 + v90;
        int v93 = v47[v92];
        int v94 = 0;
        bool v95 = v93 != v94;
        v86 = v86;
        v87 = v87;
        if (!v95) break;
        int v96 = v86 + v87;
        int v97 = 1;
        int v98 = v87 + v97;
        v86 = v96;
        v87 = v98;
        continue;
        ;
      }
      bool v99 = true;
      v59 = v86;
      break;
    }
    default:
      {
      int v100 = 44;
      int v101 = v100 + v48;
      int v102 = v47[v101];
      int v103 = 0;
      bool v104 = v102 != v103;
      int v105;
      if (v104) {
        int v106 = 0;
        int v107 = 0;
        int v108;
        int v109;
        v108 = v106;
        v109 = v107;
        while (true) {
          int v110 = 4;
          int v111 = v109 * v110;
          int v112 = v111 + v48;
          int v113 = 48;
          int v114 = v113 + v112;
          int v115 = v47[v114];
          int v116 = 0;
          bool v117 = v115 != v116;
          v108 = v108;
          v109 = v109;
          if (!v117) break;
          int v118 = v108 + v109;
          int v119 = 1;
          int v120 = v109 + v119;
          v108 = v118;
          v109 = v120;
          continue;
          ;
        }
        bool v121 = true;
        v105 = v108;
      } else {
        int v122 = 68;
        int v123 = v122 + v48;
        int v124 = v47[v123];
        int v125 = 0;
        int v126;
        v126 = v125;
        switch (v124) {
          case 0:
            {
            int v127 = 0;
            v126 = v127;
            break;
          }
          default:
            {
            v126 = v48;
            break;
          }
        }
        bool v128 = true;
        v105 = v126;
      }
      v59 = v105;
      break;
    }
  }
  bool v129 = true;
  int v130 = 16;
  int v131 = v130 + v48;
  bool v132 = true;
  int v133 = simt_wave_count_bits(v132);
  v46[v131] = v133;
  int v134 = 72;
  int v135 = v134 + v48;
  int v136 = v47[v135];
  int v137 = 0;
  bool v138 = v136 != v137;
  int v139;
  if (v138) {
    int v140 = 76;
    int v141 = v140 + v48;
    int v142 = v47[v141];
    uint v143 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v144 = (int)(v143);
    int v145;
    v145 = v144;
    switch (v142) {
      default:
        {
        int v146 = 80;
        int v147 = v146 + v48;
        int v148 = v47[v147];
        int v149;
        v149 = v48;
        switch (v148) {
          default:
            {
            int v150 = 0;
            v149 = v150;
            break;
          }
          case 0:
            {
            int v151 = 0;
            v149 = v151;
            break;
          }
          case 1:
            {
            v149 = v48;
            break;
          }
          case 2:
            {
            v149 = v48;
            break;
          }
        }
        bool v152 = true;
        v145 = v149;
        break;
      }
      case 0:
        {
        int v153 = 1;
        v145 = v153;
        break;
      }
      case 1:
        {
        int v154 = 84;
        int v155 = v154 + v48;
        int v156 = v47[v155];
        int v157;
        v157 = v48;
        switch (v156) {
          case 0:
            {
            int v158 = 2;
            int v159 = v48 + v158;
            v157 = v159;
          }
          default:
            {
            int v160 = 2;
            int v161 = v48 + v160;
            v157 = v161;
            break;
          }
        }
        bool v162 = true;
        v145 = v157;
        break;
      }
    }
    bool v163 = true;
    v139 = v145;
  } else {
    int v164 = 0;
    int v165 = 0;
    int v166;
    int v167;
    v166 = v164;
    v167 = v165;
    while (true) {
      int v168 = 4;
      int v169 = v167 * v168;
      int v170 = v169 + v48;
      int v171 = 88;
      int v172 = v171 + v170;
      int v173 = v47[v172];
      int v174 = 0;
      bool v175 = v173 != v174;
      v166 = v166;
      v167 = v167;
      if (!v175) break;
      int v176 = v166 + v167;
      int v177 = 1;
      int v178 = v167 + v177;
      v166 = v176;
      v167 = v178;
    }
    bool v179 = true;
    v139 = v166;
  }
  int v180 = 32;
  int v181 = v180 + v48;
  bool v182 = true;
  int v183 = simt_wave_count_bits(v182);
  v46[v181] = v183;
  uint v184 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v185 = (int)(v184);
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
