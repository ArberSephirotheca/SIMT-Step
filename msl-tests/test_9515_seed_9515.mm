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
  int v6 = 1;
  int v7;
  v7 = v6;
  switch (v5) {
    default:
      {
      int v8 = 0;
      bool v9 = v2 != v8;
      int v10;
      if (v9) {
        int v11 = 0;
        int v12 = 0;
        int v13;
        int v14;
        v13 = v11;
        v14 = v12;
        while (true) {
          int v15 = 4;
          int v16 = v3 % v15;
          int v17 = 1;
          int v18 = v16 + v17;
          bool v19 = v14 < v18;
          v13 = v13;
          v14 = v14;
          if (!v19) break;
          int v20 = 1;
          int v21 = v0 + v20;
          int v22 = 1;
          int v23 = v14 + v22;
          v13 = v21;
          v14 = v23;
          continue;
          ;
        }
        int v24 = 3;
        int v25 = v0 + v24;
        v10 = v13;
      } else {
        int v26 = 0;
        bool v27 = v2 != v26;
        int v28;
        if (v27) {
          v28 = v0;
        } else {
          int v29 = 2;
          int v30 = v0 + v29;
          v28 = v30;
        }
        int v31 = 4;
        v10 = v28;
      }
      int v32 = 1;
      int v33 = v0 + v32;
      v7 = v10;
      break;
    }
    case 0:
      {
      int v34;
      v34 = v0;
      switch (v3) {
        case 0:
          {
          int v35 = 2;
          int v36 = v3 % v35;
          int v37 = 3;
          int v38 = v0 + v37;
          int v39;
          v39 = v38;
          switch (v36) {
            default:
              {
              int v40 = 3;
              v39 = v40;
            }
            case 0:
              {
              int v41 = 0;
              v39 = v41;
            }
            case 1:
              {
              int v42 = 4;
              v39 = v42;
              break;
            }
          }
          int v43 = 1;
          v34 = v39;
          break;
        }
        default:
          {
          int v44 = 2;
          int v45 = v3 % v44;
          int v46;
          v46 = v0;
          switch (v45) {
            case 0:
              {
              v46 = v0;
              break;
            }
            default:
              {
              v46 = v0;
              break;
            }
            case 1:
              {
              int v47 = 0;
              v46 = v47;
              break;
            }
          }
          int v48 = 3;
          int v49 = v0 + v48;
          v34 = v46;
          break;
        }
      }
      int v50 = 4;
      int v51 = v0 + v50;
      v7 = v34;
      break;
    }
    case 1:
      {
      int v52 = 0;
      int v53 = 0;
      int v54;
      int v55;
      v54 = v52;
      v55 = v53;
      while (true) {
        int v56 = 4;
        int v57 = v3 % v56;
        int v58 = 1;
        int v59 = v57 + v58;
        bool v60 = v55 < v59;
        v54 = v54;
        v55 = v55;
        if (!v60) break;
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
          int v70 = 2;
          int v71 = v0 + v70;
          int v72 = 1;
          int v73 = v64 + v72;
          v63 = v71;
          v64 = v73;
        }
        int v74 = 0;
        int v75 = v0 + v74;
        int v76 = 1;
        int v77 = v55 + v76;
        v54 = v63;
        v55 = v77;
        continue;
        ;
      }
      int v78 = 2;
      v7 = v54;
      break;
    }
    case 2:
      {
      int v79 = 4;
      int v80 = v3 % v79;
      int v81 = 3;
      int v82;
      v82 = v81;
      switch (v80) {
        case 0:
          {
          int v83 = 0;
          int v84 = 0;
          int v85;
          int v86;
          v85 = v83;
          v86 = v84;
          while (true) {
            int v87 = 4;
            int v88 = v3 % v87;
            int v89 = 1;
            int v90 = v88 + v89;
            bool v91 = v86 < v90;
            v85 = v85;
            v86 = v86;
            if (!v91) break;
            int v92 = 1;
            int v93 = v86 + v92;
            v85 = v0;
            v86 = v93;
          }
          int v94 = 3;
          v82 = v85;
          break;
        }
        case 1:
          {
          int v95 = 0;
          bool v96 = v2 != v95;
          int v97;
          if (v96) {
            int v98 = 2;
            int v99 = v0 + v98;
            v97 = v99;
          } else {
            int v100 = 3;
            int v101 = v0 + v100;
            v97 = v101;
          }
          int v102 = 2;
          v82 = v97;
          break;
        }
        case 2:
          {
          int v103 = 0;
          bool v104 = v2 != v103;
          int v105;
          if (v104) {
            v105 = v0;
          } else {
            v105 = v0;
          }
          int v106 = 2;
          int v107 = v0 + v106;
          v82 = v105;
        }
        default:
          {
          int v108 = 4;
          int v109 = v0 + v108;
          int v110;
          v110 = v109;
          switch (v3) {
            case 0:
              {
              v110 = v0;
            }
            default:
              {
              int v111 = 1;
              int v112 = v0 + v111;
              v110 = v112;
              break;
            }
          }
          int v113 = 1;
          v82 = v110;
          break;
        }
      }
      int v114 = 0;
      v7 = v82;
      break;
    }
  }
  bool v115 = true;
  int v116 = simt_wave_count_bits(v115);
  int v117 = 0;
  int v118 = v117 + v0;
  v1[v118] = v116;
  return;
}

kernel void kernel_main(device int* v119 [[buffer(0)]], device int* v120 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v121 = static_cast<int>(__simt_tid3.x);
  int v122 = 0;
  int v123 = v122 + v121;
  int v124 = v120[v123];
  int v125 = 4;
  int v126 = v125 + v121;
  int v127 = v120[v126];
  helper0(v121, v119, v124, v127, static_cast<int>(__simt_tid3.x));
  int v128 = 8;
  int v129 = v128 + v121;
  int v130 = v120[v129];
  int v131 = 0;
  bool v132 = v130 != v131;
  int v133;
  if (v132) {
    int v134 = 12;
    int v135 = v134 + v121;
    int v136 = v120[v135];
    int v137 = 1;
    int v138 = v121 + v137;
    int v139;
    v139 = v138;
    switch (v136) {
      case 0:
        {
        int v140 = 16;
        int v141 = v140 + v121;
        int v142 = v120[v141];
        int v143 = 0;
        int v144;
        v144 = v143;
        switch (v142) {
          case 0:
            {
            int v145 = 2;
            int v146 = v121 + v145;
            v144 = v146;
          }
          case 1:
            {
            int v147 = 0;
            v144 = v147;
            break;
          }
          default:
            {
            int v148 = 1;
            v144 = v148;
            break;
          }
        }
        bool v149 = true;
        v139 = v144;
        break;
      }
      default:
        {
        int v150 = 0;
        int v151 = 0;
        int v152;
        int v153;
        v152 = v150;
        v153 = v151;
        while (true) {
          int v154 = 4;
          int v155 = v153 * v154;
          int v156 = v155 + v121;
          int v157 = 20;
          int v158 = v157 + v156;
          int v159 = v120[v158];
          int v160 = 0;
          bool v161 = v159 != v160;
          v152 = v152;
          v153 = v153;
          if (!v161) break;
          int v162 = v152 + v153;
          int v163 = 1;
          int v164 = v153 + v163;
          v152 = v162;
          v153 = v164;
        }
        bool v165 = true;
        v139 = v152;
        break;
      }
    }
    bool v166 = true;
    v133 = v139;
  } else {
    int v167 = 0;
    int v168 = 0;
    int v169;
    int v170;
    v169 = v167;
    v170 = v168;
    while (true) {
      int v171 = 4;
      int v172 = v170 * v171;
      int v173 = v172 + v121;
      int v174 = 40;
      int v175 = v174 + v173;
      int v176 = v120[v175];
      int v177 = 0;
      bool v178 = v176 != v177;
      v169 = v169;
      v170 = v170;
      if (!v178) break;
      int v179 = 0;
      int v180 = 0;
      int v181;
      int v182;
      v181 = v179;
      v182 = v180;
      while (true) {
        int v183 = 4;
        int v184 = v182 * v183;
        int v185 = v184 + v121;
        int v186 = 60;
        int v187 = v186 + v185;
        int v188 = v120[v187];
        int v189 = 0;
        bool v190 = v188 != v189;
        v181 = v181;
        v182 = v182;
        if (!v190) break;
        int v191 = v181 + v182;
        int v192 = 1;
        int v193 = v182 + v192;
        v181 = v191;
        v182 = v193;
      }
      bool v194 = true;
      int v195 = v169 + v181;
      int v196 = 1;
      int v197 = v170 + v196;
      v169 = v195;
      v170 = v197;
    }
    bool v198 = true;
    v133 = v169;
  }
  int v199 = 16;
  int v200 = v199 + v121;
  bool v201 = true;
  int v202 = simt_wave_count_bits(v201);
  v119[v200] = v202;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
