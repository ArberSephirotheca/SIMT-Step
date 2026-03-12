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
    int v13 = 1;
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
  int v20 = 3;
  int v21 = v3 % v20;
  int v22;
  v22 = v0;
  switch (v21) {
    case 0:
      {
      int v23 = 2;
      int v24 = v3 % v23;
      int v25;
      v25 = v0;
      switch (v24) {
        case 0:
          {
          int v26 = 0;
          bool v27 = v2 != v26;
          int v28;
          if (v27) {
            int v29 = 4;
            int v30 = v0 + v29;
            v28 = v30;
          } else {
            int v31 = 0;
            v28 = v31;
          }
          int v32 = 4;
          v25 = v28;
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
            int v38 = 4;
            int v39 = v0 + v38;
            v35 = v39;
          }
          v25 = v35;
          break;
        }
      }
      v22 = v25;
    }
    case 1:
      {
      int v40 = 3;
      int v41 = v3 % v40;
      int v42 = 2;
      int v43;
      v43 = v42;
      switch (v41) {
        case 0:
          {
          int v44 = 0;
          bool v45 = v2 != v44;
          int v46;
          if (v45) {
            v46 = v0;
          } else {
            int v47 = 2;
            v46 = v47;
          }
          int v48 = 1;
          v43 = v46;
          break;
        }
        case 1:
          {
          int v49 = 0;
          bool v50 = v2 != v49;
          int v51;
          if (v50) {
            int v52 = 0;
            int v53 = v0 + v52;
            v51 = v53;
          } else {
            int v54 = 3;
            v51 = v54;
          }
          int v55 = 1;
          int v56 = v0 + v55;
          v43 = v51;
          break;
        }
        default:
          {
          int v57 = 0;
          int v58 = 0;
          int v59;
          int v60;
          v59 = v57;
          v60 = v58;
          while (true) {
            int v61 = 4;
            int v62 = v3 % v61;
            int v63 = 1;
            int v64 = v62 + v63;
            bool v65 = v60 < v64;
            v59 = v59;
            v60 = v60;
            if (!v65) break;
            int v66 = 1;
            int v67 = v60 + v66;
            v59 = v0;
            v60 = v67;
          }
          int v68 = 3;
          int v69 = v0 + v68;
          v43 = v59;
          break;
        }
        case 2:
          {
          int v70 = 2;
          int v71 = v0 + v70;
          v43 = v71;
          break;
        }
      }
      int v72 = 3;
      v22 = v43;
      break;
    }
    case 2:
      {
      int v73 = 4;
      int v74 = v3 % v73;
      int v75 = 3;
      int v76 = v0 + v75;
      int v77;
      v77 = v76;
      switch (v74) {
        default:
          {
          int v78 = 2;
          int v79 = v3 % v78;
          int v80;
          v80 = v0;
          switch (v79) {
            case 0:
              {
              int v81 = 2;
              int v82 = v0 + v81;
              v80 = v82;
              break;
            }
            case 1:
              {
              int v83 = 2;
              int v84 = v0 + v83;
              v80 = v84;
              break;
            }
            default:
              {
              int v85 = 1;
              v80 = v85;
              break;
            }
          }
          int v86 = 0;
          v77 = v80;
          break;
        }
        case 0:
          {
          int v87 = 0;
          int v88 = 0;
          int v89;
          int v90;
          v89 = v87;
          v90 = v88;
          while (true) {
            int v91 = 4;
            int v92 = v3 % v91;
            int v93 = 1;
            int v94 = v92 + v93;
            bool v95 = v90 < v94;
            v89 = v89;
            v90 = v90;
            if (!v95) break;
            int v96 = 4;
            int v97 = v0 + v96;
            int v98 = 1;
            int v99 = v90 + v98;
            v89 = v97;
            v90 = v99;
          }
          v77 = v89;
          break;
        }
        case 1:
          {
          int v100 = 4;
          int v101 = v0 + v100;
          v77 = v101;
          break;
        }
        case 2:
          {
          int v102 = 0;
          bool v103 = v2 != v102;
          int v104;
          if (v103) {
            v104 = v0;
          } else {
            v104 = v0;
          }
          v77 = v104;
          break;
        }
      }
      int v105 = 4;
      int v106 = v0 + v105;
      v22 = v77;
      break;
    }
    default:
      {
      int v107 = 0;
      bool v108 = v2 != v107;
      int v109;
      if (v108) {
        int v110 = 0;
        bool v111 = v2 != v110;
        int v112;
        if (v111) {
          int v113 = 0;
          v112 = v113;
        } else {
          v112 = v0;
        }
        int v114 = 3;
        v109 = v112;
      } else {
        int v115 = 0;
        bool v116 = v2 != v115;
        int v117;
        if (v116) {
          int v118 = 4;
          v117 = v118;
        } else {
          v117 = v0;
        }
        v109 = v117;
      }
      int v119 = 4;
      v22 = v109;
      break;
    }
  }
  bool v120 = true;
  int v121 = simt_wave_count_bits(v120);
  int v122 = 16;
  int v123 = v122 + v0;
  v1[v123] = v121;
  int v124 = 0;
  bool v125 = v2 != v124;
  int v126 = v125 ? v6 : v22;
  return;
}

kernel void kernel_main(device int* v127 [[buffer(0)]], device int* v128 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v129 = static_cast<int>(__simt_tid3.x);
  int v130 = 0;
  int v131 = v130 + v129;
  int v132 = v128[v131];
  int v133 = 4;
  int v134 = v133 + v129;
  int v135 = v128[v134];
  helper0(v129, v127, v132, v135, static_cast<int>(__simt_tid3.x));
  int v136 = 0;
  int v137 = 0;
  int v138;
  int v139;
  v138 = v136;
  v139 = v137;
  while (true) {
    int v140 = 4;
    int v141 = v139 * v140;
    int v142 = v141 + v129;
    int v143 = 8;
    int v144 = v143 + v142;
    int v145 = v128[v144];
    int v146 = 0;
    bool v147 = v145 != v146;
    v138 = v138;
    v139 = v139;
    if (!v147) break;
    int v148 = 0;
    int v149 = v138 + v148;
    int v150 = 1;
    int v151 = v139 + v150;
    v138 = v149;
    v139 = v151;
    continue;
    ;
  }
  bool v152 = true;
  int v153 = 32;
  int v154 = v153 + v129;
  bool v155 = true;
  int v156 = simt_wave_count_bits(v155);
  v127[v154] = v156;
  int v157 = 1;
  int v158 = 28;
  int v159 = v158 + v129;
  int v160 = v128[v159];
  int v161 = 0;
  bool v162 = v160 != v161;
  int v163;
  if (v162) {
    int v164 = 32;
    int v165 = v164 + v129;
    int v166 = v128[v165];
    int v167 = 0;
    int v168;
    v168 = v167;
    switch (v166) {
      case 0:
        {
        int v169 = 36;
        int v170 = v169 + v129;
        int v171 = v128[v170];
        int v172 = 0;
        int v173;
        v173 = v172;
        switch (v171) {
          default:
            {
            int v174 = 0;
            v173 = v174;
          }
          case 0:
            {
            int v175 = 4;
            int v176 = v129 + v175;
            v173 = v176;
            break;
          }
        }
        bool v177 = true;
        v168 = v173;
      }
      default:
        {
        int v178 = 40;
        int v179 = v178 + v129;
        int v180 = v128[v179];
        int v181 = 0;
        bool v182 = v180 != v181;
        int v183;
        if (v182) {
          int v184 = 3;
          int v185 = v129 + v184;
          v183 = v185;
        } else {
          int v186 = 1;
          v183 = v186;
        }
        v168 = v183;
      }
      case 1:
        {
        int v187 = 0;
        int v188 = 0;
        int v189;
        int v190;
        v189 = v187;
        v190 = v188;
        while (true) {
          int v191 = 4;
          int v192 = v190 * v191;
          int v193 = v192 + v129;
          int v194 = 44;
          int v195 = v194 + v193;
          int v196 = v128[v195];
          int v197 = 0;
          bool v198 = v196 != v197;
          v189 = v189;
          v190 = v190;
          if (!v198) break;
          int v199 = v189 + v190;
          int v200 = 1;
          int v201 = v190 + v200;
          v189 = v199;
          v190 = v201;
        }
        bool v202 = true;
        v168 = v189;
        break;
      }
    }
    bool v203 = true;
    v163 = v168;
  } else {
    int v204 = 2;
    v163 = v204;
  }
  int v205 = 48;
  int v206 = v205 + v129;
  bool v207 = true;
  int v208 = simt_wave_count_bits(v207);
  v127[v206] = v208;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
