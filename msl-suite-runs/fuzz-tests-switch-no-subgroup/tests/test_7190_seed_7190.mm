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
    uint v13 = simt_lane_id(__simt_tid);
    int v14 = (int)(v13);
    int v15;
    v15 = v14;
    switch (v3) {
      case 0:
        {
        int v16 = 0;
        v15 = v16;
        break;
      }
      default:
        {
        int v17 = 4;
        int v18 = v3 % v17;
        int v19 = 1;
        int v20 = v0 + v19;
        int v21;
        v21 = v20;
        switch (v18) {
          case 0:
            {
            int v22 = 0;
            v21 = v22;
            break;
          }
          case 1:
            {
            int v23 = 4;
            v21 = v23;
            break;
          }
          case 2:
            {
            int v24 = 2;
            v21 = v24;
            break;
          }
          default:
            {
            int v25 = 4;
            v21 = v25;
            break;
          }
        }
        int v26 = 3;
        int v27 = v0 + v26;
        v15 = v21;
        break;
      }
    }
    int v28 = 1;
    int v29 = v7 + v28;
    v6 = v15;
    v7 = v29;
    continue;
    ;
  }
  bool v30 = true;
  int v31 = simt_wave_count_bits(v30);
  int v32 = 0;
  int v33 = v32 + v0;
  v1[v33] = v31;
  return;
}

kernel void kernel_main(device int* v34 [[buffer(0)]], device int* v35 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v36 = static_cast<int>(__simt_tid3.x);
  int v37 = 0;
  int v38 = v37 + v36;
  int v39 = v35[v38];
  int v40 = 4;
  int v41 = v40 + v36;
  int v42 = v35[v41];
  helper0(v36, v34, v39, v42, static_cast<int>(__simt_tid3.x));
  int v43 = 8;
  int v44 = v43 + v36;
  int v45 = v35[v44];
  int v46;
  v46 = v36;
  switch (v45) {
    case 0:
      {
      int v47 = 0;
      int v48 = 0;
      int v49;
      int v50;
      v49 = v47;
      v50 = v48;
      while (true) {
        int v51 = 4;
        int v52 = v50 * v51;
        int v53 = v52 + v36;
        int v54 = 12;
        int v55 = v54 + v53;
        int v56 = v35[v55];
        int v57 = 0;
        bool v58 = v56 != v57;
        v49 = v49;
        v50 = v50;
        if (!v58) break;
        int v59 = 32;
        int v60 = v59 + v36;
        int v61 = v35[v60];
        int v62 = 0;
        bool v63 = v61 != v62;
        int v64;
        if (v63) {
          int v65 = 1;
          v64 = v65;
        } else {
          int v66 = 2;
          v64 = v66;
        }
        int v67 = v49 + v64;
        int v68 = 1;
        int v69 = v50 + v68;
        bool v70 = true;
        v49 = v67;
        v50 = v69;
      }
      v46 = v49;
    }
    default:
      {
      int v71 = 0;
      int v72 = 0;
      int v73;
      int v74;
      v73 = v71;
      v74 = v72;
      while (true) {
        int v75 = 4;
        int v76 = v74 * v75;
        int v77 = v76 + v36;
        int v78 = 36;
        int v79 = v78 + v77;
        int v80 = v35[v79];
        int v81 = 0;
        bool v82 = v80 != v81;
        v73 = v73;
        v74 = v74;
        if (!v82) break;
        int v83 = 56;
        int v84 = v83 + v36;
        int v85 = v35[v84];
        int v86;
        v86 = v36;
        switch (v85) {
          default:
            {
            int v87 = 3;
            int v88 = v36 + v87;
            v86 = v88;
            break;
          }
          case 0:
            {
            int v89 = 2;
            int v90 = v36 + v89;
            v86 = v90;
            break;
          }
        }
        bool v91 = true;
        int v92 = v73 + v86;
        int v93 = 1;
        int v94 = v74 + v93;
        bool v95 = true;
        v73 = v92;
        v74 = v94;
      }
      v46 = v73;
      break;
    }
    case 1:
      {
      int v96 = 60;
      int v97 = v96 + v36;
      int v98 = v35[v97];
      int v99 = 3;
      int v100 = v36 + v99;
      int v101;
      v101 = v100;
      switch (v98) {
        case 0:
          {
          int v102 = 64;
          int v103 = v102 + v36;
          int v104 = v35[v103];
          int v105;
          v105 = v36;
          switch (v104) {
            default:
              {
              int v106 = 3;
              int v107 = v36 + v106;
              v105 = v107;
              break;
            }
            case 0:
              {
              int v108 = 3;
              v105 = v108;
              break;
            }
          }
          bool v109 = true;
          v101 = v105;
        }
        case 1:
          {
          int v110 = 68;
          int v111 = v110 + v36;
          int v112 = v35[v111];
          int v113 = 0;
          bool v114 = v112 != v113;
          int v115;
          if (v114) {
            int v116 = 3;
            v115 = v116;
          } else {
            v115 = v36;
          }
          v101 = v115;
          break;
        }
        default:
          {
          int v117 = 72;
          int v118 = v117 + v36;
          int v119 = v35[v118];
          int v120 = 0;
          bool v121 = v119 != v120;
          int v122;
          if (v121) {
            int v123 = 4;
            int v124 = v36 + v123;
            v122 = v124;
          } else {
            int v125 = 2;
            int v126 = v36 + v125;
            v122 = v126;
          }
          v101 = v122;
        }
        case 2:
          {
          int v127 = 2;
          int v128 = v36 + v127;
          v101 = v128;
          break;
        }
      }
      v46 = v101;
      break;
    }
  }
  int v129 = 76;
  int v130 = v129 + v36;
  int v131 = v35[v130];
  int v132 = 4;
  int v133;
  v133 = v132;
  switch (v131) {
    default:
      {
      int v134 = 80;
      int v135 = v134 + v36;
      int v136 = v35[v135];
      int v137 = 2;
      int v138 = v36 + v137;
      int v139;
      v139 = v138;
      switch (v136) {
        default:
          {
          int v140 = 0;
          int v141 = 0;
          int v142;
          int v143;
          v142 = v140;
          v143 = v141;
          while (true) {
            int v144 = 4;
            int v145 = v143 * v144;
            int v146 = v145 + v36;
            int v147 = 84;
            int v148 = v147 + v146;
            int v149 = v35[v148];
            int v150 = 0;
            bool v151 = v149 != v150;
            v142 = v142;
            v143 = v143;
            if (!v151) break;
            int v152 = v142 + v143;
            int v153 = 1;
            int v154 = v143 + v153;
            bool v155 = true;
            v142 = v152;
            v143 = v154;
            continue;
            ;
          }
          v139 = v142;
          break;
        }
        case 0:
          {
          int v156 = 0;
          v139 = v156;
          break;
        }
        case 1:
          {
          int v157 = 104;
          int v158 = v157 + v36;
          int v159 = v35[v158];
          int v160 = 2;
          int v161;
          v161 = v160;
          switch (v159) {
            default:
              {
              int v162 = 4;
              v161 = v162;
              break;
            }
            case 0:
              {
              v161 = v36;
              break;
            }
            case 1:
              {
              int v163 = 0;
              int v164 = v36 + v163;
              v161 = v164;
              break;
            }
            case 2:
              {
              v161 = v36;
              break;
            }
          }
          v139 = v161;
          break;
        }
        case 2:
          {
          int v165 = 108;
          int v166 = v165 + v36;
          int v167 = v35[v166];
          int v168 = 3;
          int v169 = v36 + v168;
          int v170;
          v170 = v169;
          switch (v167) {
            case 0:
              {
              int v171 = 0;
              v170 = v171;
              break;
            }
            default:
              {
              v170 = v36;
              break;
            }
          }
          v139 = v170;
          break;
        }
      }
      bool v172 = true;
      v133 = v139;
    }
    case 0:
      {
      v133 = v36;
    }
    case 1:
      {
      v133 = v36;
      break;
    }
  }
  bool v173 = true;
  int v174 = 16;
  int v175 = v174 + v36;
  bool v176 = true;
  int v177 = simt_wave_count_bits(v176);
  v34[v175] = v177;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
