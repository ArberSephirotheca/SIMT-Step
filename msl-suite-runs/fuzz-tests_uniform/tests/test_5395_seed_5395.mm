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
  int v4 = 2;
  int v5 = v3 % v4;
  int v6 = 3;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9;
      v9 = v0;
      switch (v3) {
        case 0:
          {
          int v10 = 0;
          int v11 = 0;
          int v12;
          int v13;
          v12 = v10;
          v13 = v11;
          while (true) {
            int v14 = 4;
            int v15 = v3 % v14;
            int v16 = 1;
            int v17 = v15 + v16;
            bool v18 = v13 < v17;
            v12 = v12;
            v13 = v13;
            if (!v18) break;
            int v19 = 1;
            int v20 = v13 + v19;
            v12 = v0;
            v13 = v20;
            break;
            ;
          }
          v9 = v12;
          break;
        }
        default:
          {
          int v21 = 0;
          bool v22 = v2 != v21;
          int v23;
          if (v22) {
            int v24 = 2;
            int v25 = v0 + v24;
            v23 = v25;
          } else {
            int v26 = 2;
            v23 = v26;
          }
          int v27 = 4;
          int v28 = v0 + v27;
          v9 = v23;
          break;
        }
      }
      int v29 = 2;
      v8 = v9;
    }
    default:
      {
      int v30 = 0;
      bool v31 = v2 != v30;
      int v32;
      if (v31) {
        int v33 = 0;
        int v34 = 0;
        int v35;
        int v36;
        v35 = v33;
        v36 = v34;
        while (true) {
          int v37 = 4;
          int v38 = v3 % v37;
          int v39 = 1;
          int v40 = v38 + v39;
          bool v41 = v36 < v40;
          v35 = v35;
          v36 = v36;
          if (!v41) break;
          int v42 = 0;
          int v43 = v0 + v42;
          int v44 = 1;
          int v45 = v36 + v44;
          v35 = v43;
          v36 = v45;
        }
        v32 = v35;
      } else {
        int v46 = 0;
        bool v47 = v2 != v46;
        int v48;
        if (v47) {
          int v49 = 2;
          v48 = v49;
        } else {
          int v50 = 4;
          v48 = v50;
        }
        v32 = v48;
      }
      int v51 = 0;
      int v52 = v0 + v51;
      v8 = v32;
      break;
    }
  }
  bool v53 = true;
  int v54 = simt_wave_count_bits(v53);
  int v55 = 0;
  int v56 = v55 + v0;
  v1[v56] = v54;
  return;
}

kernel void kernel_main(device int* v57 [[buffer(0)]], device int* v58 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v59 = static_cast<int>(__simt_tid3.x);
  int v60 = 0;
  int v61 = v60 + v59;
  int v62 = v58[v61];
  int v63 = 4;
  int v64 = v63 + v59;
  int v65 = v58[v64];
  helper0(v59, v57, v62, v65, static_cast<int>(__simt_tid3.x));
  int v66 = 8;
  int v67 = v66 + v59;
  int v68 = v58[v67];
  uint v69 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v70 = (int)(v69);
  int v71;
  v71 = v70;
  switch (v68) {
    default:
      {
      v71 = v59;
      break;
    }
    case 0:
      {
      int v72 = 12;
      int v73 = v72 + v59;
      int v74 = v58[v73];
      int v75 = 0;
      bool v76 = v74 != v75;
      int v77;
      if (v76) {
        int v78 = 16;
        int v79 = v78 + v59;
        int v80 = v58[v79];
        int v81 = 0;
        bool v82 = v80 != v81;
        int v83;
        if (v82) {
          v83 = v59;
        } else {
          int v84 = 2;
          int v85 = v59 + v84;
          v83 = v85;
        }
        v77 = v83;
      } else {
        int v86 = 2;
        int v87 = v59 + v86;
        v77 = v87;
      }
      v71 = v77;
      break;
    }
  }
  bool v88 = true;
  int v89 = 16;
  int v90 = v89 + v59;
  bool v91 = true;
  int v92 = simt_wave_count_bits(v91);
  v57[v90] = v92;
  int v93 = 20;
  int v94 = v93 + v59;
  int v95 = v58[v94];
  uint v96 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v97 = (int)(v96);
  int v98;
  v98 = v97;
  switch (v95) {
    case 0:
      {
      int v99 = 24;
      int v100 = v99 + v59;
      int v101 = v58[v100];
      int v102 = 0;
      bool v103 = v101 != v102;
      int v104;
      if (v103) {
        int v105 = 28;
        int v106 = v105 + v59;
        int v107 = v58[v106];
        int v108 = 0;
        int v109;
        v109 = v108;
        switch (v107) {
          default:
            {
            v109 = v59;
          }
          case 0:
            {
            int v110 = 4;
            int v111 = v59 + v110;
            v109 = v111;
          }
          case 1:
            {
            int v112 = 3;
            v109 = v112;
            break;
          }
        }
        bool v113 = true;
        v104 = v109;
      } else {
        int v114 = 32;
        int v115 = v114 + v59;
        int v116 = v58[v115];
        int v117 = 4;
        int v118;
        v118 = v117;
        switch (v116) {
          case 0:
            {
            int v119 = 0;
            int v120 = v59 + v119;
            v118 = v120;
          }
          default:
            {
            int v121 = 3;
            v118 = v121;
          }
          case 1:
            {
            v118 = v59;
          }
          case 2:
            {
            int v122 = 2;
            v118 = v122;
            break;
          }
        }
        bool v123 = true;
        v104 = v118;
      }
      v98 = v104;
      break;
    }
    default:
      {
      int v124 = 0;
      int v125 = 0;
      int v126;
      int v127;
      v126 = v124;
      v127 = v125;
      while (true) {
        int v128 = 4;
        int v129 = v127 * v128;
        int v130 = v129 + v59;
        int v131 = 36;
        int v132 = v131 + v130;
        int v133 = v58[v132];
        int v134 = 0;
        bool v135 = v133 != v134;
        v126 = v126;
        v127 = v127;
        if (!v135) break;
        int v136 = 0;
        int v137 = 0;
        int v138;
        int v139;
        v138 = v136;
        v139 = v137;
        while (true) {
          int v140 = 4;
          int v141 = v139 * v140;
          int v142 = v141 + v59;
          int v143 = 56;
          int v144 = v143 + v142;
          int v145 = v58[v144];
          int v146 = 0;
          bool v147 = v145 != v146;
          v138 = v138;
          v139 = v139;
          if (!v147) break;
          int v148 = v138 + v139;
          int v149 = 1;
          int v150 = v139 + v149;
          v138 = v148;
          v139 = v150;
        }
        bool v151 = true;
        int v152 = v126 + v138;
        int v153 = 1;
        int v154 = v127 + v153;
        v126 = v152;
        v127 = v154;
      }
      bool v155 = true;
      v98 = v126;
      break;
    }
    case 1:
      {
      int v156 = 4;
      int v157 = v59 + v156;
      v98 = v157;
      break;
    }
    case 2:
      {
      int v158 = 0;
      int v159 = 0;
      int v160;
      int v161;
      v160 = v158;
      v161 = v159;
      while (true) {
        int v162 = 4;
        int v163 = v161 * v162;
        int v164 = v163 + v59;
        int v165 = 76;
        int v166 = v165 + v164;
        int v167 = v58[v166];
        int v168 = 0;
        bool v169 = v167 != v168;
        v160 = v160;
        v161 = v161;
        if (!v169) break;
        int v170 = v160 + v161;
        int v171 = 1;
        int v172 = v161 + v171;
        v160 = v170;
        v161 = v172;
        continue;
        ;
      }
      bool v173 = true;
      v98 = v160;
      break;
    }
  }
  bool v174 = true;
  int v175 = 32;
  int v176 = v175 + v59;
  bool v177 = true;
  int v178 = simt_wave_count_bits(v177);
  v57[v176] = v178;
  int v179 = 96;
  int v180 = v179 + v59;
  int v181 = v58[v180];
  int v182;
  v182 = v59;
  switch (v181) {
    default:
      {
      int v183 = 0;
      int v184 = 0;
      int v185;
      int v186;
      v185 = v183;
      v186 = v184;
      while (true) {
        int v187 = 4;
        int v188 = v186 * v187;
        int v189 = v188 + v59;
        int v190 = 100;
        int v191 = v190 + v189;
        int v192 = v58[v191];
        int v193 = 0;
        bool v194 = v192 != v193;
        v185 = v185;
        v186 = v186;
        if (!v194) break;
        int v195 = v185 + v186;
        int v196 = 1;
        int v197 = v186 + v196;
        v185 = v195;
        v186 = v197;
        continue;
        ;
      }
      bool v198 = true;
      v182 = v185;
      break;
    }
    case 0:
      {
      int v199 = 0;
      int v200 = 0;
      int v201;
      int v202;
      v201 = v199;
      v202 = v200;
      while (true) {
        int v203 = 4;
        int v204 = v202 * v203;
        int v205 = v204 + v59;
        int v206 = 120;
        int v207 = v206 + v205;
        int v208 = v58[v207];
        int v209 = 0;
        bool v210 = v208 != v209;
        v201 = v201;
        v202 = v202;
        if (!v210) break;
        int v211 = 0;
        int v212 = 0;
        int v213;
        int v214;
        v213 = v211;
        v214 = v212;
        while (true) {
          int v215 = 4;
          int v216 = v214 * v215;
          int v217 = v216 + v59;
          int v218 = 140;
          int v219 = v218 + v217;
          int v220 = v58[v219];
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
        }
        bool v226 = true;
        int v227 = v201 + v213;
        int v228 = 1;
        int v229 = v202 + v228;
        v201 = v227;
        v202 = v229;
      }
      bool v230 = true;
      v182 = v201;
      break;
    }
  }
  bool v231 = true;
  int v232 = 48;
  int v233 = v232 + v59;
  bool v234 = true;
  int v235 = simt_wave_count_bits(v234);
  v57[v233] = v235;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 160; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
