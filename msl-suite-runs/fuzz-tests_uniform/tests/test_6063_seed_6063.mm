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
  int v6 = 1;
  int v7;
  v7 = v6;
  switch (v5) {
    default:
      {
      int v8 = 0;
      bool v9 = v2 != v8;
      int v10;
      if (v9) {
        int v11 = 0;
        int v12 = 0;
        int v13;
        int v14;
        v13 = v11;
        v14 = v12;
        while (true) {
          int v15 = 4;
          int v16 = v3 % v15;
          int v17 = 1;
          int v18 = v16 + v17;
          bool v19 = v14 < v18;
          v13 = v13;
          v14 = v14;
          if (!v19) break;
          int v20 = 1;
          int v21 = v14 + v20;
          v13 = v0;
          v14 = v21;
        }
        int v22 = 4;
        int v23 = v0 + v22;
        v10 = v13;
      } else {
        int v24 = 2;
        int v25 = v3 % v24;
        int v26;
        v26 = v0;
        switch (v25) {
          case 0:
            {
            int v27 = 3;
            v26 = v27;
            break;
          }
          default:
            {
            v26 = v0;
            break;
          }
          case 1:
            {
            int v28 = 1;
            int v29 = v0 + v28;
            v26 = v29;
            break;
          }
        }
        int v30 = 1;
        int v31 = v0 + v30;
        v10 = v26;
      }
      v7 = v10;
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
          int v51 = v44 + v50;
          v43 = v0;
          v44 = v51;
          break;
          ;
        }
        int v52 = 1;
        int v53 = v0 + v52;
        int v54 = 1;
        int v55 = v35 + v54;
        v34 = v43;
        v35 = v55;
        break;
        ;
      }
      int v56 = 0;
      int v57 = v0 + v56;
      v7 = v34;
      break;
    }
    case 1:
      {
      int v58 = 4;
      int v59 = v3 % v58;
      int v60 = 2;
      int v61 = v0 + v60;
      int v62;
      v62 = v61;
      switch (v59) {
        case 0:
          {
          int v63 = 0;
          bool v64 = v2 != v63;
          int v65;
          if (v64) {
            int v66 = 4;
            v65 = v66;
          } else {
            int v67 = 2;
            v65 = v67;
          }
          int v68 = 1;
          int v69 = v0 + v68;
          v62 = v65;
        }
        default:
          {
          int v70 = 0;
          bool v71 = v2 != v70;
          int v72;
          if (v71) {
            v72 = v0;
          } else {
            v72 = v0;
          }
          int v73 = 3;
          int v74 = v0 + v73;
          v62 = v72;
          break;
        }
        case 1:
          {
          int v75 = 1;
          v62 = v75;
          break;
        }
        case 2:
          {
          int v76 = 0;
          bool v77 = v2 != v76;
          int v78;
          if (v77) {
            int v79 = 4;
            int v80 = v0 + v79;
            v78 = v80;
          } else {
            int v81 = 3;
            int v82 = v0 + v81;
            v78 = v82;
          }
          int v83 = 2;
          v62 = v78;
          break;
        }
      }
      v7 = v62;
      break;
    }
    case 2:
      {
      int v84 = 0;
      int v85 = 0;
      int v86;
      int v87;
      v86 = v84;
      v87 = v85;
      while (true) {
        int v88 = 4;
        int v89 = v3 % v88;
        int v90 = 1;
        int v91 = v89 + v90;
        bool v92 = v87 < v91;
        v86 = v86;
        v87 = v87;
        if (!v92) break;
        int v93 = 0;
        bool v94 = v2 != v93;
        int v95;
        if (v94) {
          int v96 = 0;
          v95 = v96;
        } else {
          int v97 = 0;
          int v98 = v0 + v97;
          v95 = v98;
        }
        int v99 = 1;
        int v100 = v87 + v99;
        v86 = v95;
        v87 = v100;
      }
      v7 = v86;
      break;
    }
  }
  bool v101 = true;
  int v102 = simt_wave_count_bits(v101);
  int v103 = 0;
  int v104 = v103 + v0;
  v1[v104] = v102;
  return;
}

kernel void kernel_main(device int* v105 [[buffer(0)]], device int* v106 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v107 = static_cast<int>(__simt_tid3.x);
  int v108 = 0;
  int v109 = v108 + v107;
  int v110 = v106[v109];
  int v111 = 4;
  int v112 = v111 + v107;
  int v113 = v106[v112];
  helper0(v107, v105, v110, v113, static_cast<int>(__simt_tid3.x));
  uint v114 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v115 = (int)(v114);
  int v116 = 8;
  int v117 = v116 + v107;
  int v118 = v106[v117];
  int v119 = 0;
  bool v120 = v118 != v119;
  int v121;
  if (v120) {
    int v122 = 12;
    int v123 = v122 + v107;
    int v124 = v106[v123];
    int v125;
    v125 = v107;
    switch (v124) {
      default:
        {
        int v126 = 0;
        int v127 = 0;
        int v128;
        int v129;
        v128 = v126;
        v129 = v127;
        while (true) {
          int v130 = 4;
          int v131 = v129 * v130;
          int v132 = v131 + v107;
          int v133 = 16;
          int v134 = v133 + v132;
          int v135 = v106[v134];
          int v136 = 0;
          bool v137 = v135 != v136;
          v128 = v128;
          v129 = v129;
          if (!v137) break;
          int v138 = v128 + v129;
          int v139 = 1;
          int v140 = v129 + v139;
          v128 = v138;
          v129 = v140;
        }
        bool v141 = true;
        v125 = v128;
        break;
      }
      case 0:
        {
        int v142 = 36;
        int v143 = v142 + v107;
        int v144 = v106[v143];
        int v145;
        v145 = v107;
        switch (v144) {
          case 0:
            {
            v145 = v107;
            break;
          }
          default:
            {
            int v146 = 0;
            v145 = v146;
            break;
          }
          case 1:
            {
            int v147 = 1;
            int v148 = v107 + v147;
            v145 = v148;
            break;
          }
          case 2:
            {
            int v149 = 0;
            v145 = v149;
            break;
          }
        }
        bool v150 = true;
        v125 = v145;
        break;
      }
      case 1:
        {
        int v151 = 40;
        int v152 = v151 + v107;
        int v153 = v106[v152];
        int v154 = 0;
        bool v155 = v153 != v154;
        int v156;
        if (v155) {
          int v157 = 0;
          v156 = v157;
        } else {
          int v158 = 3;
          int v159 = v107 + v158;
          v156 = v159;
        }
        v125 = v156;
        break;
      }
      case 2:
        {
        int v160 = 44;
        int v161 = v160 + v107;
        int v162 = v106[v161];
        int v163 = 1;
        int v164 = v107 + v163;
        int v165;
        v165 = v164;
        switch (v162) {
          case 0:
            {
            int v166 = 1;
            int v167 = v107 + v166;
            v165 = v167;
            break;
          }
          default:
            {
            int v168 = 0;
            v165 = v168;
            break;
          }
          case 1:
            {
            v165 = v107;
            break;
          }
          case 2:
            {
            int v169 = 4;
            v165 = v169;
            break;
          }
        }
        bool v170 = true;
        v125 = v165;
        break;
      }
    }
    bool v171 = true;
    v121 = v125;
  } else {
    int v172 = 48;
    int v173 = v172 + v107;
    int v174 = v106[v173];
    int v175 = 0;
    bool v176 = v174 != v175;
    int v177;
    if (v176) {
      int v178 = 0;
      int v179 = 0;
      int v180;
      int v181;
      v180 = v178;
      v181 = v179;
      while (true) {
        int v182 = 4;
        int v183 = v181 * v182;
        int v184 = v183 + v107;
        int v185 = 52;
        int v186 = v185 + v184;
        int v187 = v106[v186];
        int v188 = 0;
        bool v189 = v187 != v188;
        v180 = v180;
        v181 = v181;
        if (!v189) break;
        int v190 = v180 + v181;
        int v191 = 1;
        int v192 = v181 + v191;
        v180 = v190;
        v181 = v192;
      }
      bool v193 = true;
      v177 = v180;
    } else {
      int v194 = 72;
      int v195 = v194 + v107;
      int v196 = v106[v195];
      int v197;
      v197 = v107;
      switch (v196) {
        default:
          {
          int v198 = 4;
          v197 = v198;
        }
        case 0:
          {
          int v199 = 2;
          int v200 = v107 + v199;
          v197 = v200;
        }
        case 1:
          {
          v197 = v107;
          break;
        }
      }
      bool v201 = true;
      v177 = v197;
    }
    v121 = v177;
  }
  int v202 = 16;
  int v203 = v202 + v107;
  bool v204 = true;
  int v205 = simt_wave_count_bits(v204);
  v105[v203] = v205;
  uint v206 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v207 = (int)(v206);
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
