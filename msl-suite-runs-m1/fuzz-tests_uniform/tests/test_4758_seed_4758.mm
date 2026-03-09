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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6;
  v6 = v5;
  switch (v3) {
    case 0:
      {
      int v7 = 0;
      bool v8 = v2 != v7;
      int v9;
      if (v8) {
        int v10 = 0;
        bool v11 = v2 != v10;
        int v12;
        if (v11) {
          v12 = v0;
        } else {
          v12 = v0;
        }
        int v13 = 4;
        int v14 = v0 + v13;
        v9 = v12;
      } else {
        int v15 = 0;
        bool v16 = v2 != v15;
        int v17;
        if (v16) {
          int v18 = 4;
          v17 = v18;
        } else {
          int v19 = 3;
          v17 = v19;
        }
        int v20 = 1;
        int v21 = v0 + v20;
        v9 = v17;
      }
      int v22 = 2;
      int v23 = v0 + v22;
      v6 = v9;
    }
    default:
      {
      int v24 = 0;
      bool v25 = v2 != v24;
      int v26;
      if (v25) {
        int v27 = 3;
        int v28 = v3 % v27;
        int v29;
        v29 = v0;
        switch (v28) {
          default:
            {
            int v30 = 2;
            int v31 = v0 + v30;
            v29 = v31;
          }
          case 0:
            {
            int v32 = 2;
            int v33 = v0 + v32;
            v29 = v33;
          }
          case 1:
            {
            int v34 = 4;
            v29 = v34;
          }
          case 2:
            {
            v29 = v0;
            break;
          }
        }
        int v35 = 0;
        int v36 = v0 + v35;
        v26 = v29;
      } else {
        int v37 = 2;
        int v38 = v3 % v37;
        int v39 = 1;
        int v40 = v0 + v39;
        int v41;
        v41 = v40;
        switch (v38) {
          default:
            {
            int v42 = 3;
            int v43 = v0 + v42;
            v41 = v43;
          }
          case 0:
            {
            int v44 = 0;
            int v45 = v0 + v44;
            v41 = v45;
            break;
          }
          case 1:
            {
            v41 = v0;
            break;
          }
        }
        v26 = v41;
      }
      int v46 = 0;
      int v47 = v0 + v46;
      v6 = v26;
      break;
    }
  }
  bool v48 = true;
  int v49 = simt_wave_count_bits(v48);
  int v50 = 0;
  int v51 = v50 + v0;
  v1[v51] = v49;
  return;
}

kernel void kernel_main(device int* v52 [[buffer(0)]], device int* v53 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v54 = static_cast<int>(__simt_tid3.x);
  int v55 = 0;
  int v56 = v55 + v54;
  int v57 = v53[v56];
  int v58 = 4;
  int v59 = v58 + v54;
  int v60 = v53[v59];
  helper0(v54, v52, v57, v60, static_cast<int>(__simt_tid3.x));
  int v61 = 8;
  int v62 = v61 + v54;
  int v63 = v53[v62];
  int v64 = 0;
  bool v65 = v63 != v64;
  int v66;
  if (v65) {
    int v67 = 12;
    int v68 = v67 + v54;
    int v69 = v53[v68];
    int v70 = 0;
    bool v71 = v69 != v70;
    int v72;
    if (v71) {
      int v73 = 0;
      int v74 = 0;
      int v75;
      int v76;
      v75 = v73;
      v76 = v74;
      while (true) {
        int v77 = 4;
        int v78 = v76 * v77;
        int v79 = v78 + v54;
        int v80 = 16;
        int v81 = v80 + v79;
        int v82 = v53[v81];
        int v83 = 0;
        bool v84 = v82 != v83;
        v75 = v75;
        v76 = v76;
        if (!v84) break;
        int v85 = v75 + v76;
        int v86 = 1;
        int v87 = v76 + v86;
        v75 = v85;
        v76 = v87;
      }
      bool v88 = true;
      v72 = v75;
    } else {
      int v89 = 36;
      int v90 = v89 + v54;
      int v91 = v53[v90];
      int v92 = 0;
      bool v93 = v91 != v92;
      int v94;
      if (v93) {
        int v95 = 0;
        v94 = v95;
      } else {
        int v96 = 3;
        v94 = v96;
      }
      v72 = v94;
    }
    v66 = v72;
  } else {
    int v97 = 40;
    int v98 = v97 + v54;
    int v99 = v53[v98];
    int v100;
    v100 = v54;
    switch (v99) {
      default:
        {
        int v101 = 44;
        int v102 = v101 + v54;
        int v103 = v53[v102];
        int v104 = 2;
        int v105 = v54 + v104;
        int v106;
        v106 = v105;
        switch (v103) {
          case 0:
            {
            int v107 = 3;
            int v108 = v54 + v107;
            v106 = v108;
          }
          default:
            {
            int v109 = 3;
            v106 = v109;
            break;
          }
        }
        bool v110 = true;
        v100 = v106;
        break;
      }
      case 0:
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
          int v117 = v116 + v54;
          int v118 = 48;
          int v119 = v118 + v117;
          int v120 = v53[v119];
          int v121 = 0;
          bool v122 = v120 != v121;
          v113 = v113;
          v114 = v114;
          if (!v122) break;
          int v123 = v113 + v114;
          int v124 = 1;
          int v125 = v114 + v124;
          v113 = v123;
          v114 = v125;
        }
        bool v126 = true;
        v100 = v113;
        break;
      }
    }
    bool v127 = true;
    v66 = v100;
  }
  int v128 = 16;
  int v129 = v128 + v54;
  bool v130 = true;
  int v131 = simt_wave_count_bits(v130);
  v52[v129] = v131;
  int v132 = 68;
  int v133 = v132 + v54;
  int v134 = v53[v133];
  int v135 = 0;
  bool v136 = v134 != v135;
  int v137;
  if (v136) {
    int v138 = 72;
    int v139 = v138 + v54;
    int v140 = v53[v139];
    uint v141 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v142 = (int)(v141);
    int v143;
    v143 = v142;
    switch (v140) {
      case 0:
        {
        int v144 = 76;
        int v145 = v144 + v54;
        int v146 = v53[v145];
        int v147 = 0;
        bool v148 = v146 != v147;
        int v149;
        if (v148) {
          int v150 = 2;
          v149 = v150;
        } else {
          int v151 = 4;
          v149 = v151;
        }
        v143 = v149;
      }
      case 1:
        {
        int v152 = 0;
        int v153 = 0;
        int v154;
        int v155;
        v154 = v152;
        v155 = v153;
        while (true) {
          int v156 = 4;
          int v157 = v155 * v156;
          int v158 = v157 + v54;
          int v159 = 80;
          int v160 = v159 + v158;
          int v161 = v53[v160];
          int v162 = 0;
          bool v163 = v161 != v162;
          v154 = v154;
          v155 = v155;
          if (!v163) break;
          int v164 = v154 + v155;
          int v165 = 1;
          int v166 = v155 + v165;
          v154 = v164;
          v155 = v166;
        }
        bool v167 = true;
        v143 = v154;
      }
      case 2:
        {
        int v168 = 0;
        int v169 = 0;
        int v170;
        int v171;
        v170 = v168;
        v171 = v169;
        while (true) {
          int v172 = 4;
          int v173 = v171 * v172;
          int v174 = v173 + v54;
          int v175 = 100;
          int v176 = v175 + v174;
          int v177 = v53[v176];
          int v178 = 0;
          bool v179 = v177 != v178;
          v170 = v170;
          v171 = v171;
          if (!v179) break;
          int v180 = v170 + v171;
          int v181 = 1;
          int v182 = v171 + v181;
          v170 = v180;
          v171 = v182;
          break;
          ;
        }
        bool v183 = true;
        v143 = v170;
      }
      default:
        {
        int v184 = 120;
        int v185 = v184 + v54;
        int v186 = v53[v185];
        int v187 = 2;
        int v188 = v54 + v187;
        int v189;
        v189 = v188;
        switch (v186) {
          case 0:
            {
            int v190 = 0;
            v189 = v190;
            break;
          }
          case 1:
            {
            int v191 = 2;
            int v192 = v54 + v191;
            v189 = v192;
            break;
          }
          case 2:
            {
            int v193 = 2;
            v189 = v193;
            break;
          }
          default:
            {
            v189 = v54;
            break;
          }
        }
        bool v194 = true;
        v143 = v189;
        break;
      }
    }
    bool v195 = true;
    v137 = v143;
  } else {
    v137 = v54;
  }
  int v196 = 32;
  int v197 = v196 + v54;
  bool v198 = true;
  int v199 = simt_wave_count_bits(v198);
  v52[v197] = v199;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 124; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
