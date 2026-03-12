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
    int v13 = 2;
    int v14 = 1;
    int v15 = v7 + v14;
    v6 = v13;
    v7 = v15;
  }
  bool v16 = true;
  int v17 = simt_wave_count_bits(v16);
  int v18 = 0;
  int v19 = v18 + v0;
  v1[v19] = v17;
  int v20 = 0;
  bool v21 = v2 != v20;
  int v22 = v21 ? v0 : v6;
  int v23 = 3;
  int v24 = v3 % v23;
  uint v25 = simt_lane_id(__simt_tid);
  int v26 = (int)(v25);
  int v27;
  v27 = v26;
  switch (v24) {
    default:
      {
      int v28 = 4;
      v27 = v28;
      break;
    }
    case 0:
      {
      int v29 = 0;
      bool v30 = v2 != v29;
      int v31;
      if (v30) {
        int v32 = 2;
        int v33 = v3 % v32;
        int v34 = 0;
        int v35 = v0 + v34;
        int v36;
        v36 = v35;
        switch (v33) {
          case 0:
            {
            int v37 = 0;
            v36 = v37;
            break;
          }
          case 1:
            {
            v36 = v0;
            break;
          }
          default:
            {
            int v38 = 2;
            v36 = v38;
            break;
          }
        }
        int v39 = 4;
        int v40 = v0 + v39;
        v31 = v36;
      } else {
        int v41 = 0;
        bool v42 = v2 != v41;
        int v43;
        if (v42) {
          v43 = v0;
        } else {
          int v44 = 1;
          int v45 = v0 + v44;
          v43 = v45;
        }
        v31 = v43;
      }
      int v46 = 3;
      int v47 = v0 + v46;
      v27 = v31;
      break;
    }
    case 1:
      {
      int v48 = 0;
      int v49 = 0;
      int v50;
      int v51;
      v50 = v48;
      v51 = v49;
      while (true) {
        int v52 = 4;
        int v53 = v3 % v52;
        int v54 = 1;
        int v55 = v53 + v54;
        bool v56 = v51 < v55;
        v50 = v50;
        v51 = v51;
        if (!v56) break;
        int v57 = 2;
        int v58 = v3 % v57;
        int v59 = 3;
        int v60 = v0 + v59;
        int v61;
        v61 = v60;
        switch (v58) {
          case 0:
            {
            int v62 = 3;
            v61 = v62;
          }
          case 1:
            {
            int v63 = 2;
            int v64 = v0 + v63;
            v61 = v64;
            break;
          }
          default:
            {
            v61 = v0;
            break;
          }
        }
        int v65 = 1;
        int v66 = v51 + v65;
        v50 = v61;
        v51 = v66;
      }
      v27 = v50;
      break;
    }
  }
  bool v67 = true;
  int v68 = simt_wave_count_bits(v67);
  int v69 = 16;
  int v70 = v69 + v0;
  v1[v70] = v68;
  int v71 = 0;
  bool v72 = v2 != v71;
  int v73 = v72 ? v22 : v27;
  return;
}

kernel void kernel_main(device int* v74 [[buffer(0)]], device int* v75 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v76 = static_cast<int>(__simt_tid3.x);
  int v77 = 0;
  int v78 = v77 + v76;
  int v79 = v75[v78];
  int v80 = 4;
  int v81 = v80 + v76;
  int v82 = v75[v81];
  helper0(v76, v74, v79, v82, static_cast<int>(__simt_tid3.x));
  int v83 = 8;
  int v84 = v83 + v76;
  int v85 = v75[v84];
  uint v86 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v87 = (int)(v86);
  int v88;
  v88 = v87;
  switch (v85) {
    case 0:
      {
      int v89 = 12;
      int v90 = v89 + v76;
      int v91 = v75[v90];
      int v92 = 3;
      int v93;
      v93 = v92;
      switch (v91) {
        case 0:
          {
          int v94 = 16;
          int v95 = v94 + v76;
          int v96 = v75[v95];
          int v97 = 1;
          int v98 = v76 + v97;
          int v99;
          v99 = v98;
          switch (v96) {
            case 0:
              {
              v99 = v76;
              break;
            }
            default:
              {
              int v100 = 3;
              int v101 = v76 + v100;
              v99 = v101;
              break;
            }
            case 1:
              {
              int v102 = 1;
              v99 = v102;
              break;
            }
          }
          bool v103 = true;
          v93 = v99;
          break;
        }
        default:
          {
          int v104 = 20;
          int v105 = v104 + v76;
          int v106 = v75[v105];
          int v107 = 0;
          bool v108 = v106 != v107;
          int v109;
          if (v108) {
            v109 = v76;
          } else {
            int v110 = 3;
            v109 = v110;
          }
          v93 = v109;
          break;
        }
        case 1:
          {
          int v111 = 24;
          int v112 = v111 + v76;
          int v113 = v75[v112];
          int v114 = 0;
          bool v115 = v113 != v114;
          int v116;
          if (v115) {
            v116 = v76;
          } else {
            int v117 = 0;
            int v118 = v76 + v117;
            v116 = v118;
          }
          v93 = v116;
          break;
        }
      }
      bool v119 = true;
      v88 = v93;
      break;
    }
    default:
      {
      int v120 = 0;
      int v121 = v76 + v120;
      v88 = v121;
    }
    case 1:
      {
      int v122 = 0;
      int v123 = 0;
      int v124;
      int v125;
      v124 = v122;
      v125 = v123;
      while (true) {
        int v126 = 4;
        int v127 = v125 * v126;
        int v128 = v127 + v76;
        int v129 = 28;
        int v130 = v129 + v128;
        int v131 = v75[v130];
        int v132 = 0;
        bool v133 = v131 != v132;
        v124 = v124;
        v125 = v125;
        if (!v133) break;
        int v134 = v124 + v125;
        int v135 = 1;
        int v136 = v125 + v135;
        v124 = v134;
        v125 = v136;
      }
      bool v137 = true;
      v88 = v124;
      break;
    }
    case 2:
      {
      int v138 = 48;
      int v139 = v138 + v76;
      int v140 = v75[v139];
      int v141 = 3;
      int v142;
      v142 = v141;
      switch (v140) {
        case 0:
          {
          int v143 = 52;
          int v144 = v143 + v76;
          int v145 = v75[v144];
          int v146 = 4;
          int v147 = v76 + v146;
          int v148;
          v148 = v147;
          switch (v145) {
            default:
              {
              v148 = v76;
              break;
            }
            case 0:
              {
              int v149 = 0;
              v148 = v149;
              break;
            }
          }
          bool v150 = true;
          v142 = v148;
          break;
        }
        case 1:
          {
          int v151 = 56;
          int v152 = v151 + v76;
          int v153 = v75[v152];
          int v154 = 0;
          bool v155 = v153 != v154;
          int v156;
          if (v155) {
            int v157 = 2;
            int v158 = v76 + v157;
            v156 = v158;
          } else {
            v156 = v76;
          }
          v142 = v156;
        }
        default:
          {
          int v159 = 0;
          int v160 = 0;
          int v161;
          int v162;
          v161 = v159;
          v162 = v160;
          while (true) {
            int v163 = 4;
            int v164 = v162 * v163;
            int v165 = v164 + v76;
            int v166 = 60;
            int v167 = v166 + v165;
            int v168 = v75[v167];
            int v169 = 0;
            bool v170 = v168 != v169;
            v161 = v161;
            v162 = v162;
            if (!v170) break;
            int v171 = v161 + v162;
            int v172 = 1;
            int v173 = v162 + v172;
            v161 = v171;
            v162 = v173;
          }
          bool v174 = true;
          v142 = v161;
        }
        case 2:
          {
          int v175 = 80;
          int v176 = v175 + v76;
          int v177 = v75[v176];
          int v178 = 2;
          int v179;
          v179 = v178;
          switch (v177) {
            default:
              {
              int v180 = 4;
              int v181 = v76 + v180;
              v179 = v181;
              break;
            }
            case 0:
              {
              int v182 = 1;
              int v183 = v76 + v182;
              v179 = v183;
              break;
            }
          }
          bool v184 = true;
          v142 = v179;
          break;
        }
      }
      bool v185 = true;
      v88 = v142;
      break;
    }
  }
  bool v186 = true;
  int v187 = 32;
  int v188 = v187 + v76;
  bool v189 = true;
  int v190 = simt_wave_count_bits(v189);
  v74[v188] = v190;
  uint v191 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v192 = (int)(v191);
  int v193 = 1;
  int v194 = v76 + v193;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
