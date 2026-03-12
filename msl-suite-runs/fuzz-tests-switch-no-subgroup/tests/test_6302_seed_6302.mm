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
    bool v7 = true;
    int v8 = simt_wave_count_bits(v7);
    int v9 = 0;
    int v10 = v9 + v0;
    v1[v10] = v8;
    v6 = v8;
  } else {
    bool v11 = true;
    int v12 = simt_wave_count_bits(v11);
    int v13 = 16;
    int v14 = v13 + v0;
    v1[v14] = v12;
    v6 = v12;
  }
  int v15 = 2;
  int v16 = v3 % v15;
  uint v17 = simt_subgroup_id(__simt_tid);
  int v18 = (int)(v17);
  int v19;
  v19 = v18;
  switch (v16) {
    default:
      {
      int v20 = 3;
      int v21 = v3 % v20;
      int v22 = 0;
      int v23 = v0 + v22;
      int v24;
      v24 = v23;
      switch (v21) {
        case 0:
          {
          int v25 = 0;
          int v26 = 0;
          int v27;
          int v28;
          v27 = v25;
          v28 = v26;
          while (true) {
            int v29 = 4;
            int v30 = v3 % v29;
            int v31 = 1;
            int v32 = v30 + v31;
            bool v33 = v28 < v32;
            v27 = v27;
            v28 = v28;
            if (!v33) break;
            int v34 = 1;
            int v35 = v0 + v34;
            int v36 = 1;
            int v37 = v28 + v36;
            v27 = v35;
            v28 = v37;
          }
          v24 = v27;
          break;
        }
        case 1:
          {
          int v38 = 1;
          int v39 = v0 + v38;
          v24 = v39;
          break;
        }
        default:
          {
          int v40 = 0;
          int v41 = 0;
          int v42;
          int v43;
          v42 = v40;
          v43 = v41;
          while (true) {
            int v44 = 4;
            int v45 = v3 % v44;
            int v46 = 1;
            int v47 = v45 + v46;
            bool v48 = v43 < v47;
            v42 = v42;
            v43 = v43;
            if (!v48) break;
            int v49 = 0;
            int v50 = 1;
            int v51 = v43 + v50;
            v42 = v49;
            v43 = v51;
          }
          v24 = v42;
          break;
        }
        case 2:
          {
          int v52 = 0;
          bool v53 = v2 != v52;
          int v54;
          if (v53) {
            int v55 = 1;
            v54 = v55;
          } else {
            v54 = v0;
          }
          v24 = v54;
          break;
        }
      }
      v19 = v24;
      break;
    }
    case 0:
      {
      int v56 = 4;
      int v57 = v3 % v56;
      int v58 = 0;
      int v59 = v0 + v58;
      int v60;
      v60 = v59;
      switch (v57) {
        case 0:
          {
          v60 = v0;
          break;
        }
        case 1:
          {
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
            continue;
            ;
          }
          v60 = v63;
          break;
        }
        default:
          {
          v60 = v0;
          break;
        }
        case 2:
          {
          v60 = v0;
          break;
        }
      }
      v19 = v60;
      break;
    }
  }
  int v72 = 0;
  bool v73 = v2 != v72;
  int v74 = v73 ? v6 : v19;
  return;
}

kernel void kernel_main(device int* v75 [[buffer(0)]], device int* v76 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v77 = static_cast<int>(__simt_tid3.x);
  int v78 = 0;
  int v79 = v78 + v77;
  int v80 = v76[v79];
  int v81 = 4;
  int v82 = v81 + v77;
  int v83 = v76[v82];
  helper0(v77, v75, v80, v83, static_cast<int>(__simt_tid3.x));
  int v84 = 8;
  int v85 = v84 + v77;
  int v86 = v76[v85];
  int v87;
  v87 = v77;
  switch (v86) {
    case 0:
      {
      int v88 = 0;
      int v89 = 0;
      int v90;
      int v91;
      v90 = v88;
      v91 = v89;
      while (true) {
        int v92 = 4;
        int v93 = v91 * v92;
        int v94 = v93 + v77;
        int v95 = 12;
        int v96 = v95 + v94;
        int v97 = v76[v96];
        int v98 = 0;
        bool v99 = v97 != v98;
        v90 = v90;
        v91 = v91;
        if (!v99) break;
        int v100 = v90 + v91;
        int v101 = 1;
        int v102 = v91 + v101;
        bool v103 = true;
        v90 = v100;
        v91 = v102;
      }
      v87 = v90;
      break;
    }
    case 1:
      {
      int v104 = 0;
      int v105 = 0;
      int v106;
      int v107;
      v106 = v104;
      v107 = v105;
      while (true) {
        int v108 = 4;
        int v109 = v107 * v108;
        int v110 = v109 + v77;
        int v111 = 32;
        int v112 = v111 + v110;
        int v113 = v76[v112];
        int v114 = 0;
        bool v115 = v113 != v114;
        v106 = v106;
        v107 = v107;
        if (!v115) break;
        int v116 = v106 + v107;
        int v117 = 1;
        int v118 = v107 + v117;
        bool v119 = true;
        v106 = v116;
        v107 = v118;
        continue;
        ;
      }
      v87 = v106;
    }
    case 2:
      {
      int v120 = 52;
      int v121 = v120 + v77;
      int v122 = v76[v121];
      int v123;
      v123 = v77;
      switch (v122) {
        case 0:
          {
          int v124 = 56;
          int v125 = v124 + v77;
          int v126 = v76[v125];
          int v127;
          v127 = v77;
          switch (v126) {
            case 0:
              {
              int v128 = 3;
              int v129 = v77 + v128;
              v127 = v129;
              break;
            }
            case 1:
              {
              int v130 = 3;
              v127 = v130;
              break;
            }
            default:
              {
              int v131 = 0;
              v127 = v131;
              break;
            }
          }
          v123 = v127;
          break;
        }
        default:
          {
          int v132 = 60;
          int v133 = v132 + v77;
          int v134 = v76[v133];
          int v135 = 2;
          int v136;
          v136 = v135;
          switch (v134) {
            case 0:
              {
              int v137 = 2;
              v136 = v137;
            }
            default:
              {
              int v138 = 3;
              v136 = v138;
              break;
            }
          }
          v123 = v136;
          break;
        }
      }
      v87 = v123;
    }
    default:
      {
      int v139 = 64;
      int v140 = v139 + v77;
      int v141 = v76[v140];
      int v142 = 4;
      int v143;
      v143 = v142;
      switch (v141) {
        default:
          {
          int v144 = 68;
          int v145 = v144 + v77;
          int v146 = v76[v145];
          int v147 = 0;
          bool v148 = v146 != v147;
          int v149;
          if (v148) {
            int v150 = 0;
            int v151 = v77 + v150;
            v149 = v151;
          } else {
            v149 = v77;
          }
          v143 = v149;
          break;
        }
        case 0:
          {
          v143 = v77;
          break;
        }
      }
      v87 = v143;
      break;
    }
  }
  int v152 = 72;
  int v153 = v152 + v77;
  int v154 = v76[v153];
  int v155 = 3;
  int v156;
  v156 = v155;
  switch (v154) {
    default:
      {
      int v157 = 0;
      int v158 = 0;
      int v159;
      int v160;
      v159 = v157;
      v160 = v158;
      while (true) {
        int v161 = 4;
        int v162 = v160 * v161;
        int v163 = v162 + v77;
        int v164 = 76;
        int v165 = v164 + v163;
        int v166 = v76[v165];
        int v167 = 0;
        bool v168 = v166 != v167;
        v159 = v159;
        v160 = v160;
        if (!v168) break;
        int v169 = 96;
        int v170 = v169 + v77;
        int v171 = v76[v170];
        int v172 = 0;
        bool v173 = v171 != v172;
        int v174;
        if (v173) {
          int v175 = 3;
          v174 = v175;
        } else {
          int v176 = 1;
          v174 = v176;
        }
        int v177 = v159 + v174;
        int v178 = 1;
        int v179 = v160 + v178;
        bool v180 = true;
        v159 = v177;
        v160 = v179;
        break;
        ;
      }
      v156 = v159;
      break;
    }
    case 0:
      {
      int v181 = 100;
      int v182 = v181 + v77;
      int v183 = v76[v182];
      int v184 = 0;
      bool v185 = v183 != v184;
      int v186;
      if (v185) {
        int v187 = 104;
        int v188 = v187 + v77;
        int v189 = v76[v188];
        int v190 = 0;
        bool v191 = v189 != v190;
        int v192;
        if (v191) {
          int v193 = 3;
          v192 = v193;
        } else {
          v192 = v77;
        }
        v186 = v192;
      } else {
        int v194 = 108;
        int v195 = v194 + v77;
        int v196 = v76[v195];
        int v197 = 1;
        int v198;
        v198 = v197;
        switch (v196) {
          case 0:
            {
            int v199 = 0;
            int v200 = v77 + v199;
            v198 = v200;
            break;
          }
          case 1:
            {
            int v201 = 1;
            v198 = v201;
            break;
          }
          default:
            {
            int v202 = 4;
            v198 = v202;
            break;
          }
        }
        v186 = v198;
      }
      v156 = v186;
      break;
    }
  }
  uint v203 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v204 = (int)(v203);
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
    static int32_t expected0[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
