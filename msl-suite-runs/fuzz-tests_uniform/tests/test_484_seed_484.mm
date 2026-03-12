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
  int v5 = v0 + v4;
  int v6;
  v6 = v5;
  switch (v3) {
    case 0:
      {
      int v7 = 0;
      int v8 = 0;
      int v9;
      int v10;
      v9 = v7;
      v10 = v8;
      while (true) {
        int v11 = 4;
        int v12 = v3 % v11;
        int v13 = 1;
        int v14 = v12 + v13;
        bool v15 = v10 < v14;
        v9 = v9;
        v10 = v10;
        if (!v15) break;
        int v16 = 4;
        int v17 = v3 % v16;
        int v18 = 0;
        int v19 = v0 + v18;
        int v20;
        v20 = v19;
        switch (v17) {
          case 0:
            {
            v20 = v0;
            break;
          }
          case 1:
            {
            int v21 = 1;
            v20 = v21;
          }
          default:
            {
            int v22 = 2;
            v20 = v22;
          }
          case 2:
            {
            v20 = v0;
            break;
          }
        }
        int v23 = 1;
        int v24 = v10 + v23;
        v9 = v20;
        v10 = v24;
      }
      int v25 = 2;
      v6 = v9;
      break;
    }
    default:
      {
      int v26 = 0;
      int v27 = 0;
      int v28;
      int v29;
      v28 = v26;
      v29 = v27;
      while (true) {
        int v30 = 4;
        int v31 = v3 % v30;
        int v32 = 1;
        int v33 = v31 + v32;
        bool v34 = v29 < v33;
        v28 = v28;
        v29 = v29;
        if (!v34) break;
        int v35 = 0;
        int v36 = 0;
        int v37;
        int v38;
        v37 = v35;
        v38 = v36;
        while (true) {
          int v39 = 4;
          int v40 = v3 % v39;
          int v41 = 1;
          int v42 = v40 + v41;
          bool v43 = v38 < v42;
          v37 = v37;
          v38 = v38;
          if (!v43) break;
          int v44 = 2;
          int v45 = v0 + v44;
          int v46 = 1;
          int v47 = v38 + v46;
          v37 = v45;
          v38 = v47;
        }
        int v48 = 1;
        int v49 = v29 + v48;
        v28 = v37;
        v29 = v49;
      }
      int v50 = 1;
      int v51 = v0 + v50;
      v6 = v28;
      break;
    }
  }
  bool v52 = true;
  int v53 = simt_wave_count_bits(v52);
  int v54 = 0;
  int v55 = v54 + v0;
  v1[v55] = v53;
  return;
}

kernel void kernel_main(device int* v56 [[buffer(0)]], device int* v57 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v58 = static_cast<int>(__simt_tid3.x);
  int v59 = 0;
  int v60 = v59 + v58;
  int v61 = v57[v60];
  int v62 = 4;
  int v63 = v62 + v58;
  int v64 = v57[v63];
  helper0(v58, v56, v61, v64, static_cast<int>(__simt_tid3.x));
  int v65 = 8;
  int v66 = v65 + v58;
  int v67 = v57[v66];
  uint v68 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v69 = (int)(v68);
  int v70;
  v70 = v69;
  switch (v67) {
    default:
      {
      int v71 = 12;
      int v72 = v71 + v58;
      int v73 = v57[v72];
      int v74 = 0;
      int v75 = v58 + v74;
      int v76;
      v76 = v75;
      switch (v73) {
        case 0:
          {
          int v77 = 0;
          int v78 = 0;
          int v79;
          int v80;
          v79 = v77;
          v80 = v78;
          while (true) {
            int v81 = 4;
            int v82 = v80 * v81;
            int v83 = v82 + v58;
            int v84 = 16;
            int v85 = v84 + v83;
            int v86 = v57[v85];
            int v87 = 0;
            bool v88 = v86 != v87;
            v79 = v79;
            v80 = v80;
            if (!v88) break;
            int v89 = v79 + v80;
            int v90 = 1;
            int v91 = v80 + v90;
            v79 = v89;
            v80 = v91;
            break;
            ;
          }
          bool v92 = true;
          v76 = v79;
        }
        case 1:
          {
          int v93 = 36;
          int v94 = v93 + v58;
          int v95 = v57[v94];
          int v96 = 0;
          bool v97 = v95 != v96;
          int v98;
          if (v97) {
            v98 = v58;
          } else {
            int v99 = 4;
            int v100 = v58 + v99;
            v98 = v100;
          }
          v76 = v98;
        }
        default:
          {
          int v101 = 0;
          int v102 = 0;
          int v103;
          int v104;
          v103 = v101;
          v104 = v102;
          while (true) {
            int v105 = 4;
            int v106 = v104 * v105;
            int v107 = v106 + v58;
            int v108 = 40;
            int v109 = v108 + v107;
            int v110 = v57[v109];
            int v111 = 0;
            bool v112 = v110 != v111;
            v103 = v103;
            v104 = v104;
            if (!v112) break;
            int v113 = v103 + v104;
            int v114 = 1;
            int v115 = v104 + v114;
            v103 = v113;
            v104 = v115;
          }
          bool v116 = true;
          v76 = v103;
          break;
        }
        case 2:
          {
          int v117 = 0;
          int v118 = 0;
          int v119;
          int v120;
          v119 = v117;
          v120 = v118;
          while (true) {
            int v121 = 4;
            int v122 = v120 * v121;
            int v123 = v122 + v58;
            int v124 = 60;
            int v125 = v124 + v123;
            int v126 = v57[v125];
            int v127 = 0;
            bool v128 = v126 != v127;
            v119 = v119;
            v120 = v120;
            if (!v128) break;
            int v129 = v119 + v120;
            int v130 = 1;
            int v131 = v120 + v130;
            v119 = v129;
            v120 = v131;
          }
          bool v132 = true;
          v76 = v119;
          break;
        }
      }
      bool v133 = true;
      v70 = v76;
      break;
    }
    case 0:
      {
      int v134 = 80;
      int v135 = v134 + v58;
      int v136 = v57[v135];
      int v137 = 0;
      bool v138 = v136 != v137;
      int v139;
      if (v138) {
        int v140 = 84;
        int v141 = v140 + v58;
        int v142 = v57[v141];
        int v143 = 0;
        int v144 = v58 + v143;
        int v145;
        v145 = v144;
        switch (v142) {
          default:
            {
            int v146 = 3;
            int v147 = v58 + v146;
            v145 = v147;
            break;
          }
          case 0:
            {
            int v148 = 1;
            int v149 = v58 + v148;
            v145 = v149;
            break;
          }
          case 1:
            {
            int v150 = 4;
            v145 = v150;
            break;
          }
          case 2:
            {
            int v151 = 4;
            v145 = v151;
            break;
          }
        }
        bool v152 = true;
        v139 = v145;
      } else {
        int v153 = 2;
        v139 = v153;
      }
      v70 = v139;
      break;
    }
    case 1:
      {
      int v154 = 4;
      v70 = v154;
      break;
    }
    case 2:
      {
      int v155 = 88;
      int v156 = v155 + v58;
      int v157 = v57[v156];
      int v158 = 0;
      bool v159 = v157 != v158;
      int v160;
      if (v159) {
        int v161 = 92;
        int v162 = v161 + v58;
        int v163 = v57[v162];
        int v164 = 0;
        bool v165 = v163 != v164;
        int v166;
        if (v165) {
          int v167 = 4;
          v166 = v167;
        } else {
          int v168 = 3;
          int v169 = v58 + v168;
          v166 = v169;
        }
        v160 = v166;
      } else {
        int v170 = 4;
        v160 = v170;
      }
      v70 = v160;
      break;
    }
  }
  bool v171 = true;
  int v172 = 16;
  int v173 = v172 + v58;
  bool v174 = true;
  int v175 = simt_wave_count_bits(v174);
  v56[v173] = v175;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
