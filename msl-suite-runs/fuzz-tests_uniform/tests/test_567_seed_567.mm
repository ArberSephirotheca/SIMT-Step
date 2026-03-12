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
  int v5 = v0 + v4;
  int v6 = 2;
  int v7 = v3 % v6;
  uint v8 = simt_subgroup_id(__simt_tid);
  int v9 = (int)(v8);
  int v10;
  v10 = v9;
  switch (v7) {
    case 0:
      {
      int v11 = 3;
      int v12 = v3 % v11;
      int v13 = 3;
      int v14;
      v14 = v13;
      switch (v12) {
        case 0:
          {
          int v15 = 0;
          bool v16 = v2 != v15;
          int v17;
          if (v16) {
            int v18 = 1;
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
        case 1:
          {
          int v22 = 3;
          int v23 = v3 % v22;
          int v24 = 0;
          int v25 = v0 + v24;
          int v26;
          v26 = v25;
          switch (v23) {
            case 0:
              {
              int v27 = 1;
              int v28 = v0 + v27;
              v26 = v28;
              break;
            }
            case 1:
              {
              v26 = v0;
            }
            default:
              {
              v26 = v0;
              break;
            }
          }
          v14 = v26;
          break;
        }
        case 2:
          {
          int v29 = 3;
          v14 = v29;
          break;
        }
        default:
          {
          int v30 = 2;
          int v31 = v3 % v30;
          int v32 = 1;
          int v33 = v0 + v32;
          int v34;
          v34 = v33;
          switch (v31) {
            case 0:
              {
              int v35 = 1;
              int v36 = v0 + v35;
              v34 = v36;
              break;
            }
            default:
              {
              int v37 = 1;
              v34 = v37;
              break;
            }
          }
          int v38 = 4;
          int v39 = v0 + v38;
          v14 = v34;
          break;
        }
      }
      int v40 = 4;
      int v41 = v0 + v40;
      v10 = v14;
      break;
    }
    default:
      {
      int v42 = 0;
      int v43 = 0;
      int v44;
      int v45;
      v44 = v42;
      v45 = v43;
      while (true) {
        int v46 = 4;
        int v47 = v3 % v46;
        int v48 = 1;
        int v49 = v47 + v48;
        bool v50 = v45 < v49;
        v44 = v44;
        v45 = v45;
        if (!v50) break;
        int v51 = 0;
        bool v52 = v2 != v51;
        int v53;
        if (v52) {
          int v54 = 0;
          v53 = v54;
        } else {
          int v55 = 1;
          v53 = v55;
        }
        int v56 = 4;
        int v57 = 1;
        int v58 = v45 + v57;
        v44 = v53;
        v45 = v58;
      }
      int v59 = 1;
      v10 = v44;
      break;
    }
    case 1:
      {
      int v60 = 0;
      bool v61 = v2 != v60;
      int v62;
      if (v61) {
        int v63 = 0;
        bool v64 = v2 != v63;
        int v65;
        if (v64) {
          int v66 = 1;
          v65 = v66;
        } else {
          int v67 = 1;
          int v68 = v0 + v67;
          v65 = v68;
        }
        int v69 = 4;
        int v70 = v0 + v69;
        v62 = v65;
      } else {
        int v71 = 0;
        int v72 = 0;
        int v73;
        int v74;
        v73 = v71;
        v74 = v72;
        while (true) {
          int v75 = 4;
          int v76 = v3 % v75;
          int v77 = 1;
          int v78 = v76 + v77;
          bool v79 = v74 < v78;
          v73 = v73;
          v74 = v74;
          if (!v79) break;
          int v80 = 2;
          int v81 = v0 + v80;
          int v82 = 1;
          int v83 = v74 + v82;
          v73 = v81;
          v74 = v83;
        }
        int v84 = 4;
        v62 = v73;
      }
      v10 = v62;
      break;
    }
  }
  bool v85 = true;
  int v86 = simt_wave_count_bits(v85);
  int v87 = 0;
  int v88 = v87 + v0;
  v1[v88] = v86;
  int v89 = 0;
  bool v90 = v2 != v89;
  int v91 = v90 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v92 [[buffer(0)]], device int* v93 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v94 = static_cast<int>(__simt_tid3.x);
  int v95 = 0;
  int v96 = v95 + v94;
  int v97 = v93[v96];
  int v98 = 4;
  int v99 = v98 + v94;
  int v100 = v93[v99];
  helper0(v94, v92, v97, v100, static_cast<int>(__simt_tid3.x));
  int v101 = 8;
  int v102 = v101 + v94;
  int v103 = v93[v102];
  uint v104 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v105 = (int)(v104);
  int v106;
  v106 = v105;
  switch (v103) {
    default:
      {
      int v107 = 12;
      int v108 = v107 + v94;
      int v109 = v93[v108];
      int v110 = 0;
      bool v111 = v109 != v110;
      int v112;
      if (v111) {
        v112 = v94;
      } else {
        int v113 = 2;
        int v114 = v94 + v113;
        v112 = v114;
      }
      v106 = v112;
      break;
    }
    case 0:
      {
      int v115 = 16;
      int v116 = v115 + v94;
      int v117 = v93[v116];
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
          int v127 = v126 + v94;
          int v128 = 20;
          int v129 = v128 + v127;
          int v130 = v93[v129];
          int v131 = 0;
          bool v132 = v130 != v131;
          v123 = v123;
          v124 = v124;
          if (!v132) break;
          int v133 = v123 + v124;
          int v134 = 1;
          int v135 = v124 + v134;
          v123 = v133;
          v124 = v135;
        }
        bool v136 = true;
        v120 = v123;
      } else {
        int v137 = 0;
        int v138 = 0;
        int v139;
        int v140;
        v139 = v137;
        v140 = v138;
        while (true) {
          int v141 = 4;
          int v142 = v140 * v141;
          int v143 = v142 + v94;
          int v144 = 40;
          int v145 = v144 + v143;
          int v146 = v93[v145];
          int v147 = 0;
          bool v148 = v146 != v147;
          v139 = v139;
          v140 = v140;
          if (!v148) break;
          int v149 = v139 + v140;
          int v150 = 1;
          int v151 = v140 + v150;
          v139 = v149;
          v140 = v151;
        }
        bool v152 = true;
        v120 = v139;
      }
      v106 = v120;
    }
    case 1:
      {
      int v153 = 0;
      int v154 = 0;
      int v155;
      int v156;
      v155 = v153;
      v156 = v154;
      while (true) {
        int v157 = 4;
        int v158 = v156 * v157;
        int v159 = v158 + v94;
        int v160 = 60;
        int v161 = v160 + v159;
        int v162 = v93[v161];
        int v163 = 0;
        bool v164 = v162 != v163;
        v155 = v155;
        v156 = v156;
        if (!v164) break;
        int v165 = v155 + v156;
        int v166 = 1;
        int v167 = v156 + v166;
        v155 = v165;
        v156 = v167;
      }
      bool v168 = true;
      v106 = v155;
    }
    case 2:
      {
      int v169 = 80;
      int v170 = v169 + v94;
      int v171 = v93[v170];
      int v172 = 0;
      bool v173 = v171 != v172;
      int v174;
      if (v173) {
        int v175 = 84;
        int v176 = v175 + v94;
        int v177 = v93[v176];
        int v178 = 2;
        int v179 = v94 + v178;
        int v180;
        v180 = v179;
        switch (v177) {
          default:
            {
            int v181 = 4;
            int v182 = v94 + v181;
            v180 = v182;
            break;
          }
          case 0:
            {
            v180 = v94;
          }
          case 1:
            {
            v180 = v94;
            break;
          }
          case 2:
            {
            int v183 = 1;
            int v184 = v94 + v183;
            v180 = v184;
            break;
          }
        }
        bool v185 = true;
        v174 = v180;
      } else {
        int v186 = 1;
        v174 = v186;
      }
      v106 = v174;
      break;
    }
  }
  bool v187 = true;
  int v188 = 16;
  int v189 = v188 + v94;
  bool v190 = true;
  int v191 = simt_wave_count_bits(v190);
  v92[v189] = v191;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
