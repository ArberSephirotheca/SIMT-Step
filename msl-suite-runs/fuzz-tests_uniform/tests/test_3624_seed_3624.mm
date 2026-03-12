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
    bool v14 = v2 != v13;
    int v15;
    if (v14) {
      int v16 = 4;
      int v17 = v3 % v16;
      int v18 = 0;
      int v19 = v0 + v18;
      int v20;
      v20 = v19;
      switch (v17) {
        case 0:
          {
          v20 = v0;
          break;
        }
        case 1:
          {
          int v21 = 0;
          v20 = v21;
          break;
        }
        case 2:
          {
          int v22 = 4;
          int v23 = v0 + v22;
          v20 = v23;
          break;
        }
        default:
          {
          v20 = v0;
          break;
        }
      }
      uint v24 = simt_lane_id(__simt_tid);
      int v25 = (int)(v24);
      v15 = v20;
    } else {
      int v26 = 4;
      int v27 = v3 % v26;
      int v28 = 3;
      int v29 = v0 + v28;
      int v30;
      v30 = v29;
      switch (v27) {
        case 0:
          {
          int v31 = 4;
          int v32 = v0 + v31;
          v30 = v32;
        }
        case 1:
          {
          v30 = v0;
          break;
        }
        case 2:
          {
          int v33 = 3;
          v30 = v33;
        }
        default:
          {
          v30 = v0;
          break;
        }
      }
      int v34 = 0;
      int v35 = v0 + v34;
      v15 = v30;
    }
    int v36 = 1;
    int v37 = v7 + v36;
    v6 = v15;
    v7 = v37;
  }
  bool v38 = true;
  int v39 = simt_wave_count_bits(v38);
  int v40 = 0;
  int v41 = v40 + v0;
  v1[v41] = v39;
  return;
}

kernel void kernel_main(device int* v42 [[buffer(0)]], device int* v43 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v44 = static_cast<int>(__simt_tid3.x);
  int v45 = 0;
  int v46 = v45 + v44;
  int v47 = v43[v46];
  int v48 = 4;
  int v49 = v48 + v44;
  int v50 = v43[v49];
  helper0(v44, v42, v47, v50, static_cast<int>(__simt_tid3.x));
  int v51 = 8;
  int v52 = v51 + v44;
  int v53 = v43[v52];
  uint v54 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v55 = (int)(v54);
  int v56;
  v56 = v55;
  switch (v53) {
    case 0:
      {
      int v57 = 0;
      int v58 = 0;
      int v59;
      int v60;
      v59 = v57;
      v60 = v58;
      while (true) {
        int v61 = 4;
        int v62 = v60 * v61;
        int v63 = v62 + v44;
        int v64 = 12;
        int v65 = v64 + v63;
        int v66 = v43[v65];
        int v67 = 0;
        bool v68 = v66 != v67;
        v59 = v59;
        v60 = v60;
        if (!v68) break;
        int v69 = v59 + v44;
        int v70 = 1;
        int v71 = v60 + v70;
        v59 = v69;
        v60 = v71;
      }
      bool v72 = true;
      v56 = v59;
      break;
    }
    case 1:
      {
      int v73 = 32;
      int v74 = v73 + v44;
      int v75 = v43[v74];
      int v76 = 2;
      int v77 = v44 + v76;
      int v78;
      v78 = v77;
      switch (v75) {
        case 0:
          {
          int v79 = 0;
          int v80 = 0;
          int v81;
          int v82;
          v81 = v79;
          v82 = v80;
          while (true) {
            int v83 = 4;
            int v84 = v82 * v83;
            int v85 = v84 + v44;
            int v86 = 36;
            int v87 = v86 + v85;
            int v88 = v43[v87];
            int v89 = 0;
            bool v90 = v88 != v89;
            v81 = v81;
            v82 = v82;
            if (!v90) break;
            int v91 = v81 + v82;
            int v92 = 1;
            int v93 = v82 + v92;
            v81 = v91;
            v82 = v93;
            break;
            ;
          }
          bool v94 = true;
          v78 = v81;
          break;
        }
        default:
          {
          int v95 = 56;
          int v96 = v95 + v44;
          int v97 = v43[v96];
          int v98 = 0;
          bool v99 = v97 != v98;
          int v100;
          if (v99) {
            int v101 = 1;
            int v102 = v44 + v101;
            v100 = v102;
          } else {
            int v103 = 2;
            int v104 = v44 + v103;
            v100 = v104;
          }
          v78 = v100;
          break;
        }
      }
      bool v105 = true;
      v56 = v78;
    }
    default:
      {
      int v106 = 60;
      int v107 = v106 + v44;
      int v108 = v43[v107];
      int v109 = 2;
      int v110 = v44 + v109;
      int v111;
      v111 = v110;
      switch (v108) {
        case 0:
          {
          int v112 = 64;
          int v113 = v112 + v44;
          int v114 = v43[v113];
          int v115 = 4;
          int v116 = v44 + v115;
          int v117;
          v117 = v116;
          switch (v114) {
            case 0:
              {
              int v118 = 4;
              int v119 = v44 + v118;
              v117 = v119;
            }
            default:
              {
              int v120 = 1;
              v117 = v120;
              break;
            }
          }
          bool v121 = true;
          v111 = v117;
          break;
        }
        case 1:
          {
          int v122 = 0;
          v111 = v122;
          break;
        }
        case 2:
          {
          int v123 = 2;
          v111 = v123;
          break;
        }
        default:
          {
          int v124 = 68;
          int v125 = v124 + v44;
          int v126 = v43[v125];
          int v127 = 4;
          int v128;
          v128 = v127;
          switch (v126) {
            case 0:
              {
              int v129 = 1;
              int v130 = v44 + v129;
              v128 = v130;
              break;
            }
            case 1:
              {
              v128 = v44;
              break;
            }
            default:
              {
              v128 = v44;
              break;
            }
            case 2:
              {
              v128 = v44;
              break;
            }
          }
          bool v131 = true;
          v111 = v128;
          break;
        }
      }
      bool v132 = true;
      v56 = v111;
      break;
    }
  }
  bool v133 = true;
  int v134 = 16;
  int v135 = v134 + v44;
  bool v136 = true;
  int v137 = simt_wave_count_bits(v136);
  v42[v135] = v137;
  int v138 = 2;
  int v139 = 72;
  int v140 = v139 + v44;
  int v141 = v43[v140];
  int v142;
  v142 = v44;
  switch (v141) {
    default:
      {
      v142 = v44;
      break;
    }
    case 0:
      {
      int v143 = 76;
      int v144 = v143 + v44;
      int v145 = v43[v144];
      int v146;
      v146 = v44;
      switch (v145) {
        case 0:
          {
          int v147 = 80;
          int v148 = v147 + v44;
          int v149 = v43[v148];
          int v150 = 0;
          int v151;
          v151 = v150;
          switch (v149) {
            case 0:
              {
              int v152 = 4;
              int v153 = v44 + v152;
              v151 = v153;
              break;
            }
            case 1:
              {
              v151 = v44;
              break;
            }
            default:
              {
              int v154 = 1;
              v151 = v154;
              break;
            }
            case 2:
              {
              v151 = v44;
              break;
            }
          }
          bool v155 = true;
          v146 = v151;
          break;
        }
        case 1:
          {
          int v156 = 84;
          int v157 = v156 + v44;
          int v158 = v43[v157];
          int v159;
          v159 = v44;
          switch (v158) {
            case 0:
              {
              v159 = v44;
              break;
            }
            default:
              {
              v159 = v44;
              break;
            }
            case 1:
              {
              int v160 = 4;
              v159 = v160;
              break;
            }
            case 2:
              {
              int v161 = 2;
              int v162 = v44 + v161;
              v159 = v162;
              break;
            }
          }
          bool v163 = true;
          v146 = v159;
          break;
        }
        case 2:
          {
          int v164 = 88;
          int v165 = v164 + v44;
          int v166 = v43[v165];
          int v167 = 0;
          bool v168 = v166 != v167;
          int v169;
          if (v168) {
            v169 = v44;
          } else {
            int v170 = 1;
            v169 = v170;
          }
          v146 = v169;
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
            int v177 = v176 + v44;
            int v178 = 92;
            int v179 = v178 + v177;
            int v180 = v43[v179];
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
            continue;
            ;
          }
          bool v186 = true;
          v146 = v173;
          break;
        }
      }
      bool v187 = true;
      v142 = v146;
      break;
    }
  }
  bool v188 = true;
  int v189 = 32;
  int v190 = v189 + v44;
  bool v191 = true;
  int v192 = simt_wave_count_bits(v191);
  v42[v190] = v192;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
