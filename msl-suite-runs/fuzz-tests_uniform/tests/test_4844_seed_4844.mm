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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 0;
  int v7 = 0;
  int v8;
  int v9;
  v8 = v6;
  v9 = v7;
  while (true) {
    int v10 = 4;
    int v11 = v3 % v10;
    int v12 = 1;
    int v13 = v11 + v12;
    bool v14 = v9 < v13;
    v8 = v8;
    v9 = v9;
    if (!v14) break;
    uint v15 = simt_subgroup_id(__simt_tid);
    int v16 = (int)(v15);
    int v17 = 1;
    int v18 = v9 + v17;
    v8 = v16;
    v9 = v18;
  }
  bool v19 = true;
  int v20 = simt_wave_count_bits(v19);
  int v21 = 0;
  int v22 = v21 + v0;
  v1[v22] = v20;
  int v23 = 0;
  bool v24 = v2 != v23;
  int v25 = v24 ? v5 : v8;
  int v26 = 0;
  bool v27 = v2 != v26;
  int v28;
  if (v27) {
    int v29 = 0;
    int v30 = v0 + v29;
    v28 = v30;
  } else {
    int v31 = 4;
    int v32 = v3 % v31;
    uint v33 = simt_subgroup_id(__simt_tid);
    int v34 = (int)(v33);
    int v35;
    v35 = v34;
    switch (v32) {
      case 0:
        {
        int v36 = 2;
        int v37 = v3 % v36;
        int v38 = 2;
        int v39;
        v39 = v38;
        switch (v37) {
          default:
            {
            v39 = v0;
            break;
          }
          case 0:
            {
            v39 = v0;
            break;
          }
        }
        int v40 = 3;
        v35 = v39;
        break;
      }
      case 1:
        {
        int v41 = 0;
        bool v42 = v2 != v41;
        int v43;
        if (v42) {
          v43 = v0;
        } else {
          int v44 = 0;
          int v45 = v0 + v44;
          v43 = v45;
        }
        v35 = v43;
        break;
      }
      default:
        {
        int v46 = 0;
        int v47 = 0;
        int v48;
        int v49;
        v48 = v46;
        v49 = v47;
        while (true) {
          int v50 = 4;
          int v51 = v3 % v50;
          int v52 = 1;
          int v53 = v51 + v52;
          bool v54 = v49 < v53;
          v48 = v48;
          v49 = v49;
          if (!v54) break;
          int v55 = 3;
          int v56 = v0 + v55;
          int v57 = 1;
          int v58 = v49 + v57;
          v48 = v56;
          v49 = v58;
        }
        int v59 = 4;
        v35 = v48;
        break;
      }
      case 2:
        {
        int v60 = 4;
        int v61 = v3 % v60;
        int v62 = 0;
        int v63 = v0 + v62;
        int v64;
        v64 = v63;
        switch (v61) {
          case 0:
            {
            int v65 = 4;
            int v66 = v0 + v65;
            v64 = v66;
            break;
          }
          case 1:
            {
            int v67 = 2;
            v64 = v67;
          }
          case 2:
            {
            int v68 = 2;
            v64 = v68;
          }
          default:
            {
            v64 = v0;
            break;
          }
        }
        v35 = v64;
        break;
      }
    }
    uint v69 = simt_subgroup_id(__simt_tid);
    int v70 = (int)(v69);
    v28 = v35;
  }
  bool v71 = true;
  int v72 = simt_wave_count_bits(v71);
  int v73 = 16;
  int v74 = v73 + v0;
  v1[v74] = v72;
  int v75 = 0;
  bool v76 = v2 != v75;
  int v77 = v76 ? v25 : v28;
  return;
}

kernel void kernel_main(device int* v78 [[buffer(0)]], device int* v79 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v80 = static_cast<int>(__simt_tid3.x);
  int v81 = 0;
  int v82 = v81 + v80;
  int v83 = v79[v82];
  int v84 = 4;
  int v85 = v84 + v80;
  int v86 = v79[v85];
  helper0(v80, v78, v83, v86, static_cast<int>(__simt_tid3.x));
  int v87 = 3;
  int v88 = v80 + v87;
  uint v89 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v90 = (int)(v89);
  int v91 = 8;
  int v92 = v91 + v80;
  int v93 = v79[v92];
  int v94 = 0;
  bool v95 = v93 != v94;
  int v96;
  if (v95) {
    uint v97 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v98 = (int)(v97);
    v96 = v98;
  } else {
    uint v99 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v100 = (int)(v99);
    v96 = v100;
  }
  int v101 = 32;
  int v102 = v101 + v80;
  bool v103 = true;
  int v104 = simt_wave_count_bits(v103);
  v78[v102] = v104;
  int v105 = 12;
  int v106 = v105 + v80;
  int v107 = v79[v106];
  int v108 = 2;
  int v109 = v80 + v108;
  int v110;
  v110 = v109;
  switch (v107) {
    case 0:
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
        int v117 = v116 + v80;
        int v118 = 16;
        int v119 = v118 + v117;
        int v120 = v79[v119];
        int v121 = 0;
        bool v122 = v120 != v121;
        v113 = v113;
        v114 = v114;
        if (!v122) break;
        int v123 = v113 + v114;
        int v124 = 1;
        int v125 = v114 + v124;
        v113 = v123;
        v114 = v125;
      }
      bool v126 = true;
      v110 = v113;
      break;
    }
    default:
      {
      int v127 = 3;
      v110 = v127;
      break;
    }
    case 1:
      {
      int v128 = 36;
      int v129 = v128 + v80;
      int v130 = v79[v129];
      int v131 = 0;
      bool v132 = v130 != v131;
      int v133;
      if (v132) {
        int v134 = 40;
        int v135 = v134 + v80;
        int v136 = v79[v135];
        int v137 = 0;
        bool v138 = v136 != v137;
        int v139;
        if (v138) {
          int v140 = 2;
          int v141 = v80 + v140;
          v139 = v141;
        } else {
          v139 = v80;
        }
        v133 = v139;
      } else {
        int v142 = 0;
        int v143 = 0;
        int v144;
        int v145;
        v144 = v142;
        v145 = v143;
        while (true) {
          int v146 = 4;
          int v147 = v145 * v146;
          int v148 = v147 + v80;
          int v149 = 44;
          int v150 = v149 + v148;
          int v151 = v79[v150];
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
          continue;
          ;
        }
        bool v157 = true;
        v133 = v144;
      }
      v110 = v133;
      break;
    }
    case 2:
      {
      int v158 = 0;
      int v159 = 0;
      int v160;
      int v161;
      v160 = v158;
      v161 = v159;
      while (true) {
        int v162 = 4;
        int v163 = v161 * v162;
        int v164 = v163 + v80;
        int v165 = 64;
        int v166 = v165 + v164;
        int v167 = v79[v166];
        int v168 = 0;
        bool v169 = v167 != v168;
        v160 = v160;
        v161 = v161;
        if (!v169) break;
        int v170 = 84;
        int v171 = v170 + v80;
        int v172 = v79[v171];
        int v173 = 0;
        bool v174 = v172 != v173;
        int v175;
        if (v174) {
          int v176 = 0;
          int v177 = v80 + v176;
          v175 = v177;
        } else {
          int v178 = 2;
          int v179 = v80 + v178;
          v175 = v179;
        }
        int v180 = v160 + v175;
        int v181 = 1;
        int v182 = v161 + v181;
        v160 = v180;
        v161 = v182;
      }
      bool v183 = true;
      v110 = v160;
      break;
    }
  }
  bool v184 = true;
  int v185 = 48;
  int v186 = v185 + v80;
  bool v187 = true;
  int v188 = simt_wave_count_bits(v187);
  v78[v186] = v188;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
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
