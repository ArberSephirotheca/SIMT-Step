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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 0;
      int v8 = v0 + v7;
      v6 = v8;
      break;
    }
    case 1:
      {
      int v9 = 1;
      int v10 = v0 + v9;
      v6 = v10;
      break;
    }
    case 2:
      {
      int v11 = 0;
      bool v12 = v2 != v11;
      int v13;
      if (v12) {
        int v14 = 0;
        bool v15 = v2 != v14;
        int v16;
        if (v15) {
          v16 = v0;
        } else {
          int v17 = 1;
          v16 = v17;
        }
        int v18 = 2;
        int v19 = v0 + v18;
        v13 = v16;
      } else {
        int v20;
        v20 = v0;
        switch (v3) {
          default:
            {
            int v21 = 0;
            int v22 = v0 + v21;
            v20 = v22;
            break;
          }
          case 0:
            {
            int v23 = 3;
            int v24 = v0 + v23;
            v20 = v24;
            break;
          }
        }
        int v25 = 3;
        int v26 = v0 + v25;
        v13 = v20;
      }
      int v27 = 4;
      int v28 = v0 + v27;
      v6 = v13;
      break;
    }
    default:
      {
      int v29 = 0;
      int v30 = 0;
      int v31;
      int v32;
      v31 = v29;
      v32 = v30;
      while (true) {
        int v33 = 4;
        int v34 = v3 % v33;
        int v35 = 1;
        int v36 = v34 + v35;
        bool v37 = v32 < v36;
        v31 = v31;
        v32 = v32;
        if (!v37) break;
        int v38 = 0;
        bool v39 = v2 != v38;
        int v40;
        if (v39) {
          int v41 = 0;
          int v42 = v0 + v41;
          v40 = v42;
        } else {
          int v43 = 1;
          int v44 = v0 + v43;
          v40 = v44;
        }
        int v45 = 1;
        int v46 = v32 + v45;
        v31 = v40;
        v32 = v46;
        continue;
        ;
      }
      int v47 = 0;
      int v48 = v0 + v47;
      v6 = v31;
      break;
    }
  }
  bool v49 = true;
  int v50 = simt_wave_count_bits(v49);
  int v51 = 0;
  int v52 = v51 + v0;
  v1[v52] = v50;
  return;
}

kernel void kernel_main(device int* v53 [[buffer(0)]], device int* v54 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v55 = static_cast<int>(__simt_tid3.x);
  int v56 = 0;
  int v57 = v56 + v55;
  int v58 = v54[v57];
  int v59 = 4;
  int v60 = v59 + v55;
  int v61 = v54[v60];
  helper0(v55, v53, v58, v61, static_cast<int>(__simt_tid3.x));
  int v62 = 8;
  int v63 = v62 + v55;
  int v64 = v54[v63];
  uint v65 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v66 = (int)(v65);
  int v67;
  v67 = v66;
  switch (v64) {
    case 0:
      {
      int v68 = 1;
      v67 = v68;
      break;
    }
    case 1:
      {
      int v69 = 12;
      int v70 = v69 + v55;
      int v71 = v54[v70];
      int v72 = 4;
      int v73;
      v73 = v72;
      switch (v71) {
        default:
          {
          int v74 = 0;
          int v75 = 0;
          int v76;
          int v77;
          v76 = v74;
          v77 = v75;
          while (true) {
            int v78 = 4;
            int v79 = v77 * v78;
            int v80 = v79 + v55;
            int v81 = 16;
            int v82 = v81 + v80;
            int v83 = v54[v82];
            int v84 = 0;
            bool v85 = v83 != v84;
            v76 = v76;
            v77 = v77;
            if (!v85) break;
            int v86 = v76 + v77;
            int v87 = 1;
            int v88 = v77 + v87;
            v76 = v86;
            v77 = v88;
          }
          bool v89 = true;
          v73 = v76;
          break;
        }
        case 0:
          {
          int v90 = 4;
          int v91 = v55 + v90;
          v73 = v91;
          break;
        }
        case 1:
          {
          v73 = v55;
          break;
        }
      }
      bool v92 = true;
      v67 = v73;
      break;
    }
    case 2:
      {
      int v93 = 36;
      int v94 = v93 + v55;
      int v95 = v54[v94];
      int v96;
      v96 = v55;
      switch (v95) {
        default:
          {
          int v97 = 40;
          int v98 = v97 + v55;
          int v99 = v54[v98];
          int v100 = 0;
          bool v101 = v99 != v100;
          int v102;
          if (v101) {
            int v103 = 2;
            v102 = v103;
          } else {
            int v104 = 4;
            v102 = v104;
          }
          v96 = v102;
          break;
        }
        case 0:
          {
          int v105 = 44;
          int v106 = v105 + v55;
          int v107 = v54[v106];
          int v108 = 0;
          int v109 = v55 + v108;
          int v110;
          v110 = v109;
          switch (v107) {
            case 0:
              {
              int v111 = 2;
              int v112 = v55 + v111;
              v110 = v112;
              break;
            }
            case 1:
              {
              int v113 = 0;
              v110 = v113;
              break;
            }
            default:
              {
              v110 = v55;
              break;
            }
          }
          bool v114 = true;
          v96 = v110;
          break;
        }
      }
      bool v115 = true;
      v67 = v96;
      break;
    }
    default:
      {
      v67 = v55;
      break;
    }
  }
  bool v116 = true;
  int v117 = 16;
  int v118 = v117 + v55;
  bool v119 = true;
  int v120 = simt_wave_count_bits(v119);
  v53[v118] = v120;
  int v121 = 48;
  int v122 = v121 + v55;
  int v123 = v54[v122];
  int v124;
  v124 = v55;
  switch (v123) {
    case 0:
      {
      int v125 = 0;
      int v126 = 0;
      int v127;
      int v128;
      v127 = v125;
      v128 = v126;
      while (true) {
        int v129 = 4;
        int v130 = v128 * v129;
        int v131 = v130 + v55;
        int v132 = 52;
        int v133 = v132 + v131;
        int v134 = v54[v133];
        int v135 = 0;
        bool v136 = v134 != v135;
        v127 = v127;
        v128 = v128;
        if (!v136) break;
        int v137 = v127 + v128;
        int v138 = 1;
        int v139 = v128 + v138;
        v127 = v137;
        v128 = v139;
      }
      bool v140 = true;
      v124 = v127;
      break;
    }
    default:
      {
      int v141 = 72;
      int v142 = v141 + v55;
      int v143 = v54[v142];
      int v144 = 0;
      bool v145 = v143 != v144;
      int v146;
      if (v145) {
        int v147 = 76;
        int v148 = v147 + v55;
        int v149 = v54[v148];
        int v150 = 0;
        bool v151 = v149 != v150;
        int v152;
        if (v151) {
          v152 = v55;
        } else {
          int v153 = 4;
          v152 = v153;
        }
        v146 = v152;
      } else {
        int v154 = 80;
        int v155 = v154 + v55;
        int v156 = v54[v155];
        int v157 = 0;
        bool v158 = v156 != v157;
        int v159;
        if (v158) {
          int v160 = 1;
          v159 = v160;
        } else {
          int v161 = 0;
          v159 = v161;
        }
        v146 = v159;
      }
      v124 = v146;
      break;
    }
    case 1:
      {
      int v162 = 0;
      int v163 = 0;
      int v164;
      int v165;
      v164 = v162;
      v165 = v163;
      while (true) {
        int v166 = 4;
        int v167 = v165 * v166;
        int v168 = v167 + v55;
        int v169 = 84;
        int v170 = v169 + v168;
        int v171 = v54[v170];
        int v172 = 0;
        bool v173 = v171 != v172;
        v164 = v164;
        v165 = v165;
        if (!v173) break;
        int v174 = v164 + v165;
        int v175 = 1;
        int v176 = v165 + v175;
        v164 = v174;
        v165 = v176;
      }
      bool v177 = true;
      v124 = v164;
      break;
    }
  }
  bool v178 = true;
  int v179 = 32;
  int v180 = v179 + v55;
  bool v181 = true;
  int v182 = simt_wave_count_bits(v181);
  v53[v180] = v182;
  int v183 = 104;
  int v184 = v183 + v55;
  int v185 = v54[v184];
  int v186 = 0;
  bool v187 = v185 != v186;
  int v188;
  if (v187) {
    v188 = v55;
  } else {
    uint v189 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v190 = (int)(v189);
    v188 = v190;
  }
  int v191 = 48;
  int v192 = v191 + v55;
  bool v193 = true;
  int v194 = simt_wave_count_bits(v193);
  v53[v192] = v194;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
