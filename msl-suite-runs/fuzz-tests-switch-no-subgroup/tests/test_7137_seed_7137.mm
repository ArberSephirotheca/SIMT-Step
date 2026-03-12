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
  int v6 = 1;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11;
      v11 = v0;
      switch (v10) {
        case 0:
          {
          int v12 = 0;
          int v13 = 0;
          int v14;
          int v15;
          v14 = v12;
          v15 = v13;
          while (true) {
            int v16 = 4;
            int v17 = v3 % v16;
            int v18 = 1;
            int v19 = v17 + v18;
            bool v20 = v15 < v19;
            v14 = v14;
            v15 = v15;
            if (!v20) break;
            int v21 = 1;
            int v22 = v15 + v21;
            v14 = v0;
            v15 = v22;
          }
          v11 = v14;
          break;
        }
        default:
          {
          int v23 = 4;
          int v24 = v3 % v23;
          int v25;
          v25 = v0;
          switch (v24) {
            default:
              {
              int v26 = 3;
              int v27 = v0 + v26;
              v25 = v27;
              break;
            }
            case 0:
              {
              int v28 = 2;
              int v29 = v0 + v28;
              v25 = v29;
              break;
            }
            case 1:
              {
              int v30 = 1;
              v25 = v30;
              break;
            }
            case 2:
              {
              int v31 = 4;
              int v32 = v0 + v31;
              v25 = v32;
              break;
            }
          }
          v11 = v25;
          break;
        }
        case 1:
          {
          int v33 = 3;
          int v34 = v3 % v33;
          int v35 = 4;
          int v36 = v0 + v35;
          int v37;
          v37 = v36;
          switch (v34) {
            default:
              {
              v37 = v0;
              break;
            }
            case 0:
              {
              v37 = v0;
              break;
            }
            case 1:
              {
              v37 = v0;
              break;
            }
          }
          v11 = v37;
          break;
        }
        case 2:
          {
          int v38 = 0;
          bool v39 = v2 != v38;
          int v40;
          if (v39) {
            int v41 = 4;
            int v42 = v0 + v41;
            v40 = v42;
          } else {
            int v43 = 1;
            int v44 = v0 + v43;
            v40 = v44;
          }
          v11 = v40;
          break;
        }
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v45 = 3;
      int v46 = v3 % v45;
      int v47;
      v47 = v0;
      switch (v46) {
        case 0:
          {
          int v48 = 0;
          int v49 = 0;
          int v50;
          int v51;
          v50 = v48;
          v51 = v49;
          while (true) {
            int v52 = 4;
            int v53 = v3 % v52;
            int v54 = 1;
            int v55 = v53 + v54;
            bool v56 = v51 < v55;
            v50 = v50;
            v51 = v51;
            if (!v56) break;
            int v57 = 3;
            int v58 = 1;
            int v59 = v51 + v58;
            v50 = v57;
            v51 = v59;
          }
          v47 = v50;
          break;
        }
        case 1:
          {
          int v60 = 0;
          int v61 = 0;
          int v62;
          int v63;
          v62 = v60;
          v63 = v61;
          while (true) {
            int v64 = 4;
            int v65 = v3 % v64;
            int v66 = 1;
            int v67 = v65 + v66;
            bool v68 = v63 < v67;
            v62 = v62;
            v63 = v63;
            if (!v68) break;
            int v69 = 1;
            int v70 = v63 + v69;
            v62 = v0;
            v63 = v70;
            break;
            ;
          }
          v47 = v62;
          break;
        }
        case 2:
          {
          int v71 = 0;
          bool v72 = v2 != v71;
          int v73;
          if (v72) {
            int v74 = 3;
            int v75 = v0 + v74;
            v73 = v75;
          } else {
            v73 = v0;
          }
          v47 = v73;
          break;
        }
        default:
          {
          int v76 = 2;
          int v77 = v3 % v76;
          int v78;
          v78 = v0;
          switch (v77) {
            case 0:
              {
              int v79 = 3;
              int v80 = v0 + v79;
              v78 = v80;
              break;
            }
            default:
              {
              int v81 = 1;
              v78 = v81;
              break;
            }
          }
          v47 = v78;
          break;
        }
      }
      v8 = v47;
      break;
    }
    case 2:
      {
      int v82 = 0;
      bool v83 = v2 != v82;
      int v84;
      if (v83) {
        int v85 = 0;
        int v86 = 0;
        int v87;
        int v88;
        v87 = v85;
        v88 = v86;
        while (true) {
          int v89 = 4;
          int v90 = v3 % v89;
          int v91 = 1;
          int v92 = v90 + v91;
          bool v93 = v88 < v92;
          v87 = v87;
          v88 = v88;
          if (!v93) break;
          int v94 = 2;
          int v95 = v0 + v94;
          int v96 = 1;
          int v97 = v88 + v96;
          v87 = v95;
          v88 = v97;
        }
        v84 = v87;
      } else {
        int v98 = 0;
        bool v99 = v2 != v98;
        int v100;
        if (v99) {
          int v101 = 4;
          v100 = v101;
        } else {
          int v102 = 3;
          int v103 = v0 + v102;
          v100 = v103;
        }
        v84 = v100;
      }
      v8 = v84;
      break;
    }
    default:
      {
      int v104 = 0;
      bool v105 = v2 != v104;
      int v106;
      if (v105) {
        int v107 = 2;
        int v108 = v3 % v107;
        int v109 = 1;
        int v110 = v0 + v109;
        int v111;
        v111 = v110;
        switch (v108) {
          case 0:
            {
            int v112 = 2;
            int v113 = v0 + v112;
            v111 = v113;
          }
          case 1:
            {
            int v114 = 0;
            v111 = v114;
          }
          default:
            {
            int v115 = 1;
            int v116 = v0 + v115;
            v111 = v116;
            break;
          }
        }
        int v117 = 2;
        v106 = v111;
      } else {
        v106 = v0;
      }
      v8 = v106;
      break;
    }
  }
  bool v118 = true;
  int v119 = simt_wave_count_bits(v118);
  int v120 = 0;
  int v121 = v120 + v0;
  v1[v121] = v119;
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
  int v134;
  v134 = v124;
  switch (v133) {
    case 0:
      {
      int v135 = 12;
      int v136 = v135 + v124;
      int v137 = v123[v136];
      int v138;
      v138 = v124;
      switch (v137) {
        case 0:
          {
          int v139 = 16;
          int v140 = v139 + v124;
          int v141 = v123[v140];
          int v142;
          v142 = v124;
          switch (v141) {
            case 0:
              {
              v142 = v124;
              break;
            }
            default:
              {
              v142 = v124;
              break;
            }
            case 1:
              {
              v142 = v124;
              break;
            }
          }
          v138 = v142;
        }
        default:
          {
          int v143 = 3;
          v138 = v143;
          break;
        }
      }
      bool v144 = true;
      v134 = v138;
      break;
    }
    default:
      {
      int v145 = 20;
      int v146 = v145 + v124;
      int v147 = v123[v146];
      int v148 = 2;
      int v149;
      v149 = v148;
      switch (v147) {
        default:
          {
          int v150 = 24;
          int v151 = v150 + v124;
          int v152 = v123[v151];
          int v153 = 3;
          int v154 = v124 + v153;
          int v155;
          v155 = v154;
          switch (v152) {
            case 0:
              {
              int v156 = 4;
              int v157 = v124 + v156;
              v155 = v157;
            }
            default:
              {
              v155 = v124;
              break;
            }
            case 1:
              {
              v155 = v124;
              break;
            }
          }
          v149 = v155;
          break;
        }
        case 0:
          {
          int v158 = 28;
          int v159 = v158 + v124;
          int v160 = v123[v159];
          int v161 = 0;
          bool v162 = v160 != v161;
          int v163;
          if (v162) {
            int v164 = 0;
            v163 = v164;
          } else {
            v163 = v124;
          }
          v149 = v163;
          break;
        }
      }
      bool v165 = true;
      v134 = v149;
      break;
    }
    case 1:
      {
      int v166 = 32;
      int v167 = v166 + v124;
      int v168 = v123[v167];
      int v169;
      v169 = v124;
      switch (v168) {
        case 0:
          {
          int v170 = 36;
          int v171 = v170 + v124;
          int v172 = v123[v171];
          int v173;
          v173 = v124;
          switch (v172) {
            case 0:
              {
              int v174 = 2;
              int v175 = v124 + v174;
              v173 = v175;
            }
            case 1:
              {
              v173 = v124;
              break;
            }
            default:
              {
              int v176 = 4;
              v173 = v176;
              break;
            }
          }
          v169 = v173;
        }
        case 1:
          {
          int v177 = 0;
          int v178 = 0;
          int v179;
          int v180;
          v179 = v177;
          v180 = v178;
          while (true) {
            int v181 = 4;
            int v182 = v180 * v181;
            int v183 = v182 + v124;
            int v184 = 40;
            int v185 = v184 + v183;
            int v186 = v123[v185];
            int v187 = 0;
            bool v188 = v186 != v187;
            v179 = v179;
            v180 = v180;
            if (!v188) break;
            int v189 = v179 + v180;
            int v190 = 1;
            int v191 = v180 + v190;
            bool v192 = true;
            v179 = v189;
            v180 = v191;
          }
          v169 = v179;
        }
        case 2:
          {
          int v193 = 0;
          int v194 = 0;
          int v195;
          int v196;
          v195 = v193;
          v196 = v194;
          while (true) {
            int v197 = 4;
            int v198 = v196 * v197;
            int v199 = v198 + v124;
            int v200 = 60;
            int v201 = v200 + v199;
            int v202 = v123[v201];
            int v203 = 0;
            bool v204 = v202 != v203;
            v195 = v195;
            v196 = v196;
            if (!v204) break;
            int v205 = v195 + v196;
            int v206 = 1;
            int v207 = v196 + v206;
            bool v208 = true;
            v195 = v205;
            v196 = v207;
          }
          v169 = v195;
        }
        default:
          {
          int v209 = 0;
          int v210 = 0;
          int v211;
          int v212;
          v211 = v209;
          v212 = v210;
          while (true) {
            int v213 = 4;
            int v214 = v212 * v213;
            int v215 = v214 + v124;
            int v216 = 80;
            int v217 = v216 + v215;
            int v218 = v123[v217];
            int v219 = 0;
            bool v220 = v218 != v219;
            v211 = v211;
            v212 = v212;
            if (!v220) break;
            int v221 = v211 + v212;
            int v222 = 1;
            int v223 = v212 + v222;
            bool v224 = true;
            v211 = v221;
            v212 = v223;
          }
          v169 = v211;
          break;
        }
      }
      v134 = v169;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
