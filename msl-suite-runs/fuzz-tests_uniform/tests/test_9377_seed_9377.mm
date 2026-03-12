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
  int v6 = 0;
  int v7 = 0;
  int v8;
  int v9;
  v8 = v6;
  v9 = v7;
  while (true) {
    int v10 = 4;
    int v11 = v3 % v10;
    int v12 = 1;
    int v13 = v11 + v12;
    bool v14 = v9 < v13;
    v8 = v8;
    v9 = v9;
    if (!v14) break;
    int v15 = 3;
    int v16 = 1;
    int v17 = v9 + v16;
    v8 = v15;
    v9 = v17;
  }
  bool v18 = true;
  int v19 = simt_wave_count_bits(v18);
  int v20 = 0;
  int v21 = v20 + v0;
  v1[v21] = v19;
  int v22 = 0;
  bool v23 = v2 != v22;
  int v24 = v23 ? v5 : v8;
  int v25 = 4;
  int v26 = v3 % v25;
  int v27;
  v27 = v0;
  switch (v26) {
    case 0:
      {
      int v28 = 0;
      bool v29 = v2 != v28;
      int v30;
      if (v29) {
        int v31 = 0;
        int v32;
        v32 = v31;
        switch (v3) {
          default:
            {
            int v33 = 4;
            v32 = v33;
            break;
          }
          case 0:
            {
            int v34 = 0;
            int v35 = v0 + v34;
            v32 = v35;
            break;
          }
        }
        v30 = v32;
      } else {
        int v36 = 0;
        bool v37 = v2 != v36;
        int v38;
        if (v37) {
          v38 = v0;
        } else {
          int v39 = 4;
          v38 = v39;
        }
        v30 = v38;
      }
      v27 = v30;
    }
    case 1:
      {
      int v40 = 0;
      bool v41 = v2 != v40;
      int v42;
      if (v41) {
        int v43 = 0;
        int v44 = 0;
        int v45;
        int v46;
        v45 = v43;
        v46 = v44;
        while (true) {
          int v47 = 4;
          int v48 = v3 % v47;
          int v49 = 1;
          int v50 = v48 + v49;
          bool v51 = v46 < v50;
          v45 = v45;
          v46 = v46;
          if (!v51) break;
          int v52 = 4;
          int v53 = v0 + v52;
          int v54 = 1;
          int v55 = v46 + v54;
          v45 = v53;
          v46 = v55;
          continue;
          ;
        }
        int v56 = 1;
        int v57 = v0 + v56;
        v42 = v45;
      } else {
        int v58 = 4;
        int v59 = v3 % v58;
        int v60 = 4;
        int v61;
        v61 = v60;
        switch (v59) {
          default:
            {
            int v62 = 3;
            v61 = v62;
            break;
          }
          case 0:
            {
            int v63 = 4;
            v61 = v63;
            break;
          }
          case 1:
            {
            v61 = v0;
            break;
          }
          case 2:
            {
            int v64 = 1;
            v61 = v64;
            break;
          }
        }
        v42 = v61;
      }
      int v65 = 0;
      v27 = v42;
      break;
    }
    default:
      {
      int v66 = 0;
      int v67 = 0;
      int v68;
      int v69;
      v68 = v66;
      v69 = v67;
      while (true) {
        int v70 = 4;
        int v71 = v3 % v70;
        int v72 = 1;
        int v73 = v71 + v72;
        bool v74 = v69 < v73;
        v68 = v68;
        v69 = v69;
        if (!v74) break;
        int v75 = 4;
        int v76 = v3 % v75;
        int v77 = 1;
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
            int v80 = 0;
            v79 = v80;
            break;
          }
          case 2:
            {
            v79 = v0;
            break;
          }
          default:
            {
            v79 = v0;
            break;
          }
        }
        int v81 = 0;
        int v82 = v0 + v81;
        int v83 = 1;
        int v84 = v69 + v83;
        v68 = v79;
        v69 = v84;
      }
      int v85 = 0;
      v27 = v68;
    }
    case 2:
      {
      int v86 = 3;
      v27 = v86;
      break;
    }
  }
  bool v87 = true;
  int v88 = simt_wave_count_bits(v87);
  int v89 = 16;
  int v90 = v89 + v0;
  v1[v90] = v88;
  int v91 = 0;
  bool v92 = v2 != v91;
  int v93 = v92 ? v24 : v27;
  return;
}

kernel void kernel_main(device int* v94 [[buffer(0)]], device int* v95 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v96 = static_cast<int>(__simt_tid3.x);
  int v97 = 0;
  int v98 = v97 + v96;
  int v99 = v95[v98];
  int v100 = 4;
  int v101 = v100 + v96;
  int v102 = v95[v101];
  helper0(v96, v94, v99, v102, static_cast<int>(__simt_tid3.x));
  int v103 = 1;
  int v104 = v96 + v103;
  int v105 = 8;
  int v106 = v105 + v96;
  int v107 = v95[v106];
  int v108 = 0;
  bool v109 = v107 != v108;
  int v110;
  if (v109) {
    int v111 = 0;
    int v112 = 0;
    int v113;
    int v114;
    v113 = v111;
    v114 = v112;
    while (true) {
      int v115 = 4;
      int v116 = v114 * v115;
      int v117 = v116 + v96;
      int v118 = 12;
      int v119 = v118 + v117;
      int v120 = v95[v119];
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
    v110 = v113;
  } else {
    uint v127 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v128 = (int)(v127);
    v110 = v128;
  }
  int v129 = 32;
  int v130 = v129 + v96;
  bool v131 = true;
  int v132 = simt_wave_count_bits(v131);
  v94[v130] = v132;
  int v133 = 32;
  int v134 = v133 + v96;
  int v135 = v95[v134];
  int v136 = 1;
  int v137;
  v137 = v136;
  switch (v135) {
    case 0:
      {
      int v138 = 36;
      int v139 = v138 + v96;
      int v140 = v95[v139];
      int v141;
      v141 = v96;
      switch (v140) {
        case 0:
          {
          int v142 = 40;
          int v143 = v142 + v96;
          int v144 = v95[v143];
          int v145;
          v145 = v96;
          switch (v144) {
            case 0:
              {
              v145 = v96;
              break;
            }
            default:
              {
              v145 = v96;
              break;
            }
          }
          bool v146 = true;
          v141 = v145;
          break;
        }
        default:
          {
          int v147 = 0;
          int v148 = 0;
          int v149;
          int v150;
          v149 = v147;
          v150 = v148;
          while (true) {
            int v151 = 4;
            int v152 = v150 * v151;
            int v153 = v152 + v96;
            int v154 = 44;
            int v155 = v154 + v153;
            int v156 = v95[v155];
            int v157 = 0;
            bool v158 = v156 != v157;
            v149 = v149;
            v150 = v150;
            if (!v158) break;
            int v159 = v149 + v150;
            int v160 = 1;
            int v161 = v150 + v160;
            v149 = v159;
            v150 = v161;
            break;
            ;
          }
          bool v162 = true;
          v141 = v149;
          break;
        }
        case 1:
          {
          v141 = v96;
          break;
        }
        case 2:
          {
          int v163 = 0;
          int v164 = 0;
          int v165;
          int v166;
          v165 = v163;
          v166 = v164;
          while (true) {
            int v167 = 4;
            int v168 = v166 * v167;
            int v169 = v168 + v96;
            int v170 = 64;
            int v171 = v170 + v169;
            int v172 = v95[v171];
            int v173 = 0;
            bool v174 = v172 != v173;
            v165 = v165;
            v166 = v166;
            if (!v174) break;
            int v175 = v165 + v166;
            int v176 = 1;
            int v177 = v166 + v176;
            v165 = v175;
            v166 = v177;
            break;
            ;
          }
          bool v178 = true;
          v141 = v165;
          break;
        }
      }
      bool v179 = true;
      v137 = v141;
    }
    default:
      {
      int v180 = 0;
      int v181 = 0;
      int v182;
      int v183;
      v182 = v180;
      v183 = v181;
      while (true) {
        int v184 = 4;
        int v185 = v183 * v184;
        int v186 = v185 + v96;
        int v187 = 84;
        int v188 = v187 + v186;
        int v189 = v95[v188];
        int v190 = 0;
        bool v191 = v189 != v190;
        v182 = v182;
        v183 = v183;
        if (!v191) break;
        int v192 = v182 + v96;
        int v193 = 1;
        int v194 = v183 + v193;
        v182 = v192;
        v183 = v194;
      }
      bool v195 = true;
      v137 = v182;
      break;
    }
  }
  bool v196 = true;
  int v197 = 48;
  int v198 = v197 + v96;
  bool v199 = true;
  int v200 = simt_wave_count_bits(v199);
  v94[v198] = v200;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
