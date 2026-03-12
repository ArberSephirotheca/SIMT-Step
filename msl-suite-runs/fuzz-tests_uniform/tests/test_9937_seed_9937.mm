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
  int v4 = 4;
  int v5 = 0;
  bool v6 = v2 != v5;
  int v7;
  if (v6) {
    int v8 = 3;
    v7 = v8;
  } else {
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
      uint v18 = simt_lane_id(__simt_tid);
      int v19 = (int)(v18);
      int v20 = 1;
      int v21 = v12 + v20;
      v11 = v19;
      v12 = v21;
      break;
      ;
    }
    int v22 = 3;
    v7 = v11;
  }
  bool v23 = true;
  int v24 = simt_wave_count_bits(v23);
  int v25 = 0;
  int v26 = v25 + v0;
  v1[v26] = v24;
  int v27 = 0;
  bool v28 = v2 != v27;
  int v29 = v28 ? v4 : v7;
  int v30 = 4;
  int v31 = v3 % v30;
  uint v32 = simt_subgroup_id(__simt_tid);
  int v33 = (int)(v32);
  int v34;
  v34 = v33;
  switch (v31) {
    case 0:
      {
      int v35 = 4;
      int v36 = v0 + v35;
      v34 = v36;
      break;
    }
    case 1:
      {
      int v37 = 0;
      int v38 = 0;
      int v39;
      int v40;
      v39 = v37;
      v40 = v38;
      while (true) {
        int v41 = 4;
        int v42 = v3 % v41;
        int v43 = 1;
        int v44 = v42 + v43;
        bool v45 = v40 < v44;
        v39 = v39;
        v40 = v40;
        if (!v45) break;
        int v46 = 0;
        bool v47 = v2 != v46;
        int v48;
        if (v47) {
          int v49 = 1;
          int v50 = v0 + v49;
          v48 = v50;
        } else {
          int v51 = 3;
          v48 = v51;
        }
        int v52 = 0;
        int v53 = 1;
        int v54 = v40 + v53;
        v39 = v48;
        v40 = v54;
      }
      int v55 = 0;
      v34 = v39;
      break;
    }
    case 2:
      {
      int v56 = 0;
      int v57 = 0;
      int v58;
      int v59;
      v58 = v56;
      v59 = v57;
      while (true) {
        int v60 = 4;
        int v61 = v3 % v60;
        int v62 = 1;
        int v63 = v61 + v62;
        bool v64 = v59 < v63;
        v58 = v58;
        v59 = v59;
        if (!v64) break;
        int v65 = 0;
        bool v66 = v2 != v65;
        int v67;
        if (v66) {
          v67 = v0;
        } else {
          int v68 = 0;
          int v69 = v0 + v68;
          v67 = v69;
        }
        int v70 = 3;
        int v71 = 1;
        int v72 = v59 + v71;
        v58 = v67;
        v59 = v72;
      }
      int v73 = 4;
      int v74 = v0 + v73;
      v34 = v58;
      break;
    }
    default:
      {
      v34 = v0;
      break;
    }
  }
  bool v75 = true;
  int v76 = simt_wave_count_bits(v75);
  int v77 = 16;
  int v78 = v77 + v0;
  v1[v78] = v76;
  int v79 = 0;
  bool v80 = v2 != v79;
  int v81 = v80 ? v29 : v34;
  return;
}

kernel void kernel_main(device int* v82 [[buffer(0)]], device int* v83 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v84 = static_cast<int>(__simt_tid3.x);
  int v85 = 0;
  int v86 = v85 + v84;
  int v87 = v83[v86];
  int v88 = 4;
  int v89 = v88 + v84;
  int v90 = v83[v89];
  helper0(v84, v82, v87, v90, static_cast<int>(__simt_tid3.x));
  int v91 = 8;
  int v92 = v91 + v84;
  int v93 = v83[v92];
  uint v94 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v95 = (int)(v94);
  int v96;
  v96 = v95;
  switch (v93) {
    case 0:
      {
      int v97 = 12;
      int v98 = v97 + v84;
      int v99 = v83[v98];
      int v100 = 0;
      bool v101 = v99 != v100;
      int v102;
      if (v101) {
        int v103 = 16;
        int v104 = v103 + v84;
        int v105 = v83[v104];
        int v106 = 0;
        bool v107 = v105 != v106;
        int v108;
        if (v107) {
          int v109 = 4;
          int v110 = v84 + v109;
          v108 = v110;
        } else {
          v108 = v84;
        }
        v102 = v108;
      } else {
        int v111 = 20;
        int v112 = v111 + v84;
        int v113 = v83[v112];
        int v114 = 0;
        bool v115 = v113 != v114;
        int v116;
        if (v115) {
          v116 = v84;
        } else {
          v116 = v84;
        }
        v102 = v116;
      }
      v96 = v102;
      break;
    }
    default:
      {
      int v117 = 24;
      int v118 = v117 + v84;
      int v119 = v83[v118];
      int v120 = 0;
      bool v121 = v119 != v120;
      int v122;
      if (v121) {
        int v123 = 0;
        int v124 = 0;
        int v125;
        int v126;
        v125 = v123;
        v126 = v124;
        while (true) {
          int v127 = 4;
          int v128 = v126 * v127;
          int v129 = v128 + v84;
          int v130 = 28;
          int v131 = v130 + v129;
          int v132 = v83[v131];
          int v133 = 0;
          bool v134 = v132 != v133;
          v125 = v125;
          v126 = v126;
          if (!v134) break;
          int v135 = v125 + v126;
          int v136 = 1;
          int v137 = v126 + v136;
          v125 = v135;
          v126 = v137;
        }
        bool v138 = true;
        v122 = v125;
      } else {
        int v139 = 0;
        int v140 = 0;
        int v141;
        int v142;
        v141 = v139;
        v142 = v140;
        while (true) {
          int v143 = 4;
          int v144 = v142 * v143;
          int v145 = v144 + v84;
          int v146 = 48;
          int v147 = v146 + v145;
          int v148 = v83[v147];
          int v149 = 0;
          bool v150 = v148 != v149;
          v141 = v141;
          v142 = v142;
          if (!v150) break;
          int v151 = v141 + v142;
          int v152 = 1;
          int v153 = v142 + v152;
          v141 = v151;
          v142 = v153;
        }
        bool v154 = true;
        v122 = v141;
      }
      v96 = v122;
      break;
    }
    case 1:
      {
      v96 = v84;
      break;
    }
    case 2:
      {
      int v155 = 0;
      int v156 = 0;
      int v157;
      int v158;
      v157 = v155;
      v158 = v156;
      while (true) {
        int v159 = 4;
        int v160 = v158 * v159;
        int v161 = v160 + v84;
        int v162 = 68;
        int v163 = v162 + v161;
        int v164 = v83[v163];
        int v165 = 0;
        bool v166 = v164 != v165;
        v157 = v157;
        v158 = v158;
        if (!v166) break;
        int v167 = 3;
        int v168 = v84 + v167;
        int v169 = v157 + v168;
        int v170 = 1;
        int v171 = v158 + v170;
        v157 = v169;
        v158 = v171;
      }
      bool v172 = true;
      v96 = v157;
      break;
    }
  }
  bool v173 = true;
  int v174 = 32;
  int v175 = v174 + v84;
  bool v176 = true;
  int v177 = simt_wave_count_bits(v176);
  v82[v175] = v177;
  int v178 = 88;
  int v179 = v178 + v84;
  int v180 = v83[v179];
  int v181 = 0;
  bool v182 = v180 != v181;
  int v183;
  if (v182) {
    int v184 = 92;
    int v185 = v184 + v84;
    int v186 = v83[v185];
    uint v187 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v188 = (int)(v187);
    int v189;
    v189 = v188;
    switch (v186) {
      case 0:
        {
        int v190 = 0;
        int v191 = 0;
        int v192;
        int v193;
        v192 = v190;
        v193 = v191;
        while (true) {
          int v194 = 4;
          int v195 = v193 * v194;
          int v196 = v195 + v84;
          int v197 = 96;
          int v198 = v197 + v196;
          int v199 = v83[v198];
          int v200 = 0;
          bool v201 = v199 != v200;
          v192 = v192;
          v193 = v193;
          if (!v201) break;
          int v202 = v192 + v193;
          int v203 = 1;
          int v204 = v193 + v203;
          v192 = v202;
          v193 = v204;
          continue;
          ;
        }
        bool v205 = true;
        v189 = v192;
        break;
      }
      default:
        {
        int v206 = 116;
        int v207 = v206 + v84;
        int v208 = v83[v207];
        int v209 = 4;
        int v210 = v84 + v209;
        int v211;
        v211 = v210;
        switch (v208) {
          case 0:
            {
            int v212 = 2;
            v211 = v212;
            break;
          }
          case 1:
            {
            int v213 = 4;
            int v214 = v84 + v213;
            v211 = v214;
            break;
          }
          default:
            {
            int v215 = 3;
            int v216 = v84 + v215;
            v211 = v216;
            break;
          }
        }
        bool v217 = true;
        v189 = v211;
        break;
      }
      case 1:
        {
        int v218 = 120;
        int v219 = v218 + v84;
        int v220 = v83[v219];
        int v221 = 0;
        bool v222 = v220 != v221;
        int v223;
        if (v222) {
          v223 = v84;
        } else {
          int v224 = 3;
          int v225 = v84 + v224;
          v223 = v225;
        }
        v189 = v223;
        break;
      }
    }
    bool v226 = true;
    v183 = v189;
  } else {
    int v227 = 0;
    int v228 = 0;
    int v229;
    int v230;
    v229 = v227;
    v230 = v228;
    while (true) {
      int v231 = 4;
      int v232 = v230 * v231;
      int v233 = v232 + v84;
      int v234 = 124;
      int v235 = v234 + v233;
      int v236 = v83[v235];
      int v237 = 0;
      bool v238 = v236 != v237;
      v229 = v229;
      v230 = v230;
      if (!v238) break;
      int v239 = v229 + v230;
      int v240 = 1;
      int v241 = v230 + v240;
      v229 = v239;
      v230 = v241;
    }
    bool v242 = true;
    v183 = v229;
  }
  int v243 = 48;
  int v244 = v243 + v84;
  bool v245 = true;
  int v246 = simt_wave_count_bits(v245);
  v82[v244] = v246;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
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
