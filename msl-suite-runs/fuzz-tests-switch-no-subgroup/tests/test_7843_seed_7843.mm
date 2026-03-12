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
  int v8 = 3;
  int v9 = v3 % v8;
  int v10;
  v10 = v0;
  switch (v9) {
    case 0:
      {
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
        int v20 = 0;
        int v21 = 0;
        int v22;
        int v23;
        v22 = v20;
        v23 = v21;
        while (true) {
          int v24 = 4;
          int v25 = v3 % v24;
          int v26 = 1;
          int v27 = v25 + v26;
          bool v28 = v23 < v27;
          v22 = v22;
          v23 = v23;
          if (!v28) break;
          int v29 = 3;
          int v30 = 1;
          int v31 = v23 + v30;
          v22 = v29;
          v23 = v31;
        }
        int v32 = 1;
        int v33 = v14 + v32;
        v13 = v22;
        v14 = v33;
      }
      v10 = v13;
      break;
    }
    case 1:
      {
      int v34 = 2;
      int v35 = v3 % v34;
      int v36;
      v36 = v0;
      switch (v35) {
        default:
          {
          int v37 = 0;
          int v38 = 0;
          int v39;
          int v40;
          v39 = v37;
          v40 = v38;
          while (true) {
            int v41 = 4;
            int v42 = v3 % v41;
            int v43 = 1;
            int v44 = v42 + v43;
            bool v45 = v40 < v44;
            v39 = v39;
            v40 = v40;
            if (!v45) break;
            int v46 = 1;
            int v47 = v0 + v46;
            int v48 = 1;
            int v49 = v40 + v48;
            v39 = v47;
            v40 = v49;
          }
          v36 = v39;
          break;
        }
        case 0:
          {
          int v50 = 0;
          int v51 = 0;
          int v52;
          int v53;
          v52 = v50;
          v53 = v51;
          while (true) {
            int v54 = 4;
            int v55 = v3 % v54;
            int v56 = 1;
            int v57 = v55 + v56;
            bool v58 = v53 < v57;
            v52 = v52;
            v53 = v53;
            if (!v58) break;
            int v59 = 3;
            int v60 = 1;
            int v61 = v53 + v60;
            v52 = v59;
            v53 = v61;
          }
          v36 = v52;
          break;
        }
      }
      v10 = v36;
      break;
    }
    default:
      {
      int v62 = 3;
      int v63 = v3 % v62;
      int v64;
      v64 = v0;
      switch (v63) {
        case 0:
          {
          int v65 = 2;
          int v66 = v3 % v65;
          int v67 = 4;
          int v68 = v0 + v67;
          int v69;
          v69 = v68;
          switch (v66) {
            default:
              {
              v69 = v0;
              break;
            }
            case 0:
              {
              int v70 = 2;
              v69 = v70;
              break;
            }
          }
          v64 = v69;
          break;
        }
        case 1:
          {
          int v71 = 2;
          v64 = v71;
          break;
        }
        case 2:
          {
          int v72 = 0;
          int v73 = 0;
          int v74;
          int v75;
          v74 = v72;
          v75 = v73;
          while (true) {
            int v76 = 4;
            int v77 = v3 % v76;
            int v78 = 1;
            int v79 = v77 + v78;
            bool v80 = v75 < v79;
            v74 = v74;
            v75 = v75;
            if (!v80) break;
            int v81 = 4;
            int v82 = 1;
            int v83 = v75 + v82;
            v74 = v81;
            v75 = v83;
          }
          v64 = v74;
          break;
        }
        default:
          {
          int v84 = 0;
          int v85 = 0;
          int v86;
          int v87;
          v86 = v84;
          v87 = v85;
          while (true) {
            int v88 = 4;
            int v89 = v3 % v88;
            int v90 = 1;
            int v91 = v89 + v90;
            bool v92 = v87 < v91;
            v86 = v86;
            v87 = v87;
            if (!v92) break;
            int v93 = 0;
            int v94 = v0 + v93;
            int v95 = 1;
            int v96 = v87 + v95;
            v86 = v94;
            v87 = v96;
            break;
            ;
          }
          v64 = v86;
          break;
        }
      }
      v10 = v64;
      break;
    }
  }
  bool v97 = true;
  int v98 = simt_wave_count_bits(v97);
  int v99 = 16;
  int v100 = v99 + v0;
  v1[v100] = v98;
  int v101 = 0;
  bool v102 = v2 != v101;
  int v103 = v102 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v104 [[buffer(0)]], device int* v105 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v106 = static_cast<int>(__simt_tid3.x);
  int v107 = 0;
  int v108 = v107 + v106;
  int v109 = v105[v108];
  int v110 = 4;
  int v111 = v110 + v106;
  int v112 = v105[v111];
  int v113 = 0;
  bool v114 = v109 != v113;
  if (v114) {
  } else {
    int v115 = 0;
    int v116 = 0;
    int v117;
    int v118;
    v117 = v115;
    v118 = v116;
    while (true) {
      int v119 = 1;
      bool v120 = v118 < v119;
      v117 = v117;
      v118 = v118;
      if (!v120) break;
      int v121 = 2;
      int v122 = v106 % v121;
      int v123 = 0;
      int v124;
      v124 = v123;
      switch (v122) {
        default:
          {
          int v125 = 0;
          int v126 = v124 + v125;
          v124 = v126;
          break;
        }
        case 0:
          {
          int v127 = 1;
          int v128 = v124 + v127;
          v124 = v128;
          break;
        }
      }
      helper0(v106, v104, v109, v112, static_cast<int>(__simt_tid3.x));
      int v129 = 1;
      int v130 = v118 + v129;
      v117 = v117;
      v118 = v130;
    }
  }
  int v131 = 3;
  int v132 = v106 + v131;
  int v133 = 3;
  int v134 = v106 + v133;
  int v135 = 8;
  int v136 = v135 + v106;
  int v137 = v105[v136];
  int v138 = 4;
  int v139;
  v139 = v138;
  switch (v137) {
    case 0:
      {
      int v140 = 0;
      int v141 = v106 + v140;
      v139 = v141;
      break;
    }
    default:
      {
      int v142 = 12;
      int v143 = v142 + v106;
      int v144 = v105[v143];
      int v145 = 2;
      int v146 = v106 + v145;
      int v147;
      v147 = v146;
      switch (v144) {
        case 0:
          {
          int v148 = 16;
          int v149 = v148 + v106;
          int v150 = v105[v149];
          int v151 = 0;
          bool v152 = v150 != v151;
          int v153;
          if (v152) {
            v153 = v106;
          } else {
            int v154 = 0;
            int v155 = v106 + v154;
            v153 = v155;
          }
          v147 = v153;
          break;
        }
        default:
          {
          int v156 = 20;
          int v157 = v156 + v106;
          int v158 = v105[v157];
          int v159 = 0;
          bool v160 = v158 != v159;
          int v161;
          if (v160) {
            int v162 = 3;
            v161 = v162;
          } else {
            v161 = v106;
          }
          v147 = v161;
          break;
        }
      }
      bool v163 = true;
      v139 = v147;
      break;
    }
    case 1:
      {
      int v164 = 24;
      int v165 = v164 + v106;
      int v166 = v105[v165];
      int v167 = 0;
      int v168 = v106 + v167;
      int v169;
      v169 = v168;
      switch (v166) {
        case 0:
          {
          int v170 = 28;
          int v171 = v170 + v106;
          int v172 = v105[v171];
          int v173 = 1;
          int v174;
          v174 = v173;
          switch (v172) {
            case 0:
              {
              v174 = v106;
              break;
            }
            case 1:
              {
              int v175 = 2;
              int v176 = v106 + v175;
              v174 = v176;
              break;
            }
            default:
              {
              int v177 = 1;
              int v178 = v106 + v177;
              v174 = v178;
              break;
            }
            case 2:
              {
              int v179 = 2;
              int v180 = v106 + v179;
              v174 = v180;
              break;
            }
          }
          v169 = v174;
          break;
        }
        case 1:
          {
          int v181 = 4;
          v169 = v181;
          break;
        }
        case 2:
          {
          int v182 = 32;
          int v183 = v182 + v106;
          int v184 = v105[v183];
          int v185 = 0;
          bool v186 = v184 != v185;
          int v187;
          if (v186) {
            int v188 = 0;
            int v189 = v106 + v188;
            v187 = v189;
          } else {
            int v190 = 1;
            v187 = v190;
          }
          v169 = v187;
          break;
        }
        default:
          {
          v169 = v106;
          break;
        }
      }
      bool v191 = true;
      v139 = v169;
      break;
    }
    case 2:
      {
      int v192 = 0;
      int v193 = 0;
      int v194;
      int v195;
      v194 = v192;
      v195 = v193;
      while (true) {
        int v196 = 4;
        int v197 = v195 * v196;
        int v198 = v197 + v106;
        int v199 = 36;
        int v200 = v199 + v198;
        int v201 = v105[v200];
        int v202 = 0;
        bool v203 = v201 != v202;
        v194 = v194;
        v195 = v195;
        if (!v203) break;
        int v204 = 0;
        int v205 = v194 + v204;
        int v206 = 1;
        int v207 = v195 + v206;
        bool v208 = true;
        v194 = v205;
        v195 = v207;
      }
      v139 = v194;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
