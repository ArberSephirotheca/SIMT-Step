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
    int v7 = 2;
    int v8 = v3 % v7;
    int v9 = 2;
    int v10 = v0 + v9;
    int v11;
    v11 = v10;
    switch (v8) {
      case 0:
        {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          int v15 = 3;
          v14 = v15;
        } else {
          int v16 = 0;
          int v17 = v0 + v16;
          v14 = v17;
        }
        int v18 = 4;
        int v19 = v0 + v18;
        v11 = v14;
        break;
      }
      default:
        {
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
          int v29 = 1;
          int v30 = v23 + v29;
          v22 = v0;
          v23 = v30;
        }
        int v31 = 4;
        int v32 = v0 + v31;
        v11 = v22;
        break;
      }
      case 1:
        {
        int v33 = 4;
        int v34 = v0 + v33;
        int v35;
        v35 = v34;
        switch (v3) {
          case 0:
            {
            int v36 = 1;
            int v37 = v0 + v36;
            v35 = v37;
            break;
          }
          default:
            {
            int v38 = 4;
            v35 = v38;
            break;
          }
        }
        v11 = v35;
        break;
      }
    }
    v6 = v11;
  } else {
    int v39 = 1;
    int v40;
    v40 = v39;
    switch (v3) {
      default:
        {
        int v41 = 2;
        v40 = v41;
        break;
      }
      case 0:
        {
        int v42 = 0;
        int v43 = 0;
        int v44;
        int v45;
        v44 = v42;
        v45 = v43;
        while (true) {
          int v46 = 4;
          int v47 = v3 % v46;
          int v48 = 1;
          int v49 = v47 + v48;
          bool v50 = v45 < v49;
          v44 = v44;
          v45 = v45;
          if (!v50) break;
          int v51 = 1;
          int v52 = v45 + v51;
          v44 = v0;
          v45 = v52;
          continue;
          ;
        }
        int v53 = 0;
        v40 = v44;
        break;
      }
    }
    v6 = v40;
  }
  bool v54 = true;
  int v55 = simt_wave_count_bits(v54);
  int v56 = 0;
  int v57 = v56 + v0;
  v1[v57] = v55;
  return;
}

kernel void kernel_main(device int* v58 [[buffer(0)]], device int* v59 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v60 = static_cast<int>(__simt_tid3.x);
  int v61 = 0;
  int v62 = v61 + v60;
  int v63 = v59[v62];
  int v64 = 4;
  int v65 = v64 + v60;
  int v66 = v59[v65];
  helper0(v60, v58, v63, v66, static_cast<int>(__simt_tid3.x));
  int v67 = 8;
  int v68 = v67 + v60;
  int v69 = v59[v68];
  int v70 = 0;
  bool v71 = v69 != v70;
  int v72;
  if (v71) {
    int v73 = 12;
    int v74 = v73 + v60;
    int v75 = v59[v74];
    int v76 = 2;
    int v77 = v60 + v76;
    int v78;
    v78 = v77;
    switch (v75) {
      case 0:
        {
        int v79 = 16;
        int v80 = v79 + v60;
        int v81 = v59[v80];
        int v82 = 0;
        bool v83 = v81 != v82;
        int v84;
        if (v83) {
          int v85 = 2;
          v84 = v85;
        } else {
          v84 = v60;
        }
        v78 = v84;
      }
      case 1:
        {
        int v86 = 0;
        int v87 = 0;
        int v88;
        int v89;
        v88 = v86;
        v89 = v87;
        while (true) {
          int v90 = 4;
          int v91 = v89 * v90;
          int v92 = v91 + v60;
          int v93 = 20;
          int v94 = v93 + v92;
          int v95 = v59[v94];
          int v96 = 0;
          bool v97 = v95 != v96;
          v88 = v88;
          v89 = v89;
          if (!v97) break;
          int v98 = v88 + v89;
          int v99 = 1;
          int v100 = v89 + v99;
          v88 = v98;
          v89 = v100;
        }
        bool v101 = true;
        v78 = v88;
        break;
      }
      case 2:
        {
        int v102 = 40;
        int v103 = v102 + v60;
        int v104 = v59[v103];
        int v105 = 0;
        int v106 = v60 + v105;
        int v107;
        v107 = v106;
        switch (v104) {
          default:
            {
            int v108 = 2;
            int v109 = v60 + v108;
            v107 = v109;
          }
          case 0:
            {
            v107 = v60;
            break;
          }
          case 1:
            {
            v107 = v60;
            break;
          }
        }
        bool v110 = true;
        v78 = v107;
        break;
      }
      default:
        {
        int v111 = 0;
        int v112 = v60 + v111;
        v78 = v112;
        break;
      }
    }
    bool v113 = true;
    v72 = v78;
  } else {
    int v114 = 44;
    int v115 = v114 + v60;
    int v116 = v59[v115];
    uint v117 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v118 = (int)(v117);
    int v119;
    v119 = v118;
    switch (v116) {
      case 0:
        {
        int v120 = 48;
        int v121 = v120 + v60;
        int v122 = v59[v121];
        int v123 = 3;
        int v124;
        v124 = v123;
        switch (v122) {
          default:
            {
            int v125 = 1;
            v124 = v125;
            break;
          }
          case 0:
            {
            int v126 = 3;
            int v127 = v60 + v126;
            v124 = v127;
            break;
          }
          case 1:
            {
            int v128 = 1;
            v124 = v128;
            break;
          }
          case 2:
            {
            int v129 = 2;
            int v130 = v60 + v129;
            v124 = v130;
            break;
          }
        }
        bool v131 = true;
        v119 = v124;
        break;
      }
      default:
        {
        int v132 = 0;
        int v133 = 0;
        int v134;
        int v135;
        v134 = v132;
        v135 = v133;
        while (true) {
          int v136 = 4;
          int v137 = v135 * v136;
          int v138 = v137 + v60;
          int v139 = 52;
          int v140 = v139 + v138;
          int v141 = v59[v140];
          int v142 = 0;
          bool v143 = v141 != v142;
          v134 = v134;
          v135 = v135;
          if (!v143) break;
          int v144 = v134 + v135;
          int v145 = 1;
          int v146 = v135 + v145;
          v134 = v144;
          v135 = v146;
        }
        bool v147 = true;
        v119 = v134;
        break;
      }
      case 1:
        {
        int v148 = 72;
        int v149 = v148 + v60;
        int v150 = v59[v149];
        int v151;
        v151 = v60;
        switch (v150) {
          case 0:
            {
            int v152 = 4;
            v151 = v152;
            break;
          }
          case 1:
            {
            int v153 = 3;
            v151 = v153;
            break;
          }
          default:
            {
            int v154 = 2;
            v151 = v154;
          }
          case 2:
            {
            int v155 = 0;
            int v156 = v60 + v155;
            v151 = v156;
            break;
          }
        }
        bool v157 = true;
        v119 = v151;
        break;
      }
    }
    bool v158 = true;
    v72 = v119;
  }
  int v159 = 16;
  int v160 = v159 + v60;
  bool v161 = true;
  int v162 = simt_wave_count_bits(v161);
  v58[v160] = v162;
  int v163 = 76;
  int v164 = v163 + v60;
  int v165 = v59[v164];
  int v166 = 0;
  bool v167 = v165 != v166;
  int v168;
  if (v167) {
    int v169 = 80;
    int v170 = v169 + v60;
    int v171 = v59[v170];
    int v172 = 0;
    bool v173 = v171 != v172;
    int v174;
    if (v173) {
      uint v175 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v176 = (int)(v175);
      v174 = v176;
    } else {
      int v177 = 84;
      int v178 = v177 + v60;
      int v179 = v59[v178];
      int v180 = 0;
      bool v181 = v179 != v180;
      int v182;
      if (v181) {
        int v183 = 3;
        v182 = v183;
      } else {
        int v184 = 3;
        int v185 = v60 + v184;
        v182 = v185;
      }
      v174 = v182;
    }
    v168 = v174;
  } else {
    int v186 = 88;
    int v187 = v186 + v60;
    int v188 = v59[v187];
    int v189 = 0;
    bool v190 = v188 != v189;
    int v191;
    if (v190) {
      int v192 = 92;
      int v193 = v192 + v60;
      int v194 = v59[v193];
      int v195;
      v195 = v60;
      switch (v194) {
        default:
          {
          v195 = v60;
          break;
        }
        case 0:
          {
          int v196 = 3;
          int v197 = v60 + v196;
          v195 = v197;
          break;
        }
        case 1:
          {
          int v198 = 2;
          v195 = v198;
          break;
        }
        case 2:
          {
          int v199 = 0;
          int v200 = v60 + v199;
          v195 = v200;
          break;
        }
      }
      bool v201 = true;
      v191 = v195;
    } else {
      uint v202 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v203 = (int)(v202);
      v191 = v203;
    }
    v168 = v191;
  }
  int v204 = 32;
  int v205 = v204 + v60;
  bool v206 = true;
  int v207 = simt_wave_count_bits(v206);
  v58[v205] = v207;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
