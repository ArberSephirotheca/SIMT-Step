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
    int v13 = 0;
    bool v14 = v2 != v13;
    int v15;
    if (v14) {
      int v16 = 3;
      int v17 = v3 % v16;
      uint v18 = simt_lane_id(__simt_tid);
      int v19 = (int)(v18);
      int v20;
      v20 = v19;
      switch (v17) {
        case 0:
          {
          int v21 = 3;
          int v22 = v0 + v21;
          v20 = v22;
        }
        case 1:
          {
          int v23 = 4;
          int v24 = v0 + v23;
          v20 = v24;
        }
        default:
          {
          int v25 = 4;
          int v26 = v0 + v25;
          v20 = v26;
          break;
        }
      }
      int v27 = 3;
      int v28 = v0 + v27;
      v15 = v20;
    } else {
      uint v29 = simt_subgroup_id(__simt_tid);
      int v30 = (int)(v29);
      int v31;
      v31 = v30;
      switch (v3) {
        case 0:
          {
          v31 = v0;
          break;
        }
        default:
          {
          int v32 = 3;
          v31 = v32;
          break;
        }
      }
      uint v33 = simt_lane_id(__simt_tid);
      int v34 = (int)(v33);
      v15 = v31;
    }
    int v35 = 2;
    int v36 = v0 + v35;
    int v37 = 1;
    int v38 = v7 + v37;
    v6 = v15;
    v7 = v38;
  }
  bool v39 = true;
  int v40 = simt_wave_count_bits(v39);
  int v41 = 0;
  int v42 = v41 + v0;
  v1[v42] = v40;
  int v43 = 0;
  bool v44 = v2 != v43;
  int v45 = v44 ? v0 : v6;
  return;
}

kernel void kernel_main(device int* v46 [[buffer(0)]], device int* v47 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v48 = static_cast<int>(__simt_tid3.x);
  int v49 = 0;
  int v50 = v49 + v48;
  int v51 = v47[v50];
  int v52 = 4;
  int v53 = v52 + v48;
  int v54 = v47[v53];
  helper0(v48, v46, v51, v54, static_cast<int>(__simt_tid3.x));
  int v55 = 8;
  int v56 = v55 + v48;
  int v57 = v47[v56];
  int v58;
  v58 = v48;
  switch (v57) {
    default:
      {
      int v59 = 2;
      v58 = v59;
      break;
    }
    case 0:
      {
      int v60 = 12;
      int v61 = v60 + v48;
      int v62 = v47[v61];
      int v63 = 0;
      int v64;
      v64 = v63;
      switch (v62) {
        case 0:
          {
          int v65 = 0;
          int v66 = v48 + v65;
          v64 = v66;
          break;
        }
        case 1:
          {
          int v67 = 16;
          int v68 = v67 + v48;
          int v69 = v47[v68];
          int v70 = 1;
          int v71 = v48 + v70;
          int v72;
          v72 = v71;
          switch (v69) {
            case 0:
              {
              v72 = v48;
              break;
            }
            case 1:
              {
              int v73 = 2;
              v72 = v73;
              break;
            }
            default:
              {
              int v74 = 4;
              v72 = v74;
            }
            case 2:
              {
              int v75 = 1;
              v72 = v75;
              break;
            }
          }
          bool v76 = true;
          v64 = v72;
          break;
        }
        default:
          {
          int v77 = 20;
          int v78 = v77 + v48;
          int v79 = v47[v78];
          int v80 = 0;
          int v81 = v48 + v80;
          int v82;
          v82 = v81;
          switch (v79) {
            case 0:
              {
              int v83 = 1;
              int v84 = v48 + v83;
              v82 = v84;
            }
            case 1:
              {
              int v85 = 4;
              int v86 = v48 + v85;
              v82 = v86;
            }
            default:
              {
              int v87 = 2;
              v82 = v87;
            }
            case 2:
              {
              int v88 = 0;
              int v89 = v48 + v88;
              v82 = v89;
              break;
            }
          }
          bool v90 = true;
          v64 = v82;
          break;
        }
        case 2:
          {
          int v91 = 24;
          int v92 = v91 + v48;
          int v93 = v47[v92];
          int v94 = 2;
          int v95 = v48 + v94;
          int v96;
          v96 = v95;
          switch (v93) {
            case 0:
              {
              int v97 = 4;
              v96 = v97;
              break;
            }
            case 1:
              {
              int v98 = 2;
              int v99 = v48 + v98;
              v96 = v99;
            }
            default:
              {
              v96 = v48;
            }
            case 2:
              {
              v96 = v48;
              break;
            }
          }
          bool v100 = true;
          v64 = v96;
          break;
        }
      }
      bool v101 = true;
      v58 = v64;
      break;
    }
  }
  bool v102 = true;
  int v103 = 16;
  int v104 = v103 + v48;
  bool v105 = true;
  int v106 = simt_wave_count_bits(v105);
  v46[v104] = v106;
  int v107 = 4;
  int v108 = 28;
  int v109 = v108 + v48;
  int v110 = v47[v109];
  int v111 = 2;
  int v112 = v48 + v111;
  int v113;
  v113 = v112;
  switch (v110) {
    case 0:
      {
      int v114 = 32;
      int v115 = v114 + v48;
      int v116 = v47[v115];
      int v117 = 4;
      int v118;
      v118 = v117;
      switch (v116) {
        case 0:
          {
          int v119 = 0;
          int v120 = 0;
          int v121;
          int v122;
          v121 = v119;
          v122 = v120;
          while (true) {
            int v123 = 4;
            int v124 = v122 * v123;
            int v125 = v124 + v48;
            int v126 = 36;
            int v127 = v126 + v125;
            int v128 = v47[v127];
            int v129 = 0;
            bool v130 = v128 != v129;
            v121 = v121;
            v122 = v122;
            if (!v130) break;
            int v131 = v121 + v122;
            int v132 = 1;
            int v133 = v122 + v132;
            v121 = v131;
            v122 = v133;
            continue;
            ;
          }
          bool v134 = true;
          v118 = v121;
          break;
        }
        case 1:
          {
          int v135 = 0;
          int v136 = 0;
          int v137;
          int v138;
          v137 = v135;
          v138 = v136;
          while (true) {
            int v139 = 4;
            int v140 = v138 * v139;
            int v141 = v140 + v48;
            int v142 = 56;
            int v143 = v142 + v141;
            int v144 = v47[v143];
            int v145 = 0;
            bool v146 = v144 != v145;
            v137 = v137;
            v138 = v138;
            if (!v146) break;
            int v147 = v137 + v138;
            int v148 = 1;
            int v149 = v138 + v148;
            v137 = v147;
            v138 = v149;
          }
          bool v150 = true;
          v118 = v137;
          break;
        }
        default:
          {
          int v151 = 0;
          int v152 = 0;
          int v153;
          int v154;
          v153 = v151;
          v154 = v152;
          while (true) {
            int v155 = 4;
            int v156 = v154 * v155;
            int v157 = v156 + v48;
            int v158 = 76;
            int v159 = v158 + v157;
            int v160 = v47[v159];
            int v161 = 0;
            bool v162 = v160 != v161;
            v153 = v153;
            v154 = v154;
            if (!v162) break;
            int v163 = v153 + v154;
            int v164 = 1;
            int v165 = v154 + v164;
            v153 = v163;
            v154 = v165;
          }
          bool v166 = true;
          v118 = v153;
          break;
        }
      }
      bool v167 = true;
      v113 = v118;
      break;
    }
    default:
      {
      int v168 = 96;
      int v169 = v168 + v48;
      int v170 = v47[v169];
      int v171 = 2;
      int v172;
      v172 = v171;
      switch (v170) {
        case 0:
          {
          int v173 = 0;
          int v174 = 0;
          int v175;
          int v176;
          v175 = v173;
          v176 = v174;
          while (true) {
            int v177 = 4;
            int v178 = v176 * v177;
            int v179 = v178 + v48;
            int v180 = 100;
            int v181 = v180 + v179;
            int v182 = v47[v181];
            int v183 = 0;
            bool v184 = v182 != v183;
            v175 = v175;
            v176 = v176;
            if (!v184) break;
            int v185 = v175 + v176;
            int v186 = 1;
            int v187 = v176 + v186;
            v175 = v185;
            v176 = v187;
          }
          bool v188 = true;
          v172 = v175;
          break;
        }
        default:
          {
          int v189 = 0;
          int v190 = 0;
          int v191;
          int v192;
          v191 = v189;
          v192 = v190;
          while (true) {
            int v193 = 4;
            int v194 = v192 * v193;
            int v195 = v194 + v48;
            int v196 = 120;
            int v197 = v196 + v195;
            int v198 = v47[v197];
            int v199 = 0;
            bool v200 = v198 != v199;
            v191 = v191;
            v192 = v192;
            if (!v200) break;
            int v201 = v191 + v192;
            int v202 = 1;
            int v203 = v192 + v202;
            v191 = v201;
            v192 = v203;
          }
          bool v204 = true;
          v172 = v191;
          break;
        }
        case 1:
          {
          int v205 = 0;
          int v206 = v48 + v205;
          v172 = v206;
          break;
        }
      }
      bool v207 = true;
      v113 = v172;
      break;
    }
    case 1:
      {
      int v208 = 0;
      int v209 = 0;
      int v210;
      int v211;
      v210 = v208;
      v211 = v209;
      while (true) {
        int v212 = 4;
        int v213 = v211 * v212;
        int v214 = v213 + v48;
        int v215 = 140;
        int v216 = v215 + v214;
        int v217 = v47[v216];
        int v218 = 0;
        bool v219 = v217 != v218;
        v210 = v210;
        v211 = v211;
        if (!v219) break;
        int v220 = 2;
        int v221 = v210 + v220;
        int v222 = 1;
        int v223 = v211 + v222;
        v210 = v221;
        v211 = v223;
      }
      bool v224 = true;
      v113 = v210;
      break;
    }
  }
  bool v225 = true;
  int v226 = 32;
  int v227 = v226 + v48;
  bool v228 = true;
  int v229 = simt_wave_count_bits(v228);
  v46[v227] = v229;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 160; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
