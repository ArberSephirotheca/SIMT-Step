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
      int v22 = 0;
      bool v23 = v2 != v22;
      int v24;
      if (v23) {
        bool v25 = true;
        int v26 = simt_wave_count_bits(v25);
        int v27 = 0;
        int v28 = 4;
        int v29 = v16 * v28;
        int v30 = v27 + v29;
        int v31 = v30 + v0;
        v1[v31] = v26;
        v24 = v26;
      } else {
        bool v32 = true;
        int v33 = simt_wave_count_bits(v32);
        int v34 = 16;
        int v35 = 4;
        int v36 = v16 * v35;
        int v37 = v34 + v36;
        int v38 = v37 + v0;
        v1[v38] = v33;
        v24 = v33;
      }
      int v39 = 1;
      int v40 = v16 + v39;
      v15 = v24;
      v16 = v40;
    }
    int v41 = 1;
    int v42 = v7 + v41;
    v6 = v15;
    v7 = v42;
  }
  return;
}

kernel void kernel_main(device int* v43 [[buffer(0)]], device int* v44 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v45 = static_cast<int>(__simt_tid3.x);
  int v46 = 0;
  int v47 = v46 + v45;
  int v48 = v44[v47];
  int v49 = 4;
  int v50 = v49 + v45;
  int v51 = v44[v50];
  helper0(v45, v43, v48, v51, static_cast<int>(__simt_tid3.x));
  int v52 = 8;
  int v53 = v52 + v45;
  int v54 = v44[v53];
  int v55 = 0;
  bool v56 = v54 != v55;
  int v57;
  if (v56) {
    int v58 = 4;
    v57 = v58;
  } else {
    int v59 = 0;
    int v60 = 0;
    int v61;
    int v62;
    v61 = v59;
    v62 = v60;
    while (true) {
      int v63 = 4;
      int v64 = v62 * v63;
      int v65 = v64 + v45;
      int v66 = 12;
      int v67 = v66 + v65;
      int v68 = v44[v67];
      int v69 = 0;
      bool v70 = v68 != v69;
      v61 = v61;
      v62 = v62;
      if (!v70) break;
      int v71 = v61 + v62;
      int v72 = 1;
      int v73 = v62 + v72;
      bool v74 = true;
      int v75 = 32;
      int v76 = 4;
      int v77 = v62 * v76;
      int v78 = v75 + v77;
      int v79 = v78 + v45;
      bool v80 = true;
      int v81 = simt_wave_count_bits(v80);
      v43[v79] = v81;
      v61 = v71;
      v62 = v73;
      continue;
      ;
    }
    v57 = v61;
  }
  int v82 = 48;
  int v83 = v82 + v45;
  bool v84 = true;
  int v85 = simt_wave_count_bits(v84);
  v43[v83] = v85;
  int v86 = 32;
  int v87 = v86 + v45;
  int v88 = v44[v87];
  uint v89 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v90 = (int)(v89);
  int v91;
  v91 = v90;
  switch (v88) {
    default:
      {
      int v92 = 36;
      int v93 = v92 + v45;
      int v94 = v44[v93];
      int v95 = 4;
      int v96 = v45 + v95;
      int v97;
      v97 = v96;
      switch (v94) {
        default:
          {
          int v98 = 40;
          int v99 = v98 + v45;
          int v100 = v44[v99];
          int v101 = 0;
          bool v102 = v100 != v101;
          int v103;
          if (v102) {
            int v104 = 2;
            v103 = v104;
          } else {
            int v105 = 1;
            v103 = v105;
          }
          v97 = v103;
          break;
        }
        case 0:
          {
          int v106 = 0;
          v97 = v106;
        }
        case 1:
          {
          int v107 = 1;
          v97 = v107;
          break;
        }
      }
      v91 = v97;
    }
    case 0:
      {
      int v108 = 44;
      int v109 = v108 + v45;
      int v110 = v44[v109];
      int v111 = 3;
      int v112 = v45 + v111;
      int v113;
      v113 = v112;
      switch (v110) {
        case 0:
          {
          int v114 = 48;
          int v115 = v114 + v45;
          int v116 = v44[v115];
          int v117 = 4;
          int v118 = v45 + v117;
          int v119;
          v119 = v118;
          switch (v116) {
            case 0:
              {
              v119 = v45;
              break;
            }
            default:
              {
              int v120 = 3;
              v119 = v120;
              break;
            }
          }
          bool v121 = true;
          v113 = v119;
          break;
        }
        case 1:
          {
          int v122 = 3;
          int v123 = v45 + v122;
          v113 = v123;
          break;
        }
        case 2:
          {
          int v124 = 52;
          int v125 = v124 + v45;
          int v126 = v44[v125];
          int v127 = 0;
          int v128 = v45 + v127;
          int v129;
          v129 = v128;
          switch (v126) {
            case 0:
              {
              int v130 = 1;
              int v131 = v45 + v130;
              v129 = v131;
              break;
            }
            case 1:
              {
              int v132 = 1;
              int v133 = v45 + v132;
              v129 = v133;
              break;
            }
            default:
              {
              int v134 = 1;
              int v135 = v45 + v134;
              v129 = v135;
              break;
            }
            case 2:
              {
              v129 = v45;
              break;
            }
          }
          bool v136 = true;
          v113 = v129;
          break;
        }
        default:
          {
          int v137 = 1;
          int v138 = v45 + v137;
          v113 = v138;
          break;
        }
      }
      v91 = v113;
      break;
    }
    case 1:
      {
      int v139 = 56;
      int v140 = v139 + v45;
      int v141 = v44[v140];
      int v142 = 0;
      bool v143 = v141 != v142;
      int v144;
      if (v143) {
        int v145 = 60;
        int v146 = v145 + v45;
        int v147 = v44[v146];
        int v148 = 0;
        bool v149 = v147 != v148;
        int v150;
        if (v149) {
          int v151 = 3;
          v150 = v151;
        } else {
          int v152 = 2;
          int v153 = v45 + v152;
          v150 = v153;
        }
        v144 = v150;
      } else {
        int v154 = 64;
        int v155 = v154 + v45;
        int v156 = v44[v155];
        int v157 = 0;
        bool v158 = v156 != v157;
        int v159;
        if (v158) {
          int v160 = 1;
          int v161 = v45 + v160;
          v159 = v161;
        } else {
          v159 = v45;
        }
        v144 = v159;
      }
      v91 = v144;
    }
    case 2:
      {
      int v162 = 68;
      int v163 = v162 + v45;
      int v164 = v44[v163];
      int v165;
      v165 = v45;
      switch (v164) {
        default:
          {
          int v166 = 72;
          int v167 = v166 + v45;
          int v168 = v44[v167];
          int v169 = 2;
          int v170 = v45 + v169;
          int v171;
          v171 = v170;
          switch (v168) {
            case 0:
              {
              int v172 = 2;
              v171 = v172;
            }
            default:
              {
              int v173 = 0;
              v171 = v173;
            }
            case 1:
              {
              v171 = v45;
              break;
            }
          }
          v165 = v171;
          break;
        }
        case 0:
          {
          int v174 = 76;
          int v175 = v174 + v45;
          int v176 = v44[v175];
          int v177 = 0;
          bool v178 = v176 != v177;
          int v179;
          if (v178) {
            v179 = v45;
          } else {
            int v180 = 2;
            int v181 = v45 + v180;
            v179 = v181;
          }
          v165 = v179;
          break;
        }
        case 1:
          {
          int v182 = 80;
          int v183 = v182 + v45;
          int v184 = v44[v183];
          int v185 = 0;
          bool v186 = v184 != v185;
          int v187;
          if (v186) {
            int v188 = 2;
            int v189 = v45 + v188;
            v187 = v189;
          } else {
            v187 = v45;
          }
          v165 = v187;
          break;
        }
        case 2:
          {
          int v190 = 84;
          int v191 = v190 + v45;
          int v192 = v44[v191];
          int v193 = 0;
          bool v194 = v192 != v193;
          int v195;
          if (v194) {
            v195 = v45;
          } else {
            int v196 = 1;
            v195 = v196;
          }
          v165 = v195;
          break;
        }
      }
      v91 = v165;
      break;
    }
  }
  bool v197 = true;
  int v198 = 64;
  int v199 = v198 + v45;
  bool v200 = true;
  int v201 = simt_wave_count_bits(v200);
  v43[v199] = v201;
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
    static int32_t expected0[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
