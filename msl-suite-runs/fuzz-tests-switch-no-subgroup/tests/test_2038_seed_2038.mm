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
    int v13 = 3;
    int v14 = v3 % v13;
    int v15 = 4;
    int v16 = v0 + v15;
    int v17;
    v17 = v16;
    switch (v14) {
      case 0:
        {
        int v18 = 2;
        int v19 = v3 % v18;
        int v20;
        v20 = v0;
        switch (v19) {
          case 0:
            {
            int v21 = 1;
            v20 = v21;
            break;
          }
          case 1:
            {
            v20 = v0;
            break;
          }
          default:
            {
            v20 = v0;
            break;
          }
        }
        v17 = v20;
        break;
      }
      case 1:
        {
        int v22 = 0;
        bool v23 = v2 != v22;
        int v24;
        if (v23) {
          int v25 = 2;
          v24 = v25;
        } else {
          int v26 = 2;
          int v27 = v0 + v26;
          v24 = v27;
        }
        v17 = v24;
        break;
      }
      default:
        {
        int v28 = 2;
        int v29 = v0 + v28;
        v17 = v29;
        break;
      }
    }
    bool v30 = true;
    int v31 = simt_wave_count_bits(v30);
    int v32 = 0;
    int v33 = 4;
    int v34 = v7 * v33;
    int v35 = v32 + v34;
    int v36 = v35 + v0;
    v1[v36] = v31;
    int v37 = 1;
    int v38 = v7 + v37;
    v6 = v17;
    v7 = v38;
  }
  return;
}

kernel void kernel_main(device int* v39 [[buffer(0)]], device int* v40 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v41 = static_cast<int>(__simt_tid3.x);
  int v42 = 0;
  int v43 = v42 + v41;
  int v44 = v40[v43];
  int v45 = 4;
  int v46 = v45 + v41;
  int v47 = v40[v46];
  helper0(v41, v39, v44, v47, static_cast<int>(__simt_tid3.x));
  int v48 = 8;
  int v49 = v48 + v41;
  int v50 = v40[v49];
  uint v51 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v52 = (int)(v51);
  int v53;
  v53 = v52;
  switch (v50) {
    case 0:
      {
      int v54 = 12;
      int v55 = v54 + v41;
      int v56 = v40[v55];
      int v57 = 0;
      bool v58 = v56 != v57;
      int v59;
      if (v58) {
        int v60 = 16;
        int v61 = v60 + v41;
        int v62 = v40[v61];
        int v63 = 0;
        bool v64 = v62 != v63;
        int v65;
        if (v64) {
          v65 = v41;
        } else {
          v65 = v41;
        }
        v59 = v65;
      } else {
        int v66 = 1;
        v59 = v66;
      }
      v53 = v59;
      break;
    }
    default:
      {
      int v67 = 4;
      int v68 = v41 + v67;
      v53 = v68;
      break;
    }
    case 1:
      {
      int v69 = 0;
      int v70 = 0;
      int v71;
      int v72;
      v71 = v69;
      v72 = v70;
      while (true) {
        int v73 = 4;
        int v74 = v72 * v73;
        int v75 = v74 + v41;
        int v76 = 20;
        int v77 = v76 + v75;
        int v78 = v40[v77];
        int v79 = 0;
        bool v80 = v78 != v79;
        v71 = v71;
        v72 = v72;
        if (!v80) break;
        int v81 = v71 + v72;
        int v82 = 1;
        int v83 = v72 + v82;
        bool v84 = true;
        v71 = v81;
        v72 = v83;
        continue;
        ;
      }
      v53 = v71;
      break;
    }
  }
  bool v85 = true;
  int v86 = 16;
  int v87 = v86 + v41;
  bool v88 = true;
  int v89 = simt_wave_count_bits(v88);
  v39[v87] = v89;
  int v90 = 40;
  int v91 = v90 + v41;
  int v92 = v40[v91];
  int v93 = 0;
  int v94;
  v94 = v93;
  switch (v92) {
    case 0:
      {
      int v95 = 44;
      int v96 = v95 + v41;
      int v97 = v40[v96];
      int v98;
      v98 = v41;
      switch (v97) {
        case 0:
          {
          int v99 = 48;
          int v100 = v99 + v41;
          int v101 = v40[v100];
          int v102 = 0;
          bool v103 = v101 != v102;
          int v104;
          if (v103) {
            int v105 = 0;
            int v106 = v41 + v105;
            v104 = v106;
          } else {
            int v107 = 2;
            v104 = v107;
          }
          v98 = v104;
          break;
        }
        case 1:
          {
          int v108 = 52;
          int v109 = v108 + v41;
          int v110 = v40[v109];
          int v111 = 0;
          int v112 = v41 + v111;
          int v113;
          v113 = v112;
          switch (v110) {
            case 0:
              {
              v113 = v41;
              break;
            }
            default:
              {
              int v114 = 4;
              int v115 = v41 + v114;
              v113 = v115;
              break;
            }
            case 1:
              {
              int v116 = 2;
              int v117 = v41 + v116;
              v113 = v117;
              break;
            }
          }
          bool v118 = true;
          v98 = v113;
          break;
        }
        default:
          {
          int v119 = 56;
          int v120 = v119 + v41;
          int v121 = v40[v120];
          int v122 = 0;
          bool v123 = v121 != v122;
          int v124;
          if (v123) {
            int v125 = 3;
            int v126 = v41 + v125;
            v124 = v126;
          } else {
            int v127 = 1;
            int v128 = v41 + v127;
            v124 = v128;
          }
          v98 = v124;
          break;
        }
        case 2:
          {
          int v129 = 60;
          int v130 = v129 + v41;
          int v131 = v40[v130];
          int v132;
          v132 = v41;
          switch (v131) {
            default:
              {
              int v133 = 3;
              int v134 = v41 + v133;
              v132 = v134;
            }
            case 0:
              {
              int v135 = 0;
              int v136 = v41 + v135;
              v132 = v136;
              break;
            }
            case 1:
              {
              v132 = v41;
              break;
            }
          }
          v98 = v132;
          break;
        }
      }
      bool v137 = true;
      v94 = v98;
    }
    default:
      {
      int v138 = 0;
      int v139 = 0;
      int v140;
      int v141;
      v140 = v138;
      v141 = v139;
      while (true) {
        int v142 = 4;
        int v143 = v141 * v142;
        int v144 = v143 + v41;
        int v145 = 64;
        int v146 = v145 + v144;
        int v147 = v40[v146];
        int v148 = 0;
        bool v149 = v147 != v148;
        v140 = v140;
        v141 = v141;
        if (!v149) break;
        int v150 = 84;
        int v151 = v150 + v41;
        int v152 = v40[v151];
        int v153 = 2;
        int v154;
        v154 = v153;
        switch (v152) {
          case 0:
            {
            int v155 = 1;
            v154 = v155;
            break;
          }
          default:
            {
            int v156 = 3;
            v154 = v156;
            break;
          }
        }
        int v157 = v140 + v154;
        int v158 = 1;
        int v159 = v141 + v158;
        bool v160 = true;
        v140 = v157;
        v141 = v159;
      }
      v94 = v140;
      break;
    }
    case 1:
      {
      int v161 = 88;
      int v162 = v161 + v41;
      int v163 = v40[v162];
      int v164 = 3;
      int v165 = v41 + v164;
      int v166;
      v166 = v165;
      switch (v163) {
        default:
          {
          int v167 = 92;
          int v168 = v167 + v41;
          int v169 = v40[v168];
          int v170 = 0;
          bool v171 = v169 != v170;
          int v172;
          if (v171) {
            int v173 = 3;
            v172 = v173;
          } else {
            v172 = v41;
          }
          v166 = v172;
          break;
        }
        case 0:
          {
          int v174 = 96;
          int v175 = v174 + v41;
          int v176 = v40[v175];
          int v177 = 0;
          bool v178 = v176 != v177;
          int v179;
          if (v178) {
            int v180 = 4;
            int v181 = v41 + v180;
            v179 = v181;
          } else {
            int v182 = 2;
            int v183 = v41 + v182;
            v179 = v183;
          }
          v166 = v179;
          break;
        }
        case 1:
          {
          int v184 = 100;
          int v185 = v184 + v41;
          int v186 = v40[v185];
          int v187;
          v187 = v41;
          switch (v186) {
            case 0:
              {
              int v188 = 1;
              v187 = v188;
            }
            case 1:
              {
              int v189 = 1;
              v187 = v189;
            }
            default:
              {
              int v190 = 2;
              v187 = v190;
              break;
            }
          }
          v166 = v187;
          break;
        }
        case 2:
          {
          int v191 = 0;
          int v192 = 0;
          int v193;
          int v194;
          v193 = v191;
          v194 = v192;
          while (true) {
            int v195 = 4;
            int v196 = v194 * v195;
            int v197 = v196 + v41;
            int v198 = 104;
            int v199 = v198 + v197;
            int v200 = v40[v199];
            int v201 = 0;
            bool v202 = v200 != v201;
            v193 = v193;
            v194 = v194;
            if (!v202) break;
            int v203 = v193 + v194;
            int v204 = 1;
            int v205 = v194 + v204;
            bool v206 = true;
            v193 = v203;
            v194 = v205;
            break;
            ;
          }
          v166 = v193;
          break;
        }
      }
      v94 = v166;
      break;
    }
    case 2:
      {
      int v207 = 0;
      int v208 = 0;
      int v209;
      int v210;
      v209 = v207;
      v210 = v208;
      while (true) {
        int v211 = 4;
        int v212 = v210 * v211;
        int v213 = v212 + v41;
        int v214 = 124;
        int v215 = v214 + v213;
        int v216 = v40[v215];
        int v217 = 0;
        bool v218 = v216 != v217;
        v209 = v209;
        v210 = v210;
        if (!v218) break;
        int v219 = v209 + v210;
        int v220 = 1;
        int v221 = v210 + v220;
        bool v222 = true;
        v209 = v219;
        v210 = v221;
        continue;
        ;
      }
      v94 = v209;
      break;
    }
  }
  bool v223 = true;
  int v224 = 32;
  int v225 = v224 + v41;
  bool v226 = true;
  int v227 = simt_wave_count_bits(v226);
  v39[v225] = v227;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 144; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
