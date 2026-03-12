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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      int v10 = 0;
      int v11;
      int v12;
      v11 = v9;
      v12 = v10;
      while (true) {
        int v13 = 4;
        int v14 = v3 % v13;
        int v15 = 1;
        int v16 = v14 + v15;
        bool v17 = v12 < v16;
        v11 = v11;
        v12 = v12;
        if (!v17) break;
        int v18 = 3;
        int v19 = 1;
        int v20 = v12 + v19;
        v11 = v18;
        v12 = v20;
        break;
        ;
      }
      int v21 = 4;
      int v22 = v0 + v21;
      v8 = v11;
    }
    case 1:
      {
      int v23 = 0;
      int v24 = 0;
      int v25;
      int v26;
      v25 = v23;
      v26 = v24;
      while (true) {
        int v27 = 4;
        int v28 = v3 % v27;
        int v29 = 1;
        int v30 = v28 + v29;
        bool v31 = v26 < v30;
        v25 = v25;
        v26 = v26;
        if (!v31) break;
        int v32 = 2;
        int v33 = v3 % v32;
        int v34 = 0;
        int v35;
        v35 = v34;
        switch (v33) {
          default:
            {
            v35 = v0;
            break;
          }
          case 0:
            {
            int v36 = 2;
            int v37 = v0 + v36;
            v35 = v37;
            break;
          }
          case 1:
            {
            int v38 = 0;
            v35 = v38;
            break;
          }
        }
        int v39 = 1;
        int v40 = v26 + v39;
        v25 = v35;
        v26 = v40;
      }
      int v41 = 0;
      int v42 = v0 + v41;
      v8 = v25;
      break;
    }
    default:
      {
      int v43 = 0;
      int v44 = 0;
      int v45;
      int v46;
      v45 = v43;
      v46 = v44;
      while (true) {
        int v47 = 4;
        int v48 = v3 % v47;
        int v49 = 1;
        int v50 = v48 + v49;
        bool v51 = v46 < v50;
        v45 = v45;
        v46 = v46;
        if (!v51) break;
        int v52 = 0;
        bool v53 = v2 != v52;
        int v54;
        if (v53) {
          int v55 = 3;
          v54 = v55;
        } else {
          int v56 = 2;
          v54 = v56;
        }
        int v57 = 1;
        int v58 = v46 + v57;
        v45 = v54;
        v46 = v58;
        continue;
        ;
      }
      int v59 = 4;
      v8 = v45;
      break;
    }
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
  int v73 = 8;
  int v74 = v73 + v66;
  int v75 = v65[v74];
  int v76 = 0;
  int v77;
  v77 = v76;
  switch (v75) {
    case 0:
      {
      int v78 = 1;
      v77 = v78;
      break;
    }
    case 1:
      {
      int v79 = 12;
      int v80 = v79 + v66;
      int v81 = v65[v80];
      int v82 = 0;
      bool v83 = v81 != v82;
      int v84;
      if (v83) {
        int v85 = 16;
        int v86 = v85 + v66;
        int v87 = v65[v86];
        int v88 = 2;
        int v89;
        v89 = v88;
        switch (v87) {
          default:
            {
            int v90 = 3;
            v89 = v90;
            break;
          }
          case 0:
            {
            int v91 = 2;
            v89 = v91;
            break;
          }
        }
        bool v92 = true;
        v84 = v89;
      } else {
        int v93 = 20;
        int v94 = v93 + v66;
        int v95 = v65[v94];
        int v96 = 3;
        int v97;
        v97 = v96;
        switch (v95) {
          case 0:
            {
            int v98 = 2;
            int v99 = v66 + v98;
            v97 = v99;
            break;
          }
          default:
            {
            int v100 = 3;
            int v101 = v66 + v100;
            v97 = v101;
            break;
          }
        }
        bool v102 = true;
        v84 = v97;
      }
      v77 = v84;
      break;
    }
    default:
      {
      int v103 = 24;
      int v104 = v103 + v66;
      int v105 = v65[v104];
      int v106 = 4;
      int v107;
      v107 = v106;
      switch (v105) {
        default:
          {
          int v108 = 28;
          int v109 = v108 + v66;
          int v110 = v65[v109];
          int v111;
          v111 = v66;
          switch (v110) {
            default:
              {
              v111 = v66;
            }
            case 0:
              {
              int v112 = 2;
              int v113 = v66 + v112;
              v111 = v113;
            }
            case 1:
              {
              int v114 = 1;
              v111 = v114;
            }
            case 2:
              {
              int v115 = 2;
              v111 = v115;
              break;
            }
          }
          bool v116 = true;
          v107 = v111;
          break;
        }
        case 0:
          {
          int v117 = 32;
          int v118 = v117 + v66;
          int v119 = v65[v118];
          int v120 = 0;
          int v121 = v66 + v120;
          int v122;
          v122 = v121;
          switch (v119) {
            case 0:
              {
              int v123 = 2;
              int v124 = v66 + v123;
              v122 = v124;
            }
            default:
              {
              v122 = v66;
            }
            case 1:
              {
              v122 = v66;
              break;
            }
            case 2:
              {
              int v125 = 4;
              v122 = v125;
              break;
            }
          }
          bool v126 = true;
          v107 = v122;
          break;
        }
        case 1:
          {
          int v127 = 36;
          int v128 = v127 + v66;
          int v129 = v65[v128];
          int v130;
          v130 = v66;
          switch (v129) {
            default:
              {
              v130 = v66;
              break;
            }
            case 0:
              {
              int v131 = 0;
              v130 = v131;
              break;
            }
            case 1:
              {
              int v132 = 1;
              int v133 = v66 + v132;
              v130 = v133;
              break;
            }
            case 2:
              {
              int v134 = 4;
              v130 = v134;
              break;
            }
          }
          bool v135 = true;
          v107 = v130;
          break;
        }
      }
      bool v136 = true;
      v77 = v107;
      break;
    }
  }
  bool v137 = true;
  int v138 = 16;
  int v139 = v138 + v66;
  bool v140 = true;
  int v141 = simt_wave_count_bits(v140);
  v64[v139] = v141;
  int v142 = 40;
  int v143 = v142 + v66;
  int v144 = v65[v143];
  int v145 = 3;
  int v146;
  v146 = v145;
  switch (v144) {
    default:
      {
      int v147 = 0;
      v146 = v147;
      break;
    }
    case 0:
      {
      int v148 = 44;
      int v149 = v148 + v66;
      int v150 = v65[v149];
      int v151 = 0;
      bool v152 = v150 != v151;
      int v153;
      if (v152) {
        int v154 = 48;
        int v155 = v154 + v66;
        int v156 = v65[v155];
        int v157 = 0;
        bool v158 = v156 != v157;
        int v159;
        if (v158) {
          v159 = v66;
        } else {
          int v160 = 2;
          v159 = v160;
        }
        v153 = v159;
      } else {
        int v161 = 0;
        int v162 = 0;
        int v163;
        int v164;
        v163 = v161;
        v164 = v162;
        while (true) {
          int v165 = 4;
          int v166 = v164 * v165;
          int v167 = v166 + v66;
          int v168 = 52;
          int v169 = v168 + v167;
          int v170 = v65[v169];
          int v171 = 0;
          bool v172 = v170 != v171;
          v163 = v163;
          v164 = v164;
          if (!v172) break;
          int v173 = v163 + v164;
          int v174 = 1;
          int v175 = v164 + v174;
          v163 = v173;
          v164 = v175;
          continue;
          ;
        }
        bool v176 = true;
        v153 = v163;
      }
      v146 = v153;
      break;
    }
    case 1:
      {
      int v177 = 3;
      int v178 = v66 + v177;
      v146 = v178;
      break;
    }
  }
  bool v179 = true;
  int v180 = 32;
  int v181 = v180 + v66;
  bool v182 = true;
  int v183 = simt_wave_count_bits(v182);
  v64[v181] = v183;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
