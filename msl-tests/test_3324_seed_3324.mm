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
    int v7 = 2;
    v6 = v7;
  } else {
    v6 = v0;
  }
  bool v8 = true;
  int v9 = simt_wave_count_bits(v8);
  int v10 = 0;
  int v11 = v10 + v0;
  v1[v11] = v9;
  int v12 = 3;
  int v13 = v3 % v12;
  uint v14 = simt_subgroup_id(__simt_tid);
  int v15 = (int)(v14);
  int v16;
  v16 = v15;
  switch (v13) {
    default:
      {
      int v17 = 2;
      int v18 = v3 % v17;
      int v19 = 4;
      int v20 = v0 + v19;
      int v21;
      v21 = v20;
      switch (v18) {
        case 0:
          {
          int v22 = 0;
          bool v23 = v2 != v22;
          int v24;
          if (v23) {
            int v25 = 2;
            v24 = v25;
          } else {
            int v26 = 2;
            int v27 = v0 + v26;
            v24 = v27;
          }
          int v28 = 4;
          v21 = v24;
          break;
        }
        default:
          {
          int v29 = 0;
          int v30 = 0;
          int v31;
          int v32;
          v31 = v29;
          v32 = v30;
          while (true) {
            int v33 = 4;
            int v34 = v3 % v33;
            int v35 = 1;
            int v36 = v34 + v35;
            bool v37 = v32 < v36;
            v31 = v31;
            v32 = v32;
            if (!v37) break;
            int v38 = 1;
            int v39 = v32 + v38;
            v31 = v0;
            v32 = v39;
            continue;
            ;
          }
          v21 = v31;
          break;
        }
      }
      v16 = v21;
      break;
    }
    case 0:
      {
      int v40 = 3;
      int v41 = v3 % v40;
      int v42;
      v42 = v0;
      switch (v41) {
        case 0:
          {
          int v43 = 3;
          int v44 = v3 % v43;
          int v45 = 4;
          int v46 = v0 + v45;
          int v47;
          v47 = v46;
          switch (v44) {
            case 0:
              {
              v47 = v0;
              break;
            }
            case 1:
              {
              int v48 = 0;
              int v49 = v0 + v48;
              v47 = v49;
              break;
            }
            default:
              {
              int v50 = 1;
              int v51 = v0 + v50;
              v47 = v51;
            }
            case 2:
              {
              int v52 = 0;
              v47 = v52;
              break;
            }
          }
          v42 = v47;
          break;
        }
        case 1:
          {
          int v53 = 0;
          bool v54 = v2 != v53;
          int v55;
          if (v54) {
            v55 = v0;
          } else {
            int v56 = 0;
            int v57 = v0 + v56;
            v55 = v57;
          }
          int v58 = 3;
          int v59 = v0 + v58;
          v42 = v55;
          break;
        }
        default:
          {
          int v60 = 0;
          bool v61 = v2 != v60;
          int v62;
          if (v61) {
            v62 = v0;
          } else {
            int v63 = 1;
            int v64 = v0 + v63;
            v62 = v64;
          }
          int v65 = 4;
          v42 = v62;
          break;
        }
        case 2:
          {
          int v66 = 3;
          int v67 = v3 % v66;
          int v68 = 2;
          int v69 = v0 + v68;
          int v70;
          v70 = v69;
          switch (v67) {
            case 0:
              {
              v70 = v0;
            }
            default:
              {
              v70 = v0;
            }
            case 1:
              {
              v70 = v0;
              break;
            }
            case 2:
              {
              int v71 = 3;
              v70 = v71;
              break;
            }
          }
          int v72 = 3;
          int v73 = v0 + v72;
          v42 = v70;
          break;
        }
      }
      v16 = v42;
      break;
    }
    case 1:
      {
      int v74;
      v74 = v0;
      switch (v3) {
        case 0:
          {
          int v75 = 0;
          int v76 = 0;
          int v77;
          int v78;
          v77 = v75;
          v78 = v76;
          while (true) {
            int v79 = 4;
            int v80 = v3 % v79;
            int v81 = 1;
            int v82 = v80 + v81;
            bool v83 = v78 < v82;
            v77 = v77;
            v78 = v78;
            if (!v83) break;
            int v84 = 1;
            int v85 = v78 + v84;
            v77 = v0;
            v78 = v85;
          }
          int v86 = 2;
          v74 = v77;
          break;
        }
        default:
          {
          int v87 = 0;
          int v88 = 0;
          int v89;
          int v90;
          v89 = v87;
          v90 = v88;
          while (true) {
            int v91 = 4;
            int v92 = v3 % v91;
            int v93 = 1;
            int v94 = v92 + v93;
            bool v95 = v90 < v94;
            v89 = v89;
            v90 = v90;
            if (!v95) break;
            int v96 = 1;
            int v97 = v90 + v96;
            v89 = v0;
            v90 = v97;
            continue;
            ;
          }
          int v98 = 3;
          int v99 = v0 + v98;
          v74 = v89;
          break;
        }
      }
      int v100 = 1;
      v16 = v74;
      break;
    }
  }
  bool v101 = true;
  int v102 = simt_wave_count_bits(v101);
  int v103 = 16;
  int v104 = v103 + v0;
  v1[v104] = v102;
  int v105 = 0;
  bool v106 = v2 != v105;
  int v107 = v106 ? v6 : v16;
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
  int v117 = 1;
  int v118 = v110 + v117;
  int v119 = 8;
  int v120 = v119 + v110;
  int v121 = v109[v120];
  uint v122 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v123 = (int)(v122);
  int v124;
  v124 = v123;
  switch (v121) {
    default:
      {
      int v125 = 12;
      int v126 = v125 + v110;
      int v127 = v109[v126];
      int v128 = 0;
      bool v129 = v127 != v128;
      int v130;
      if (v129) {
        int v131 = 3;
        v130 = v131;
      } else {
        int v132 = 0;
        int v133 = 0;
        int v134;
        int v135;
        v134 = v132;
        v135 = v133;
        while (true) {
          int v136 = 4;
          int v137 = v135 * v136;
          int v138 = v137 + v110;
          int v139 = 16;
          int v140 = v139 + v138;
          int v141 = v109[v140];
          int v142 = 0;
          bool v143 = v141 != v142;
          v134 = v134;
          v135 = v135;
          if (!v143) break;
          int v144 = v134 + v135;
          int v145 = 1;
          int v146 = v135 + v145;
          v134 = v144;
          v135 = v146;
        }
        bool v147 = true;
        v130 = v134;
      }
      v124 = v130;
    }
    case 0:
      {
      v124 = v110;
      break;
    }
  }
  bool v148 = true;
  int v149 = 32;
  int v150 = v149 + v110;
  bool v151 = true;
  int v152 = simt_wave_count_bits(v151);
  v108[v150] = v152;
  int v153 = 36;
  int v154 = v153 + v110;
  int v155 = v109[v154];
  uint v156 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v157 = (int)(v156);
  int v158;
  v158 = v157;
  switch (v155) {
    default:
      {
      int v159 = 0;
      int v160 = 0;
      int v161;
      int v162;
      v161 = v159;
      v162 = v160;
      while (true) {
        int v163 = 4;
        int v164 = v162 * v163;
        int v165 = v164 + v110;
        int v166 = 40;
        int v167 = v166 + v165;
        int v168 = v109[v167];
        int v169 = 0;
        bool v170 = v168 != v169;
        v161 = v161;
        v162 = v162;
        if (!v170) break;
        int v171 = 60;
        int v172 = v171 + v110;
        int v173 = v109[v172];
        int v174;
        v174 = v110;
        switch (v173) {
          case 0:
            {
            v174 = v110;
            break;
          }
          case 1:
            {
            int v175 = 2;
            v174 = v175;
            break;
          }
          case 2:
            {
            int v176 = 1;
            v174 = v176;
            break;
          }
          default:
            {
            int v177 = 2;
            int v178 = v110 + v177;
            v174 = v178;
            break;
          }
        }
        bool v179 = true;
        int v180 = v161 + v174;
        int v181 = 1;
        int v182 = v162 + v181;
        v161 = v180;
        v162 = v182;
      }
      bool v183 = true;
      v158 = v161;
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
        int v190 = v189 + v110;
        int v191 = 64;
        int v192 = v191 + v190;
        int v193 = v109[v192];
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
        break;
        ;
      }
      bool v199 = true;
      v158 = v186;
      break;
    }
  }
  bool v200 = true;
  int v201 = 48;
  int v202 = v201 + v110;
  bool v203 = true;
  int v204 = simt_wave_count_bits(v203);
  v108[v202] = v204;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
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
