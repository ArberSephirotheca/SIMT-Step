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
      int v20 = 0;
      bool v21 = v2 != v20;
      int v22;
      if (v21) {
        bool v23 = true;
        int v24 = simt_wave_count_bits(v23);
        int v25 = 16;
        int v26 = 4;
        int v27 = v14 * v26;
        int v28 = v25 + v27;
        int v29 = v28 + v0;
        v1[v29] = v24;
        v22 = v24;
      } else {
        bool v30 = true;
        int v31 = simt_wave_count_bits(v30);
        int v32 = 32;
        int v33 = 4;
        int v34 = v14 * v33;
        int v35 = v32 + v34;
        int v36 = v35 + v0;
        v1[v36] = v31;
        v22 = v31;
      }
      int v37 = 1;
      int v38 = v14 + v37;
      v13 = v22;
      v14 = v38;
    }
    v10 = v13;
  } else {
    int v39 = 4;
    int v40 = v3 % v39;
    uint v41 = simt_lane_id(__simt_tid);
    int v42 = (int)(v41);
    int v43;
    v43 = v42;
    switch (v40) {
      default:
        {
        int v44 = 0;
        int v45 = 0;
        int v46;
        int v47;
        v46 = v44;
        v47 = v45;
        while (true) {
          int v48 = 4;
          int v49 = v3 % v48;
          int v50 = 1;
          int v51 = v49 + v50;
          bool v52 = v47 < v51;
          v46 = v46;
          v47 = v47;
          if (!v52) break;
          int v53 = 2;
          int v54 = 1;
          int v55 = v47 + v54;
          v46 = v53;
          v47 = v55;
        }
        v43 = v46;
        break;
      }
      case 0:
        {
        int v56 = 0;
        bool v57 = v2 != v56;
        int v58;
        if (v57) {
          int v59 = 4;
          v58 = v59;
        } else {
          int v60 = 2;
          v58 = v60;
        }
        v43 = v58;
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
          int v70 = 0;
          int v71 = v0 + v70;
          int v72 = 1;
          int v73 = v64 + v72;
          v63 = v71;
          v64 = v73;
        }
        v43 = v63;
      }
      case 2:
        {
        int v74 = 3;
        int v75 = v3 % v74;
        int v76 = 4;
        int v77 = v0 + v76;
        int v78;
        v78 = v77;
        switch (v75) {
          case 0:
            {
            int v79 = 2;
            v78 = v79;
          }
          case 1:
            {
            int v80 = 0;
            v78 = v80;
          }
          default:
            {
            int v81 = 2;
            v78 = v81;
          }
          case 2:
            {
            int v82 = 4;
            v78 = v82;
            break;
          }
        }
        v43 = v78;
        break;
      }
    }
    v10 = v43;
  }
  int v83 = 0;
  bool v84 = v2 != v83;
  int v85 = v84 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v86 [[buffer(0)]], device int* v87 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v88 = static_cast<int>(__simt_tid3.x);
  int v89 = 0;
  int v90 = v89 + v88;
  int v91 = v87[v90];
  int v92 = 4;
  int v93 = v92 + v88;
  int v94 = v87[v93];
  helper0(v88, v86, v91, v94, static_cast<int>(__simt_tid3.x));
  int v95 = 0;
  int v96 = 0;
  int v97;
  int v98;
  v97 = v95;
  v98 = v96;
  while (true) {
    int v99 = 4;
    int v100 = v98 * v99;
    int v101 = v100 + v88;
    int v102 = 8;
    int v103 = v102 + v101;
    int v104 = v87[v103];
    int v105 = 0;
    bool v106 = v104 != v105;
    v97 = v97;
    v98 = v98;
    if (!v106) break;
    int v107 = v97 + v98;
    int v108 = 1;
    int v109 = v98 + v108;
    bool v110 = true;
    int v111 = 48;
    int v112 = 4;
    int v113 = v98 * v112;
    int v114 = v111 + v113;
    int v115 = v114 + v88;
    bool v116 = true;
    int v117 = simt_wave_count_bits(v116);
    v86[v115] = v117;
    v97 = v107;
    v98 = v109;
  }
  int v118 = 0;
  int v119 = 0;
  int v120;
  int v121;
  v120 = v118;
  v121 = v119;
  while (true) {
    int v122 = 4;
    int v123 = v121 * v122;
    int v124 = v123 + v88;
    int v125 = 28;
    int v126 = v125 + v124;
    int v127 = v87[v126];
    int v128 = 0;
    bool v129 = v127 != v128;
    v120 = v120;
    v121 = v121;
    if (!v129) break;
    int v130 = v120 + v121;
    int v131 = 1;
    int v132 = v121 + v131;
    bool v133 = true;
    int v134 = 64;
    int v135 = 4;
    int v136 = v121 * v135;
    int v137 = v134 + v136;
    int v138 = v137 + v88;
    bool v139 = true;
    int v140 = simt_wave_count_bits(v139);
    v86[v138] = v140;
    v120 = v130;
    v121 = v132;
    continue;
    ;
  }
  int v141 = 48;
  int v142 = v141 + v88;
  int v143 = v87[v142];
  uint v144 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v145 = (int)(v144);
  int v146;
  v146 = v145;
  switch (v143) {
    default:
      {
      int v147 = 52;
      int v148 = v147 + v88;
      int v149 = v87[v148];
      int v150 = 3;
      int v151;
      v151 = v150;
      switch (v149) {
        default:
          {
          int v152 = 0;
          int v153 = 0;
          int v154;
          int v155;
          v154 = v152;
          v155 = v153;
          while (true) {
            int v156 = 4;
            int v157 = v155 * v156;
            int v158 = v157 + v88;
            int v159 = 56;
            int v160 = v159 + v158;
            int v161 = v87[v160];
            int v162 = 0;
            bool v163 = v161 != v162;
            v154 = v154;
            v155 = v155;
            if (!v163) break;
            int v164 = v154 + v155;
            int v165 = 1;
            int v166 = v155 + v165;
            bool v167 = true;
            v154 = v164;
            v155 = v166;
            break;
            ;
          }
          v151 = v154;
          break;
        }
        case 0:
          {
          int v168 = 76;
          int v169 = v168 + v88;
          int v170 = v87[v169];
          int v171 = 3;
          int v172;
          v172 = v171;
          switch (v170) {
            default:
              {
              int v173 = 1;
              int v174 = v88 + v173;
              v172 = v174;
            }
            case 0:
              {
              int v175 = 4;
              int v176 = v88 + v175;
              v172 = v176;
              break;
            }
          }
          v151 = v172;
          break;
        }
        case 1:
          {
          int v177 = 80;
          int v178 = v177 + v88;
          int v179 = v87[v178];
          int v180 = 0;
          bool v181 = v179 != v180;
          int v182;
          if (v181) {
            int v183 = 2;
            v182 = v183;
          } else {
            int v184 = 1;
            int v185 = v88 + v184;
            v182 = v185;
          }
          v151 = v182;
          break;
        }
      }
      bool v186 = true;
      v146 = v151;
      break;
    }
    case 0:
      {
      int v187 = 84;
      int v188 = v187 + v88;
      int v189 = v87[v188];
      int v190 = 0;
      bool v191 = v189 != v190;
      int v192;
      if (v191) {
        int v193 = 0;
        int v194 = 0;
        int v195;
        int v196;
        v195 = v193;
        v196 = v194;
        while (true) {
          int v197 = 4;
          int v198 = v196 * v197;
          int v199 = v198 + v88;
          int v200 = 88;
          int v201 = v200 + v199;
          int v202 = v87[v201];
          int v203 = 0;
          bool v204 = v202 != v203;
          v195 = v195;
          v196 = v196;
          if (!v204) break;
          int v205 = v195 + v196;
          int v206 = 1;
          int v207 = v196 + v206;
          bool v208 = true;
          v195 = v205;
          v196 = v207;
        }
        v192 = v195;
      } else {
        int v209 = 2;
        v192 = v209;
      }
      v146 = v192;
    }
    case 1:
      {
      int v210 = 2;
      int v211 = v88 + v210;
      v146 = v211;
      break;
    }
    case 2:
      {
      int v212 = 108;
      int v213 = v212 + v88;
      int v214 = v87[v213];
      int v215 = 0;
      bool v216 = v214 != v215;
      int v217;
      if (v216) {
        int v218 = 0;
        int v219 = 0;
        int v220;
        int v221;
        v220 = v218;
        v221 = v219;
        while (true) {
          int v222 = 4;
          int v223 = v221 * v222;
          int v224 = v223 + v88;
          int v225 = 112;
          int v226 = v225 + v224;
          int v227 = v87[v226];
          int v228 = 0;
          bool v229 = v227 != v228;
          v220 = v220;
          v221 = v221;
          if (!v229) break;
          int v230 = v220 + v221;
          int v231 = 1;
          int v232 = v221 + v231;
          bool v233 = true;
          v220 = v230;
          v221 = v232;
        }
        v217 = v220;
      } else {
        int v234 = 132;
        int v235 = v234 + v88;
        int v236 = v87[v235];
        int v237 = 1;
        int v238 = v88 + v237;
        int v239;
        v239 = v238;
        switch (v236) {
          default:
            {
            v239 = v88;
            break;
          }
          case 0:
            {
            int v240 = 3;
            v239 = v240;
            break;
          }
        }
        v217 = v239;
      }
      v146 = v217;
      break;
    }
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 75; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 136; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
