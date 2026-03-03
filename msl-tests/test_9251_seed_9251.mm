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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    int v9 = 0;
    int v10 = 0;
    int v11;
    int v12;
    v11 = v9;
    v12 = v10;
    while (true) {
      int v13 = 4;
      int v14 = v3 % v13;
      int v15 = 1;
      int v16 = v14 + v15;
      bool v17 = v12 < v16;
      v11 = v11;
      v12 = v12;
      if (!v17) break;
      int v18 = 0;
      int v19 = 0;
      int v20;
      int v21;
      v20 = v18;
      v21 = v19;
      while (true) {
        int v22 = 4;
        int v23 = v3 % v22;
        int v24 = 1;
        int v25 = v23 + v24;
        bool v26 = v21 < v25;
        v20 = v20;
        v21 = v21;
        if (!v26) break;
        uint v27 = simt_lane_id(__simt_tid);
        int v28 = (int)(v27);
        int v29 = 1;
        int v30 = v21 + v29;
        v20 = v28;
        v21 = v30;
      }
      int v31 = 2;
      int v32 = v0 + v31;
      int v33 = 1;
      int v34 = v12 + v33;
      v11 = v20;
      v12 = v34;
      continue;
      ;
    }
    uint v35 = simt_subgroup_id(__simt_tid);
    int v36 = (int)(v35);
    v8 = v11;
  } else {
    int v37 = 0;
    bool v38 = v2 != v37;
    int v39;
    if (v38) {
      int v40 = 3;
      int v41 = v3 % v40;
      uint v42 = simt_subgroup_id(__simt_tid);
      int v43 = (int)(v42);
      int v44;
      v44 = v43;
      switch (v41) {
        default:
          {
          v44 = v0;
          break;
        }
        case 0:
          {
          int v45 = 2;
          v44 = v45;
          break;
        }
        case 1:
          {
          v44 = v0;
          break;
        }
      }
      v39 = v44;
    } else {
      int v46 = 2;
      int v47 = v3 % v46;
      int v48;
      v48 = v0;
      switch (v47) {
        case 0:
          {
          int v49 = 4;
          int v50 = v0 + v49;
          v48 = v50;
          break;
        }
        default:
          {
          int v51 = 2;
          v48 = v51;
          break;
        }
      }
      int v52 = 2;
      int v53 = v0 + v52;
      v39 = v48;
    }
    int v54 = 1;
    v8 = v39;
  }
  bool v55 = true;
  int v56 = simt_wave_count_bits(v55);
  int v57 = 0;
  int v58 = v57 + v0;
  v1[v58] = v56;
  int v59 = 0;
  bool v60 = v2 != v59;
  int v61 = v60 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v62 [[buffer(0)]], device int* v63 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v64 = static_cast<int>(__simt_tid3.x);
  int v65 = 0;
  int v66 = v65 + v64;
  int v67 = v63[v66];
  int v68 = 4;
  int v69 = v68 + v64;
  int v70 = v63[v69];
  helper0(v64, v62, v67, v70, static_cast<int>(__simt_tid3.x));
  int v71 = 8;
  int v72 = v71 + v64;
  int v73 = v63[v72];
  int v74 = 0;
  bool v75 = v73 != v74;
  int v76;
  if (v75) {
    int v77 = 12;
    int v78 = v77 + v64;
    int v79 = v63[v78];
    int v80 = 0;
    bool v81 = v79 != v80;
    int v82;
    if (v81) {
      int v83 = 16;
      int v84 = v83 + v64;
      int v85 = v63[v84];
      uint v86 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v87 = (int)(v86);
      int v88;
      v88 = v87;
      switch (v85) {
        case 0:
          {
          v88 = v64;
          break;
        }
        case 1:
          {
          v88 = v64;
          break;
        }
        default:
          {
          v88 = v64;
          break;
        }
        case 2:
          {
          int v89 = 4;
          int v90 = v64 + v89;
          v88 = v90;
          break;
        }
      }
      bool v91 = true;
      v82 = v88;
    } else {
      int v92 = 0;
      int v93 = 0;
      int v94;
      int v95;
      v94 = v92;
      v95 = v93;
      while (true) {
        int v96 = 4;
        int v97 = v95 * v96;
        int v98 = v97 + v64;
        int v99 = 20;
        int v100 = v99 + v98;
        int v101 = v63[v100];
        int v102 = 0;
        bool v103 = v101 != v102;
        v94 = v94;
        v95 = v95;
        if (!v103) break;
        int v104 = v94 + v95;
        int v105 = 1;
        int v106 = v95 + v105;
        v94 = v104;
        v95 = v106;
      }
      bool v107 = true;
      v82 = v94;
    }
    v76 = v82;
  } else {
    int v108 = 0;
    int v109 = 0;
    int v110;
    int v111;
    v110 = v108;
    v111 = v109;
    while (true) {
      int v112 = 4;
      int v113 = v111 * v112;
      int v114 = v113 + v64;
      int v115 = 40;
      int v116 = v115 + v114;
      int v117 = v63[v116];
      int v118 = 0;
      bool v119 = v117 != v118;
      v110 = v110;
      v111 = v111;
      if (!v119) break;
      int v120 = v110 + v111;
      int v121 = 1;
      int v122 = v111 + v121;
      v110 = v120;
      v111 = v122;
    }
    bool v123 = true;
    v76 = v110;
  }
  int v124 = 16;
  int v125 = v124 + v64;
  bool v126 = true;
  int v127 = simt_wave_count_bits(v126);
  v62[v125] = v127;
  int v128 = 60;
  int v129 = v128 + v64;
  int v130 = v63[v129];
  int v131 = 2;
  int v132 = v64 + v131;
  int v133;
  v133 = v132;
  switch (v130) {
    case 0:
      {
      int v134 = 0;
      int v135 = 0;
      int v136;
      int v137;
      v136 = v134;
      v137 = v135;
      while (true) {
        int v138 = 4;
        int v139 = v137 * v138;
        int v140 = v139 + v64;
        int v141 = 64;
        int v142 = v141 + v140;
        int v143 = v63[v142];
        int v144 = 0;
        bool v145 = v143 != v144;
        v136 = v136;
        v137 = v137;
        if (!v145) break;
        int v146 = 84;
        int v147 = v146 + v64;
        int v148 = v63[v147];
        int v149 = 0;
        bool v150 = v148 != v149;
        int v151;
        if (v150) {
          v151 = v64;
        } else {
          int v152 = 0;
          v151 = v152;
        }
        int v153 = v136 + v151;
        int v154 = 1;
        int v155 = v137 + v154;
        v136 = v153;
        v137 = v155;
      }
      bool v156 = true;
      v133 = v136;
    }
    case 1:
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
        int v163 = v162 + v64;
        int v164 = 88;
        int v165 = v164 + v163;
        int v166 = v63[v165];
        int v167 = 0;
        bool v168 = v166 != v167;
        v159 = v159;
        v160 = v160;
        if (!v168) break;
        int v169 = v159 + v160;
        int v170 = 1;
        int v171 = v160 + v170;
        v159 = v169;
        v160 = v171;
        continue;
        ;
      }
      bool v172 = true;
      v133 = v159;
      break;
    }
    case 2:
      {
      v133 = v64;
      break;
    }
    default:
      {
      int v173 = 108;
      int v174 = v173 + v64;
      int v175 = v63[v174];
      int v176 = 4;
      int v177;
      v177 = v176;
      switch (v175) {
        case 0:
          {
          int v178 = 112;
          int v179 = v178 + v64;
          int v180 = v63[v179];
          int v181 = 0;
          bool v182 = v180 != v181;
          int v183;
          if (v182) {
            v183 = v64;
          } else {
            int v184 = 3;
            v183 = v184;
          }
          v177 = v183;
          break;
        }
        default:
          {
          int v185 = 116;
          int v186 = v185 + v64;
          int v187 = v63[v186];
          int v188 = 0;
          bool v189 = v187 != v188;
          int v190;
          if (v189) {
            int v191 = 0;
            int v192 = v64 + v191;
            v190 = v192;
          } else {
            int v193 = 2;
            v190 = v193;
          }
          v177 = v190;
          break;
        }
        case 1:
          {
          int v194 = 0;
          int v195 = v64 + v194;
          v177 = v195;
          break;
        }
        case 2:
          {
          int v196 = 120;
          int v197 = v196 + v64;
          int v198 = v63[v197];
          int v199;
          v199 = v64;
          switch (v198) {
            case 0:
              {
              int v200 = 2;
              int v201 = v64 + v200;
              v199 = v201;
              break;
            }
            case 1:
              {
              int v202 = 4;
              int v203 = v64 + v202;
              v199 = v203;
              break;
            }
            default:
              {
              int v204 = 2;
              v199 = v204;
              break;
            }
            case 2:
              {
              v199 = v64;
              break;
            }
          }
          bool v205 = true;
          v177 = v199;
          break;
        }
      }
      bool v206 = true;
      v133 = v177;
      break;
    }
  }
  bool v207 = true;
  int v208 = 32;
  int v209 = v208 + v64;
  bool v210 = true;
  int v211 = simt_wave_count_bits(v210);
  v62[v209] = v211;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
