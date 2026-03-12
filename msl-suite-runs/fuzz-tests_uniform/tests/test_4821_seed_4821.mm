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
    int v14 = 0;
    int v15;
    int v16;
    v15 = v13;
    v16 = v14;
    while (true) {
      int v17 = 4;
      int v18 = v3 % v17;
      int v19 = 1;
      int v20 = v18 + v19;
      bool v21 = v16 < v20;
      v15 = v15;
      v16 = v16;
      if (!v21) break;
      int v22 = 2;
      int v23 = v0 + v22;
      int v24 = 1;
      int v25 = v16 + v24;
      v15 = v23;
      v16 = v25;
    }
    int v26 = 0;
    int v27 = 1;
    int v28 = v7 + v27;
    v6 = v15;
    v7 = v28;
  }
  bool v29 = true;
  int v30 = simt_wave_count_bits(v29);
  int v31 = 0;
  int v32 = v31 + v0;
  v1[v32] = v30;
  int v33 = 3;
  int v34 = v3 % v33;
  int v35 = 0;
  int v36;
  v36 = v35;
  switch (v34) {
    case 0:
      {
      int v37 = 0;
      bool v38 = v2 != v37;
      int v39;
      if (v38) {
        int v40 = 0;
        bool v41 = v2 != v40;
        int v42;
        if (v41) {
          int v43 = 1;
          int v44 = v0 + v43;
          v42 = v44;
        } else {
          int v45 = 1;
          v42 = v45;
        }
        int v46 = 2;
        v39 = v42;
      } else {
        int v47 = 0;
        bool v48 = v2 != v47;
        int v49;
        if (v48) {
          int v50 = 3;
          int v51 = v0 + v50;
          v49 = v51;
        } else {
          v49 = v0;
        }
        v39 = v49;
      }
      int v52 = 4;
      v36 = v39;
      break;
    }
    default:
      {
      int v53 = 1;
      int v54 = v0 + v53;
      v36 = v54;
    }
    case 1:
      {
      int v55 = 0;
      int v56 = 0;
      int v57;
      int v58;
      v57 = v55;
      v58 = v56;
      while (true) {
        int v59 = 4;
        int v60 = v3 % v59;
        int v61 = 1;
        int v62 = v60 + v61;
        bool v63 = v58 < v62;
        v57 = v57;
        v58 = v58;
        if (!v63) break;
        int v64 = 0;
        int v65 = 0;
        int v66;
        int v67;
        v66 = v64;
        v67 = v65;
        while (true) {
          int v68 = 4;
          int v69 = v3 % v68;
          int v70 = 1;
          int v71 = v69 + v70;
          bool v72 = v67 < v71;
          v66 = v66;
          v67 = v67;
          if (!v72) break;
          int v73 = 1;
          int v74 = v67 + v73;
          v66 = v0;
          v67 = v74;
          continue;
          ;
        }
        int v75 = 3;
        int v76 = 1;
        int v77 = v58 + v76;
        v57 = v66;
        v58 = v77;
      }
      int v78 = 3;
      v36 = v57;
      break;
    }
  }
  bool v79 = true;
  int v80 = simt_wave_count_bits(v79);
  int v81 = 16;
  int v82 = v81 + v0;
  v1[v82] = v80;
  int v83 = 0;
  bool v84 = v2 != v83;
  int v85 = v84 ? v6 : v36;
  return;
}

kernel void kernel_main(device int* v86 [[buffer(0)]], device int* v87 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v88 = static_cast<int>(__simt_tid3.x);
  int v89 = 0;
  int v90 = v89 + v88;
  int v91 = v87[v90];
  int v92 = 4;
  int v93 = v92 + v88;
  int v94 = v87[v93];
  helper0(v88, v86, v91, v94, static_cast<int>(__simt_tid3.x));
  int v95 = 0;
  int v96 = 8;
  int v97 = v96 + v88;
  int v98 = v87[v97];
  uint v99 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v100 = (int)(v99);
  int v101;
  v101 = v100;
  switch (v98) {
    case 0:
      {
      int v102 = 12;
      int v103 = v102 + v88;
      int v104 = v87[v103];
      int v105 = 0;
      bool v106 = v104 != v105;
      int v107;
      if (v106) {
        int v108 = 16;
        int v109 = v108 + v88;
        int v110 = v87[v109];
        int v111 = 0;
        bool v112 = v110 != v111;
        int v113;
        if (v112) {
          int v114 = 1;
          int v115 = v88 + v114;
          v113 = v115;
        } else {
          int v116 = 3;
          v113 = v116;
        }
        v107 = v113;
      } else {
        int v117 = 0;
        int v118 = 0;
        int v119;
        int v120;
        v119 = v117;
        v120 = v118;
        while (true) {
          int v121 = 4;
          int v122 = v120 * v121;
          int v123 = v122 + v88;
          int v124 = 20;
          int v125 = v124 + v123;
          int v126 = v87[v125];
          int v127 = 0;
          bool v128 = v126 != v127;
          v119 = v119;
          v120 = v120;
          if (!v128) break;
          int v129 = v119 + v120;
          int v130 = 1;
          int v131 = v120 + v130;
          v119 = v129;
          v120 = v131;
        }
        bool v132 = true;
        v107 = v119;
      }
      v101 = v107;
      break;
    }
    default:
      {
      int v133 = 40;
      int v134 = v133 + v88;
      int v135 = v87[v134];
      int v136 = 0;
      bool v137 = v135 != v136;
      int v138;
      if (v137) {
        v138 = v88;
      } else {
        int v139 = 44;
        int v140 = v139 + v88;
        int v141 = v87[v140];
        int v142;
        v142 = v88;
        switch (v141) {
          case 0:
            {
            v142 = v88;
            break;
          }
          case 1:
            {
            int v143 = 0;
            v142 = v143;
            break;
          }
          default:
            {
            int v144 = 3;
            int v145 = v88 + v144;
            v142 = v145;
            break;
          }
        }
        bool v146 = true;
        v138 = v142;
      }
      v101 = v138;
    }
    case 1:
      {
      int v147 = 48;
      int v148 = v147 + v88;
      int v149 = v87[v148];
      int v150 = 2;
      int v151;
      v151 = v150;
      switch (v149) {
        case 0:
          {
          int v152 = 52;
          int v153 = v152 + v88;
          int v154 = v87[v153];
          int v155 = 0;
          bool v156 = v154 != v155;
          int v157;
          if (v156) {
            v157 = v88;
          } else {
            v157 = v88;
          }
          v151 = v157;
          break;
        }
        case 1:
          {
          int v158 = 1;
          v151 = v158;
          break;
        }
        case 2:
          {
          int v159 = 56;
          int v160 = v159 + v88;
          int v161 = v87[v160];
          int v162 = 0;
          int v163 = v88 + v162;
          int v164;
          v164 = v163;
          switch (v161) {
            case 0:
              {
              int v165 = 1;
              v164 = v165;
              break;
            }
            default:
              {
              int v166 = 4;
              int v167 = v88 + v166;
              v164 = v167;
              break;
            }
            case 1:
              {
              int v168 = 0;
              v164 = v168;
              break;
            }
            case 2:
              {
              int v169 = 1;
              v164 = v169;
              break;
            }
          }
          bool v170 = true;
          v151 = v164;
          break;
        }
        default:
          {
          int v171 = 0;
          int v172 = 0;
          int v173;
          int v174;
          v173 = v171;
          v174 = v172;
          while (true) {
            int v175 = 4;
            int v176 = v174 * v175;
            int v177 = v176 + v88;
            int v178 = 60;
            int v179 = v178 + v177;
            int v180 = v87[v179];
            int v181 = 0;
            bool v182 = v180 != v181;
            v173 = v173;
            v174 = v174;
            if (!v182) break;
            int v183 = v173 + v174;
            int v184 = 1;
            int v185 = v174 + v184;
            v173 = v183;
            v174 = v185;
            break;
            ;
          }
          bool v186 = true;
          v151 = v173;
          break;
        }
      }
      bool v187 = true;
      v101 = v151;
      break;
    }
    case 2:
      {
      int v188 = 80;
      int v189 = v188 + v88;
      int v190 = v87[v189];
      int v191 = 0;
      bool v192 = v190 != v191;
      int v193;
      if (v192) {
        int v194 = 0;
        int v195 = 0;
        int v196;
        int v197;
        v196 = v194;
        v197 = v195;
        while (true) {
          int v198 = 4;
          int v199 = v197 * v198;
          int v200 = v199 + v88;
          int v201 = 84;
          int v202 = v201 + v200;
          int v203 = v87[v202];
          int v204 = 0;
          bool v205 = v203 != v204;
          v196 = v196;
          v197 = v197;
          if (!v205) break;
          int v206 = v196 + v197;
          int v207 = 1;
          int v208 = v197 + v207;
          v196 = v206;
          v197 = v208;
        }
        bool v209 = true;
        v193 = v196;
      } else {
        v193 = v88;
      }
      v101 = v193;
      break;
    }
  }
  bool v210 = true;
  int v211 = 32;
  int v212 = v211 + v88;
  bool v213 = true;
  int v214 = simt_wave_count_bits(v213);
  v86[v212] = v214;
  uint v215 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v216 = (int)(v215);
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
