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
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          v14 = v0;
        } else {
          v14 = v0;
        }
        v11 = v14;
      } else {
        int v15 = 2;
        int v16 = v3 % v15;
        int v17 = 0;
        int v18;
        v18 = v17;
        switch (v16) {
          case 0:
            {
            int v19 = 3;
            int v20 = v0 + v19;
            v18 = v20;
            break;
          }
          case 1:
            {
            int v21 = 1;
            int v22 = v0 + v21;
            v18 = v22;
            break;
          }
          default:
            {
            int v23 = 2;
            v18 = v23;
            break;
          }
        }
        v11 = v18;
      }
      v8 = v11;
      break;
    }
    case 0:
      {
      int v24 = 1;
      v8 = v24;
      break;
    }
    case 1:
      {
      int v25 = 0;
      bool v26 = v2 != v25;
      int v27;
      if (v26) {
        int v28 = 4;
        int v29 = v3 % v28;
        int v30 = 3;
        int v31 = v0 + v30;
        int v32;
        v32 = v31;
        switch (v29) {
          case 0:
            {
            int v33 = 3;
            int v34 = v0 + v33;
            v32 = v34;
            break;
          }
          case 1:
            {
            v32 = v0;
            break;
          }
          case 2:
            {
            int v35 = 0;
            int v36 = v0 + v35;
            v32 = v36;
            break;
          }
          default:
            {
            int v37 = 0;
            v32 = v37;
            break;
          }
        }
        v27 = v32;
      } else {
        int v38 = 3;
        int v39 = v3 % v38;
        int v40;
        v40 = v0;
        switch (v39) {
          default:
            {
            int v41 = 2;
            int v42 = v0 + v41;
            v40 = v42;
            break;
          }
          case 0:
            {
            v40 = v0;
            break;
          }
          case 1:
            {
            int v43 = 0;
            v40 = v43;
            break;
          }
        }
        v27 = v40;
      }
      v8 = v27;
      break;
    }
    case 2:
      {
      int v44 = 3;
      int v45 = v3 % v44;
      int v46 = 2;
      int v47;
      v47 = v46;
      switch (v45) {
        case 0:
          {
          int v48 = 3;
          int v49 = v3 % v48;
          int v50;
          v50 = v0;
          switch (v49) {
            case 0:
              {
              int v51 = 3;
              v50 = v51;
              break;
            }
            case 1:
              {
              int v52 = 2;
              int v53 = v0 + v52;
              v50 = v53;
            }
            default:
              {
              int v54 = 1;
              v50 = v54;
            }
            case 2:
              {
              int v55 = 4;
              v50 = v55;
              break;
            }
          }
          v47 = v50;
          break;
        }
        default:
          {
          int v56 = 0;
          bool v57 = v2 != v56;
          int v58;
          if (v57) {
            v58 = v0;
          } else {
            int v59 = 3;
            v58 = v59;
          }
          v47 = v58;
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
          }
          v47 = v62;
          break;
        }
        case 2:
          {
          int v71 = 0;
          int v72 = 0;
          int v73;
          int v74;
          v73 = v71;
          v74 = v72;
          while (true) {
            int v75 = 4;
            int v76 = v3 % v75;
            int v77 = 1;
            int v78 = v76 + v77;
            bool v79 = v74 < v78;
            v73 = v73;
            v74 = v74;
            if (!v79) break;
            int v80 = 3;
            int v81 = v0 + v80;
            int v82 = 1;
            int v83 = v74 + v82;
            v73 = v81;
            v74 = v83;
          }
          v47 = v73;
          break;
        }
      }
      v8 = v47;
      break;
    }
  }
  bool v84 = true;
  int v85 = simt_wave_count_bits(v84);
  int v86 = 0;
  int v87 = v86 + v0;
  v1[v87] = v85;
  return;
}

kernel void kernel_main(device int* v88 [[buffer(0)]], device int* v89 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v90 = static_cast<int>(__simt_tid3.x);
  int v91 = 0;
  int v92 = v91 + v90;
  int v93 = v89[v92];
  int v94 = 4;
  int v95 = v94 + v90;
  int v96 = v89[v95];
  helper0(v90, v88, v93, v96, static_cast<int>(__simt_tid3.x));
  int v97 = 0;
  int v98 = 0;
  int v99;
  int v100;
  v99 = v97;
  v100 = v98;
  while (true) {
    int v101 = 4;
    int v102 = v100 * v101;
    int v103 = v102 + v90;
    int v104 = 8;
    int v105 = v104 + v103;
    int v106 = v89[v105];
    int v107 = 0;
    bool v108 = v106 != v107;
    v99 = v99;
    v100 = v100;
    if (!v108) break;
    int v109 = v99 + v100;
    int v110 = 1;
    int v111 = v100 + v110;
    bool v112 = true;
    int v113 = 16;
    int v114 = 4;
    int v115 = v100 * v114;
    int v116 = v113 + v115;
    int v117 = v116 + v90;
    bool v118 = true;
    int v119 = simt_wave_count_bits(v118);
    v88[v117] = v119;
    v99 = v109;
    v100 = v111;
  }
  int v120 = 28;
  int v121 = v120 + v90;
  int v122 = v89[v121];
  int v123 = 0;
  int v124;
  v124 = v123;
  switch (v122) {
    default:
      {
      int v125 = 32;
      int v126 = v125 + v90;
      int v127 = v89[v126];
      int v128 = 0;
      bool v129 = v127 != v128;
      int v130;
      if (v129) {
        int v131 = 36;
        int v132 = v131 + v90;
        int v133 = v89[v132];
        int v134 = 4;
        int v135 = v90 + v134;
        int v136;
        v136 = v135;
        switch (v133) {
          case 0:
            {
            int v137 = 1;
            int v138 = v90 + v137;
            v136 = v138;
            break;
          }
          case 1:
            {
            int v139 = 0;
            int v140 = v90 + v139;
            v136 = v140;
            break;
          }
          default:
            {
            int v141 = 3;
            int v142 = v90 + v141;
            v136 = v142;
            break;
          }
        }
        v130 = v136;
      } else {
        int v143 = 40;
        int v144 = v143 + v90;
        int v145 = v89[v144];
        int v146 = 0;
        bool v147 = v145 != v146;
        int v148;
        if (v147) {
          v148 = v90;
        } else {
          v148 = v90;
        }
        v130 = v148;
      }
      v124 = v130;
      break;
    }
    case 0:
      {
      int v149 = 44;
      int v150 = v149 + v90;
      int v151 = v89[v150];
      int v152;
      v152 = v90;
      switch (v151) {
        case 0:
          {
          int v153 = 48;
          int v154 = v153 + v90;
          int v155 = v89[v154];
          int v156 = 0;
          bool v157 = v155 != v156;
          int v158;
          if (v157) {
            int v159 = 2;
            int v160 = v90 + v159;
            v158 = v160;
          } else {
            int v161 = 1;
            v158 = v161;
          }
          v152 = v158;
          break;
        }
        default:
          {
          int v162 = 52;
          int v163 = v162 + v90;
          int v164 = v89[v163];
          int v165 = 1;
          int v166 = v90 + v165;
          int v167;
          v167 = v166;
          switch (v164) {
            case 0:
              {
              v167 = v90;
              break;
            }
            default:
              {
              int v168 = 0;
              v167 = v168;
              break;
            }
            case 1:
              {
              int v169 = 2;
              int v170 = v90 + v169;
              v167 = v170;
              break;
            }
            case 2:
              {
              int v171 = 1;
              v167 = v171;
              break;
            }
          }
          bool v172 = true;
          v152 = v167;
          break;
        }
        case 1:
          {
          int v173 = 0;
          int v174 = 0;
          int v175;
          int v176;
          v175 = v173;
          v176 = v174;
          while (true) {
            int v177 = 4;
            int v178 = v176 * v177;
            int v179 = v178 + v90;
            int v180 = 56;
            int v181 = v180 + v179;
            int v182 = v89[v181];
            int v183 = 0;
            bool v184 = v182 != v183;
            v175 = v175;
            v176 = v176;
            if (!v184) break;
            int v185 = v175 + v176;
            int v186 = 1;
            int v187 = v176 + v186;
            bool v188 = true;
            v175 = v185;
            v176 = v187;
          }
          v152 = v175;
          break;
        }
        case 2:
          {
          int v189 = 0;
          int v190 = 0;
          int v191;
          int v192;
          v191 = v189;
          v192 = v190;
          while (true) {
            int v193 = 4;
            int v194 = v192 * v193;
            int v195 = v194 + v90;
            int v196 = 76;
            int v197 = v196 + v195;
            int v198 = v89[v197];
            int v199 = 0;
            bool v200 = v198 != v199;
            v191 = v191;
            v192 = v192;
            if (!v200) break;
            int v201 = v191 + v192;
            int v202 = 1;
            int v203 = v192 + v202;
            bool v204 = true;
            v191 = v201;
            v192 = v203;
            continue;
            ;
          }
          v152 = v191;
          break;
        }
      }
      v124 = v152;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 32; ++idx) {
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
