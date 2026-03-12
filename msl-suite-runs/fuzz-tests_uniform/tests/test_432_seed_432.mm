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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 0;
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      int v16 = 0;
      int v17 = 0;
      int v18;
      int v19;
      v18 = v16;
      v19 = v17;
      while (true) {
        int v20 = 4;
        int v21 = v3 % v20;
        int v22 = 1;
        int v23 = v21 + v22;
        bool v24 = v19 < v23;
        v18 = v18;
        v19 = v19;
        if (!v24) break;
        uint v25 = simt_lane_id(__simt_tid);
        int v26 = (int)(v25);
        int v27 = 1;
        int v28 = v19 + v27;
        v18 = v26;
        v19 = v28;
        break;
        ;
      }
      int v29 = 4;
      int v30 = v0 + v29;
      int v31 = 1;
      int v32 = v10 + v31;
      v9 = v18;
      v10 = v32;
    }
    int v33 = 4;
    int v34 = v0 + v33;
    v6 = v9;
  } else {
    int v35 = 4;
    int v36 = v3 % v35;
    int v37 = 0;
    int v38 = v0 + v37;
    int v39;
    v39 = v38;
    switch (v36) {
      default:
        {
        int v40 = 0;
        bool v41 = v2 != v40;
        int v42;
        if (v41) {
          v42 = v0;
        } else {
          int v43 = 1;
          v42 = v43;
        }
        v39 = v42;
        break;
      }
      case 0:
        {
        int v44 = 0;
        bool v45 = v2 != v44;
        int v46;
        if (v45) {
          int v47 = 2;
          int v48 = v0 + v47;
          v46 = v48;
        } else {
          int v49 = 0;
          v46 = v49;
        }
        int v50 = 3;
        int v51 = v0 + v50;
        v39 = v46;
      }
      case 1:
        {
        v39 = v0;
        break;
      }
      case 2:
        {
        int v52 = 0;
        bool v53 = v2 != v52;
        int v54;
        if (v53) {
          int v55 = 2;
          int v56 = v0 + v55;
          v54 = v56;
        } else {
          int v57 = 1;
          v54 = v57;
        }
        int v58 = 1;
        int v59 = v0 + v58;
        v39 = v54;
        break;
      }
    }
    v6 = v39;
  }
  bool v60 = true;
  int v61 = simt_wave_count_bits(v60);
  int v62 = 0;
  int v63 = v62 + v0;
  v1[v63] = v61;
  return;
}

kernel void kernel_main(device int* v64 [[buffer(0)]], device int* v65 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v66 = static_cast<int>(__simt_tid3.x);
  int v67 = 0;
  int v68 = v67 + v66;
  int v69 = v65[v68];
  int v70 = 4;
  int v71 = v70 + v66;
  int v72 = v65[v71];
  helper0(v66, v64, v69, v72, static_cast<int>(__simt_tid3.x));
  uint v73 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v74 = (int)(v73);
  int v75 = 8;
  int v76 = v75 + v66;
  int v77 = v65[v76];
  int v78 = 2;
  int v79;
  v79 = v78;
  switch (v77) {
    case 0:
      {
      int v80 = 12;
      int v81 = v80 + v66;
      int v82 = v65[v81];
      int v83;
      v83 = v66;
      switch (v82) {
        default:
          {
          int v84 = 0;
          int v85 = 0;
          int v86;
          int v87;
          v86 = v84;
          v87 = v85;
          while (true) {
            int v88 = 4;
            int v89 = v87 * v88;
            int v90 = v89 + v66;
            int v91 = 16;
            int v92 = v91 + v90;
            int v93 = v65[v92];
            int v94 = 0;
            bool v95 = v93 != v94;
            v86 = v86;
            v87 = v87;
            if (!v95) break;
            int v96 = v86 + v87;
            int v97 = 1;
            int v98 = v87 + v97;
            v86 = v96;
            v87 = v98;
            continue;
            ;
          }
          bool v99 = true;
          v83 = v86;
          break;
        }
        case 0:
          {
          int v100 = 36;
          int v101 = v100 + v66;
          int v102 = v65[v101];
          int v103 = 0;
          bool v104 = v102 != v103;
          int v105;
          if (v104) {
            int v106 = 4;
            int v107 = v66 + v106;
            v105 = v107;
          } else {
            int v108 = 3;
            int v109 = v66 + v108;
            v105 = v109;
          }
          v83 = v105;
          break;
        }
      }
      bool v110 = true;
      v79 = v83;
      break;
    }
    default:
      {
      int v111 = 0;
      int v112 = 0;
      int v113;
      int v114;
      v113 = v111;
      v114 = v112;
      while (true) {
        int v115 = 4;
        int v116 = v114 * v115;
        int v117 = v116 + v66;
        int v118 = 40;
        int v119 = v118 + v117;
        int v120 = v65[v119];
        int v121 = 0;
        bool v122 = v120 != v121;
        v113 = v113;
        v114 = v114;
        if (!v122) break;
        int v123 = 60;
        int v124 = v123 + v66;
        int v125 = v65[v124];
        int v126 = 1;
        int v127;
        v127 = v126;
        switch (v125) {
          case 0:
            {
            int v128 = 2;
            v127 = v128;
            break;
          }
          default:
            {
            v127 = v66;
            break;
          }
          case 1:
            {
            int v129 = 0;
            int v130 = v66 + v129;
            v127 = v130;
            break;
          }
          case 2:
            {
            v127 = v66;
            break;
          }
        }
        bool v131 = true;
        int v132 = v113 + v127;
        int v133 = 1;
        int v134 = v114 + v133;
        v113 = v132;
        v114 = v134;
      }
      bool v135 = true;
      v79 = v113;
      break;
    }
    case 1:
      {
      int v136 = 64;
      int v137 = v136 + v66;
      int v138 = v65[v137];
      int v139 = 0;
      bool v140 = v138 != v139;
      int v141;
      if (v140) {
        int v142 = 3;
        int v143 = v66 + v142;
        v141 = v143;
      } else {
        v141 = v66;
      }
      v79 = v141;
      break;
    }
  }
  bool v144 = true;
  int v145 = 16;
  int v146 = v145 + v66;
  bool v147 = true;
  int v148 = simt_wave_count_bits(v147);
  v64[v146] = v148;
  int v149 = 68;
  int v150 = v149 + v66;
  int v151 = v65[v150];
  int v152;
  v152 = v66;
  switch (v151) {
    case 0:
      {
      int v153 = 72;
      int v154 = v153 + v66;
      int v155 = v65[v154];
      int v156 = 1;
      int v157;
      v157 = v156;
      switch (v155) {
        case 0:
          {
          int v158 = 76;
          int v159 = v158 + v66;
          int v160 = v65[v159];
          int v161 = 0;
          bool v162 = v160 != v161;
          int v163;
          if (v162) {
            int v164 = 2;
            int v165 = v66 + v164;
            v163 = v165;
          } else {
            v163 = v66;
          }
          v157 = v163;
          break;
        }
        default:
          {
          int v166 = 2;
          int v167 = v66 + v166;
          v157 = v167;
          break;
        }
      }
      bool v168 = true;
      v152 = v157;
    }
    default:
      {
      int v169 = 80;
      int v170 = v169 + v66;
      int v171 = v65[v170];
      int v172 = 0;
      bool v173 = v171 != v172;
      int v174;
      if (v173) {
        int v175 = 84;
        int v176 = v175 + v66;
        int v177 = v65[v176];
        int v178 = 0;
        bool v179 = v177 != v178;
        int v180;
        if (v179) {
          v180 = v66;
        } else {
          v180 = v66;
        }
        v174 = v180;
      } else {
        int v181 = 0;
        int v182 = 0;
        int v183;
        int v184;
        v183 = v181;
        v184 = v182;
        while (true) {
          int v185 = 4;
          int v186 = v184 * v185;
          int v187 = v186 + v66;
          int v188 = 88;
          int v189 = v188 + v187;
          int v190 = v65[v189];
          int v191 = 0;
          bool v192 = v190 != v191;
          v183 = v183;
          v184 = v184;
          if (!v192) break;
          int v193 = v183 + v184;
          int v194 = 1;
          int v195 = v184 + v194;
          v183 = v193;
          v184 = v195;
        }
        bool v196 = true;
        v174 = v183;
      }
      v152 = v174;
      break;
    }
  }
  bool v197 = true;
  int v198 = 32;
  int v199 = v198 + v66;
  bool v200 = true;
  int v201 = simt_wave_count_bits(v200);
  v64[v199] = v201;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
