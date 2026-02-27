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
    int v15 = 1;
    int v16 = v0 + v15;
    int v17;
    v17 = v16;
    switch (v14) {
      case 0:
        {
        int v18 = 2;
        int v19 = v3 % v18;
        int v20 = 0;
        int v21 = v0 + v20;
        int v22;
        v22 = v21;
        switch (v19) {
          case 0:
            {
            int v23 = 4;
            v22 = v23;
            break;
          }
          default:
            {
            v22 = v0;
            break;
          }
        }
        int v24 = 0;
        int v25 = v0 + v24;
        v17 = v22;
      }
      case 1:
        {
        int v26 = 2;
        int v27 = v3 % v26;
        int v28 = 2;
        int v29;
        v29 = v28;
        switch (v27) {
          case 0:
            {
            int v30 = 4;
            v29 = v30;
            break;
          }
          default:
            {
            int v31 = 2;
            int v32 = v0 + v31;
            v29 = v32;
            break;
          }
          case 1:
            {
            v29 = v0;
            break;
          }
        }
        v17 = v29;
        break;
      }
      case 2:
        {
        int v33 = 2;
        int v34 = v3 % v33;
        int v35;
        v35 = v0;
        switch (v34) {
          default:
            {
            int v36 = 4;
            int v37 = v0 + v36;
            v35 = v37;
            break;
          }
          case 0:
            {
            v35 = v0;
            break;
          }
          case 1:
            {
            int v38 = 1;
            v35 = v38;
            break;
          }
        }
        v17 = v35;
        break;
      }
      default:
        {
        int v39 = 2;
        int v40 = v3 % v39;
        int v41 = 1;
        int v42;
        v42 = v41;
        switch (v40) {
          default:
            {
            int v43 = 0;
            v42 = v43;
            break;
          }
          case 0:
            {
            int v44 = 2;
            int v45 = v0 + v44;
            v42 = v45;
            break;
          }
        }
        v17 = v42;
        break;
      }
    }
    bool v46 = true;
    int v47 = simt_wave_count_bits(v46);
    int v48 = 0;
    int v49 = 4;
    int v50 = v7 * v49;
    int v51 = v48 + v50;
    int v52 = v51 + v0;
    v1[v52] = v47;
    int v53 = 1;
    int v54 = v7 + v53;
    v6 = v17;
    v7 = v54;
    continue;
    ;
  }
  return;
}

kernel void kernel_main(device int* v55 [[buffer(0)]], device int* v56 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v57 = static_cast<int>(__simt_tid3.x);
  int v58 = 0;
  int v59 = v58 + v57;
  int v60 = v56[v59];
  int v61 = 4;
  int v62 = v61 + v57;
  int v63 = v56[v62];
  int v64 = 0;
  bool v65 = v60 != v64;
  if (v65) {
    int v66 = 8;
    int v67 = v66 + v57;
    int v68 = v56[v67];
    int v69 = 0;
    bool v70 = v68 != v69;
    if (v70) {
    } else {
      helper0(v57, v55, v60, v63, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v71 = 12;
  int v72 = v71 + v57;
  int v73 = v56[v72];
  uint v74 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v75 = (int)(v74);
  int v76;
  v76 = v75;
  switch (v73) {
    case 0:
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
        int v83 = v82 + v57;
        int v84 = 16;
        int v85 = v84 + v83;
        int v86 = v56[v85];
        int v87 = 0;
        bool v88 = v86 != v87;
        v79 = v79;
        v80 = v80;
        if (!v88) break;
        int v89 = v79 + v80;
        int v90 = 1;
        int v91 = v80 + v90;
        bool v92 = true;
        v79 = v89;
        v80 = v91;
      }
      v76 = v79;
      break;
    }
    default:
      {
      int v93 = 36;
      int v94 = v93 + v57;
      int v95 = v56[v94];
      int v96 = 4;
      int v97;
      v97 = v96;
      switch (v95) {
        case 0:
          {
          int v98 = 40;
          int v99 = v98 + v57;
          int v100 = v56[v99];
          int v101 = 0;
          bool v102 = v100 != v101;
          int v103;
          if (v102) {
            int v104 = 2;
            int v105 = v57 + v104;
            v103 = v105;
          } else {
            int v106 = 1;
            v103 = v106;
          }
          v97 = v103;
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
            int v113 = v112 + v57;
            int v114 = 44;
            int v115 = v114 + v113;
            int v116 = v56[v115];
            int v117 = 0;
            bool v118 = v116 != v117;
            v109 = v109;
            v110 = v110;
            if (!v118) break;
            int v119 = v109 + v110;
            int v120 = 1;
            int v121 = v110 + v120;
            bool v122 = true;
            v109 = v119;
            v110 = v121;
            break;
            ;
          }
          v97 = v109;
          break;
        }
        default:
          {
          int v123 = 64;
          int v124 = v123 + v57;
          int v125 = v56[v124];
          int v126 = 0;
          bool v127 = v125 != v126;
          int v128;
          if (v127) {
            v128 = v57;
          } else {
            int v129 = 4;
            v128 = v129;
          }
          v97 = v128;
          break;
        }
        case 2:
          {
          int v130 = 68;
          int v131 = v130 + v57;
          int v132 = v56[v131];
          int v133 = 0;
          bool v134 = v132 != v133;
          int v135;
          if (v134) {
            v135 = v57;
          } else {
            v135 = v57;
          }
          v97 = v135;
          break;
        }
      }
      bool v136 = true;
      v76 = v97;
      break;
    }
  }
  int v137 = 0;
  int v138 = 0;
  int v139;
  int v140;
  v139 = v137;
  v140 = v138;
  while (true) {
    int v141 = 4;
    int v142 = v140 * v141;
    int v143 = v142 + v57;
    int v144 = 72;
    int v145 = v144 + v143;
    int v146 = v56[v145];
    int v147 = 0;
    bool v148 = v146 != v147;
    v139 = v139;
    v140 = v140;
    if (!v148) break;
    int v149 = 92;
    int v150 = v149 + v57;
    int v151 = v56[v150];
    int v152;
    v152 = v57;
    switch (v151) {
      case 0:
        {
        int v153 = 96;
        int v154 = v153 + v57;
        int v155 = v56[v154];
        int v156;
        v156 = v57;
        switch (v155) {
          default:
            {
            v156 = v57;
            break;
          }
          case 0:
            {
            int v157 = 3;
            int v158 = v57 + v157;
            v156 = v158;
            break;
          }
          case 1:
            {
            int v159 = 2;
            v156 = v159;
            break;
          }
        }
        v152 = v156;
        break;
      }
      case 1:
        {
        v152 = v57;
        break;
      }
      default:
        {
        int v160 = 3;
        v152 = v160;
        break;
      }
    }
    int v161 = v139 + v152;
    int v162 = 1;
    int v163 = v140 + v162;
    bool v164 = true;
    int v165 = 16;
    int v166 = 4;
    int v167 = v140 * v166;
    int v168 = v165 + v167;
    int v169 = v168 + v57;
    bool v170 = true;
    int v171 = simt_wave_count_bits(v170);
    v55[v169] = v171;
    v139 = v161;
    v140 = v163;
    continue;
    ;
  }
  int v172 = 100;
  int v173 = v172 + v57;
  int v174 = v56[v173];
  int v175 = 2;
  int v176 = v57 + v175;
  int v177;
  v177 = v176;
  switch (v174) {
    case 0:
      {
      int v178 = 4;
      int v179 = v57 + v178;
      v177 = v179;
      break;
    }
    default:
      {
      int v180 = 104;
      int v181 = v180 + v57;
      int v182 = v56[v181];
      int v183 = 0;
      bool v184 = v182 != v183;
      int v185;
      if (v184) {
        int v186 = 108;
        int v187 = v186 + v57;
        int v188 = v56[v187];
        int v189 = 2;
        int v190;
        v190 = v189;
        switch (v188) {
          case 0:
            {
            v190 = v57;
            break;
          }
          case 1:
            {
            int v191 = 2;
            int v192 = v57 + v191;
            v190 = v192;
          }
          case 2:
            {
            v190 = v57;
            break;
          }
          default:
            {
            v190 = v57;
            break;
          }
        }
        v185 = v190;
      } else {
        int v193 = 0;
        v185 = v193;
      }
      v177 = v185;
      break;
    }
    case 1:
      {
      int v194 = 112;
      int v195 = v194 + v57;
      int v196 = v56[v195];
      int v197;
      v197 = v57;
      switch (v196) {
        default:
          {
          int v198 = 0;
          int v199 = 0;
          int v200;
          int v201;
          v200 = v198;
          v201 = v199;
          while (true) {
            int v202 = 4;
            int v203 = v201 * v202;
            int v204 = v203 + v57;
            int v205 = 116;
            int v206 = v205 + v204;
            int v207 = v56[v206];
            int v208 = 0;
            bool v209 = v207 != v208;
            v200 = v200;
            v201 = v201;
            if (!v209) break;
            int v210 = v200 + v201;
            int v211 = 1;
            int v212 = v201 + v211;
            bool v213 = true;
            v200 = v210;
            v201 = v212;
            continue;
            ;
          }
          v197 = v200;
          break;
        }
        case 0:
          {
          int v214 = 136;
          int v215 = v214 + v57;
          int v216 = v56[v215];
          int v217 = 0;
          bool v218 = v216 != v217;
          int v219;
          if (v218) {
            v219 = v57;
          } else {
            int v220 = 3;
            int v221 = v57 + v220;
            v219 = v221;
          }
          v197 = v219;
          break;
        }
      }
      v177 = v197;
      break;
    }
    case 2:
      {
      int v222 = 4;
      int v223 = v57 + v222;
      v177 = v223;
      break;
    }
  }
  bool v224 = true;
  int v225 = 32;
  int v226 = v225 + v57;
  bool v227 = true;
  int v228 = simt_wave_count_bits(v227);
  v55[v226] = v228;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 140; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
