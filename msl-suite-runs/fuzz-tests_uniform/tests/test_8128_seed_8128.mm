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
  int v4 = 2;
  int v5 = v3 % v4;
  int v6 = 3;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          int v15 = 1;
          v14 = v15;
        } else {
          int v16 = 4;
          int v17 = v0 + v16;
          v14 = v17;
        }
        int v18 = 1;
        v11 = v14;
      } else {
        int v19 = 3;
        int v20 = v3 % v19;
        int v21;
        v21 = v0;
        switch (v20) {
          case 0:
            {
            int v22 = 3;
            int v23 = v0 + v22;
            v21 = v23;
            break;
          }
          case 1:
            {
            int v24 = 0;
            v21 = v24;
          }
          case 2:
            {
            int v25 = 1;
            int v26 = v0 + v25;
            v21 = v26;
          }
          default:
            {
            int v27 = 4;
            int v28 = v0 + v27;
            v21 = v28;
            break;
          }
        }
        v11 = v21;
      }
      v8 = v11;
    }
    case 1:
      {
      int v29;
      v29 = v0;
      switch (v3) {
        case 0:
          {
          int v30 = 0;
          bool v31 = v2 != v30;
          int v32;
          if (v31) {
            int v33 = 0;
            int v34 = v0 + v33;
            v32 = v34;
          } else {
            v32 = v0;
          }
          int v35 = 0;
          int v36 = v0 + v35;
          v29 = v32;
          break;
        }
        default:
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
            int v46 = 0;
            int v47 = v0 + v46;
            int v48 = 1;
            int v49 = v40 + v48;
            v39 = v47;
            v40 = v49;
          }
          int v50 = 3;
          int v51 = v0 + v50;
          v29 = v39;
          break;
        }
      }
      int v52 = 1;
      v8 = v29;
    }
    default:
      {
      int v53 = 3;
      int v54 = v3 % v53;
      int v55;
      v55 = v0;
      switch (v54) {
        case 0:
          {
          int v56 = 4;
          int v57 = v3 % v56;
          int v58 = 4;
          int v59;
          v59 = v58;
          switch (v57) {
            default:
              {
              int v60 = 1;
              v59 = v60;
              break;
            }
            case 0:
              {
              int v61 = 3;
              v59 = v61;
              break;
            }
            case 1:
              {
              int v62 = 1;
              v59 = v62;
              break;
            }
            case 2:
              {
              int v63 = 0;
              int v64 = v0 + v63;
              v59 = v64;
              break;
            }
          }
          int v65 = 1;
          v55 = v59;
          break;
        }
        case 1:
          {
          int v66 = 4;
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
            case 1:
              {
              int v71 = 2;
              v70 = v71;
            }
            case 2:
              {
              int v72 = 3;
              v70 = v72;
              break;
            }
            default:
              {
              int v73 = 0;
              v70 = v73;
              break;
            }
          }
          int v74 = 4;
          v55 = v70;
          break;
        }
        case 2:
          {
          int v75 = 4;
          int v76;
          v76 = v75;
          switch (v3) {
            default:
              {
              int v77 = 1;
              v76 = v77;
              break;
            }
            case 0:
              {
              int v78 = 2;
              int v79 = v0 + v78;
              v76 = v79;
              break;
            }
          }
          v55 = v76;
          break;
        }
        default:
          {
          int v80 = 0;
          bool v81 = v2 != v80;
          int v82;
          if (v81) {
            v82 = v0;
          } else {
            v82 = v0;
          }
          v55 = v82;
          break;
        }
      }
      int v83 = 0;
      int v84 = v0 + v83;
      v8 = v55;
      break;
    }
  }
  bool v85 = true;
  int v86 = simt_wave_count_bits(v85);
  int v87 = 0;
  int v88 = v87 + v0;
  v1[v88] = v86;
  return;
}

kernel void kernel_main(device int* v89 [[buffer(0)]], device int* v90 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v91 = static_cast<int>(__simt_tid3.x);
  int v92 = 0;
  int v93 = v92 + v91;
  int v94 = v90[v93];
  int v95 = 4;
  int v96 = v95 + v91;
  int v97 = v90[v96];
  helper0(v91, v89, v94, v97, static_cast<int>(__simt_tid3.x));
  int v98 = 8;
  int v99 = v98 + v91;
  int v100 = v90[v99];
  int v101 = 0;
  int v102 = v91 + v101;
  int v103;
  v103 = v102;
  switch (v100) {
    default:
      {
      int v104 = 0;
      int v105 = 0;
      int v106;
      int v107;
      v106 = v104;
      v107 = v105;
      while (true) {
        int v108 = 4;
        int v109 = v107 * v108;
        int v110 = v109 + v91;
        int v111 = 12;
        int v112 = v111 + v110;
        int v113 = v90[v112];
        int v114 = 0;
        bool v115 = v113 != v114;
        v106 = v106;
        v107 = v107;
        if (!v115) break;
        int v116 = v106 + v107;
        int v117 = 1;
        int v118 = v107 + v117;
        v106 = v116;
        v107 = v118;
      }
      bool v119 = true;
      v103 = v106;
      break;
    }
    case 0:
      {
      int v120 = 32;
      int v121 = v120 + v91;
      int v122 = v90[v121];
      int v123 = 3;
      int v124 = v91 + v123;
      int v125;
      v125 = v124;
      switch (v122) {
        case 0:
          {
          int v126 = 1;
          v125 = v126;
          break;
        }
        default:
          {
          int v127 = 36;
          int v128 = v127 + v91;
          int v129 = v90[v128];
          int v130 = 1;
          int v131 = v91 + v130;
          int v132;
          v132 = v131;
          switch (v129) {
            default:
              {
              v132 = v91;
              break;
            }
            case 0:
              {
              int v133 = 3;
              int v134 = v91 + v133;
              v132 = v134;
            }
            case 1:
              {
              int v135 = 4;
              v132 = v135;
              break;
            }
          }
          bool v136 = true;
          v125 = v132;
          break;
        }
        case 1:
          {
          int v137 = 40;
          int v138 = v137 + v91;
          int v139 = v90[v138];
          int v140 = 0;
          bool v141 = v139 != v140;
          int v142;
          if (v141) {
            int v143 = 3;
            int v144 = v91 + v143;
            v142 = v144;
          } else {
            int v145 = 3;
            v142 = v145;
          }
          v125 = v142;
          break;
        }
      }
      bool v146 = true;
      v103 = v125;
    }
    case 1:
      {
      int v147 = 44;
      int v148 = v147 + v91;
      int v149 = v90[v148];
      int v150 = 0;
      bool v151 = v149 != v150;
      int v152;
      if (v151) {
        v152 = v91;
      } else {
        int v153 = 0;
        int v154 = 0;
        int v155;
        int v156;
        v155 = v153;
        v156 = v154;
        while (true) {
          int v157 = 4;
          int v158 = v156 * v157;
          int v159 = v158 + v91;
          int v160 = 48;
          int v161 = v160 + v159;
          int v162 = v90[v161];
          int v163 = 0;
          bool v164 = v162 != v163;
          v155 = v155;
          v156 = v156;
          if (!v164) break;
          int v165 = v155 + v156;
          int v166 = 1;
          int v167 = v156 + v166;
          v155 = v165;
          v156 = v167;
          break;
          ;
        }
        bool v168 = true;
        v152 = v155;
      }
      v103 = v152;
    }
    case 2:
      {
      int v169 = 68;
      int v170 = v169 + v91;
      int v171 = v90[v170];
      int v172 = 0;
      int v173;
      v173 = v172;
      switch (v171) {
        default:
          {
          int v174 = 72;
          int v175 = v174 + v91;
          int v176 = v90[v175];
          int v177 = 1;
          int v178;
          v178 = v177;
          switch (v176) {
            default:
              {
              int v179 = 2;
              v178 = v179;
              break;
            }
            case 0:
              {
              int v180 = 0;
              v178 = v180;
              break;
            }
          }
          bool v181 = true;
          v173 = v178;
          break;
        }
        case 0:
          {
          int v182 = 76;
          int v183 = v182 + v91;
          int v184 = v90[v183];
          int v185 = 0;
          bool v186 = v184 != v185;
          int v187;
          if (v186) {
            v187 = v91;
          } else {
            int v188 = 3;
            int v189 = v91 + v188;
            v187 = v189;
          }
          v173 = v187;
          break;
        }
      }
      bool v190 = true;
      v103 = v173;
      break;
    }
  }
  bool v191 = true;
  int v192 = 16;
  int v193 = v192 + v91;
  bool v194 = true;
  int v195 = simt_wave_count_bits(v194);
  v89[v193] = v195;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
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
