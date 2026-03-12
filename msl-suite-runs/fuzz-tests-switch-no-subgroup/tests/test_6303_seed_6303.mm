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
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
  }
  int v22 = 2;
  int v23 = v3 % v22;
  int v24;
  v24 = v0;
  switch (v23) {
    default:
      {
      int v25 = 0;
      bool v26 = v2 != v25;
      int v27;
      if (v26) {
        int v28 = 4;
        v27 = v28;
      } else {
        int v29 = 0;
        int v30;
        v30 = v29;
        switch (v3) {
          case 0:
            {
            int v31 = 1;
            v30 = v31;
            break;
          }
          default:
            {
            v30 = v0;
            break;
          }
        }
        v27 = v30;
      }
      v24 = v27;
      break;
    }
    case 0:
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
        int v41 = 0;
        int v42 = 0;
        int v43;
        int v44;
        v43 = v41;
        v44 = v42;
        while (true) {
          int v45 = 4;
          int v46 = v3 % v45;
          int v47 = 1;
          int v48 = v46 + v47;
          bool v49 = v44 < v48;
          v43 = v43;
          v44 = v44;
          if (!v49) break;
          int v50 = 1;
          int v51 = v0 + v50;
          int v52 = 1;
          int v53 = v44 + v52;
          v43 = v51;
          v44 = v53;
          break;
          ;
        }
        int v54 = 1;
        int v55 = v35 + v54;
        v34 = v43;
        v35 = v55;
      }
      v24 = v34;
      break;
    }
    case 1:
      {
      int v56 = 3;
      int v57 = v3 % v56;
      int v58 = 2;
      int v59 = v0 + v58;
      int v60;
      v60 = v59;
      switch (v57) {
        default:
          {
          int v61 = 0;
          int v62 = v0 + v61;
          v60 = v62;
          break;
        }
        case 0:
          {
          int v63 = 0;
          bool v64 = v2 != v63;
          int v65;
          if (v64) {
            int v66 = 4;
            int v67 = v0 + v66;
            v65 = v67;
          } else {
            v65 = v0;
          }
          v60 = v65;
          break;
        }
        case 1:
          {
          int v68 = 0;
          bool v69 = v2 != v68;
          int v70;
          if (v69) {
            int v71 = 0;
            int v72 = v0 + v71;
            v70 = v72;
          } else {
            int v73 = 0;
            int v74 = v0 + v73;
            v70 = v74;
          }
          v60 = v70;
          break;
        }
      }
      v24 = v60;
      break;
    }
  }
  int v75 = 0;
  bool v76 = v2 != v75;
  int v77 = v76 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v78 [[buffer(0)]], device int* v79 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v80 = static_cast<int>(__simt_tid3.x);
  int v81 = 0;
  int v82 = v81 + v80;
  int v83 = v79[v82];
  int v84 = 4;
  int v85 = v84 + v80;
  int v86 = v79[v85];
  int v87 = 0;
  bool v88 = v83 != v87;
  if (v88) {
    int v89 = 8;
    int v90 = v89 + v80;
    int v91 = v79[v90];
    int v92 = 0;
    bool v93 = v91 != v92;
    if (v93) {
    } else {
      helper0(v80, v78, v83, v86, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v94 = 12;
  int v95 = v94 + v80;
  int v96 = v79[v95];
  int v97 = 0;
  bool v98 = v96 != v97;
  int v99;
  if (v98) {
    uint v100 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v101 = (int)(v100);
    v99 = v101;
  } else {
    int v102 = 16;
    int v103 = v102 + v80;
    int v104 = v79[v103];
    uint v105 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v106 = (int)(v105);
    int v107;
    v107 = v106;
    switch (v104) {
      default:
        {
        int v108 = 0;
        int v109 = 0;
        int v110;
        int v111;
        v110 = v108;
        v111 = v109;
        while (true) {
          int v112 = 4;
          int v113 = v111 * v112;
          int v114 = v113 + v80;
          int v115 = 20;
          int v116 = v115 + v114;
          int v117 = v79[v116];
          int v118 = 0;
          bool v119 = v117 != v118;
          v110 = v110;
          v111 = v111;
          if (!v119) break;
          int v120 = v110 + v111;
          int v121 = 1;
          int v122 = v111 + v121;
          bool v123 = true;
          v110 = v120;
          v111 = v122;
          continue;
          ;
        }
        v107 = v110;
        break;
      }
      case 0:
        {
        int v124 = 40;
        int v125 = v124 + v80;
        int v126 = v79[v125];
        int v127 = 1;
        int v128 = v80 + v127;
        int v129;
        v129 = v128;
        switch (v126) {
          case 0:
            {
            v129 = v80;
            break;
          }
          default:
            {
            v129 = v80;
            break;
          }
        }
        v107 = v129;
        break;
      }
      case 1:
        {
        int v130 = 44;
        int v131 = v130 + v80;
        int v132 = v79[v131];
        int v133 = 2;
        int v134;
        v134 = v133;
        switch (v132) {
          case 0:
            {
            int v135 = 3;
            v134 = v135;
            break;
          }
          default:
            {
            int v136 = 1;
            int v137 = v80 + v136;
            v134 = v137;
            break;
          }
          case 1:
            {
            int v138 = 0;
            v134 = v138;
            break;
          }
        }
        v107 = v134;
        break;
      }
    }
    v99 = v107;
  }
  int v139 = 16;
  int v140 = v139 + v80;
  bool v141 = true;
  int v142 = simt_wave_count_bits(v141);
  v78[v140] = v142;
  int v143 = 0;
  int v144 = 0;
  int v145;
  int v146;
  v145 = v143;
  v146 = v144;
  while (true) {
    int v147 = 4;
    int v148 = v146 * v147;
    int v149 = v148 + v80;
    int v150 = 48;
    int v151 = v150 + v149;
    int v152 = v79[v151];
    int v153 = 0;
    bool v154 = v152 != v153;
    v145 = v145;
    v146 = v146;
    if (!v154) break;
    int v155 = 0;
    int v156 = 0;
    int v157;
    int v158;
    v157 = v155;
    v158 = v156;
    while (true) {
      int v159 = 4;
      int v160 = v158 * v159;
      int v161 = v160 + v80;
      int v162 = 68;
      int v163 = v162 + v161;
      int v164 = v79[v163];
      int v165 = 0;
      bool v166 = v164 != v165;
      v157 = v157;
      v158 = v158;
      if (!v166) break;
      int v167 = 88;
      int v168 = v167 + v80;
      int v169 = v79[v168];
      int v170 = 0;
      bool v171 = v169 != v170;
      int v172;
      if (v171) {
        int v173 = 2;
        v172 = v173;
      } else {
        int v174 = 1;
        v172 = v174;
      }
      int v175 = 32;
      int v176 = v175 + v80;
      bool v177 = true;
      int v178 = simt_wave_count_bits(v177);
      v78[v176] = v178;
      int v179 = v157 + v172;
      int v180 = 1;
      int v181 = v158 + v180;
      bool v182 = true;
      int v183 = 48;
      int v184 = 4;
      int v185 = v158 * v184;
      int v186 = v183 + v185;
      int v187 = v186 + v80;
      bool v188 = true;
      int v189 = simt_wave_count_bits(v188);
      v78[v187] = v189;
      v157 = v179;
      v158 = v181;
    }
    int v190 = v145 + v157;
    int v191 = 1;
    int v192 = v146 + v191;
    bool v193 = true;
    int v194 = 64;
    int v195 = 4;
    int v196 = v146 * v195;
    int v197 = v194 + v196;
    int v198 = v197 + v80;
    bool v199 = true;
    int v200 = simt_wave_count_bits(v199);
    v78[v198] = v200;
    v145 = v190;
    v146 = v192;
    break;
    ;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 92; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
