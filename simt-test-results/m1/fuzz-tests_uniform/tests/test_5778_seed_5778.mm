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
  int v6 = 0;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      int v10 = 0;
      int v11;
      int v12;
      v11 = v9;
      v12 = v10;
      while (true) {
        int v13 = 4;
        int v14 = v3 % v13;
        int v15 = 1;
        int v16 = v14 + v15;
        bool v17 = v12 < v16;
        v11 = v11;
        v12 = v12;
        if (!v17) break;
        int v18;
        v18 = v0;
        switch (v3) {
          case 0:
            {
            int v19 = 2;
            int v20 = v0 + v19;
            v18 = v20;
            break;
          }
          default:
            {
            int v21 = 1;
            int v22 = v0 + v21;
            v18 = v22;
            break;
          }
        }
        int v23 = 1;
        int v24 = v12 + v23;
        v11 = v18;
        v12 = v24;
      }
      int v25 = 4;
      v8 = v11;
      break;
    }
    case 1:
      {
      int v26 = 0;
      bool v27 = v2 != v26;
      int v28;
      if (v27) {
        int v29 = 0;
        int v30 = 0;
        int v31;
        int v32;
        v31 = v29;
        v32 = v30;
        while (true) {
          int v33 = 4;
          int v34 = v3 % v33;
          int v35 = 1;
          int v36 = v34 + v35;
          bool v37 = v32 < v36;
          v31 = v31;
          v32 = v32;
          if (!v37) break;
          int v38 = 1;
          int v39 = 1;
          int v40 = v32 + v39;
          v31 = v38;
          v32 = v40;
        }
        int v41 = 4;
        v28 = v31;
      } else {
        int v42 = 1;
        v28 = v42;
      }
      int v43 = 0;
      int v44 = v0 + v43;
      v8 = v28;
      break;
    }
    default:
      {
      int v45 = 0;
      bool v46 = v2 != v45;
      int v47;
      if (v46) {
        int v48 = 4;
        v47 = v48;
      } else {
        int v49 = 1;
        v47 = v49;
      }
      v8 = v47;
      break;
    }
    case 2:
      {
      int v50 = 4;
      int v51 = v3 % v50;
      int v52;
      v52 = v0;
      switch (v51) {
        case 0:
          {
          v52 = v0;
          break;
        }
        default:
          {
          int v53 = 3;
          v52 = v53;
          break;
        }
        case 1:
          {
          int v54 = 0;
          int v55 = 0;
          int v56;
          int v57;
          v56 = v54;
          v57 = v55;
          while (true) {
            int v58 = 4;
            int v59 = v3 % v58;
            int v60 = 1;
            int v61 = v59 + v60;
            bool v62 = v57 < v61;
            v56 = v56;
            v57 = v57;
            if (!v62) break;
            int v63 = 1;
            int v64 = v57 + v63;
            v56 = v0;
            v57 = v64;
          }
          int v65 = 0;
          v52 = v56;
          break;
        }
        case 2:
          {
          int v66 = 2;
          int v67 = v0 + v66;
          v52 = v67;
          break;
        }
      }
      int v68 = 4;
      v8 = v52;
      break;
    }
  }
  bool v69 = true;
  int v70 = simt_wave_count_bits(v69);
  int v71 = 0;
  int v72 = v71 + v0;
  v1[v72] = v70;
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
  int v82 = 0;
  int v83 = 0;
  int v84;
  int v85;
  v84 = v82;
  v85 = v83;
  while (true) {
    int v86 = 4;
    int v87 = v85 * v86;
    int v88 = v87 + v75;
    int v89 = 8;
    int v90 = v89 + v88;
    int v91 = v74[v90];
    int v92 = 0;
    bool v93 = v91 != v92;
    v84 = v84;
    v85 = v85;
    if (!v93) break;
    int v94 = v84 + v85;
    int v95 = 1;
    int v96 = v85 + v95;
    v84 = v94;
    v85 = v96;
  }
  bool v97 = true;
  int v98 = 16;
  int v99 = v98 + v75;
  bool v100 = true;
  int v101 = simt_wave_count_bits(v100);
  v73[v99] = v101;
  int v102 = 28;
  int v103 = v102 + v75;
  int v104 = v74[v103];
  int v105 = 1;
  int v106;
  v106 = v105;
  switch (v104) {
    default:
      {
      int v107 = 1;
      int v108 = v75 + v107;
      v106 = v108;
      break;
    }
    case 0:
      {
      int v109 = 0;
      int v110 = 0;
      int v111;
      int v112;
      v111 = v109;
      v112 = v110;
      while (true) {
        int v113 = 4;
        int v114 = v112 * v113;
        int v115 = v114 + v75;
        int v116 = 32;
        int v117 = v116 + v115;
        int v118 = v74[v117];
        int v119 = 0;
        bool v120 = v118 != v119;
        v111 = v111;
        v112 = v112;
        if (!v120) break;
        int v121 = 52;
        int v122 = v121 + v75;
        int v123 = v74[v122];
        int v124 = 0;
        bool v125 = v123 != v124;
        int v126;
        if (v125) {
          int v127 = 1;
          v126 = v127;
        } else {
          int v128 = 0;
          int v129 = v75 + v128;
          v126 = v129;
        }
        int v130 = v111 + v126;
        int v131 = 1;
        int v132 = v112 + v131;
        v111 = v130;
        v112 = v132;
      }
      bool v133 = true;
      v106 = v111;
      break;
    }
  }
  bool v134 = true;
  int v135 = 32;
  int v136 = v135 + v75;
  bool v137 = true;
  int v138 = simt_wave_count_bits(v137);
  v73[v136] = v138;
  int v139 = 56;
  int v140 = v139 + v75;
  int v141 = v74[v140];
  int v142 = 3;
  int v143 = v75 + v142;
  int v144;
  v144 = v143;
  switch (v141) {
    default:
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
        int v151 = v150 + v75;
        int v152 = 60;
        int v153 = v152 + v151;
        int v154 = v74[v153];
        int v155 = 0;
        bool v156 = v154 != v155;
        v147 = v147;
        v148 = v148;
        if (!v156) break;
        int v157 = 80;
        int v158 = v157 + v75;
        int v159 = v74[v158];
        int v160;
        v160 = v75;
        switch (v159) {
          case 0:
            {
            int v161 = 3;
            v160 = v161;
            break;
          }
          default:
            {
            int v162 = 3;
            v160 = v162;
            break;
          }
        }
        bool v163 = true;
        int v164 = v147 + v160;
        int v165 = 1;
        int v166 = v148 + v165;
        v147 = v164;
        v148 = v166;
      }
      bool v167 = true;
      v144 = v147;
      break;
    }
    case 0:
      {
      int v168 = 84;
      int v169 = v168 + v75;
      int v170 = v74[v169];
      int v171 = 0;
      bool v172 = v170 != v171;
      int v173;
      if (v172) {
        v173 = v75;
      } else {
        int v174 = 88;
        int v175 = v174 + v75;
        int v176 = v74[v175];
        int v177 = 0;
        bool v178 = v176 != v177;
        int v179;
        if (v178) {
          int v180 = 2;
          v179 = v180;
        } else {
          int v181 = 2;
          v179 = v181;
        }
        v173 = v179;
      }
      v144 = v173;
      break;
    }
  }
  bool v182 = true;
  int v183 = 48;
  int v184 = v183 + v75;
  bool v185 = true;
  int v186 = simt_wave_count_bits(v185);
  v73[v184] = v186;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 92; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
