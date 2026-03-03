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
    case 0:
      {
      int v7 = 3;
      int v8 = v3 % v7;
      int v9 = 1;
      int v10;
      v10 = v9;
      switch (v8) {
        default:
          {
          int v11 = 0;
          bool v12 = v2 != v11;
          int v13;
          if (v12) {
            int v14 = 2;
            v13 = v14;
          } else {
            v13 = v0;
          }
          v10 = v13;
          break;
        }
        case 0:
          {
          int v15 = 2;
          int v16 = v3 % v15;
          int v17 = 0;
          int v18 = v0 + v17;
          int v19;
          v19 = v18;
          switch (v16) {
            default:
              {
              v19 = v0;
              break;
            }
            case 0:
              {
              v19 = v0;
              break;
            }
            case 1:
              {
              int v20 = 3;
              v19 = v20;
              break;
            }
          }
          int v21 = 2;
          int v22 = v0 + v21;
          v10 = v19;
          break;
        }
        case 1:
          {
          int v23 = 4;
          int v24 = v3 % v23;
          int v25;
          v25 = v0;
          switch (v24) {
            case 0:
              {
              int v26 = 2;
              v25 = v26;
            }
            case 1:
              {
              int v27 = 4;
              v25 = v27;
              break;
            }
            case 2:
              {
              int v28 = 0;
              v25 = v28;
            }
            default:
              {
              int v29 = 0;
              v25 = v29;
              break;
            }
          }
          int v30 = 2;
          int v31 = v0 + v30;
          v10 = v25;
          break;
        }
        case 2:
          {
          int v32 = 0;
          int v33 = 0;
          int v34;
          int v35;
          v34 = v32;
          v35 = v33;
          while (true) {
            int v36 = 4;
            int v37 = v3 % v36;
            int v38 = 1;
            int v39 = v37 + v38;
            bool v40 = v35 < v39;
            v34 = v34;
            v35 = v35;
            if (!v40) break;
            int v41 = 1;
            int v42 = v35 + v41;
            v34 = v0;
            v35 = v42;
          }
          v10 = v34;
          break;
        }
      }
      v6 = v10;
      break;
    }
    case 1:
      {
      int v43 = 3;
      int v44;
      v44 = v43;
      switch (v3) {
        case 0:
          {
          int v45 = 0;
          int v46 = 0;
          int v47;
          int v48;
          v47 = v45;
          v48 = v46;
          while (true) {
            int v49 = 4;
            int v50 = v3 % v49;
            int v51 = 1;
            int v52 = v50 + v51;
            bool v53 = v48 < v52;
            v47 = v47;
            v48 = v48;
            if (!v53) break;
            int v54 = 2;
            int v55 = 1;
            int v56 = v48 + v55;
            v47 = v54;
            v48 = v56;
            continue;
            ;
          }
          int v57 = 1;
          int v58 = v0 + v57;
          v44 = v47;
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
            int v68 = 0;
            int v69 = 1;
            int v70 = v62 + v69;
            v61 = v68;
            v62 = v70;
          }
          v44 = v61;
          break;
        }
      }
      int v71 = 4;
      v6 = v44;
      break;
    }
    case 2:
      {
      int v72 = 0;
      int v73 = 0;
      int v74;
      int v75;
      v74 = v72;
      v75 = v73;
      while (true) {
        int v76 = 4;
        int v77 = v3 % v76;
        int v78 = 1;
        int v79 = v77 + v78;
        bool v80 = v75 < v79;
        v74 = v74;
        v75 = v75;
        if (!v80) break;
        int v81 = 0;
        bool v82 = v2 != v81;
        int v83;
        if (v82) {
          int v84 = 1;
          int v85 = v0 + v84;
          v83 = v85;
        } else {
          int v86 = 0;
          v83 = v86;
        }
        int v87 = 4;
        int v88 = 1;
        int v89 = v75 + v88;
        v74 = v83;
        v75 = v89;
      }
      v6 = v74;
      break;
    }
    default:
      {
      int v90 = 0;
      int v91 = 0;
      int v92;
      int v93;
      v92 = v90;
      v93 = v91;
      while (true) {
        int v94 = 4;
        int v95 = v3 % v94;
        int v96 = 1;
        int v97 = v95 + v96;
        bool v98 = v93 < v97;
        v92 = v92;
        v93 = v93;
        if (!v98) break;
        int v99 = 0;
        bool v100 = v2 != v99;
        int v101;
        if (v100) {
          int v102 = 3;
          v101 = v102;
        } else {
          int v103 = 1;
          int v104 = v0 + v103;
          v101 = v104;
        }
        int v105 = 1;
        int v106 = v93 + v105;
        v92 = v101;
        v93 = v106;
      }
      int v107 = 3;
      int v108 = v0 + v107;
      v6 = v92;
      break;
    }
  }
  bool v109 = true;
  int v110 = simt_wave_count_bits(v109);
  int v111 = 0;
  int v112 = v111 + v0;
  v1[v112] = v110;
  return;
}

kernel void kernel_main(device int* v113 [[buffer(0)]], device int* v114 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v115 = static_cast<int>(__simt_tid3.x);
  int v116 = 0;
  int v117 = v116 + v115;
  int v118 = v114[v117];
  int v119 = 4;
  int v120 = v119 + v115;
  int v121 = v114[v120];
  helper0(v115, v113, v118, v121, static_cast<int>(__simt_tid3.x));
  int v122 = 0;
  int v123 = 0;
  int v124;
  int v125;
  v124 = v122;
  v125 = v123;
  while (true) {
    int v126 = 4;
    int v127 = v125 * v126;
    int v128 = v127 + v115;
    int v129 = 8;
    int v130 = v129 + v128;
    int v131 = v114[v130];
    int v132 = 0;
    bool v133 = v131 != v132;
    v124 = v124;
    v125 = v125;
    if (!v133) break;
    int v134 = 28;
    int v135 = v134 + v115;
    int v136 = v114[v135];
    int v137 = 2;
    int v138 = v115 + v137;
    int v139;
    v139 = v138;
    switch (v136) {
      default:
        {
        int v140 = 1;
        int v141 = v115 + v140;
        v139 = v141;
        break;
      }
      case 0:
        {
        v139 = v115;
        break;
      }
      case 1:
        {
        int v142 = 4;
        v139 = v142;
        break;
      }
      case 2:
        {
        int v143 = 32;
        int v144 = v143 + v115;
        int v145 = v114[v144];
        int v146 = 4;
        int v147 = v115 + v146;
        int v148;
        v148 = v147;
        switch (v145) {
          default:
            {
            v148 = v115;
            break;
          }
          case 0:
            {
            v148 = v115;
            break;
          }
        }
        bool v149 = true;
        v139 = v148;
        break;
      }
    }
    bool v150 = true;
    int v151 = v124 + v139;
    int v152 = 1;
    int v153 = v125 + v152;
    v124 = v151;
    v125 = v153;
  }
  bool v154 = true;
  int v155 = 16;
  int v156 = v155 + v115;
  bool v157 = true;
  int v158 = simt_wave_count_bits(v157);
  v113[v156] = v158;
  int v159 = 0;
  int v160 = 0;
  int v161;
  int v162;
  v161 = v159;
  v162 = v160;
  while (true) {
    int v163 = 4;
    int v164 = v162 * v163;
    int v165 = v164 + v115;
    int v166 = 36;
    int v167 = v166 + v165;
    int v168 = v114[v167];
    int v169 = 0;
    bool v170 = v168 != v169;
    v161 = v161;
    v162 = v162;
    if (!v170) break;
    int v171 = v161 + v162;
    int v172 = 1;
    int v173 = v162 + v172;
    v161 = v171;
    v162 = v173;
    continue;
    ;
  }
  bool v174 = true;
  int v175 = 32;
  int v176 = v175 + v115;
  bool v177 = true;
  int v178 = simt_wave_count_bits(v177);
  v113[v176] = v178;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
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
