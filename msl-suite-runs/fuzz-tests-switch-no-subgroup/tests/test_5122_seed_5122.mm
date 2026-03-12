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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 0;
  bool v9 = v2 != v8;
  int v10;
  if (v9) {
    bool v11 = true;
    int v12 = simt_wave_count_bits(v11);
    int v13 = 16;
    int v14 = v13 + v0;
    v1[v14] = v12;
    v10 = v12;
  } else {
    bool v15 = true;
    int v16 = simt_wave_count_bits(v15);
    int v17 = 32;
    int v18 = v17 + v0;
    v1[v18] = v16;
    v10 = v16;
  }
  int v19 = 0;
  bool v20 = v2 != v19;
  int v21 = v20 ? v5 : v10;
  int v22 = 3;
  int v23 = v3 % v22;
  int v24;
  v24 = v0;
  switch (v23) {
    case 0:
      {
      int v25 = 0;
      int v26 = 0;
      int v27;
      int v28;
      v27 = v25;
      v28 = v26;
      while (true) {
        int v29 = 4;
        int v30 = v3 % v29;
        int v31 = 1;
        int v32 = v30 + v31;
        bool v33 = v28 < v32;
        v27 = v27;
        v28 = v28;
        if (!v33) break;
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
        }
        int v45 = 1;
        int v46 = v28 + v45;
        v27 = v36;
        v28 = v46;
        continue;
        ;
      }
      v24 = v27;
    }
    case 1:
      {
      int v47 = 0;
      bool v48 = v2 != v47;
      int v49;
      if (v48) {
        int v50 = 0;
        int v51 = 0;
        int v52;
        int v53;
        v52 = v50;
        v53 = v51;
        while (true) {
          int v54 = 4;
          int v55 = v3 % v54;
          int v56 = 1;
          int v57 = v55 + v56;
          bool v58 = v53 < v57;
          v52 = v52;
          v53 = v53;
          if (!v58) break;
          int v59 = 1;
          int v60 = v53 + v59;
          v52 = v0;
          v53 = v60;
          break;
          ;
        }
        v49 = v52;
      } else {
        int v61 = 2;
        int v62 = v3 % v61;
        int v63 = 0;
        int v64 = v0 + v63;
        int v65;
        v65 = v64;
        switch (v62) {
          default:
            {
            int v66 = 1;
            v65 = v66;
            break;
          }
          case 0:
            {
            v65 = v0;
            break;
          }
        }
        v49 = v65;
      }
      v24 = v49;
      break;
    }
    default:
      {
      int v67 = 0;
      bool v68 = v2 != v67;
      int v69;
      if (v68) {
        int v70 = 1;
        v69 = v70;
      } else {
        int v71 = 0;
        bool v72 = v2 != v71;
        int v73;
        if (v72) {
          int v74 = 0;
          v73 = v74;
        } else {
          int v75 = 0;
          int v76 = v0 + v75;
          v73 = v76;
        }
        v69 = v73;
      }
      v24 = v69;
    }
    case 2:
      {
      int v77 = 3;
      int v78 = v3 % v77;
      int v79 = 0;
      int v80 = v0 + v79;
      int v81;
      v81 = v80;
      switch (v78) {
        default:
          {
          int v82 = 0;
          int v83 = 0;
          int v84;
          int v85;
          v84 = v82;
          v85 = v83;
          while (true) {
            int v86 = 4;
            int v87 = v3 % v86;
            int v88 = 1;
            int v89 = v87 + v88;
            bool v90 = v85 < v89;
            v84 = v84;
            v85 = v85;
            if (!v90) break;
            int v91 = 0;
            int v92 = 1;
            int v93 = v85 + v92;
            v84 = v91;
            v85 = v93;
            break;
            ;
          }
          v81 = v84;
          break;
        }
        case 0:
          {
          int v94 = 0;
          int v95 = 0;
          int v96;
          int v97;
          v96 = v94;
          v97 = v95;
          while (true) {
            int v98 = 4;
            int v99 = v3 % v98;
            int v100 = 1;
            int v101 = v99 + v100;
            bool v102 = v97 < v101;
            v96 = v96;
            v97 = v97;
            if (!v102) break;
            int v103 = 3;
            int v104 = v0 + v103;
            int v105 = 1;
            int v106 = v97 + v105;
            v96 = v104;
            v97 = v106;
            break;
            ;
          }
          v81 = v96;
          break;
        }
        case 1:
          {
          int v107 = 0;
          bool v108 = v2 != v107;
          int v109;
          if (v108) {
            int v110 = 3;
            int v111 = v0 + v110;
            v109 = v111;
          } else {
            v109 = v0;
          }
          v81 = v109;
          break;
        }
      }
      v24 = v81;
      break;
    }
  }
  int v112 = 0;
  bool v113 = v2 != v112;
  int v114 = v113 ? v21 : v24;
  return;
}

kernel void kernel_main(device int* v115 [[buffer(0)]], device int* v116 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v117 = static_cast<int>(__simt_tid3.x);
  int v118 = 0;
  int v119 = v118 + v117;
  int v120 = v116[v119];
  int v121 = 4;
  int v122 = v121 + v117;
  int v123 = v116[v122];
  int v124 = 0;
  bool v125 = v120 != v124;
  if (v125) {
    int v126 = 8;
    int v127 = v126 + v117;
    int v128 = v116[v127];
    int v129 = 0;
    bool v130 = v128 != v129;
    if (v130) {
      helper0(v117, v115, v120, v123, static_cast<int>(__simt_tid3.x));
    } else {
    }
  } else {
  }
  int v131 = 12;
  int v132 = v131 + v117;
  int v133 = v116[v132];
  int v134 = 0;
  bool v135 = v133 != v134;
  int v136;
  if (v135) {
    uint v137 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v138 = (int)(v137);
    v136 = v138;
  } else {
    int v139 = 0;
    int v140 = 0;
    int v141;
    int v142;
    v141 = v139;
    v142 = v140;
    while (true) {
      int v143 = 4;
      int v144 = v142 * v143;
      int v145 = v144 + v117;
      int v146 = 16;
      int v147 = v146 + v145;
      int v148 = v116[v147];
      int v149 = 0;
      bool v150 = v148 != v149;
      v141 = v141;
      v142 = v142;
      if (!v150) break;
      int v151 = v141 + v142;
      int v152 = 1;
      int v153 = v142 + v152;
      bool v154 = true;
      int v155 = 48;
      int v156 = 4;
      int v157 = v142 * v156;
      int v158 = v155 + v157;
      int v159 = v158 + v117;
      bool v160 = true;
      int v161 = simt_wave_count_bits(v160);
      v115[v159] = v161;
      v141 = v151;
      v142 = v153;
    }
    v136 = v141;
  }
  int v162 = 64;
  int v163 = v162 + v117;
  bool v164 = true;
  int v165 = simt_wave_count_bits(v164);
  v115[v163] = v165;
  int v166 = 36;
  int v167 = v166 + v117;
  int v168 = v116[v167];
  int v169 = 4;
  int v170 = v117 + v169;
  int v171;
  v171 = v170;
  switch (v168) {
    default:
      {
      int v172 = 40;
      int v173 = v172 + v117;
      int v174 = v116[v173];
      int v175 = 0;
      bool v176 = v174 != v175;
      int v177;
      if (v176) {
        int v178 = 3;
        v177 = v178;
      } else {
        int v179 = 44;
        int v180 = v179 + v117;
        int v181 = v116[v180];
        int v182 = 4;
        int v183 = v117 + v182;
        int v184;
        v184 = v183;
        switch (v181) {
          default:
            {
            int v185 = 3;
            int v186 = v117 + v185;
            v184 = v186;
            break;
          }
          case 0:
            {
            int v187 = 4;
            v184 = v187;
          }
          case 1:
            {
            int v188 = 3;
            int v189 = v117 + v188;
            v184 = v189;
            break;
          }
        }
        v177 = v184;
      }
      v171 = v177;
      break;
    }
    case 0:
      {
      v171 = v117;
      break;
    }
    case 1:
      {
      int v190 = 48;
      int v191 = v190 + v117;
      int v192 = v116[v191];
      int v193;
      v193 = v117;
      switch (v192) {
        default:
          {
          int v194 = 0;
          int v195 = 0;
          int v196;
          int v197;
          v196 = v194;
          v197 = v195;
          while (true) {
            int v198 = 4;
            int v199 = v197 * v198;
            int v200 = v199 + v117;
            int v201 = 52;
            int v202 = v201 + v200;
            int v203 = v116[v202];
            int v204 = 0;
            bool v205 = v203 != v204;
            v196 = v196;
            v197 = v197;
            if (!v205) break;
            int v206 = v196 + v197;
            int v207 = 1;
            int v208 = v197 + v207;
            bool v209 = true;
            v196 = v206;
            v197 = v208;
          }
          v193 = v196;
          break;
        }
        case 0:
          {
          v193 = v117;
          break;
        }
      }
      v171 = v193;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
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
