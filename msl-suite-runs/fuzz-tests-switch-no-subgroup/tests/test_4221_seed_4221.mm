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
  int v6 = 0;
  int v7;
  v7 = v6;
  switch (v5) {
    default:
      {
      int v8 = 0;
      int v9 = 0;
      int v10;
      int v11;
      v10 = v8;
      v11 = v9;
      while (true) {
        int v12 = 4;
        int v13 = v3 % v12;
        int v14 = 1;
        int v15 = v13 + v14;
        bool v16 = v11 < v15;
        v10 = v10;
        v11 = v11;
        if (!v16) break;
        int v17 = 0;
        int v18 = 0;
        int v19;
        int v20;
        v19 = v17;
        v20 = v18;
        while (true) {
          int v21 = 4;
          int v22 = v3 % v21;
          int v23 = 1;
          int v24 = v22 + v23;
          bool v25 = v20 < v24;
          v19 = v19;
          v20 = v20;
          if (!v25) break;
          int v26 = 1;
          int v27 = v0 + v26;
          int v28 = 1;
          int v29 = v20 + v28;
          v19 = v27;
          v20 = v29;
        }
        int v30 = 1;
        int v31 = v11 + v30;
        v10 = v19;
        v11 = v31;
        continue;
        ;
      }
      v7 = v10;
      break;
    }
    case 0:
      {
      int v32 = 0;
      bool v33 = v2 != v32;
      int v34;
      if (v33) {
        int v35 = 3;
        int v36 = v0 + v35;
        v34 = v36;
      } else {
        int v37 = 0;
        bool v38 = v2 != v37;
        int v39;
        if (v38) {
          int v40 = 1;
          int v41 = v0 + v40;
          v39 = v41;
        } else {
          int v42 = 0;
          v39 = v42;
        }
        v34 = v39;
      }
      v7 = v34;
      break;
    }
    case 1:
      {
      int v43 = 4;
      int v44 = v0 + v43;
      int v45;
      v45 = v44;
      switch (v3) {
        default:
          {
          int v46 = 0;
          bool v47 = v2 != v46;
          int v48;
          if (v47) {
            int v49 = 2;
            v48 = v49;
          } else {
            v48 = v0;
          }
          v45 = v48;
          break;
        }
        case 0:
          {
          int v50 = 0;
          int v51 = 0;
          int v52;
          int v53;
          v52 = v50;
          v53 = v51;
          while (true) {
            int v54 = 4;
            int v55 = v3 % v54;
            int v56 = 1;
            int v57 = v55 + v56;
            bool v58 = v53 < v57;
            v52 = v52;
            v53 = v53;
            if (!v58) break;
            int v59 = 1;
            int v60 = 1;
            int v61 = v53 + v60;
            v52 = v59;
            v53 = v61;
          }
          v45 = v52;
          break;
        }
      }
      v7 = v45;
      break;
    }
    case 2:
      {
      int v62 = 4;
      int v63 = v3 % v62;
      int v64 = 3;
      int v65 = v0 + v64;
      int v66;
      v66 = v65;
      switch (v63) {
        case 0:
          {
          int v67 = 2;
          int v68 = v3 % v67;
          int v69 = 2;
          int v70;
          v70 = v69;
          switch (v68) {
            default:
              {
              int v71 = 0;
              v70 = v71;
            }
            case 0:
              {
              int v72 = 4;
              int v73 = v0 + v72;
              v70 = v73;
              break;
            }
            case 1:
              {
              int v74 = 1;
              v70 = v74;
              break;
            }
          }
          int v75 = 1;
          v66 = v70;
          break;
        }
        case 1:
          {
          int v76 = 0;
          bool v77 = v2 != v76;
          int v78;
          if (v77) {
            int v79 = 2;
            v78 = v79;
          } else {
            int v80 = 1;
            int v81 = v0 + v80;
            v78 = v81;
          }
          v66 = v78;
        }
        case 2:
          {
          int v82 = 0;
          bool v83 = v2 != v82;
          int v84;
          if (v83) {
            int v85 = 4;
            v84 = v85;
          } else {
            int v86 = 3;
            int v87 = v0 + v86;
            v84 = v87;
          }
          v66 = v84;
        }
        default:
          {
          int v88 = 2;
          v66 = v88;
          break;
        }
      }
      v7 = v66;
      break;
    }
  }
  bool v89 = true;
  int v90 = simt_wave_count_bits(v89);
  int v91 = 0;
  int v92 = v91 + v0;
  v1[v92] = v90;
  return;
}

kernel void kernel_main(device int* v93 [[buffer(0)]], device int* v94 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v95 = static_cast<int>(__simt_tid3.x);
  int v96 = 0;
  int v97 = v96 + v95;
  int v98 = v94[v97];
  int v99 = 4;
  int v100 = v99 + v95;
  int v101 = v94[v100];
  helper0(v95, v93, v98, v101, static_cast<int>(__simt_tid3.x));
  int v102 = 8;
  int v103 = v102 + v95;
  int v104 = v94[v103];
  int v105 = 0;
  bool v106 = v104 != v105;
  int v107;
  if (v106) {
    uint v108 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v109 = (int)(v108);
    v107 = v109;
  } else {
    int v110 = 2;
    int v111 = v95 + v110;
    v107 = v111;
  }
  int v112 = 16;
  int v113 = v112 + v95;
  bool v114 = true;
  int v115 = simt_wave_count_bits(v114);
  v93[v113] = v115;
  uint v116 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v117 = (int)(v116);
  uint v118 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v119 = (int)(v118);
  int v120 = 12;
  int v121 = v120 + v95;
  int v122 = v94[v121];
  int v123 = 0;
  bool v124 = v122 != v123;
  int v125;
  if (v124) {
    int v126 = 0;
    int v127 = 0;
    int v128;
    int v129;
    v128 = v126;
    v129 = v127;
    while (true) {
      int v130 = 4;
      int v131 = v129 * v130;
      int v132 = v131 + v95;
      int v133 = 16;
      int v134 = v133 + v132;
      int v135 = v94[v134];
      int v136 = 0;
      bool v137 = v135 != v136;
      v128 = v128;
      v129 = v129;
      if (!v137) break;
      int v138 = v128 + v129;
      int v139 = 1;
      int v140 = v129 + v139;
      bool v141 = true;
      int v142 = 32;
      int v143 = 4;
      int v144 = v129 * v143;
      int v145 = v142 + v144;
      int v146 = v145 + v95;
      bool v147 = true;
      int v148 = simt_wave_count_bits(v147);
      v93[v146] = v148;
      v128 = v138;
      v129 = v140;
    }
    v125 = v128;
  } else {
    int v149 = 36;
    int v150 = v149 + v95;
    int v151 = v94[v150];
    int v152 = 0;
    bool v153 = v151 != v152;
    int v154;
    if (v153) {
      int v155 = 0;
      int v156 = 0;
      int v157;
      int v158;
      v157 = v155;
      v158 = v156;
      while (true) {
        int v159 = 4;
        int v160 = v158 * v159;
        int v161 = v160 + v95;
        int v162 = 40;
        int v163 = v162 + v161;
        int v164 = v94[v163];
        int v165 = 0;
        bool v166 = v164 != v165;
        v157 = v157;
        v158 = v158;
        if (!v166) break;
        int v167 = v157 + v158;
        int v168 = 1;
        int v169 = v158 + v168;
        bool v170 = true;
        int v171 = 48;
        int v172 = 4;
        int v173 = v158 * v172;
        int v174 = v171 + v173;
        int v175 = v174 + v95;
        bool v176 = true;
        int v177 = simt_wave_count_bits(v176);
        v93[v175] = v177;
        v157 = v167;
        v158 = v169;
      }
      v154 = v157;
    } else {
      int v178 = 60;
      int v179 = v178 + v95;
      int v180 = v94[v179];
      int v181 = 0;
      bool v182 = v180 != v181;
      int v183;
      if (v182) {
        uint v184 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v185 = (int)(v184);
        v183 = v185;
      } else {
        v183 = v95;
      }
      int v186 = 64;
      int v187 = v186 + v95;
      bool v188 = true;
      int v189 = simt_wave_count_bits(v188);
      v93[v187] = v189;
      v154 = v183;
    }
    int v190 = 80;
    int v191 = v190 + v95;
    bool v192 = true;
    int v193 = simt_wave_count_bits(v192);
    v93[v191] = v193;
    v125 = v154;
  }
  int v194 = 96;
  int v195 = v194 + v95;
  bool v196 = true;
  int v197 = simt_wave_count_bits(v196);
  v93[v195] = v197;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
