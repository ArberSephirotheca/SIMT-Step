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
  int v6 = 4;
  int v7;
  v7 = v6;
  switch (v5) {
    default:
      {
      int v8 = 0;
      int v9 = 0;
      int v10;
      int v11;
      v10 = v8;
      v11 = v9;
      while (true) {
        int v12 = 4;
        int v13 = v3 % v12;
        int v14 = 1;
        int v15 = v13 + v14;
        bool v16 = v11 < v15;
        v10 = v10;
        v11 = v11;
        if (!v16) break;
        int v17 = 0;
        int v18 = 0;
        int v19;
        int v20;
        v19 = v17;
        v20 = v18;
        while (true) {
          int v21 = 4;
          int v22 = v3 % v21;
          int v23 = 1;
          int v24 = v22 + v23;
          bool v25 = v20 < v24;
          v19 = v19;
          v20 = v20;
          if (!v25) break;
          int v26 = 3;
          int v27 = v0 + v26;
          int v28 = 1;
          int v29 = v20 + v28;
          v19 = v27;
          v20 = v29;
          break;
          ;
        }
        int v30 = 4;
        int v31 = 1;
        int v32 = v11 + v31;
        v10 = v19;
        v11 = v32;
      }
      v7 = v10;
    }
    case 0:
      {
      int v33 = 3;
      int v34 = v3 % v33;
      int v35;
      v35 = v0;
      switch (v34) {
        case 0:
          {
          int v36 = 4;
          int v37 = v3 % v36;
          int v38 = 4;
          int v39;
          v39 = v38;
          switch (v37) {
            case 0:
              {
              int v40 = 0;
              v39 = v40;
            }
            case 1:
              {
              int v41 = 1;
              v39 = v41;
              break;
            }
            case 2:
              {
              int v42 = 4;
              v39 = v42;
            }
            default:
              {
              int v43 = 1;
              int v44 = v0 + v43;
              v39 = v44;
              break;
            }
          }
          v35 = v39;
          break;
        }
        case 1:
          {
          int v45 = 0;
          int v46 = 0;
          int v47;
          int v48;
          v47 = v45;
          v48 = v46;
          while (true) {
            int v49 = 4;
            int v50 = v3 % v49;
            int v51 = 1;
            int v52 = v50 + v51;
            bool v53 = v48 < v52;
            v47 = v47;
            v48 = v48;
            if (!v53) break;
            int v54 = 1;
            int v55 = v48 + v54;
            v47 = v0;
            v48 = v55;
            break;
            ;
          }
          v35 = v47;
        }
        default:
          {
          int v56 = 0;
          int v57 = 0;
          int v58;
          int v59;
          v58 = v56;
          v59 = v57;
          while (true) {
            int v60 = 4;
            int v61 = v3 % v60;
            int v62 = 1;
            int v63 = v61 + v62;
            bool v64 = v59 < v63;
            v58 = v58;
            v59 = v59;
            if (!v64) break;
            int v65 = 1;
            int v66 = v0 + v65;
            int v67 = 1;
            int v68 = v59 + v67;
            v58 = v66;
            v59 = v68;
          }
          int v69 = 2;
          v35 = v58;
        }
        case 2:
          {
          int v70 = 0;
          v35 = v70;
          break;
        }
      }
      v7 = v35;
    }
    case 1:
      {
      int v71 = 0;
      bool v72 = v2 != v71;
      int v73;
      if (v72) {
        int v74 = 2;
        int v75 = v3 % v74;
        int v76 = 0;
        int v77;
        v77 = v76;
        switch (v75) {
          case 0:
            {
            int v78 = 0;
            v77 = v78;
          }
          case 1:
            {
            v77 = v0;
          }
          default:
            {
            v77 = v0;
            break;
          }
        }
        int v79 = 4;
        v73 = v77;
      } else {
        int v80 = 0;
        bool v81 = v2 != v80;
        int v82;
        if (v81) {
          int v83 = 3;
          v82 = v83;
        } else {
          v82 = v0;
        }
        int v84 = 3;
        v73 = v82;
      }
      v7 = v73;
      break;
    }
    case 2:
      {
      int v85 = 0;
      bool v86 = v2 != v85;
      int v87;
      if (v86) {
        int v88 = 0;
        bool v89 = v2 != v88;
        int v90;
        if (v89) {
          int v91 = 3;
          v90 = v91;
        } else {
          int v92 = 1;
          int v93 = v0 + v92;
          v90 = v93;
        }
        int v94 = 0;
        int v95 = v0 + v94;
        v87 = v90;
      } else {
        int v96 = 0;
        int v97 = 0;
        int v98;
        int v99;
        v98 = v96;
        v99 = v97;
        while (true) {
          int v100 = 4;
          int v101 = v3 % v100;
          int v102 = 1;
          int v103 = v101 + v102;
          bool v104 = v99 < v103;
          v98 = v98;
          v99 = v99;
          if (!v104) break;
          int v105 = 0;
          int v106 = 1;
          int v107 = v99 + v106;
          v98 = v105;
          v99 = v107;
        }
        v87 = v98;
      }
      int v108 = 3;
      v7 = v87;
      break;
    }
  }
  bool v109 = true;
  int v110 = simt_wave_count_bits(v109);
  int v111 = 0;
  int v112 = v111 + v0;
  v1[v112] = v110;
  return;
}

kernel void kernel_main(device int* v113 [[buffer(0)]], device int* v114 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v115 = static_cast<int>(__simt_tid3.x);
  int v116 = 0;
  int v117 = v116 + v115;
  int v118 = v114[v117];
  int v119 = 4;
  int v120 = v119 + v115;
  int v121 = v114[v120];
  helper0(v115, v113, v118, v121, static_cast<int>(__simt_tid3.x));
  int v122 = 0;
  int v123 = 0;
  int v124;
  int v125;
  v124 = v122;
  v125 = v123;
  while (true) {
    int v126 = 4;
    int v127 = v125 * v126;
    int v128 = v127 + v115;
    int v129 = 8;
    int v130 = v129 + v128;
    int v131 = v114[v130];
    int v132 = 0;
    bool v133 = v131 != v132;
    v124 = v124;
    v125 = v125;
    if (!v133) break;
    int v134 = 28;
    int v135 = v134 + v115;
    int v136 = v114[v135];
    int v137 = 0;
    bool v138 = v136 != v137;
    int v139;
    if (v138) {
      v139 = v115;
    } else {
      int v140 = 32;
      int v141 = v140 + v115;
      int v142 = v114[v141];
      int v143 = 0;
      bool v144 = v142 != v143;
      int v145;
      if (v144) {
        v145 = v115;
      } else {
        v145 = v115;
      }
      v139 = v145;
    }
    int v146 = v124 + v139;
    int v147 = 1;
    int v148 = v125 + v147;
    v124 = v146;
    v125 = v148;
  }
  bool v149 = true;
  int v150 = 16;
  int v151 = v150 + v115;
  bool v152 = true;
  int v153 = simt_wave_count_bits(v152);
  v113[v151] = v153;
  int v154 = 0;
  int v155 = 0;
  int v156;
  int v157;
  v156 = v154;
  v157 = v155;
  while (true) {
    int v158 = 4;
    int v159 = v157 * v158;
    int v160 = v159 + v115;
    int v161 = 36;
    int v162 = v161 + v160;
    int v163 = v114[v162];
    int v164 = 0;
    bool v165 = v163 != v164;
    v156 = v156;
    v157 = v157;
    if (!v165) break;
    int v166 = v156 + v157;
    int v167 = 1;
    int v168 = v157 + v167;
    v156 = v166;
    v157 = v168;
    continue;
    ;
  }
  bool v169 = true;
  int v170 = 32;
  int v171 = v170 + v115;
  bool v172 = true;
  int v173 = simt_wave_count_bits(v172);
  v113[v171] = v173;
  int v174 = 56;
  int v175 = v174 + v115;
  int v176 = v114[v175];
  int v177 = 0;
  bool v178 = v176 != v177;
  int v179;
  if (v178) {
    int v180 = 0;
    int v181 = 0;
    int v182;
    int v183;
    v182 = v180;
    v183 = v181;
    while (true) {
      int v184 = 4;
      int v185 = v183 * v184;
      int v186 = v185 + v115;
      int v187 = 60;
      int v188 = v187 + v186;
      int v189 = v114[v188];
      int v190 = 0;
      bool v191 = v189 != v190;
      v182 = v182;
      v183 = v183;
      if (!v191) break;
      uint v192 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v193 = (int)(v192);
      int v194 = v182 + v193;
      int v195 = 1;
      int v196 = v183 + v195;
      v182 = v194;
      v183 = v196;
    }
    bool v197 = true;
    v179 = v182;
  } else {
    uint v198 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v199 = (int)(v198);
    v179 = v199;
  }
  int v200 = 48;
  int v201 = v200 + v115;
  bool v202 = true;
  int v203 = simt_wave_count_bits(v202);
  v113[v201] = v203;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
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
