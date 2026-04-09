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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 0;
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      int v10 = 2;
      int v11 = v3 % v10;
      int v12;
      v12 = v0;
      switch (v11) {
        case 0:
          {
          int v13 = 4;
          v12 = v13;
          break;
        }
        case 1:
          {
          v12 = v0;
        }
        default:
          {
          v12 = v0;
          break;
        }
      }
      v9 = v12;
    } else {
      int v14 = 3;
      int v15 = v3 % v14;
      int v16 = 4;
      int v17 = v0 + v16;
      int v18;
      v18 = v17;
      switch (v15) {
        case 0:
          {
          int v19 = 1;
          v18 = v19;
          break;
        }
        default:
          {
          int v20 = 3;
          int v21 = v0 + v20;
          v18 = v21;
          break;
        }
        case 1:
          {
          v18 = v0;
          break;
        }
        case 2:
          {
          v18 = v0;
          break;
        }
      }
      v9 = v18;
    }
    v6 = v9;
  } else {
    int v22 = 2;
    int v23 = v3 % v22;
    uint v24 = simt_subgroup_id(__simt_tid);
    int v25 = (int)(v24);
    int v26;
    v26 = v25;
    switch (v23) {
      case 0:
        {
        int v27 = 2;
        int v28 = v3 % v27;
        int v29;
        v29 = v0;
        switch (v28) {
          default:
            {
            int v30 = 1;
            v29 = v30;
            break;
          }
          case 0:
            {
            int v31 = 1;
            v29 = v31;
            break;
          }
        }
        v26 = v29;
        break;
      }
      case 1:
        {
        int v32 = 0;
        int v33 = 0;
        int v34;
        int v35;
        v34 = v32;
        v35 = v33;
        while (true) {
          int v36 = 4;
          int v37 = v3 % v36;
          int v38 = 1;
          int v39 = v37 + v38;
          bool v40 = v35 < v39;
          v34 = v34;
          v35 = v35;
          if (!v40) break;
          int v41 = 0;
          int v42 = 1;
          int v43 = v35 + v42;
          v34 = v41;
          v35 = v43;
        }
        int v44 = 4;
        int v45 = v0 + v44;
        v26 = v34;
        break;
      }
      default:
        {
        int v46 = 3;
        int v47 = v3 % v46;
        int v48;
        v48 = v0;
        switch (v47) {
          case 0:
            {
            int v49 = 0;
            int v50 = v0 + v49;
            v48 = v50;
          }
          case 1:
            {
            int v51 = 1;
            v48 = v51;
          }
          default:
            {
            v48 = v0;
            break;
          }
        }
        int v52 = 2;
        v26 = v48;
        break;
      }
    }
    int v53 = 0;
    int v54 = v0 + v53;
    v6 = v26;
  }
  bool v55 = true;
  int v56 = simt_wave_count_bits(v55);
  int v57 = 0;
  int v58 = v57 + v0;
  v1[v58] = v56;
  return;
}

kernel void kernel_main(device int* v59 [[buffer(0)]], device int* v60 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v61 = static_cast<int>(__simt_tid3.x);
  int v62 = 0;
  int v63 = v62 + v61;
  int v64 = v60[v63];
  int v65 = 4;
  int v66 = v65 + v61;
  int v67 = v60[v66];
  helper0(v61, v59, v64, v67, static_cast<int>(__simt_tid3.x));
  int v68 = 8;
  int v69 = v68 + v61;
  int v70 = v60[v69];
  int v71 = 0;
  int v72 = v61 + v71;
  int v73;
  v73 = v72;
  switch (v70) {
    case 0:
      {
      int v74 = 12;
      int v75 = v74 + v61;
      int v76 = v60[v75];
      int v77 = 0;
      bool v78 = v76 != v77;
      int v79;
      if (v78) {
        int v80 = 2;
        int v81 = v61 + v80;
        v79 = v81;
      } else {
        int v82 = 16;
        int v83 = v82 + v61;
        int v84 = v60[v83];
        int v85 = 0;
        bool v86 = v84 != v85;
        int v87;
        if (v86) {
          int v88 = 1;
          int v89 = v61 + v88;
          v87 = v89;
        } else {
          v87 = v61;
        }
        v79 = v87;
      }
      v73 = v79;
    }
    case 1:
      {
      int v90 = 20;
      int v91 = v90 + v61;
      int v92 = v60[v91];
      int v93 = 0;
      bool v94 = v92 != v93;
      int v95;
      if (v94) {
        int v96 = 24;
        int v97 = v96 + v61;
        int v98 = v60[v97];
        int v99 = 0;
        bool v100 = v98 != v99;
        int v101;
        if (v100) {
          int v102 = 3;
          int v103 = v61 + v102;
          v101 = v103;
        } else {
          int v104 = 4;
          v101 = v104;
        }
        v95 = v101;
      } else {
        int v105 = 28;
        int v106 = v105 + v61;
        int v107 = v60[v106];
        int v108 = 3;
        int v109 = v61 + v108;
        int v110;
        v110 = v109;
        switch (v107) {
          case 0:
            {
            v110 = v61;
            break;
          }
          default:
            {
            int v111 = 0;
            v110 = v111;
            break;
          }
        }
        bool v112 = true;
        v95 = v110;
      }
      v73 = v95;
      break;
    }
    default:
      {
      int v113 = 32;
      int v114 = v113 + v61;
      int v115 = v60[v114];
      int v116 = 0;
      bool v117 = v115 != v116;
      int v118;
      if (v117) {
        int v119 = 36;
        int v120 = v119 + v61;
        int v121 = v60[v120];
        int v122;
        v122 = v61;
        switch (v121) {
          case 0:
            {
            int v123 = 2;
            v122 = v123;
            break;
          }
          case 1:
            {
            int v124 = 3;
            v122 = v124;
            break;
          }
          case 2:
            {
            v122 = v61;
            break;
          }
          default:
            {
            v122 = v61;
            break;
          }
        }
        bool v125 = true;
        v118 = v122;
      } else {
        int v126 = 40;
        int v127 = v126 + v61;
        int v128 = v60[v127];
        int v129 = 2;
        int v130;
        v130 = v129;
        switch (v128) {
          case 0:
            {
            int v131 = 0;
            int v132 = v61 + v131;
            v130 = v132;
          }
          case 1:
            {
            int v133 = 2;
            int v134 = v61 + v133;
            v130 = v134;
          }
          default:
            {
            int v135 = 2;
            int v136 = v61 + v135;
            v130 = v136;
          }
          case 2:
            {
            v130 = v61;
            break;
          }
        }
        bool v137 = true;
        v118 = v130;
      }
      v73 = v118;
      break;
    }
  }
  bool v138 = true;
  int v139 = 16;
  int v140 = v139 + v61;
  bool v141 = true;
  int v142 = simt_wave_count_bits(v141);
  v59[v140] = v142;
  int v143 = 44;
  int v144 = v143 + v61;
  int v145 = v60[v144];
  int v146 = 0;
  bool v147 = v145 != v146;
  int v148;
  if (v147) {
    int v149 = 48;
    int v150 = v149 + v61;
    int v151 = v60[v150];
    int v152 = 0;
    bool v153 = v151 != v152;
    int v154;
    if (v153) {
      int v155 = 3;
      int v156 = v61 + v155;
      v154 = v156;
    } else {
      int v157 = 2;
      int v158 = v61 + v157;
      v154 = v158;
    }
    v148 = v154;
  } else {
    int v159 = 52;
    int v160 = v159 + v61;
    int v161 = v60[v160];
    int v162 = 3;
    int v163;
    v163 = v162;
    switch (v161) {
      case 0:
        {
        int v164 = 56;
        int v165 = v164 + v61;
        int v166 = v60[v165];
        int v167 = 3;
        int v168 = v61 + v167;
        int v169;
        v169 = v168;
        switch (v166) {
          case 0:
            {
            v169 = v61;
            break;
          }
          case 1:
            {
            int v170 = 3;
            v169 = v170;
            break;
          }
          default:
            {
            v169 = v61;
            break;
          }
          case 2:
            {
            int v171 = 2;
            int v172 = v61 + v171;
            v169 = v172;
            break;
          }
        }
        bool v173 = true;
        v163 = v169;
        break;
      }
      default:
        {
        v163 = v61;
        break;
      }
      case 1:
        {
        int v174 = 0;
        int v175 = 0;
        int v176;
        int v177;
        v176 = v174;
        v177 = v175;
        while (true) {
          int v178 = 4;
          int v179 = v177 * v178;
          int v180 = v179 + v61;
          int v181 = 60;
          int v182 = v181 + v180;
          int v183 = v60[v182];
          int v184 = 0;
          bool v185 = v183 != v184;
          v176 = v176;
          v177 = v177;
          if (!v185) break;
          int v186 = v176 + v177;
          int v187 = 1;
          int v188 = v177 + v187;
          v176 = v186;
          v177 = v188;
          break;
          ;
        }
        bool v189 = true;
        v163 = v176;
        break;
      }
      case 2:
        {
        int v190 = 80;
        int v191 = v190 + v61;
        int v192 = v60[v191];
        int v193 = 2;
        int v194 = v61 + v193;
        int v195;
        v195 = v194;
        switch (v192) {
          case 0:
            {
            int v196 = 2;
            v195 = v196;
            break;
          }
          default:
            {
            int v197 = 2;
            int v198 = v61 + v197;
            v195 = v198;
            break;
          }
        }
        bool v199 = true;
        v163 = v195;
        break;
      }
    }
    bool v200 = true;
    v148 = v163;
  }
  int v201 = 32;
  int v202 = v201 + v61;
  bool v203 = true;
  int v204 = simt_wave_count_bits(v203);
  v59[v202] = v204;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
