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
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
  }
  int v22 = 3;
  int v23 = v3 % v22;
  int v24 = 1;
  int v25 = v0 + v24;
  int v26;
  v26 = v25;
  switch (v23) {
    case 0:
      {
      int v27 = 0;
      bool v28 = v2 != v27;
      int v29;
      if (v28) {
        int v30 = 0;
        int v31 = 0;
        int v32;
        int v33;
        v32 = v30;
        v33 = v31;
        while (true) {
          int v34 = 4;
          int v35 = v3 % v34;
          int v36 = 1;
          int v37 = v35 + v36;
          bool v38 = v33 < v37;
          v32 = v32;
          v33 = v33;
          if (!v38) break;
          int v39 = 1;
          int v40 = v0 + v39;
          int v41 = 1;
          int v42 = v33 + v41;
          v32 = v40;
          v33 = v42;
        }
        v29 = v32;
      } else {
        int v43 = 2;
        int v44 = v3 % v43;
        int v45 = 1;
        int v46 = v0 + v45;
        int v47;
        v47 = v46;
        switch (v44) {
          case 0:
            {
            v47 = v0;
          }
          default:
            {
            int v48 = 2;
            int v49 = v0 + v48;
            v47 = v49;
            break;
          }
          case 1:
            {
            int v50 = 4;
            v47 = v50;
            break;
          }
        }
        v29 = v47;
      }
      v26 = v29;
    }
    default:
      {
      int v51 = 0;
      bool v52 = v2 != v51;
      int v53;
      if (v52) {
        int v54 = 0;
        bool v55 = v2 != v54;
        int v56;
        if (v55) {
          v56 = v0;
        } else {
          int v57 = 1;
          v56 = v57;
        }
        v53 = v56;
      } else {
        int v58 = 0;
        bool v59 = v2 != v58;
        int v60;
        if (v59) {
          int v61 = 1;
          v60 = v61;
        } else {
          v60 = v0;
        }
        v53 = v60;
      }
      v26 = v53;
    }
    case 1:
      {
      int v62 = 0;
      int v63 = 0;
      int v64;
      int v65;
      v64 = v62;
      v65 = v63;
      while (true) {
        int v66 = 4;
        int v67 = v3 % v66;
        int v68 = 1;
        int v69 = v67 + v68;
        bool v70 = v65 < v69;
        v64 = v64;
        v65 = v65;
        if (!v70) break;
        int v71 = 0;
        int v72 = v0 + v71;
        int v73 = 1;
        int v74 = v65 + v73;
        v64 = v72;
        v65 = v74;
        break;
        ;
      }
      v26 = v64;
      break;
    }
    case 2:
      {
      int v75 = 0;
      bool v76 = v2 != v75;
      int v77;
      if (v76) {
        int v78 = 0;
        int v79 = 0;
        int v80;
        int v81;
        v80 = v78;
        v81 = v79;
        while (true) {
          int v82 = 4;
          int v83 = v3 % v82;
          int v84 = 1;
          int v85 = v83 + v84;
          bool v86 = v81 < v85;
          v80 = v80;
          v81 = v81;
          if (!v86) break;
          int v87 = 1;
          int v88 = v81 + v87;
          v80 = v0;
          v81 = v88;
          break;
          ;
        }
        v77 = v80;
      } else {
        int v89 = 4;
        v77 = v89;
      }
      v26 = v77;
      break;
    }
  }
  int v90 = 0;
  bool v91 = v2 != v90;
  int v92 = v91 ? v6 : v26;
  return;
}

kernel void kernel_main(device int* v93 [[buffer(0)]], device int* v94 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v95 = static_cast<int>(__simt_tid3.x);
  int v96 = 0;
  int v97 = v96 + v95;
  int v98 = v94[v97];
  int v99 = 4;
  int v100 = v99 + v95;
  int v101 = v94[v100];
  helper0(v95, v93, v98, v101, static_cast<int>(__simt_tid3.x));
  int v102 = 0;
  int v103 = 0;
  int v104;
  int v105;
  v104 = v102;
  v105 = v103;
  while (true) {
    int v106 = 4;
    int v107 = v105 * v106;
    int v108 = v107 + v95;
    int v109 = 8;
    int v110 = v109 + v108;
    int v111 = v94[v110];
    int v112 = 0;
    bool v113 = v111 != v112;
    v104 = v104;
    v105 = v105;
    if (!v113) break;
    int v114 = v104 + v105;
    int v115 = 1;
    int v116 = v105 + v115;
    bool v117 = true;
    int v118 = 16;
    int v119 = 4;
    int v120 = v105 * v119;
    int v121 = v118 + v120;
    int v122 = v121 + v95;
    bool v123 = true;
    int v124 = simt_wave_count_bits(v123);
    v93[v122] = v124;
    v104 = v114;
    v105 = v116;
  }
  int v125 = 28;
  int v126 = v125 + v95;
  int v127 = v94[v126];
  uint v128 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v129 = (int)(v128);
  int v130;
  v130 = v129;
  switch (v127) {
    default:
      {
      int v131 = 32;
      int v132 = v131 + v95;
      int v133 = v94[v132];
      int v134 = 0;
      bool v135 = v133 != v134;
      int v136;
      if (v135) {
        int v137 = 36;
        int v138 = v137 + v95;
        int v139 = v94[v138];
        int v140 = 0;
        bool v141 = v139 != v140;
        int v142;
        if (v141) {
          int v143 = 4;
          v142 = v143;
        } else {
          int v144 = 2;
          int v145 = v95 + v144;
          v142 = v145;
        }
        v136 = v142;
      } else {
        int v146 = 0;
        int v147 = 0;
        int v148;
        int v149;
        v148 = v146;
        v149 = v147;
        while (true) {
          int v150 = 4;
          int v151 = v149 * v150;
          int v152 = v151 + v95;
          int v153 = 40;
          int v154 = v153 + v152;
          int v155 = v94[v154];
          int v156 = 0;
          bool v157 = v155 != v156;
          v148 = v148;
          v149 = v149;
          if (!v157) break;
          int v158 = v148 + v149;
          int v159 = 1;
          int v160 = v149 + v159;
          bool v161 = true;
          v148 = v158;
          v149 = v160;
        }
        v136 = v148;
      }
      v130 = v136;
      break;
    }
    case 0:
      {
      int v162 = 60;
      int v163 = v162 + v95;
      int v164 = v94[v163];
      int v165 = 0;
      bool v166 = v164 != v165;
      int v167;
      if (v166) {
        int v168 = 0;
        int v169 = 0;
        int v170;
        int v171;
        v170 = v168;
        v171 = v169;
        while (true) {
          int v172 = 4;
          int v173 = v171 * v172;
          int v174 = v173 + v95;
          int v175 = 64;
          int v176 = v175 + v174;
          int v177 = v94[v176];
          int v178 = 0;
          bool v179 = v177 != v178;
          v170 = v170;
          v171 = v171;
          if (!v179) break;
          int v180 = v170 + v171;
          int v181 = 1;
          int v182 = v171 + v181;
          bool v183 = true;
          v170 = v180;
          v171 = v182;
        }
        v167 = v170;
      } else {
        int v184 = 84;
        int v185 = v184 + v95;
        int v186 = v94[v185];
        int v187 = 0;
        int v188;
        v188 = v187;
        switch (v186) {
          case 0:
            {
            int v189 = 3;
            int v190 = v95 + v189;
            v188 = v190;
            break;
          }
          default:
            {
            int v191 = 2;
            int v192 = v95 + v191;
            v188 = v192;
            break;
          }
        }
        v167 = v188;
      }
      v130 = v167;
      break;
    }
  }
  bool v193 = true;
  int v194 = 32;
  int v195 = v194 + v95;
  bool v196 = true;
  int v197 = simt_wave_count_bits(v196);
  v93[v195] = v197;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
