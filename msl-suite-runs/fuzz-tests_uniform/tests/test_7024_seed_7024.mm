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
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      int v10 = 3;
      int v11 = v0 + v10;
      v9 = v11;
    } else {
      int v12 = 3;
      int v13 = v0 + v12;
      v9 = v13;
    }
    v6 = v9;
  } else {
    int v14 = 4;
    int v15 = v3 % v14;
    int v16 = 3;
    int v17 = v0 + v16;
    int v18;
    v18 = v17;
    switch (v15) {
      case 0:
        {
        int v19 = 0;
        bool v20 = v2 != v19;
        int v21;
        if (v20) {
          int v22 = 4;
          int v23 = v0 + v22;
          v21 = v23;
        } else {
          v21 = v0;
        }
        v18 = v21;
        break;
      }
      case 1:
        {
        int v24 = 3;
        int v25 = v3 % v24;
        int v26;
        v26 = v0;
        switch (v25) {
          case 0:
            {
            v26 = v0;
            break;
          }
          case 1:
            {
            int v27 = 3;
            v26 = v27;
            break;
          }
          default:
            {
            int v28 = 0;
            int v29 = v0 + v28;
            v26 = v29;
            break;
          }
        }
        int v30 = 2;
        int v31 = v0 + v30;
        v18 = v26;
        break;
      }
      default:
        {
        int v32;
        v32 = v0;
        switch (v3) {
          default:
            {
            v32 = v0;
            break;
          }
          case 0:
            {
            v32 = v0;
            break;
          }
        }
        v18 = v32;
        break;
      }
      case 2:
        {
        int v33 = 2;
        int v34 = v3 % v33;
        int v35 = 3;
        int v36;
        v36 = v35;
        switch (v34) {
          default:
            {
            v36 = v0;
            break;
          }
          case 0:
            {
            int v37 = 0;
            int v38 = v0 + v37;
            v36 = v38;
            break;
          }
        }
        v18 = v36;
        break;
      }
    }
    uint v39 = simt_lane_id(__simt_tid);
    int v40 = (int)(v39);
    v6 = v18;
  }
  bool v41 = true;
  int v42 = simt_wave_count_bits(v41);
  int v43 = 0;
  int v44 = v43 + v0;
  v1[v44] = v42;
  return;
}

kernel void kernel_main(device int* v45 [[buffer(0)]], device int* v46 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v47 = static_cast<int>(__simt_tid3.x);
  int v48 = 0;
  int v49 = v48 + v47;
  int v50 = v46[v49];
  int v51 = 4;
  int v52 = v51 + v47;
  int v53 = v46[v52];
  helper0(v47, v45, v50, v53, static_cast<int>(__simt_tid3.x));
  uint v54 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v55 = (int)(v54);
  int v56 = 8;
  int v57 = v56 + v47;
  int v58 = v46[v57];
  uint v59 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v60 = (int)(v59);
  int v61;
  v61 = v60;
  switch (v58) {
    default:
      {
      int v62 = 12;
      int v63 = v62 + v47;
      int v64 = v46[v63];
      int v65 = 3;
      int v66 = v47 + v65;
      int v67;
      v67 = v66;
      switch (v64) {
        case 0:
          {
          int v68 = 4;
          v67 = v68;
          break;
        }
        case 1:
          {
          int v69 = 16;
          int v70 = v69 + v47;
          int v71 = v46[v70];
          int v72 = 4;
          int v73 = v47 + v72;
          int v74;
          v74 = v73;
          switch (v71) {
            case 0:
              {
              v74 = v47;
              break;
            }
            default:
              {
              int v75 = 0;
              v74 = v75;
              break;
            }
            case 1:
              {
              v74 = v47;
              break;
            }
            case 2:
              {
              v74 = v47;
              break;
            }
          }
          bool v76 = true;
          v67 = v74;
          break;
        }
        default:
          {
          int v77 = 0;
          int v78 = 0;
          int v79;
          int v80;
          v79 = v77;
          v80 = v78;
          while (true) {
            int v81 = 4;
            int v82 = v80 * v81;
            int v83 = v82 + v47;
            int v84 = 20;
            int v85 = v84 + v83;
            int v86 = v46[v85];
            int v87 = 0;
            bool v88 = v86 != v87;
            v79 = v79;
            v80 = v80;
            if (!v88) break;
            int v89 = v79 + v80;
            int v90 = 1;
            int v91 = v80 + v90;
            v79 = v89;
            v80 = v91;
            break;
            ;
          }
          bool v92 = true;
          v67 = v79;
          break;
        }
      }
      bool v93 = true;
      v61 = v67;
      break;
    }
    case 0:
      {
      int v94 = 0;
      int v95 = 0;
      int v96;
      int v97;
      v96 = v94;
      v97 = v95;
      while (true) {
        int v98 = 4;
        int v99 = v97 * v98;
        int v100 = v99 + v47;
        int v101 = 40;
        int v102 = v101 + v100;
        int v103 = v46[v102];
        int v104 = 0;
        bool v105 = v103 != v104;
        v96 = v96;
        v97 = v97;
        if (!v105) break;
        int v106 = v96 + v97;
        int v107 = 1;
        int v108 = v97 + v107;
        v96 = v106;
        v97 = v108;
      }
      bool v109 = true;
      v61 = v96;
      break;
    }
    case 1:
      {
      int v110 = 60;
      int v111 = v110 + v47;
      int v112 = v46[v111];
      int v113 = 4;
      int v114;
      v114 = v113;
      switch (v112) {
        case 0:
          {
          int v115 = 64;
          int v116 = v115 + v47;
          int v117 = v46[v116];
          int v118 = 0;
          bool v119 = v117 != v118;
          int v120;
          if (v119) {
            int v121 = 2;
            int v122 = v47 + v121;
            v120 = v122;
          } else {
            int v123 = 0;
            v120 = v123;
          }
          v114 = v120;
        }
        case 1:
          {
          int v124 = 68;
          int v125 = v124 + v47;
          int v126 = v46[v125];
          int v127 = 0;
          int v128;
          v128 = v127;
          switch (v126) {
            default:
              {
              int v129 = 3;
              v128 = v129;
              break;
            }
            case 0:
              {
              int v130 = 1;
              int v131 = v47 + v130;
              v128 = v131;
              break;
            }
          }
          bool v132 = true;
          v114 = v128;
        }
        default:
          {
          int v133 = 0;
          int v134 = 0;
          int v135;
          int v136;
          v135 = v133;
          v136 = v134;
          while (true) {
            int v137 = 4;
            int v138 = v136 * v137;
            int v139 = v138 + v47;
            int v140 = 72;
            int v141 = v140 + v139;
            int v142 = v46[v141];
            int v143 = 0;
            bool v144 = v142 != v143;
            v135 = v135;
            v136 = v136;
            if (!v144) break;
            int v145 = v135 + v136;
            int v146 = 1;
            int v147 = v136 + v146;
            v135 = v145;
            v136 = v147;
          }
          bool v148 = true;
          v114 = v135;
        }
        case 2:
          {
          int v149 = 92;
          int v150 = v149 + v47;
          int v151 = v46[v150];
          int v152 = 0;
          bool v153 = v151 != v152;
          int v154;
          if (v153) {
            int v155 = 2;
            v154 = v155;
          } else {
            int v156 = 3;
            int v157 = v47 + v156;
            v154 = v157;
          }
          v114 = v154;
          break;
        }
      }
      bool v158 = true;
      v61 = v114;
      break;
    }
    case 2:
      {
      int v159 = 96;
      int v160 = v159 + v47;
      int v161 = v46[v160];
      int v162 = 0;
      bool v163 = v161 != v162;
      int v164;
      if (v163) {
        v164 = v47;
      } else {
        v164 = v47;
      }
      v61 = v164;
      break;
    }
  }
  bool v165 = true;
  int v166 = 16;
  int v167 = v166 + v47;
  bool v168 = true;
  int v169 = simt_wave_count_bits(v168);
  v45[v167] = v169;
  int v170 = 100;
  int v171 = v170 + v47;
  int v172 = v46[v171];
  int v173 = 0;
  bool v174 = v172 != v173;
  int v175;
  if (v174) {
    int v176 = 104;
    int v177 = v176 + v47;
    int v178 = v46[v177];
    int v179;
    v179 = v47;
    switch (v178) {
      default:
        {
        int v180 = 108;
        int v181 = v180 + v47;
        int v182 = v46[v181];
        int v183 = 0;
        bool v184 = v182 != v183;
        int v185;
        if (v184) {
          int v186 = 0;
          v185 = v186;
        } else {
          int v187 = 4;
          v185 = v187;
        }
        v179 = v185;
        break;
      }
      case 0:
        {
        int v188 = 0;
        int v189 = 0;
        int v190;
        int v191;
        v190 = v188;
        v191 = v189;
        while (true) {
          int v192 = 4;
          int v193 = v191 * v192;
          int v194 = v193 + v47;
          int v195 = 112;
          int v196 = v195 + v194;
          int v197 = v46[v196];
          int v198 = 0;
          bool v199 = v197 != v198;
          v190 = v190;
          v191 = v191;
          if (!v199) break;
          int v200 = v190 + v191;
          int v201 = 1;
          int v202 = v191 + v201;
          v190 = v200;
          v191 = v202;
          break;
          ;
        }
        bool v203 = true;
        v179 = v190;
        break;
      }
      case 1:
        {
        v179 = v47;
        break;
      }
    }
    bool v204 = true;
    v175 = v179;
  } else {
    int v205 = 0;
    int v206 = 0;
    int v207;
    int v208;
    v207 = v205;
    v208 = v206;
    while (true) {
      int v209 = 4;
      int v210 = v208 * v209;
      int v211 = v210 + v47;
      int v212 = 132;
      int v213 = v212 + v211;
      int v214 = v46[v213];
      int v215 = 0;
      bool v216 = v214 != v215;
      v207 = v207;
      v208 = v208;
      if (!v216) break;
      int v217 = 152;
      int v218 = v217 + v47;
      int v219 = v46[v218];
      int v220 = 0;
      bool v221 = v219 != v220;
      int v222;
      if (v221) {
        v222 = v47;
      } else {
        int v223 = 4;
        int v224 = v47 + v223;
        v222 = v224;
      }
      int v225 = v207 + v222;
      int v226 = 1;
      int v227 = v208 + v226;
      v207 = v225;
      v208 = v227;
    }
    bool v228 = true;
    v175 = v207;
  }
  int v229 = 32;
  int v230 = v229 + v47;
  bool v231 = true;
  int v232 = simt_wave_count_bits(v231);
  v45[v230] = v232;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 156; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
