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
    bool v11 = true;
    int v12 = simt_wave_count_bits(v11);
    int v13 = 16;
    int v14 = v13 + v0;
    v1[v14] = v12;
    v10 = v12;
  } else {
    int v15 = 4;
    int v16 = v3 % v15;
    int v17;
    v17 = v0;
    switch (v16) {
      default:
        {
        int v18 = 0;
        int v19 = 0;
        int v20;
        int v21;
        v20 = v18;
        v21 = v19;
        while (true) {
          int v22 = 4;
          int v23 = v3 % v22;
          int v24 = 1;
          int v25 = v23 + v24;
          bool v26 = v21 < v25;
          v20 = v20;
          v21 = v21;
          if (!v26) break;
          int v27 = 4;
          int v28 = v0 + v27;
          int v29 = 1;
          int v30 = v21 + v29;
          v20 = v28;
          v21 = v30;
        }
        v17 = v20;
        break;
      }
      case 0:
        {
        int v31 = 3;
        int v32 = v3 % v31;
        int v33 = 4;
        int v34 = v0 + v33;
        int v35;
        v35 = v34;
        switch (v32) {
          case 0:
            {
            int v36 = 0;
            v35 = v36;
          }
          default:
            {
            v35 = v0;
            break;
          }
          case 1:
            {
            int v37 = 3;
            v35 = v37;
          }
          case 2:
            {
            int v38 = 1;
            v35 = v38;
            break;
          }
        }
        v17 = v35;
        break;
      }
      case 1:
        {
        int v39 = 1;
        v17 = v39;
        break;
      }
      case 2:
        {
        int v40 = 3;
        int v41 = v0 + v40;
        v17 = v41;
        break;
      }
    }
    v10 = v17;
  }
  int v42 = 0;
  bool v43 = v2 != v42;
  int v44 = v43 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v45 [[buffer(0)]], device int* v46 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v47 = static_cast<int>(__simt_tid3.x);
  int v48 = 0;
  int v49 = v48 + v47;
  int v50 = v46[v49];
  int v51 = 4;
  int v52 = v51 + v47;
  int v53 = v46[v52];
  helper0(v47, v45, v50, v53, static_cast<int>(__simt_tid3.x));
  int v54 = 2;
  int v55 = 0;
  int v56 = 0;
  int v57;
  int v58;
  v57 = v55;
  v58 = v56;
  while (true) {
    int v59 = 4;
    int v60 = v58 * v59;
    int v61 = v60 + v47;
    int v62 = 8;
    int v63 = v62 + v61;
    int v64 = v46[v63];
    int v65 = 0;
    bool v66 = v64 != v65;
    v57 = v57;
    v58 = v58;
    if (!v66) break;
    int v67 = 28;
    int v68 = v67 + v47;
    int v69 = v46[v68];
    int v70 = 1;
    int v71;
    v71 = v70;
    switch (v69) {
      case 0:
        {
        int v72 = 3;
        int v73 = v47 + v72;
        v71 = v73;
      }
      case 1:
        {
        int v74 = 32;
        int v75 = v74 + v47;
        int v76 = v46[v75];
        int v77;
        v77 = v47;
        switch (v76) {
          default:
            {
            int v78 = 0;
            int v79 = v47 + v78;
            v77 = v79;
            break;
          }
          case 0:
            {
            int v80 = 3;
            int v81 = v47 + v80;
            v77 = v81;
          }
          case 1:
            {
            int v82 = 3;
            int v83 = v47 + v82;
            v77 = v83;
          }
          case 2:
            {
            int v84 = 0;
            v77 = v84;
            break;
          }
        }
        bool v85 = true;
        v71 = v77;
      }
      case 2:
        {
        int v86 = 36;
        int v87 = v86 + v47;
        int v88 = v46[v87];
        int v89 = 1;
        int v90 = v47 + v89;
        int v91;
        v91 = v90;
        switch (v88) {
          case 0:
            {
            int v92 = 0;
            v91 = v92;
          }
          case 1:
            {
            int v93 = 2;
            v91 = v93;
          }
          default:
            {
            v91 = v47;
          }
          case 2:
            {
            int v94 = 4;
            v91 = v94;
            break;
          }
        }
        v71 = v91;
      }
      default:
        {
        int v95 = 40;
        int v96 = v95 + v47;
        int v97 = v46[v96];
        int v98 = 2;
        int v99;
        v99 = v98;
        switch (v97) {
          case 0:
            {
            int v100 = 4;
            int v101 = v47 + v100;
            v99 = v101;
            break;
          }
          case 1:
            {
            int v102 = 4;
            v99 = v102;
            break;
          }
          default:
            {
            int v103 = 4;
            int v104 = v47 + v103;
            v99 = v104;
            break;
          }
        }
        v71 = v99;
        break;
      }
    }
    int v105 = v57 + v71;
    int v106 = 1;
    int v107 = v58 + v106;
    bool v108 = true;
    int v109 = 32;
    int v110 = 4;
    int v111 = v58 * v110;
    int v112 = v109 + v111;
    int v113 = v112 + v47;
    bool v114 = true;
    int v115 = simt_wave_count_bits(v114);
    v45[v113] = v115;
    v57 = v105;
    v58 = v107;
  }
  int v116 = 44;
  int v117 = v116 + v47;
  int v118 = v46[v117];
  uint v119 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v120 = (int)(v119);
  int v121;
  v121 = v120;
  switch (v118) {
    default:
      {
      int v122 = 48;
      int v123 = v122 + v47;
      int v124 = v46[v123];
      int v125;
      v125 = v47;
      switch (v124) {
        case 0:
          {
          int v126 = 52;
          int v127 = v126 + v47;
          int v128 = v46[v127];
          int v129 = 0;
          bool v130 = v128 != v129;
          int v131;
          if (v130) {
            v131 = v47;
          } else {
            int v132 = 3;
            v131 = v132;
          }
          v125 = v131;
        }
        default:
          {
          int v133 = 56;
          int v134 = v133 + v47;
          int v135 = v46[v134];
          int v136 = 1;
          int v137;
          v137 = v136;
          switch (v135) {
            case 0:
              {
              int v138 = 1;
              int v139 = v47 + v138;
              v137 = v139;
              break;
            }
            case 1:
              {
              int v140 = 3;
              int v141 = v47 + v140;
              v137 = v141;
              break;
            }
            case 2:
              {
              int v142 = 3;
              v137 = v142;
              break;
            }
            default:
              {
              int v143 = 0;
              int v144 = v47 + v143;
              v137 = v144;
              break;
            }
          }
          v125 = v137;
          break;
        }
        case 1:
          {
          int v145 = 0;
          int v146 = 0;
          int v147;
          int v148;
          v147 = v145;
          v148 = v146;
          while (true) {
            int v149 = 4;
            int v150 = v148 * v149;
            int v151 = v150 + v47;
            int v152 = 60;
            int v153 = v152 + v151;
            int v154 = v46[v153];
            int v155 = 0;
            bool v156 = v154 != v155;
            v147 = v147;
            v148 = v148;
            if (!v156) break;
            int v157 = v147 + v148;
            int v158 = 1;
            int v159 = v148 + v158;
            bool v160 = true;
            v147 = v157;
            v148 = v159;
          }
          v125 = v147;
          break;
        }
        case 2:
          {
          int v161 = 80;
          int v162 = v161 + v47;
          int v163 = v46[v162];
          int v164 = 0;
          int v165 = v47 + v164;
          int v166;
          v166 = v165;
          switch (v163) {
            case 0:
              {
              int v167 = 3;
              int v168 = v47 + v167;
              v166 = v168;
              break;
            }
            default:
              {
              v166 = v47;
              break;
            }
          }
          bool v169 = true;
          v125 = v166;
          break;
        }
      }
      v121 = v125;
      break;
    }
    case 0:
      {
      int v170 = 0;
      int v171 = 0;
      int v172;
      int v173;
      v172 = v170;
      v173 = v171;
      while (true) {
        int v174 = 4;
        int v175 = v173 * v174;
        int v176 = v175 + v47;
        int v177 = 84;
        int v178 = v177 + v176;
        int v179 = v46[v178];
        int v180 = 0;
        bool v181 = v179 != v180;
        v172 = v172;
        v173 = v173;
        if (!v181) break;
        int v182 = 1;
        int v183 = v47 + v182;
        int v184 = v172 + v183;
        int v185 = 1;
        int v186 = v173 + v185;
        bool v187 = true;
        v172 = v184;
        v173 = v186;
      }
      v121 = v172;
      break;
    }
    case 1:
      {
      int v188 = 0;
      v121 = v188;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
