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
  int v4 = 3;
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11;
      v11 = v0;
      switch (v10) {
        case 0:
          {
          int v12 = 3;
          int v13 = v0 + v12;
          v11 = v13;
          break;
        }
        case 1:
          {
          int v14 = 0;
          int v15 = 0;
          int v16;
          int v17;
          v16 = v14;
          v17 = v15;
          while (true) {
            int v18 = 4;
            int v19 = v3 % v18;
            int v20 = 1;
            int v21 = v19 + v20;
            bool v22 = v17 < v21;
            v16 = v16;
            v17 = v17;
            if (!v22) break;
            int v23 = 4;
            int v24 = v0 + v23;
            int v25 = 1;
            int v26 = v17 + v25;
            v16 = v24;
            v17 = v26;
          }
          int v27 = 2;
          v11 = v16;
        }
        case 2:
          {
          int v28 = 0;
          int v29 = 0;
          int v30;
          int v31;
          v30 = v28;
          v31 = v29;
          while (true) {
            int v32 = 4;
            int v33 = v3 % v32;
            int v34 = 1;
            int v35 = v33 + v34;
            bool v36 = v31 < v35;
            v30 = v30;
            v31 = v31;
            if (!v36) break;
            int v37 = 1;
            int v38 = v31 + v37;
            v30 = v0;
            v31 = v38;
          }
          int v39 = 4;
          v11 = v30;
          break;
        }
        default:
          {
          int v40 = 1;
          v11 = v40;
          break;
        }
      }
      int v41 = 2;
      v8 = v11;
      break;
    }
    case 0:
      {
      int v42 = 0;
      bool v43 = v2 != v42;
      int v44;
      if (v43) {
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
          int v54 = 3;
          int v55 = 1;
          int v56 = v48 + v55;
          v47 = v54;
          v48 = v56;
        }
        v44 = v47;
      } else {
        int v57 = 2;
        v44 = v57;
      }
      v8 = v44;
      break;
    }
    case 1:
      {
      int v58 = 0;
      bool v59 = v2 != v58;
      int v60;
      if (v59) {
        int v61 = 0;
        int v62 = 0;
        int v63;
        int v64;
        v63 = v61;
        v64 = v62;
        while (true) {
          int v65 = 4;
          int v66 = v3 % v65;
          int v67 = 1;
          int v68 = v66 + v67;
          bool v69 = v64 < v68;
          v63 = v63;
          v64 = v64;
          if (!v69) break;
          int v70 = 1;
          int v71 = v64 + v70;
          v63 = v0;
          v64 = v71;
        }
        int v72 = 1;
        v60 = v63;
      } else {
        int v73 = 0;
        bool v74 = v2 != v73;
        int v75;
        if (v74) {
          v75 = v0;
        } else {
          int v76 = 0;
          int v77 = v0 + v76;
          v75 = v77;
        }
        int v78 = 2;
        int v79 = v0 + v78;
        v60 = v75;
      }
      v8 = v60;
      break;
    }
    case 2:
      {
      int v80 = 2;
      int v81 = v3 % v80;
      int v82 = 4;
      int v83 = v0 + v82;
      int v84;
      v84 = v83;
      switch (v81) {
        case 0:
          {
          int v85 = 1;
          int v86 = v0 + v85;
          v84 = v86;
          break;
        }
        case 1:
          {
          int v87 = 3;
          v84 = v87;
          break;
        }
        default:
          {
          int v88 = 3;
          int v89 = v3 % v88;
          int v90;
          v90 = v0;
          switch (v89) {
            case 0:
              {
              v90 = v0;
              break;
            }
            case 1:
              {
              int v91 = 1;
              int v92 = v0 + v91;
              v90 = v92;
              break;
            }
            default:
              {
              v90 = v0;
              break;
            }
          }
          int v93 = 2;
          v84 = v90;
          break;
        }
      }
      int v94 = 1;
      int v95 = v0 + v94;
      v8 = v84;
      break;
    }
  }
  bool v96 = true;
  int v97 = simt_wave_count_bits(v96);
  int v98 = 0;
  int v99 = v98 + v0;
  v1[v99] = v97;
  return;
}

kernel void kernel_main(device int* v100 [[buffer(0)]], device int* v101 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v102 = static_cast<int>(__simt_tid3.x);
  int v103 = 0;
  int v104 = v103 + v102;
  int v105 = v101[v104];
  int v106 = 4;
  int v107 = v106 + v102;
  int v108 = v101[v107];
  helper0(v102, v100, v105, v108, static_cast<int>(__simt_tid3.x));
  int v109 = 8;
  int v110 = v109 + v102;
  int v111 = v101[v110];
  int v112 = 0;
  bool v113 = v111 != v112;
  int v114;
  if (v113) {
    int v115 = 12;
    int v116 = v115 + v102;
    int v117 = v101[v116];
    int v118 = 0;
    bool v119 = v117 != v118;
    int v120;
    if (v119) {
      int v121 = 16;
      int v122 = v121 + v102;
      int v123 = v101[v122];
      int v124 = 0;
      bool v125 = v123 != v124;
      int v126;
      if (v125) {
        int v127 = 1;
        int v128 = v102 + v127;
        v126 = v128;
      } else {
        uint v129 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v130 = (int)(v129);
        v126 = v130;
      }
      v120 = v126;
    } else {
      int v131 = 20;
      int v132 = v131 + v102;
      int v133 = v101[v132];
      uint v134 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v135 = (int)(v134);
      int v136;
      v136 = v135;
      switch (v133) {
        case 0:
          {
          int v137 = 4;
          int v138 = v102 + v137;
          v136 = v138;
          break;
        }
        default:
          {
          int v139 = 1;
          v136 = v139;
          break;
        }
      }
      bool v140 = true;
      v120 = v136;
    }
    v114 = v120;
  } else {
    int v141 = 24;
    int v142 = v141 + v102;
    int v143 = v101[v142];
    int v144 = 0;
    bool v145 = v143 != v144;
    int v146;
    if (v145) {
      int v147 = 0;
      int v148 = 0;
      int v149;
      int v150;
      v149 = v147;
      v150 = v148;
      while (true) {
        int v151 = 4;
        int v152 = v150 * v151;
        int v153 = v152 + v102;
        int v154 = 28;
        int v155 = v154 + v153;
        int v156 = v101[v155];
        int v157 = 0;
        bool v158 = v156 != v157;
        v149 = v149;
        v150 = v150;
        if (!v158) break;
        int v159 = v149 + v150;
        int v160 = 1;
        int v161 = v150 + v160;
        v149 = v159;
        v150 = v161;
      }
      bool v162 = true;
      v146 = v149;
    } else {
      int v163 = 48;
      int v164 = v163 + v102;
      int v165 = v101[v164];
      int v166 = 0;
      bool v167 = v165 != v166;
      int v168;
      if (v167) {
        v168 = v102;
      } else {
        uint v169 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v170 = (int)(v169);
        v168 = v170;
      }
      v146 = v168;
    }
    v114 = v146;
  }
  int v171 = 16;
  int v172 = v171 + v102;
  bool v173 = true;
  int v174 = simt_wave_count_bits(v173);
  v100[v172] = v174;
  int v175 = 52;
  int v176 = v175 + v102;
  int v177 = v101[v176];
  uint v178 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v179 = (int)(v178);
  int v180;
  v180 = v179;
  switch (v177) {
    case 0:
      {
      int v181 = 0;
      int v182 = 0;
      int v183;
      int v184;
      v183 = v181;
      v184 = v182;
      while (true) {
        int v185 = 4;
        int v186 = v184 * v185;
        int v187 = v186 + v102;
        int v188 = 56;
        int v189 = v188 + v187;
        int v190 = v101[v189];
        int v191 = 0;
        bool v192 = v190 != v191;
        v183 = v183;
        v184 = v184;
        if (!v192) break;
        int v193 = 3;
        int v194 = v102 + v193;
        int v195 = v183 + v194;
        int v196 = 1;
        int v197 = v184 + v196;
        v183 = v195;
        v184 = v197;
      }
      bool v198 = true;
      v180 = v183;
      break;
    }
    default:
      {
      int v199 = 76;
      int v200 = v199 + v102;
      int v201 = v101[v200];
      int v202 = 2;
      int v203;
      v203 = v202;
      switch (v201) {
        default:
          {
          int v204 = 1;
          int v205 = v102 + v204;
          v203 = v205;
          break;
        }
        case 0:
          {
          int v206 = 80;
          int v207 = v206 + v102;
          int v208 = v101[v207];
          int v209 = 0;
          bool v210 = v208 != v209;
          int v211;
          if (v210) {
            v211 = v102;
          } else {
            int v212 = 4;
            int v213 = v102 + v212;
            v211 = v213;
          }
          v203 = v211;
          break;
        }
        case 1:
          {
          int v214 = 84;
          int v215 = v214 + v102;
          int v216 = v101[v215];
          int v217 = 0;
          bool v218 = v216 != v217;
          int v219;
          if (v218) {
            int v220 = 2;
            int v221 = v102 + v220;
            v219 = v221;
          } else {
            v219 = v102;
          }
          v203 = v219;
          break;
        }
        case 2:
          {
          int v222 = 88;
          int v223 = v222 + v102;
          int v224 = v101[v223];
          int v225 = 0;
          bool v226 = v224 != v225;
          int v227;
          if (v226) {
            int v228 = 3;
            int v229 = v102 + v228;
            v227 = v229;
          } else {
            int v230 = 3;
            int v231 = v102 + v230;
            v227 = v231;
          }
          v203 = v227;
          break;
        }
      }
      bool v232 = true;
      v180 = v203;
      break;
    }
  }
  bool v233 = true;
  int v234 = 32;
  int v235 = v234 + v102;
  bool v236 = true;
  int v237 = simt_wave_count_bits(v236);
  v100[v235] = v237;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 92; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
