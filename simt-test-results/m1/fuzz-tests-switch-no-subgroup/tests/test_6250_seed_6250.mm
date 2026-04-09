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
    uint v13 = simt_lane_id(__simt_tid);
    int v14 = (int)(v13);
    int v15;
    v15 = v14;
    switch (v12) {
      case 0:
        {
        int v16 = 3;
        int v17 = v3 % v16;
        int v18;
        v18 = v0;
        switch (v17) {
          case 0:
            {
            v18 = v0;
          }
          default:
            {
            v18 = v0;
          }
          case 1:
            {
            int v19 = 2;
            int v20 = v0 + v19;
            v18 = v20;
            break;
          }
        }
        v15 = v18;
      }
      case 1:
        {
        int v21 = 0;
        int v22 = 0;
        int v23;
        int v24;
        v23 = v21;
        v24 = v22;
        while (true) {
          int v25 = 4;
          int v26 = v3 % v25;
          int v27 = 1;
          int v28 = v26 + v27;
          bool v29 = v24 < v28;
          v23 = v23;
          v24 = v24;
          if (!v29) break;
          int v30 = 1;
          int v31 = v0 + v30;
          int v32 = 1;
          int v33 = v24 + v32;
          v23 = v31;
          v24 = v33;
          break;
          ;
        }
        v15 = v23;
        break;
      }
      default:
        {
        int v34 = 0;
        bool v35 = v2 != v34;
        int v36;
        if (v35) {
          v36 = v0;
        } else {
          int v37 = 4;
          v36 = v37;
        }
        v15 = v36;
        break;
      }
    }
    v10 = v15;
  } else {
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
      int v48 = 0;
      int v49;
      int v50;
      v49 = v47;
      v50 = v48;
      while (true) {
        int v51 = 4;
        int v52 = v3 % v51;
        int v53 = 1;
        int v54 = v52 + v53;
        bool v55 = v50 < v54;
        v49 = v49;
        v50 = v50;
        if (!v55) break;
        bool v56 = true;
        int v57 = simt_wave_count_bits(v56);
        int v58 = 16;
        int v59 = 4;
        int v60 = v50 * v59;
        int v61 = v58 + v60;
        int v62 = v61 + v0;
        v1[v62] = v57;
        int v63 = 1;
        int v64 = v50 + v63;
        v49 = v57;
        v50 = v64;
      }
      int v65 = 1;
      int v66 = v41 + v65;
      v40 = v49;
      v41 = v66;
    }
    v10 = v40;
  }
  int v67 = 0;
  bool v68 = v2 != v67;
  int v69 = v68 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v70 [[buffer(0)]], device int* v71 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v72 = static_cast<int>(__simt_tid3.x);
  int v73 = 0;
  int v74 = v73 + v72;
  int v75 = v71[v74];
  int v76 = 4;
  int v77 = v76 + v72;
  int v78 = v71[v77];
  int v79 = 0;
  bool v80 = v75 != v79;
  if (v80) {
    int v81 = 8;
    int v82 = v81 + v72;
    int v83 = v71[v82];
    int v84 = 0;
    bool v85 = v83 != v84;
    if (v85) {
    } else {
      int v86 = 3;
      int v87 = v72 % v86;
      int v88;
      v88 = v72;
      switch (v87) {
        case 0:
          {
          int v89 = 1;
          int v90 = v88 + v89;
          v88 = v90;
          break;
        }
        case 1:
          {
          int v91 = 4;
          int v92 = v88 + v91;
          v88 = v92;
          break;
        }
        case 2:
          {
          int v93 = 4;
          int v94 = v88 + v93;
          v88 = v94;
          break;
        }
        default:
          {
          int v95 = 3;
          int v96 = v88 + v95;
          v88 = v96;
          break;
        }
      }
      helper0(v72, v70, v75, v78, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v97 = 12;
  int v98 = v97 + v72;
  int v99 = v71[v98];
  int v100 = 0;
  bool v101 = v99 != v100;
  int v102;
  if (v101) {
    int v103 = 16;
    int v104 = v103 + v72;
    int v105 = v71[v104];
    int v106 = 0;
    bool v107 = v105 != v106;
    int v108;
    if (v107) {
      int v109 = 20;
      int v110 = v109 + v72;
      int v111 = v71[v110];
      int v112 = 0;
      bool v113 = v111 != v112;
      int v114;
      if (v113) {
        int v115 = 2;
        v114 = v115;
      } else {
        uint v116 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v117 = (int)(v116);
        v114 = v117;
      }
      int v118 = 32;
      int v119 = v118 + v72;
      bool v120 = true;
      int v121 = simt_wave_count_bits(v120);
      v70[v119] = v121;
      v108 = v114;
    } else {
      int v122 = 24;
      int v123 = v122 + v72;
      int v124 = v71[v123];
      int v125 = 0;
      bool v126 = v124 != v125;
      int v127;
      if (v126) {
        uint v128 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v129 = (int)(v128);
        v127 = v129;
      } else {
        v127 = v72;
      }
      int v130 = 48;
      int v131 = v130 + v72;
      bool v132 = true;
      int v133 = simt_wave_count_bits(v132);
      v70[v131] = v133;
      v108 = v127;
    }
    int v134 = 64;
    int v135 = v134 + v72;
    bool v136 = true;
    int v137 = simt_wave_count_bits(v136);
    v70[v135] = v137;
    v102 = v108;
  } else {
    int v138 = 28;
    int v139 = v138 + v72;
    int v140 = v71[v139];
    uint v141 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v142 = (int)(v141);
    int v143;
    v143 = v142;
    switch (v140) {
      default:
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
          int v150 = v149 + v72;
          int v151 = 32;
          int v152 = v151 + v150;
          int v153 = v71[v152];
          int v154 = 0;
          bool v155 = v153 != v154;
          v146 = v146;
          v147 = v147;
          if (!v155) break;
          int v156 = v146 + v147;
          int v157 = 1;
          int v158 = v147 + v157;
          bool v159 = true;
          v146 = v156;
          v147 = v158;
        }
        v143 = v146;
        break;
      }
      case 0:
        {
        int v160 = 0;
        int v161 = 0;
        int v162;
        int v163;
        v162 = v160;
        v163 = v161;
        while (true) {
          int v164 = 4;
          int v165 = v163 * v164;
          int v166 = v165 + v72;
          int v167 = 52;
          int v168 = v167 + v166;
          int v169 = v71[v168];
          int v170 = 0;
          bool v171 = v169 != v170;
          v162 = v162;
          v163 = v163;
          if (!v171) break;
          int v172 = v162 + v163;
          int v173 = 1;
          int v174 = v163 + v173;
          bool v175 = true;
          v162 = v172;
          v163 = v174;
        }
        v143 = v162;
        break;
      }
    }
    bool v176 = true;
    int v177 = 80;
    int v178 = v177 + v72;
    bool v179 = true;
    int v180 = simt_wave_count_bits(v179);
    v70[v178] = v180;
    v102 = v143;
  }
  int v181 = 96;
  int v182 = v181 + v72;
  bool v183 = true;
  int v184 = simt_wave_count_bits(v183);
  v70[v182] = v184;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
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
