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
  int v5 = v3 % v4;
  int v6 = 1;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 2;
        int v13 = v3 % v12;
        int v14 = 4;
        int v15;
        v15 = v14;
        switch (v13) {
          default:
            {
            v15 = v0;
            break;
          }
          case 0:
            {
            int v16 = 0;
            int v17 = v0 + v16;
            v15 = v17;
            break;
          }
        }
        int v18 = 2;
        v11 = v15;
      } else {
        int v19 = 3;
        int v20 = v0 + v19;
        v11 = v20;
      }
      v8 = v11;
    }
    case 1:
      {
      int v21 = 4;
      int v22 = v3 % v21;
      int v23 = 1;
      int v24;
      v24 = v23;
      switch (v22) {
        default:
          {
          int v25 = 4;
          int v26 = v3 % v25;
          int v27;
          v27 = v0;
          switch (v26) {
            case 0:
              {
              int v28 = 3;
              int v29 = v0 + v28;
              v27 = v29;
              break;
            }
            default:
              {
              int v30 = 2;
              v27 = v30;
              break;
            }
            case 1:
              {
              int v31 = 4;
              v27 = v31;
              break;
            }
            case 2:
              {
              int v32 = 4;
              v27 = v32;
              break;
            }
          }
          v24 = v27;
          break;
        }
        case 0:
          {
          int v33 = 2;
          int v34 = v3 % v33;
          int v35 = 2;
          int v36 = v0 + v35;
          int v37;
          v37 = v36;
          switch (v34) {
            case 0:
              {
              int v38 = 4;
              int v39 = v0 + v38;
              v37 = v39;
              break;
            }
            default:
              {
              v37 = v0;
              break;
            }
          }
          v24 = v37;
          break;
        }
        case 1:
          {
          int v40 = 0;
          v24 = v40;
          break;
        }
        case 2:
          {
          int v41 = 4;
          int v42 = v0 + v41;
          v24 = v42;
          break;
        }
      }
      v8 = v24;
      break;
    }
    default:
      {
      int v43 = 0;
      int v44 = 0;
      int v45;
      int v46;
      v45 = v43;
      v46 = v44;
      while (true) {
        int v47 = 4;
        int v48 = v3 % v47;
        int v49 = 1;
        int v50 = v48 + v49;
        bool v51 = v46 < v50;
        v45 = v45;
        v46 = v46;
        if (!v51) break;
        int v52 = 0;
        bool v53 = v2 != v52;
        int v54;
        if (v53) {
          v54 = v0;
        } else {
          v54 = v0;
        }
        int v55 = 1;
        int v56 = v46 + v55;
        v45 = v54;
        v46 = v56;
        continue;
        ;
      }
      v8 = v45;
      break;
    }
  }
  bool v57 = true;
  int v58 = simt_wave_count_bits(v57);
  int v59 = 0;
  int v60 = v59 + v0;
  v1[v60] = v58;
  return;
}

kernel void kernel_main(device int* v61 [[buffer(0)]], device int* v62 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v63 = static_cast<int>(__simt_tid3.x);
  int v64 = 0;
  int v65 = v64 + v63;
  int v66 = v62[v65];
  int v67 = 4;
  int v68 = v67 + v63;
  int v69 = v62[v68];
  helper0(v63, v61, v66, v69, static_cast<int>(__simt_tid3.x));
  uint v70 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v71 = (int)(v70);
  int v72 = 0;
  int v73 = 0;
  int v74;
  int v75;
  v74 = v72;
  v75 = v73;
  while (true) {
    int v76 = 4;
    int v77 = v75 * v76;
    int v78 = v77 + v63;
    int v79 = 8;
    int v80 = v79 + v78;
    int v81 = v62[v80];
    int v82 = 0;
    bool v83 = v81 != v82;
    v74 = v74;
    v75 = v75;
    if (!v83) break;
    int v84 = 28;
    int v85 = v84 + v63;
    int v86 = v62[v85];
    int v87 = 0;
    bool v88 = v86 != v87;
    int v89;
    if (v88) {
      int v90 = 0;
      int v91 = 0;
      int v92;
      int v93;
      v92 = v90;
      v93 = v91;
      while (true) {
        int v94 = 4;
        int v95 = v93 * v94;
        int v96 = v95 + v63;
        int v97 = 32;
        int v98 = v97 + v96;
        int v99 = v62[v98];
        int v100 = 0;
        bool v101 = v99 != v100;
        v92 = v92;
        v93 = v93;
        if (!v101) break;
        int v102 = v92 + v93;
        int v103 = 1;
        int v104 = v93 + v103;
        bool v105 = true;
        int v106 = 16;
        int v107 = 4;
        int v108 = v93 * v107;
        int v109 = v106 + v108;
        int v110 = v109 + v63;
        bool v111 = true;
        int v112 = simt_wave_count_bits(v111);
        v61[v110] = v112;
        v92 = v102;
        v93 = v104;
      }
      v89 = v92;
    } else {
      int v113 = 1;
      int v114 = v63 + v113;
      v89 = v114;
    }
    int v115 = 32;
    int v116 = v115 + v63;
    bool v117 = true;
    int v118 = simt_wave_count_bits(v117);
    v61[v116] = v118;
    int v119 = v74 + v89;
    int v120 = 1;
    int v121 = v75 + v120;
    bool v122 = true;
    int v123 = 48;
    int v124 = 4;
    int v125 = v75 * v124;
    int v126 = v123 + v125;
    int v127 = v126 + v63;
    bool v128 = true;
    int v129 = simt_wave_count_bits(v128);
    v61[v127] = v129;
    v74 = v119;
    v75 = v121;
  }
  int v130 = 52;
  int v131 = v130 + v63;
  int v132 = v62[v131];
  int v133 = 0;
  bool v134 = v132 != v133;
  int v135;
  if (v134) {
    int v136 = 0;
    int v137 = 0;
    int v138;
    int v139;
    v138 = v136;
    v139 = v137;
    while (true) {
      int v140 = 4;
      int v141 = v139 * v140;
      int v142 = v141 + v63;
      int v143 = 56;
      int v144 = v143 + v142;
      int v145 = v62[v144];
      int v146 = 0;
      bool v147 = v145 != v146;
      v138 = v138;
      v139 = v139;
      if (!v147) break;
      int v148 = 76;
      int v149 = v148 + v63;
      int v150 = v62[v149];
      int v151 = 0;
      bool v152 = v150 != v151;
      int v153;
      if (v152) {
        int v154 = 0;
        v153 = v154;
      } else {
        uint v155 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v156 = (int)(v155);
        v153 = v156;
      }
      int v157 = 64;
      int v158 = v157 + v63;
      bool v159 = true;
      int v160 = simt_wave_count_bits(v159);
      v61[v158] = v160;
      int v161 = v138 + v153;
      int v162 = 1;
      int v163 = v139 + v162;
      bool v164 = true;
      int v165 = 80;
      int v166 = 4;
      int v167 = v139 * v166;
      int v168 = v165 + v167;
      int v169 = v168 + v63;
      bool v170 = true;
      int v171 = simt_wave_count_bits(v170);
      v61[v169] = v171;
      v138 = v161;
      v139 = v163;
    }
    v135 = v138;
  } else {
    uint v172 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v173 = (int)(v172);
    v135 = v173;
  }
  int v174 = 96;
  int v175 = v174 + v63;
  bool v176 = true;
  int v177 = simt_wave_count_bits(v176);
  v61[v175] = v177;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
