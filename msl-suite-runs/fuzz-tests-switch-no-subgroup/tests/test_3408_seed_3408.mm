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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
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
      int v26 = 2;
      int v27 = v3 % v26;
      uint v28 = simt_lane_id(__simt_tid);
      int v29 = (int)(v28);
      int v30;
      v30 = v29;
      switch (v27) {
        case 0:
          {
          int v31 = 4;
          int v32 = v0 + v31;
          v30 = v32;
          break;
        }
        default:
          {
          int v33 = 3;
          int v34 = v0 + v33;
          v30 = v34;
          break;
        }
        case 1:
          {
          int v35 = 2;
          int v36 = v0 + v35;
          v30 = v36;
          break;
        }
      }
      int v37 = 1;
      int v38 = v20 + v37;
      v19 = v30;
      v20 = v38;
    }
    int v39 = 1;
    int v40 = v11 + v39;
    v10 = v19;
    v11 = v40;
  }
  int v41 = 0;
  bool v42 = v2 != v41;
  int v43 = v42 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v44 [[buffer(0)]], device int* v45 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v46 = static_cast<int>(__simt_tid3.x);
  int v47 = 0;
  int v48 = v47 + v46;
  int v49 = v45[v48];
  int v50 = 4;
  int v51 = v50 + v46;
  int v52 = v45[v51];
  helper0(v46, v44, v49, v52, static_cast<int>(__simt_tid3.x));
  int v53 = 0;
  int v54 = 0;
  int v55;
  int v56;
  v55 = v53;
  v56 = v54;
  while (true) {
    int v57 = 4;
    int v58 = v56 * v57;
    int v59 = v58 + v46;
    int v60 = 8;
    int v61 = v60 + v59;
    int v62 = v45[v61];
    int v63 = 0;
    bool v64 = v62 != v63;
    v55 = v55;
    v56 = v56;
    if (!v64) break;
    int v65 = v55 + v56;
    int v66 = 1;
    int v67 = v56 + v66;
    bool v68 = true;
    int v69 = 16;
    int v70 = 4;
    int v71 = v56 * v70;
    int v72 = v69 + v71;
    int v73 = v72 + v46;
    bool v74 = true;
    int v75 = simt_wave_count_bits(v74);
    v44[v73] = v75;
    v55 = v65;
    v56 = v67;
    break;
    ;
  }
  int v76 = 28;
  int v77 = v76 + v46;
  int v78 = v45[v77];
  uint v79 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v80 = (int)(v79);
  int v81;
  v81 = v80;
  switch (v78) {
    case 0:
      {
      int v82 = 32;
      int v83 = v82 + v46;
      int v84 = v45[v83];
      int v85 = 0;
      int v86;
      v86 = v85;
      switch (v84) {
        case 0:
          {
          int v87 = 36;
          int v88 = v87 + v46;
          int v89 = v45[v88];
          int v90 = 1;
          int v91 = v46 + v90;
          int v92;
          v92 = v91;
          switch (v89) {
            case 0:
              {
              int v93 = 4;
              int v94 = v46 + v93;
              v92 = v94;
              break;
            }
            default:
              {
              int v95 = 0;
              v92 = v95;
              break;
            }
            case 1:
              {
              v92 = v46;
              break;
            }
            case 2:
              {
              int v96 = 1;
              v92 = v96;
              break;
            }
          }
          bool v97 = true;
          v86 = v92;
        }
        default:
          {
          v86 = v46;
          break;
        }
        case 1:
          {
          int v98 = 40;
          int v99 = v98 + v46;
          int v100 = v45[v99];
          int v101 = 0;
          bool v102 = v100 != v101;
          int v103;
          if (v102) {
            int v104 = 4;
            v103 = v104;
          } else {
            int v105 = 2;
            v103 = v105;
          }
          v86 = v103;
        }
        case 2:
          {
          int v106 = 0;
          int v107 = 0;
          int v108;
          int v109;
          v108 = v106;
          v109 = v107;
          while (true) {
            int v110 = 4;
            int v111 = v109 * v110;
            int v112 = v111 + v46;
            int v113 = 44;
            int v114 = v113 + v112;
            int v115 = v45[v114];
            int v116 = 0;
            bool v117 = v115 != v116;
            v108 = v108;
            v109 = v109;
            if (!v117) break;
            int v118 = v108 + v109;
            int v119 = 1;
            int v120 = v109 + v119;
            bool v121 = true;
            v108 = v118;
            v109 = v120;
            break;
            ;
          }
          v86 = v108;
          break;
        }
      }
      v81 = v86;
    }
    case 1:
      {
      int v122 = 64;
      int v123 = v122 + v46;
      int v124 = v45[v123];
      int v125;
      v125 = v46;
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
            int v132 = v131 + v46;
            int v133 = 68;
            int v134 = v133 + v132;
            int v135 = v45[v134];
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
          v125 = v128;
          break;
        }
        case 0:
          {
          int v142 = 88;
          int v143 = v142 + v46;
          int v144 = v45[v143];
          int v145 = 0;
          bool v146 = v144 != v145;
          int v147;
          if (v146) {
            int v148 = 4;
            int v149 = v46 + v148;
            v147 = v149;
          } else {
            v147 = v46;
          }
          v125 = v147;
          break;
        }
      }
      v81 = v125;
    }
    case 2:
      {
      int v150 = 4;
      int v151 = v46 + v150;
      v81 = v151;
    }
    default:
      {
      int v152 = 92;
      int v153 = v152 + v46;
      int v154 = v45[v153];
      int v155 = 0;
      bool v156 = v154 != v155;
      int v157;
      if (v156) {
        int v158 = 96;
        int v159 = v158 + v46;
        int v160 = v45[v159];
        int v161 = 2;
        int v162 = v46 + v161;
        int v163;
        v163 = v162;
        switch (v160) {
          case 0:
            {
            int v164 = 2;
            v163 = v164;
            break;
          }
          default:
            {
            int v165 = 2;
            v163 = v165;
            break;
          }
          case 1:
            {
            int v166 = 0;
            int v167 = v46 + v166;
            v163 = v167;
            break;
          }
          case 2:
            {
            int v168 = 4;
            int v169 = v46 + v168;
            v163 = v169;
            break;
          }
        }
        v157 = v163;
      } else {
        int v170 = 100;
        int v171 = v170 + v46;
        int v172 = v45[v171];
        int v173 = 1;
        int v174 = v46 + v173;
        int v175;
        v175 = v174;
        switch (v172) {
          case 0:
            {
            int v176 = 4;
            int v177 = v46 + v176;
            v175 = v177;
            break;
          }
          default:
            {
            int v178 = 1;
            int v179 = v46 + v178;
            v175 = v179;
            break;
          }
        }
        bool v180 = true;
        v157 = v175;
      }
      v81 = v157;
      break;
    }
  }
  int v181 = 0;
  int v182 = 0;
  int v183;
  int v184;
  v183 = v181;
  v184 = v182;
  while (true) {
    int v185 = 4;
    int v186 = v184 * v185;
    int v187 = v186 + v46;
    int v188 = 104;
    int v189 = v188 + v187;
    int v190 = v45[v189];
    int v191 = 0;
    bool v192 = v190 != v191;
    v183 = v183;
    v184 = v184;
    if (!v192) break;
    int v193 = v183 + v184;
    int v194 = 1;
    int v195 = v184 + v194;
    bool v196 = true;
    int v197 = 32;
    int v198 = 4;
    int v199 = v184 * v198;
    int v200 = v197 + v199;
    int v201 = v200 + v46;
    bool v202 = true;
    int v203 = simt_wave_count_bits(v202);
    v44[v201] = v203;
    v183 = v193;
    v184 = v195;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 40; ++idx) {
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
