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
    int v13 = 2;
    int v14 = v3 % v13;
    uint v15 = simt_subgroup_id(__simt_tid);
    int v16 = (int)(v15);
    int v17;
    v17 = v16;
    switch (v14) {
      case 0:
        {
        int v18 = 0;
        bool v19 = v2 != v18;
        int v20;
        if (v19) {
          v20 = v0;
        } else {
          int v21 = 2;
          v20 = v21;
        }
        v17 = v20;
        break;
      }
      default:
        {
        int v22 = 0;
        int v23 = 0;
        int v24;
        int v25;
        v24 = v22;
        v25 = v23;
        while (true) {
          int v26 = 4;
          int v27 = v3 % v26;
          int v28 = 1;
          int v29 = v27 + v28;
          bool v30 = v25 < v29;
          v24 = v24;
          v25 = v25;
          if (!v30) break;
          int v31 = 3;
          int v32 = v0 + v31;
          int v33 = 1;
          int v34 = v25 + v33;
          v24 = v32;
          v25 = v34;
        }
        v17 = v24;
        break;
      }
    }
    int v35 = 1;
    int v36 = v7 + v35;
    v6 = v17;
    v7 = v36;
  }
  bool v37 = true;
  int v38 = simt_wave_count_bits(v37);
  int v39 = 0;
  int v40 = v39 + v0;
  v1[v40] = v38;
  return;
}

kernel void kernel_main(device int* v41 [[buffer(0)]], device int* v42 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v43 = static_cast<int>(__simt_tid3.x);
  int v44 = 0;
  int v45 = v44 + v43;
  int v46 = v42[v45];
  int v47 = 4;
  int v48 = v47 + v43;
  int v49 = v42[v48];
  int v50 = 0;
  bool v51 = v46 != v50;
  if (v51) {
  } else {
    int v52 = 0;
    int v53 = 0;
    int v54;
    int v55;
    v54 = v52;
    v55 = v53;
    while (true) {
      int v56 = 2;
      bool v57 = v55 < v56;
      v54 = v54;
      v55 = v55;
      if (!v57) break;
      int v58 = 3;
      int v59 = v43 % v58;
      uint v60 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v61 = (int)(v60);
      int v62;
      v62 = v61;
      switch (v59) {
        case 0:
          {
          int v63 = 0;
          int v64 = v62 + v63;
          v62 = v64;
          break;
        }
        default:
          {
          int v65 = 1;
          int v66 = v62 + v65;
          v62 = v66;
          break;
        }
        case 1:
          {
          int v67 = 3;
          int v68 = v62 + v67;
          v62 = v68;
          break;
        }
      }
      helper0(v43, v41, v46, v49, static_cast<int>(__simt_tid3.x));
      int v69 = 1;
      int v70 = v55 + v69;
      v54 = v54;
      v55 = v70;
    }
  }
  int v71 = 8;
  int v72 = v71 + v43;
  int v73 = v42[v72];
  uint v74 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v75 = (int)(v74);
  int v76;
  v76 = v75;
  switch (v73) {
    default:
      {
      int v77 = 12;
      int v78 = v77 + v43;
      int v79 = v42[v78];
      int v80 = 3;
      int v81 = v43 + v80;
      int v82;
      v82 = v81;
      switch (v79) {
        default:
          {
          int v83 = 16;
          int v84 = v83 + v43;
          int v85 = v42[v84];
          int v86 = 2;
          int v87 = v43 + v86;
          int v88;
          v88 = v87;
          switch (v85) {
            case 0:
              {
              int v89 = 2;
              v88 = v89;
              break;
            }
            default:
              {
              v88 = v43;
            }
            case 1:
              {
              v88 = v43;
            }
            case 2:
              {
              int v90 = 2;
              v88 = v90;
              break;
            }
          }
          v82 = v88;
        }
        case 0:
          {
          int v91 = 0;
          int v92 = 0;
          int v93;
          int v94;
          v93 = v91;
          v94 = v92;
          while (true) {
            int v95 = 4;
            int v96 = v94 * v95;
            int v97 = v96 + v43;
            int v98 = 20;
            int v99 = v98 + v97;
            int v100 = v42[v99];
            int v101 = 0;
            bool v102 = v100 != v101;
            v93 = v93;
            v94 = v94;
            if (!v102) break;
            int v103 = v93 + v94;
            int v104 = 1;
            int v105 = v94 + v104;
            bool v106 = true;
            v93 = v103;
            v94 = v105;
          }
          v82 = v93;
        }
        case 1:
          {
          int v107 = 0;
          int v108 = 0;
          int v109;
          int v110;
          v109 = v107;
          v110 = v108;
          while (true) {
            int v111 = 4;
            int v112 = v110 * v111;
            int v113 = v112 + v43;
            int v114 = 40;
            int v115 = v114 + v113;
            int v116 = v42[v115];
            int v117 = 0;
            bool v118 = v116 != v117;
            v109 = v109;
            v110 = v110;
            if (!v118) break;
            int v119 = v109 + v110;
            int v120 = 1;
            int v121 = v110 + v120;
            bool v122 = true;
            v109 = v119;
            v110 = v121;
          }
          v82 = v109;
          break;
        }
        case 2:
          {
          int v123 = 4;
          v82 = v123;
          break;
        }
      }
      bool v124 = true;
      v76 = v82;
    }
    case 0:
      {
      int v125 = 60;
      int v126 = v125 + v43;
      int v127 = v42[v126];
      int v128 = 3;
      int v129 = v43 + v128;
      int v130;
      v130 = v129;
      switch (v127) {
        default:
          {
          int v131 = 0;
          int v132 = 0;
          int v133;
          int v134;
          v133 = v131;
          v134 = v132;
          while (true) {
            int v135 = 4;
            int v136 = v134 * v135;
            int v137 = v136 + v43;
            int v138 = 64;
            int v139 = v138 + v137;
            int v140 = v42[v139];
            int v141 = 0;
            bool v142 = v140 != v141;
            v133 = v133;
            v134 = v134;
            if (!v142) break;
            int v143 = v133 + v134;
            int v144 = 1;
            int v145 = v134 + v144;
            bool v146 = true;
            v133 = v143;
            v134 = v145;
          }
          v130 = v133;
          break;
        }
        case 0:
          {
          v130 = v43;
          break;
        }
        case 1:
          {
          int v147 = 84;
          int v148 = v147 + v43;
          int v149 = v42[v148];
          int v150 = 0;
          bool v151 = v149 != v150;
          int v152;
          if (v151) {
            int v153 = 2;
            v152 = v153;
          } else {
            int v154 = 2;
            int v155 = v43 + v154;
            v152 = v155;
          }
          v130 = v152;
          break;
        }
      }
      bool v156 = true;
      v76 = v130;
      break;
    }
    case 1:
      {
      int v157 = 88;
      int v158 = v157 + v43;
      int v159 = v42[v158];
      int v160;
      v160 = v43;
      switch (v159) {
        default:
          {
          int v161 = 92;
          int v162 = v161 + v43;
          int v163 = v42[v162];
          int v164 = 0;
          bool v165 = v163 != v164;
          int v166;
          if (v165) {
            v166 = v43;
          } else {
            int v167 = 1;
            v166 = v167;
          }
          v160 = v166;
        }
        case 0:
          {
          int v168 = 4;
          v160 = v168;
        }
        case 1:
          {
          int v169 = 96;
          int v170 = v169 + v43;
          int v171 = v42[v170];
          int v172;
          v172 = v43;
          switch (v171) {
            default:
              {
              int v173 = 4;
              v172 = v173;
              break;
            }
            case 0:
              {
              v172 = v43;
              break;
            }
            case 1:
              {
              int v174 = 0;
              v172 = v174;
              break;
            }
          }
          v160 = v172;
          break;
        }
        case 2:
          {
          int v175 = 100;
          int v176 = v175 + v43;
          int v177 = v42[v176];
          int v178 = 0;
          bool v179 = v177 != v178;
          int v180;
          if (v179) {
            int v181 = 3;
            v180 = v181;
          } else {
            v180 = v43;
          }
          v160 = v180;
          break;
        }
      }
      v76 = v160;
    }
    case 2:
      {
      int v182 = 104;
      int v183 = v182 + v43;
      int v184 = v42[v183];
      int v185 = 0;
      bool v186 = v184 != v185;
      int v187;
      if (v186) {
        int v188 = 108;
        int v189 = v188 + v43;
        int v190 = v42[v189];
        int v191 = 4;
        int v192;
        v192 = v191;
        switch (v190) {
          default:
            {
            int v193 = 2;
            v192 = v193;
            break;
          }
          case 0:
            {
            v192 = v43;
            break;
          }
          case 1:
            {
            int v194 = 3;
            int v195 = v43 + v194;
            v192 = v195;
            break;
          }
        }
        v187 = v192;
      } else {
        int v196 = 0;
        int v197 = 0;
        int v198;
        int v199;
        v198 = v196;
        v199 = v197;
        while (true) {
          int v200 = 4;
          int v201 = v199 * v200;
          int v202 = v201 + v43;
          int v203 = 112;
          int v204 = v203 + v202;
          int v205 = v42[v204];
          int v206 = 0;
          bool v207 = v205 != v206;
          v198 = v198;
          v199 = v199;
          if (!v207) break;
          int v208 = v198 + v199;
          int v209 = 1;
          int v210 = v199 + v209;
          bool v211 = true;
          v198 = v208;
          v199 = v210;
        }
        v187 = v198;
      }
      v76 = v187;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 132; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
