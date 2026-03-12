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
    default:
      {
      int v7 = 4;
      int v8 = v3 % v7;
      int v9 = 3;
      int v10;
      v10 = v9;
      switch (v8) {
        case 0:
          {
          int v11 = 0;
          int v12 = 0;
          int v13;
          int v14;
          v13 = v11;
          v14 = v12;
          while (true) {
            int v15 = 4;
            int v16 = v3 % v15;
            int v17 = 1;
            int v18 = v16 + v17;
            bool v19 = v14 < v18;
            v13 = v13;
            v14 = v14;
            if (!v19) break;
            int v20 = 0;
            int v21 = 1;
            int v22 = v14 + v21;
            v13 = v20;
            v14 = v22;
          }
          v10 = v13;
          break;
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
            int v32 = 1;
            int v33 = v26 + v32;
            v25 = v0;
            v26 = v33;
          }
          v10 = v25;
          break;
        }
        default:
          {
          int v34 = 0;
          bool v35 = v2 != v34;
          int v36;
          if (v35) {
            int v37 = 2;
            int v38 = v0 + v37;
            v36 = v38;
          } else {
            int v39 = 4;
            v36 = v39;
          }
          v10 = v36;
          break;
        }
        case 2:
          {
          int v40 = 0;
          bool v41 = v2 != v40;
          int v42;
          if (v41) {
            int v43 = 0;
            int v44 = v0 + v43;
            v42 = v44;
          } else {
            int v45 = 3;
            int v46 = v0 + v45;
            v42 = v46;
          }
          v10 = v42;
          break;
        }
      }
      v6 = v10;
      break;
    }
    case 0:
      {
      int v47 = 3;
      int v48 = v3 % v47;
      int v49 = 2;
      int v50 = v0 + v49;
      int v51;
      v51 = v50;
      switch (v48) {
        case 0:
          {
          int v52 = 3;
          int v53;
          v53 = v52;
          switch (v3) {
            case 0:
              {
              int v54 = 3;
              v53 = v54;
              break;
            }
            default:
              {
              int v55 = 4;
              v53 = v55;
              break;
            }
          }
          v51 = v53;
          break;
        }
        default:
          {
          v51 = v0;
          break;
        }
        case 1:
          {
          int v56 = 2;
          v51 = v56;
          break;
        }
        case 2:
          {
          v51 = v0;
          break;
        }
      }
      v6 = v51;
      break;
    }
    case 1:
      {
      int v57 = 4;
      int v58 = v3 % v57;
      int v59 = 2;
      int v60;
      v60 = v59;
      switch (v58) {
        case 0:
          {
          int v61 = 0;
          bool v62 = v2 != v61;
          int v63;
          if (v62) {
            v63 = v0;
          } else {
            int v64 = 4;
            v63 = v64;
          }
          v60 = v63;
          break;
        }
        case 1:
          {
          int v65 = 0;
          int v66 = v0 + v65;
          v60 = v66;
        }
        case 2:
          {
          int v67 = 2;
          v60 = v67;
        }
        default:
          {
          int v68 = 0;
          int v69 = 0;
          int v70;
          int v71;
          v70 = v68;
          v71 = v69;
          while (true) {
            int v72 = 4;
            int v73 = v3 % v72;
            int v74 = 1;
            int v75 = v73 + v74;
            bool v76 = v71 < v75;
            v70 = v70;
            v71 = v71;
            if (!v76) break;
            int v77 = 2;
            int v78 = 1;
            int v79 = v71 + v78;
            v70 = v77;
            v71 = v79;
            continue;
            ;
          }
          v60 = v70;
          break;
        }
      }
      v6 = v60;
      break;
    }
    case 2:
      {
      int v80 = 0;
      bool v81 = v2 != v80;
      int v82;
      if (v81) {
        int v83 = 2;
        int v84 = v3 % v83;
        int v85;
        v85 = v0;
        switch (v84) {
          case 0:
            {
            int v86 = 4;
            int v87 = v0 + v86;
            v85 = v87;
            break;
          }
          case 1:
            {
            v85 = v0;
            break;
          }
          default:
            {
            v85 = v0;
            break;
          }
        }
        v82 = v85;
      } else {
        int v88 = 3;
        int v89 = v0 + v88;
        v82 = v89;
      }
      v6 = v82;
      break;
    }
  }
  bool v90 = true;
  int v91 = simt_wave_count_bits(v90);
  int v92 = 0;
  int v93 = v92 + v0;
  v1[v93] = v91;
  return;
}

kernel void kernel_main(device int* v94 [[buffer(0)]], device int* v95 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v96 = static_cast<int>(__simt_tid3.x);
  int v97 = 0;
  int v98 = v97 + v96;
  int v99 = v95[v98];
  int v100 = 4;
  int v101 = v100 + v96;
  int v102 = v95[v101];
  helper0(v96, v94, v99, v102, static_cast<int>(__simt_tid3.x));
  uint v103 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v104 = (int)(v103);
  uint v105 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v106 = (int)(v105);
  int v107 = 0;
  int v108 = 0;
  int v109;
  int v110;
  v109 = v107;
  v110 = v108;
  while (true) {
    int v111 = 4;
    int v112 = v110 * v111;
    int v113 = v112 + v96;
    int v114 = 8;
    int v115 = v114 + v113;
    int v116 = v95[v115];
    int v117 = 0;
    bool v118 = v116 != v117;
    v109 = v109;
    v110 = v110;
    if (!v118) break;
    int v119 = v109 + v110;
    int v120 = 1;
    int v121 = v110 + v120;
    bool v122 = true;
    int v123 = 16;
    int v124 = 4;
    int v125 = v110 * v124;
    int v126 = v123 + v125;
    int v127 = v126 + v96;
    bool v128 = true;
    int v129 = simt_wave_count_bits(v128);
    v94[v127] = v129;
    v109 = v119;
    v110 = v121;
    break;
    ;
  }
  int v130 = 28;
  int v131 = v130 + v96;
  int v132 = v95[v131];
  int v133 = 0;
  bool v134 = v132 != v133;
  int v135;
  if (v134) {
    int v136 = 0;
    int v137 = 0;
    int v138;
    int v139;
    v138 = v136;
    v139 = v137;
    while (true) {
      int v140 = 4;
      int v141 = v139 * v140;
      int v142 = v141 + v96;
      int v143 = 32;
      int v144 = v143 + v142;
      int v145 = v95[v144];
      int v146 = 0;
      bool v147 = v145 != v146;
      v138 = v138;
      v139 = v139;
      if (!v147) break;
      int v148 = v138 + v139;
      int v149 = 1;
      int v150 = v139 + v149;
      bool v151 = true;
      int v152 = 32;
      int v153 = 4;
      int v154 = v139 * v153;
      int v155 = v152 + v154;
      int v156 = v155 + v96;
      bool v157 = true;
      int v158 = simt_wave_count_bits(v157);
      v94[v156] = v158;
      v138 = v148;
      v139 = v150;
      break;
      ;
    }
    v135 = v138;
  } else {
    uint v159 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v160 = (int)(v159);
    v135 = v160;
  }
  int v161 = 48;
  int v162 = v161 + v96;
  bool v163 = true;
  int v164 = simt_wave_count_bits(v163);
  v94[v162] = v164;
  int v165 = 52;
  int v166 = v165 + v96;
  int v167 = v95[v166];
  uint v168 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v169 = (int)(v168);
  int v170;
  v170 = v169;
  switch (v167) {
    case 0:
      {
      v170 = v96;
      break;
    }
    default:
      {
      int v171 = 56;
      int v172 = v171 + v96;
      int v173 = v95[v172];
      int v174 = 1;
      int v175;
      v175 = v174;
      switch (v173) {
        case 0:
          {
          int v176 = 60;
          int v177 = v176 + v96;
          int v178 = v95[v177];
          int v179 = 0;
          bool v180 = v178 != v179;
          int v181;
          if (v180) {
            int v182 = 0;
            int v183 = v96 + v182;
            v181 = v183;
          } else {
            v181 = v96;
          }
          v175 = v181;
          break;
        }
        default:
          {
          int v184 = 0;
          int v185 = 0;
          int v186;
          int v187;
          v186 = v184;
          v187 = v185;
          while (true) {
            int v188 = 4;
            int v189 = v187 * v188;
            int v190 = v189 + v96;
            int v191 = 64;
            int v192 = v191 + v190;
            int v193 = v95[v192];
            int v194 = 0;
            bool v195 = v193 != v194;
            v186 = v186;
            v187 = v187;
            if (!v195) break;
            int v196 = v186 + v187;
            int v197 = 1;
            int v198 = v187 + v197;
            bool v199 = true;
            v186 = v196;
            v187 = v198;
          }
          v175 = v186;
          break;
        }
        case 1:
          {
          int v200 = 84;
          int v201 = v200 + v96;
          int v202 = v95[v201];
          int v203 = 0;
          bool v204 = v202 != v203;
          int v205;
          if (v204) {
            int v206 = 3;
            int v207 = v96 + v206;
            v205 = v207;
          } else {
            int v208 = 3;
            int v209 = v96 + v208;
            v205 = v209;
          }
          v175 = v205;
          break;
        }
      }
      v170 = v175;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
