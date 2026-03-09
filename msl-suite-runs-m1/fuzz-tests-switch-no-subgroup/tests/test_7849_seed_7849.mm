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
    bool v17 = true;
    int v18 = simt_wave_count_bits(v17);
    int v19 = 16;
    int v20 = 4;
    int v21 = v11 * v20;
    int v22 = v19 + v21;
    int v23 = v22 + v0;
    v1[v23] = v18;
    int v24 = 1;
    int v25 = v11 + v24;
    v10 = v18;
    v11 = v25;
  }
  int v26 = 0;
  bool v27 = v2 != v26;
  int v28 = v27 ? v5 : v10;
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
    int v38 = 2;
    int v39 = v3 % v38;
    int v40;
    v40 = v0;
    switch (v39) {
      case 0:
        {
        int v41 = 0;
        int v42 = v0 + v41;
        v40 = v42;
      }
      default:
        {
        int v43 = 0;
        bool v44 = v2 != v43;
        int v45;
        if (v44) {
          int v46 = 4;
          int v47 = v0 + v46;
          v45 = v47;
        } else {
          v45 = v0;
        }
        v40 = v45;
      }
      case 1:
        {
        int v48 = 3;
        int v49 = v3 % v48;
        int v50 = 1;
        int v51;
        v51 = v50;
        switch (v49) {
          case 0:
            {
            int v52 = 4;
            v51 = v52;
          }
          default:
            {
            v51 = v0;
            break;
          }
          case 1:
            {
            int v53 = 4;
            v51 = v53;
            break;
          }
          case 2:
            {
            v51 = v0;
            break;
          }
        }
        v40 = v51;
        break;
      }
    }
    bool v54 = true;
    int v55 = simt_wave_count_bits(v54);
    int v56 = 32;
    int v57 = 4;
    int v58 = v32 * v57;
    int v59 = v56 + v58;
    int v60 = v59 + v0;
    v1[v60] = v55;
    int v61 = 1;
    int v62 = v32 + v61;
    v31 = v40;
    v32 = v62;
  }
  int v63 = 0;
  bool v64 = v2 != v63;
  int v65 = v64 ? v28 : v31;
  return;
}

kernel void kernel_main(device int* v66 [[buffer(0)]], device int* v67 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v68 = static_cast<int>(__simt_tid3.x);
  int v69 = 0;
  int v70 = v69 + v68;
  int v71 = v67[v70];
  int v72 = 4;
  int v73 = v72 + v68;
  int v74 = v67[v73];
  int v75 = 0;
  bool v76 = v71 != v75;
  if (v76) {
  } else {
    int v77 = 8;
    int v78 = v77 + v68;
    int v79 = v67[v78];
    int v80 = 0;
    bool v81 = v79 != v80;
    if (v81) {
    } else {
      helper0(v68, v66, v71, v74, static_cast<int>(__simt_tid3.x));
    }
  }
  int v82 = 12;
  int v83 = v82 + v68;
  int v84 = v67[v83];
  uint v85 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v86 = (int)(v85);
  int v87;
  v87 = v86;
  switch (v84) {
    case 0:
      {
      int v88 = 16;
      int v89 = v88 + v68;
      int v90 = v67[v89];
      int v91;
      v91 = v68;
      switch (v90) {
        case 0:
          {
          int v92 = 20;
          int v93 = v92 + v68;
          int v94 = v67[v93];
          int v95 = 0;
          bool v96 = v94 != v95;
          int v97;
          if (v96) {
            v97 = v68;
          } else {
            int v98 = 1;
            v97 = v98;
          }
          v91 = v97;
          break;
        }
        case 1:
          {
          int v99 = 24;
          int v100 = v99 + v68;
          int v101 = v67[v100];
          int v102 = 0;
          bool v103 = v101 != v102;
          int v104;
          if (v103) {
            v104 = v68;
          } else {
            int v105 = 0;
            int v106 = v68 + v105;
            v104 = v106;
          }
          v91 = v104;
          break;
        }
        default:
          {
          v91 = v68;
          break;
        }
        case 2:
          {
          int v107 = 3;
          v91 = v107;
          break;
        }
      }
      v87 = v91;
    }
    default:
      {
      int v108 = 28;
      int v109 = v108 + v68;
      int v110 = v67[v109];
      int v111;
      v111 = v68;
      switch (v110) {
        case 0:
          {
          int v112 = 0;
          int v113 = 0;
          int v114;
          int v115;
          v114 = v112;
          v115 = v113;
          while (true) {
            int v116 = 4;
            int v117 = v115 * v116;
            int v118 = v117 + v68;
            int v119 = 32;
            int v120 = v119 + v118;
            int v121 = v67[v120];
            int v122 = 0;
            bool v123 = v121 != v122;
            v114 = v114;
            v115 = v115;
            if (!v123) break;
            int v124 = v114 + v115;
            int v125 = 1;
            int v126 = v115 + v125;
            bool v127 = true;
            v114 = v124;
            v115 = v126;
          }
          v111 = v114;
        }
        default:
          {
          int v128 = 0;
          int v129 = 0;
          int v130;
          int v131;
          v130 = v128;
          v131 = v129;
          while (true) {
            int v132 = 4;
            int v133 = v131 * v132;
            int v134 = v133 + v68;
            int v135 = 52;
            int v136 = v135 + v134;
            int v137 = v67[v136];
            int v138 = 0;
            bool v139 = v137 != v138;
            v130 = v130;
            v131 = v131;
            if (!v139) break;
            int v140 = v130 + v131;
            int v141 = 1;
            int v142 = v131 + v141;
            bool v143 = true;
            v130 = v140;
            v131 = v142;
          }
          v111 = v130;
          break;
        }
      }
      v87 = v111;
    }
    case 1:
      {
      int v144 = 72;
      int v145 = v144 + v68;
      int v146 = v67[v145];
      int v147 = 0;
      bool v148 = v146 != v147;
      int v149;
      if (v148) {
        int v150 = 76;
        int v151 = v150 + v68;
        int v152 = v67[v151];
        int v153 = 0;
        bool v154 = v152 != v153;
        int v155;
        if (v154) {
          int v156 = 0;
          v155 = v156;
        } else {
          int v157 = 4;
          v155 = v157;
        }
        v149 = v155;
      } else {
        int v158 = 80;
        int v159 = v158 + v68;
        int v160 = v67[v159];
        int v161 = 2;
        int v162;
        v162 = v161;
        switch (v160) {
          default:
            {
            v162 = v68;
            break;
          }
          case 0:
            {
            v162 = v68;
            break;
          }
        }
        bool v163 = true;
        v149 = v162;
      }
      v87 = v149;
      break;
    }
  }
  int v164 = 0;
  int v165 = 0;
  int v166;
  int v167;
  v166 = v164;
  v167 = v165;
  while (true) {
    int v168 = 4;
    int v169 = v167 * v168;
    int v170 = v169 + v68;
    int v171 = 84;
    int v172 = v171 + v170;
    int v173 = v67[v172];
    int v174 = 0;
    bool v175 = v173 != v174;
    v166 = v166;
    v167 = v167;
    if (!v175) break;
    int v176 = 104;
    int v177 = v176 + v68;
    int v178 = v67[v177];
    uint v179 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v180 = (int)(v179);
    int v181;
    v181 = v180;
    switch (v178) {
      default:
        {
        int v182 = 0;
        int v183 = 0;
        int v184;
        int v185;
        v184 = v182;
        v185 = v183;
        while (true) {
          int v186 = 4;
          int v187 = v185 * v186;
          int v188 = v187 + v68;
          int v189 = 108;
          int v190 = v189 + v188;
          int v191 = v67[v190];
          int v192 = 0;
          bool v193 = v191 != v192;
          v184 = v184;
          v185 = v185;
          if (!v193) break;
          int v194 = v184 + v185;
          int v195 = 1;
          int v196 = v185 + v195;
          bool v197 = true;
          v184 = v194;
          v185 = v196;
        }
        v181 = v184;
        break;
      }
      case 0:
        {
        int v198 = 128;
        int v199 = v198 + v68;
        int v200 = v67[v199];
        int v201 = 0;
        bool v202 = v200 != v201;
        int v203;
        if (v202) {
          int v204 = 3;
          int v205 = v68 + v204;
          v203 = v205;
        } else {
          int v206 = 1;
          v203 = v206;
        }
        v181 = v203;
        break;
      }
      case 1:
        {
        int v207 = 132;
        int v208 = v207 + v68;
        int v209 = v67[v208];
        int v210;
        v210 = v68;
        switch (v209) {
          default:
            {
            int v211 = 2;
            int v212 = v68 + v211;
            v210 = v212;
            break;
          }
          case 0:
            {
            int v213 = 0;
            int v214 = v68 + v213;
            v210 = v214;
            break;
          }
        }
        v181 = v210;
        break;
      }
      case 2:
        {
        int v215 = 136;
        int v216 = v215 + v68;
        int v217 = v67[v216];
        int v218 = 1;
        int v219;
        v219 = v218;
        switch (v217) {
          case 0:
            {
            v219 = v68;
            break;
          }
          default:
            {
            int v220 = 3;
            v219 = v220;
            break;
          }
        }
        bool v221 = true;
        v181 = v219;
        break;
      }
    }
    int v222 = v166 + v181;
    int v223 = 1;
    int v224 = v167 + v223;
    bool v225 = true;
    int v226 = 48;
    int v227 = 4;
    int v228 = v167 * v227;
    int v229 = v226 + v228;
    int v230 = v229 + v68;
    bool v231 = true;
    int v232 = simt_wave_count_bits(v231);
    v66[v230] = v232;
    v166 = v222;
    v167 = v224;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 64; ++idx) {
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
