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
  int v6 = 3;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
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
        int v22 = 2;
        v10 = v13;
      } else {
        v10 = v0;
      }
      v7 = v10;
      break;
    }
    case 1:
      {
      int v23 = 0;
      int v24 = 0;
      int v25;
      int v26;
      v25 = v23;
      v26 = v24;
      while (true) {
        int v27 = 4;
        int v28 = v3 % v27;
        int v29 = 1;
        int v30 = v28 + v29;
        bool v31 = v26 < v30;
        v25 = v25;
        v26 = v26;
        if (!v31) break;
        int v32 = 0;
        bool v33 = v2 != v32;
        int v34;
        if (v33) {
          v34 = v0;
        } else {
          v34 = v0;
        }
        int v35 = 1;
        int v36 = v26 + v35;
        v25 = v34;
        v26 = v36;
      }
      int v37 = 4;
      int v38 = v0 + v37;
      v7 = v25;
      break;
    }
    default:
      {
      v7 = v0;
      break;
    }
  }
  bool v39 = true;
  int v40 = simt_wave_count_bits(v39);
  int v41 = 0;
  int v42 = v41 + v0;
  v1[v42] = v40;
  return;
}

kernel void kernel_main(device int* v43 [[buffer(0)]], device int* v44 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v45 = static_cast<int>(__simt_tid3.x);
  int v46 = 0;
  int v47 = v46 + v45;
  int v48 = v44[v47];
  int v49 = 4;
  int v50 = v49 + v45;
  int v51 = v44[v50];
  helper0(v45, v43, v48, v51, static_cast<int>(__simt_tid3.x));
  int v52 = 0;
  int v53 = 0;
  int v54;
  int v55;
  v54 = v52;
  v55 = v53;
  while (true) {
    int v56 = 4;
    int v57 = v55 * v56;
    int v58 = v57 + v45;
    int v59 = 8;
    int v60 = v59 + v58;
    int v61 = v44[v60];
    int v62 = 0;
    bool v63 = v61 != v62;
    v54 = v54;
    v55 = v55;
    if (!v63) break;
    int v64 = v54 + v55;
    int v65 = 1;
    int v66 = v55 + v65;
    v54 = v64;
    v55 = v66;
  }
  bool v67 = true;
  int v68 = 16;
  int v69 = v68 + v45;
  bool v70 = true;
  int v71 = simt_wave_count_bits(v70);
  v43[v69] = v71;
  int v72 = 28;
  int v73 = v72 + v45;
  int v74 = v44[v73];
  uint v75 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v76 = (int)(v75);
  int v77;
  v77 = v76;
  switch (v74) {
    case 0:
      {
      int v78 = 0;
      int v79 = 0;
      int v80;
      int v81;
      v80 = v78;
      v81 = v79;
      while (true) {
        int v82 = 4;
        int v83 = v81 * v82;
        int v84 = v83 + v45;
        int v85 = 32;
        int v86 = v85 + v84;
        int v87 = v44[v86];
        int v88 = 0;
        bool v89 = v87 != v88;
        v80 = v80;
        v81 = v81;
        if (!v89) break;
        int v90 = v80 + v81;
        int v91 = 1;
        int v92 = v81 + v91;
        v80 = v90;
        v81 = v92;
      }
      bool v93 = true;
      v77 = v80;
      break;
    }
    case 1:
      {
      int v94 = 52;
      int v95 = v94 + v45;
      int v96 = v44[v95];
      int v97;
      v97 = v45;
      switch (v96) {
        case 0:
          {
          int v98 = 56;
          int v99 = v98 + v45;
          int v100 = v44[v99];
          int v101 = 0;
          bool v102 = v100 != v101;
          int v103;
          if (v102) {
            v103 = v45;
          } else {
            v103 = v45;
          }
          v97 = v103;
          break;
        }
        default:
          {
          int v104 = 60;
          int v105 = v104 + v45;
          int v106 = v44[v105];
          int v107;
          v107 = v45;
          switch (v106) {
            default:
              {
              int v108 = 2;
              v107 = v108;
              break;
            }
            case 0:
              {
              v107 = v45;
              break;
            }
            case 1:
              {
              int v109 = 4;
              int v110 = v45 + v109;
              v107 = v110;
              break;
            }
            case 2:
              {
              int v111 = 2;
              int v112 = v45 + v111;
              v107 = v112;
              break;
            }
          }
          bool v113 = true;
          v97 = v107;
          break;
        }
      }
      bool v114 = true;
      v77 = v97;
      break;
    }
    default:
      {
      int v115 = 64;
      int v116 = v115 + v45;
      int v117 = v44[v116];
      int v118 = 2;
      int v119 = v45 + v118;
      int v120;
      v120 = v119;
      switch (v117) {
        case 0:
          {
          int v121 = 68;
          int v122 = v121 + v45;
          int v123 = v44[v122];
          int v124 = 0;
          bool v125 = v123 != v124;
          int v126;
          if (v125) {
            int v127 = 2;
            int v128 = v45 + v127;
            v126 = v128;
          } else {
            int v129 = 2;
            int v130 = v45 + v129;
            v126 = v130;
          }
          v120 = v126;
          break;
        }
        case 1:
          {
          int v131 = 72;
          int v132 = v131 + v45;
          int v133 = v44[v132];
          int v134 = 0;
          int v135;
          v135 = v134;
          switch (v133) {
            case 0:
              {
              v135 = v45;
              break;
            }
            default:
              {
              v135 = v45;
              break;
            }
          }
          bool v136 = true;
          v120 = v135;
          break;
        }
        case 2:
          {
          v120 = v45;
          break;
        }
        default:
          {
          int v137 = 76;
          int v138 = v137 + v45;
          int v139 = v44[v138];
          int v140;
          v140 = v45;
          switch (v139) {
            case 0:
              {
              int v141 = 1;
              int v142 = v45 + v141;
              v140 = v142;
              break;
            }
            default:
              {
              v140 = v45;
              break;
            }
          }
          bool v143 = true;
          v120 = v140;
          break;
        }
      }
      bool v144 = true;
      v77 = v120;
    }
    case 2:
      {
      int v145 = 80;
      int v146 = v145 + v45;
      int v147 = v44[v146];
      int v148 = 0;
      int v149 = v45 + v148;
      int v150;
      v150 = v149;
      switch (v147) {
        case 0:
          {
          int v151 = 84;
          int v152 = v151 + v45;
          int v153 = v44[v152];
          int v154 = 4;
          int v155 = v45 + v154;
          int v156;
          v156 = v155;
          switch (v153) {
            default:
              {
              int v157 = 1;
              v156 = v157;
              break;
            }
            case 0:
              {
              v156 = v45;
              break;
            }
            case 1:
              {
              v156 = v45;
              break;
            }
            case 2:
              {
              int v158 = 3;
              v156 = v158;
              break;
            }
          }
          bool v159 = true;
          v150 = v156;
          break;
        }
        case 1:
          {
          int v160 = 0;
          int v161 = 0;
          int v162;
          int v163;
          v162 = v160;
          v163 = v161;
          while (true) {
            int v164 = 4;
            int v165 = v163 * v164;
            int v166 = v165 + v45;
            int v167 = 88;
            int v168 = v167 + v166;
            int v169 = v44[v168];
            int v170 = 0;
            bool v171 = v169 != v170;
            v162 = v162;
            v163 = v163;
            if (!v171) break;
            int v172 = v162 + v163;
            int v173 = 1;
            int v174 = v163 + v173;
            v162 = v172;
            v163 = v174;
          }
          bool v175 = true;
          v150 = v162;
          break;
        }
        case 2:
          {
          int v176 = 0;
          int v177 = 0;
          int v178;
          int v179;
          v178 = v176;
          v179 = v177;
          while (true) {
            int v180 = 4;
            int v181 = v179 * v180;
            int v182 = v181 + v45;
            int v183 = 108;
            int v184 = v183 + v182;
            int v185 = v44[v184];
            int v186 = 0;
            bool v187 = v185 != v186;
            v178 = v178;
            v179 = v179;
            if (!v187) break;
            int v188 = v178 + v179;
            int v189 = 1;
            int v190 = v179 + v189;
            v178 = v188;
            v179 = v190;
            break;
            ;
          }
          bool v191 = true;
          v150 = v178;
          break;
        }
        default:
          {
          int v192 = 0;
          int v193 = 0;
          int v194;
          int v195;
          v194 = v192;
          v195 = v193;
          while (true) {
            int v196 = 4;
            int v197 = v195 * v196;
            int v198 = v197 + v45;
            int v199 = 128;
            int v200 = v199 + v198;
            int v201 = v44[v200];
            int v202 = 0;
            bool v203 = v201 != v202;
            v194 = v194;
            v195 = v195;
            if (!v203) break;
            int v204 = v194 + v195;
            int v205 = 1;
            int v206 = v195 + v205;
            v194 = v204;
            v195 = v206;
          }
          bool v207 = true;
          v150 = v194;
          break;
        }
      }
      bool v208 = true;
      v77 = v150;
      break;
    }
  }
  bool v209 = true;
  int v210 = 32;
  int v211 = v210 + v45;
  bool v212 = true;
  int v213 = simt_wave_count_bits(v212);
  v43[v211] = v213;
  uint v214 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v215 = (int)(v214);
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 148; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
