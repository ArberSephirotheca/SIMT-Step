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
  int v4 = 2;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11 = 1;
      int v12;
      v12 = v11;
      switch (v10) {
        case 0:
          {
          int v13 = 0;
          bool v14 = v2 != v13;
          int v15;
          if (v14) {
            int v16 = 3;
            int v17 = v0 + v16;
            v15 = v17;
          } else {
            int v18 = 2;
            v15 = v18;
          }
          v12 = v15;
        }
        case 1:
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
          v12 = v21;
        }
        case 2:
          {
          int v31 = 0;
          bool v32 = v2 != v31;
          int v33;
          if (v32) {
            int v34 = 0;
            int v35 = v0 + v34;
            v33 = v35;
          } else {
            v33 = v0;
          }
          v12 = v33;
        }
        default:
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
            int v45 = 3;
            int v46 = v0 + v45;
            int v47 = 1;
            int v48 = v39 + v47;
            v38 = v46;
            v39 = v48;
          }
          v12 = v38;
          break;
        }
      }
      int v49 = 1;
      int v50 = v0 + v49;
      v8 = v12;
      break;
    }
    default:
      {
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
        continue;
        ;
      }
      v8 = v53;
      break;
    }
    case 1:
      {
      int v63 = 0;
      bool v64 = v2 != v63;
      int v65;
      if (v64) {
        int v66 = 2;
        int v67 = v3 % v66;
        int v68;
        v68 = v0;
        switch (v67) {
          case 0:
            {
            int v69 = 4;
            v68 = v69;
            break;
          }
          default:
            {
            v68 = v0;
            break;
          }
          case 1:
            {
            int v70 = 1;
            int v71 = v0 + v70;
            v68 = v71;
            break;
          }
        }
        v65 = v68;
      } else {
        v65 = v0;
      }
      v8 = v65;
      break;
    }
  }
  bool v72 = true;
  int v73 = simt_wave_count_bits(v72);
  int v74 = 0;
  int v75 = v74 + v0;
  v1[v75] = v73;
  return;
}

kernel void kernel_main(device int* v76 [[buffer(0)]], device int* v77 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v78 = static_cast<int>(__simt_tid3.x);
  int v79 = 0;
  int v80 = v79 + v78;
  int v81 = v77[v80];
  int v82 = 4;
  int v83 = v82 + v78;
  int v84 = v77[v83];
  helper0(v78, v76, v81, v84, static_cast<int>(__simt_tid3.x));
  int v85 = 0;
  int v86 = 0;
  int v87;
  int v88;
  v87 = v85;
  v88 = v86;
  while (true) {
    int v89 = 4;
    int v90 = v88 * v89;
    int v91 = v90 + v78;
    int v92 = 8;
    int v93 = v92 + v91;
    int v94 = v77[v93];
    int v95 = 0;
    bool v96 = v94 != v95;
    v87 = v87;
    v88 = v88;
    if (!v96) break;
    int v97 = 4;
    int v98 = v78 + v97;
    int v99 = v87 + v98;
    int v100 = 1;
    int v101 = v88 + v100;
    bool v102 = true;
    int v103 = 16;
    int v104 = 4;
    int v105 = v88 * v104;
    int v106 = v103 + v105;
    int v107 = v106 + v78;
    bool v108 = true;
    int v109 = simt_wave_count_bits(v108);
    v76[v107] = v109;
    v87 = v99;
    v88 = v101;
  }
  int v110 = 28;
  int v111 = v110 + v78;
  int v112 = v77[v111];
  int v113;
  v113 = v78;
  switch (v112) {
    default:
      {
      int v114 = 32;
      int v115 = v114 + v78;
      int v116 = v77[v115];
      int v117 = 0;
      bool v118 = v116 != v117;
      int v119;
      if (v118) {
        int v120 = 36;
        int v121 = v120 + v78;
        int v122 = v77[v121];
        int v123 = 0;
        bool v124 = v122 != v123;
        int v125;
        if (v124) {
          v125 = v78;
        } else {
          int v126 = 2;
          int v127 = v78 + v126;
          v125 = v127;
        }
        v119 = v125;
      } else {
        int v128 = 0;
        int v129 = 0;
        int v130;
        int v131;
        v130 = v128;
        v131 = v129;
        while (true) {
          int v132 = 4;
          int v133 = v131 * v132;
          int v134 = v133 + v78;
          int v135 = 40;
          int v136 = v135 + v134;
          int v137 = v77[v136];
          int v138 = 0;
          bool v139 = v137 != v138;
          v130 = v130;
          v131 = v131;
          if (!v139) break;
          int v140 = v130 + v131;
          int v141 = 1;
          int v142 = v131 + v141;
          bool v143 = true;
          v130 = v140;
          v131 = v142;
        }
        v119 = v130;
      }
      v113 = v119;
      break;
    }
    case 0:
      {
      int v144 = 0;
      int v145 = 0;
      int v146;
      int v147;
      v146 = v144;
      v147 = v145;
      while (true) {
        int v148 = 4;
        int v149 = v147 * v148;
        int v150 = v149 + v78;
        int v151 = 60;
        int v152 = v151 + v150;
        int v153 = v77[v152];
        int v154 = 0;
        bool v155 = v153 != v154;
        v146 = v146;
        v147 = v147;
        if (!v155) break;
        int v156 = 0;
        int v157 = 0;
        int v158;
        int v159;
        v158 = v156;
        v159 = v157;
        while (true) {
          int v160 = 4;
          int v161 = v159 * v160;
          int v162 = v161 + v78;
          int v163 = 80;
          int v164 = v163 + v162;
          int v165 = v77[v164];
          int v166 = 0;
          bool v167 = v165 != v166;
          v158 = v158;
          v159 = v159;
          if (!v167) break;
          int v168 = v158 + v159;
          int v169 = 1;
          int v170 = v159 + v169;
          bool v171 = true;
          v158 = v168;
          v159 = v170;
        }
        int v172 = v146 + v158;
        int v173 = 1;
        int v174 = v147 + v173;
        bool v175 = true;
        v146 = v172;
        v147 = v174;
        continue;
        ;
      }
      v113 = v146;
      break;
    }
    case 1:
      {
      int v176 = 100;
      int v177 = v176 + v78;
      int v178 = v77[v177];
      int v179;
      v179 = v78;
      switch (v178) {
        default:
          {
          int v180 = 2;
          v179 = v180;
          break;
        }
        case 0:
          {
          v179 = v78;
          break;
        }
        case 1:
          {
          int v181 = 104;
          int v182 = v181 + v78;
          int v183 = v77[v182];
          int v184 = 1;
          int v185 = v78 + v184;
          int v186;
          v186 = v185;
          switch (v183) {
            default:
              {
              int v187 = 4;
              v186 = v187;
              break;
            }
            case 0:
              {
              int v188 = 2;
              v186 = v188;
              break;
            }
            case 1:
              {
              v186 = v78;
              break;
            }
            case 2:
              {
              v186 = v78;
              break;
            }
          }
          v179 = v186;
          break;
        }
      }
      v113 = v179;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 27; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
