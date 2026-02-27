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
  bool v9 = v2 != v8;
  int v10;
  if (v9) {
    int v11 = 2;
    int v12 = v3 % v11;
    int v13 = 0;
    int v14;
    v14 = v13;
    switch (v12) {
      case 0:
        {
        int v15 = 0;
        bool v16 = v2 != v15;
        int v17;
        if (v16) {
          int v18 = 2;
          int v19 = v0 + v18;
          v17 = v19;
        } else {
          int v20 = 4;
          int v21 = v0 + v20;
          v17 = v21;
        }
        v14 = v17;
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
          int v32 = 1;
          int v33 = v25 + v32;
          v24 = v31;
          v25 = v33;
        }
        v14 = v24;
        break;
      }
    }
    v10 = v14;
  } else {
    int v34 = 4;
    int v35 = v3 % v34;
    uint v36 = simt_subgroup_id(__simt_tid);
    int v37 = (int)(v36);
    int v38;
    v38 = v37;
    switch (v35) {
      case 0:
        {
        int v39 = 0;
        bool v40 = v2 != v39;
        int v41;
        if (v40) {
          int v42 = 3;
          v41 = v42;
        } else {
          v41 = v0;
        }
        v38 = v41;
        break;
      }
      case 1:
        {
        int v43 = 2;
        int v44 = v3 % v43;
        int v45 = 0;
        int v46;
        v46 = v45;
        switch (v44) {
          case 0:
            {
            int v47 = 4;
            v46 = v47;
            break;
          }
          default:
            {
            int v48 = 3;
            int v49 = v0 + v48;
            v46 = v49;
            break;
          }
          case 1:
            {
            v46 = v0;
            break;
          }
        }
        v38 = v46;
      }
      case 2:
        {
        int v50 = 0;
        int v51 = 0;
        int v52;
        int v53;
        v52 = v50;
        v53 = v51;
        while (true) {
          int v54 = 4;
          int v55 = v3 % v54;
          int v56 = 1;
          int v57 = v55 + v56;
          bool v58 = v53 < v57;
          v52 = v52;
          v53 = v53;
          if (!v58) break;
          int v59 = 1;
          int v60 = v53 + v59;
          v52 = v0;
          v53 = v60;
          continue;
          ;
        }
        v38 = v52;
      }
      default:
        {
        int v61 = 2;
        v38 = v61;
        break;
      }
    }
    bool v62 = true;
    int v63 = simt_wave_count_bits(v62);
    int v64 = 16;
    int v65 = v64 + v0;
    v1[v65] = v63;
    v10 = v38;
  }
  int v66 = 0;
  bool v67 = v2 != v66;
  int v68 = v67 ? v5 : v10;
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
  int v78 = 0;
  bool v79 = v74 != v78;
  if (v79) {
    int v80 = 8;
    int v81 = v80 + v71;
    int v82 = v70[v81];
    int v83 = 0;
    bool v84 = v82 != v83;
    if (v84) {
      helper0(v71, v69, v74, v77, static_cast<int>(__simt_tid3.x));
    } else {
    }
  } else {
  }
  int v85 = 12;
  int v86 = v85 + v71;
  int v87 = v70[v86];
  int v88;
  v88 = v71;
  switch (v87) {
    case 0:
      {
      int v89 = 16;
      int v90 = v89 + v71;
      int v91 = v70[v90];
      int v92 = 0;
      int v93 = v71 + v92;
      int v94;
      v94 = v93;
      switch (v91) {
        default:
          {
          int v95 = 20;
          int v96 = v95 + v71;
          int v97 = v70[v96];
          int v98 = 0;
          bool v99 = v97 != v98;
          int v100;
          if (v99) {
            v100 = v71;
          } else {
            int v101 = 2;
            int v102 = v71 + v101;
            v100 = v102;
          }
          v94 = v100;
        }
        case 0:
          {
          int v103 = 24;
          int v104 = v103 + v71;
          int v105 = v70[v104];
          int v106 = 0;
          int v107 = v71 + v106;
          int v108;
          v108 = v107;
          switch (v105) {
            case 0:
              {
              v108 = v71;
              break;
            }
            case 1:
              {
              v108 = v71;
              break;
            }
            case 2:
              {
              int v109 = 4;
              int v110 = v71 + v109;
              v108 = v110;
              break;
            }
            default:
              {
              int v111 = 0;
              int v112 = v71 + v111;
              v108 = v112;
              break;
            }
          }
          v94 = v108;
          break;
        }
      }
      v88 = v94;
      break;
    }
    case 1:
      {
      int v113 = 28;
      int v114 = v113 + v71;
      int v115 = v70[v114];
      int v116;
      v116 = v71;
      switch (v115) {
        case 0:
          {
          int v117 = 32;
          int v118 = v117 + v71;
          int v119 = v70[v118];
          int v120;
          v120 = v71;
          switch (v119) {
            case 0:
              {
              v120 = v71;
              break;
            }
            case 1:
              {
              int v121 = 0;
              v120 = v121;
              break;
            }
            default:
              {
              int v122 = 0;
              v120 = v122;
            }
            case 2:
              {
              int v123 = 1;
              int v124 = v71 + v123;
              v120 = v124;
              break;
            }
          }
          v116 = v120;
          break;
        }
        default:
          {
          int v125 = 0;
          int v126 = 0;
          int v127;
          int v128;
          v127 = v125;
          v128 = v126;
          while (true) {
            int v129 = 4;
            int v130 = v128 * v129;
            int v131 = v130 + v71;
            int v132 = 36;
            int v133 = v132 + v131;
            int v134 = v70[v133];
            int v135 = 0;
            bool v136 = v134 != v135;
            v127 = v127;
            v128 = v128;
            if (!v136) break;
            int v137 = v127 + v128;
            int v138 = 1;
            int v139 = v128 + v138;
            bool v140 = true;
            v127 = v137;
            v128 = v139;
          }
          v116 = v127;
          break;
        }
      }
      bool v141 = true;
      v88 = v116;
      break;
    }
    case 2:
      {
      int v142 = 56;
      int v143 = v142 + v71;
      int v144 = v70[v143];
      int v145 = 0;
      bool v146 = v144 != v145;
      int v147;
      if (v146) {
        int v148 = 60;
        int v149 = v148 + v71;
        int v150 = v70[v149];
        int v151;
        v151 = v71;
        switch (v150) {
          case 0:
            {
            int v152 = 2;
            int v153 = v71 + v152;
            v151 = v153;
            break;
          }
          default:
            {
            int v154 = 4;
            int v155 = v71 + v154;
            v151 = v155;
            break;
          }
          case 1:
            {
            int v156 = 0;
            int v157 = v71 + v156;
            v151 = v157;
            break;
          }
          case 2:
            {
            int v158 = 3;
            v151 = v158;
            break;
          }
        }
        bool v159 = true;
        v147 = v151;
      } else {
        int v160 = 64;
        int v161 = v160 + v71;
        int v162 = v70[v161];
        int v163 = 0;
        bool v164 = v162 != v163;
        int v165;
        if (v164) {
          int v166 = 1;
          v165 = v166;
        } else {
          int v167 = 3;
          v165 = v167;
        }
        v147 = v165;
      }
      v88 = v147;
      break;
    }
    default:
      {
      int v168 = 68;
      int v169 = v168 + v71;
      int v170 = v70[v169];
      int v171 = 0;
      bool v172 = v170 != v171;
      int v173;
      if (v172) {
        int v174 = 0;
        int v175 = 0;
        int v176;
        int v177;
        v176 = v174;
        v177 = v175;
        while (true) {
          int v178 = 4;
          int v179 = v177 * v178;
          int v180 = v179 + v71;
          int v181 = 72;
          int v182 = v181 + v180;
          int v183 = v70[v182];
          int v184 = 0;
          bool v185 = v183 != v184;
          v176 = v176;
          v177 = v177;
          if (!v185) break;
          int v186 = v176 + v177;
          int v187 = 1;
          int v188 = v177 + v187;
          bool v189 = true;
          v176 = v186;
          v177 = v188;
        }
        v173 = v176;
      } else {
        int v190 = 3;
        int v191 = v71 + v190;
        v173 = v191;
      }
      v88 = v173;
      break;
    }
  }
  uint v192 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v193 = (int)(v192);
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 3; ++idx) {
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
