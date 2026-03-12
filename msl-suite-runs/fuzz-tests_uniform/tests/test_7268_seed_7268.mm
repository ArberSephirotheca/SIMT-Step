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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
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
      int v16 = 0;
      bool v17 = v2 != v16;
      int v18;
      if (v17) {
        int v19 = 3;
        v18 = v19;
      } else {
        uint v20 = simt_lane_id(__simt_tid);
        int v21 = (int)(v20);
        v18 = v21;
      }
      uint v22 = simt_subgroup_id(__simt_tid);
      int v23 = (int)(v22);
      int v24 = 1;
      int v25 = v10 + v24;
      v9 = v18;
      v10 = v25;
    }
    int v26 = 1;
    v6 = v9;
  } else {
    int v27 = 0;
    int v28 = 0;
    int v29;
    int v30;
    v29 = v27;
    v30 = v28;
    while (true) {
      int v31 = 4;
      int v32 = v3 % v31;
      int v33 = 1;
      int v34 = v32 + v33;
      bool v35 = v30 < v34;
      v29 = v29;
      v30 = v30;
      if (!v35) break;
      int v36 = 1;
      int v37 = v30 + v36;
      v29 = v0;
      v30 = v37;
      continue;
      ;
    }
    int v38 = 1;
    v6 = v29;
  }
  bool v39 = true;
  int v40 = simt_wave_count_bits(v39);
  int v41 = 0;
  int v42 = v41 + v0;
  v1[v42] = v40;
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
  int v56;
  v56 = v55;
  switch (v54) {
    case 0:
      {
      v56 = v45;
      break;
    }
    default:
      {
      int v57 = 12;
      int v58 = v57 + v45;
      int v59 = v44[v58];
      int v60;
      v60 = v45;
      switch (v59) {
        default:
          {
          int v61 = 16;
          int v62 = v61 + v45;
          int v63 = v44[v62];
          int v64;
          v64 = v45;
          switch (v63) {
            case 0:
              {
              int v65 = 4;
              int v66 = v45 + v65;
              v64 = v66;
              break;
            }
            case 1:
              {
              int v67 = 0;
              int v68 = v45 + v67;
              v64 = v68;
              break;
            }
            default:
              {
              int v69 = 0;
              int v70 = v45 + v69;
              v64 = v70;
            }
            case 2:
              {
              v64 = v45;
              break;
            }
          }
          bool v71 = true;
          v60 = v64;
          break;
        }
        case 0:
          {
          int v72 = 4;
          v60 = v72;
        }
        case 1:
          {
          int v73 = 0;
          int v74 = 0;
          int v75;
          int v76;
          v75 = v73;
          v76 = v74;
          while (true) {
            int v77 = 4;
            int v78 = v76 * v77;
            int v79 = v78 + v45;
            int v80 = 20;
            int v81 = v80 + v79;
            int v82 = v44[v81];
            int v83 = 0;
            bool v84 = v82 != v83;
            v75 = v75;
            v76 = v76;
            if (!v84) break;
            int v85 = v75 + v76;
            int v86 = 1;
            int v87 = v76 + v86;
            v75 = v85;
            v76 = v87;
            break;
            ;
          }
          bool v88 = true;
          v60 = v75;
          break;
        }
        case 2:
          {
          int v89 = 40;
          int v90 = v89 + v45;
          int v91 = v44[v90];
          int v92 = 0;
          bool v93 = v91 != v92;
          int v94;
          if (v93) {
            int v95 = 3;
            int v96 = v45 + v95;
            v94 = v96;
          } else {
            v94 = v45;
          }
          v60 = v94;
          break;
        }
      }
      bool v97 = true;
      v56 = v60;
      break;
    }
    case 1:
      {
      int v98 = 44;
      int v99 = v98 + v45;
      int v100 = v44[v99];
      int v101 = 3;
      int v102;
      v102 = v101;
      switch (v100) {
        case 0:
          {
          int v103 = 48;
          int v104 = v103 + v45;
          int v105 = v44[v104];
          int v106 = 0;
          bool v107 = v105 != v106;
          int v108;
          if (v107) {
            int v109 = 4;
            v108 = v109;
          } else {
            v108 = v45;
          }
          v102 = v108;
          break;
        }
        case 1:
          {
          int v110 = 52;
          int v111 = v110 + v45;
          int v112 = v44[v111];
          int v113 = 0;
          bool v114 = v112 != v113;
          int v115;
          if (v114) {
            int v116 = 0;
            v115 = v116;
          } else {
            v115 = v45;
          }
          v102 = v115;
        }
        default:
          {
          v102 = v45;
          break;
        }
        case 2:
          {
          int v117 = 4;
          v102 = v117;
          break;
        }
      }
      bool v118 = true;
      v56 = v102;
      break;
    }
    case 2:
      {
      int v119 = 0;
      int v120 = 0;
      int v121;
      int v122;
      v121 = v119;
      v122 = v120;
      while (true) {
        int v123 = 4;
        int v124 = v122 * v123;
        int v125 = v124 + v45;
        int v126 = 56;
        int v127 = v126 + v125;
        int v128 = v44[v127];
        int v129 = 0;
        bool v130 = v128 != v129;
        v121 = v121;
        v122 = v122;
        if (!v130) break;
        int v131 = v121 + v122;
        int v132 = 1;
        int v133 = v122 + v132;
        v121 = v131;
        v122 = v133;
      }
      bool v134 = true;
      v56 = v121;
      break;
    }
  }
  bool v135 = true;
  int v136 = 16;
  int v137 = v136 + v45;
  bool v138 = true;
  int v139 = simt_wave_count_bits(v138);
  v43[v137] = v139;
  int v140 = 76;
  int v141 = v140 + v45;
  int v142 = v44[v141];
  int v143 = 2;
  int v144;
  v144 = v143;
  switch (v142) {
    case 0:
      {
      int v145 = 0;
      int v146 = 0;
      int v147;
      int v148;
      v147 = v145;
      v148 = v146;
      while (true) {
        int v149 = 4;
        int v150 = v148 * v149;
        int v151 = v150 + v45;
        int v152 = 80;
        int v153 = v152 + v151;
        int v154 = v44[v153];
        int v155 = 0;
        bool v156 = v154 != v155;
        v147 = v147;
        v148 = v148;
        if (!v156) break;
        int v157 = v147 + v148;
        int v158 = 1;
        int v159 = v148 + v158;
        v147 = v157;
        v148 = v159;
      }
      bool v160 = true;
      v144 = v147;
    }
    default:
      {
      int v161 = 100;
      int v162 = v161 + v45;
      int v163 = v44[v162];
      int v164 = 3;
      int v165 = v45 + v164;
      int v166;
      v166 = v165;
      switch (v163) {
        case 0:
          {
          int v167 = 104;
          int v168 = v167 + v45;
          int v169 = v44[v168];
          int v170 = 0;
          int v171 = v45 + v170;
          int v172;
          v172 = v171;
          switch (v169) {
            default:
              {
              v172 = v45;
              break;
            }
            case 0:
              {
              int v173 = 0;
              v172 = v173;
              break;
            }
          }
          bool v174 = true;
          v166 = v172;
          break;
        }
        case 1:
          {
          int v175 = 108;
          int v176 = v175 + v45;
          int v177 = v44[v176];
          int v178;
          v178 = v45;
          switch (v177) {
            case 0:
              {
              int v179 = 4;
              v178 = v179;
            }
            default:
              {
              int v180 = 0;
              v178 = v180;
            }
            case 1:
              {
              int v181 = 1;
              int v182 = v45 + v181;
              v178 = v182;
              break;
            }
          }
          bool v183 = true;
          v166 = v178;
          break;
        }
        default:
          {
          int v184 = 112;
          int v185 = v184 + v45;
          int v186 = v44[v185];
          int v187;
          v187 = v45;
          switch (v186) {
            case 0:
              {
              int v188 = 3;
              v187 = v188;
            }
            case 1:
              {
              int v189 = 4;
              int v190 = v45 + v189;
              v187 = v190;
            }
            case 2:
              {
              v187 = v45;
            }
            default:
              {
              int v191 = 3;
              int v192 = v45 + v191;
              v187 = v192;
              break;
            }
          }
          bool v193 = true;
          v166 = v187;
          break;
        }
      }
      bool v194 = true;
      v144 = v166;
      break;
    }
    case 1:
      {
      int v195 = 2;
      int v196 = v45 + v195;
      v144 = v196;
      break;
    }
  }
  bool v197 = true;
  int v198 = 32;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 116; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
