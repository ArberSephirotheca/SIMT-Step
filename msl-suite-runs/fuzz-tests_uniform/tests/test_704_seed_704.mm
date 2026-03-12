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
        uint v19 = simt_lane_id(__simt_tid);
        int v20 = (int)(v19);
        v18 = v20;
      } else {
        v18 = v0;
      }
      int v21 = 2;
      int v22 = v0 + v21;
      int v23 = 1;
      int v24 = v10 + v23;
      v9 = v18;
      v10 = v24;
    }
    v6 = v9;
  } else {
    int v25 = 3;
    int v26 = v3 % v25;
    int v27 = 2;
    int v28;
    v28 = v27;
    switch (v26) {
      case 0:
        {
        v28 = v0;
      }
      default:
        {
        int v29 = 0;
        int v30 = 0;
        int v31;
        int v32;
        v31 = v29;
        v32 = v30;
        while (true) {
          int v33 = 4;
          int v34 = v3 % v33;
          int v35 = 1;
          int v36 = v34 + v35;
          bool v37 = v32 < v36;
          v31 = v31;
          v32 = v32;
          if (!v37) break;
          int v38 = 1;
          int v39 = 1;
          int v40 = v32 + v39;
          v31 = v38;
          v32 = v40;
        }
        int v41 = 0;
        int v42 = v0 + v41;
        v28 = v31;
      }
      case 1:
        {
        int v43 = 0;
        bool v44 = v2 != v43;
        int v45;
        if (v44) {
          int v46 = 2;
          v45 = v46;
        } else {
          int v47 = 1;
          int v48 = v0 + v47;
          v45 = v48;
        }
        int v49 = 2;
        int v50 = v0 + v49;
        v28 = v45;
      }
      case 2:
        {
        int v51 = 1;
        int v52 = v0 + v51;
        v28 = v52;
        break;
      }
    }
    uint v53 = simt_lane_id(__simt_tid);
    int v54 = (int)(v53);
    v6 = v28;
  }
  bool v55 = true;
  int v56 = simt_wave_count_bits(v55);
  int v57 = 0;
  int v58 = v57 + v0;
  v1[v58] = v56;
  return;
}

kernel void kernel_main(device int* v59 [[buffer(0)]], device int* v60 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v61 = static_cast<int>(__simt_tid3.x);
  int v62 = 0;
  int v63 = v62 + v61;
  int v64 = v60[v63];
  int v65 = 4;
  int v66 = v65 + v61;
  int v67 = v60[v66];
  helper0(v61, v59, v64, v67, static_cast<int>(__simt_tid3.x));
  int v68 = 8;
  int v69 = v68 + v61;
  int v70 = v60[v69];
  uint v71 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v72 = (int)(v71);
  int v73;
  v73 = v72;
  switch (v70) {
    default:
      {
      int v74 = 0;
      int v75 = 0;
      int v76;
      int v77;
      v76 = v74;
      v77 = v75;
      while (true) {
        int v78 = 4;
        int v79 = v77 * v78;
        int v80 = v79 + v61;
        int v81 = 12;
        int v82 = v81 + v80;
        int v83 = v60[v82];
        int v84 = 0;
        bool v85 = v83 != v84;
        v76 = v76;
        v77 = v77;
        if (!v85) break;
        int v86 = 32;
        int v87 = v86 + v61;
        int v88 = v60[v87];
        int v89 = 3;
        int v90 = v61 + v89;
        int v91;
        v91 = v90;
        switch (v88) {
          case 0:
            {
            int v92 = 0;
            v91 = v92;
            break;
          }
          case 1:
            {
            int v93 = 3;
            v91 = v93;
            break;
          }
          case 2:
            {
            int v94 = 0;
            int v95 = v61 + v94;
            v91 = v95;
            break;
          }
          default:
            {
            int v96 = 1;
            v91 = v96;
            break;
          }
        }
        bool v97 = true;
        int v98 = v76 + v91;
        int v99 = 1;
        int v100 = v77 + v99;
        v76 = v98;
        v77 = v100;
      }
      bool v101 = true;
      v73 = v76;
      break;
    }
    case 0:
      {
      int v102 = 0;
      int v103 = 0;
      int v104;
      int v105;
      v104 = v102;
      v105 = v103;
      while (true) {
        int v106 = 4;
        int v107 = v105 * v106;
        int v108 = v107 + v61;
        int v109 = 36;
        int v110 = v109 + v108;
        int v111 = v60[v110];
        int v112 = 0;
        bool v113 = v111 != v112;
        v104 = v104;
        v105 = v105;
        if (!v113) break;
        int v114 = v104 + v105;
        int v115 = 1;
        int v116 = v105 + v115;
        v104 = v114;
        v105 = v116;
      }
      bool v117 = true;
      v73 = v104;
      break;
    }
    case 1:
      {
      int v118 = 56;
      int v119 = v118 + v61;
      int v120 = v60[v119];
      int v121 = 3;
      int v122 = v61 + v121;
      int v123;
      v123 = v122;
      switch (v120) {
        default:
          {
          int v124 = 60;
          int v125 = v124 + v61;
          int v126 = v60[v125];
          int v127;
          v127 = v61;
          switch (v126) {
            case 0:
              {
              v127 = v61;
              break;
            }
            case 1:
              {
              int v128 = 1;
              int v129 = v61 + v128;
              v127 = v129;
            }
            default:
              {
              int v130 = 3;
              v127 = v130;
              break;
            }
          }
          bool v131 = true;
          v123 = v127;
        }
        case 0:
          {
          int v132 = 0;
          int v133 = 0;
          int v134;
          int v135;
          v134 = v132;
          v135 = v133;
          while (true) {
            int v136 = 4;
            int v137 = v135 * v136;
            int v138 = v137 + v61;
            int v139 = 64;
            int v140 = v139 + v138;
            int v141 = v60[v140];
            int v142 = 0;
            bool v143 = v141 != v142;
            v134 = v134;
            v135 = v135;
            if (!v143) break;
            int v144 = v134 + v135;
            int v145 = 1;
            int v146 = v135 + v145;
            v134 = v144;
            v135 = v146;
          }
          bool v147 = true;
          v123 = v134;
          break;
        }
      }
      bool v148 = true;
      v73 = v123;
      break;
    }
  }
  bool v149 = true;
  int v150 = 16;
  int v151 = v150 + v61;
  bool v152 = true;
  int v153 = simt_wave_count_bits(v152);
  v59[v151] = v153;
  int v154 = 84;
  int v155 = v154 + v61;
  int v156 = v60[v155];
  int v157 = 0;
  bool v158 = v156 != v157;
  int v159;
  if (v158) {
    int v160 = 88;
    int v161 = v160 + v61;
    int v162 = v60[v161];
    int v163 = 0;
    int v164;
    v164 = v163;
    switch (v162) {
      case 0:
        {
        int v165 = 92;
        int v166 = v165 + v61;
        int v167 = v60[v166];
        int v168 = 0;
        bool v169 = v167 != v168;
        int v170;
        if (v169) {
          int v171 = 1;
          v170 = v171;
        } else {
          int v172 = 2;
          int v173 = v61 + v172;
          v170 = v173;
        }
        v164 = v170;
        break;
      }
      default:
        {
        int v174 = 0;
        int v175 = 0;
        int v176;
        int v177;
        v176 = v174;
        v177 = v175;
        while (true) {
          int v178 = 4;
          int v179 = v177 * v178;
          int v180 = v179 + v61;
          int v181 = 96;
          int v182 = v181 + v180;
          int v183 = v60[v182];
          int v184 = 0;
          bool v185 = v183 != v184;
          v176 = v176;
          v177 = v177;
          if (!v185) break;
          int v186 = v176 + v177;
          int v187 = 1;
          int v188 = v177 + v187;
          v176 = v186;
          v177 = v188;
          continue;
          ;
        }
        bool v189 = true;
        v164 = v176;
        break;
      }
    }
    bool v190 = true;
    v159 = v164;
  } else {
    int v191 = 116;
    int v192 = v191 + v61;
    int v193 = v60[v192];
    int v194;
    v194 = v61;
    switch (v193) {
      case 0:
        {
        int v195 = 0;
        int v196 = 0;
        int v197;
        int v198;
        v197 = v195;
        v198 = v196;
        while (true) {
          int v199 = 4;
          int v200 = v198 * v199;
          int v201 = v200 + v61;
          int v202 = 120;
          int v203 = v202 + v201;
          int v204 = v60[v203];
          int v205 = 0;
          bool v206 = v204 != v205;
          v197 = v197;
          v198 = v198;
          if (!v206) break;
          int v207 = v197 + v198;
          int v208 = 1;
          int v209 = v198 + v208;
          v197 = v207;
          v198 = v209;
        }
        bool v210 = true;
        v194 = v197;
      }
      default:
        {
        int v211 = 140;
        int v212 = v211 + v61;
        int v213 = v60[v212];
        int v214;
        v214 = v61;
        switch (v213) {
          default:
            {
            int v215 = 1;
            int v216 = v61 + v215;
            v214 = v216;
          }
          case 0:
            {
            int v217 = 4;
            v214 = v217;
            break;
          }
          case 1:
            {
            int v218 = 3;
            int v219 = v61 + v218;
            v214 = v219;
          }
          case 2:
            {
            int v220 = 2;
            v214 = v220;
            break;
          }
        }
        bool v221 = true;
        v194 = v214;
        break;
      }
      case 1:
        {
        v194 = v61;
        break;
      }
    }
    bool v222 = true;
    v159 = v194;
  }
  int v223 = 32;
  int v224 = v223 + v61;
  bool v225 = true;
  int v226 = simt_wave_count_bits(v225);
  v59[v224] = v226;
  int v227 = 3;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
