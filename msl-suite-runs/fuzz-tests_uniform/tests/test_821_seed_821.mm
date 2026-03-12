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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7;
      v7 = v0;
      switch (v3) {
        default:
          {
          int v8 = 0;
          int v9 = 0;
          int v10;
          int v11;
          v10 = v8;
          v11 = v9;
          while (true) {
            int v12 = 4;
            int v13 = v3 % v12;
            int v14 = 1;
            int v15 = v13 + v14;
            bool v16 = v11 < v15;
            v10 = v10;
            v11 = v11;
            if (!v16) break;
            int v17 = 1;
            int v18 = v11 + v17;
            v10 = v0;
            v11 = v18;
          }
          v7 = v10;
        }
        case 0:
          {
          int v19 = 0;
          int v20 = 0;
          int v21;
          int v22;
          v21 = v19;
          v22 = v20;
          while (true) {
            int v23 = 4;
            int v24 = v3 % v23;
            int v25 = 1;
            int v26 = v24 + v25;
            bool v27 = v22 < v26;
            v21 = v21;
            v22 = v22;
            if (!v27) break;
            int v28 = 4;
            int v29 = 1;
            int v30 = v22 + v29;
            v21 = v28;
            v22 = v30;
          }
          int v31 = 1;
          v7 = v21;
          break;
        }
      }
      int v32 = 0;
      v6 = v7;
      break;
    }
    case 1:
      {
      int v33 = 3;
      int v34 = v3 % v33;
      int v35;
      v35 = v0;
      switch (v34) {
        case 0:
          {
          int v36 = 0;
          int v37 = 0;
          int v38;
          int v39;
          v38 = v36;
          v39 = v37;
          while (true) {
            int v40 = 4;
            int v41 = v3 % v40;
            int v42 = 1;
            int v43 = v41 + v42;
            bool v44 = v39 < v43;
            v38 = v38;
            v39 = v39;
            if (!v44) break;
            int v45 = 2;
            int v46 = v0 + v45;
            int v47 = 1;
            int v48 = v39 + v47;
            v38 = v46;
            v39 = v48;
            continue;
            ;
          }
          int v49 = 2;
          int v50 = v0 + v49;
          v35 = v38;
          break;
        }
        case 1:
          {
          int v51 = 4;
          int v52 = v3 % v51;
          int v53;
          v53 = v0;
          switch (v52) {
            default:
              {
              int v54 = 0;
              v53 = v54;
              break;
            }
            case 0:
              {
              int v55 = 0;
              v53 = v55;
              break;
            }
            case 1:
              {
              int v56 = 0;
              v53 = v56;
              break;
            }
            case 2:
              {
              int v57 = 0;
              int v58 = v0 + v57;
              v53 = v58;
              break;
            }
          }
          v35 = v53;
          break;
        }
        default:
          {
          int v59 = 0;
          bool v60 = v2 != v59;
          int v61;
          if (v60) {
            int v62 = 2;
            v61 = v62;
          } else {
            int v63 = 3;
            v61 = v63;
          }
          int v64 = 0;
          v35 = v61;
          break;
        }
        case 2:
          {
          int v65 = 2;
          int v66 = v3 % v65;
          int v67 = 4;
          int v68;
          v68 = v67;
          switch (v66) {
            case 0:
              {
              int v69 = 3;
              v68 = v69;
            }
            default:
              {
              int v70 = 2;
              int v71 = v0 + v70;
              v68 = v71;
            }
            case 1:
              {
              int v72 = 3;
              int v73 = v0 + v72;
              v68 = v73;
              break;
            }
          }
          int v74 = 0;
          v35 = v68;
          break;
        }
      }
      int v75 = 1;
      int v76 = v0 + v75;
      v6 = v35;
      break;
    }
    default:
      {
      v6 = v0;
      break;
    }
  }
  bool v77 = true;
  int v78 = simt_wave_count_bits(v77);
  int v79 = 0;
  int v80 = v79 + v0;
  v1[v80] = v78;
  return;
}

kernel void kernel_main(device int* v81 [[buffer(0)]], device int* v82 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v83 = static_cast<int>(__simt_tid3.x);
  int v84 = 0;
  int v85 = v84 + v83;
  int v86 = v82[v85];
  int v87 = 4;
  int v88 = v87 + v83;
  int v89 = v82[v88];
  helper0(v83, v81, v86, v89, static_cast<int>(__simt_tid3.x));
  int v90 = 0;
  int v91 = 0;
  int v92;
  int v93;
  v92 = v90;
  v93 = v91;
  while (true) {
    int v94 = 4;
    int v95 = v93 * v94;
    int v96 = v95 + v83;
    int v97 = 8;
    int v98 = v97 + v96;
    int v99 = v82[v98];
    int v100 = 0;
    bool v101 = v99 != v100;
    v92 = v92;
    v93 = v93;
    if (!v101) break;
    int v102 = v92 + v93;
    int v103 = 1;
    int v104 = v93 + v103;
    v92 = v102;
    v93 = v104;
  }
  bool v105 = true;
  int v106 = 16;
  int v107 = v106 + v83;
  bool v108 = true;
  int v109 = simt_wave_count_bits(v108);
  v81[v107] = v109;
  int v110 = 28;
  int v111 = v110 + v83;
  int v112 = v82[v111];
  int v113 = 3;
  int v114;
  v114 = v113;
  switch (v112) {
    default:
      {
      int v115 = 32;
      int v116 = v115 + v83;
      int v117 = v82[v116];
      int v118 = 2;
      int v119 = v83 + v118;
      int v120;
      v120 = v119;
      switch (v117) {
        default:
          {
          int v121 = 36;
          int v122 = v121 + v83;
          int v123 = v82[v122];
          int v124 = 3;
          int v125 = v83 + v124;
          int v126;
          v126 = v125;
          switch (v123) {
            default:
              {
              int v127 = 2;
              v126 = v127;
              break;
            }
            case 0:
              {
              int v128 = 0;
              int v129 = v83 + v128;
              v126 = v129;
              break;
            }
            case 1:
              {
              v126 = v83;
              break;
            }
          }
          bool v130 = true;
          v120 = v126;
          break;
        }
        case 0:
          {
          int v131 = 40;
          int v132 = v131 + v83;
          int v133 = v82[v132];
          int v134 = 1;
          int v135;
          v135 = v134;
          switch (v133) {
            case 0:
              {
              v135 = v83;
              break;
            }
            default:
              {
              int v136 = 3;
              int v137 = v83 + v136;
              v135 = v137;
              break;
            }
            case 1:
              {
              int v138 = 1;
              v135 = v138;
              break;
            }
          }
          bool v139 = true;
          v120 = v135;
          break;
        }
      }
      bool v140 = true;
      v114 = v120;
      break;
    }
    case 0:
      {
      int v141 = 44;
      int v142 = v141 + v83;
      int v143 = v82[v142];
      int v144;
      v144 = v83;
      switch (v143) {
        default:
          {
          v144 = v83;
          break;
        }
        case 0:
          {
          int v145 = 0;
          int v146 = v83 + v145;
          v144 = v146;
          break;
        }
        case 1:
          {
          int v147 = 48;
          int v148 = v147 + v83;
          int v149 = v82[v148];
          int v150 = 0;
          bool v151 = v149 != v150;
          int v152;
          if (v151) {
            int v153 = 0;
            int v154 = v83 + v153;
            v152 = v154;
          } else {
            v152 = v83;
          }
          v144 = v152;
          break;
        }
        case 2:
          {
          v144 = v83;
          break;
        }
      }
      bool v155 = true;
      v114 = v144;
      break;
    }
    case 1:
      {
      int v156 = 52;
      int v157 = v156 + v83;
      int v158 = v82[v157];
      int v159 = 0;
      bool v160 = v158 != v159;
      int v161;
      if (v160) {
        int v162 = 0;
        int v163 = 0;
        int v164;
        int v165;
        v164 = v162;
        v165 = v163;
        while (true) {
          int v166 = 4;
          int v167 = v165 * v166;
          int v168 = v167 + v83;
          int v169 = 56;
          int v170 = v169 + v168;
          int v171 = v82[v170];
          int v172 = 0;
          bool v173 = v171 != v172;
          v164 = v164;
          v165 = v165;
          if (!v173) break;
          int v174 = v164 + v165;
          int v175 = 1;
          int v176 = v165 + v175;
          v164 = v174;
          v165 = v176;
          continue;
          ;
        }
        bool v177 = true;
        v161 = v164;
      } else {
        int v178 = 76;
        int v179 = v178 + v83;
        int v180 = v82[v179];
        int v181 = 2;
        int v182 = v83 + v181;
        int v183;
        v183 = v182;
        switch (v180) {
          case 0:
            {
            v183 = v83;
          }
          case 1:
            {
            v183 = v83;
            break;
          }
          case 2:
            {
            int v184 = 1;
            int v185 = v83 + v184;
            v183 = v185;
            break;
          }
          default:
            {
            int v186 = 4;
            int v187 = v83 + v186;
            v183 = v187;
            break;
          }
        }
        bool v188 = true;
        v161 = v183;
      }
      v114 = v161;
      break;
    }
    case 2:
      {
      int v189 = 0;
      int v190 = 0;
      int v191;
      int v192;
      v191 = v189;
      v192 = v190;
      while (true) {
        int v193 = 4;
        int v194 = v192 * v193;
        int v195 = v194 + v83;
        int v196 = 80;
        int v197 = v196 + v195;
        int v198 = v82[v197];
        int v199 = 0;
        bool v200 = v198 != v199;
        v191 = v191;
        v192 = v192;
        if (!v200) break;
        int v201 = v191 + v192;
        int v202 = 1;
        int v203 = v192 + v202;
        v191 = v201;
        v192 = v203;
      }
      bool v204 = true;
      v114 = v191;
      break;
    }
  }
  bool v205 = true;
  int v206 = 32;
  int v207 = v206 + v83;
  bool v208 = true;
  int v209 = simt_wave_count_bits(v208);
  v81[v207] = v209;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
