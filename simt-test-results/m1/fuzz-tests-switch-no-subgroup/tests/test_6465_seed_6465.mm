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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      v8 = v0;
      break;
    }
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 3;
        int v13 = v3 % v12;
        int v14 = 4;
        int v15;
        v15 = v14;
        switch (v13) {
          case 0:
            {
            int v16 = 3;
            int v17 = v0 + v16;
            v15 = v17;
          }
          case 1:
            {
            int v18 = 4;
            int v19 = v0 + v18;
            v15 = v19;
          }
          case 2:
            {
            v15 = v0;
            break;
          }
          default:
            {
            v15 = v0;
            break;
          }
        }
        v11 = v15;
      } else {
        int v20 = 3;
        int v21 = v3 % v20;
        int v22;
        v22 = v0;
        switch (v21) {
          case 0:
            {
            v22 = v0;
            break;
          }
          case 1:
            {
            int v23 = 4;
            v22 = v23;
            break;
          }
          case 2:
            {
            int v24 = 4;
            int v25 = v0 + v24;
            v22 = v25;
            break;
          }
          default:
            {
            int v26 = 2;
            v22 = v26;
            break;
          }
        }
        v11 = v22;
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v27 = 0;
      int v28 = 0;
      int v29;
      int v30;
      v29 = v27;
      v30 = v28;
      while (true) {
        int v31 = 4;
        int v32 = v3 % v31;
        int v33 = 1;
        int v34 = v32 + v33;
        bool v35 = v30 < v34;
        v29 = v29;
        v30 = v30;
        if (!v35) break;
        int v36 = 1;
        int v37 = v30 + v36;
        v29 = v0;
        v30 = v37;
        continue;
        ;
      }
      v8 = v29;
      break;
    }
    case 2:
      {
      int v38 = 4;
      int v39 = v3 % v38;
      int v40;
      v40 = v0;
      switch (v39) {
        case 0:
          {
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
            int v50 = 4;
            int v51 = 1;
            int v52 = v44 + v51;
            v43 = v50;
            v44 = v52;
          }
          v40 = v43;
          break;
        }
        default:
          {
          int v53 = 4;
          int v54 = v3 % v53;
          int v55;
          v55 = v0;
          switch (v54) {
            case 0:
              {
              int v56 = 0;
              int v57 = v0 + v56;
              v55 = v57;
              break;
            }
            case 1:
              {
              int v58 = 1;
              v55 = v58;
              break;
            }
            default:
              {
              v55 = v0;
              break;
            }
            case 2:
              {
              v55 = v0;
              break;
            }
          }
          int v59 = 3;
          int v60 = v0 + v59;
          v40 = v55;
          break;
        }
        case 1:
          {
          int v61 = 0;
          int v62 = 0;
          int v63;
          int v64;
          v63 = v61;
          v64 = v62;
          while (true) {
            int v65 = 4;
            int v66 = v3 % v65;
            int v67 = 1;
            int v68 = v66 + v67;
            bool v69 = v64 < v68;
            v63 = v63;
            v64 = v64;
            if (!v69) break;
            int v70 = 1;
            int v71 = v64 + v70;
            v63 = v0;
            v64 = v71;
          }
          v40 = v63;
          break;
        }
        case 2:
          {
          int v72 = 0;
          bool v73 = v2 != v72;
          int v74;
          if (v73) {
            v74 = v0;
          } else {
            int v75 = 4;
            v74 = v75;
          }
          v40 = v74;
          break;
        }
      }
      v8 = v40;
      break;
    }
  }
  bool v76 = true;
  int v77 = simt_wave_count_bits(v76);
  int v78 = 0;
  int v79 = v78 + v0;
  v1[v79] = v77;
  return;
}

kernel void kernel_main(device int* v80 [[buffer(0)]], device int* v81 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v82 = static_cast<int>(__simt_tid3.x);
  int v83 = 0;
  int v84 = v83 + v82;
  int v85 = v81[v84];
  int v86 = 4;
  int v87 = v86 + v82;
  int v88 = v81[v87];
  int v89 = 0;
  bool v90 = v85 != v89;
  if (v90) {
    int v91 = 8;
    int v92 = v91 + v82;
    int v93 = v81[v92];
    int v94 = 0;
    bool v95 = v93 != v94;
    if (v95) {
    } else {
      int v96 = 3;
      int v97 = v82 % v96;
      uint v98 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v99 = (int)(v98);
      int v100;
      v100 = v99;
      switch (v97) {
        case 0:
          {
          int v101 = 2;
          int v102 = v100 + v101;
          v100 = v102;
          break;
        }
        default:
          {
          int v103 = 1;
          int v104 = v100 + v103;
          v100 = v104;
          break;
        }
        case 1:
          {
          int v105 = 0;
          int v106 = v100 + v105;
          v100 = v106;
          break;
        }
      }
      helper0(v82, v80, v85, v88, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v107 = 12;
  int v108 = v107 + v82;
  int v109 = v81[v108];
  int v110 = 0;
  bool v111 = v109 != v110;
  int v112;
  if (v111) {
    int v113 = 16;
    int v114 = v113 + v82;
    int v115 = v81[v114];
    int v116 = 3;
    int v117 = v82 + v116;
    int v118;
    v118 = v117;
    switch (v115) {
      case 0:
        {
        int v119 = 20;
        int v120 = v119 + v82;
        int v121 = v81[v120];
        int v122 = 0;
        bool v123 = v121 != v122;
        int v124;
        if (v123) {
          v124 = v82;
        } else {
          int v125 = 4;
          v124 = v125;
        }
        v118 = v124;
      }
      case 1:
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
          int v132 = v131 + v82;
          int v133 = 24;
          int v134 = v133 + v132;
          int v135 = v81[v134];
          int v136 = 0;
          bool v137 = v135 != v136;
          v128 = v128;
          v129 = v129;
          if (!v137) break;
          int v138 = v128 + v129;
          int v139 = 1;
          int v140 = v129 + v139;
          bool v141 = true;
          v128 = v138;
          v129 = v140;
        }
        v118 = v128;
      }
      default:
        {
        int v142 = 2;
        int v143 = v82 + v142;
        v118 = v143;
        break;
      }
    }
    v112 = v118;
  } else {
    int v144 = 44;
    int v145 = v144 + v82;
    int v146 = v81[v145];
    uint v147 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v148 = (int)(v147);
    int v149;
    v149 = v148;
    switch (v146) {
      case 0:
        {
        int v150 = 48;
        int v151 = v150 + v82;
        int v152 = v81[v151];
        int v153 = 0;
        bool v154 = v152 != v153;
        int v155;
        if (v154) {
          int v156 = 0;
          v155 = v156;
        } else {
          v155 = v82;
        }
        v149 = v155;
        break;
      }
      default:
        {
        int v157 = 0;
        int v158 = 0;
        int v159;
        int v160;
        v159 = v157;
        v160 = v158;
        while (true) {
          int v161 = 4;
          int v162 = v160 * v161;
          int v163 = v162 + v82;
          int v164 = 52;
          int v165 = v164 + v163;
          int v166 = v81[v165];
          int v167 = 0;
          bool v168 = v166 != v167;
          v159 = v159;
          v160 = v160;
          if (!v168) break;
          int v169 = v159 + v160;
          int v170 = 1;
          int v171 = v160 + v170;
          bool v172 = true;
          v159 = v169;
          v160 = v171;
        }
        v149 = v159;
        break;
      }
    }
    v112 = v149;
  }
  int v173 = 16;
  int v174 = v173 + v82;
  bool v175 = true;
  int v176 = simt_wave_count_bits(v175);
  v80[v174] = v176;
  int v177 = 0;
  int v178 = 0;
  int v179;
  int v180;
  v179 = v177;
  v180 = v178;
  while (true) {
    int v181 = 4;
    int v182 = v180 * v181;
    int v183 = v182 + v82;
    int v184 = 72;
    int v185 = v184 + v183;
    int v186 = v81[v185];
    int v187 = 0;
    bool v188 = v186 != v187;
    v179 = v179;
    v180 = v180;
    if (!v188) break;
    int v189 = v179 + v180;
    int v190 = 1;
    int v191 = v180 + v190;
    bool v192 = true;
    int v193 = 32;
    int v194 = 4;
    int v195 = v180 * v194;
    int v196 = v193 + v195;
    int v197 = v196 + v82;
    bool v198 = true;
    int v199 = simt_wave_count_bits(v198);
    v80[v197] = v199;
    v179 = v189;
    v180 = v191;
    continue;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
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
