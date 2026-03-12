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
  int v6 = 0;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11 = 0;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        default:
          {
          int v14 = 2;
          v13 = v14;
          break;
        }
        case 0:
          {
          int v15 = 0;
          int v16;
          v16 = v15;
          switch (v3) {
            case 0:
              {
              int v17 = 2;
              v16 = v17;
            }
            default:
              {
              int v18 = 1;
              v16 = v18;
              break;
            }
          }
          v13 = v16;
          break;
        }
        case 1:
          {
          int v19 = 0;
          bool v20 = v2 != v19;
          int v21;
          if (v20) {
            v21 = v0;
          } else {
            int v22 = 3;
            v21 = v22;
          }
          int v23 = 3;
          int v24 = v0 + v23;
          v13 = v21;
          break;
        }
        case 2:
          {
          int v25 = 3;
          v13 = v25;
          break;
        }
      }
      int v26 = 1;
      v8 = v13;
      break;
    }
    case 0:
      {
      int v27 = 3;
      int v28 = v0 + v27;
      int v29;
      v29 = v28;
      switch (v3) {
        default:
          {
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
            int v39 = 4;
            int v40 = 1;
            int v41 = v33 + v40;
            v32 = v39;
            v33 = v41;
          }
          int v42 = 2;
          int v43 = v0 + v42;
          v29 = v32;
          break;
        }
        case 0:
          {
          int v44 = 3;
          int v45 = v3 % v44;
          int v46 = 2;
          int v47 = v0 + v46;
          int v48;
          v48 = v47;
          switch (v45) {
            case 0:
              {
              v48 = v0;
              break;
            }
            case 1:
              {
              int v49 = 1;
              v48 = v49;
              break;
            }
            default:
              {
              int v50 = 0;
              int v51 = v0 + v50;
              v48 = v51;
              break;
            }
          }
          int v52 = 4;
          int v53 = v0 + v52;
          v29 = v48;
          break;
        }
      }
      int v54 = 0;
      v8 = v29;
    }
    case 1:
      {
      int v55 = 0;
      int v56 = 0;
      int v57;
      int v58;
      v57 = v55;
      v58 = v56;
      while (true) {
        int v59 = 4;
        int v60 = v3 % v59;
        int v61 = 1;
        int v62 = v60 + v61;
        bool v63 = v58 < v62;
        v57 = v57;
        v58 = v58;
        if (!v63) break;
        int v64 = 4;
        int v65 = v3 % v64;
        int v66;
        v66 = v0;
        switch (v65) {
          default:
            {
            int v67 = 3;
            int v68 = v0 + v67;
            v66 = v68;
          }
          case 0:
            {
            int v69 = 1;
            int v70 = v0 + v69;
            v66 = v70;
          }
          case 1:
            {
            int v71 = 4;
            int v72 = v0 + v71;
            v66 = v72;
          }
          case 2:
            {
            int v73 = 3;
            int v74 = v0 + v73;
            v66 = v74;
            break;
          }
        }
        int v75 = 4;
        int v76 = v0 + v75;
        int v77 = 1;
        int v78 = v58 + v77;
        v57 = v66;
        v58 = v78;
      }
      int v79 = 3;
      v8 = v57;
      break;
    }
    case 2:
      {
      int v80 = 2;
      int v81 = v3 % v80;
      int v82 = 4;
      int v83 = v0 + v82;
      int v84;
      v84 = v83;
      switch (v81) {
        case 0:
          {
          int v85 = 3;
          int v86 = v3 % v85;
          int v87 = 4;
          int v88 = v0 + v87;
          int v89;
          v89 = v88;
          switch (v86) {
            case 0:
              {
              int v90 = 0;
              v89 = v90;
            }
            default:
              {
              int v91 = 0;
              v89 = v91;
              break;
            }
            case 1:
              {
              int v92 = 3;
              v89 = v92;
              break;
            }
          }
          int v93 = 2;
          int v94 = v0 + v93;
          v84 = v89;
          break;
        }
        default:
          {
          int v95 = 0;
          int v96 = 0;
          int v97;
          int v98;
          v97 = v95;
          v98 = v96;
          while (true) {
            int v99 = 4;
            int v100 = v3 % v99;
            int v101 = 1;
            int v102 = v100 + v101;
            bool v103 = v98 < v102;
            v97 = v97;
            v98 = v98;
            if (!v103) break;
            int v104 = 1;
            int v105 = v98 + v104;
            v97 = v0;
            v98 = v105;
          }
          int v106 = 2;
          int v107 = v0 + v106;
          v84 = v97;
          break;
        }
        case 1:
          {
          int v108 = 0;
          bool v109 = v2 != v108;
          int v110;
          if (v109) {
            int v111 = 2;
            v110 = v111;
          } else {
            int v112 = 0;
            v110 = v112;
          }
          int v113 = 2;
          int v114 = v0 + v113;
          v84 = v110;
          break;
        }
      }
      v8 = v84;
      break;
    }
  }
  bool v115 = true;
  int v116 = simt_wave_count_bits(v115);
  int v117 = 0;
  int v118 = v117 + v0;
  v1[v118] = v116;
  int v119 = 0;
  bool v120 = v2 != v119;
  int v121 = v120 ? v0 : v8;
  return;
}

kernel void kernel_main(device int* v122 [[buffer(0)]], device int* v123 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v124 = static_cast<int>(__simt_tid3.x);
  int v125 = 0;
  int v126 = v125 + v124;
  int v127 = v123[v126];
  int v128 = 4;
  int v129 = v128 + v124;
  int v130 = v123[v129];
  helper0(v124, v122, v127, v130, static_cast<int>(__simt_tid3.x));
  int v131 = 8;
  int v132 = v131 + v124;
  int v133 = v123[v132];
  int v134 = 0;
  bool v135 = v133 != v134;
  int v136;
  if (v135) {
    int v137 = 12;
    int v138 = v137 + v124;
    int v139 = v123[v138];
    int v140;
    v140 = v124;
    switch (v139) {
      case 0:
        {
        int v141 = 0;
        int v142 = 0;
        int v143;
        int v144;
        v143 = v141;
        v144 = v142;
        while (true) {
          int v145 = 4;
          int v146 = v144 * v145;
          int v147 = v146 + v124;
          int v148 = 16;
          int v149 = v148 + v147;
          int v150 = v123[v149];
          int v151 = 0;
          bool v152 = v150 != v151;
          v143 = v143;
          v144 = v144;
          if (!v152) break;
          int v153 = v143 + v144;
          int v154 = 1;
          int v155 = v144 + v154;
          v143 = v153;
          v144 = v155;
        }
        bool v156 = true;
        v140 = v143;
        break;
      }
      case 1:
        {
        int v157 = 36;
        int v158 = v157 + v124;
        int v159 = v123[v158];
        int v160;
        v160 = v124;
        switch (v159) {
          case 0:
            {
            int v161 = 0;
            v160 = v161;
            break;
          }
          case 1:
            {
            int v162 = 4;
            v160 = v162;
            break;
          }
          default:
            {
            v160 = v124;
            break;
          }
        }
        bool v163 = true;
        v140 = v160;
      }
      default:
        {
        int v164 = 2;
        int v165 = v124 + v164;
        v140 = v165;
        break;
      }
    }
    bool v166 = true;
    v136 = v140;
  } else {
    int v167 = 0;
    v136 = v167;
  }
  int v168 = 16;
  int v169 = v168 + v124;
  bool v170 = true;
  int v171 = simt_wave_count_bits(v170);
  v122[v169] = v171;
  int v172 = 40;
  int v173 = v172 + v124;
  int v174 = v123[v173];
  int v175 = 0;
  bool v176 = v174 != v175;
  int v177;
  if (v176) {
    int v178 = 44;
    int v179 = v178 + v124;
    int v180 = v123[v179];
    int v181 = 0;
    bool v182 = v180 != v181;
    int v183;
    if (v182) {
      int v184 = 48;
      int v185 = v184 + v124;
      int v186 = v123[v185];
      int v187 = 0;
      bool v188 = v186 != v187;
      int v189;
      if (v188) {
        uint v190 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v191 = (int)(v190);
        v189 = v191;
      } else {
        uint v192 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v193 = (int)(v192);
        v189 = v193;
      }
      v183 = v189;
    } else {
      int v194 = 4;
      int v195 = v124 + v194;
      v183 = v195;
    }
    v177 = v183;
  } else {
    int v196 = 52;
    int v197 = v196 + v124;
    int v198 = v123[v197];
    int v199 = 0;
    bool v200 = v198 != v199;
    int v201;
    if (v200) {
      int v202 = 0;
      int v203 = 0;
      int v204;
      int v205;
      v204 = v202;
      v205 = v203;
      while (true) {
        int v206 = 4;
        int v207 = v205 * v206;
        int v208 = v207 + v124;
        int v209 = 56;
        int v210 = v209 + v208;
        int v211 = v123[v210];
        int v212 = 0;
        bool v213 = v211 != v212;
        v204 = v204;
        v205 = v205;
        if (!v213) break;
        int v214 = v204 + v205;
        int v215 = 1;
        int v216 = v205 + v215;
        v204 = v214;
        v205 = v216;
        break;
        ;
      }
      bool v217 = true;
      v201 = v204;
    } else {
      int v218 = 76;
      int v219 = v218 + v124;
      int v220 = v123[v219];
      int v221 = 0;
      bool v222 = v220 != v221;
      int v223;
      if (v222) {
        int v224 = 3;
        int v225 = v124 + v224;
        v223 = v225;
      } else {
        uint v226 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v227 = (int)(v226);
        v223 = v227;
      }
      v201 = v223;
    }
    v177 = v201;
  }
  int v228 = 32;
  int v229 = v228 + v124;
  bool v230 = true;
  int v231 = simt_wave_count_bits(v230);
  v122[v229] = v231;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
