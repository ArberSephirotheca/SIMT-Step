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
    bool v14 = v2 != v13;
    int v15;
    if (v14) {
      bool v16 = true;
      int v17 = simt_wave_count_bits(v16);
      int v18 = 0;
      int v19 = 4;
      int v20 = v7 * v19;
      int v21 = v18 + v20;
      int v22 = v21 + v0;
      v1[v22] = v17;
      v15 = v17;
    } else {
      bool v23 = true;
      int v24 = simt_wave_count_bits(v23);
      int v25 = 16;
      int v26 = 4;
      int v27 = v7 * v26;
      int v28 = v25 + v27;
      int v29 = v28 + v0;
      v1[v29] = v24;
      v15 = v24;
    }
    int v30 = 1;
    int v31 = v7 + v30;
    v6 = v15;
    v7 = v31;
  }
  int v32 = 4;
  int v33 = v3 % v32;
  int v34 = 2;
  int v35;
  v35 = v34;
  switch (v33) {
    case 0:
      {
      int v36 = 0;
      int v37 = 0;
      int v38;
      int v39;
      v38 = v36;
      v39 = v37;
      while (true) {
        int v40 = 4;
        int v41 = v3 % v40;
        int v42 = 1;
        int v43 = v41 + v42;
        bool v44 = v39 < v43;
        v38 = v38;
        v39 = v39;
        if (!v44) break;
        int v45 = 1;
        int v46 = 1;
        int v47 = v39 + v46;
        v38 = v45;
        v39 = v47;
      }
      v35 = v38;
      break;
    }
    case 1:
      {
      int v48 = 2;
      int v49 = v3 % v48;
      int v50 = 3;
      int v51;
      v51 = v50;
      switch (v49) {
        case 0:
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
            int v61 = 1;
            int v62 = v55 + v61;
            v54 = v0;
            v55 = v62;
          }
          v51 = v54;
          break;
        }
        default:
          {
          int v63 = 3;
          v51 = v63;
          break;
        }
      }
      int v64 = 3;
      v35 = v51;
    }
    default:
      {
      int v65 = 0;
      bool v66 = v2 != v65;
      int v67;
      if (v66) {
        int v68 = 0;
        bool v69 = v2 != v68;
        int v70;
        if (v69) {
          v70 = v0;
        } else {
          int v71 = 4;
          v70 = v71;
        }
        v67 = v70;
      } else {
        int v72 = 0;
        int v73 = 0;
        int v74;
        int v75;
        v74 = v72;
        v75 = v73;
        while (true) {
          int v76 = 4;
          int v77 = v3 % v76;
          int v78 = 1;
          int v79 = v77 + v78;
          bool v80 = v75 < v79;
          v74 = v74;
          v75 = v75;
          if (!v80) break;
          int v81 = 3;
          int v82 = v0 + v81;
          int v83 = 1;
          int v84 = v75 + v83;
          v74 = v82;
          v75 = v84;
        }
        v67 = v74;
      }
      v35 = v67;
    }
    case 2:
      {
      int v85 = 0;
      int v86 = 0;
      int v87;
      int v88;
      v87 = v85;
      v88 = v86;
      while (true) {
        int v89 = 4;
        int v90 = v3 % v89;
        int v91 = 1;
        int v92 = v90 + v91;
        bool v93 = v88 < v92;
        v87 = v87;
        v88 = v88;
        if (!v93) break;
        int v94 = 1;
        int v95 = v88 + v94;
        v87 = v0;
        v88 = v95;
      }
      v35 = v87;
      break;
    }
  }
  int v96 = 0;
  bool v97 = v2 != v96;
  int v98 = v97 ? v6 : v35;
  return;
}

kernel void kernel_main(device int* v99 [[buffer(0)]], device int* v100 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v101 = static_cast<int>(__simt_tid3.x);
  int v102 = 0;
  int v103 = v102 + v101;
  int v104 = v100[v103];
  int v105 = 4;
  int v106 = v105 + v101;
  int v107 = v100[v106];
  helper0(v101, v99, v104, v107, static_cast<int>(__simt_tid3.x));
  int v108 = 8;
  int v109 = v108 + v101;
  int v110 = v100[v109];
  int v111 = 4;
  int v112;
  v112 = v111;
  switch (v110) {
    case 0:
      {
      int v113 = 12;
      int v114 = v113 + v101;
      int v115 = v100[v114];
      int v116 = 0;
      int v117;
      v117 = v116;
      switch (v115) {
        case 0:
          {
          v117 = v101;
          break;
        }
        default:
          {
          int v118 = 16;
          int v119 = v118 + v101;
          int v120 = v100[v119];
          int v121 = 0;
          bool v122 = v120 != v121;
          int v123;
          if (v122) {
            int v124 = 1;
            int v125 = v101 + v124;
            v123 = v125;
          } else {
            int v126 = 4;
            v123 = v126;
          }
          v117 = v123;
        }
        case 1:
          {
          int v127 = 20;
          int v128 = v127 + v101;
          int v129 = v100[v128];
          int v130 = 1;
          int v131;
          v131 = v130;
          switch (v129) {
            case 0:
              {
              v131 = v101;
            }
            case 1:
              {
              int v132 = 0;
              v131 = v132;
            }
            case 2:
              {
              int v133 = 4;
              int v134 = v101 + v133;
              v131 = v134;
              break;
            }
            default:
              {
              int v135 = 4;
              int v136 = v101 + v135;
              v131 = v136;
              break;
            }
          }
          bool v137 = true;
          v117 = v131;
          break;
        }
      }
      v112 = v117;
    }
    case 1:
      {
      int v138 = 24;
      int v139 = v138 + v101;
      int v140 = v100[v139];
      int v141 = 0;
      bool v142 = v140 != v141;
      int v143;
      if (v142) {
        int v144 = 28;
        int v145 = v144 + v101;
        int v146 = v100[v145];
        int v147 = 0;
        int v148;
        v148 = v147;
        switch (v146) {
          case 0:
            {
            int v149 = 4;
            int v150 = v101 + v149;
            v148 = v150;
            break;
          }
          default:
            {
            v148 = v101;
            break;
          }
          case 1:
            {
            v148 = v101;
          }
          case 2:
            {
            int v151 = 4;
            v148 = v151;
            break;
          }
        }
        v143 = v148;
      } else {
        int v152 = 4;
        int v153 = v101 + v152;
        v143 = v153;
      }
      v112 = v143;
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
        int v160 = v159 + v101;
        int v161 = 32;
        int v162 = v161 + v160;
        int v163 = v100[v162];
        int v164 = 0;
        bool v165 = v163 != v164;
        v156 = v156;
        v157 = v157;
        if (!v165) break;
        int v166 = v156 + v157;
        int v167 = 1;
        int v168 = v157 + v167;
        bool v169 = true;
        v156 = v166;
        v157 = v168;
      }
      v112 = v156;
      break;
    }
  }
  int v170 = 0;
  int v171 = 0;
  int v172;
  int v173;
  v172 = v170;
  v173 = v171;
  while (true) {
    int v174 = 4;
    int v175 = v173 * v174;
    int v176 = v175 + v101;
    int v177 = 52;
    int v178 = v177 + v176;
    int v179 = v100[v178];
    int v180 = 0;
    bool v181 = v179 != v180;
    v172 = v172;
    v173 = v173;
    if (!v181) break;
    int v182 = v172 + v173;
    int v183 = 1;
    int v184 = v173 + v183;
    bool v185 = true;
    int v186 = 32;
    int v187 = 4;
    int v188 = v173 * v187;
    int v189 = v186 + v188;
    int v190 = v189 + v101;
    bool v191 = true;
    int v192 = simt_wave_count_bits(v191);
    v99[v190] = v192;
    v172 = v182;
    v173 = v184;
  }
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
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
