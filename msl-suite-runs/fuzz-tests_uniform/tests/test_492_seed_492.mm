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
    default:
      {
      int v7 = 4;
      int v8 = v3 % v7;
      int v9;
      v9 = v0;
      switch (v8) {
        default:
          {
          int v10 = 0;
          bool v11 = v2 != v10;
          int v12;
          if (v11) {
            int v13 = 0;
            int v14 = v0 + v13;
            v12 = v14;
          } else {
            int v15 = 1;
            v12 = v15;
          }
          v9 = v12;
        }
        case 0:
          {
          int v16 = 0;
          bool v17 = v2 != v16;
          int v18;
          if (v17) {
            v18 = v0;
          } else {
            v18 = v0;
          }
          int v19 = 0;
          int v20 = v0 + v19;
          v9 = v18;
          break;
        }
        case 1:
          {
          int v21 = 3;
          int v22 = v3 % v21;
          int v23 = 3;
          int v24;
          v24 = v23;
          switch (v22) {
            default:
              {
              int v25 = 1;
              v24 = v25;
              break;
            }
            case 0:
              {
              int v26 = 3;
              v24 = v26;
              break;
            }
            case 1:
              {
              int v27 = 3;
              v24 = v27;
              break;
            }
          }
          v9 = v24;
          break;
        }
        case 2:
          {
          int v28 = 3;
          int v29 = v3 % v28;
          int v30;
          v30 = v0;
          switch (v29) {
            case 0:
              {
              int v31 = 2;
              v30 = v31;
              break;
            }
            case 1:
              {
              v30 = v0;
            }
            case 2:
              {
              int v32 = 3;
              int v33 = v0 + v32;
              v30 = v33;
            }
            default:
              {
              int v34 = 0;
              v30 = v34;
              break;
            }
          }
          int v35 = 0;
          v9 = v30;
          break;
        }
      }
      int v36 = 2;
      int v37 = v0 + v36;
      v6 = v9;
      break;
    }
    case 0:
      {
      int v38 = 0;
      int v39 = 0;
      int v40;
      int v41;
      v40 = v38;
      v41 = v39;
      while (true) {
        int v42 = 4;
        int v43 = v3 % v42;
        int v44 = 1;
        int v45 = v43 + v44;
        bool v46 = v41 < v45;
        v40 = v40;
        v41 = v41;
        if (!v46) break;
        int v47 = 0;
        bool v48 = v2 != v47;
        int v49;
        if (v48) {
          v49 = v0;
        } else {
          v49 = v0;
        }
        int v50 = 1;
        int v51 = v41 + v50;
        v40 = v49;
        v41 = v51;
      }
      int v52 = 0;
      v6 = v40;
      break;
    }
    case 1:
      {
      int v53 = 2;
      int v54 = v3 % v53;
      int v55 = 1;
      int v56 = v0 + v55;
      int v57;
      v57 = v56;
      switch (v54) {
        case 0:
          {
          int v58 = 1;
          v57 = v58;
          break;
        }
        case 1:
          {
          int v59 = 0;
          bool v60 = v2 != v59;
          int v61;
          if (v60) {
            int v62 = 0;
            v61 = v62;
          } else {
            int v63 = 0;
            v61 = v63;
          }
          int v64 = 0;
          v57 = v61;
          break;
        }
        default:
          {
          int v65 = 4;
          int v66 = v3 % v65;
          int v67 = 3;
          int v68;
          v68 = v67;
          switch (v66) {
            default:
              {
              v68 = v0;
              break;
            }
            case 0:
              {
              int v69 = 3;
              v68 = v69;
              break;
            }
            case 1:
              {
              v68 = v0;
              break;
            }
            case 2:
              {
              int v70 = 0;
              int v71 = v0 + v70;
              v68 = v71;
              break;
            }
          }
          v57 = v68;
          break;
        }
      }
      v6 = v57;
      break;
    }
    case 2:
      {
      int v72 = 4;
      int v73 = v3 % v72;
      int v74 = 1;
      int v75 = v0 + v74;
      int v76;
      v76 = v75;
      switch (v73) {
        default:
          {
          int v77 = 3;
          int v78 = v3 % v77;
          int v79;
          v79 = v0;
          switch (v78) {
            default:
              {
              int v80 = 1;
              v79 = v80;
            }
            case 0:
              {
              v79 = v0;
              break;
            }
            case 1:
              {
              int v81 = 2;
              v79 = v81;
              break;
            }
          }
          v76 = v79;
          break;
        }
        case 0:
          {
          int v82 = 0;
          bool v83 = v2 != v82;
          int v84;
          if (v83) {
            int v85 = 2;
            v84 = v85;
          } else {
            int v86 = 4;
            v84 = v86;
          }
          v76 = v84;
          break;
        }
        case 1:
          {
          int v87 = 3;
          int v88 = v3 % v87;
          int v89;
          v89 = v0;
          switch (v88) {
            default:
              {
              int v90 = 4;
              v89 = v90;
            }
            case 0:
              {
              int v91 = 2;
              int v92 = v0 + v91;
              v89 = v92;
              break;
            }
            case 1:
              {
              int v93 = 4;
              v89 = v93;
              break;
            }
          }
          int v94 = 1;
          v76 = v89;
        }
        case 2:
          {
          int v95 = 0;
          int v96 = 0;
          int v97;
          int v98;
          v97 = v95;
          v98 = v96;
          while (true) {
            int v99 = 4;
            int v100 = v3 % v99;
            int v101 = 1;
            int v102 = v100 + v101;
            bool v103 = v98 < v102;
            v97 = v97;
            v98 = v98;
            if (!v103) break;
            int v104 = 2;
            int v105 = 1;
            int v106 = v98 + v105;
            v97 = v104;
            v98 = v106;
            continue;
            ;
          }
          int v107 = 1;
          int v108 = v0 + v107;
          v76 = v97;
          break;
        }
      }
      int v109 = 3;
      v6 = v76;
      break;
    }
  }
  bool v110 = true;
  int v111 = simt_wave_count_bits(v110);
  int v112 = 0;
  int v113 = v112 + v0;
  v1[v113] = v111;
  return;
}

kernel void kernel_main(device int* v114 [[buffer(0)]], device int* v115 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v116 = static_cast<int>(__simt_tid3.x);
  int v117 = 0;
  int v118 = v117 + v116;
  int v119 = v115[v118];
  int v120 = 4;
  int v121 = v120 + v116;
  int v122 = v115[v121];
  helper0(v116, v114, v119, v122, static_cast<int>(__simt_tid3.x));
  int v123 = 8;
  int v124 = v123 + v116;
  int v125 = v115[v124];
  int v126 = 0;
  bool v127 = v125 != v126;
  int v128;
  if (v127) {
    int v129 = 12;
    int v130 = v129 + v116;
    int v131 = v115[v130];
    uint v132 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v133 = (int)(v132);
    int v134;
    v134 = v133;
    switch (v131) {
      case 0:
        {
        int v135 = 16;
        int v136 = v135 + v116;
        int v137 = v115[v136];
        int v138;
        v138 = v116;
        switch (v137) {
          case 0:
            {
            int v139 = 2;
            v138 = v139;
          }
          default:
            {
            int v140 = 3;
            v138 = v140;
          }
          case 1:
            {
            v138 = v116;
            break;
          }
        }
        bool v141 = true;
        v134 = v138;
        break;
      }
      default:
        {
        int v142 = 0;
        int v143 = 0;
        int v144;
        int v145;
        v144 = v142;
        v145 = v143;
        while (true) {
          int v146 = 4;
          int v147 = v145 * v146;
          int v148 = v147 + v116;
          int v149 = 20;
          int v150 = v149 + v148;
          int v151 = v115[v150];
          int v152 = 0;
          bool v153 = v151 != v152;
          v144 = v144;
          v145 = v145;
          if (!v153) break;
          int v154 = v144 + v145;
          int v155 = 1;
          int v156 = v145 + v155;
          v144 = v154;
          v145 = v156;
        }
        bool v157 = true;
        v134 = v144;
      }
      case 1:
        {
        int v158 = 40;
        int v159 = v158 + v116;
        int v160 = v115[v159];
        int v161 = 0;
        bool v162 = v160 != v161;
        int v163;
        if (v162) {
          int v164 = 4;
          v163 = v164;
        } else {
          v163 = v116;
        }
        v134 = v163;
        break;
      }
    }
    bool v165 = true;
    v128 = v134;
  } else {
    int v166 = 44;
    int v167 = v166 + v116;
    int v168 = v115[v167];
    uint v169 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v170 = (int)(v169);
    int v171;
    v171 = v170;
    switch (v168) {
      default:
        {
        int v172 = 4;
        int v173 = v116 + v172;
        v171 = v173;
        break;
      }
      case 0:
        {
        int v174 = 48;
        int v175 = v174 + v116;
        int v176 = v115[v175];
        int v177 = 1;
        int v178;
        v178 = v177;
        switch (v176) {
          case 0:
            {
            int v179 = 2;
            v178 = v179;
            break;
          }
          case 1:
            {
            v178 = v116;
            break;
          }
          default:
            {
            v178 = v116;
            break;
          }
          case 2:
            {
            v178 = v116;
            break;
          }
        }
        bool v180 = true;
        v171 = v178;
        break;
      }
      case 1:
        {
        int v181 = 52;
        int v182 = v181 + v116;
        int v183 = v115[v182];
        int v184 = 0;
        bool v185 = v183 != v184;
        int v186;
        if (v185) {
          int v187 = 0;
          v186 = v187;
        } else {
          v186 = v116;
        }
        v171 = v186;
      }
      case 2:
        {
        int v188 = 56;
        int v189 = v188 + v116;
        int v190 = v115[v189];
        int v191 = 0;
        bool v192 = v190 != v191;
        int v193;
        if (v192) {
          v193 = v116;
        } else {
          int v194 = 2;
          int v195 = v116 + v194;
          v193 = v195;
        }
        v171 = v193;
        break;
      }
    }
    bool v196 = true;
    v128 = v171;
  }
  int v197 = 16;
  int v198 = v197 + v116;
  bool v199 = true;
  int v200 = simt_wave_count_bits(v199);
  v114[v198] = v200;
  int v201 = 2;
  int v202 = v116 + v201;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 60; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
