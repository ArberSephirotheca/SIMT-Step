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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 2;
      int v8 = v3 % v7;
      int v9 = 0;
      int v10;
      v10 = v9;
      switch (v8) {
        case 0:
          {
          int v11 = 0;
          bool v12 = v2 != v11;
          int v13;
          if (v12) {
            int v14 = 0;
            v13 = v14;
          } else {
            int v15 = 4;
            v13 = v15;
          }
          v10 = v13;
        }
        case 1:
          {
          v10 = v0;
        }
        default:
          {
          int v16 = 0;
          bool v17 = v2 != v16;
          int v18;
          if (v17) {
            v18 = v0;
          } else {
            int v19 = 2;
            int v20 = v0 + v19;
            v18 = v20;
          }
          v10 = v18;
          break;
        }
      }
      v6 = v10;
      break;
    }
    case 1:
      {
      int v21 = 4;
      int v22;
      v22 = v21;
      switch (v3) {
        default:
          {
          int v23 = 0;
          int v24 = 0;
          int v25;
          int v26;
          v25 = v23;
          v26 = v24;
          while (true) {
            int v27 = 4;
            int v28 = v3 % v27;
            int v29 = 1;
            int v30 = v28 + v29;
            bool v31 = v26 < v30;
            v25 = v25;
            v26 = v26;
            if (!v31) break;
            int v32 = 1;
            int v33 = v26 + v32;
            v25 = v0;
            v26 = v33;
            continue;
            ;
          }
          v22 = v25;
          break;
        }
        case 0:
          {
          v22 = v0;
          break;
        }
      }
      v6 = v22;
      break;
    }
    default:
      {
      int v34 = 2;
      int v35 = v3 % v34;
      int v36;
      v36 = v0;
      switch (v35) {
        case 0:
          {
          int v37 = 2;
          int v38 = v3 % v37;
          int v39 = 1;
          int v40;
          v40 = v39;
          switch (v38) {
            case 0:
              {
              int v41 = 1;
              v40 = v41;
            }
            default:
              {
              int v42 = 3;
              v40 = v42;
              break;
            }
            case 1:
              {
              v40 = v0;
              break;
            }
          }
          v36 = v40;
          break;
        }
        default:
          {
          int v43 = 0;
          int v44 = 0;
          int v45;
          int v46;
          v45 = v43;
          v46 = v44;
          while (true) {
            int v47 = 4;
            int v48 = v3 % v47;
            int v49 = 1;
            int v50 = v48 + v49;
            bool v51 = v46 < v50;
            v45 = v45;
            v46 = v46;
            if (!v51) break;
            int v52 = 2;
            int v53 = 1;
            int v54 = v46 + v53;
            v45 = v52;
            v46 = v54;
          }
          v36 = v45;
          break;
        }
      }
      int v55 = 4;
      int v56 = v0 + v55;
      v6 = v36;
      break;
    }
    case 2:
      {
      int v57 = 0;
      int v58 = 0;
      int v59;
      int v60;
      v59 = v57;
      v60 = v58;
      while (true) {
        int v61 = 4;
        int v62 = v3 % v61;
        int v63 = 1;
        int v64 = v62 + v63;
        bool v65 = v60 < v64;
        v59 = v59;
        v60 = v60;
        if (!v65) break;
        int v66 = 0;
        bool v67 = v2 != v66;
        int v68;
        if (v67) {
          int v69 = 2;
          int v70 = v0 + v69;
          v68 = v70;
        } else {
          int v71 = 4;
          v68 = v71;
        }
        int v72 = 1;
        int v73 = v60 + v72;
        v59 = v68;
        v60 = v73;
      }
      v6 = v59;
      break;
    }
  }
  bool v74 = true;
  int v75 = simt_wave_count_bits(v74);
  int v76 = 0;
  int v77 = v76 + v0;
  v1[v77] = v75;
  return;
}

kernel void kernel_main(device int* v78 [[buffer(0)]], device int* v79 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v80 = static_cast<int>(__simt_tid3.x);
  int v81 = 0;
  int v82 = v81 + v80;
  int v83 = v79[v82];
  int v84 = 4;
  int v85 = v84 + v80;
  int v86 = v79[v85];
  int v87 = 0;
  bool v88 = v83 != v87;
  if (v88) {
  } else {
    int v89 = 8;
    int v90 = v89 + v80;
    int v91 = v79[v90];
    int v92 = 0;
    bool v93 = v91 != v92;
    if (v93) {
      helper0(v80, v78, v83, v86, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v94 = 0;
  int v95 = 0;
  int v96;
  int v97;
  v96 = v94;
  v97 = v95;
  while (true) {
    int v98 = 4;
    int v99 = v97 * v98;
    int v100 = v99 + v80;
    int v101 = 12;
    int v102 = v101 + v100;
    int v103 = v79[v102];
    int v104 = 0;
    bool v105 = v103 != v104;
    v96 = v96;
    v97 = v97;
    if (!v105) break;
    int v106 = 32;
    int v107 = v106 + v80;
    int v108 = v79[v107];
    int v109 = 0;
    bool v110 = v108 != v109;
    int v111;
    if (v110) {
      v111 = v80;
    } else {
      int v112 = 36;
      int v113 = v112 + v80;
      int v114 = v79[v113];
      int v115 = 0;
      bool v116 = v114 != v115;
      int v117;
      if (v116) {
        uint v118 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v119 = (int)(v118);
        v117 = v119;
      } else {
        uint v120 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v121 = (int)(v120);
        v117 = v121;
      }
      int v122 = 16;
      int v123 = v122 + v80;
      bool v124 = true;
      int v125 = simt_wave_count_bits(v124);
      v78[v123] = v125;
      v111 = v117;
    }
    int v126 = 32;
    int v127 = v126 + v80;
    bool v128 = true;
    int v129 = simt_wave_count_bits(v128);
    v78[v127] = v129;
    int v130 = v96 + v111;
    int v131 = 1;
    int v132 = v97 + v131;
    bool v133 = true;
    int v134 = 48;
    int v135 = 4;
    int v136 = v97 * v135;
    int v137 = v134 + v136;
    int v138 = v137 + v80;
    bool v139 = true;
    int v140 = simt_wave_count_bits(v139);
    v78[v138] = v140;
    v96 = v130;
    v97 = v132;
  }
  int v141 = 40;
  int v142 = v141 + v80;
  int v143 = v79[v142];
  int v144 = 0;
  bool v145 = v143 != v144;
  int v146;
  if (v145) {
    int v147 = 44;
    int v148 = v147 + v80;
    int v149 = v79[v148];
    uint v150 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v151 = (int)(v150);
    int v152;
    v152 = v151;
    switch (v149) {
      case 0:
        {
        int v153 = 0;
        int v154 = 0;
        int v155;
        int v156;
        v155 = v153;
        v156 = v154;
        while (true) {
          int v157 = 4;
          int v158 = v156 * v157;
          int v159 = v158 + v80;
          int v160 = 48;
          int v161 = v160 + v159;
          int v162 = v79[v161];
          int v163 = 0;
          bool v164 = v162 != v163;
          v155 = v155;
          v156 = v156;
          if (!v164) break;
          int v165 = v155 + v156;
          int v166 = 1;
          int v167 = v156 + v166;
          bool v168 = true;
          v155 = v165;
          v156 = v167;
          break;
          ;
        }
        v152 = v155;
        break;
      }
      default:
        {
        int v169 = 68;
        int v170 = v169 + v80;
        int v171 = v79[v170];
        int v172 = 0;
        int v173 = v80 + v172;
        int v174;
        v174 = v173;
        switch (v171) {
          default:
            {
            int v175 = 3;
            v174 = v175;
          }
          case 0:
            {
            int v176 = 2;
            int v177 = v80 + v176;
            v174 = v177;
            break;
          }
        }
        v152 = v174;
        break;
      }
      case 1:
        {
        int v178 = 72;
        int v179 = v178 + v80;
        int v180 = v79[v179];
        int v181 = 4;
        int v182;
        v182 = v181;
        switch (v180) {
          case 0:
            {
            int v183 = 4;
            v182 = v183;
            break;
          }
          case 1:
            {
            int v184 = 0;
            v182 = v184;
            break;
          }
          case 2:
            {
            v182 = v80;
            break;
          }
          default:
            {
            int v185 = 0;
            int v186 = v80 + v185;
            v182 = v186;
            break;
          }
        }
        v152 = v182;
        break;
      }
      case 2:
        {
        v152 = v80;
        break;
      }
    }
    v146 = v152;
  } else {
    int v187 = 76;
    int v188 = v187 + v80;
    int v189 = v79[v188];
    int v190 = 0;
    int v191;
    v191 = v190;
    switch (v189) {
      case 0:
        {
        int v192 = 0;
        int v193 = 0;
        int v194;
        int v195;
        v194 = v192;
        v195 = v193;
        while (true) {
          int v196 = 4;
          int v197 = v195 * v196;
          int v198 = v197 + v80;
          int v199 = 80;
          int v200 = v199 + v198;
          int v201 = v79[v200];
          int v202 = 0;
          bool v203 = v201 != v202;
          v194 = v194;
          v195 = v195;
          if (!v203) break;
          int v204 = v194 + v195;
          int v205 = 1;
          int v206 = v195 + v205;
          bool v207 = true;
          v194 = v204;
          v195 = v206;
        }
        v191 = v194;
        break;
      }
      default:
        {
        int v208 = 1;
        v191 = v208;
        break;
      }
      case 1:
        {
        int v209 = 100;
        int v210 = v209 + v80;
        int v211 = v79[v210];
        int v212 = 2;
        int v213;
        v213 = v212;
        switch (v211) {
          case 0:
            {
            v213 = v80;
            break;
          }
          case 1:
            {
            v213 = v80;
            break;
          }
          default:
            {
            int v214 = 3;
            int v215 = v80 + v214;
            v213 = v215;
            break;
          }
          case 2:
            {
            int v216 = 4;
            int v217 = v80 + v216;
            v213 = v217;
            break;
          }
        }
        v191 = v213;
        break;
      }
      case 2:
        {
        int v218 = 104;
        int v219 = v218 + v80;
        int v220 = v79[v219];
        int v221 = 0;
        bool v222 = v220 != v221;
        int v223;
        if (v222) {
          int v224 = 4;
          int v225 = v80 + v224;
          v223 = v225;
        } else {
          int v226 = 1;
          int v227 = v80 + v226;
          v223 = v227;
        }
        v191 = v223;
        break;
      }
    }
    v146 = v191;
  }
  int v228 = 64;
  int v229 = v228 + v80;
  bool v230 = true;
  int v231 = simt_wave_count_bits(v230);
  v78[v229] = v231;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
