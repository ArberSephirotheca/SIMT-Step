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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
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
    bool v17 = true;
    int v18 = simt_wave_count_bits(v17);
    int v19 = 16;
    int v20 = 4;
    int v21 = v11 * v20;
    int v22 = v19 + v21;
    int v23 = v22 + v0;
    v1[v23] = v18;
    int v24 = 1;
    int v25 = v11 + v24;
    v10 = v18;
    v11 = v25;
  }
  int v26 = 0;
  bool v27 = v2 != v26;
  int v28 = v27 ? v5 : v10;
  int v29 = 3;
  int v30 = v3 % v29;
  int v31 = 4;
  int v32 = v0 + v31;
  int v33;
  v33 = v32;
  switch (v30) {
    case 0:
      {
      int v34 = 4;
      int v35 = v3 % v34;
      int v36 = 2;
      int v37 = v0 + v36;
      int v38;
      v38 = v37;
      switch (v35) {
        case 0:
          {
          int v39 = 3;
          int v40 = v3 % v39;
          int v41 = 2;
          int v42;
          v42 = v41;
          switch (v40) {
            case 0:
              {
              int v43 = 1;
              int v44 = v0 + v43;
              v42 = v44;
              break;
            }
            default:
              {
              int v45 = 3;
              v42 = v45;
              break;
            }
            case 1:
              {
              int v46 = 4;
              v42 = v46;
              break;
            }
            case 2:
              {
              int v47 = 2;
              int v48 = v0 + v47;
              v42 = v48;
              break;
            }
          }
          v38 = v42;
        }
        case 1:
          {
          int v49 = 0;
          int v50 = v0 + v49;
          v38 = v50;
        }
        case 2:
          {
          int v51 = 3;
          int v52 = v3 % v51;
          int v53 = 2;
          int v54;
          v54 = v53;
          switch (v52) {
            default:
              {
              int v55 = 1;
              int v56 = v0 + v55;
              v54 = v56;
            }
            case 0:
              {
              int v57 = 0;
              int v58 = v0 + v57;
              v54 = v58;
              break;
            }
            case 1:
              {
              v54 = v0;
              break;
            }
          }
          v38 = v54;
          break;
        }
        default:
          {
          int v59 = 0;
          int v60 = 0;
          int v61;
          int v62;
          v61 = v59;
          v62 = v60;
          while (true) {
            int v63 = 4;
            int v64 = v3 % v63;
            int v65 = 1;
            int v66 = v64 + v65;
            bool v67 = v62 < v66;
            v61 = v61;
            v62 = v62;
            if (!v67) break;
            int v68 = 3;
            int v69 = v0 + v68;
            int v70 = 1;
            int v71 = v62 + v70;
            v61 = v69;
            v62 = v71;
          }
          v38 = v61;
          break;
        }
      }
      v33 = v38;
    }
    default:
      {
      int v72 = 3;
      int v73 = v3 % v72;
      int v74;
      v74 = v0;
      switch (v73) {
        default:
          {
          int v75 = 4;
          v74 = v75;
          break;
        }
        case 0:
          {
          int v76 = 1;
          int v77 = v0 + v76;
          v74 = v77;
          break;
        }
        case 1:
          {
          v74 = v0;
        }
        case 2:
          {
          int v78 = 1;
          int v79 = v0 + v78;
          v74 = v79;
          break;
        }
      }
      v33 = v74;
    }
    case 1:
      {
      int v80 = 0;
      bool v81 = v2 != v80;
      int v82;
      if (v81) {
        int v83 = 3;
        int v84 = v3 % v83;
        int v85 = 0;
        int v86 = v0 + v85;
        int v87;
        v87 = v86;
        switch (v84) {
          default:
            {
            int v88 = 2;
            int v89 = v0 + v88;
            v87 = v89;
            break;
          }
          case 0:
            {
            int v90 = 1;
            v87 = v90;
            break;
          }
          case 1:
            {
            v87 = v0;
            break;
          }
        }
        v82 = v87;
      } else {
        int v91 = 0;
        int v92 = 0;
        int v93;
        int v94;
        v93 = v91;
        v94 = v92;
        while (true) {
          int v95 = 4;
          int v96 = v3 % v95;
          int v97 = 1;
          int v98 = v96 + v97;
          bool v99 = v94 < v98;
          v93 = v93;
          v94 = v94;
          if (!v99) break;
          int v100 = 3;
          int v101 = v0 + v100;
          int v102 = 1;
          int v103 = v94 + v102;
          v93 = v101;
          v94 = v103;
          break;
          ;
        }
        v82 = v93;
      }
      v33 = v82;
    }
    case 2:
      {
      int v104 = 2;
      v33 = v104;
      break;
    }
  }
  int v105 = 0;
  bool v106 = v2 != v105;
  int v107 = v106 ? v28 : v33;
  return;
}

kernel void kernel_main(device int* v108 [[buffer(0)]], device int* v109 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v110 = static_cast<int>(__simt_tid3.x);
  int v111 = 0;
  int v112 = v111 + v110;
  int v113 = v109[v112];
  int v114 = 4;
  int v115 = v114 + v110;
  int v116 = v109[v115];
  helper0(v110, v108, v113, v116, static_cast<int>(__simt_tid3.x));
  int v117 = 8;
  int v118 = v117 + v110;
  int v119 = v109[v118];
  int v120 = 4;
  int v121 = v110 + v120;
  int v122;
  v122 = v121;
  switch (v119) {
    case 0:
      {
      int v123 = 12;
      int v124 = v123 + v110;
      int v125 = v109[v124];
      int v126 = 2;
      int v127;
      v127 = v126;
      switch (v125) {
        case 0:
          {
          int v128 = 16;
          int v129 = v128 + v110;
          int v130 = v109[v129];
          int v131 = 0;
          bool v132 = v130 != v131;
          int v133;
          if (v132) {
            v133 = v110;
          } else {
            v133 = v110;
          }
          v127 = v133;
          break;
        }
        default:
          {
          int v134 = 20;
          int v135 = v134 + v110;
          int v136 = v109[v135];
          int v137;
          v137 = v110;
          switch (v136) {
            case 0:
              {
              v137 = v110;
              break;
            }
            case 1:
              {
              v137 = v110;
              break;
            }
            default:
              {
              int v138 = 3;
              v137 = v138;
              break;
            }
            case 2:
              {
              v137 = v110;
              break;
            }
          }
          v127 = v137;
        }
        case 1:
          {
          int v139 = 24;
          int v140 = v139 + v110;
          int v141 = v109[v140];
          int v142 = 2;
          int v143;
          v143 = v142;
          switch (v141) {
            case 0:
              {
              v143 = v110;
              break;
            }
            case 1:
              {
              int v144 = 1;
              int v145 = v110 + v144;
              v143 = v145;
              break;
            }
            default:
              {
              int v146 = 4;
              int v147 = v110 + v146;
              v143 = v147;
              break;
            }
          }
          bool v148 = true;
          v127 = v143;
          break;
        }
      }
      v122 = v127;
      break;
    }
    case 1:
      {
      int v149 = 0;
      int v150 = 0;
      int v151;
      int v152;
      v151 = v149;
      v152 = v150;
      while (true) {
        int v153 = 4;
        int v154 = v152 * v153;
        int v155 = v154 + v110;
        int v156 = 28;
        int v157 = v156 + v155;
        int v158 = v109[v157];
        int v159 = 0;
        bool v160 = v158 != v159;
        v151 = v151;
        v152 = v152;
        if (!v160) break;
        int v161 = v151 + v152;
        int v162 = 1;
        int v163 = v152 + v162;
        bool v164 = true;
        v151 = v161;
        v152 = v163;
        break;
        ;
      }
      v122 = v151;
      break;
    }
    default:
      {
      int v165 = 48;
      int v166 = v165 + v110;
      int v167 = v109[v166];
      int v168;
      v168 = v110;
      switch (v167) {
        default:
          {
          int v169 = 0;
          int v170 = 0;
          int v171;
          int v172;
          v171 = v169;
          v172 = v170;
          while (true) {
            int v173 = 4;
            int v174 = v172 * v173;
            int v175 = v174 + v110;
            int v176 = 52;
            int v177 = v176 + v175;
            int v178 = v109[v177];
            int v179 = 0;
            bool v180 = v178 != v179;
            v171 = v171;
            v172 = v172;
            if (!v180) break;
            int v181 = v171 + v172;
            int v182 = 1;
            int v183 = v172 + v182;
            bool v184 = true;
            v171 = v181;
            v172 = v183;
          }
          v168 = v171;
          break;
        }
        case 0:
          {
          int v185 = 72;
          int v186 = v185 + v110;
          int v187 = v109[v186];
          int v188 = 0;
          bool v189 = v187 != v188;
          int v190;
          if (v189) {
            int v191 = 0;
            v190 = v191;
          } else {
            v190 = v110;
          }
          v168 = v190;
          break;
        }
        case 1:
          {
          int v192 = 76;
          int v193 = v192 + v110;
          int v194 = v109[v193];
          int v195 = 0;
          int v196 = v110 + v195;
          int v197;
          v197 = v196;
          switch (v194) {
            case 0:
              {
              v197 = v110;
              break;
            }
            default:
              {
              v197 = v110;
              break;
            }
            case 1:
              {
              int v198 = 2;
              v197 = v198;
              break;
            }
          }
          v168 = v197;
          break;
        }
        case 2:
          {
          int v199 = 80;
          int v200 = v199 + v110;
          int v201 = v109[v200];
          int v202 = 0;
          bool v203 = v201 != v202;
          int v204;
          if (v203) {
            int v205 = 0;
            int v206 = v110 + v205;
            v204 = v206;
          } else {
            v204 = v110;
          }
          v168 = v204;
          break;
        }
      }
      v122 = v168;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 29; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
