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
  int v6 = 3;
  int v7 = v3 % v6;
  uint v8 = simt_lane_id(__simt_tid);
  int v9 = (int)(v8);
  int v10;
  v10 = v9;
  switch (v7) {
    case 0:
      {
      int v11 = 2;
      int v12 = v3 % v11;
      int v13 = 3;
      int v14;
      v14 = v13;
      switch (v12) {
        case 0:
          {
          int v15 = 0;
          int v16 = 0;
          int v17;
          int v18;
          v17 = v15;
          v18 = v16;
          while (true) {
            int v19 = 4;
            int v20 = v3 % v19;
            int v21 = 1;
            int v22 = v20 + v21;
            bool v23 = v18 < v22;
            v17 = v17;
            v18 = v18;
            if (!v23) break;
            int v24 = 1;
            int v25 = 1;
            int v26 = v18 + v25;
            v17 = v24;
            v18 = v26;
          }
          int v27 = 3;
          int v28 = v0 + v27;
          v14 = v17;
          break;
        }
        case 1:
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
            int v38 = 4;
            int v39 = v0 + v38;
            int v40 = 1;
            int v41 = v32 + v40;
            v31 = v39;
            v32 = v41;
          }
          v14 = v31;
          break;
        }
        default:
          {
          int v42 = 0;
          bool v43 = v2 != v42;
          int v44;
          if (v43) {
            int v45 = 3;
            int v46 = v0 + v45;
            v44 = v46;
          } else {
            int v47 = 2;
            v44 = v47;
          }
          int v48 = 4;
          v14 = v44;
          break;
        }
      }
      int v49 = 0;
      int v50 = v0 + v49;
      v10 = v14;
      break;
    }
    case 1:
      {
      int v51 = 0;
      bool v52 = v2 != v51;
      int v53;
      if (v52) {
        int v54 = 0;
        int v55 = 0;
        int v56;
        int v57;
        v56 = v54;
        v57 = v55;
        while (true) {
          int v58 = 4;
          int v59 = v3 % v58;
          int v60 = 1;
          int v61 = v59 + v60;
          bool v62 = v57 < v61;
          v56 = v56;
          v57 = v57;
          if (!v62) break;
          int v63 = 4;
          int v64 = v0 + v63;
          int v65 = 1;
          int v66 = v57 + v65;
          v56 = v64;
          v57 = v66;
          continue;
          ;
        }
        v53 = v56;
      } else {
        int v67 = 0;
        int v68 = 0;
        int v69;
        int v70;
        v69 = v67;
        v70 = v68;
        while (true) {
          int v71 = 4;
          int v72 = v3 % v71;
          int v73 = 1;
          int v74 = v72 + v73;
          bool v75 = v70 < v74;
          v69 = v69;
          v70 = v70;
          if (!v75) break;
          int v76 = 1;
          int v77 = v70 + v76;
          v69 = v0;
          v70 = v77;
        }
        int v78 = 0;
        int v79 = v0 + v78;
        v53 = v69;
      }
      int v80 = 4;
      int v81 = v0 + v80;
      v10 = v53;
      break;
    }
    default:
      {
      int v82 = 2;
      int v83 = v3 % v82;
      int v84 = 0;
      int v85 = v0 + v84;
      int v86;
      v86 = v85;
      switch (v83) {
        default:
          {
          int v87 = 4;
          int v88 = v0 + v87;
          v86 = v88;
          break;
        }
        case 0:
          {
          int v89 = 0;
          bool v90 = v2 != v89;
          int v91;
          if (v90) {
            v91 = v0;
          } else {
            int v92 = 1;
            v91 = v92;
          }
          v86 = v91;
          break;
        }
      }
      int v93 = 3;
      v10 = v86;
      break;
    }
    case 2:
      {
      int v94 = 0;
      bool v95 = v2 != v94;
      int v96;
      if (v95) {
        int v97 = 0;
        bool v98 = v2 != v97;
        int v99;
        if (v98) {
          v99 = v0;
        } else {
          v99 = v0;
        }
        int v100 = 3;
        v96 = v99;
      } else {
        int v101 = 0;
        int v102 = v0 + v101;
        v96 = v102;
      }
      int v103 = 2;
      v10 = v96;
      break;
    }
  }
  bool v104 = true;
  int v105 = simt_wave_count_bits(v104);
  int v106 = 0;
  int v107 = v106 + v0;
  v1[v107] = v105;
  int v108 = 0;
  bool v109 = v2 != v108;
  int v110 = v109 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v111 [[buffer(0)]], device int* v112 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v113 = static_cast<int>(__simt_tid3.x);
  int v114 = 0;
  int v115 = v114 + v113;
  int v116 = v112[v115];
  int v117 = 4;
  int v118 = v117 + v113;
  int v119 = v112[v118];
  helper0(v113, v111, v116, v119, static_cast<int>(__simt_tid3.x));
  int v120 = 2;
  int v121 = 8;
  int v122 = v121 + v113;
  int v123 = v112[v122];
  int v124 = 4;
  int v125 = v113 + v124;
  int v126;
  v126 = v125;
  switch (v123) {
    case 0:
      {
      int v127 = 12;
      int v128 = v127 + v113;
      int v129 = v112[v128];
      int v130;
      v130 = v113;
      switch (v129) {
        default:
          {
          int v131 = 16;
          int v132 = v131 + v113;
          int v133 = v112[v132];
          int v134 = 0;
          int v135 = v113 + v134;
          int v136;
          v136 = v135;
          switch (v133) {
            default:
              {
              int v137 = 2;
              int v138 = v113 + v137;
              v136 = v138;
              break;
            }
            case 0:
              {
              v136 = v113;
              break;
            }
            case 1:
              {
              int v139 = 0;
              v136 = v139;
              break;
            }
            case 2:
              {
              int v140 = 2;
              int v141 = v113 + v140;
              v136 = v141;
              break;
            }
          }
          bool v142 = true;
          v130 = v136;
          break;
        }
        case 0:
          {
          int v143 = 4;
          int v144 = v113 + v143;
          v130 = v144;
          break;
        }
      }
      bool v145 = true;
      v126 = v130;
    }
    case 1:
      {
      int v146 = 3;
      v126 = v146;
    }
    case 2:
      {
      int v147 = 20;
      int v148 = v147 + v113;
      int v149 = v112[v148];
      int v150 = 0;
      bool v151 = v149 != v150;
      int v152;
      if (v151) {
        int v153 = 24;
        int v154 = v153 + v113;
        int v155 = v112[v154];
        int v156;
        v156 = v113;
        switch (v155) {
          default:
            {
            int v157 = 4;
            int v158 = v113 + v157;
            v156 = v158;
            break;
          }
          case 0:
            {
            int v159 = 4;
            int v160 = v113 + v159;
            v156 = v160;
            break;
          }
          case 1:
            {
            int v161 = 3;
            int v162 = v113 + v161;
            v156 = v162;
            break;
          }
          case 2:
            {
            int v163 = 2;
            int v164 = v113 + v163;
            v156 = v164;
            break;
          }
        }
        bool v165 = true;
        v152 = v156;
      } else {
        int v166 = 28;
        int v167 = v166 + v113;
        int v168 = v112[v167];
        int v169 = 0;
        bool v170 = v168 != v169;
        int v171;
        if (v170) {
          v171 = v113;
        } else {
          v171 = v113;
        }
        v152 = v171;
      }
      v126 = v152;
      break;
    }
    default:
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
        int v178 = v177 + v113;
        int v179 = 32;
        int v180 = v179 + v178;
        int v181 = v112[v180];
        int v182 = 0;
        bool v183 = v181 != v182;
        v174 = v174;
        v175 = v175;
        if (!v183) break;
        int v184 = 52;
        int v185 = v184 + v113;
        int v186 = v112[v185];
        int v187 = 2;
        int v188;
        v188 = v187;
        switch (v186) {
          case 0:
            {
            int v189 = 3;
            int v190 = v113 + v189;
            v188 = v190;
            break;
          }
          case 1:
            {
            int v191 = 2;
            v188 = v191;
            break;
          }
          case 2:
            {
            v188 = v113;
            break;
          }
          default:
            {
            int v192 = 4;
            int v193 = v113 + v192;
            v188 = v193;
            break;
          }
        }
        bool v194 = true;
        int v195 = v174 + v188;
        int v196 = 1;
        int v197 = v175 + v196;
        v174 = v195;
        v175 = v197;
      }
      bool v198 = true;
      v126 = v174;
      break;
    }
  }
  bool v199 = true;
  int v200 = 16;
  int v201 = v200 + v113;
  bool v202 = true;
  int v203 = simt_wave_count_bits(v202);
  v111[v201] = v203;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
