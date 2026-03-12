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
      bool v17 = v2 != v16;
      int v18;
      if (v17) {
        uint v19 = simt_subgroup_id(__simt_tid);
        int v20 = (int)(v19);
        v18 = v20;
      } else {
        uint v21 = simt_subgroup_id(__simt_tid);
        int v22 = (int)(v21);
        v18 = v22;
      }
      uint v23 = simt_lane_id(__simt_tid);
      int v24 = (int)(v23);
      int v25 = 1;
      int v26 = v10 + v25;
      v9 = v18;
      v10 = v26;
    }
    int v27 = 1;
    v6 = v9;
  } else {
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
        uint v40 = simt_subgroup_id(__simt_tid);
        int v41 = (int)(v40);
        v39 = v41;
      } else {
        int v42 = 3;
        v39 = v42;
      }
      int v43 = 1;
      int v44 = v31 + v43;
      v30 = v39;
      v31 = v44;
    }
    v6 = v30;
  }
  bool v45 = true;
  int v46 = simt_wave_count_bits(v45);
  int v47 = 0;
  int v48 = v47 + v0;
  v1[v48] = v46;
  return;
}

kernel void kernel_main(device int* v49 [[buffer(0)]], device int* v50 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v51 = static_cast<int>(__simt_tid3.x);
  int v52 = 0;
  int v53 = v52 + v51;
  int v54 = v50[v53];
  int v55 = 4;
  int v56 = v55 + v51;
  int v57 = v50[v56];
  helper0(v51, v49, v54, v57, static_cast<int>(__simt_tid3.x));
  int v58 = 0;
  int v59 = 0;
  int v60;
  int v61;
  v60 = v58;
  v61 = v59;
  while (true) {
    int v62 = 4;
    int v63 = v61 * v62;
    int v64 = v63 + v51;
    int v65 = 8;
    int v66 = v65 + v64;
    int v67 = v50[v66];
    int v68 = 0;
    bool v69 = v67 != v68;
    v60 = v60;
    v61 = v61;
    if (!v69) break;
    uint v70 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v71 = (int)(v70);
    int v72 = v60 + v71;
    int v73 = 1;
    int v74 = v61 + v73;
    v60 = v72;
    v61 = v74;
  }
  bool v75 = true;
  int v76 = 16;
  int v77 = v76 + v51;
  bool v78 = true;
  int v79 = simt_wave_count_bits(v78);
  v49[v77] = v79;
  int v80 = 28;
  int v81 = v80 + v51;
  int v82 = v50[v81];
  uint v83 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v84 = (int)(v83);
  int v85;
  v85 = v84;
  switch (v82) {
    default:
      {
      int v86 = 32;
      int v87 = v86 + v51;
      int v88 = v50[v87];
      int v89 = 0;
      int v90;
      v90 = v89;
      switch (v88) {
        case 0:
          {
          int v91 = 0;
          int v92 = 0;
          int v93;
          int v94;
          v93 = v91;
          v94 = v92;
          while (true) {
            int v95 = 4;
            int v96 = v94 * v95;
            int v97 = v96 + v51;
            int v98 = 36;
            int v99 = v98 + v97;
            int v100 = v50[v99];
            int v101 = 0;
            bool v102 = v100 != v101;
            v93 = v93;
            v94 = v94;
            if (!v102) break;
            int v103 = v93 + v94;
            int v104 = 1;
            int v105 = v94 + v104;
            v93 = v103;
            v94 = v105;
          }
          bool v106 = true;
          v90 = v93;
          break;
        }
        default:
          {
          v90 = v51;
          break;
        }
        case 1:
          {
          int v107 = 0;
          int v108 = 0;
          int v109;
          int v110;
          v109 = v107;
          v110 = v108;
          while (true) {
            int v111 = 4;
            int v112 = v110 * v111;
            int v113 = v112 + v51;
            int v114 = 56;
            int v115 = v114 + v113;
            int v116 = v50[v115];
            int v117 = 0;
            bool v118 = v116 != v117;
            v109 = v109;
            v110 = v110;
            if (!v118) break;
            int v119 = v109 + v110;
            int v120 = 1;
            int v121 = v110 + v120;
            v109 = v119;
            v110 = v121;
          }
          bool v122 = true;
          v90 = v109;
          break;
        }
        case 2:
          {
          int v123 = 76;
          int v124 = v123 + v51;
          int v125 = v50[v124];
          int v126 = 0;
          bool v127 = v125 != v126;
          int v128;
          if (v127) {
            int v129 = 2;
            int v130 = v51 + v129;
            v128 = v130;
          } else {
            int v131 = 1;
            int v132 = v51 + v131;
            v128 = v132;
          }
          v90 = v128;
          break;
        }
      }
      bool v133 = true;
      v85 = v90;
      break;
    }
    case 0:
      {
      int v134 = 80;
      int v135 = v134 + v51;
      int v136 = v50[v135];
      int v137;
      v137 = v51;
      switch (v136) {
        case 0:
          {
          int v138 = 84;
          int v139 = v138 + v51;
          int v140 = v50[v139];
          int v141 = 3;
          int v142 = v51 + v141;
          int v143;
          v143 = v142;
          switch (v140) {
            case 0:
              {
              v143 = v51;
            }
            default:
              {
              v143 = v51;
            }
            case 1:
              {
              int v144 = 0;
              v143 = v144;
              break;
            }
          }
          bool v145 = true;
          v137 = v143;
          break;
        }
        default:
          {
          int v146 = 88;
          int v147 = v146 + v51;
          int v148 = v50[v147];
          int v149 = 2;
          int v150 = v51 + v149;
          int v151;
          v151 = v150;
          switch (v148) {
            default:
              {
              int v152 = 3;
              int v153 = v51 + v152;
              v151 = v153;
              break;
            }
            case 0:
              {
              int v154 = 4;
              v151 = v154;
              break;
            }
          }
          bool v155 = true;
          v137 = v151;
          break;
        }
        case 1:
          {
          v137 = v51;
          break;
        }
        case 2:
          {
          int v156 = 0;
          int v157 = 0;
          int v158;
          int v159;
          v158 = v156;
          v159 = v157;
          while (true) {
            int v160 = 4;
            int v161 = v159 * v160;
            int v162 = v161 + v51;
            int v163 = 92;
            int v164 = v163 + v162;
            int v165 = v50[v164];
            int v166 = 0;
            bool v167 = v165 != v166;
            v158 = v158;
            v159 = v159;
            if (!v167) break;
            int v168 = v158 + v159;
            int v169 = 1;
            int v170 = v159 + v169;
            v158 = v168;
            v159 = v170;
          }
          bool v171 = true;
          v137 = v158;
          break;
        }
      }
      bool v172 = true;
      v85 = v137;
    }
    case 1:
      {
      int v173 = 112;
      int v174 = v173 + v51;
      int v175 = v50[v174];
      int v176 = 0;
      bool v177 = v175 != v176;
      int v178;
      if (v177) {
        int v179 = 116;
        int v180 = v179 + v51;
        int v181 = v50[v180];
        int v182 = 2;
        int v183;
        v183 = v182;
        switch (v181) {
          default:
            {
            int v184 = 2;
            int v185 = v51 + v184;
            v183 = v185;
            break;
          }
          case 0:
            {
            int v186 = 3;
            v183 = v186;
            break;
          }
        }
        bool v187 = true;
        v178 = v183;
      } else {
        int v188 = 120;
        int v189 = v188 + v51;
        int v190 = v50[v189];
        int v191;
        v191 = v51;
        switch (v190) {
          case 0:
            {
            int v192 = 3;
            int v193 = v51 + v192;
            v191 = v193;
            break;
          }
          case 1:
            {
            int v194 = 1;
            v191 = v194;
            break;
          }
          default:
            {
            int v195 = 0;
            int v196 = v51 + v195;
            v191 = v196;
            break;
          }
        }
        bool v197 = true;
        v178 = v191;
      }
      v85 = v178;
      break;
    }
  }
  bool v198 = true;
  int v199 = 32;
  int v200 = v199 + v51;
  bool v201 = true;
  int v202 = simt_wave_count_bits(v201);
  v49[v200] = v202;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
