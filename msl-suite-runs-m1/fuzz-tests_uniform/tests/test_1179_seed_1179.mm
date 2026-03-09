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
  uint v6 = simt_lane_id(__simt_tid);
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
        int v18 = 0;
        int v19 = 0;
        int v20;
        int v21;
        v20 = v18;
        v21 = v19;
        while (true) {
          int v22 = 4;
          int v23 = v3 % v22;
          int v24 = 1;
          int v25 = v23 + v24;
          bool v26 = v21 < v25;
          v20 = v20;
          v21 = v21;
          if (!v26) break;
          int v27 = 1;
          int v28 = v0 + v27;
          int v29 = 1;
          int v30 = v21 + v29;
          v20 = v28;
          v21 = v30;
          continue;
          ;
        }
        int v31 = 1;
        int v32 = v12 + v31;
        v11 = v20;
        v12 = v32;
        continue;
        ;
      }
      int v33 = 0;
      v8 = v11;
      break;
    }
    case 1:
      {
      int v34 = 2;
      int v35 = v3 % v34;
      int v36;
      v36 = v0;
      switch (v35) {
        case 0:
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
            int v47 = v40 + v46;
            v39 = v0;
            v40 = v47;
            break;
            ;
          }
          int v48 = 1;
          int v49 = v0 + v48;
          v36 = v39;
        }
        default:
          {
          int v50 = 2;
          int v51 = v3 % v50;
          int v52 = 3;
          int v53;
          v53 = v52;
          switch (v51) {
            case 0:
              {
              int v54 = 1;
              v53 = v54;
              break;
            }
            default:
              {
              int v55 = 4;
              int v56 = v0 + v55;
              v53 = v56;
              break;
            }
            case 1:
              {
              int v57 = 1;
              int v58 = v0 + v57;
              v53 = v58;
              break;
            }
          }
          int v59 = 4;
          int v60 = v0 + v59;
          v36 = v53;
          break;
        }
        case 1:
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
            int v70 = 0;
            int v71 = v0 + v70;
            int v72 = 1;
            int v73 = v64 + v72;
            v63 = v71;
            v64 = v73;
            continue;
            ;
          }
          int v74 = 1;
          int v75 = v0 + v74;
          v36 = v63;
          break;
        }
      }
      int v76 = 0;
      int v77 = v0 + v76;
      v8 = v36;
      break;
    }
    default:
      {
      int v78 = 3;
      int v79 = v3 % v78;
      int v80 = 1;
      int v81;
      v81 = v80;
      switch (v79) {
        case 0:
          {
          int v82 = 0;
          bool v83 = v2 != v82;
          int v84;
          if (v83) {
            int v85 = 0;
            v84 = v85;
          } else {
            int v86 = 4;
            v84 = v86;
          }
          v81 = v84;
          break;
        }
        case 1:
          {
          int v87 = 3;
          int v88 = v3 % v87;
          int v89 = 0;
          int v90 = v0 + v89;
          int v91;
          v91 = v90;
          switch (v88) {
            case 0:
              {
              v91 = v0;
            }
            default:
              {
              int v92 = 0;
              v91 = v92;
            }
            case 1:
              {
              int v93 = 4;
              v91 = v93;
              break;
            }
          }
          int v94 = 3;
          int v95 = v0 + v94;
          v81 = v91;
          break;
        }
        default:
          {
          int v96 = 2;
          int v97 = v3 % v96;
          int v98;
          v98 = v0;
          switch (v97) {
            case 0:
              {
              int v99 = 0;
              int v100 = v0 + v99;
              v98 = v100;
              break;
            }
            case 1:
              {
              int v101 = 0;
              int v102 = v0 + v101;
              v98 = v102;
              break;
            }
            default:
              {
              int v103 = 3;
              v98 = v103;
              break;
            }
          }
          int v104 = 2;
          v81 = v98;
          break;
        }
        case 2:
          {
          int v105 = 2;
          int v106 = v3 % v105;
          int v107 = 4;
          int v108;
          v108 = v107;
          switch (v106) {
            case 0:
              {
              int v109 = 0;
              v108 = v109;
              break;
            }
            case 1:
              {
              int v110 = 1;
              int v111 = v0 + v110;
              v108 = v111;
              break;
            }
            default:
              {
              v108 = v0;
              break;
            }
          }
          int v112 = 4;
          int v113 = v0 + v112;
          v81 = v108;
          break;
        }
      }
      int v114 = 4;
      v8 = v81;
    }
    case 2:
      {
      int v115 = 0;
      bool v116 = v2 != v115;
      int v117;
      if (v116) {
        int v118 = 4;
        int v119 = v3 % v118;
        int v120 = 2;
        int v121;
        v121 = v120;
        switch (v119) {
          default:
            {
            v121 = v0;
            break;
          }
          case 0:
            {
            int v122 = 4;
            int v123 = v0 + v122;
            v121 = v123;
            break;
          }
          case 1:
            {
            v121 = v0;
            break;
          }
          case 2:
            {
            v121 = v0;
            break;
          }
        }
        int v124 = 3;
        int v125 = v0 + v124;
        v117 = v121;
      } else {
        int v126 = 0;
        bool v127 = v2 != v126;
        int v128;
        if (v127) {
          int v129 = 2;
          int v130 = v0 + v129;
          v128 = v130;
        } else {
          int v131 = 0;
          int v132 = v0 + v131;
          v128 = v132;
        }
        int v133 = 0;
        int v134 = v0 + v133;
        v117 = v128;
      }
      int v135 = 0;
      int v136 = v0 + v135;
      v8 = v117;
      break;
    }
  }
  bool v137 = true;
  int v138 = simt_wave_count_bits(v137);
  int v139 = 0;
  int v140 = v139 + v0;
  v1[v140] = v138;
  int v141 = 0;
  bool v142 = v2 != v141;
  int v143 = v142 ? v0 : v8;
  return;
}

kernel void kernel_main(device int* v144 [[buffer(0)]], device int* v145 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v146 = static_cast<int>(__simt_tid3.x);
  int v147 = 0;
  int v148 = v147 + v146;
  int v149 = v145[v148];
  int v150 = 4;
  int v151 = v150 + v146;
  int v152 = v145[v151];
  helper0(v146, v144, v149, v152, static_cast<int>(__simt_tid3.x));
  int v153 = 8;
  int v154 = v153 + v146;
  int v155 = v145[v154];
  int v156 = 3;
  int v157;
  v157 = v156;
  switch (v155) {
    case 0:
      {
      v157 = v146;
      break;
    }
    default:
      {
      int v158 = 3;
      int v159 = v146 + v158;
      v157 = v159;
      break;
    }
  }
  bool v160 = true;
  int v161 = 16;
  int v162 = v161 + v146;
  bool v163 = true;
  int v164 = simt_wave_count_bits(v163);
  v144[v162] = v164;
  uint v165 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v166 = (int)(v165);
  int v167 = 12;
  int v168 = v167 + v146;
  int v169 = v145[v168];
  int v170 = 2;
  int v171 = v146 + v170;
  int v172;
  v172 = v171;
  switch (v169) {
    case 0:
      {
      int v173 = 1;
      int v174 = v146 + v173;
      v172 = v174;
      break;
    }
    case 1:
      {
      int v175 = 0;
      int v176 = 0;
      int v177;
      int v178;
      v177 = v175;
      v178 = v176;
      while (true) {
        int v179 = 4;
        int v180 = v178 * v179;
        int v181 = v180 + v146;
        int v182 = 16;
        int v183 = v182 + v181;
        int v184 = v145[v183];
        int v185 = 0;
        bool v186 = v184 != v185;
        v177 = v177;
        v178 = v178;
        if (!v186) break;
        int v187 = v177 + v178;
        int v188 = 1;
        int v189 = v178 + v188;
        v177 = v187;
        v178 = v189;
      }
      bool v190 = true;
      v172 = v177;
      break;
    }
    default:
      {
      int v191 = 36;
      int v192 = v191 + v146;
      int v193 = v145[v192];
      int v194 = 0;
      bool v195 = v193 != v194;
      int v196;
      if (v195) {
        int v197 = 40;
        int v198 = v197 + v146;
        int v199 = v145[v198];
        int v200 = 0;
        bool v201 = v199 != v200;
        int v202;
        if (v201) {
          int v203 = 0;
          int v204 = v146 + v203;
          v202 = v204;
        } else {
          int v205 = 2;
          int v206 = v146 + v205;
          v202 = v206;
        }
        v196 = v202;
      } else {
        int v207 = 44;
        int v208 = v207 + v146;
        int v209 = v145[v208];
        int v210 = 0;
        bool v211 = v209 != v210;
        int v212;
        if (v211) {
          int v213 = 2;
          int v214 = v146 + v213;
          v212 = v214;
        } else {
          int v215 = 3;
          int v216 = v146 + v215;
          v212 = v216;
        }
        v196 = v212;
      }
      v172 = v196;
      break;
    }
  }
  bool v217 = true;
  int v218 = 32;
  int v219 = v218 + v146;
  bool v220 = true;
  int v221 = simt_wave_count_bits(v220);
  v144[v219] = v221;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
