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
      v6 = v0;
      break;
    }
    case 1:
      {
      int v7 = 3;
      v6 = v7;
      break;
    }
    default:
      {
      int v8 = 4;
      int v9 = v0 + v8;
      v6 = v9;
      break;
    }
    case 2:
      {
      int v10 = 0;
      int v11 = 0;
      int v12;
      int v13;
      v12 = v10;
      v13 = v11;
      while (true) {
        int v14 = 4;
        int v15 = v3 % v14;
        int v16 = 1;
        int v17 = v15 + v16;
        bool v18 = v13 < v17;
        v12 = v12;
        v13 = v13;
        if (!v18) break;
        int v19 = 1;
        int v20 = v0 + v19;
        int v21 = 1;
        int v22 = v13 + v21;
        v12 = v20;
        v13 = v22;
        break;
        ;
      }
      v6 = v12;
      break;
    }
  }
  int v23 = 4;
  int v24 = v3 % v23;
  int v25 = 0;
  int v26 = v0 + v25;
  int v27;
  v27 = v26;
  switch (v24) {
    case 0:
      {
      int v28 = 0;
      int v29 = 0;
      int v30;
      int v31;
      v30 = v28;
      v31 = v29;
      while (true) {
        int v32 = 4;
        int v33 = v3 % v32;
        int v34 = 1;
        int v35 = v33 + v34;
        bool v36 = v31 < v35;
        v30 = v30;
        v31 = v31;
        if (!v36) break;
        int v37 = 0;
        bool v38 = v2 != v37;
        int v39;
        if (v38) {
          v39 = v0;
        } else {
          int v40 = 3;
          int v41 = v0 + v40;
          v39 = v41;
        }
        int v42 = 1;
        int v43 = v31 + v42;
        v30 = v39;
        v31 = v43;
      }
      v27 = v30;
      break;
    }
    case 1:
      {
      int v44 = 0;
      bool v45 = v2 != v44;
      int v46;
      if (v45) {
        int v47 = 0;
        bool v48 = v2 != v47;
        int v49;
        if (v48) {
          v49 = v0;
        } else {
          int v50 = 3;
          v49 = v50;
        }
        v46 = v49;
      } else {
        int v51 = 3;
        v46 = v51;
      }
      v27 = v46;
      break;
    }
    case 2:
      {
      int v52 = 0;
      int v53 = 0;
      int v54;
      int v55;
      v54 = v52;
      v55 = v53;
      while (true) {
        int v56 = 4;
        int v57 = v3 % v56;
        int v58 = 1;
        int v59 = v57 + v58;
        bool v60 = v55 < v59;
        v54 = v54;
        v55 = v55;
        if (!v60) break;
        int v61 = 2;
        int v62 = v3 % v61;
        int v63 = 0;
        int v64 = v0 + v63;
        int v65;
        v65 = v64;
        switch (v62) {
          case 0:
            {
            int v66 = 3;
            int v67 = v0 + v66;
            v65 = v67;
            break;
          }
          case 1:
            {
            int v68 = 3;
            int v69 = v0 + v68;
            v65 = v69;
            break;
          }
          default:
            {
            int v70 = 4;
            int v71 = v0 + v70;
            v65 = v71;
            break;
          }
        }
        int v72 = 4;
        int v73 = 1;
        int v74 = v55 + v73;
        v54 = v65;
        v55 = v74;
      }
      v27 = v54;
      break;
    }
    default:
      {
      int v75 = 4;
      int v76 = v3 % v75;
      int v77 = 4;
      int v78 = v0 + v77;
      int v79;
      v79 = v78;
      switch (v76) {
        case 0:
          {
          v79 = v0;
          break;
        }
        case 1:
          {
          int v80 = 3;
          int v81 = v3 % v80;
          int v82 = 0;
          int v83 = v0 + v82;
          int v84;
          v84 = v83;
          switch (v81) {
            default:
              {
              int v85 = 3;
              int v86 = v0 + v85;
              v84 = v86;
              break;
            }
            case 0:
              {
              int v87 = 1;
              v84 = v87;
              break;
            }
            case 1:
              {
              int v88 = 1;
              v84 = v88;
              break;
            }
          }
          v79 = v84;
          break;
        }
        default:
          {
          int v89 = 4;
          v79 = v89;
          break;
        }
        case 2:
          {
          int v90 = 0;
          bool v91 = v2 != v90;
          int v92;
          if (v91) {
            int v93 = 2;
            v92 = v93;
          } else {
            int v94 = 2;
            v92 = v94;
          }
          v79 = v92;
          break;
        }
      }
      v27 = v79;
      break;
    }
  }
  int v95 = 0;
  bool v96 = v2 != v95;
  int v97 = v96 ? v6 : v27;
  bool v98 = true;
  int v99 = simt_wave_count_bits(v98);
  int v100 = 0;
  int v101 = v100 + v0;
  v1[v101] = v99;
  return;
}

kernel void kernel_main(device int* v102 [[buffer(0)]], device int* v103 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v104 = static_cast<int>(__simt_tid3.x);
  int v105 = 0;
  int v106 = v105 + v104;
  int v107 = v103[v106];
  int v108 = 4;
  int v109 = v108 + v104;
  int v110 = v103[v109];
  helper0(v104, v102, v107, v110, static_cast<int>(__simt_tid3.x));
  int v111 = 8;
  int v112 = v111 + v104;
  int v113 = v103[v112];
  int v114 = 0;
  bool v115 = v113 != v114;
  int v116;
  if (v115) {
    int v117 = 12;
    int v118 = v117 + v104;
    int v119 = v103[v118];
    int v120;
    v120 = v104;
    switch (v119) {
      default:
        {
        int v121 = 3;
        v120 = v121;
        break;
      }
      case 0:
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
          int v128 = v127 + v104;
          int v129 = 16;
          int v130 = v129 + v128;
          int v131 = v103[v130];
          int v132 = 0;
          bool v133 = v131 != v132;
          v124 = v124;
          v125 = v125;
          if (!v133) break;
          int v134 = v124 + v125;
          int v135 = 1;
          int v136 = v125 + v135;
          bool v137 = true;
          v124 = v134;
          v125 = v136;
        }
        v120 = v124;
        break;
      }
      case 1:
        {
        int v138 = 0;
        int v139 = v104 + v138;
        v120 = v139;
        break;
      }
    }
    v116 = v120;
  } else {
    int v140 = 1;
    int v141 = v104 + v140;
    v116 = v141;
  }
  int v142 = 16;
  int v143 = v142 + v104;
  bool v144 = true;
  int v145 = simt_wave_count_bits(v144);
  v102[v143] = v145;
  int v146 = 36;
  int v147 = v146 + v104;
  int v148 = v103[v147];
  int v149 = 0;
  bool v150 = v148 != v149;
  int v151;
  if (v150) {
    int v152 = 40;
    int v153 = v152 + v104;
    int v154 = v103[v153];
    int v155 = 0;
    bool v156 = v154 != v155;
    int v157;
    if (v156) {
      int v158 = 44;
      int v159 = v158 + v104;
      int v160 = v103[v159];
      int v161;
      v161 = v104;
      switch (v160) {
        default:
          {
          int v162 = 3;
          v161 = v162;
          break;
        }
        case 0:
          {
          int v163 = 4;
          int v164 = v104 + v163;
          v161 = v164;
          break;
        }
      }
      v157 = v161;
    } else {
      int v165 = 48;
      int v166 = v165 + v104;
      int v167 = v103[v166];
      uint v168 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v169 = (int)(v168);
      int v170;
      v170 = v169;
      switch (v167) {
        case 0:
          {
          int v171 = 1;
          int v172 = v104 + v171;
          v170 = v172;
          break;
        }
        default:
          {
          int v173 = 0;
          int v174 = v104 + v173;
          v170 = v174;
          break;
        }
        case 1:
          {
          v170 = v104;
          break;
        }
      }
      v157 = v170;
    }
    int v175 = 32;
    int v176 = v175 + v104;
    bool v177 = true;
    int v178 = simt_wave_count_bits(v177);
    v102[v176] = v178;
    v151 = v157;
  } else {
    int v179 = 52;
    int v180 = v179 + v104;
    int v181 = v103[v180];
    int v182 = 0;
    bool v183 = v181 != v182;
    int v184;
    if (v183) {
      int v185 = 2;
      int v186 = v104 + v185;
      v184 = v186;
    } else {
      v184 = v104;
    }
    int v187 = 48;
    int v188 = v187 + v104;
    bool v189 = true;
    int v190 = simt_wave_count_bits(v189);
    v102[v188] = v190;
    v151 = v184;
  }
  int v191 = 64;
  int v192 = v191 + v104;
  bool v193 = true;
  int v194 = simt_wave_count_bits(v193);
  v102[v192] = v194;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
