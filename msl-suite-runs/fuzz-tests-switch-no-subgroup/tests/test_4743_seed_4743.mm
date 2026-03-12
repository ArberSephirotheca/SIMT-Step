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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6;
  v6 = v5;
  switch (v3) {
    case 0:
      {
      int v7 = 3;
      int v8 = v3 % v7;
      int v9;
      v9 = v0;
      switch (v8) {
        case 0:
          {
          int v10 = 2;
          int v11 = v3 % v10;
          int v12 = 1;
          int v13 = v0 + v12;
          int v14;
          v14 = v13;
          switch (v11) {
            case 0:
              {
              int v15 = 4;
              int v16 = v0 + v15;
              v14 = v16;
              break;
            }
            case 1:
              {
              int v17 = 3;
              int v18 = v0 + v17;
              v14 = v18;
              break;
            }
            default:
              {
              int v19 = 2;
              int v20 = v0 + v19;
              v14 = v20;
              break;
            }
          }
          v9 = v14;
          break;
        }
        case 1:
          {
          int v21 = 0;
          bool v22 = v2 != v21;
          int v23;
          if (v22) {
            int v24 = 1;
            v23 = v24;
          } else {
            int v25 = 1;
            v23 = v25;
          }
          v9 = v23;
          break;
        }
        default:
          {
          int v26 = 0;
          int v27 = 0;
          int v28;
          int v29;
          v28 = v26;
          v29 = v27;
          while (true) {
            int v30 = 4;
            int v31 = v3 % v30;
            int v32 = 1;
            int v33 = v31 + v32;
            bool v34 = v29 < v33;
            v28 = v28;
            v29 = v29;
            if (!v34) break;
            int v35 = 4;
            int v36 = v0 + v35;
            int v37 = 1;
            int v38 = v29 + v37;
            v28 = v36;
            v29 = v38;
          }
          v9 = v28;
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
            int v48 = 3;
            int v49 = 1;
            int v50 = v42 + v49;
            v41 = v48;
            v42 = v50;
            continue;
            ;
          }
          v9 = v41;
          break;
        }
      }
      v6 = v9;
      break;
    }
    default:
      {
      int v51 = 3;
      int v52 = v3 % v51;
      int v53 = 4;
      int v54 = v0 + v53;
      int v55;
      v55 = v54;
      switch (v52) {
        case 0:
          {
          int v56 = 0;
          bool v57 = v2 != v56;
          int v58;
          if (v57) {
            v58 = v0;
          } else {
            int v59 = 3;
            int v60 = v0 + v59;
            v58 = v60;
          }
          v55 = v58;
          break;
        }
        case 1:
          {
          int v61 = 2;
          int v62 = v3 % v61;
          int v63;
          v63 = v0;
          switch (v62) {
            default:
              {
              int v64 = 2;
              int v65 = v0 + v64;
              v63 = v65;
              break;
            }
            case 0:
              {
              v63 = v0;
              break;
            }
          }
          int v66 = 1;
          v55 = v63;
          break;
        }
        case 2:
          {
          int v67 = 4;
          int v68 = v3 % v67;
          int v69 = 1;
          int v70;
          v70 = v69;
          switch (v68) {
            default:
              {
              v70 = v0;
              break;
            }
            case 0:
              {
              v70 = v0;
            }
            case 1:
              {
              int v71 = 1;
              v70 = v71;
              break;
            }
            case 2:
              {
              int v72 = 3;
              int v73 = v0 + v72;
              v70 = v73;
              break;
            }
          }
          int v74 = 4;
          int v75 = v0 + v74;
          v55 = v70;
          break;
        }
        default:
          {
          int v76 = 0;
          bool v77 = v2 != v76;
          int v78;
          if (v77) {
            int v79 = 1;
            v78 = v79;
          } else {
            int v80 = 3;
            int v81 = v0 + v80;
            v78 = v81;
          }
          v55 = v78;
          break;
        }
      }
      v6 = v55;
      break;
    }
  }
  bool v82 = true;
  int v83 = simt_wave_count_bits(v82);
  int v84 = 0;
  int v85 = v84 + v0;
  v1[v85] = v83;
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
  int v95 = 0;
  bool v96 = v91 != v95;
  if (v96) {
  } else {
    int v97 = 8;
    int v98 = v97 + v88;
    int v99 = v87[v98];
    int v100 = 0;
    bool v101 = v99 != v100;
    if (v101) {
    } else {
      int v102 = 3;
      int v103 = v88 % v102;
      uint v104 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v105 = (int)(v104);
      int v106;
      v106 = v105;
      switch (v103) {
        default:
          {
          int v107 = 4;
          int v108 = v106 + v107;
          v106 = v108;
          break;
        }
        case 0:
          {
          int v109 = 4;
          int v110 = v106 + v109;
          v106 = v110;
          break;
        }
        case 1:
          {
          int v111 = 1;
          int v112 = v106 + v111;
          v106 = v112;
          break;
        }
      }
      helper0(v88, v86, v91, v94, static_cast<int>(__simt_tid3.x));
    }
  }
  int v113 = 12;
  int v114 = v113 + v88;
  int v115 = v87[v114];
  int v116 = 1;
  int v117 = v88 + v116;
  int v118;
  v118 = v117;
  switch (v115) {
    case 0:
      {
      int v119 = 16;
      int v120 = v119 + v88;
      int v121 = v87[v120];
      int v122;
      v122 = v88;
      switch (v121) {
        case 0:
          {
          int v123 = 20;
          int v124 = v123 + v88;
          int v125 = v87[v124];
          int v126 = 0;
          bool v127 = v125 != v126;
          int v128;
          if (v127) {
            v128 = v88;
          } else {
            int v129 = 2;
            int v130 = v88 + v129;
            v128 = v130;
          }
          v122 = v128;
          break;
        }
        default:
          {
          int v131 = 24;
          int v132 = v131 + v88;
          int v133 = v87[v132];
          int v134;
          v134 = v88;
          switch (v133) {
            case 0:
              {
              int v135 = 1;
              int v136 = v88 + v135;
              v134 = v136;
              break;
            }
            case 1:
              {
              v134 = v88;
              break;
            }
            default:
              {
              int v137 = 1;
              int v138 = v88 + v137;
              v134 = v138;
              break;
            }
          }
          v122 = v134;
          break;
        }
        case 1:
          {
          int v139 = 0;
          int v140 = 0;
          int v141;
          int v142;
          v141 = v139;
          v142 = v140;
          while (true) {
            int v143 = 4;
            int v144 = v142 * v143;
            int v145 = v144 + v88;
            int v146 = 28;
            int v147 = v146 + v145;
            int v148 = v87[v147];
            int v149 = 0;
            bool v150 = v148 != v149;
            v141 = v141;
            v142 = v142;
            if (!v150) break;
            int v151 = v141 + v142;
            int v152 = 1;
            int v153 = v142 + v152;
            bool v154 = true;
            v141 = v151;
            v142 = v153;
          }
          v122 = v141;
          break;
        }
      }
      bool v155 = true;
      v118 = v122;
    }
    case 1:
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
        int v162 = v161 + v88;
        int v163 = 48;
        int v164 = v163 + v162;
        int v165 = v87[v164];
        int v166 = 0;
        bool v167 = v165 != v166;
        v158 = v158;
        v159 = v159;
        if (!v167) break;
        int v168 = v158 + v159;
        int v169 = 1;
        int v170 = v159 + v169;
        bool v171 = true;
        v158 = v168;
        v159 = v170;
      }
      v118 = v158;
    }
    case 2:
      {
      int v172 = 0;
      int v173 = 0;
      int v174;
      int v175;
      v174 = v172;
      v175 = v173;
      while (true) {
        int v176 = 4;
        int v177 = v175 * v176;
        int v178 = v177 + v88;
        int v179 = 68;
        int v180 = v179 + v178;
        int v181 = v87[v180];
        int v182 = 0;
        bool v183 = v181 != v182;
        v174 = v174;
        v175 = v175;
        if (!v183) break;
        int v184 = v174 + v175;
        int v185 = 1;
        int v186 = v175 + v185;
        bool v187 = true;
        v174 = v184;
        v175 = v186;
      }
      v118 = v174;
    }
    default:
      {
      int v188 = 0;
      int v189 = 0;
      int v190;
      int v191;
      v190 = v188;
      v191 = v189;
      while (true) {
        int v192 = 4;
        int v193 = v191 * v192;
        int v194 = v193 + v88;
        int v195 = 88;
        int v196 = v195 + v194;
        int v197 = v87[v196];
        int v198 = 0;
        bool v199 = v197 != v198;
        v190 = v190;
        v191 = v191;
        if (!v199) break;
        int v200 = 108;
        int v201 = v200 + v88;
        int v202 = v87[v201];
        int v203 = 3;
        int v204 = v88 + v203;
        int v205;
        v205 = v204;
        switch (v202) {
          default:
            {
            v205 = v88;
            break;
          }
          case 0:
            {
            int v206 = 3;
            int v207 = v88 + v206;
            v205 = v207;
            break;
          }
          case 1:
            {
            v205 = v88;
            break;
          }
          case 2:
            {
            int v208 = 1;
            v205 = v208;
            break;
          }
        }
        bool v209 = true;
        int v210 = v190 + v205;
        int v211 = 1;
        int v212 = v191 + v211;
        bool v213 = true;
        v190 = v210;
        v191 = v212;
      }
      v118 = v190;
      break;
    }
  }
  bool v214 = true;
  int v215 = 16;
  int v216 = v215 + v88;
  bool v217 = true;
  int v218 = simt_wave_count_bits(v217);
  v86[v216] = v218;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
