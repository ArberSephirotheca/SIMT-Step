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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 0;
      int v8 = 0;
      int v9;
      int v10;
      v9 = v7;
      v10 = v8;
      while (true) {
        int v11 = 4;
        int v12 = v3 % v11;
        int v13 = 1;
        int v14 = v12 + v13;
        bool v15 = v10 < v14;
        v9 = v9;
        v10 = v10;
        if (!v15) break;
        int v16 = 1;
        int v17 = v10 + v16;
        v9 = v0;
        v10 = v17;
      }
      v6 = v9;
      break;
    }
    default:
      {
      int v18 = 0;
      bool v19 = v2 != v18;
      int v20;
      if (v19) {
        int v21 = 0;
        bool v22 = v2 != v21;
        int v23;
        if (v22) {
          int v24 = 0;
          int v25 = v0 + v24;
          v23 = v25;
        } else {
          int v26 = 1;
          v23 = v26;
        }
        v20 = v23;
      } else {
        int v27 = 4;
        int v28 = v3 % v27;
        int v29;
        v29 = v0;
        switch (v28) {
          case 0:
            {
            int v30 = 2;
            v29 = v30;
          }
          case 1:
            {
            v29 = v0;
            break;
          }
          default:
            {
            v29 = v0;
            break;
          }
          case 2:
            {
            int v31 = 4;
            v29 = v31;
            break;
          }
        }
        v20 = v29;
      }
      v6 = v20;
      break;
    }
    case 1:
      {
      int v32 = 3;
      int v33 = v3 % v32;
      int v34 = 4;
      int v35 = v0 + v34;
      int v36;
      v36 = v35;
      switch (v33) {
        case 0:
          {
          int v37 = 3;
          int v38 = v3 % v37;
          int v39;
          v39 = v0;
          switch (v38) {
            case 0:
              {
              v39 = v0;
            }
            default:
              {
              int v40 = 4;
              int v41 = v0 + v40;
              v39 = v41;
              break;
            }
            case 1:
              {
              int v42 = 0;
              int v43 = v0 + v42;
              v39 = v43;
              break;
            }
          }
          int v44 = 1;
          int v45 = v0 + v44;
          v36 = v39;
          break;
        }
        case 1:
          {
          int v46 = 0;
          int v47 = 0;
          int v48;
          int v49;
          v48 = v46;
          v49 = v47;
          while (true) {
            int v50 = 4;
            int v51 = v3 % v50;
            int v52 = 1;
            int v53 = v51 + v52;
            bool v54 = v49 < v53;
            v48 = v48;
            v49 = v49;
            if (!v54) break;
            int v55 = 2;
            int v56 = 1;
            int v57 = v49 + v56;
            v48 = v55;
            v49 = v57;
          }
          v36 = v48;
          break;
        }
        case 2:
          {
          int v58 = 0;
          int v59 = 0;
          int v60;
          int v61;
          v60 = v58;
          v61 = v59;
          while (true) {
            int v62 = 4;
            int v63 = v3 % v62;
            int v64 = 1;
            int v65 = v63 + v64;
            bool v66 = v61 < v65;
            v60 = v60;
            v61 = v61;
            if (!v66) break;
            int v67 = 0;
            int v68 = v0 + v67;
            int v69 = 1;
            int v70 = v61 + v69;
            v60 = v68;
            v61 = v70;
            break;
            ;
          }
          v36 = v60;
          break;
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
            int v76 = v3 % v75;
            int v77 = 1;
            int v78 = v76 + v77;
            bool v79 = v74 < v78;
            v73 = v73;
            v74 = v74;
            if (!v79) break;
            int v80 = 1;
            int v81 = v74 + v80;
            v73 = v0;
            v74 = v81;
            break;
            ;
          }
          v36 = v73;
          break;
        }
      }
      v6 = v36;
      break;
    }
    case 2:
      {
      int v82 = 2;
      int v83 = v3 % v82;
      int v84;
      v84 = v0;
      switch (v83) {
        default:
          {
          int v85 = 3;
          int v86 = v0 + v85;
          v84 = v86;
          break;
        }
        case 0:
          {
          int v87 = 0;
          v84 = v87;
          break;
        }
      }
      v6 = v84;
      break;
    }
  }
  bool v88 = true;
  int v89 = simt_wave_count_bits(v88);
  int v90 = 0;
  int v91 = v90 + v0;
  v1[v91] = v89;
  return;
}

kernel void kernel_main(device int* v92 [[buffer(0)]], device int* v93 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v94 = static_cast<int>(__simt_tid3.x);
  int v95 = 0;
  int v96 = v95 + v94;
  int v97 = v93[v96];
  int v98 = 4;
  int v99 = v98 + v94;
  int v100 = v93[v99];
  helper0(v94, v92, v97, v100, static_cast<int>(__simt_tid3.x));
  int v101 = 8;
  int v102 = v101 + v94;
  int v103 = v93[v102];
  int v104 = 0;
  bool v105 = v103 != v104;
  int v106;
  if (v105) {
    v106 = v94;
  } else {
    int v107 = 12;
    int v108 = v107 + v94;
    int v109 = v93[v108];
    int v110 = 0;
    int v111;
    v111 = v110;
    switch (v109) {
      default:
        {
        int v112 = 16;
        int v113 = v112 + v94;
        int v114 = v93[v113];
        int v115 = 4;
        int v116 = v94 + v115;
        int v117;
        v117 = v116;
        switch (v114) {
          case 0:
            {
            int v118 = 3;
            v117 = v118;
            break;
          }
          default:
            {
            int v119 = 0;
            int v120 = v94 + v119;
            v117 = v120;
            break;
          }
          case 1:
            {
            int v121 = 2;
            v117 = v121;
            break;
          }
        }
        v111 = v117;
        break;
      }
      case 0:
        {
        int v122 = 20;
        int v123 = v122 + v94;
        int v124 = v93[v123];
        int v125 = 0;
        bool v126 = v124 != v125;
        int v127;
        if (v126) {
          int v128 = 2;
          int v129 = v94 + v128;
          v127 = v129;
        } else {
          int v130 = 3;
          int v131 = v94 + v130;
          v127 = v131;
        }
        v111 = v127;
        break;
      }
      case 1:
        {
        int v132 = 24;
        int v133 = v132 + v94;
        int v134 = v93[v133];
        int v135 = 4;
        int v136 = v94 + v135;
        int v137;
        v137 = v136;
        switch (v134) {
          default:
            {
            int v138 = 1;
            int v139 = v94 + v138;
            v137 = v139;
          }
          case 0:
            {
            v137 = v94;
            break;
          }
          case 1:
            {
            int v140 = 2;
            v137 = v140;
            break;
          }
          case 2:
            {
            int v141 = 0;
            int v142 = v94 + v141;
            v137 = v142;
            break;
          }
        }
        v111 = v137;
        break;
      }
      case 2:
        {
        int v143 = 28;
        int v144 = v143 + v94;
        int v145 = v93[v144];
        int v146 = 0;
        int v147;
        v147 = v146;
        switch (v145) {
          default:
            {
            int v148 = 3;
            int v149 = v94 + v148;
            v147 = v149;
            break;
          }
          case 0:
            {
            int v150 = 3;
            int v151 = v94 + v150;
            v147 = v151;
            break;
          }
        }
        bool v152 = true;
        v111 = v147;
        break;
      }
    }
    v106 = v111;
  }
  int v153 = 16;
  int v154 = v153 + v94;
  bool v155 = true;
  int v156 = simt_wave_count_bits(v155);
  v92[v154] = v156;
  int v157 = 3;
  int v158 = 32;
  int v159 = v158 + v94;
  int v160 = v93[v159];
  uint v161 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v162 = (int)(v161);
  int v163;
  v163 = v162;
  switch (v160) {
    case 0:
      {
      int v164 = 36;
      int v165 = v164 + v94;
      int v166 = v93[v165];
      int v167 = 0;
      bool v168 = v166 != v167;
      int v169;
      if (v168) {
        int v170 = 40;
        int v171 = v170 + v94;
        int v172 = v93[v171];
        int v173 = 0;
        bool v174 = v172 != v173;
        int v175;
        if (v174) {
          int v176 = 4;
          v175 = v176;
        } else {
          int v177 = 4;
          int v178 = v94 + v177;
          v175 = v178;
        }
        v169 = v175;
      } else {
        int v179 = 44;
        int v180 = v179 + v94;
        int v181 = v93[v180];
        int v182;
        v182 = v94;
        switch (v181) {
          default:
            {
            v182 = v94;
            break;
          }
          case 0:
            {
            int v183 = 4;
            int v184 = v94 + v183;
            v182 = v184;
            break;
          }
        }
        v169 = v182;
      }
      v163 = v169;
    }
    case 1:
      {
      int v185 = 48;
      int v186 = v185 + v94;
      int v187 = v93[v186];
      int v188 = 0;
      bool v189 = v187 != v188;
      int v190;
      if (v189) {
        v190 = v94;
      } else {
        int v191 = 52;
        int v192 = v191 + v94;
        int v193 = v93[v192];
        int v194 = 0;
        bool v195 = v193 != v194;
        int v196;
        if (v195) {
          int v197 = 1;
          v196 = v197;
        } else {
          int v198 = 3;
          int v199 = v94 + v198;
          v196 = v199;
        }
        v190 = v196;
      }
      v163 = v190;
      break;
    }
    case 2:
      {
      v163 = v94;
    }
    default:
      {
      int v200 = 56;
      int v201 = v200 + v94;
      int v202 = v93[v201];
      int v203 = 4;
      int v204;
      v204 = v203;
      switch (v202) {
        default:
          {
          int v205 = 60;
          int v206 = v205 + v94;
          int v207 = v93[v206];
          int v208 = 0;
          bool v209 = v207 != v208;
          int v210;
          if (v209) {
            int v211 = 3;
            v210 = v211;
          } else {
            int v212 = 0;
            int v213 = v94 + v212;
            v210 = v213;
          }
          v204 = v210;
        }
        case 0:
          {
          v204 = v94;
          break;
        }
      }
      v163 = v204;
      break;
    }
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
