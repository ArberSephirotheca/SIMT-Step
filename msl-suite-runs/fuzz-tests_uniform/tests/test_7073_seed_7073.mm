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
    uint v9 = simt_lane_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      case 0:
        {
        int v12 = 1;
        int v13 = v0 + v12;
        v11 = v13;
        break;
      }
      case 1:
        {
        int v14 = 4;
        int v15 = v3 % v14;
        int v16 = 3;
        int v17;
        v17 = v16;
        switch (v15) {
          case 0:
            {
            v17 = v0;
            break;
          }
          case 1:
            {
            int v18 = 0;
            v17 = v18;
            break;
          }
          case 2:
            {
            int v19 = 0;
            v17 = v19;
          }
          default:
            {
            int v20 = 4;
            int v21 = v0 + v20;
            v17 = v21;
            break;
          }
        }
        v11 = v17;
        break;
      }
      case 2:
        {
        int v22 = 3;
        int v23 = v3 % v22;
        int v24 = 1;
        int v25 = v0 + v24;
        int v26;
        v26 = v25;
        switch (v23) {
          case 0:
            {
            int v27 = 0;
            v26 = v27;
            break;
          }
          case 1:
            {
            int v28 = 3;
            v26 = v28;
            break;
          }
          case 2:
            {
            int v29 = 1;
            v26 = v29;
            break;
          }
          default:
            {
            int v30 = 2;
            v26 = v30;
            break;
          }
        }
        int v31 = 1;
        int v32 = v0 + v31;
        v11 = v26;
        break;
      }
      default:
        {
        int v33 = 0;
        bool v34 = v2 != v33;
        int v35;
        if (v34) {
          int v36 = 2;
          int v37 = v0 + v36;
          v35 = v37;
        } else {
          v35 = v0;
        }
        int v38 = 1;
        v11 = v35;
        break;
      }
    }
    int v39 = 2;
    int v40 = v0 + v39;
    v6 = v11;
  } else {
    int v41;
    v41 = v0;
    switch (v3) {
      case 0:
        {
        int v42 = 0;
        bool v43 = v2 != v42;
        int v44;
        if (v43) {
          int v45 = 2;
          v44 = v45;
        } else {
          int v46 = 2;
          v44 = v46;
        }
        v41 = v44;
        break;
      }
      default:
        {
        int v47 = 0;
        int v48 = 0;
        int v49;
        int v50;
        v49 = v47;
        v50 = v48;
        while (true) {
          int v51 = 4;
          int v52 = v3 % v51;
          int v53 = 1;
          int v54 = v52 + v53;
          bool v55 = v50 < v54;
          v49 = v49;
          v50 = v50;
          if (!v55) break;
          int v56 = 0;
          int v57 = 1;
          int v58 = v50 + v57;
          v49 = v56;
          v50 = v58;
          break;
          ;
        }
        v41 = v49;
        break;
      }
    }
    int v59 = 4;
    v6 = v41;
  }
  bool v60 = true;
  int v61 = simt_wave_count_bits(v60);
  int v62 = 0;
  int v63 = v62 + v0;
  v1[v63] = v61;
  return;
}

kernel void kernel_main(device int* v64 [[buffer(0)]], device int* v65 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v66 = static_cast<int>(__simt_tid3.x);
  int v67 = 0;
  int v68 = v67 + v66;
  int v69 = v65[v68];
  int v70 = 4;
  int v71 = v70 + v66;
  int v72 = v65[v71];
  helper0(v66, v64, v69, v72, static_cast<int>(__simt_tid3.x));
  int v73 = 3;
  int v74 = v66 + v73;
  int v75 = 0;
  int v76 = 0;
  int v77;
  int v78;
  v77 = v75;
  v78 = v76;
  while (true) {
    int v79 = 4;
    int v80 = v78 * v79;
    int v81 = v80 + v66;
    int v82 = 8;
    int v83 = v82 + v81;
    int v84 = v65[v83];
    int v85 = 0;
    bool v86 = v84 != v85;
    v77 = v77;
    v78 = v78;
    if (!v86) break;
    int v87 = v77 + v78;
    int v88 = 1;
    int v89 = v78 + v88;
    v77 = v87;
    v78 = v89;
    break;
    ;
  }
  bool v90 = true;
  int v91 = 16;
  int v92 = v91 + v66;
  bool v93 = true;
  int v94 = simt_wave_count_bits(v93);
  v64[v92] = v94;
  int v95 = 28;
  int v96 = v95 + v66;
  int v97 = v65[v96];
  int v98 = 0;
  int v99 = v66 + v98;
  int v100;
  v100 = v99;
  switch (v97) {
    case 0:
      {
      int v101 = 0;
      int v102 = 0;
      int v103;
      int v104;
      v103 = v101;
      v104 = v102;
      while (true) {
        int v105 = 4;
        int v106 = v104 * v105;
        int v107 = v106 + v66;
        int v108 = 32;
        int v109 = v108 + v107;
        int v110 = v65[v109];
        int v111 = 0;
        bool v112 = v110 != v111;
        v103 = v103;
        v104 = v104;
        if (!v112) break;
        int v113 = v103 + v104;
        int v114 = 1;
        int v115 = v104 + v114;
        v103 = v113;
        v104 = v115;
      }
      bool v116 = true;
      v100 = v103;
      break;
    }
    default:
      {
      int v117 = 52;
      int v118 = v117 + v66;
      int v119 = v65[v118];
      int v120 = 1;
      int v121 = v66 + v120;
      int v122;
      v122 = v121;
      switch (v119) {
        case 0:
          {
          int v123 = 56;
          int v124 = v123 + v66;
          int v125 = v65[v124];
          int v126 = 2;
          int v127;
          v127 = v126;
          switch (v125) {
            default:
              {
              v127 = v66;
            }
            case 0:
              {
              int v128 = 3;
              int v129 = v66 + v128;
              v127 = v129;
              break;
            }
            case 1:
              {
              int v130 = 0;
              int v131 = v66 + v130;
              v127 = v131;
              break;
            }
            case 2:
              {
              int v132 = 1;
              v127 = v132;
              break;
            }
          }
          bool v133 = true;
          v122 = v127;
        }
        default:
          {
          int v134 = 60;
          int v135 = v134 + v66;
          int v136 = v65[v135];
          int v137 = 0;
          bool v138 = v136 != v137;
          int v139;
          if (v138) {
            int v140 = 4;
            int v141 = v66 + v140;
            v139 = v141;
          } else {
            int v142 = 3;
            int v143 = v66 + v142;
            v139 = v143;
          }
          v122 = v139;
        }
        case 1:
          {
          int v144 = 64;
          int v145 = v144 + v66;
          int v146 = v65[v145];
          int v147 = 0;
          bool v148 = v146 != v147;
          int v149;
          if (v148) {
            v149 = v66;
          } else {
            int v150 = 3;
            int v151 = v66 + v150;
            v149 = v151;
          }
          v122 = v149;
        }
        case 2:
          {
          int v152 = 0;
          int v153 = 0;
          int v154;
          int v155;
          v154 = v152;
          v155 = v153;
          while (true) {
            int v156 = 4;
            int v157 = v155 * v156;
            int v158 = v157 + v66;
            int v159 = 68;
            int v160 = v159 + v158;
            int v161 = v65[v160];
            int v162 = 0;
            bool v163 = v161 != v162;
            v154 = v154;
            v155 = v155;
            if (!v163) break;
            int v164 = v154 + v155;
            int v165 = 1;
            int v166 = v155 + v165;
            v154 = v164;
            v155 = v166;
            continue;
            ;
          }
          bool v167 = true;
          v122 = v154;
          break;
        }
      }
      bool v168 = true;
      v100 = v122;
    }
    case 1:
      {
      int v169 = 88;
      int v170 = v169 + v66;
      int v171 = v65[v170];
      int v172;
      v172 = v66;
      switch (v171) {
        default:
          {
          int v173 = 4;
          int v174 = v66 + v173;
          v172 = v174;
          break;
        }
        case 0:
          {
          int v175 = 92;
          int v176 = v175 + v66;
          int v177 = v65[v176];
          int v178 = 0;
          bool v179 = v177 != v178;
          int v180;
          if (v179) {
            int v181 = 4;
            v180 = v181;
          } else {
            int v182 = 0;
            int v183 = v66 + v182;
            v180 = v183;
          }
          v172 = v180;
          break;
        }
      }
      bool v184 = true;
      v100 = v172;
      break;
    }
  }
  bool v185 = true;
  int v186 = 32;
  int v187 = v186 + v66;
  bool v188 = true;
  int v189 = simt_wave_count_bits(v188);
  v64[v187] = v189;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
