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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
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
          int v23 = 2;
          int v24 = v3 % v23;
          int v25 = 4;
          int v26;
          v26 = v25;
          switch (v24) {
            default:
              {
              int v27 = 1;
              int v28 = v0 + v27;
              v26 = v28;
              break;
            }
            case 0:
              {
              int v29 = 4;
              int v30 = v0 + v29;
              v26 = v30;
              break;
            }
          }
          int v31 = 2;
          v11 = v26;
        }
        case 1:
          {
          int v32 = 0;
          int v33 = 0;
          int v34;
          int v35;
          v34 = v32;
          v35 = v33;
          while (true) {
            int v36 = 4;
            int v37 = v3 % v36;
            int v38 = 1;
            int v39 = v37 + v38;
            bool v40 = v35 < v39;
            v34 = v34;
            v35 = v35;
            if (!v40) break;
            int v41 = 4;
            int v42 = 1;
            int v43 = v35 + v42;
            v34 = v41;
            v35 = v43;
          }
          v11 = v34;
        }
        case 2:
          {
          int v44 = 0;
          bool v45 = v2 != v44;
          int v46;
          if (v45) {
            int v47 = 3;
            v46 = v47;
          } else {
            int v48 = 4;
            v46 = v48;
          }
          v11 = v46;
          break;
        }
      }
      int v49 = 3;
      int v50 = v0 + v49;
      v8 = v11;
      break;
    }
    case 1:
      {
      int v51 = 0;
      bool v52 = v2 != v51;
      int v53;
      if (v52) {
        int v54 = 0;
        bool v55 = v2 != v54;
        int v56;
        if (v55) {
          int v57 = 2;
          v56 = v57;
        } else {
          int v58 = 3;
          v56 = v58;
        }
        v53 = v56;
      } else {
        int v59 = 2;
        v53 = v59;
      }
      v8 = v53;
      break;
    }
    default:
      {
      int v60 = 4;
      int v61 = v3 % v60;
      int v62;
      v62 = v0;
      switch (v61) {
        case 0:
          {
          int v63 = 3;
          int v64 = v3 % v63;
          int v65 = 2;
          int v66 = v0 + v65;
          int v67;
          v67 = v66;
          switch (v64) {
            case 0:
              {
              v67 = v0;
            }
            case 1:
              {
              int v68 = 4;
              int v69 = v0 + v68;
              v67 = v69;
            }
            default:
              {
              int v70 = 1;
              v67 = v70;
              break;
            }
          }
          v62 = v67;
          break;
        }
        case 1:
          {
          int v71 = 4;
          int v72 = v0 + v71;
          v62 = v72;
          break;
        }
        case 2:
          {
          int v73 = 4;
          int v74 = v3 % v73;
          int v75;
          v75 = v0;
          switch (v74) {
            case 0:
              {
              int v76 = 1;
              int v77 = v0 + v76;
              v75 = v77;
              break;
            }
            case 1:
              {
              int v78 = 2;
              v75 = v78;
            }
            case 2:
              {
              int v79 = 3;
              v75 = v79;
            }
            default:
              {
              v75 = v0;
              break;
            }
          }
          v62 = v75;
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
            int v83 = 3;
            v82 = v83;
          }
          v62 = v82;
          break;
        }
      }
      v8 = v62;
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
  int v97 = 8;
  int v98 = v97 + v90;
  int v99 = v89[v98];
  uint v100 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v101 = (int)(v100);
  int v102;
  v102 = v101;
  switch (v99) {
    case 0:
      {
      v102 = v90;
    }
    default:
      {
      int v103 = 12;
      int v104 = v103 + v90;
      int v105 = v89[v104];
      int v106 = 3;
      int v107;
      v107 = v106;
      switch (v105) {
        default:
          {
          int v108 = 16;
          int v109 = v108 + v90;
          int v110 = v89[v109];
          int v111 = 1;
          int v112;
          v112 = v111;
          switch (v110) {
            case 0:
              {
              int v113 = 4;
              int v114 = v90 + v113;
              v112 = v114;
            }
            default:
              {
              int v115 = 3;
              v112 = v115;
              break;
            }
          }
          v107 = v112;
          break;
        }
        case 0:
          {
          int v116 = 0;
          int v117 = 0;
          int v118;
          int v119;
          v118 = v116;
          v119 = v117;
          while (true) {
            int v120 = 4;
            int v121 = v119 * v120;
            int v122 = v121 + v90;
            int v123 = 20;
            int v124 = v123 + v122;
            int v125 = v89[v124];
            int v126 = 0;
            bool v127 = v125 != v126;
            v118 = v118;
            v119 = v119;
            if (!v127) break;
            int v128 = v118 + v119;
            int v129 = 1;
            int v130 = v119 + v129;
            bool v131 = true;
            v118 = v128;
            v119 = v130;
          }
          v107 = v118;
          break;
        }
        case 1:
          {
          int v132 = 40;
          int v133 = v132 + v90;
          int v134 = v89[v133];
          int v135 = 4;
          int v136 = v90 + v135;
          int v137;
          v137 = v136;
          switch (v134) {
            default:
              {
              v137 = v90;
              break;
            }
            case 0:
              {
              int v138 = 3;
              int v139 = v90 + v138;
              v137 = v139;
              break;
            }
            case 1:
              {
              int v140 = 1;
              int v141 = v90 + v140;
              v137 = v141;
              break;
            }
          }
          v107 = v137;
          break;
        }
        case 2:
          {
          int v142 = 44;
          int v143 = v142 + v90;
          int v144 = v89[v143];
          int v145 = 4;
          int v146 = v90 + v145;
          int v147;
          v147 = v146;
          switch (v144) {
            default:
              {
              int v148 = 0;
              int v149 = v90 + v148;
              v147 = v149;
              break;
            }
            case 0:
              {
              int v150 = 1;
              int v151 = v90 + v150;
              v147 = v151;
            }
            case 1:
              {
              v147 = v90;
              break;
            }
          }
          v107 = v147;
          break;
        }
      }
      v102 = v107;
      break;
    }
  }
  int v152 = 48;
  int v153 = v152 + v90;
  int v154 = v89[v153];
  int v155 = 0;
  bool v156 = v154 != v155;
  int v157;
  if (v156) {
    int v158 = 0;
    int v159 = 0;
    int v160;
    int v161;
    v160 = v158;
    v161 = v159;
    while (true) {
      int v162 = 4;
      int v163 = v161 * v162;
      int v164 = v163 + v90;
      int v165 = 52;
      int v166 = v165 + v164;
      int v167 = v89[v166];
      int v168 = 0;
      bool v169 = v167 != v168;
      v160 = v160;
      v161 = v161;
      if (!v169) break;
      uint v170 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v171 = (int)(v170);
      int v172 = v160 + v171;
      int v173 = 1;
      int v174 = v161 + v173;
      bool v175 = true;
      int v176 = 16;
      int v177 = 4;
      int v178 = v161 * v177;
      int v179 = v176 + v178;
      int v180 = v179 + v90;
      bool v181 = true;
      int v182 = simt_wave_count_bits(v181);
      v88[v180] = v182;
      v160 = v172;
      v161 = v174;
      break;
      ;
    }
    v157 = v160;
  } else {
    int v183 = 72;
    int v184 = v183 + v90;
    int v185 = v89[v184];
    uint v186 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v187 = (int)(v186);
    int v188;
    v188 = v187;
    switch (v185) {
      case 0:
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
        }
        v188 = v191;
        break;
      }
      default:
        {
        int v205 = 2;
        int v206 = v90 + v205;
        v188 = v206;
        break;
      }
    }
    v157 = v188;
  }
  int v207 = 32;
  int v208 = v207 + v90;
  bool v209 = true;
  int v210 = simt_wave_count_bits(v209);
  v88[v208] = v210;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
