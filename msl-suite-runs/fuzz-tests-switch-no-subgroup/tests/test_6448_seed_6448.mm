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
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
  }
  int v22;
  v22 = v0;
  switch (v3) {
    case 0:
      {
      int v23 = 4;
      int v24 = v3 % v23;
      int v25 = 3;
      int v26;
      v26 = v25;
      switch (v24) {
        default:
          {
          int v27 = 0;
          bool v28 = v2 != v27;
          int v29;
          if (v28) {
            v29 = v0;
          } else {
            int v30 = 0;
            v29 = v30;
          }
          v26 = v29;
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
            int v40 = 1;
            int v41 = 1;
            int v42 = v34 + v41;
            v33 = v40;
            v34 = v42;
          }
          v26 = v33;
          break;
        }
        case 1:
          {
          int v43 = 0;
          bool v44 = v2 != v43;
          int v45;
          if (v44) {
            int v46 = 4;
            v45 = v46;
          } else {
            v45 = v0;
          }
          v26 = v45;
          break;
        }
        case 2:
          {
          int v47 = 0;
          int v48 = 0;
          int v49;
          int v50;
          v49 = v47;
          v50 = v48;
          while (true) {
            int v51 = 4;
            int v52 = v3 % v51;
            int v53 = 1;
            int v54 = v52 + v53;
            bool v55 = v50 < v54;
            v49 = v49;
            v50 = v50;
            if (!v55) break;
            int v56 = 0;
            int v57 = 1;
            int v58 = v50 + v57;
            v49 = v56;
            v50 = v58;
          }
          v26 = v49;
          break;
        }
      }
      v22 = v26;
      break;
    }
    default:
      {
      int v59 = 0;
      int v60 = 0;
      int v61;
      int v62;
      v61 = v59;
      v62 = v60;
      while (true) {
        int v63 = 4;
        int v64 = v3 % v63;
        int v65 = 1;
        int v66 = v64 + v65;
        bool v67 = v62 < v66;
        v61 = v61;
        v62 = v62;
        if (!v67) break;
        int v68 = 0;
        bool v69 = v2 != v68;
        int v70;
        if (v69) {
          int v71 = 0;
          v70 = v71;
        } else {
          v70 = v0;
        }
        int v72 = 1;
        int v73 = v62 + v72;
        v61 = v70;
        v62 = v73;
      }
      v22 = v61;
      break;
    }
  }
  int v74 = 0;
  bool v75 = v2 != v74;
  int v76 = v75 ? v6 : v22;
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
  int v86 = 0;
  bool v87 = v82 != v86;
  if (v87) {
    int v88 = 0;
    int v89 = 0;
    int v90;
    int v91;
    v90 = v88;
    v91 = v89;
    while (true) {
      int v92 = 1;
      bool v93 = v91 < v92;
      v90 = v90;
      v91 = v91;
      if (!v93) break;
      int v94 = 3;
      int v95 = v79 % v94;
      int v96;
      v96 = v79;
      switch (v95) {
        case 0:
          {
          int v97 = 1;
          int v98 = v96 + v97;
          v96 = v98;
          break;
        }
        case 1:
          {
          int v99 = 1;
          int v100 = v96 + v99;
          v96 = v100;
          break;
        }
        default:
          {
          int v101 = 2;
          int v102 = v96 + v101;
          v96 = v102;
          break;
        }
        case 2:
          {
          int v103 = 3;
          int v104 = v96 + v103;
          v96 = v104;
          break;
        }
      }
      helper0(v79, v77, v82, v85, static_cast<int>(__simt_tid3.x));
      int v105 = 1;
      int v106 = v91 + v105;
      v90 = v90;
      v91 = v106;
    }
  } else {
  }
  int v107 = 0;
  int v108 = 0;
  int v109;
  int v110;
  v109 = v107;
  v110 = v108;
  while (true) {
    int v111 = 4;
    int v112 = v110 * v111;
    int v113 = v112 + v79;
    int v114 = 8;
    int v115 = v114 + v113;
    int v116 = v78[v115];
    int v117 = 0;
    bool v118 = v116 != v117;
    v109 = v109;
    v110 = v110;
    if (!v118) break;
    int v119 = v109 + v110;
    int v120 = 1;
    int v121 = v110 + v120;
    bool v122 = true;
    int v123 = 16;
    int v124 = 4;
    int v125 = v110 * v124;
    int v126 = v123 + v125;
    int v127 = v126 + v79;
    bool v128 = true;
    int v129 = simt_wave_count_bits(v128);
    v77[v127] = v129;
    v109 = v119;
    v110 = v121;
  }
  int v130 = 28;
  int v131 = v130 + v79;
  int v132 = v78[v131];
  int v133 = 0;
  bool v134 = v132 != v133;
  int v135;
  if (v134) {
    int v136 = 32;
    int v137 = v136 + v79;
    int v138 = v78[v137];
    int v139 = 3;
    int v140;
    v140 = v139;
    switch (v138) {
      case 0:
        {
        v140 = v79;
      }
      case 1:
        {
        int v141 = 1;
        int v142 = v79 + v141;
        v140 = v142;
      }
      default:
        {
        int v143 = 36;
        int v144 = v143 + v79;
        int v145 = v78[v144];
        int v146 = 2;
        int v147 = v79 + v146;
        int v148;
        v148 = v147;
        switch (v145) {
          default:
            {
            int v149 = 3;
            v148 = v149;
            break;
          }
          case 0:
            {
            int v150 = 1;
            int v151 = v79 + v150;
            v148 = v151;
          }
          case 1:
            {
            v148 = v79;
          }
          case 2:
            {
            v148 = v79;
            break;
          }
        }
        v140 = v148;
        break;
      }
    }
    v135 = v140;
  } else {
    int v152 = 40;
    int v153 = v152 + v79;
    int v154 = v78[v153];
    int v155 = 0;
    bool v156 = v154 != v155;
    int v157;
    if (v156) {
      int v158 = 0;
      int v159 = 0;
      int v160;
      int v161;
      v160 = v158;
      v161 = v159;
      while (true) {
        int v162 = 4;
        int v163 = v161 * v162;
        int v164 = v163 + v79;
        int v165 = 44;
        int v166 = v165 + v164;
        int v167 = v78[v166];
        int v168 = 0;
        bool v169 = v167 != v168;
        v160 = v160;
        v161 = v161;
        if (!v169) break;
        int v170 = v160 + v161;
        int v171 = 1;
        int v172 = v161 + v171;
        bool v173 = true;
        int v174 = 32;
        int v175 = 4;
        int v176 = v161 * v175;
        int v177 = v174 + v176;
        int v178 = v177 + v79;
        bool v179 = true;
        int v180 = simt_wave_count_bits(v179);
        v77[v178] = v180;
        v160 = v170;
        v161 = v172;
        break;
        ;
      }
      v157 = v160;
    } else {
      int v181 = 64;
      int v182 = v181 + v79;
      int v183 = v78[v182];
      int v184 = 0;
      bool v185 = v183 != v184;
      int v186;
      if (v185) {
        uint v187 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v188 = (int)(v187);
        v186 = v188;
      } else {
        uint v189 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v190 = (int)(v189);
        v186 = v190;
      }
      int v191 = 48;
      int v192 = v191 + v79;
      bool v193 = true;
      int v194 = simt_wave_count_bits(v193);
      v77[v192] = v194;
      v157 = v186;
    }
    int v195 = 64;
    int v196 = v195 + v79;
    bool v197 = true;
    int v198 = simt_wave_count_bits(v197);
    v77[v196] = v198;
    v135 = v157;
  }
  int v199 = 80;
  int v200 = v199 + v79;
  bool v201 = true;
  int v202 = simt_wave_count_bits(v201);
  v77[v200] = v202;
  int v203 = 0;
  int v204 = 0;
  int v205;
  int v206;
  v205 = v203;
  v206 = v204;
  while (true) {
    int v207 = 4;
    int v208 = v206 * v207;
    int v209 = v208 + v79;
    int v210 = 68;
    int v211 = v210 + v209;
    int v212 = v78[v211];
    int v213 = 0;
    bool v214 = v212 != v213;
    v205 = v205;
    v206 = v206;
    if (!v214) break;
    int v215 = v205 + v206;
    int v216 = 1;
    int v217 = v206 + v216;
    bool v218 = true;
    int v219 = 96;
    int v220 = 4;
    int v221 = v206 * v220;
    int v222 = v219 + v221;
    int v223 = v222 + v79;
    bool v224 = true;
    int v225 = simt_wave_count_bits(v224);
    v77[v223] = v225;
    v205 = v215;
    v206 = v217;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
