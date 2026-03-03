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
    default:
      {
      int v7 = 0;
      int v8 = v0 + v7;
      v6 = v8;
      break;
    }
    case 0:
      {
      int v9 = 0;
      int v10 = v0 + v9;
      v6 = v10;
      break;
    }
  }
  bool v11 = true;
  int v12 = simt_wave_count_bits(v11);
  int v13 = 0;
  int v14 = v13 + v0;
  v1[v14] = v12;
  int v15 = 0;
  bool v16 = v2 != v15;
  int v17;
  if (v16) {
    int v18 = 2;
    v17 = v18;
  } else {
    int v19 = 4;
    int v20 = v0 + v19;
    v17 = v20;
  }
  bool v21 = true;
  int v22 = simt_wave_count_bits(v21);
  int v23 = 16;
  int v24 = v23 + v0;
  v1[v24] = v22;
  int v25 = 0;
  bool v26 = v2 != v25;
  int v27 = v26 ? v6 : v17;
  int v28 = 4;
  int v29 = v0 + v28;
  int v30;
  v30 = v29;
  switch (v3) {
    default:
      {
      int v31 = 0;
      int v32 = 0;
      int v33;
      int v34;
      v33 = v31;
      v34 = v32;
      while (true) {
        int v35 = 4;
        int v36 = v3 % v35;
        int v37 = 1;
        int v38 = v36 + v37;
        bool v39 = v34 < v38;
        v33 = v33;
        v34 = v34;
        if (!v39) break;
        int v40 = 0;
        bool v41 = v2 != v40;
        int v42;
        if (v41) {
          v42 = v0;
        } else {
          int v43 = 0;
          int v44 = v0 + v43;
          v42 = v44;
        }
        int v45 = 3;
        int v46 = 1;
        int v47 = v34 + v46;
        v33 = v42;
        v34 = v47;
      }
      v30 = v33;
      break;
    }
    case 0:
      {
      int v48 = 0;
      bool v49 = v2 != v48;
      int v50;
      if (v49) {
        int v51 = 0;
        int v52 = 0;
        int v53;
        int v54;
        v53 = v51;
        v54 = v52;
        while (true) {
          int v55 = 4;
          int v56 = v3 % v55;
          int v57 = 1;
          int v58 = v56 + v57;
          bool v59 = v54 < v58;
          v53 = v53;
          v54 = v54;
          if (!v59) break;
          int v60 = 3;
          int v61 = 1;
          int v62 = v54 + v61;
          v53 = v60;
          v54 = v62;
        }
        int v63 = 0;
        int v64 = v0 + v63;
        v50 = v53;
      } else {
        int v65 = 3;
        int v66 = v3 % v65;
        int v67 = 1;
        int v68 = v0 + v67;
        int v69;
        v69 = v68;
        switch (v66) {
          default:
            {
            v69 = v0;
            break;
          }
          case 0:
            {
            int v70 = 1;
            int v71 = v0 + v70;
            v69 = v71;
            break;
          }
          case 1:
            {
            int v72 = 1;
            v69 = v72;
            break;
          }
          case 2:
            {
            int v73 = 4;
            int v74 = v0 + v73;
            v69 = v74;
            break;
          }
        }
        int v75 = 1;
        v50 = v69;
      }
      int v76 = 4;
      v30 = v50;
      break;
    }
  }
  bool v77 = true;
  int v78 = simt_wave_count_bits(v77);
  int v79 = 32;
  int v80 = v79 + v0;
  v1[v80] = v78;
  int v81 = 0;
  bool v82 = v2 != v81;
  int v83 = v82 ? v27 : v30;
  return;
}

kernel void kernel_main(device int* v84 [[buffer(0)]], device int* v85 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v86 = static_cast<int>(__simt_tid3.x);
  int v87 = 0;
  int v88 = v87 + v86;
  int v89 = v85[v88];
  int v90 = 4;
  int v91 = v90 + v86;
  int v92 = v85[v91];
  helper0(v86, v84, v89, v92, static_cast<int>(__simt_tid3.x));
  int v93 = 8;
  int v94 = v93 + v86;
  int v95 = v85[v94];
  int v96 = 3;
  int v97 = v86 + v96;
  int v98;
  v98 = v97;
  switch (v95) {
    default:
      {
      int v99 = 12;
      int v100 = v99 + v86;
      int v101 = v85[v100];
      int v102 = 3;
      int v103 = v86 + v102;
      int v104;
      v104 = v103;
      switch (v101) {
        default:
          {
          v104 = v86;
          break;
        }
        case 0:
          {
          int v105 = 2;
          v104 = v105;
          break;
        }
        case 1:
          {
          int v106 = 16;
          int v107 = v106 + v86;
          int v108 = v85[v107];
          int v109;
          v109 = v86;
          switch (v108) {
            case 0:
              {
              int v110 = 3;
              int v111 = v86 + v110;
              v109 = v111;
            }
            default:
              {
              int v112 = 0;
              v109 = v112;
            }
            case 1:
              {
              int v113 = 3;
              v109 = v113;
            }
            case 2:
              {
              int v114 = 1;
              int v115 = v86 + v114;
              v109 = v115;
              break;
            }
          }
          bool v116 = true;
          v104 = v109;
          break;
        }
        case 2:
          {
          int v117 = 20;
          int v118 = v117 + v86;
          int v119 = v85[v118];
          int v120 = 0;
          bool v121 = v119 != v120;
          int v122;
          if (v121) {
            int v123 = 2;
            v122 = v123;
          } else {
            v122 = v86;
          }
          v104 = v122;
          break;
        }
      }
      bool v124 = true;
      v98 = v104;
      break;
    }
    case 0:
      {
      int v125 = 24;
      int v126 = v125 + v86;
      int v127 = v85[v126];
      int v128;
      v128 = v86;
      switch (v127) {
        case 0:
          {
          int v129 = 28;
          int v130 = v129 + v86;
          int v131 = v85[v130];
          int v132 = 0;
          bool v133 = v131 != v132;
          int v134;
          if (v133) {
            v134 = v86;
          } else {
            v134 = v86;
          }
          v128 = v134;
          break;
        }
        default:
          {
          int v135 = 32;
          int v136 = v135 + v86;
          int v137 = v85[v136];
          int v138;
          v138 = v86;
          switch (v137) {
            default:
              {
              v138 = v86;
              break;
            }
            case 0:
              {
              int v139 = 4;
              v138 = v139;
              break;
            }
            case 1:
              {
              int v140 = 4;
              int v141 = v86 + v140;
              v138 = v141;
              break;
            }
          }
          bool v142 = true;
          v128 = v138;
          break;
        }
        case 1:
          {
          v128 = v86;
          break;
        }
        case 2:
          {
          int v143 = 3;
          int v144 = v86 + v143;
          v128 = v144;
          break;
        }
      }
      bool v145 = true;
      v98 = v128;
      break;
    }
  }
  bool v146 = true;
  int v147 = 48;
  int v148 = v147 + v86;
  bool v149 = true;
  int v150 = simt_wave_count_bits(v149);
  v84[v148] = v150;
  int v151 = 36;
  int v152 = v151 + v86;
  int v153 = v85[v152];
  int v154 = 4;
  int v155;
  v155 = v154;
  switch (v153) {
    default:
      {
      int v156 = 40;
      int v157 = v156 + v86;
      int v158 = v85[v157];
      int v159;
      v159 = v86;
      switch (v158) {
        case 0:
          {
          int v160 = 2;
          v159 = v160;
          break;
        }
        case 1:
          {
          int v161 = 1;
          v159 = v161;
          break;
        }
        case 2:
          {
          int v162 = 44;
          int v163 = v162 + v86;
          int v164 = v85[v163];
          int v165 = 2;
          int v166;
          v166 = v165;
          switch (v164) {
            case 0:
              {
              int v167 = 1;
              int v168 = v86 + v167;
              v166 = v168;
            }
            case 1:
              {
              int v169 = 2;
              v166 = v169;
            }
            default:
              {
              int v170 = 4;
              int v171 = v86 + v170;
              v166 = v171;
              break;
            }
            case 2:
              {
              int v172 = 3;
              int v173 = v86 + v172;
              v166 = v173;
              break;
            }
          }
          bool v174 = true;
          v159 = v166;
          break;
        }
        default:
          {
          int v175 = 48;
          int v176 = v175 + v86;
          int v177 = v85[v176];
          int v178;
          v178 = v86;
          switch (v177) {
            case 0:
              {
              int v179 = 4;
              v178 = v179;
              break;
            }
            default:
              {
              v178 = v86;
              break;
            }
            case 1:
              {
              int v180 = 3;
              v178 = v180;
              break;
            }
            case 2:
              {
              int v181 = 1;
              v178 = v181;
              break;
            }
          }
          bool v182 = true;
          v159 = v178;
          break;
        }
      }
      bool v183 = true;
      v155 = v159;
      break;
    }
    case 0:
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
        int v190 = v189 + v86;
        int v191 = 52;
        int v192 = v191 + v190;
        int v193 = v85[v192];
        int v194 = 0;
        bool v195 = v193 != v194;
        v186 = v186;
        v187 = v187;
        if (!v195) break;
        int v196 = v186 + v187;
        int v197 = 1;
        int v198 = v187 + v197;
        v186 = v196;
        v187 = v198;
      }
      bool v199 = true;
      v155 = v186;
      break;
    }
  }
  bool v200 = true;
  int v201 = 64;
  int v202 = v201 + v86;
  bool v203 = true;
  int v204 = simt_wave_count_bits(v203);
  v84[v202] = v204;
  int v205 = 4;
  int v206 = v86 + v205;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
