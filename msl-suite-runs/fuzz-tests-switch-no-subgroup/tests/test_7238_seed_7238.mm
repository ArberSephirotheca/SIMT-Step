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
  int v4 = 4;
  int v5 = v3 % v4;
  int v6 = 4;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 0;
      int v9 = 0;
      int v10;
      int v11;
      v10 = v8;
      v11 = v9;
      while (true) {
        int v12 = 4;
        int v13 = v3 % v12;
        int v14 = 1;
        int v15 = v13 + v14;
        bool v16 = v11 < v15;
        v10 = v10;
        v11 = v11;
        if (!v16) break;
        int v17 = 3;
        int v18 = 1;
        int v19 = v11 + v18;
        v10 = v17;
        v11 = v19;
      }
      v7 = v10;
      break;
    }
    case 1:
      {
      int v20 = 3;
      int v21 = v3 % v20;
      int v22 = 4;
      int v23;
      v23 = v22;
      switch (v21) {
        case 0:
          {
          int v24 = 2;
          int v25 = v3 % v24;
          int v26 = 2;
          int v27 = v0 + v26;
          int v28;
          v28 = v27;
          switch (v25) {
            case 0:
              {
              int v29 = 2;
              int v30 = v0 + v29;
              v28 = v30;
              break;
            }
            default:
              {
              int v31 = 0;
              int v32 = v0 + v31;
              v28 = v32;
              break;
            }
          }
          int v33 = 3;
          v23 = v28;
        }
        case 1:
          {
          int v34 = 0;
          int v35 = 0;
          int v36;
          int v37;
          v36 = v34;
          v37 = v35;
          while (true) {
            int v38 = 4;
            int v39 = v3 % v38;
            int v40 = 1;
            int v41 = v39 + v40;
            bool v42 = v37 < v41;
            v36 = v36;
            v37 = v37;
            if (!v42) break;
            int v43 = 1;
            int v44 = v37 + v43;
            v36 = v0;
            v37 = v44;
            break;
            ;
          }
          v23 = v36;
        }
        default:
          {
          int v45 = 0;
          int v46 = 0;
          int v47;
          int v48;
          v47 = v45;
          v48 = v46;
          while (true) {
            int v49 = 4;
            int v50 = v3 % v49;
            int v51 = 1;
            int v52 = v50 + v51;
            bool v53 = v48 < v52;
            v47 = v47;
            v48 = v48;
            if (!v53) break;
            int v54 = 1;
            int v55 = 1;
            int v56 = v48 + v55;
            v47 = v54;
            v48 = v56;
            continue;
            ;
          }
          v23 = v47;
          break;
        }
      }
      v7 = v23;
      break;
    }
    case 2:
      {
      int v57 = 4;
      int v58 = v3 % v57;
      int v59 = 4;
      int v60;
      v60 = v59;
      switch (v58) {
        case 0:
          {
          int v61 = 3;
          int v62 = v3 % v61;
          int v63 = 1;
          int v64;
          v64 = v63;
          switch (v62) {
            case 0:
              {
              int v65 = 2;
              v64 = v65;
            }
            default:
              {
              v64 = v0;
              break;
            }
            case 1:
              {
              int v66 = 1;
              v64 = v66;
              break;
            }
          }
          v60 = v64;
        }
        default:
          {
          int v67 = 0;
          bool v68 = v2 != v67;
          int v69;
          if (v68) {
            v69 = v0;
          } else {
            int v70 = 3;
            int v71 = v0 + v70;
            v69 = v71;
          }
          v60 = v69;
          break;
        }
        case 1:
          {
          int v72 = 0;
          bool v73 = v2 != v72;
          int v74;
          if (v73) {
            int v75 = 3;
            int v76 = v0 + v75;
            v74 = v76;
          } else {
            int v77 = 1;
            int v78 = v0 + v77;
            v74 = v78;
          }
          v60 = v74;
          break;
        }
        case 2:
          {
          int v79 = 0;
          int v80 = 0;
          int v81;
          int v82;
          v81 = v79;
          v82 = v80;
          while (true) {
            int v83 = 4;
            int v84 = v3 % v83;
            int v85 = 1;
            int v86 = v84 + v85;
            bool v87 = v82 < v86;
            v81 = v81;
            v82 = v82;
            if (!v87) break;
            int v88 = 2;
            int v89 = v0 + v88;
            int v90 = 1;
            int v91 = v82 + v90;
            v81 = v89;
            v82 = v91;
          }
          v60 = v81;
          break;
        }
      }
      v7 = v60;
      break;
    }
    default:
      {
      int v92 = 0;
      bool v93 = v2 != v92;
      int v94;
      if (v93) {
        int v95 = 3;
        int v96 = v3 % v95;
        int v97;
        v97 = v0;
        switch (v96) {
          case 0:
            {
            int v98 = 2;
            v97 = v98;
            break;
          }
          default:
            {
            v97 = v0;
          }
          case 1:
            {
            int v99 = 0;
            v97 = v99;
            break;
          }
        }
        v94 = v97;
      } else {
        int v100;
        v100 = v0;
        switch (v3) {
          case 0:
            {
            v100 = v0;
          }
          default:
            {
            int v101 = 0;
            v100 = v101;
            break;
          }
        }
        v94 = v100;
      }
      v7 = v94;
      break;
    }
  }
  bool v102 = true;
  int v103 = simt_wave_count_bits(v102);
  int v104 = 0;
  int v105 = v104 + v0;
  v1[v105] = v103;
  return;
}

kernel void kernel_main(device int* v106 [[buffer(0)]], device int* v107 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v108 = static_cast<int>(__simt_tid3.x);
  int v109 = 0;
  int v110 = v109 + v108;
  int v111 = v107[v110];
  int v112 = 4;
  int v113 = v112 + v108;
  int v114 = v107[v113];
  helper0(v108, v106, v111, v114, static_cast<int>(__simt_tid3.x));
  int v115 = 8;
  int v116 = v115 + v108;
  int v117 = v107[v116];
  uint v118 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v119 = (int)(v118);
  int v120;
  v120 = v119;
  switch (v117) {
    case 0:
      {
      int v121 = 4;
      v120 = v121;
      break;
    }
    case 1:
      {
      int v122 = 12;
      int v123 = v122 + v108;
      int v124 = v107[v123];
      int v125;
      v125 = v108;
      switch (v124) {
        default:
          {
          int v126 = 16;
          int v127 = v126 + v108;
          int v128 = v107[v127];
          int v129 = 0;
          bool v130 = v128 != v129;
          int v131;
          if (v130) {
            v131 = v108;
          } else {
            v131 = v108;
          }
          v125 = v131;
        }
        case 0:
          {
          int v132 = 0;
          int v133 = 0;
          int v134;
          int v135;
          v134 = v132;
          v135 = v133;
          while (true) {
            int v136 = 4;
            int v137 = v135 * v136;
            int v138 = v137 + v108;
            int v139 = 20;
            int v140 = v139 + v138;
            int v141 = v107[v140];
            int v142 = 0;
            bool v143 = v141 != v142;
            v134 = v134;
            v135 = v135;
            if (!v143) break;
            int v144 = v134 + v135;
            int v145 = 1;
            int v146 = v135 + v145;
            bool v147 = true;
            v134 = v144;
            v135 = v146;
          }
          v125 = v134;
          break;
        }
        case 1:
          {
          int v148 = 0;
          int v149 = 0;
          int v150;
          int v151;
          v150 = v148;
          v151 = v149;
          while (true) {
            int v152 = 4;
            int v153 = v151 * v152;
            int v154 = v153 + v108;
            int v155 = 40;
            int v156 = v155 + v154;
            int v157 = v107[v156];
            int v158 = 0;
            bool v159 = v157 != v158;
            v150 = v150;
            v151 = v151;
            if (!v159) break;
            int v160 = v150 + v151;
            int v161 = 1;
            int v162 = v151 + v161;
            bool v163 = true;
            v150 = v160;
            v151 = v162;
          }
          v125 = v150;
          break;
        }
        case 2:
          {
          int v164 = 60;
          int v165 = v164 + v108;
          int v166 = v107[v165];
          int v167 = 0;
          bool v168 = v166 != v167;
          int v169;
          if (v168) {
            v169 = v108;
          } else {
            int v170 = 3;
            int v171 = v108 + v170;
            v169 = v171;
          }
          v125 = v169;
          break;
        }
      }
      bool v172 = true;
      v120 = v125;
      break;
    }
    default:
      {
      int v173 = 64;
      int v174 = v173 + v108;
      int v175 = v107[v174];
      int v176 = 2;
      int v177;
      v177 = v176;
      switch (v175) {
        default:
          {
          int v178 = 68;
          int v179 = v178 + v108;
          int v180 = v107[v179];
          int v181 = 3;
          int v182;
          v182 = v181;
          switch (v180) {
            default:
              {
              int v183 = 2;
              int v184 = v108 + v183;
              v182 = v184;
              break;
            }
            case 0:
              {
              v182 = v108;
              break;
            }
            case 1:
              {
              int v185 = 1;
              int v186 = v108 + v185;
              v182 = v186;
              break;
            }
          }
          v177 = v182;
        }
        case 0:
          {
          int v187 = 72;
          int v188 = v187 + v108;
          int v189 = v107[v188];
          int v190 = 3;
          int v191 = v108 + v190;
          int v192;
          v192 = v191;
          switch (v189) {
            default:
              {
              int v193 = 4;
              v192 = v193;
              break;
            }
            case 0:
              {
              int v194 = 3;
              v192 = v194;
              break;
            }
          }
          bool v195 = true;
          v177 = v192;
          break;
        }
      }
      bool v196 = true;
      v120 = v177;
      break;
    }
  }
  uint v197 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v198 = (int)(v197);
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
