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
  int v5 = 3;
  int v6 = v3 % v5;
  uint v7 = simt_lane_id(__simt_tid);
  int v8 = (int)(v7);
  int v9;
  v9 = v8;
  switch (v6) {
    case 0:
      {
      int v10 = 3;
      int v11 = v3 % v10;
      int v12 = 2;
      int v13;
      v13 = v12;
      switch (v11) {
        case 0:
          {
          int v14 = 1;
          v13 = v14;
          break;
        }
        case 1:
          {
          int v15 = 0;
          int v16 = 0;
          int v17;
          int v18;
          v17 = v15;
          v18 = v16;
          while (true) {
            int v19 = 4;
            int v20 = v3 % v19;
            int v21 = 1;
            int v22 = v20 + v21;
            bool v23 = v18 < v22;
            v17 = v17;
            v18 = v18;
            if (!v23) break;
            int v24 = 4;
            int v25 = 1;
            int v26 = v18 + v25;
            v17 = v24;
            v18 = v26;
            break;
            ;
          }
          int v27 = 0;
          v13 = v17;
          break;
        }
        default:
          {
          int v28 = 0;
          int v29 = 0;
          int v30;
          int v31;
          v30 = v28;
          v31 = v29;
          while (true) {
            int v32 = 4;
            int v33 = v3 % v32;
            int v34 = 1;
            int v35 = v33 + v34;
            bool v36 = v31 < v35;
            v30 = v30;
            v31 = v31;
            if (!v36) break;
            int v37 = 4;
            int v38 = v0 + v37;
            int v39 = 1;
            int v40 = v31 + v39;
            v30 = v38;
            v31 = v40;
          }
          v13 = v30;
          break;
        }
      }
      int v41 = 3;
      int v42 = v0 + v41;
      v9 = v13;
      break;
    }
    case 1:
      {
      int v43 = 0;
      bool v44 = v2 != v43;
      int v45;
      if (v44) {
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
          int v55 = 4;
          int v56 = v0 + v55;
          int v57 = 1;
          int v58 = v49 + v57;
          v48 = v56;
          v49 = v58;
        }
        v45 = v48;
      } else {
        int v59 = 0;
        int v60 = 0;
        int v61;
        int v62;
        v61 = v59;
        v62 = v60;
        while (true) {
          int v63 = 4;
          int v64 = v3 % v63;
          int v65 = 1;
          int v66 = v64 + v65;
          bool v67 = v62 < v66;
          v61 = v61;
          v62 = v62;
          if (!v67) break;
          int v68 = 0;
          int v69 = v0 + v68;
          int v70 = 1;
          int v71 = v62 + v70;
          v61 = v69;
          v62 = v71;
          break;
          ;
        }
        int v72 = 2;
        v45 = v61;
      }
      int v73 = 1;
      int v74 = v0 + v73;
      v9 = v45;
      break;
    }
    case 2:
      {
      int v75 = 2;
      int v76 = v3 % v75;
      int v77;
      v77 = v0;
      switch (v76) {
        default:
          {
          int v78 = 0;
          bool v79 = v2 != v78;
          int v80;
          if (v79) {
            int v81 = 3;
            v80 = v81;
          } else {
            int v82 = 1;
            int v83 = v0 + v82;
            v80 = v83;
          }
          int v84 = 2;
          v77 = v80;
          break;
        }
        case 0:
          {
          v77 = v0;
          break;
        }
        case 1:
          {
          int v85 = 4;
          int v86 = v3 % v85;
          int v87 = 4;
          int v88;
          v88 = v87;
          switch (v86) {
            default:
              {
              int v89 = 3;
              int v90 = v0 + v89;
              v88 = v90;
              break;
            }
            case 0:
              {
              int v91 = 3;
              int v92 = v0 + v91;
              v88 = v92;
              break;
            }
            case 1:
              {
              v88 = v0;
              break;
            }
            case 2:
              {
              int v93 = 4;
              v88 = v93;
              break;
            }
          }
          int v94 = 4;
          int v95 = v0 + v94;
          v77 = v88;
          break;
        }
      }
      int v96 = 1;
      v9 = v77;
      break;
    }
    default:
      {
      v9 = v0;
      break;
    }
  }
  bool v97 = true;
  int v98 = simt_wave_count_bits(v97);
  int v99 = 0;
  int v100 = v99 + v0;
  v1[v100] = v98;
  int v101 = 0;
  bool v102 = v2 != v101;
  int v103 = v102 ? v4 : v9;
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
  helper0(v106, v104, v109, v112, static_cast<int>(__simt_tid3.x));
  uint v113 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v114 = (int)(v113);
  int v115 = 8;
  int v116 = v115 + v106;
  int v117 = v105[v116];
  uint v118 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v119 = (int)(v118);
  int v120;
  v120 = v119;
  switch (v117) {
    case 0:
      {
      int v121 = 12;
      int v122 = v121 + v106;
      int v123 = v105[v122];
      int v124 = 0;
      bool v125 = v123 != v124;
      int v126;
      if (v125) {
        int v127 = 16;
        int v128 = v127 + v106;
        int v129 = v105[v128];
        int v130 = 0;
        bool v131 = v129 != v130;
        int v132;
        if (v131) {
          int v133 = 1;
          v132 = v133;
        } else {
          v132 = v106;
        }
        v126 = v132;
      } else {
        int v134 = 20;
        int v135 = v134 + v106;
        int v136 = v105[v135];
        int v137 = 1;
        int v138;
        v138 = v137;
        switch (v136) {
          case 0:
            {
            v138 = v106;
          }
          default:
            {
            int v139 = 0;
            v138 = v139;
          }
          case 1:
            {
            int v140 = 3;
            int v141 = v106 + v140;
            v138 = v141;
            break;
          }
        }
        bool v142 = true;
        v126 = v138;
      }
      v120 = v126;
      break;
    }
    case 1:
      {
      int v143 = 24;
      int v144 = v143 + v106;
      int v145 = v105[v144];
      int v146 = 0;
      bool v147 = v145 != v146;
      int v148;
      if (v147) {
        int v149 = 28;
        int v150 = v149 + v106;
        int v151 = v105[v150];
        int v152 = 2;
        int v153 = v106 + v152;
        int v154;
        v154 = v153;
        switch (v151) {
          case 0:
            {
            int v155 = 2;
            v154 = v155;
          }
          default:
            {
            int v156 = 0;
            v154 = v156;
          }
          case 1:
            {
            int v157 = 3;
            v154 = v157;
          }
          case 2:
            {
            v154 = v106;
            break;
          }
        }
        bool v158 = true;
        v148 = v154;
      } else {
        v148 = v106;
      }
      v120 = v148;
      break;
    }
    default:
      {
      int v159 = 32;
      int v160 = v159 + v106;
      int v161 = v105[v160];
      int v162 = 0;
      bool v163 = v161 != v162;
      int v164;
      if (v163) {
        int v165 = 1;
        int v166 = v106 + v165;
        v164 = v166;
      } else {
        int v167 = 3;
        int v168 = v106 + v167;
        v164 = v168;
      }
      v120 = v164;
      break;
    }
  }
  bool v169 = true;
  int v170 = 16;
  int v171 = v170 + v106;
  bool v172 = true;
  int v173 = simt_wave_count_bits(v172);
  v104[v171] = v173;
  int v174 = 36;
  int v175 = v174 + v106;
  int v176 = v105[v175];
  int v177 = 0;
  bool v178 = v176 != v177;
  int v179;
  if (v178) {
    int v180 = 40;
    int v181 = v180 + v106;
    int v182 = v105[v181];
    int v183 = 0;
    bool v184 = v182 != v183;
    int v185;
    if (v184) {
      v185 = v106;
    } else {
      int v186 = 44;
      int v187 = v186 + v106;
      int v188 = v105[v187];
      int v189 = 0;
      bool v190 = v188 != v189;
      int v191;
      if (v190) {
        uint v192 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v193 = (int)(v192);
        v191 = v193;
      } else {
        uint v194 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v195 = (int)(v194);
        v191 = v195;
      }
      v185 = v191;
    }
    v179 = v185;
  } else {
    int v196 = 48;
    int v197 = v196 + v106;
    int v198 = v105[v197];
    int v199 = 0;
    bool v200 = v198 != v199;
    int v201;
    if (v200) {
      int v202 = 52;
      int v203 = v202 + v106;
      int v204 = v105[v203];
      uint v205 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v206 = (int)(v205);
      int v207;
      v207 = v206;
      switch (v204) {
        default:
          {
          int v208 = 4;
          int v209 = v106 + v208;
          v207 = v209;
          break;
        }
        case 0:
          {
          int v210 = 0;
          v207 = v210;
          break;
        }
        case 1:
          {
          v207 = v106;
          break;
        }
      }
      bool v211 = true;
      v201 = v207;
    } else {
      int v212 = 2;
      int v213 = v106 + v212;
      v201 = v213;
    }
    v179 = v201;
  }
  int v214 = 32;
  int v215 = v214 + v106;
  bool v216 = true;
  int v217 = simt_wave_count_bits(v216);
  v104[v215] = v217;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
