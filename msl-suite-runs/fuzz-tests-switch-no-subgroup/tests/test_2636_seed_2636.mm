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
  int v8 = 4;
  int v9 = v3 % v8;
  int v10 = 1;
  int v11 = v0 + v10;
  int v12;
  v12 = v11;
  switch (v9) {
    case 0:
      {
      int v13 = 3;
      v12 = v13;
      break;
    }
    case 1:
      {
      int v14 = 0;
      bool v15 = v2 != v14;
      int v16;
      if (v15) {
        int v17 = 3;
        int v18 = v3 % v17;
        int v19 = 2;
        int v20;
        v20 = v19;
        switch (v18) {
          default:
            {
            v20 = v0;
            break;
          }
          case 0:
            {
            int v21 = 3;
            int v22 = v0 + v21;
            v20 = v22;
            break;
          }
          case 1:
            {
            int v23 = 3;
            v20 = v23;
            break;
          }
        }
        v16 = v20;
      } else {
        int v24 = 0;
        int v25 = 0;
        int v26;
        int v27;
        v26 = v24;
        v27 = v25;
        while (true) {
          int v28 = 4;
          int v29 = v3 % v28;
          int v30 = 1;
          int v31 = v29 + v30;
          bool v32 = v27 < v31;
          v26 = v26;
          v27 = v27;
          if (!v32) break;
          int v33 = 1;
          int v34 = v0 + v33;
          int v35 = 1;
          int v36 = v27 + v35;
          v26 = v34;
          v27 = v36;
        }
        v16 = v26;
      }
      v12 = v16;
      break;
    }
    case 2:
      {
      int v37 = 2;
      int v38 = v3 % v37;
      int v39 = 4;
      int v40 = v0 + v39;
      int v41;
      v41 = v40;
      switch (v38) {
        case 0:
          {
          int v42 = 2;
          int v43 = v0 + v42;
          v41 = v43;
          break;
        }
        default:
          {
          int v44 = 3;
          int v45 = v3 % v44;
          int v46 = 3;
          int v47;
          v47 = v46;
          switch (v45) {
            default:
              {
              v47 = v0;
              break;
            }
            case 0:
              {
              v47 = v0;
              break;
            }
            case 1:
              {
              v47 = v0;
              break;
            }
          }
          v41 = v47;
          break;
        }
        case 1:
          {
          int v48 = 2;
          int v49 = v3 % v48;
          int v50 = 0;
          int v51 = v0 + v50;
          int v52;
          v52 = v51;
          switch (v49) {
            default:
              {
              v52 = v0;
              break;
            }
            case 0:
              {
              int v53 = 2;
              int v54 = v0 + v53;
              v52 = v54;
              break;
            }
          }
          v41 = v52;
          break;
        }
      }
      v12 = v41;
      break;
    }
    default:
      {
      int v55 = 0;
      int v56 = 0;
      int v57;
      int v58;
      v57 = v55;
      v58 = v56;
      while (true) {
        int v59 = 4;
        int v60 = v3 % v59;
        int v61 = 1;
        int v62 = v60 + v61;
        bool v63 = v58 < v62;
        v57 = v57;
        v58 = v58;
        if (!v63) break;
        int v64 = 0;
        int v65 = 0;
        int v66;
        int v67;
        v66 = v64;
        v67 = v65;
        while (true) {
          int v68 = 4;
          int v69 = v3 % v68;
          int v70 = 1;
          int v71 = v69 + v70;
          bool v72 = v67 < v71;
          v66 = v66;
          v67 = v67;
          if (!v72) break;
          int v73 = 0;
          int v74 = v0 + v73;
          int v75 = 1;
          int v76 = v67 + v75;
          v66 = v74;
          v67 = v76;
        }
        int v77 = 1;
        int v78 = v58 + v77;
        v57 = v66;
        v58 = v78;
        continue;
        ;
      }
      v12 = v57;
      break;
    }
  }
  int v79 = 0;
  bool v80 = v2 != v79;
  int v81 = v80 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v82 [[buffer(0)]], device int* v83 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v84 = static_cast<int>(__simt_tid3.x);
  int v85 = 0;
  int v86 = v85 + v84;
  int v87 = v83[v86];
  int v88 = 4;
  int v89 = v88 + v84;
  int v90 = v83[v89];
  helper0(v84, v82, v87, v90, static_cast<int>(__simt_tid3.x));
  int v91 = 1;
  int v92 = 8;
  int v93 = v92 + v84;
  int v94 = v83[v93];
  int v95 = 4;
  int v96 = v84 + v95;
  int v97;
  v97 = v96;
  switch (v94) {
    case 0:
      {
      int v98 = 12;
      int v99 = v98 + v84;
      int v100 = v83[v99];
      int v101 = 0;
      bool v102 = v100 != v101;
      int v103;
      if (v102) {
        int v104 = 16;
        int v105 = v104 + v84;
        int v106 = v83[v105];
        int v107;
        v107 = v84;
        switch (v106) {
          default:
            {
            v107 = v84;
            break;
          }
          case 0:
            {
            int v108 = 4;
            v107 = v108;
            break;
          }
        }
        v103 = v107;
      } else {
        int v109 = 20;
        int v110 = v109 + v84;
        int v111 = v83[v110];
        int v112;
        v112 = v84;
        switch (v111) {
          default:
            {
            int v113 = 2;
            int v114 = v84 + v113;
            v112 = v114;
          }
          case 0:
            {
            v112 = v84;
            break;
          }
        }
        v103 = v112;
      }
      v97 = v103;
      break;
    }
    case 1:
      {
      int v115 = 24;
      int v116 = v115 + v84;
      int v117 = v83[v116];
      int v118 = 0;
      bool v119 = v117 != v118;
      int v120;
      if (v119) {
        int v121 = 0;
        int v122 = 0;
        int v123;
        int v124;
        v123 = v121;
        v124 = v122;
        while (true) {
          int v125 = 4;
          int v126 = v124 * v125;
          int v127 = v126 + v84;
          int v128 = 28;
          int v129 = v128 + v127;
          int v130 = v83[v129];
          int v131 = 0;
          bool v132 = v130 != v131;
          v123 = v123;
          v124 = v124;
          if (!v132) break;
          int v133 = v123 + v124;
          int v134 = 1;
          int v135 = v124 + v134;
          bool v136 = true;
          v123 = v133;
          v124 = v135;
        }
        v120 = v123;
      } else {
        int v137 = 48;
        int v138 = v137 + v84;
        int v139 = v83[v138];
        int v140 = 0;
        bool v141 = v139 != v140;
        int v142;
        if (v141) {
          int v143 = 0;
          v142 = v143;
        } else {
          int v144 = 4;
          int v145 = v84 + v144;
          v142 = v145;
        }
        v120 = v142;
      }
      v97 = v120;
      break;
    }
    default:
      {
      int v146 = 52;
      int v147 = v146 + v84;
      int v148 = v83[v147];
      int v149;
      v149 = v84;
      switch (v148) {
        default:
          {
          int v150 = 56;
          int v151 = v150 + v84;
          int v152 = v83[v151];
          int v153;
          v153 = v84;
          switch (v152) {
            default:
              {
              v153 = v84;
              break;
            }
            case 0:
              {
              int v154 = 4;
              v153 = v154;
              break;
            }
            case 1:
              {
              int v155 = 0;
              int v156 = v84 + v155;
              v153 = v156;
              break;
            }
          }
          v149 = v153;
        }
        case 0:
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
            int v163 = v162 + v84;
            int v164 = 60;
            int v165 = v164 + v163;
            int v166 = v83[v165];
            int v167 = 0;
            bool v168 = v166 != v167;
            v159 = v159;
            v160 = v160;
            if (!v168) break;
            int v169 = v159 + v160;
            int v170 = 1;
            int v171 = v160 + v170;
            bool v172 = true;
            v159 = v169;
            v160 = v171;
          }
          v149 = v159;
          break;
        }
        case 1:
          {
          int v173 = 80;
          int v174 = v173 + v84;
          int v175 = v83[v174];
          int v176 = 4;
          int v177;
          v177 = v176;
          switch (v175) {
            default:
              {
              int v178 = 2;
              v177 = v178;
              break;
            }
            case 0:
              {
              int v179 = 3;
              int v180 = v84 + v179;
              v177 = v180;
              break;
            }
          }
          v149 = v177;
          break;
        }
      }
      v97 = v149;
      break;
    }
    case 2:
      {
      int v181 = 84;
      int v182 = v181 + v84;
      int v183 = v83[v182];
      int v184 = 0;
      bool v185 = v183 != v184;
      int v186;
      if (v185) {
        int v187 = 88;
        int v188 = v187 + v84;
        int v189 = v83[v188];
        int v190;
        v190 = v84;
        switch (v189) {
          case 0:
            {
            int v191 = 2;
            v190 = v191;
            break;
          }
          case 1:
            {
            int v192 = 3;
            v190 = v192;
            break;
          }
          case 2:
            {
            v190 = v84;
            break;
          }
          default:
            {
            int v193 = 3;
            v190 = v193;
            break;
          }
        }
        bool v194 = true;
        v186 = v190;
      } else {
        v186 = v84;
      }
      v97 = v186;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 92; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
