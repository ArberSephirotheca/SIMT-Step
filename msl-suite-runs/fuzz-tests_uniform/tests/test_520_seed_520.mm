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
    int v13 = 1;
    int v14 = v7 + v13;
    v6 = v0;
    v7 = v14;
  }
  bool v15 = true;
  int v16 = simt_wave_count_bits(v15);
  int v17 = 0;
  int v18 = v17 + v0;
  v1[v18] = v16;
  int v19 = 0;
  bool v20 = v2 != v19;
  int v21 = v20 ? v0 : v6;
  int v22 = 3;
  int v23 = v3 % v22;
  int v24 = 0;
  int v25 = v0 + v24;
  int v26;
  v26 = v25;
  switch (v23) {
    default:
      {
      int v27 = 0;
      int v28 = 0;
      int v29;
      int v30;
      v29 = v27;
      v30 = v28;
      while (true) {
        int v31 = 4;
        int v32 = v3 % v31;
        int v33 = 1;
        int v34 = v32 + v33;
        bool v35 = v30 < v34;
        v29 = v29;
        v30 = v30;
        if (!v35) break;
        int v36 = 4;
        int v37;
        v37 = v36;
        switch (v3) {
          default:
            {
            int v38 = 0;
            int v39 = v0 + v38;
            v37 = v39;
            break;
          }
          case 0:
            {
            int v40 = 4;
            v37 = v40;
            break;
          }
        }
        int v41 = 1;
        int v42 = v30 + v41;
        v29 = v37;
        v30 = v42;
      }
      v26 = v29;
      break;
    }
    case 0:
      {
      int v43 = 3;
      int v44 = v3 % v43;
      int v45 = 1;
      int v46;
      v46 = v45;
      switch (v44) {
        case 0:
          {
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
            int v56 = 1;
            int v57 = v50 + v56;
            v49 = v0;
            v50 = v57;
            continue;
            ;
          }
          v46 = v49;
          break;
        }
        case 1:
          {
          int v58 = 0;
          bool v59 = v2 != v58;
          int v60;
          if (v59) {
            int v61 = 3;
            v60 = v61;
          } else {
            v60 = v0;
          }
          int v62 = 1;
          v46 = v60;
          break;
        }
        default:
          {
          int v63 = 0;
          int v64 = 0;
          int v65;
          int v66;
          v65 = v63;
          v66 = v64;
          while (true) {
            int v67 = 4;
            int v68 = v3 % v67;
            int v69 = 1;
            int v70 = v68 + v69;
            bool v71 = v66 < v70;
            v65 = v65;
            v66 = v66;
            if (!v71) break;
            int v72 = 1;
            int v73 = 1;
            int v74 = v66 + v73;
            v65 = v72;
            v66 = v74;
          }
          v46 = v65;
          break;
        }
      }
      v26 = v46;
      break;
    }
    case 1:
      {
      int v75 = 0;
      bool v76 = v2 != v75;
      int v77;
      if (v76) {
        int v78 = 3;
        int v79 = v0 + v78;
        v77 = v79;
      } else {
        int v80;
        v80 = v0;
        switch (v3) {
          default:
            {
            int v81 = 0;
            v80 = v81;
            break;
          }
          case 0:
            {
            int v82 = 4;
            v80 = v82;
            break;
          }
        }
        v77 = v80;
      }
      int v83 = 0;
      int v84 = v0 + v83;
      v26 = v77;
      break;
    }
  }
  bool v85 = true;
  int v86 = simt_wave_count_bits(v85);
  int v87 = 16;
  int v88 = v87 + v0;
  v1[v88] = v86;
  int v89 = 0;
  bool v90 = v2 != v89;
  int v91 = v90 ? v21 : v26;
  return;
}

kernel void kernel_main(device int* v92 [[buffer(0)]], device int* v93 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v94 = static_cast<int>(__simt_tid3.x);
  int v95 = 0;
  int v96 = v95 + v94;
  int v97 = v93[v96];
  int v98 = 4;
  int v99 = v98 + v94;
  int v100 = v93[v99];
  helper0(v94, v92, v97, v100, static_cast<int>(__simt_tid3.x));
  int v101 = 8;
  int v102 = v101 + v94;
  int v103 = v93[v102];
  uint v104 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v105 = (int)(v104);
  int v106;
  v106 = v105;
  switch (v103) {
    case 0:
      {
      int v107 = 12;
      int v108 = v107 + v94;
      int v109 = v93[v108];
      int v110 = 0;
      bool v111 = v109 != v110;
      int v112;
      if (v111) {
        int v113 = 16;
        int v114 = v113 + v94;
        int v115 = v93[v114];
        int v116;
        v116 = v94;
        switch (v115) {
          default:
            {
            v116 = v94;
            break;
          }
          case 0:
            {
            int v117 = 3;
            v116 = v117;
            break;
          }
        }
        bool v118 = true;
        v112 = v116;
      } else {
        int v119 = 0;
        int v120 = 0;
        int v121;
        int v122;
        v121 = v119;
        v122 = v120;
        while (true) {
          int v123 = 4;
          int v124 = v122 * v123;
          int v125 = v124 + v94;
          int v126 = 20;
          int v127 = v126 + v125;
          int v128 = v93[v127];
          int v129 = 0;
          bool v130 = v128 != v129;
          v121 = v121;
          v122 = v122;
          if (!v130) break;
          int v131 = v121 + v122;
          int v132 = 1;
          int v133 = v122 + v132;
          v121 = v131;
          v122 = v133;
        }
        bool v134 = true;
        v112 = v121;
      }
      v106 = v112;
      break;
    }
    case 1:
      {
      int v135 = 2;
      int v136 = v94 + v135;
      v106 = v136;
    }
    default:
      {
      int v137 = 40;
      int v138 = v137 + v94;
      int v139 = v93[v138];
      int v140;
      v140 = v94;
      switch (v139) {
        default:
          {
          int v141 = 44;
          int v142 = v141 + v94;
          int v143 = v93[v142];
          int v144 = 0;
          bool v145 = v143 != v144;
          int v146;
          if (v145) {
            int v147 = 1;
            int v148 = v94 + v147;
            v146 = v148;
          } else {
            v146 = v94;
          }
          v140 = v146;
          break;
        }
        case 0:
          {
          int v149 = 48;
          int v150 = v149 + v94;
          int v151 = v93[v150];
          int v152 = 0;
          bool v153 = v151 != v152;
          int v154;
          if (v153) {
            int v155 = 2;
            int v156 = v94 + v155;
            v154 = v156;
          } else {
            int v157 = 1;
            int v158 = v94 + v157;
            v154 = v158;
          }
          v140 = v154;
          break;
        }
        case 1:
          {
          int v159 = 52;
          int v160 = v159 + v94;
          int v161 = v93[v160];
          int v162 = 0;
          bool v163 = v161 != v162;
          int v164;
          if (v163) {
            int v165 = 1;
            int v166 = v94 + v165;
            v164 = v166;
          } else {
            v164 = v94;
          }
          v140 = v164;
          break;
        }
        case 2:
          {
          int v167 = 0;
          int v168 = 0;
          int v169;
          int v170;
          v169 = v167;
          v170 = v168;
          while (true) {
            int v171 = 4;
            int v172 = v170 * v171;
            int v173 = v172 + v94;
            int v174 = 56;
            int v175 = v174 + v173;
            int v176 = v93[v175];
            int v177 = 0;
            bool v178 = v176 != v177;
            v169 = v169;
            v170 = v170;
            if (!v178) break;
            int v179 = v169 + v170;
            int v180 = 1;
            int v181 = v170 + v180;
            v169 = v179;
            v170 = v181;
          }
          bool v182 = true;
          v140 = v169;
          break;
        }
      }
      bool v183 = true;
      v106 = v140;
      break;
    }
    case 2:
      {
      int v184 = 76;
      int v185 = v184 + v94;
      int v186 = v93[v185];
      int v187 = 4;
      int v188;
      v188 = v187;
      switch (v186) {
        default:
          {
          int v189 = 80;
          int v190 = v189 + v94;
          int v191 = v93[v190];
          int v192 = 4;
          int v193 = v94 + v192;
          int v194;
          v194 = v193;
          switch (v191) {
            case 0:
              {
              int v195 = 0;
              int v196 = v94 + v195;
              v194 = v196;
              break;
            }
            case 1:
              {
              int v197 = 3;
              int v198 = v94 + v197;
              v194 = v198;
              break;
            }
            default:
              {
              int v199 = 2;
              v194 = v199;
              break;
            }
          }
          bool v200 = true;
          v188 = v194;
          break;
        }
        case 0:
          {
          int v201 = 2;
          v188 = v201;
          break;
        }
      }
      bool v202 = true;
      v106 = v188;
      break;
    }
  }
  bool v203 = true;
  int v204 = 32;
  int v205 = v204 + v94;
  bool v206 = true;
  int v207 = simt_wave_count_bits(v206);
  v92[v205] = v207;
  int v208 = 4;
  int v209 = v94 + v208;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
