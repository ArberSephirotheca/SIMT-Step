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
      bool v8 = v2 != v7;
      int v9;
      if (v8) {
        int v10 = 4;
        int v11;
        v11 = v10;
        switch (v3) {
          case 0:
            {
            int v12 = 4;
            v11 = v12;
          }
          default:
            {
            int v13 = 4;
            int v14 = v0 + v13;
            v11 = v14;
            break;
          }
        }
        v9 = v11;
      } else {
        int v15 = 4;
        int v16 = v0 + v15;
        v9 = v16;
      }
      v6 = v9;
      break;
    }
    case 1:
      {
      int v17 = 0;
      bool v18 = v2 != v17;
      int v19;
      if (v18) {
        int v20 = 0;
        int v21 = 0;
        int v22;
        int v23;
        v22 = v20;
        v23 = v21;
        while (true) {
          int v24 = 4;
          int v25 = v3 % v24;
          int v26 = 1;
          int v27 = v25 + v26;
          bool v28 = v23 < v27;
          v22 = v22;
          v23 = v23;
          if (!v28) break;
          int v29 = 1;
          int v30 = v23 + v29;
          v22 = v0;
          v23 = v30;
          continue;
          ;
        }
        v19 = v22;
      } else {
        int v31 = 3;
        int v32 = v3 % v31;
        int v33 = 3;
        int v34 = v0 + v33;
        int v35;
        v35 = v34;
        switch (v32) {
          default:
            {
            int v36 = 1;
            v35 = v36;
            break;
          }
          case 0:
            {
            v35 = v0;
            break;
          }
          case 1:
            {
            v35 = v0;
            break;
          }
          case 2:
            {
            int v37 = 0;
            int v38 = v0 + v37;
            v35 = v38;
            break;
          }
        }
        v19 = v35;
      }
      v6 = v19;
      break;
    }
    case 2:
      {
      int v39 = 0;
      int v40 = 0;
      int v41;
      int v42;
      v41 = v39;
      v42 = v40;
      while (true) {
        int v43 = 4;
        int v44 = v3 % v43;
        int v45 = 1;
        int v46 = v44 + v45;
        bool v47 = v42 < v46;
        v41 = v41;
        v42 = v42;
        if (!v47) break;
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
          int v57 = 3;
          int v58 = v0 + v57;
          int v59 = 1;
          int v60 = v51 + v59;
          v50 = v58;
          v51 = v60;
        }
        int v61 = 1;
        int v62 = v42 + v61;
        v41 = v50;
        v42 = v62;
      }
      v6 = v41;
      break;
    }
    default:
      {
      int v63 = 3;
      int v64 = v3 % v63;
      int v65 = 0;
      int v66 = v0 + v65;
      int v67;
      v67 = v66;
      switch (v64) {
        case 0:
          {
          int v68 = 4;
          v67 = v68;
          break;
        }
        case 1:
          {
          v67 = v0;
          break;
        }
        default:
          {
          int v69 = 2;
          int v70 = v3 % v69;
          int v71;
          v71 = v0;
          switch (v70) {
            case 0:
              {
              int v72 = 0;
              int v73 = v0 + v72;
              v71 = v73;
              break;
            }
            case 1:
              {
              int v74 = 4;
              v71 = v74;
              break;
            }
            default:
              {
              v71 = v0;
              break;
            }
          }
          int v75 = 4;
          int v76 = v0 + v75;
          v67 = v71;
          break;
        }
        case 2:
          {
          int v77 = 0;
          int v78 = 0;
          int v79;
          int v80;
          v79 = v77;
          v80 = v78;
          while (true) {
            int v81 = 4;
            int v82 = v3 % v81;
            int v83 = 1;
            int v84 = v82 + v83;
            bool v85 = v80 < v84;
            v79 = v79;
            v80 = v80;
            if (!v85) break;
            int v86 = 3;
            int v87 = v0 + v86;
            int v88 = 1;
            int v89 = v80 + v88;
            v79 = v87;
            v80 = v89;
            break;
            ;
          }
          v67 = v79;
          break;
        }
      }
      v6 = v67;
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
  int v105 = 0;
  int v106 = 0;
  int v107;
  int v108;
  v107 = v105;
  v108 = v106;
  while (true) {
    int v109 = 4;
    int v110 = v108 * v109;
    int v111 = v110 + v96;
    int v112 = 8;
    int v113 = v112 + v111;
    int v114 = v95[v113];
    int v115 = 0;
    bool v116 = v114 != v115;
    v107 = v107;
    v108 = v108;
    if (!v116) break;
    int v117 = v107 + v108;
    int v118 = 1;
    int v119 = v108 + v118;
    bool v120 = true;
    int v121 = 16;
    int v122 = 4;
    int v123 = v108 * v122;
    int v124 = v121 + v123;
    int v125 = v124 + v96;
    bool v126 = true;
    int v127 = simt_wave_count_bits(v126);
    v94[v125] = v127;
    v107 = v117;
    v108 = v119;
    continue;
    ;
  }
  int v128 = 28;
  int v129 = v128 + v96;
  int v130 = v95[v129];
  int v131 = 4;
  int v132;
  v132 = v131;
  switch (v130) {
    case 0:
      {
      int v133 = 0;
      int v134 = 0;
      int v135;
      int v136;
      v135 = v133;
      v136 = v134;
      while (true) {
        int v137 = 4;
        int v138 = v136 * v137;
        int v139 = v138 + v96;
        int v140 = 32;
        int v141 = v140 + v139;
        int v142 = v95[v141];
        int v143 = 0;
        bool v144 = v142 != v143;
        v135 = v135;
        v136 = v136;
        if (!v144) break;
        int v145 = 52;
        int v146 = v145 + v96;
        int v147 = v95[v146];
        int v148 = 0;
        bool v149 = v147 != v148;
        int v150;
        if (v149) {
          int v151 = 2;
          v150 = v151;
        } else {
          v150 = v96;
        }
        int v152 = v135 + v150;
        int v153 = 1;
        int v154 = v136 + v153;
        bool v155 = true;
        v135 = v152;
        v136 = v154;
      }
      v132 = v135;
    }
    default:
      {
      int v156 = 0;
      int v157 = 0;
      int v158;
      int v159;
      v158 = v156;
      v159 = v157;
      while (true) {
        int v160 = 4;
        int v161 = v159 * v160;
        int v162 = v161 + v96;
        int v163 = 56;
        int v164 = v163 + v162;
        int v165 = v95[v164];
        int v166 = 0;
        bool v167 = v165 != v166;
        v158 = v158;
        v159 = v159;
        if (!v167) break;
        int v168 = 76;
        int v169 = v168 + v96;
        int v170 = v95[v169];
        int v171 = 0;
        bool v172 = v170 != v171;
        int v173;
        if (v172) {
          v173 = v96;
        } else {
          v173 = v96;
        }
        int v174 = v158 + v173;
        int v175 = 1;
        int v176 = v159 + v175;
        bool v177 = true;
        v158 = v174;
        v159 = v176;
      }
      v132 = v158;
    }
    case 1:
      {
      int v178 = 0;
      int v179 = 0;
      int v180;
      int v181;
      v180 = v178;
      v181 = v179;
      while (true) {
        int v182 = 4;
        int v183 = v181 * v182;
        int v184 = v183 + v96;
        int v185 = 80;
        int v186 = v185 + v184;
        int v187 = v95[v186];
        int v188 = 0;
        bool v189 = v187 != v188;
        v180 = v180;
        v181 = v181;
        if (!v189) break;
        int v190 = v180 + v181;
        int v191 = 1;
        int v192 = v181 + v191;
        bool v193 = true;
        v180 = v190;
        v181 = v192;
        break;
        ;
      }
      v132 = v180;
      break;
    }
    case 2:
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
        int v200 = v199 + v96;
        int v201 = 100;
        int v202 = v201 + v200;
        int v203 = v95[v202];
        int v204 = 0;
        bool v205 = v203 != v204;
        v196 = v196;
        v197 = v197;
        if (!v205) break;
        int v206 = 3;
        int v207 = v96 + v206;
        int v208 = v196 + v207;
        int v209 = 1;
        int v210 = v197 + v209;
        bool v211 = true;
        v196 = v208;
        v197 = v210;
      }
      v132 = v196;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 32; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
