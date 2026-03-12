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
  int v22 = 4;
  int v23 = v3 % v22;
  int v24 = 0;
  int v25;
  v25 = v24;
  switch (v23) {
    case 0:
      {
      int v26 = 3;
      int v27 = v3 % v26;
      int v28 = 4;
      int v29;
      v29 = v28;
      switch (v27) {
        case 0:
          {
          int v30 = 0;
          bool v31 = v2 != v30;
          int v32;
          if (v31) {
            int v33 = 0;
            v32 = v33;
          } else {
            int v34 = 2;
            int v35 = v0 + v34;
            v32 = v35;
          }
          v29 = v32;
          break;
        }
        case 1:
          {
          int v36 = 0;
          int v37 = 0;
          int v38;
          int v39;
          v38 = v36;
          v39 = v37;
          while (true) {
            int v40 = 4;
            int v41 = v3 % v40;
            int v42 = 1;
            int v43 = v41 + v42;
            bool v44 = v39 < v43;
            v38 = v38;
            v39 = v39;
            if (!v44) break;
            int v45 = 2;
            int v46 = v0 + v45;
            int v47 = 1;
            int v48 = v39 + v47;
            v38 = v46;
            v39 = v48;
            continue;
            ;
          }
          v29 = v38;
          break;
        }
        case 2:
          {
          v29 = v0;
          break;
        }
        default:
          {
          int v49 = 3;
          int v50 = v3 % v49;
          int v51 = 2;
          int v52 = v0 + v51;
          int v53;
          v53 = v52;
          switch (v50) {
            case 0:
              {
              int v54 = 3;
              v53 = v54;
              break;
            }
            case 1:
              {
              v53 = v0;
            }
            case 2:
              {
              int v55 = 0;
              int v56 = v0 + v55;
              v53 = v56;
            }
            default:
              {
              v53 = v0;
              break;
            }
          }
          v29 = v53;
          break;
        }
      }
      v25 = v29;
    }
    case 1:
      {
      int v57 = 0;
      int v58 = 0;
      int v59;
      int v60;
      v59 = v57;
      v60 = v58;
      while (true) {
        int v61 = 4;
        int v62 = v3 % v61;
        int v63 = 1;
        int v64 = v62 + v63;
        bool v65 = v60 < v64;
        v59 = v59;
        v60 = v60;
        if (!v65) break;
        int v66 = 2;
        int v67 = v3 % v66;
        int v68 = 0;
        int v69 = v0 + v68;
        int v70;
        v70 = v69;
        switch (v67) {
          case 0:
            {
            v70 = v0;
            break;
          }
          default:
            {
            int v71 = 0;
            v70 = v71;
            break;
          }
        }
        int v72 = 1;
        int v73 = v60 + v72;
        v59 = v70;
        v60 = v73;
        break;
        ;
      }
      v25 = v59;
      break;
    }
    default:
      {
      int v74;
      v74 = v0;
      switch (v3) {
        case 0:
          {
          int v75 = 0;
          bool v76 = v2 != v75;
          int v77;
          if (v76) {
            v77 = v0;
          } else {
            int v78 = 1;
            v77 = v78;
          }
          v74 = v77;
        }
        default:
          {
          int v79 = 0;
          int v80 = v0 + v79;
          v74 = v80;
          break;
        }
      }
      v25 = v74;
      break;
    }
    case 2:
      {
      int v81 = 0;
      int v82 = 0;
      int v83;
      int v84;
      v83 = v81;
      v84 = v82;
      while (true) {
        int v85 = 4;
        int v86 = v3 % v85;
        int v87 = 1;
        int v88 = v86 + v87;
        bool v89 = v84 < v88;
        v83 = v83;
        v84 = v84;
        if (!v89) break;
        int v90 = 0;
        int v91 = 0;
        int v92;
        int v93;
        v92 = v90;
        v93 = v91;
        while (true) {
          int v94 = 4;
          int v95 = v3 % v94;
          int v96 = 1;
          int v97 = v95 + v96;
          bool v98 = v93 < v97;
          v92 = v92;
          v93 = v93;
          if (!v98) break;
          int v99 = 4;
          int v100 = 1;
          int v101 = v93 + v100;
          v92 = v99;
          v93 = v101;
        }
        int v102 = 1;
        int v103 = v84 + v102;
        v83 = v92;
        v84 = v103;
      }
      v25 = v83;
      break;
    }
  }
  int v104 = 0;
  bool v105 = v2 != v104;
  int v106 = v105 ? v6 : v25;
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
  uint v119 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v120 = (int)(v119);
  int v121;
  v121 = v120;
  switch (v118) {
    default:
      {
      int v122 = 0;
      int v123 = 0;
      int v124;
      int v125;
      v124 = v122;
      v125 = v123;
      while (true) {
        int v126 = 4;
        int v127 = v125 * v126;
        int v128 = v127 + v109;
        int v129 = 12;
        int v130 = v129 + v128;
        int v131 = v108[v130];
        int v132 = 0;
        bool v133 = v131 != v132;
        v124 = v124;
        v125 = v125;
        if (!v133) break;
        int v134 = 32;
        int v135 = v134 + v109;
        int v136 = v108[v135];
        int v137;
        v137 = v109;
        switch (v136) {
          default:
            {
            v137 = v109;
            break;
          }
          case 0:
            {
            int v138 = 0;
            int v139 = v109 + v138;
            v137 = v139;
            break;
          }
        }
        bool v140 = true;
        int v141 = v124 + v137;
        int v142 = 1;
        int v143 = v125 + v142;
        bool v144 = true;
        v124 = v141;
        v125 = v143;
      }
      v121 = v124;
      break;
    }
    case 0:
      {
      int v145 = 36;
      int v146 = v145 + v109;
      int v147 = v108[v146];
      int v148 = 2;
      int v149;
      v149 = v148;
      switch (v147) {
        case 0:
          {
          int v150 = 40;
          int v151 = v150 + v109;
          int v152 = v108[v151];
          int v153 = 0;
          bool v154 = v152 != v153;
          int v155;
          if (v154) {
            int v156 = 4;
            v155 = v156;
          } else {
            int v157 = 3;
            v155 = v157;
          }
          v149 = v155;
          break;
        }
        default:
          {
          int v158 = 0;
          int v159 = v109 + v158;
          v149 = v159;
        }
        case 1:
          {
          int v160 = 4;
          int v161 = v109 + v160;
          v149 = v161;
          break;
        }
      }
      v121 = v149;
    }
    case 1:
      {
      int v162 = 44;
      int v163 = v162 + v109;
      int v164 = v108[v163];
      int v165;
      v165 = v109;
      switch (v164) {
        case 0:
          {
          int v166 = 48;
          int v167 = v166 + v109;
          int v168 = v108[v167];
          int v169 = 3;
          int v170 = v109 + v169;
          int v171;
          v171 = v170;
          switch (v168) {
            case 0:
              {
              v171 = v109;
              break;
            }
            default:
              {
              int v172 = 2;
              int v173 = v109 + v172;
              v171 = v173;
            }
            case 1:
              {
              v171 = v109;
              break;
            }
          }
          bool v174 = true;
          v165 = v171;
          break;
        }
        case 1:
          {
          int v175 = 3;
          v165 = v175;
          break;
        }
        default:
          {
          int v176 = 0;
          int v177 = 0;
          int v178;
          int v179;
          v178 = v176;
          v179 = v177;
          while (true) {
            int v180 = 4;
            int v181 = v179 * v180;
            int v182 = v181 + v109;
            int v183 = 52;
            int v184 = v183 + v182;
            int v185 = v108[v184];
            int v186 = 0;
            bool v187 = v185 != v186;
            v178 = v178;
            v179 = v179;
            if (!v187) break;
            int v188 = v178 + v179;
            int v189 = 1;
            int v190 = v179 + v189;
            bool v191 = true;
            v178 = v188;
            v179 = v190;
          }
          v165 = v178;
          break;
        }
      }
      v121 = v165;
      break;
    }
  }
  int v192 = 0;
  int v193 = 0;
  int v194;
  int v195;
  v194 = v192;
  v195 = v193;
  while (true) {
    int v196 = 4;
    int v197 = v195 * v196;
    int v198 = v197 + v109;
    int v199 = 72;
    int v200 = v199 + v198;
    int v201 = v108[v200];
    int v202 = 0;
    bool v203 = v201 != v202;
    v194 = v194;
    v195 = v195;
    if (!v203) break;
    int v204 = v194 + v195;
    int v205 = 1;
    int v206 = v195 + v205;
    bool v207 = true;
    int v208 = 16;
    int v209 = 4;
    int v210 = v195 * v209;
    int v211 = v208 + v210;
    int v212 = v211 + v109;
    bool v213 = true;
    int v214 = simt_wave_count_bits(v213);
    v107[v212] = v214;
    v194 = v204;
    v195 = v206;
  }
  uint v215 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v216 = (int)(v215);
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 24; ++idx) {
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
