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
  int v4 = 4;
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
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
        int v18 = 3;
        int v19 = v3 % v18;
        int v20;
        v20 = v0;
        switch (v19) {
          default:
            {
            int v21 = 1;
            v20 = v21;
            break;
          }
          case 0:
            {
            int v22 = 3;
            v20 = v22;
            break;
          }
          case 1:
            {
            int v23 = 0;
            v20 = v23;
            break;
          }
        }
        int v24 = 1;
        int v25 = v12 + v24;
        v11 = v20;
        v12 = v25;
        break;
        ;
      }
      int v26 = 4;
      v8 = v11;
    }
    default:
      {
      int v27;
      v27 = v0;
      switch (v3) {
        default:
          {
          int v28 = 0;
          bool v29 = v2 != v28;
          int v30;
          if (v29) {
            v30 = v0;
          } else {
            int v31 = 2;
            v30 = v31;
          }
          int v32 = 1;
          v27 = v30;
          break;
        }
        case 0:
          {
          int v33 = 0;
          bool v34 = v2 != v33;
          int v35;
          if (v34) {
            int v36 = 2;
            v35 = v36;
          } else {
            int v37 = 3;
            int v38 = v0 + v37;
            v35 = v38;
          }
          v27 = v35;
          break;
        }
      }
      int v39 = 4;
      v8 = v27;
      break;
    }
    case 1:
      {
      int v40 = 0;
      int v41 = 0;
      int v42;
      int v43;
      v42 = v40;
      v43 = v41;
      while (true) {
        int v44 = 4;
        int v45 = v3 % v44;
        int v46 = 1;
        int v47 = v45 + v46;
        bool v48 = v43 < v47;
        v42 = v42;
        v43 = v43;
        if (!v48) break;
        int v49 = 0;
        bool v50 = v2 != v49;
        int v51;
        if (v50) {
          int v52 = 0;
          v51 = v52;
        } else {
          int v53 = 4;
          v51 = v53;
        }
        int v54 = 3;
        int v55 = v0 + v54;
        int v56 = 1;
        int v57 = v43 + v56;
        v42 = v51;
        v43 = v57;
      }
      v8 = v42;
    }
    case 2:
      {
      int v58 = 4;
      int v59 = v3 % v58;
      int v60;
      v60 = v0;
      switch (v59) {
        case 0:
          {
          int v61 = 0;
          int v62 = 0;
          int v63;
          int v64;
          v63 = v61;
          v64 = v62;
          while (true) {
            int v65 = 4;
            int v66 = v3 % v65;
            int v67 = 1;
            int v68 = v66 + v67;
            bool v69 = v64 < v68;
            v63 = v63;
            v64 = v64;
            if (!v69) break;
            int v70 = 1;
            int v71 = v0 + v70;
            int v72 = 1;
            int v73 = v64 + v72;
            v63 = v71;
            v64 = v73;
          }
          int v74 = 3;
          int v75 = v0 + v74;
          v60 = v63;
          break;
        }
        case 1:
          {
          int v76 = 2;
          int v77 = v3 % v76;
          int v78 = 3;
          int v79;
          v79 = v78;
          switch (v77) {
            default:
              {
              int v80 = 4;
              int v81 = v0 + v80;
              v79 = v81;
              break;
            }
            case 0:
              {
              v79 = v0;
              break;
            }
          }
          int v82 = 4;
          int v83 = v0 + v82;
          v60 = v79;
          break;
        }
        default:
          {
          int v84 = 3;
          int v85 = v3 % v84;
          int v86 = 2;
          int v87 = v0 + v86;
          int v88;
          v88 = v87;
          switch (v85) {
            case 0:
              {
              int v89 = 1;
              v88 = v89;
            }
            case 1:
              {
              int v90 = 3;
              int v91 = v0 + v90;
              v88 = v91;
            }
            case 2:
              {
              int v92 = 1;
              int v93 = v0 + v92;
              v88 = v93;
              break;
            }
            default:
              {
              v88 = v0;
              break;
            }
          }
          int v94 = 0;
          v60 = v88;
          break;
        }
        case 2:
          {
          int v95 = 2;
          int v96 = v3 % v95;
          int v97;
          v97 = v0;
          switch (v96) {
            default:
              {
              int v98 = 1;
              v97 = v98;
              break;
            }
            case 0:
              {
              v97 = v0;
              break;
            }
            case 1:
              {
              int v99 = 3;
              int v100 = v0 + v99;
              v97 = v100;
              break;
            }
          }
          v60 = v97;
          break;
        }
      }
      int v101 = 2;
      int v102 = v0 + v101;
      v8 = v60;
      break;
    }
  }
  bool v103 = true;
  int v104 = simt_wave_count_bits(v103);
  int v105 = 0;
  int v106 = v105 + v0;
  v1[v106] = v104;
  return;
}

kernel void kernel_main(device int* v107 [[buffer(0)]], device int* v108 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v109 = static_cast<int>(__simt_tid3.x);
  int v110 = 0;
  int v111 = v110 + v109;
  int v112 = v108[v111];
  int v113 = 4;
  int v114 = v113 + v109;
  int v115 = v108[v114];
  helper0(v109, v107, v112, v115, static_cast<int>(__simt_tid3.x));
  int v116 = 8;
  int v117 = v116 + v109;
  int v118 = v108[v117];
  int v119 = 0;
  bool v120 = v118 != v119;
  int v121;
  if (v120) {
    uint v122 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v123 = (int)(v122);
    v121 = v123;
  } else {
    int v124 = 0;
    int v125 = 0;
    int v126;
    int v127;
    v126 = v124;
    v127 = v125;
    while (true) {
      int v128 = 4;
      int v129 = v127 * v128;
      int v130 = v129 + v109;
      int v131 = 12;
      int v132 = v131 + v130;
      int v133 = v108[v132];
      int v134 = 0;
      bool v135 = v133 != v134;
      v126 = v126;
      v127 = v127;
      if (!v135) break;
      int v136 = 0;
      int v137 = 0;
      int v138;
      int v139;
      v138 = v136;
      v139 = v137;
      while (true) {
        int v140 = 4;
        int v141 = v139 * v140;
        int v142 = v141 + v109;
        int v143 = 32;
        int v144 = v143 + v142;
        int v145 = v108[v144];
        int v146 = 0;
        bool v147 = v145 != v146;
        v138 = v138;
        v139 = v139;
        if (!v147) break;
        int v148 = v138 + v139;
        int v149 = 1;
        int v150 = v139 + v149;
        v138 = v148;
        v139 = v150;
      }
      bool v151 = true;
      int v152 = v126 + v138;
      int v153 = 1;
      int v154 = v127 + v153;
      v126 = v152;
      v127 = v154;
    }
    bool v155 = true;
    v121 = v126;
  }
  int v156 = 16;
  int v157 = v156 + v109;
  bool v158 = true;
  int v159 = simt_wave_count_bits(v158);
  v107[v157] = v159;
  int v160 = 52;
  int v161 = v160 + v109;
  int v162 = v108[v161];
  int v163 = 1;
  int v164;
  v164 = v163;
  switch (v162) {
    default:
      {
      int v165 = 0;
      int v166 = 0;
      int v167;
      int v168;
      v167 = v165;
      v168 = v166;
      while (true) {
        int v169 = 4;
        int v170 = v168 * v169;
        int v171 = v170 + v109;
        int v172 = 56;
        int v173 = v172 + v171;
        int v174 = v108[v173];
        int v175 = 0;
        bool v176 = v174 != v175;
        v167 = v167;
        v168 = v168;
        if (!v176) break;
        int v177 = 0;
        int v178 = 0;
        int v179;
        int v180;
        v179 = v177;
        v180 = v178;
        while (true) {
          int v181 = 4;
          int v182 = v180 * v181;
          int v183 = v182 + v109;
          int v184 = 76;
          int v185 = v184 + v183;
          int v186 = v108[v185];
          int v187 = 0;
          bool v188 = v186 != v187;
          v179 = v179;
          v180 = v180;
          if (!v188) break;
          int v189 = v179 + v180;
          int v190 = 1;
          int v191 = v180 + v190;
          v179 = v189;
          v180 = v191;
        }
        bool v192 = true;
        int v193 = v167 + v179;
        int v194 = 1;
        int v195 = v168 + v194;
        v167 = v193;
        v168 = v195;
        continue;
        ;
      }
      bool v196 = true;
      v164 = v167;
      break;
    }
    case 0:
      {
      int v197 = 2;
      int v198 = v109 + v197;
      v164 = v198;
      break;
    }
  }
  bool v199 = true;
  int v200 = 32;
  int v201 = v200 + v109;
  bool v202 = true;
  int v203 = simt_wave_count_bits(v202);
  v107[v201] = v203;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
