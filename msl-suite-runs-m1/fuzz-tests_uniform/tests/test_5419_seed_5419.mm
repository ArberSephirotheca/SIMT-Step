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
  int v4 = 3;
  int v5 = v3 % v4;
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 3;
      int v8 = v3 % v7;
      int v9;
      v9 = v0;
      switch (v8) {
        case 0:
          {
          int v10 = 0;
          v9 = v10;
          break;
        }
        default:
          {
          int v11 = 0;
          bool v12 = v2 != v11;
          int v13;
          if (v12) {
            v13 = v0;
          } else {
            int v14 = 4;
            int v15 = v0 + v14;
            v13 = v15;
          }
          int v16 = 1;
          v9 = v13;
        }
        case 1:
          {
          int v17 = 0;
          int v18 = 0;
          int v19;
          int v20;
          v19 = v17;
          v20 = v18;
          while (true) {
            int v21 = 4;
            int v22 = v3 % v21;
            int v23 = 1;
            int v24 = v22 + v23;
            bool v25 = v20 < v24;
            v19 = v19;
            v20 = v20;
            if (!v25) break;
            int v26 = 0;
            int v27 = v0 + v26;
            int v28 = 1;
            int v29 = v20 + v28;
            v19 = v27;
            v20 = v29;
          }
          int v30 = 1;
          v9 = v19;
          break;
        }
      }
      v6 = v9;
    }
    case 1:
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
        int v40 = 3;
        int v41 = v0 + v40;
        int v42 = 1;
        int v43 = v34 + v42;
        v33 = v41;
        v34 = v43;
      }
      v6 = v33;
    }
    default:
      {
      int v44 = 3;
      int v45 = v3 % v44;
      int v46 = 3;
      int v47;
      v47 = v46;
      switch (v45) {
        case 0:
          {
          int v48 = 0;
          int v49 = 0;
          int v50;
          int v51;
          v50 = v48;
          v51 = v49;
          while (true) {
            int v52 = 4;
            int v53 = v3 % v52;
            int v54 = 1;
            int v55 = v53 + v54;
            bool v56 = v51 < v55;
            v50 = v50;
            v51 = v51;
            if (!v56) break;
            int v57 = 3;
            int v58 = v0 + v57;
            int v59 = 1;
            int v60 = v51 + v59;
            v50 = v58;
            v51 = v60;
          }
          v47 = v50;
        }
        default:
          {
          int v61 = 0;
          bool v62 = v2 != v61;
          int v63;
          if (v62) {
            int v64 = 0;
            int v65 = v0 + v64;
            v63 = v65;
          } else {
            v63 = v0;
          }
          v47 = v63;
        }
        case 1:
          {
          int v66 = 0;
          int v67 = 0;
          int v68;
          int v69;
          v68 = v66;
          v69 = v67;
          while (true) {
            int v70 = 4;
            int v71 = v3 % v70;
            int v72 = 1;
            int v73 = v71 + v72;
            bool v74 = v69 < v73;
            v68 = v68;
            v69 = v69;
            if (!v74) break;
            int v75 = 1;
            int v76 = v69 + v75;
            v68 = v0;
            v69 = v76;
          }
          v47 = v68;
          break;
        }
      }
      int v77 = 0;
      int v78 = v0 + v77;
      v6 = v47;
      break;
    }
  }
  bool v79 = true;
  int v80 = simt_wave_count_bits(v79);
  int v81 = 0;
  int v82 = v81 + v0;
  v1[v82] = v80;
  return;
}

kernel void kernel_main(device int* v83 [[buffer(0)]], device int* v84 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v85 = static_cast<int>(__simt_tid3.x);
  int v86 = 0;
  int v87 = v86 + v85;
  int v88 = v84[v87];
  int v89 = 4;
  int v90 = v89 + v85;
  int v91 = v84[v90];
  helper0(v85, v83, v88, v91, static_cast<int>(__simt_tid3.x));
  int v92 = 8;
  int v93 = v92 + v85;
  int v94 = v84[v93];
  uint v95 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v96 = (int)(v95);
  int v97;
  v97 = v96;
  switch (v94) {
    case 0:
      {
      int v98 = 12;
      int v99 = v98 + v85;
      int v100 = v84[v99];
      int v101 = 0;
      int v102 = v85 + v101;
      int v103;
      v103 = v102;
      switch (v100) {
        case 0:
          {
          int v104 = 16;
          int v105 = v104 + v85;
          int v106 = v84[v105];
          int v107 = 0;
          bool v108 = v106 != v107;
          int v109;
          if (v108) {
            int v110 = 0;
            v109 = v110;
          } else {
            v109 = v85;
          }
          v103 = v109;
          break;
        }
        case 1:
          {
          int v111 = 20;
          int v112 = v111 + v85;
          int v113 = v84[v112];
          int v114 = 0;
          bool v115 = v113 != v114;
          int v116;
          if (v115) {
            int v117 = 0;
            v116 = v117;
          } else {
            int v118 = 4;
            v116 = v118;
          }
          v103 = v116;
        }
        default:
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
            int v125 = v124 + v85;
            int v126 = 24;
            int v127 = v126 + v125;
            int v128 = v84[v127];
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
          }
          bool v134 = true;
          v103 = v121;
          break;
        }
        case 2:
          {
          v103 = v85;
          break;
        }
      }
      bool v135 = true;
      v97 = v103;
      break;
    }
    default:
      {
      int v136 = 0;
      int v137 = 0;
      int v138;
      int v139;
      v138 = v136;
      v139 = v137;
      while (true) {
        int v140 = 4;
        int v141 = v139 * v140;
        int v142 = v141 + v85;
        int v143 = 44;
        int v144 = v143 + v142;
        int v145 = v84[v144];
        int v146 = 0;
        bool v147 = v145 != v146;
        v138 = v138;
        v139 = v139;
        if (!v147) break;
        int v148 = 2;
        int v149 = v138 + v148;
        int v150 = 1;
        int v151 = v139 + v150;
        v138 = v149;
        v139 = v151;
      }
      bool v152 = true;
      v97 = v138;
      break;
    }
  }
  bool v153 = true;
  int v154 = 16;
  int v155 = v154 + v85;
  bool v156 = true;
  int v157 = simt_wave_count_bits(v156);
  v83[v155] = v157;
  int v158 = 64;
  int v159 = v158 + v85;
  int v160 = v84[v159];
  int v161 = 0;
  bool v162 = v160 != v161;
  int v163;
  if (v162) {
    int v164 = 68;
    int v165 = v164 + v85;
    int v166 = v84[v165];
    int v167 = 0;
    int v168 = v85 + v167;
    int v169;
    v169 = v168;
    switch (v166) {
      case 0:
        {
        v169 = v85;
        break;
      }
      default:
        {
        int v170 = 0;
        int v171 = 0;
        int v172;
        int v173;
        v172 = v170;
        v173 = v171;
        while (true) {
          int v174 = 4;
          int v175 = v173 * v174;
          int v176 = v175 + v85;
          int v177 = 72;
          int v178 = v177 + v176;
          int v179 = v84[v178];
          int v180 = 0;
          bool v181 = v179 != v180;
          v172 = v172;
          v173 = v173;
          if (!v181) break;
          int v182 = v172 + v173;
          int v183 = 1;
          int v184 = v173 + v183;
          v172 = v182;
          v173 = v184;
        }
        bool v185 = true;
        v169 = v172;
        break;
      }
    }
    bool v186 = true;
    v163 = v169;
  } else {
    int v187 = 92;
    int v188 = v187 + v85;
    int v189 = v84[v188];
    uint v190 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v191 = (int)(v190);
    int v192;
    v192 = v191;
    switch (v189) {
      case 0:
        {
        int v193 = 0;
        int v194 = 0;
        int v195;
        int v196;
        v195 = v193;
        v196 = v194;
        while (true) {
          int v197 = 4;
          int v198 = v196 * v197;
          int v199 = v198 + v85;
          int v200 = 96;
          int v201 = v200 + v199;
          int v202 = v84[v201];
          int v203 = 0;
          bool v204 = v202 != v203;
          v195 = v195;
          v196 = v196;
          if (!v204) break;
          int v205 = v195 + v196;
          int v206 = 1;
          int v207 = v196 + v206;
          v195 = v205;
          v196 = v207;
        }
        bool v208 = true;
        v192 = v195;
        break;
      }
      default:
        {
        int v209 = 2;
        int v210 = v85 + v209;
        v192 = v210;
        break;
      }
      case 1:
        {
        int v211 = 0;
        int v212 = 0;
        int v213;
        int v214;
        v213 = v211;
        v214 = v212;
        while (true) {
          int v215 = 4;
          int v216 = v214 * v215;
          int v217 = v216 + v85;
          int v218 = 116;
          int v219 = v218 + v217;
          int v220 = v84[v219];
          int v221 = 0;
          bool v222 = v220 != v221;
          v213 = v213;
          v214 = v214;
          if (!v222) break;
          int v223 = v213 + v214;
          int v224 = 1;
          int v225 = v214 + v224;
          v213 = v223;
          v214 = v225;
          continue;
          ;
        }
        bool v226 = true;
        v192 = v213;
        break;
      }
    }
    bool v227 = true;
    v163 = v192;
  }
  int v228 = 32;
  int v229 = v228 + v85;
  bool v230 = true;
  int v231 = simt_wave_count_bits(v230);
  v83[v229] = v231;
  int v232 = 0;
  int v233 = 0;
  int v234;
  int v235;
  v234 = v232;
  v235 = v233;
  while (true) {
    int v236 = 4;
    int v237 = v235 * v236;
    int v238 = v237 + v85;
    int v239 = 136;
    int v240 = v239 + v238;
    int v241 = v84[v240];
    int v242 = 0;
    bool v243 = v241 != v242;
    v234 = v234;
    v235 = v235;
    if (!v243) break;
    uint v244 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v245 = (int)(v244);
    int v246 = v234 + v245;
    int v247 = 1;
    int v248 = v235 + v247;
    v234 = v246;
    v235 = v248;
  }
  bool v249 = true;
  int v250 = 48;
  int v251 = v250 + v85;
  bool v252 = true;
  int v253 = simt_wave_count_bits(v252);
  v83[v251] = v253;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 156; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
