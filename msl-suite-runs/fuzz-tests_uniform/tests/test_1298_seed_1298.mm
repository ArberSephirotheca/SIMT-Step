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
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
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
        int v19 = 2;
        int v20 = v0 + v19;
        int v21 = 1;
        int v22 = v13 + v21;
        v12 = v20;
        v13 = v22;
        break;
        ;
      }
      uint v23 = simt_subgroup_id(__simt_tid);
      int v24 = (int)(v23);
      v9 = v12;
    } else {
      int v25 = 2;
      int v26 = v3 % v25;
      int v27;
      v27 = v0;
      switch (v26) {
        default:
          {
          v27 = v0;
        }
        case 0:
          {
          int v28 = 2;
          int v29 = v0 + v28;
          v27 = v29;
          break;
        }
      }
      uint v30 = simt_lane_id(__simt_tid);
      int v31 = (int)(v30);
      v9 = v27;
    }
    uint v32 = simt_subgroup_id(__simt_tid);
    int v33 = (int)(v32);
    v6 = v9;
  } else {
    int v34 = 0;
    int v35 = 0;
    int v36;
    int v37;
    v36 = v34;
    v37 = v35;
    while (true) {
      int v38 = 4;
      int v39 = v3 % v38;
      int v40 = 1;
      int v41 = v39 + v40;
      bool v42 = v37 < v41;
      v36 = v36;
      v37 = v37;
      if (!v42) break;
      int v43 = 2;
      int v44 = v3 % v43;
      int v45;
      v45 = v0;
      switch (v44) {
        default:
          {
          v45 = v0;
        }
        case 0:
          {
          v45 = v0;
          break;
        }
        case 1:
          {
          int v46 = 0;
          int v47 = v0 + v46;
          v45 = v47;
          break;
        }
      }
      uint v48 = simt_lane_id(__simt_tid);
      int v49 = (int)(v48);
      int v50 = 1;
      int v51 = v37 + v50;
      v36 = v45;
      v37 = v51;
    }
    uint v52 = simt_subgroup_id(__simt_tid);
    int v53 = (int)(v52);
    v6 = v36;
  }
  bool v54 = true;
  int v55 = simt_wave_count_bits(v54);
  int v56 = 0;
  int v57 = v56 + v0;
  v1[v57] = v55;
  return;
}

kernel void kernel_main(device int* v58 [[buffer(0)]], device int* v59 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v60 = static_cast<int>(__simt_tid3.x);
  int v61 = 0;
  int v62 = v61 + v60;
  int v63 = v59[v62];
  int v64 = 4;
  int v65 = v64 + v60;
  int v66 = v59[v65];
  helper0(v60, v58, v63, v66, static_cast<int>(__simt_tid3.x));
  int v67 = 2;
  int v68 = v60 + v67;
  int v69 = 0;
  int v70 = 0;
  int v71;
  int v72;
  v71 = v69;
  v72 = v70;
  while (true) {
    int v73 = 4;
    int v74 = v72 * v73;
    int v75 = v74 + v60;
    int v76 = 8;
    int v77 = v76 + v75;
    int v78 = v59[v77];
    int v79 = 0;
    bool v80 = v78 != v79;
    v71 = v71;
    v72 = v72;
    if (!v80) break;
    int v81 = v71 + v72;
    int v82 = 1;
    int v83 = v72 + v82;
    v71 = v81;
    v72 = v83;
    continue;
    ;
  }
  bool v84 = true;
  int v85 = 16;
  int v86 = v85 + v60;
  bool v87 = true;
  int v88 = simt_wave_count_bits(v87);
  v58[v86] = v88;
  int v89 = 28;
  int v90 = v89 + v60;
  int v91 = v59[v90];
  int v92 = 4;
  int v93;
  v93 = v92;
  switch (v91) {
    case 0:
      {
      int v94 = 32;
      int v95 = v94 + v60;
      int v96 = v59[v95];
      int v97 = 0;
      bool v98 = v96 != v97;
      int v99;
      if (v98) {
        int v100 = 36;
        int v101 = v100 + v60;
        int v102 = v59[v101];
        int v103 = 0;
        bool v104 = v102 != v103;
        int v105;
        if (v104) {
          int v106 = 0;
          int v107 = v60 + v106;
          v105 = v107;
        } else {
          int v108 = 4;
          v105 = v108;
        }
        v99 = v105;
      } else {
        int v109 = 40;
        int v110 = v109 + v60;
        int v111 = v59[v110];
        int v112 = 2;
        int v113 = v60 + v112;
        int v114;
        v114 = v113;
        switch (v111) {
          case 0:
            {
            int v115 = 0;
            v114 = v115;
            break;
          }
          default:
            {
            v114 = v60;
            break;
          }
        }
        bool v116 = true;
        v99 = v114;
      }
      v93 = v99;
      break;
    }
    case 1:
      {
      int v117 = 44;
      int v118 = v117 + v60;
      int v119 = v59[v118];
      int v120 = 0;
      bool v121 = v119 != v120;
      int v122;
      if (v121) {
        int v123 = 0;
        int v124 = 0;
        int v125;
        int v126;
        v125 = v123;
        v126 = v124;
        while (true) {
          int v127 = 4;
          int v128 = v126 * v127;
          int v129 = v128 + v60;
          int v130 = 48;
          int v131 = v130 + v129;
          int v132 = v59[v131];
          int v133 = 0;
          bool v134 = v132 != v133;
          v125 = v125;
          v126 = v126;
          if (!v134) break;
          int v135 = v125 + v126;
          int v136 = 1;
          int v137 = v126 + v136;
          v125 = v135;
          v126 = v137;
        }
        bool v138 = true;
        v122 = v125;
      } else {
        int v139 = 68;
        int v140 = v139 + v60;
        int v141 = v59[v140];
        int v142 = 0;
        bool v143 = v141 != v142;
        int v144;
        if (v143) {
          v144 = v60;
        } else {
          v144 = v60;
        }
        v122 = v144;
      }
      v93 = v122;
      break;
    }
    case 2:
      {
      int v145 = 72;
      int v146 = v145 + v60;
      int v147 = v59[v146];
      int v148 = 3;
      int v149 = v60 + v148;
      int v150;
      v150 = v149;
      switch (v147) {
        case 0:
          {
          int v151 = 76;
          int v152 = v151 + v60;
          int v153 = v59[v152];
          int v154 = 2;
          int v155 = v60 + v154;
          int v156;
          v156 = v155;
          switch (v153) {
            case 0:
              {
              v156 = v60;
            }
            case 1:
              {
              int v157 = 1;
              v156 = v157;
              break;
            }
            case 2:
              {
              int v158 = 0;
              v156 = v158;
            }
            default:
              {
              int v159 = 4;
              v156 = v159;
              break;
            }
          }
          bool v160 = true;
          v150 = v156;
          break;
        }
        default:
          {
          int v161 = 0;
          int v162 = 0;
          int v163;
          int v164;
          v163 = v161;
          v164 = v162;
          while (true) {
            int v165 = 4;
            int v166 = v164 * v165;
            int v167 = v166 + v60;
            int v168 = 80;
            int v169 = v168 + v167;
            int v170 = v59[v169];
            int v171 = 0;
            bool v172 = v170 != v171;
            v163 = v163;
            v164 = v164;
            if (!v172) break;
            int v173 = v163 + v164;
            int v174 = 1;
            int v175 = v164 + v174;
            v163 = v173;
            v164 = v175;
          }
          bool v176 = true;
          v150 = v163;
          break;
        }
        case 1:
          {
          int v177 = 1;
          v150 = v177;
          break;
        }
        case 2:
          {
          int v178 = 0;
          int v179 = 0;
          int v180;
          int v181;
          v180 = v178;
          v181 = v179;
          while (true) {
            int v182 = 4;
            int v183 = v181 * v182;
            int v184 = v183 + v60;
            int v185 = 100;
            int v186 = v185 + v184;
            int v187 = v59[v186];
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
          v150 = v180;
          break;
        }
      }
      bool v194 = true;
      v93 = v150;
      break;
    }
    default:
      {
      v93 = v60;
      break;
    }
  }
  bool v195 = true;
  int v196 = 32;
  int v197 = v196 + v60;
  bool v198 = true;
  int v199 = simt_wave_count_bits(v198);
  v58[v197] = v199;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
