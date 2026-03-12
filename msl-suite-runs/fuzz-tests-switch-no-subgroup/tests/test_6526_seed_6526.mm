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
    int v7 = 4;
    int v8 = v3 % v7;
    uint v9 = simt_lane_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      case 0:
        {
        int v12 = 0;
        int v13 = 0;
        int v14;
        int v15;
        v14 = v12;
        v15 = v13;
        while (true) {
          int v16 = 4;
          int v17 = v3 % v16;
          int v18 = 1;
          int v19 = v17 + v18;
          bool v20 = v15 < v19;
          v14 = v14;
          v15 = v15;
          if (!v20) break;
          int v21 = 3;
          int v22 = 1;
          int v23 = v15 + v22;
          v14 = v21;
          v15 = v23;
        }
        v11 = v14;
        break;
      }
      default:
        {
        int v24 = 2;
        int v25 = v3 % v24;
        int v26 = 3;
        int v27 = v0 + v26;
        int v28;
        v28 = v27;
        switch (v25) {
          default:
            {
            v28 = v0;
            break;
          }
          case 0:
            {
            int v29 = 2;
            int v30 = v0 + v29;
            v28 = v30;
            break;
          }
          case 1:
            {
            int v31 = 2;
            int v32 = v0 + v31;
            v28 = v32;
            break;
          }
        }
        int v33 = 1;
        int v34 = v0 + v33;
        v11 = v28;
        break;
      }
      case 1:
        {
        v11 = v0;
        break;
      }
      case 2:
        {
        int v35 = 3;
        int v36 = v3 % v35;
        int v37 = 1;
        int v38 = v0 + v37;
        int v39;
        v39 = v38;
        switch (v36) {
          default:
            {
            int v40 = 0;
            v39 = v40;
            break;
          }
          case 0:
            {
            int v41 = 3;
            v39 = v41;
            break;
          }
          case 1:
            {
            int v42 = 3;
            int v43 = v0 + v42;
            v39 = v43;
            break;
          }
        }
        v11 = v39;
        break;
      }
    }
    bool v44 = true;
    int v45 = simt_wave_count_bits(v44);
    int v46 = 0;
    int v47 = v46 + v0;
    v1[v47] = v45;
    v6 = v11;
  } else {
    int v48 = 0;
    bool v49 = v2 != v48;
    int v50;
    if (v49) {
      int v51 = 0;
      bool v52 = v2 != v51;
      int v53;
      if (v52) {
        bool v54 = true;
        int v55 = simt_wave_count_bits(v54);
        int v56 = 16;
        int v57 = v56 + v0;
        v1[v57] = v55;
        v53 = v55;
      } else {
        bool v58 = true;
        int v59 = simt_wave_count_bits(v58);
        int v60 = 32;
        int v61 = v60 + v0;
        v1[v61] = v59;
        v53 = v59;
      }
      v50 = v53;
    } else {
      int v62 = 0;
      bool v63 = v2 != v62;
      int v64;
      if (v63) {
        bool v65 = true;
        int v66 = simt_wave_count_bits(v65);
        int v67 = 48;
        int v68 = v67 + v0;
        v1[v68] = v66;
        v64 = v66;
      } else {
        bool v69 = true;
        int v70 = simt_wave_count_bits(v69);
        int v71 = 64;
        int v72 = v71 + v0;
        v1[v72] = v70;
        v64 = v70;
      }
      v50 = v64;
    }
    v6 = v50;
  }
  return;
}

kernel void kernel_main(device int* v73 [[buffer(0)]], device int* v74 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v75 = static_cast<int>(__simt_tid3.x);
  int v76 = 0;
  int v77 = v76 + v75;
  int v78 = v74[v77];
  int v79 = 4;
  int v80 = v79 + v75;
  int v81 = v74[v80];
  helper0(v75, v73, v78, v81, static_cast<int>(__simt_tid3.x));
  int v82 = 8;
  int v83 = v82 + v75;
  int v84 = v74[v83];
  int v85;
  v85 = v75;
  switch (v84) {
    case 0:
      {
      int v86 = 12;
      int v87 = v86 + v75;
      int v88 = v74[v87];
      int v89 = 0;
      bool v90 = v88 != v89;
      int v91;
      if (v90) {
        int v92 = 16;
        int v93 = v92 + v75;
        int v94 = v74[v93];
        int v95 = 0;
        bool v96 = v94 != v95;
        int v97;
        if (v96) {
          int v98 = 4;
          int v99 = v75 + v98;
          v97 = v99;
        } else {
          int v100 = 3;
          v97 = v100;
        }
        v91 = v97;
      } else {
        int v101 = 20;
        int v102 = v101 + v75;
        int v103 = v74[v102];
        int v104;
        v104 = v75;
        switch (v103) {
          default:
            {
            v104 = v75;
          }
          case 0:
            {
            int v105 = 0;
            int v106 = v75 + v105;
            v104 = v106;
            break;
          }
        }
        v91 = v104;
      }
      v85 = v91;
      break;
    }
    case 1:
      {
      int v107 = 24;
      int v108 = v107 + v75;
      int v109 = v74[v108];
      int v110;
      v110 = v75;
      switch (v109) {
        default:
          {
          int v111 = 0;
          int v112 = 0;
          int v113;
          int v114;
          v113 = v111;
          v114 = v112;
          while (true) {
            int v115 = 4;
            int v116 = v114 * v115;
            int v117 = v116 + v75;
            int v118 = 28;
            int v119 = v118 + v117;
            int v120 = v74[v119];
            int v121 = 0;
            bool v122 = v120 != v121;
            v113 = v113;
            v114 = v114;
            if (!v122) break;
            int v123 = v113 + v114;
            int v124 = 1;
            int v125 = v114 + v124;
            bool v126 = true;
            v113 = v123;
            v114 = v125;
          }
          v110 = v113;
        }
        case 0:
          {
          int v127 = 48;
          int v128 = v127 + v75;
          int v129 = v74[v128];
          int v130 = 4;
          int v131 = v75 + v130;
          int v132;
          v132 = v131;
          switch (v129) {
            default:
              {
              int v133 = 3;
              int v134 = v75 + v133;
              v132 = v134;
              break;
            }
            case 0:
              {
              int v135 = 3;
              int v136 = v75 + v135;
              v132 = v136;
              break;
            }
          }
          v110 = v132;
          break;
        }
      }
      bool v137 = true;
      v85 = v110;
      break;
    }
    default:
      {
      int v138 = 2;
      v85 = v138;
      break;
    }
    case 2:
      {
      int v139 = 52;
      int v140 = v139 + v75;
      int v141 = v74[v140];
      int v142 = 0;
      int v143 = v75 + v142;
      int v144;
      v144 = v143;
      switch (v141) {
        default:
          {
          int v145 = 56;
          int v146 = v145 + v75;
          int v147 = v74[v146];
          int v148 = 0;
          bool v149 = v147 != v148;
          int v150;
          if (v149) {
            v150 = v75;
          } else {
            int v151 = 2;
            int v152 = v75 + v151;
            v150 = v152;
          }
          v144 = v150;
          break;
        }
        case 0:
          {
          int v153 = 60;
          int v154 = v153 + v75;
          int v155 = v74[v154];
          int v156 = 0;
          bool v157 = v155 != v156;
          int v158;
          if (v157) {
            v158 = v75;
          } else {
            int v159 = 1;
            int v160 = v75 + v159;
            v158 = v160;
          }
          v144 = v158;
        }
        case 1:
          {
          int v161 = 64;
          int v162 = v161 + v75;
          int v163 = v74[v162];
          int v164;
          v164 = v75;
          switch (v163) {
            case 0:
              {
              v164 = v75;
              break;
            }
            default:
              {
              int v165 = 1;
              int v166 = v75 + v165;
              v164 = v166;
              break;
            }
          }
          v144 = v164;
          break;
        }
      }
      v85 = v144;
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
    static int32_t expected0[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
