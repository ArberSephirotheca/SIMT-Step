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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 3;
        int v13 = v3 % v12;
        int v14 = 3;
        int v15 = v0 + v14;
        int v16;
        v16 = v15;
        switch (v13) {
          case 0:
            {
            int v17 = 2;
            int v18 = v0 + v17;
            v16 = v18;
          }
          case 1:
            {
            int v19 = 3;
            int v20 = v0 + v19;
            v16 = v20;
            break;
          }
          case 2:
            {
            int v21 = 4;
            v16 = v21;
            break;
          }
          default:
            {
            v16 = v0;
            break;
          }
        }
        int v22 = 2;
        int v23 = v0 + v22;
        v11 = v16;
      } else {
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
            v26 = v0;
            break;
          }
          case 2:
            {
            int v27 = 4;
            int v28 = v0 + v27;
            v26 = v28;
            break;
          }
          default:
            {
            v26 = v0;
            break;
          }
        }
        v11 = v26;
      }
      v8 = v11;
      break;
    }
    default:
      {
      int v29 = 0;
      v8 = v29;
      break;
    }
    case 1:
      {
      int v30 = 0;
      bool v31 = v2 != v30;
      int v32;
      if (v31) {
        int v33 = 4;
        v32 = v33;
      } else {
        int v34 = 4;
        int v35 = v3 % v34;
        int v36 = 2;
        int v37;
        v37 = v36;
        switch (v35) {
          case 0:
            {
            int v38 = 2;
            int v39 = v0 + v38;
            v37 = v39;
            break;
          }
          default:
            {
            int v40 = 0;
            v37 = v40;
            break;
          }
          case 1:
            {
            int v41 = 1;
            v37 = v41;
            break;
          }
          case 2:
            {
            v37 = v0;
            break;
          }
        }
        int v42 = 0;
        v32 = v37;
      }
      int v43 = 1;
      v8 = v32;
      break;
    }
    case 2:
      {
      int v44 = 4;
      int v45 = v3 % v44;
      int v46 = 3;
      int v47 = v0 + v46;
      int v48;
      v48 = v47;
      switch (v45) {
        case 0:
          {
          int v49 = 0;
          int v50 = 0;
          int v51;
          int v52;
          v51 = v49;
          v52 = v50;
          while (true) {
            int v53 = 4;
            int v54 = v3 % v53;
            int v55 = 1;
            int v56 = v54 + v55;
            bool v57 = v52 < v56;
            v51 = v51;
            v52 = v52;
            if (!v57) break;
            int v58 = 1;
            int v59 = 1;
            int v60 = v52 + v59;
            v51 = v58;
            v52 = v60;
          }
          v48 = v51;
          break;
        }
        default:
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
            int v70 = 4;
            int v71 = v0 + v70;
            int v72 = 1;
            int v73 = v64 + v72;
            v63 = v71;
            v64 = v73;
          }
          int v74 = 1;
          int v75 = v0 + v74;
          v48 = v63;
        }
        case 1:
          {
          int v76 = 3;
          int v77 = v3 % v76;
          int v78 = 2;
          int v79 = v0 + v78;
          int v80;
          v80 = v79;
          switch (v77) {
            case 0:
              {
              v80 = v0;
            }
            case 1:
              {
              int v81 = 1;
              v80 = v81;
              break;
            }
            default:
              {
              int v82 = 1;
              int v83 = v0 + v82;
              v80 = v83;
              break;
            }
            case 2:
              {
              int v84 = 0;
              int v85 = v0 + v84;
              v80 = v85;
              break;
            }
          }
          v48 = v80;
        }
        case 2:
          {
          int v86 = 0;
          int v87 = 0;
          int v88;
          int v89;
          v88 = v86;
          v89 = v87;
          while (true) {
            int v90 = 4;
            int v91 = v3 % v90;
            int v92 = 1;
            int v93 = v91 + v92;
            bool v94 = v89 < v93;
            v88 = v88;
            v89 = v89;
            if (!v94) break;
            int v95 = 3;
            int v96 = 1;
            int v97 = v89 + v96;
            v88 = v95;
            v89 = v97;
          }
          int v98 = 2;
          int v99 = v0 + v98;
          v48 = v88;
          break;
        }
      }
      int v100 = 4;
      int v101 = v0 + v100;
      v8 = v48;
      break;
    }
  }
  bool v102 = true;
  int v103 = simt_wave_count_bits(v102);
  int v104 = 0;
  int v105 = v104 + v0;
  v1[v105] = v103;
  return;
}

kernel void kernel_main(device int* v106 [[buffer(0)]], device int* v107 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v108 = static_cast<int>(__simt_tid3.x);
  int v109 = 0;
  int v110 = v109 + v108;
  int v111 = v107[v110];
  int v112 = 4;
  int v113 = v112 + v108;
  int v114 = v107[v113];
  helper0(v108, v106, v111, v114, static_cast<int>(__simt_tid3.x));
  int v115 = 8;
  int v116 = v115 + v108;
  int v117 = v107[v116];
  int v118 = 3;
  int v119;
  v119 = v118;
  switch (v117) {
    case 0:
      {
      int v120 = 0;
      int v121 = 0;
      int v122;
      int v123;
      v122 = v120;
      v123 = v121;
      while (true) {
        int v124 = 4;
        int v125 = v123 * v124;
        int v126 = v125 + v108;
        int v127 = 12;
        int v128 = v127 + v126;
        int v129 = v107[v128];
        int v130 = 0;
        bool v131 = v129 != v130;
        v122 = v122;
        v123 = v123;
        if (!v131) break;
        int v132 = v122 + v123;
        int v133 = 1;
        int v134 = v123 + v133;
        v122 = v132;
        v123 = v134;
      }
      bool v135 = true;
      v119 = v122;
      break;
    }
    default:
      {
      int v136 = 32;
      int v137 = v136 + v108;
      int v138 = v107[v137];
      int v139 = 0;
      bool v140 = v138 != v139;
      int v141;
      if (v140) {
        int v142 = 4;
        v141 = v142;
      } else {
        int v143 = 36;
        int v144 = v143 + v108;
        int v145 = v107[v144];
        int v146 = 0;
        int v147;
        v147 = v146;
        switch (v145) {
          default:
            {
            int v148 = 1;
            v147 = v148;
            break;
          }
          case 0:
            {
            v147 = v108;
            break;
          }
          case 1:
            {
            v147 = v108;
            break;
          }
        }
        bool v149 = true;
        v141 = v147;
      }
      v119 = v141;
      break;
    }
    case 1:
      {
      int v150 = 40;
      int v151 = v150 + v108;
      int v152 = v107[v151];
      int v153 = 3;
      int v154 = v108 + v153;
      int v155;
      v155 = v154;
      switch (v152) {
        case 0:
          {
          int v156 = 44;
          int v157 = v156 + v108;
          int v158 = v107[v157];
          int v159 = 1;
          int v160 = v108 + v159;
          int v161;
          v161 = v160;
          switch (v158) {
            case 0:
              {
              int v162 = 4;
              int v163 = v108 + v162;
              v161 = v163;
              break;
            }
            default:
              {
              int v164 = 4;
              int v165 = v108 + v164;
              v161 = v165;
              break;
            }
          }
          bool v166 = true;
          v155 = v161;
        }
        default:
          {
          int v167 = 1;
          int v168 = v108 + v167;
          v155 = v168;
          break;
        }
        case 1:
          {
          int v169 = 48;
          int v170 = v169 + v108;
          int v171 = v107[v170];
          int v172 = 0;
          bool v173 = v171 != v172;
          int v174;
          if (v173) {
            int v175 = 1;
            int v176 = v108 + v175;
            v174 = v176;
          } else {
            int v177 = 1;
            v174 = v177;
          }
          v155 = v174;
          break;
        }
      }
      bool v178 = true;
      v119 = v155;
      break;
    }
  }
  bool v179 = true;
  int v180 = 16;
  int v181 = v180 + v108;
  bool v182 = true;
  int v183 = simt_wave_count_bits(v182);
  v106[v181] = v183;
  int v184 = 52;
  int v185 = v184 + v108;
  int v186 = v107[v185];
  int v187 = 0;
  bool v188 = v186 != v187;
  int v189;
  if (v188) {
    int v190 = 56;
    int v191 = v190 + v108;
    int v192 = v107[v191];
    int v193;
    v193 = v108;
    switch (v192) {
      case 0:
        {
        int v194 = 1;
        int v195 = v108 + v194;
        v193 = v195;
        break;
      }
      default:
        {
        int v196 = 0;
        int v197 = 0;
        int v198;
        int v199;
        v198 = v196;
        v199 = v197;
        while (true) {
          int v200 = 4;
          int v201 = v199 * v200;
          int v202 = v201 + v108;
          int v203 = 60;
          int v204 = v203 + v202;
          int v205 = v107[v204];
          int v206 = 0;
          bool v207 = v205 != v206;
          v198 = v198;
          v199 = v199;
          if (!v207) break;
          int v208 = v198 + v199;
          int v209 = 1;
          int v210 = v199 + v209;
          v198 = v208;
          v199 = v210;
          break;
          ;
        }
        bool v211 = true;
        v193 = v198;
        break;
      }
      case 1:
        {
        int v212 = 80;
        int v213 = v212 + v108;
        int v214 = v107[v213];
        int v215 = 0;
        bool v216 = v214 != v215;
        int v217;
        if (v216) {
          int v218 = 3;
          int v219 = v108 + v218;
          v217 = v219;
        } else {
          v217 = v108;
        }
        v193 = v217;
        break;
      }
    }
    bool v220 = true;
    v189 = v193;
  } else {
    int v221 = 0;
    int v222 = 0;
    int v223;
    int v224;
    v223 = v221;
    v224 = v222;
    while (true) {
      int v225 = 4;
      int v226 = v224 * v225;
      int v227 = v226 + v108;
      int v228 = 84;
      int v229 = v228 + v227;
      int v230 = v107[v229];
      int v231 = 0;
      bool v232 = v230 != v231;
      v223 = v223;
      v224 = v224;
      if (!v232) break;
      int v233 = v223 + v224;
      int v234 = 1;
      int v235 = v224 + v234;
      v223 = v233;
      v224 = v235;
      break;
      ;
    }
    bool v236 = true;
    v189 = v223;
  }
  int v237 = 32;
  int v238 = v237 + v108;
  bool v239 = true;
  int v240 = simt_wave_count_bits(v239);
  v106[v238] = v240;
  int v241 = 0;
  int v242 = 0;
  int v243;
  int v244;
  v243 = v241;
  v244 = v242;
  while (true) {
    int v245 = 4;
    int v246 = v244 * v245;
    int v247 = v246 + v108;
    int v248 = 104;
    int v249 = v248 + v247;
    int v250 = v107[v249];
    int v251 = 0;
    bool v252 = v250 != v251;
    v243 = v243;
    v244 = v244;
    if (!v252) break;
    int v253 = v243 + v108;
    int v254 = 1;
    int v255 = v244 + v254;
    v243 = v253;
    v244 = v255;
  }
  bool v256 = true;
  int v257 = 48;
  int v258 = v257 + v108;
  bool v259 = true;
  int v260 = simt_wave_count_bits(v259);
  v106[v258] = v260;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 124; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
