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
  int v4 = 1;
  int v5 = 4;
  int v6 = v3 % v5;
  uint v7 = simt_lane_id(__simt_tid);
  int v8 = (int)(v7);
  int v9;
  v9 = v8;
  switch (v6) {
    case 0:
      {
      int v10 = 0;
      int v11 = 0;
      int v12;
      int v13;
      v12 = v10;
      v13 = v11;
      while (true) {
        int v14 = 4;
        int v15 = v3 % v14;
        int v16 = 1;
        int v17 = v15 + v16;
        bool v18 = v13 < v17;
        v12 = v12;
        v13 = v13;
        if (!v18) break;
        int v19 = 3;
        int v20 = v3 % v19;
        int v21 = 0;
        int v22;
        v22 = v21;
        switch (v20) {
          case 0:
            {
            int v23 = 3;
            int v24 = v0 + v23;
            v22 = v24;
            break;
          }
          case 1:
            {
            int v25 = 1;
            v22 = v25;
            break;
          }
          default:
            {
            v22 = v0;
            break;
          }
        }
        int v26 = 1;
        int v27 = v0 + v26;
        int v28 = 1;
        int v29 = v13 + v28;
        v12 = v22;
        v13 = v29;
      }
      int v30 = 0;
      v9 = v12;
      break;
    }
    case 1:
      {
      int v31 = 3;
      int v32 = v3 % v31;
      int v33 = 2;
      int v34 = v0 + v33;
      int v35;
      v35 = v34;
      switch (v32) {
        default:
          {
          int v36 = 0;
          bool v37 = v2 != v36;
          int v38;
          if (v37) {
            v38 = v0;
          } else {
            v38 = v0;
          }
          v35 = v38;
          break;
        }
        case 0:
          {
          int v39 = 2;
          int v40 = v0 + v39;
          v35 = v40;
          break;
        }
        case 1:
          {
          int v41 = 0;
          bool v42 = v2 != v41;
          int v43;
          if (v42) {
            v43 = v0;
          } else {
            v43 = v0;
          }
          int v44 = 1;
          int v45 = v0 + v44;
          v35 = v43;
          break;
        }
      }
      int v46 = 4;
      int v47 = v0 + v46;
      v9 = v35;
      break;
    }
    case 2:
      {
      int v48 = 0;
      bool v49 = v2 != v48;
      int v50;
      if (v49) {
        int v51 = 0;
        bool v52 = v2 != v51;
        int v53;
        if (v52) {
          int v54 = 0;
          v53 = v54;
        } else {
          int v55 = 2;
          v53 = v55;
        }
        int v56 = 0;
        int v57 = v0 + v56;
        v50 = v53;
      } else {
        int v58 = 4;
        int v59 = v3 % v58;
        int v60 = 2;
        int v61;
        v61 = v60;
        switch (v59) {
          default:
            {
            v61 = v0;
            break;
          }
          case 0:
            {
            v61 = v0;
            break;
          }
          case 1:
            {
            v61 = v0;
            break;
          }
          case 2:
            {
            v61 = v0;
            break;
          }
        }
        v50 = v61;
      }
      int v62 = 0;
      int v63 = v0 + v62;
      v9 = v50;
      break;
    }
    default:
      {
      int v64 = 4;
      int v65 = v3 % v64;
      int v66 = 3;
      int v67;
      v67 = v66;
      switch (v65) {
        case 0:
          {
          int v68 = 2;
          int v69 = v3 % v68;
          int v70 = 3;
          int v71;
          v71 = v70;
          switch (v69) {
            default:
              {
              int v72 = 0;
              int v73 = v0 + v72;
              v71 = v73;
              break;
            }
            case 0:
              {
              v71 = v0;
              break;
            }
          }
          v67 = v71;
        }
        case 1:
          {
          int v74 = 0;
          int v75 = 0;
          int v76;
          int v77;
          v76 = v74;
          v77 = v75;
          while (true) {
            int v78 = 4;
            int v79 = v3 % v78;
            int v80 = 1;
            int v81 = v79 + v80;
            bool v82 = v77 < v81;
            v76 = v76;
            v77 = v77;
            if (!v82) break;
            int v83 = 3;
            int v84 = v0 + v83;
            int v85 = 1;
            int v86 = v77 + v85;
            v76 = v84;
            v77 = v86;
          }
          v67 = v76;
          break;
        }
        case 2:
          {
          int v87 = 3;
          int v88 = v3 % v87;
          int v89;
          v89 = v0;
          switch (v88) {
            case 0:
              {
              v89 = v0;
            }
            case 1:
              {
              int v90 = 0;
              v89 = v90;
              break;
            }
            default:
              {
              v89 = v0;
              break;
            }
            case 2:
              {
              v89 = v0;
              break;
            }
          }
          v67 = v89;
          break;
        }
        default:
          {
          v67 = v0;
          break;
        }
      }
      int v91 = 1;
      v9 = v67;
      break;
    }
  }
  bool v92 = true;
  int v93 = simt_wave_count_bits(v92);
  int v94 = 0;
  int v95 = v94 + v0;
  v1[v95] = v93;
  int v96 = 0;
  bool v97 = v2 != v96;
  int v98 = v97 ? v4 : v9;
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
  uint v111 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v112 = (int)(v111);
  int v113;
  v113 = v112;
  switch (v110) {
    default:
      {
      int v114 = 12;
      int v115 = v114 + v101;
      int v116 = v100[v115];
      int v117 = 0;
      bool v118 = v116 != v117;
      int v119;
      if (v118) {
        int v120 = 0;
        int v121 = 0;
        int v122;
        int v123;
        v122 = v120;
        v123 = v121;
        while (true) {
          int v124 = 4;
          int v125 = v123 * v124;
          int v126 = v125 + v101;
          int v127 = 16;
          int v128 = v127 + v126;
          int v129 = v100[v128];
          int v130 = 0;
          bool v131 = v129 != v130;
          v122 = v122;
          v123 = v123;
          if (!v131) break;
          int v132 = v122 + v123;
          int v133 = 1;
          int v134 = v123 + v133;
          v122 = v132;
          v123 = v134;
        }
        bool v135 = true;
        v119 = v122;
      } else {
        int v136 = 0;
        int v137 = v101 + v136;
        v119 = v137;
      }
      v113 = v119;
    }
    case 0:
      {
      int v138 = 0;
      int v139 = 0;
      int v140;
      int v141;
      v140 = v138;
      v141 = v139;
      while (true) {
        int v142 = 4;
        int v143 = v141 * v142;
        int v144 = v143 + v101;
        int v145 = 36;
        int v146 = v145 + v144;
        int v147 = v100[v146];
        int v148 = 0;
        bool v149 = v147 != v148;
        v140 = v140;
        v141 = v141;
        if (!v149) break;
        int v150 = v140 + v141;
        int v151 = 1;
        int v152 = v141 + v151;
        v140 = v150;
        v141 = v152;
        continue;
        ;
      }
      bool v153 = true;
      v113 = v140;
    }
    case 1:
      {
      int v154 = 56;
      int v155 = v154 + v101;
      int v156 = v100[v155];
      int v157 = 0;
      bool v158 = v156 != v157;
      int v159;
      if (v158) {
        int v160 = 60;
        int v161 = v160 + v101;
        int v162 = v100[v161];
        int v163;
        v163 = v101;
        switch (v162) {
          default:
            {
            int v164 = 0;
            v163 = v164;
          }
          case 0:
            {
            int v165 = 2;
            int v166 = v101 + v165;
            v163 = v166;
            break;
          }
        }
        bool v167 = true;
        v159 = v163;
      } else {
        int v168 = 64;
        int v169 = v168 + v101;
        int v170 = v100[v169];
        int v171 = 0;
        bool v172 = v170 != v171;
        int v173;
        if (v172) {
          v173 = v101;
        } else {
          int v174 = 4;
          int v175 = v101 + v174;
          v173 = v175;
        }
        v159 = v173;
      }
      v113 = v159;
    }
    case 2:
      {
      int v176 = 68;
      int v177 = v176 + v101;
      int v178 = v100[v177];
      int v179 = 0;
      bool v180 = v178 != v179;
      int v181;
      if (v180) {
        int v182 = 0;
        int v183 = 0;
        int v184;
        int v185;
        v184 = v182;
        v185 = v183;
        while (true) {
          int v186 = 4;
          int v187 = v185 * v186;
          int v188 = v187 + v101;
          int v189 = 72;
          int v190 = v189 + v188;
          int v191 = v100[v190];
          int v192 = 0;
          bool v193 = v191 != v192;
          v184 = v184;
          v185 = v185;
          if (!v193) break;
          int v194 = v184 + v185;
          int v195 = 1;
          int v196 = v185 + v195;
          v184 = v194;
          v185 = v196;
        }
        bool v197 = true;
        v181 = v184;
      } else {
        int v198 = 1;
        v181 = v198;
      }
      v113 = v181;
      break;
    }
  }
  bool v199 = true;
  int v200 = 16;
  int v201 = v200 + v101;
  bool v202 = true;
  int v203 = simt_wave_count_bits(v202);
  v99[v201] = v203;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 92; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
