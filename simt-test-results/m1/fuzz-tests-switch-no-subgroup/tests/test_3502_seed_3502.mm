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
  int v4;
  v4 = v0;
  switch (v3) {
    case 0:
      {
      int v5 = 2;
      int v6 = v0 + v5;
      v4 = v6;
      break;
    }
    default:
      {
      int v7 = 0;
      bool v8 = v2 != v7;
      int v9;
      if (v8) {
        int v10 = 3;
        int v11 = v3 % v10;
        int v12 = 4;
        int v13 = v0 + v12;
        int v14;
        v14 = v13;
        switch (v11) {
          case 0:
            {
            v14 = v0;
          }
          case 1:
            {
            int v15 = 4;
            v14 = v15;
          }
          default:
            {
            int v16 = 4;
            v14 = v16;
            break;
          }
          case 2:
            {
            v14 = v0;
            break;
          }
        }
        v9 = v14;
      } else {
        int v17 = 0;
        bool v18 = v2 != v17;
        int v19;
        if (v18) {
          int v20 = 2;
          int v21 = v0 + v20;
          v19 = v21;
        } else {
          v19 = v0;
        }
        v9 = v19;
      }
      v4 = v9;
      break;
    }
  }
  bool v22 = true;
  int v23 = simt_wave_count_bits(v22);
  int v24 = 0;
  int v25 = v24 + v0;
  v1[v25] = v23;
  return;
}

kernel void kernel_main(device int* v26 [[buffer(0)]], device int* v27 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v28 = static_cast<int>(__simt_tid3.x);
  int v29 = 0;
  int v30 = v29 + v28;
  int v31 = v27[v30];
  int v32 = 4;
  int v33 = v32 + v28;
  int v34 = v27[v33];
  helper0(v28, v26, v31, v34, static_cast<int>(__simt_tid3.x));
  int v35 = 8;
  int v36 = v35 + v28;
  int v37 = v27[v36];
  uint v38 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v39 = (int)(v38);
  int v40;
  v40 = v39;
  switch (v37) {
    case 0:
      {
      int v41 = 12;
      int v42 = v41 + v28;
      int v43 = v27[v42];
      int v44;
      v44 = v28;
      switch (v43) {
        case 0:
          {
          int v45 = 0;
          int v46 = 0;
          int v47;
          int v48;
          v47 = v45;
          v48 = v46;
          while (true) {
            int v49 = 4;
            int v50 = v48 * v49;
            int v51 = v50 + v28;
            int v52 = 16;
            int v53 = v52 + v51;
            int v54 = v27[v53];
            int v55 = 0;
            bool v56 = v54 != v55;
            v47 = v47;
            v48 = v48;
            if (!v56) break;
            int v57 = v47 + v48;
            int v58 = 1;
            int v59 = v48 + v58;
            bool v60 = true;
            v47 = v57;
            v48 = v59;
            break;
            ;
          }
          v44 = v47;
        }
        default:
          {
          int v61 = 0;
          int v62 = 0;
          int v63;
          int v64;
          v63 = v61;
          v64 = v62;
          while (true) {
            int v65 = 4;
            int v66 = v64 * v65;
            int v67 = v66 + v28;
            int v68 = 36;
            int v69 = v68 + v67;
            int v70 = v27[v69];
            int v71 = 0;
            bool v72 = v70 != v71;
            v63 = v63;
            v64 = v64;
            if (!v72) break;
            int v73 = v63 + v64;
            int v74 = 1;
            int v75 = v64 + v74;
            bool v76 = true;
            v63 = v73;
            v64 = v75;
          }
          v44 = v63;
          break;
        }
      }
      bool v77 = true;
      v40 = v44;
      break;
    }
    case 1:
      {
      int v78 = 56;
      int v79 = v78 + v28;
      int v80 = v27[v79];
      int v81 = 2;
      int v82 = v28 + v81;
      int v83;
      v83 = v82;
      switch (v80) {
        case 0:
          {
          int v84 = 0;
          int v85 = 0;
          int v86;
          int v87;
          v86 = v84;
          v87 = v85;
          while (true) {
            int v88 = 4;
            int v89 = v87 * v88;
            int v90 = v89 + v28;
            int v91 = 60;
            int v92 = v91 + v90;
            int v93 = v27[v92];
            int v94 = 0;
            bool v95 = v93 != v94;
            v86 = v86;
            v87 = v87;
            if (!v95) break;
            int v96 = v86 + v87;
            int v97 = 1;
            int v98 = v87 + v97;
            bool v99 = true;
            v86 = v96;
            v87 = v98;
          }
          v83 = v86;
          break;
        }
        default:
          {
          v83 = v28;
          break;
        }
        case 1:
          {
          int v100 = 1;
          v83 = v100;
          break;
        }
        case 2:
          {
          int v101 = 80;
          int v102 = v101 + v28;
          int v103 = v27[v102];
          int v104 = 0;
          bool v105 = v103 != v104;
          int v106;
          if (v105) {
            int v107 = 2;
            v106 = v107;
          } else {
            int v108 = 3;
            int v109 = v28 + v108;
            v106 = v109;
          }
          v83 = v106;
          break;
        }
      }
      v40 = v83;
      break;
    }
    default:
      {
      int v110 = 84;
      int v111 = v110 + v28;
      int v112 = v27[v111];
      int v113 = 1;
      int v114;
      v114 = v113;
      switch (v112) {
        case 0:
          {
          int v115 = 0;
          int v116 = 0;
          int v117;
          int v118;
          v117 = v115;
          v118 = v116;
          while (true) {
            int v119 = 4;
            int v120 = v118 * v119;
            int v121 = v120 + v28;
            int v122 = 88;
            int v123 = v122 + v121;
            int v124 = v27[v123];
            int v125 = 0;
            bool v126 = v124 != v125;
            v117 = v117;
            v118 = v118;
            if (!v126) break;
            int v127 = v117 + v118;
            int v128 = 1;
            int v129 = v118 + v128;
            bool v130 = true;
            v117 = v127;
            v118 = v129;
          }
          v114 = v117;
          break;
        }
        default:
          {
          int v131 = 108;
          int v132 = v131 + v28;
          int v133 = v27[v132];
          int v134 = 3;
          int v135 = v28 + v134;
          int v136;
          v136 = v135;
          switch (v133) {
            default:
              {
              int v137 = 0;
              int v138 = v28 + v137;
              v136 = v138;
            }
            case 0:
              {
              int v139 = 4;
              v136 = v139;
              break;
            }
          }
          bool v140 = true;
          v114 = v136;
          break;
        }
        case 1:
          {
          int v141 = 112;
          int v142 = v141 + v28;
          int v143 = v27[v142];
          int v144;
          v144 = v28;
          switch (v143) {
            case 0:
              {
              int v145 = 2;
              int v146 = v28 + v145;
              v144 = v146;
              break;
            }
            default:
              {
              int v147 = 2;
              v144 = v147;
              break;
            }
            case 1:
              {
              int v148 = 2;
              int v149 = v28 + v148;
              v144 = v149;
              break;
            }
          }
          v114 = v144;
          break;
        }
        case 2:
          {
          int v150 = 0;
          int v151 = 0;
          int v152;
          int v153;
          v152 = v150;
          v153 = v151;
          while (true) {
            int v154 = 4;
            int v155 = v153 * v154;
            int v156 = v155 + v28;
            int v157 = 116;
            int v158 = v157 + v156;
            int v159 = v27[v158];
            int v160 = 0;
            bool v161 = v159 != v160;
            v152 = v152;
            v153 = v153;
            if (!v161) break;
            int v162 = v152 + v153;
            int v163 = 1;
            int v164 = v153 + v163;
            bool v165 = true;
            v152 = v162;
            v153 = v164;
          }
          v114 = v152;
          break;
        }
      }
      v40 = v114;
      break;
    }
    case 2:
      {
      int v166 = 136;
      int v167 = v166 + v28;
      int v168 = v27[v167];
      int v169 = 0;
      bool v170 = v168 != v169;
      int v171;
      if (v170) {
        int v172 = 140;
        int v173 = v172 + v28;
        int v174 = v27[v173];
        int v175 = 3;
        int v176;
        v176 = v175;
        switch (v174) {
          case 0:
            {
            int v177 = 4;
            v176 = v177;
          }
          case 1:
            {
            int v178 = 3;
            int v179 = v28 + v178;
            v176 = v179;
            break;
          }
          default:
            {
            int v180 = 1;
            v176 = v180;
            break;
          }
          case 2:
            {
            int v181 = 0;
            int v182 = v28 + v181;
            v176 = v182;
            break;
          }
        }
        bool v183 = true;
        v171 = v176;
      } else {
        int v184 = 3;
        int v185 = v28 + v184;
        v171 = v185;
      }
      v40 = v171;
      break;
    }
  }
  int v186 = 0;
  int v187 = 0;
  int v188;
  int v189;
  v188 = v186;
  v189 = v187;
  while (true) {
    int v190 = 4;
    int v191 = v189 * v190;
    int v192 = v191 + v28;
    int v193 = 144;
    int v194 = v193 + v192;
    int v195 = v27[v194];
    int v196 = 0;
    bool v197 = v195 != v196;
    v188 = v188;
    v189 = v189;
    if (!v197) break;
    int v198 = 0;
    int v199 = 0;
    int v200;
    int v201;
    v200 = v198;
    v201 = v199;
    while (true) {
      int v202 = 4;
      int v203 = v201 * v202;
      int v204 = v203 + v28;
      int v205 = 164;
      int v206 = v205 + v204;
      int v207 = v27[v206];
      int v208 = 0;
      bool v209 = v207 != v208;
      v200 = v200;
      v201 = v201;
      if (!v209) break;
      int v210 = v200 + v201;
      int v211 = 1;
      int v212 = v201 + v211;
      bool v213 = true;
      int v214 = 16;
      int v215 = 4;
      int v216 = v201 * v215;
      int v217 = v214 + v216;
      int v218 = v217 + v28;
      bool v219 = true;
      int v220 = simt_wave_count_bits(v219);
      v26[v218] = v220;
      v200 = v210;
      v201 = v212;
    }
    int v221 = v188 + v200;
    int v222 = 1;
    int v223 = v189 + v222;
    bool v224 = true;
    int v225 = 32;
    int v226 = 4;
    int v227 = v189 * v226;
    int v228 = v225 + v227;
    int v229 = v228 + v28;
    bool v230 = true;
    int v231 = simt_wave_count_bits(v230);
    v26[v229] = v231;
    v188 = v221;
    v189 = v223;
    break;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 184; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
