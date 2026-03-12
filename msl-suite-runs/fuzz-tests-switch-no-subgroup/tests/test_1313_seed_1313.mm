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
  int v5 = v3 % v4;
  int v6 = 1;
  int v7;
  v7 = v6;
  switch (v5) {
    default:
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
          int v20 = 2;
          int v21 = v0 + v20;
          int v22 = 1;
          int v23 = v14 + v22;
          v13 = v21;
          v14 = v23;
        }
        v10 = v13;
      } else {
        int v24 = 0;
        bool v25 = v2 != v24;
        int v26;
        if (v25) {
          int v27 = 3;
          int v28 = v0 + v27;
          v26 = v28;
        } else {
          int v29 = 4;
          int v30 = v0 + v29;
          v26 = v30;
        }
        v10 = v26;
      }
      v7 = v10;
      break;
    }
    case 0:
      {
      int v31 = 0;
      int v32 = 0;
      int v33;
      int v34;
      v33 = v31;
      v34 = v32;
      while (true) {
        int v35 = 4;
        int v36 = v3 % v35;
        int v37 = 1;
        int v38 = v36 + v37;
        bool v39 = v34 < v38;
        v33 = v33;
        v34 = v34;
        if (!v39) break;
        int v40 = 0;
        int v41 = 0;
        int v42;
        int v43;
        v42 = v40;
        v43 = v41;
        while (true) {
          int v44 = 4;
          int v45 = v3 % v44;
          int v46 = 1;
          int v47 = v45 + v46;
          bool v48 = v43 < v47;
          v42 = v42;
          v43 = v43;
          if (!v48) break;
          int v49 = 3;
          int v50 = 1;
          int v51 = v43 + v50;
          v42 = v49;
          v43 = v51;
        }
        int v52 = 1;
        int v53 = v34 + v52;
        v33 = v42;
        v34 = v53;
      }
      v7 = v33;
      break;
    }
    case 1:
      {
      int v54 = 2;
      v7 = v54;
      break;
    }
    case 2:
      {
      int v55 = 0;
      bool v56 = v2 != v55;
      int v57;
      if (v56) {
        int v58 = 0;
        int v59 = 0;
        int v60;
        int v61;
        v60 = v58;
        v61 = v59;
        while (true) {
          int v62 = 4;
          int v63 = v3 % v62;
          int v64 = 1;
          int v65 = v63 + v64;
          bool v66 = v61 < v65;
          v60 = v60;
          v61 = v61;
          if (!v66) break;
          int v67 = 4;
          int v68 = v0 + v67;
          int v69 = 1;
          int v70 = v61 + v69;
          v60 = v68;
          v61 = v70;
        }
        v57 = v60;
      } else {
        int v71 = 1;
        int v72 = v0 + v71;
        v57 = v72;
      }
      v7 = v57;
      break;
    }
  }
  bool v73 = true;
  int v74 = simt_wave_count_bits(v73);
  int v75 = 0;
  int v76 = v75 + v0;
  v1[v76] = v74;
  return;
}

kernel void kernel_main(device int* v77 [[buffer(0)]], device int* v78 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v79 = static_cast<int>(__simt_tid3.x);
  int v80 = 0;
  int v81 = v80 + v79;
  int v82 = v78[v81];
  int v83 = 4;
  int v84 = v83 + v79;
  int v85 = v78[v84];
  helper0(v79, v77, v82, v85, static_cast<int>(__simt_tid3.x));
  int v86 = 8;
  int v87 = v86 + v79;
  int v88 = v78[v87];
  uint v89 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v90 = (int)(v89);
  int v91;
  v91 = v90;
  switch (v88) {
    case 0:
      {
      v91 = v79;
      break;
    }
    default:
      {
      int v92 = 12;
      int v93 = v92 + v79;
      int v94 = v78[v93];
      int v95 = 0;
      bool v96 = v94 != v95;
      int v97;
      if (v96) {
        int v98 = 0;
        int v99 = 0;
        int v100;
        int v101;
        v100 = v98;
        v101 = v99;
        while (true) {
          int v102 = 4;
          int v103 = v101 * v102;
          int v104 = v103 + v79;
          int v105 = 16;
          int v106 = v105 + v104;
          int v107 = v78[v106];
          int v108 = 0;
          bool v109 = v107 != v108;
          v100 = v100;
          v101 = v101;
          if (!v109) break;
          int v110 = v100 + v101;
          int v111 = 1;
          int v112 = v101 + v111;
          bool v113 = true;
          v100 = v110;
          v101 = v112;
          continue;
          ;
        }
        v97 = v100;
      } else {
        int v114 = 36;
        int v115 = v114 + v79;
        int v116 = v78[v115];
        int v117 = 0;
        bool v118 = v116 != v117;
        int v119;
        if (v118) {
          int v120 = 1;
          v119 = v120;
        } else {
          int v121 = 0;
          v119 = v121;
        }
        v97 = v119;
      }
      v91 = v97;
      break;
    }
    case 1:
      {
      int v122 = 0;
      int v123 = 0;
      int v124;
      int v125;
      v124 = v122;
      v125 = v123;
      while (true) {
        int v126 = 4;
        int v127 = v125 * v126;
        int v128 = v127 + v79;
        int v129 = 40;
        int v130 = v129 + v128;
        int v131 = v78[v130];
        int v132 = 0;
        bool v133 = v131 != v132;
        v124 = v124;
        v125 = v125;
        if (!v133) break;
        int v134 = 60;
        int v135 = v134 + v79;
        int v136 = v78[v135];
        int v137 = 1;
        int v138 = v79 + v137;
        int v139;
        v139 = v138;
        switch (v136) {
          case 0:
            {
            int v140 = 3;
            int v141 = v79 + v140;
            v139 = v141;
          }
          default:
            {
            int v142 = 2;
            int v143 = v79 + v142;
            v139 = v143;
          }
          case 1:
            {
            int v144 = 2;
            int v145 = v79 + v144;
            v139 = v145;
            break;
          }
        }
        int v146 = v124 + v139;
        int v147 = 1;
        int v148 = v125 + v147;
        bool v149 = true;
        v124 = v146;
        v125 = v148;
      }
      v91 = v124;
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
        int v156 = v155 + v79;
        int v157 = 64;
        int v158 = v157 + v156;
        int v159 = v78[v158];
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
        break;
        ;
      }
      v91 = v152;
      break;
    }
  }
  int v166 = 84;
  int v167 = v166 + v79;
  int v168 = v78[v167];
  int v169;
  v169 = v79;
  switch (v168) {
    case 0:
      {
      int v170 = 3;
      v169 = v170;
      break;
    }
    case 1:
      {
      int v171 = 0;
      int v172 = 0;
      int v173;
      int v174;
      v173 = v171;
      v174 = v172;
      while (true) {
        int v175 = 4;
        int v176 = v174 * v175;
        int v177 = v176 + v79;
        int v178 = 88;
        int v179 = v178 + v177;
        int v180 = v78[v179];
        int v181 = 0;
        bool v182 = v180 != v181;
        v173 = v173;
        v174 = v174;
        if (!v182) break;
        int v183 = 0;
        int v184 = 0;
        int v185;
        int v186;
        v185 = v183;
        v186 = v184;
        while (true) {
          int v187 = 4;
          int v188 = v186 * v187;
          int v189 = v188 + v79;
          int v190 = 108;
          int v191 = v190 + v189;
          int v192 = v78[v191];
          int v193 = 0;
          bool v194 = v192 != v193;
          v185 = v185;
          v186 = v186;
          if (!v194) break;
          int v195 = v185 + v186;
          int v196 = 1;
          int v197 = v186 + v196;
          bool v198 = true;
          v185 = v195;
          v186 = v197;
          break;
          ;
        }
        int v199 = v173 + v185;
        int v200 = 1;
        int v201 = v174 + v200;
        bool v202 = true;
        v173 = v199;
        v174 = v201;
      }
      v169 = v173;
      break;
    }
    case 2:
      {
      int v203 = 128;
      int v204 = v203 + v79;
      int v205 = v78[v204];
      int v206 = 0;
      bool v207 = v205 != v206;
      int v208;
      if (v207) {
        int v209 = 132;
        int v210 = v209 + v79;
        int v211 = v78[v210];
        int v212 = 0;
        bool v213 = v211 != v212;
        int v214;
        if (v213) {
          int v215 = 0;
          v214 = v215;
        } else {
          int v216 = 3;
          v214 = v216;
        }
        v208 = v214;
      } else {
        int v217 = 1;
        int v218 = v79 + v217;
        v208 = v218;
      }
      v169 = v208;
    }
    default:
      {
      int v219 = 136;
      int v220 = v219 + v79;
      int v221 = v78[v220];
      int v222 = 0;
      bool v223 = v221 != v222;
      int v224;
      if (v223) {
        int v225 = 140;
        int v226 = v225 + v79;
        int v227 = v78[v226];
        int v228;
        v228 = v79;
        switch (v227) {
          case 0:
            {
            int v229 = 0;
            int v230 = v79 + v229;
            v228 = v230;
            break;
          }
          case 1:
            {
            int v231 = 3;
            int v232 = v79 + v231;
            v228 = v232;
            break;
          }
          case 2:
            {
            int v233 = 1;
            v228 = v233;
            break;
          }
          default:
            {
            int v234 = 3;
            int v235 = v79 + v234;
            v228 = v235;
            break;
          }
        }
        v224 = v228;
      } else {
        int v236 = 0;
        int v237 = 0;
        int v238;
        int v239;
        v238 = v236;
        v239 = v237;
        while (true) {
          int v240 = 4;
          int v241 = v239 * v240;
          int v242 = v241 + v79;
          int v243 = 144;
          int v244 = v243 + v242;
          int v245 = v78[v244];
          int v246 = 0;
          bool v247 = v245 != v246;
          v238 = v238;
          v239 = v239;
          if (!v247) break;
          int v248 = v238 + v239;
          int v249 = 1;
          int v250 = v239 + v249;
          bool v251 = true;
          v238 = v248;
          v239 = v250;
          continue;
          ;
        }
        v224 = v238;
      }
      v169 = v224;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 164; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
