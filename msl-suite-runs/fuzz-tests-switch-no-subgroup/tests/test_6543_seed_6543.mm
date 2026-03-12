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
  int v10 = 4;
  int v11;
  v11 = v10;
  switch (v9) {
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
        int v21 = 4;
        int v22 = v3 % v21;
        int v23 = 0;
        int v24;
        v24 = v23;
        switch (v22) {
          default:
            {
            int v25 = 1;
            int v26 = v0 + v25;
            v24 = v26;
          }
          case 0:
            {
            v24 = v0;
          }
          case 1:
            {
            int v27 = 2;
            int v28 = v0 + v27;
            v24 = v28;
          }
          case 2:
            {
            int v29 = 4;
            int v30 = v0 + v29;
            v24 = v30;
            break;
          }
        }
        int v31 = 1;
        int v32 = v15 + v31;
        v14 = v24;
        v15 = v32;
      }
      v11 = v14;
      break;
    }
    case 1:
      {
      int v33 = 3;
      int v34 = v3 % v33;
      int v35;
      v35 = v0;
      switch (v34) {
        case 0:
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
            int v45 = 1;
            int v46 = 1;
            int v47 = v39 + v46;
            v38 = v45;
            v39 = v47;
          }
          v35 = v38;
          break;
        }
        case 1:
          {
          int v48 = 0;
          v35 = v48;
          break;
        }
        default:
          {
          int v49 = 3;
          int v50 = v3 % v49;
          int v51 = 0;
          int v52 = v0 + v51;
          int v53;
          v53 = v52;
          switch (v50) {
            case 0:
              {
              int v54 = 3;
              int v55 = v0 + v54;
              v53 = v55;
              break;
            }
            default:
              {
              v53 = v0;
              break;
            }
            case 1:
              {
              int v56 = 1;
              int v57 = v0 + v56;
              v53 = v57;
              break;
            }
            case 2:
              {
              int v58 = 4;
              v53 = v58;
              break;
            }
          }
          v35 = v53;
          break;
        }
        case 2:
          {
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
            int v69 = 1;
            int v70 = v62 + v69;
            v61 = v68;
            v62 = v70;
            continue;
            ;
          }
          v35 = v61;
          break;
        }
      }
      v11 = v35;
      break;
    }
    default:
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
        int v81 = v3 % v80;
        int v82 = 3;
        int v83 = v0 + v82;
        int v84;
        v84 = v83;
        switch (v81) {
          case 0:
            {
            int v85 = 2;
            v84 = v85;
          }
          default:
            {
            int v86 = 2;
            int v87 = v0 + v86;
            v84 = v87;
          }
          case 1:
            {
            v84 = v0;
            break;
          }
        }
        int v88 = 1;
        int v89 = v74 + v88;
        v73 = v84;
        v74 = v89;
      }
      v11 = v73;
      break;
    }
    case 2:
      {
      int v90 = 3;
      int v91 = v0 + v90;
      v11 = v91;
      break;
    }
  }
  int v92 = 0;
  bool v93 = v2 != v92;
  int v94 = v93 ? v5 : v11;
  return;
}

kernel void kernel_main(device int* v95 [[buffer(0)]], device int* v96 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v97 = static_cast<int>(__simt_tid3.x);
  int v98 = 0;
  int v99 = v98 + v97;
  int v100 = v96[v99];
  int v101 = 4;
  int v102 = v101 + v97;
  int v103 = v96[v102];
  helper0(v97, v95, v100, v103, static_cast<int>(__simt_tid3.x));
  int v104 = 8;
  int v105 = v104 + v97;
  int v106 = v96[v105];
  int v107;
  v107 = v97;
  switch (v106) {
    case 0:
      {
      int v108 = 1;
      v107 = v108;
    }
    case 1:
      {
      int v109 = 0;
      int v110 = 0;
      int v111;
      int v112;
      v111 = v109;
      v112 = v110;
      while (true) {
        int v113 = 4;
        int v114 = v112 * v113;
        int v115 = v114 + v97;
        int v116 = 12;
        int v117 = v116 + v115;
        int v118 = v96[v117];
        int v119 = 0;
        bool v120 = v118 != v119;
        v111 = v111;
        v112 = v112;
        if (!v120) break;
        int v121 = v111 + v112;
        int v122 = 1;
        int v123 = v112 + v122;
        bool v124 = true;
        v111 = v121;
        v112 = v123;
        break;
        ;
      }
      v107 = v111;
    }
    default:
      {
      v107 = v97;
      break;
    }
    case 2:
      {
      int v125 = 32;
      int v126 = v125 + v97;
      int v127 = v96[v126];
      int v128 = 0;
      bool v129 = v127 != v128;
      int v130;
      if (v129) {
        int v131 = 36;
        int v132 = v131 + v97;
        int v133 = v96[v132];
        int v134 = 4;
        int v135 = v97 + v134;
        int v136;
        v136 = v135;
        switch (v133) {
          case 0:
            {
            v136 = v97;
            break;
          }
          case 1:
            {
            int v137 = 1;
            v136 = v137;
            break;
          }
          case 2:
            {
            int v138 = 2;
            int v139 = v97 + v138;
            v136 = v139;
          }
          default:
            {
            int v140 = 1;
            v136 = v140;
            break;
          }
        }
        v130 = v136;
      } else {
        int v141 = 0;
        int v142 = 0;
        int v143;
        int v144;
        v143 = v141;
        v144 = v142;
        while (true) {
          int v145 = 4;
          int v146 = v144 * v145;
          int v147 = v146 + v97;
          int v148 = 40;
          int v149 = v148 + v147;
          int v150 = v96[v149];
          int v151 = 0;
          bool v152 = v150 != v151;
          v143 = v143;
          v144 = v144;
          if (!v152) break;
          int v153 = v143 + v144;
          int v154 = 1;
          int v155 = v144 + v154;
          bool v156 = true;
          v143 = v153;
          v144 = v155;
        }
        v130 = v143;
      }
      v107 = v130;
      break;
    }
  }
  int v157 = 60;
  int v158 = v157 + v97;
  int v159 = v96[v158];
  uint v160 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v161 = (int)(v160);
  int v162;
  v162 = v161;
  switch (v159) {
    case 0:
      {
      int v163 = 64;
      int v164 = v163 + v97;
      int v165 = v96[v164];
      int v166;
      v166 = v97;
      switch (v165) {
        case 0:
          {
          int v167 = 68;
          int v168 = v167 + v97;
          int v169 = v96[v168];
          int v170 = 0;
          bool v171 = v169 != v170;
          int v172;
          if (v171) {
            int v173 = 3;
            int v174 = v97 + v173;
            v172 = v174;
          } else {
            v172 = v97;
          }
          v166 = v172;
        }
        default:
          {
          int v175 = 1;
          int v176 = v97 + v175;
          v166 = v176;
        }
        case 1:
          {
          int v177 = 1;
          int v178 = v97 + v177;
          v166 = v178;
          break;
        }
        case 2:
          {
          int v179 = 72;
          int v180 = v179 + v97;
          int v181 = v96[v180];
          int v182 = 0;
          bool v183 = v181 != v182;
          int v184;
          if (v183) {
            v184 = v97;
          } else {
            int v185 = 4;
            v184 = v185;
          }
          v166 = v184;
          break;
        }
      }
      v162 = v166;
      break;
    }
    default:
      {
      int v186 = 0;
      int v187 = 0;
      int v188;
      int v189;
      v188 = v186;
      v189 = v187;
      while (true) {
        int v190 = 4;
        int v191 = v189 * v190;
        int v192 = v191 + v97;
        int v193 = 76;
        int v194 = v193 + v192;
        int v195 = v96[v194];
        int v196 = 0;
        bool v197 = v195 != v196;
        v188 = v188;
        v189 = v189;
        if (!v197) break;
        int v198 = v188 + v189;
        int v199 = 1;
        int v200 = v189 + v199;
        bool v201 = true;
        v188 = v198;
        v189 = v200;
      }
      v162 = v188;
      break;
    }
    case 1:
      {
      v162 = v97;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
