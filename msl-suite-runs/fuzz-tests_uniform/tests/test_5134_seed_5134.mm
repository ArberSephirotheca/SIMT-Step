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
    int v7 = 0;
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      int v10 = 0;
      bool v11 = v2 != v10;
      int v12;
      if (v11) {
        uint v13 = simt_subgroup_id(__simt_tid);
        int v14 = (int)(v13);
        v12 = v14;
      } else {
        v12 = v0;
      }
      v9 = v12;
    } else {
      uint v15 = simt_lane_id(__simt_tid);
      int v16 = (int)(v15);
      v9 = v16;
    }
    int v17 = 2;
    v6 = v9;
  } else {
    int v18 = 4;
    int v19 = v3 % v18;
    int v20 = 4;
    int v21 = v0 + v20;
    int v22;
    v22 = v21;
    switch (v19) {
      case 0:
        {
        int v23 = 0;
        int v24 = 0;
        int v25;
        int v26;
        v25 = v23;
        v26 = v24;
        while (true) {
          int v27 = 4;
          int v28 = v3 % v27;
          int v29 = 1;
          int v30 = v28 + v29;
          bool v31 = v26 < v30;
          v25 = v25;
          v26 = v26;
          if (!v31) break;
          int v32 = 0;
          int v33 = v0 + v32;
          int v34 = 1;
          int v35 = v26 + v34;
          v25 = v33;
          v26 = v35;
        }
        int v36 = 2;
        v22 = v25;
        break;
      }
      case 1:
        {
        int v37 = 2;
        int v38 = v3 % v37;
        int v39 = 4;
        int v40;
        v40 = v39;
        switch (v38) {
          case 0:
            {
            v40 = v0;
            break;
          }
          case 1:
            {
            v40 = v0;
            break;
          }
          default:
            {
            v40 = v0;
            break;
          }
        }
        v22 = v40;
        break;
      }
      default:
        {
        int v41 = 0;
        bool v42 = v2 != v41;
        int v43;
        if (v42) {
          int v44 = 1;
          int v45 = v0 + v44;
          v43 = v45;
        } else {
          int v46 = 1;
          int v47 = v0 + v46;
          v43 = v47;
        }
        int v48 = 4;
        v22 = v43;
        break;
      }
      case 2:
        {
        int v49 = 0;
        int v50 = 0;
        int v51;
        int v52;
        v51 = v49;
        v52 = v50;
        while (true) {
          int v53 = 4;
          int v54 = v3 % v53;
          int v55 = 1;
          int v56 = v54 + v55;
          bool v57 = v52 < v56;
          v51 = v51;
          v52 = v52;
          if (!v57) break;
          int v58 = 2;
          int v59 = 1;
          int v60 = v52 + v59;
          v51 = v58;
          v52 = v60;
        }
        int v61 = 3;
        int v62 = v0 + v61;
        v22 = v51;
        break;
      }
    }
    uint v63 = simt_subgroup_id(__simt_tid);
    int v64 = (int)(v63);
    v6 = v22;
  }
  bool v65 = true;
  int v66 = simt_wave_count_bits(v65);
  int v67 = 0;
  int v68 = v67 + v0;
  v1[v68] = v66;
  return;
}

kernel void kernel_main(device int* v69 [[buffer(0)]], device int* v70 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v71 = static_cast<int>(__simt_tid3.x);
  int v72 = 0;
  int v73 = v72 + v71;
  int v74 = v70[v73];
  int v75 = 4;
  int v76 = v75 + v71;
  int v77 = v70[v76];
  helper0(v71, v69, v74, v77, static_cast<int>(__simt_tid3.x));
  uint v78 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v79 = (int)(v78);
  int v80 = 8;
  int v81 = v80 + v71;
  int v82 = v70[v81];
  int v83 = 1;
  int v84;
  v84 = v83;
  switch (v82) {
    case 0:
      {
      int v85 = 12;
      int v86 = v85 + v71;
      int v87 = v70[v86];
      int v88 = 1;
      int v89;
      v89 = v88;
      switch (v87) {
        case 0:
          {
          int v90 = 0;
          int v91 = 0;
          int v92;
          int v93;
          v92 = v90;
          v93 = v91;
          while (true) {
            int v94 = 4;
            int v95 = v93 * v94;
            int v96 = v95 + v71;
            int v97 = 16;
            int v98 = v97 + v96;
            int v99 = v70[v98];
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
          v89 = v92;
          break;
        }
        case 1:
          {
          int v106 = 36;
          int v107 = v106 + v71;
          int v108 = v70[v107];
          int v109 = 0;
          bool v110 = v108 != v109;
          int v111;
          if (v110) {
            int v112 = 1;
            v111 = v112;
          } else {
            int v113 = 1;
            int v114 = v71 + v113;
            v111 = v114;
          }
          v89 = v111;
        }
        default:
          {
          int v115 = 40;
          int v116 = v115 + v71;
          int v117 = v70[v116];
          int v118 = 0;
          bool v119 = v117 != v118;
          int v120;
          if (v119) {
            int v121 = 3;
            int v122 = v71 + v121;
            v120 = v122;
          } else {
            int v123 = 3;
            v120 = v123;
          }
          v89 = v120;
        }
        case 2:
          {
          int v124 = 44;
          int v125 = v124 + v71;
          int v126 = v70[v125];
          int v127 = 0;
          bool v128 = v126 != v127;
          int v129;
          if (v128) {
            int v130 = 2;
            int v131 = v71 + v130;
            v129 = v131;
          } else {
            int v132 = 0;
            int v133 = v71 + v132;
            v129 = v133;
          }
          v89 = v129;
          break;
        }
      }
      bool v134 = true;
      v84 = v89;
      break;
    }
    case 1:
      {
      int v135 = 48;
      int v136 = v135 + v71;
      int v137 = v70[v136];
      int v138;
      v138 = v71;
      switch (v137) {
        case 0:
          {
          int v139 = 52;
          int v140 = v139 + v71;
          int v141 = v70[v140];
          int v142 = 1;
          int v143 = v71 + v142;
          int v144;
          v144 = v143;
          switch (v141) {
            default:
              {
              int v145 = 0;
              int v146 = v71 + v145;
              v144 = v146;
            }
            case 0:
              {
              int v147 = 3;
              int v148 = v71 + v147;
              v144 = v148;
              break;
            }
          }
          bool v149 = true;
          v138 = v144;
          break;
        }
        default:
          {
          int v150 = 56;
          int v151 = v150 + v71;
          int v152 = v70[v151];
          int v153 = 2;
          int v154;
          v154 = v153;
          switch (v152) {
            case 0:
              {
              v154 = v71;
              break;
            }
            default:
              {
              int v155 = 0;
              v154 = v155;
              break;
            }
          }
          bool v156 = true;
          v138 = v154;
        }
        case 1:
          {
          int v157 = 3;
          int v158 = v71 + v157;
          v138 = v158;
          break;
        }
        case 2:
          {
          int v159 = 60;
          int v160 = v159 + v71;
          int v161 = v70[v160];
          int v162 = 0;
          int v163;
          v163 = v162;
          switch (v161) {
            default:
              {
              v163 = v71;
              break;
            }
            case 0:
              {
              int v164 = 3;
              int v165 = v71 + v164;
              v163 = v165;
              break;
            }
            case 1:
              {
              v163 = v71;
              break;
            }
          }
          bool v166 = true;
          v138 = v163;
          break;
        }
      }
      bool v167 = true;
      v84 = v138;
      break;
    }
    default:
      {
      int v168 = 64;
      int v169 = v168 + v71;
      int v170 = v70[v169];
      int v171 = 1;
      int v172 = v71 + v171;
      int v173;
      v173 = v172;
      switch (v170) {
        default:
          {
          v173 = v71;
        }
        case 0:
          {
          int v174 = 68;
          int v175 = v174 + v71;
          int v176 = v70[v175];
          int v177;
          v177 = v71;
          switch (v176) {
            case 0:
              {
              int v178 = 1;
              int v179 = v71 + v178;
              v177 = v179;
              break;
            }
            default:
              {
              int v180 = 3;
              v177 = v180;
            }
            case 1:
              {
              int v181 = 1;
              v177 = v181;
            }
            case 2:
              {
              int v182 = 3;
              v177 = v182;
              break;
            }
          }
          bool v183 = true;
          v173 = v177;
          break;
        }
      }
      bool v184 = true;
      v84 = v173;
      break;
    }
  }
  bool v185 = true;
  int v186 = 16;
  int v187 = v186 + v71;
  bool v188 = true;
  int v189 = simt_wave_count_bits(v188);
  v69[v187] = v189;
  uint v190 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v191 = (int)(v190);
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
