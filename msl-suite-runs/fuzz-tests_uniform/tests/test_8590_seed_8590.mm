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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 3;
  int v7 = v3 % v6;
  int v8;
  v8 = v0;
  switch (v7) {
    default:
      {
      v8 = v0;
    }
    case 0:
      {
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
        int v18 = 0;
        bool v19 = v2 != v18;
        int v20;
        if (v19) {
          v20 = v0;
        } else {
          int v21 = 1;
          v20 = v21;
        }
        int v22 = 1;
        int v23 = 1;
        int v24 = v12 + v23;
        v11 = v20;
        v12 = v24;
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v25 = 0;
      bool v26 = v2 != v25;
      int v27;
      if (v26) {
        int v28 = 0;
        bool v29 = v2 != v28;
        int v30;
        if (v29) {
          int v31 = 2;
          int v32 = v0 + v31;
          v30 = v32;
        } else {
          int v33 = 2;
          v30 = v33;
        }
        int v34 = 2;
        int v35 = v0 + v34;
        v27 = v30;
      } else {
        int v36 = 2;
        v27 = v36;
      }
      int v37 = 2;
      int v38 = v0 + v37;
      v8 = v27;
      break;
    }
    case 2:
      {
      int v39 = 3;
      int v40 = v3 % v39;
      int v41 = 0;
      int v42 = v0 + v41;
      int v43;
      v43 = v42;
      switch (v40) {
        default:
          {
          int v44 = 1;
          int v45 = v0 + v44;
          v43 = v45;
          break;
        }
        case 0:
          {
          int v46;
          v46 = v0;
          switch (v3) {
            default:
              {
              int v47 = 2;
              int v48 = v0 + v47;
              v46 = v48;
              break;
            }
            case 0:
              {
              int v49 = 2;
              int v50 = v0 + v49;
              v46 = v50;
              break;
            }
          }
          v43 = v46;
          break;
        }
        case 1:
          {
          int v51 = 1;
          v43 = v51;
          break;
        }
        case 2:
          {
          int v52 = 0;
          int v53 = 0;
          int v54;
          int v55;
          v54 = v52;
          v55 = v53;
          while (true) {
            int v56 = 4;
            int v57 = v3 % v56;
            int v58 = 1;
            int v59 = v57 + v58;
            bool v60 = v55 < v59;
            v54 = v54;
            v55 = v55;
            if (!v60) break;
            int v61 = 3;
            int v62 = v0 + v61;
            int v63 = 1;
            int v64 = v55 + v63;
            v54 = v62;
            v55 = v64;
          }
          int v65 = 3;
          v43 = v54;
          break;
        }
      }
      v8 = v43;
      break;
    }
  }
  bool v66 = true;
  int v67 = simt_wave_count_bits(v66);
  int v68 = 0;
  int v69 = v68 + v0;
  v1[v69] = v67;
  int v70 = 0;
  bool v71 = v2 != v70;
  int v72 = v71 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v73 [[buffer(0)]], device int* v74 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v75 = static_cast<int>(__simt_tid3.x);
  int v76 = 0;
  int v77 = v76 + v75;
  int v78 = v74[v77];
  int v79 = 4;
  int v80 = v79 + v75;
  int v81 = v74[v80];
  helper0(v75, v73, v78, v81, static_cast<int>(__simt_tid3.x));
  int v82 = 8;
  int v83 = v82 + v75;
  int v84 = v74[v83];
  int v85 = 0;
  int v86;
  v86 = v85;
  switch (v84) {
    case 0:
      {
      int v87 = 12;
      int v88 = v87 + v75;
      int v89 = v74[v88];
      int v90 = 0;
      bool v91 = v89 != v90;
      int v92;
      if (v91) {
        int v93 = 0;
        int v94 = 0;
        int v95;
        int v96;
        v95 = v93;
        v96 = v94;
        while (true) {
          int v97 = 4;
          int v98 = v96 * v97;
          int v99 = v98 + v75;
          int v100 = 16;
          int v101 = v100 + v99;
          int v102 = v74[v101];
          int v103 = 0;
          bool v104 = v102 != v103;
          v95 = v95;
          v96 = v96;
          if (!v104) break;
          int v105 = v95 + v96;
          int v106 = 1;
          int v107 = v96 + v106;
          v95 = v105;
          v96 = v107;
        }
        bool v108 = true;
        v92 = v95;
      } else {
        int v109 = 1;
        int v110 = v75 + v109;
        v92 = v110;
      }
      v86 = v92;
    }
    default:
      {
      int v111 = 36;
      int v112 = v111 + v75;
      int v113 = v74[v112];
      int v114 = 1;
      int v115;
      v115 = v114;
      switch (v113) {
        default:
          {
          int v116 = 1;
          int v117 = v75 + v116;
          v115 = v117;
          break;
        }
        case 0:
          {
          int v118 = 40;
          int v119 = v118 + v75;
          int v120 = v74[v119];
          int v121;
          v121 = v75;
          switch (v120) {
            case 0:
              {
              int v122 = 2;
              int v123 = v75 + v122;
              v121 = v123;
              break;
            }
            case 1:
              {
              int v124 = 4;
              int v125 = v75 + v124;
              v121 = v125;
              break;
            }
            default:
              {
              int v126 = 3;
              v121 = v126;
              break;
            }
            case 2:
              {
              int v127 = 4;
              v121 = v127;
              break;
            }
          }
          bool v128 = true;
          v115 = v121;
        }
        case 1:
          {
          int v129 = 44;
          int v130 = v129 + v75;
          int v131 = v74[v130];
          int v132 = 3;
          int v133;
          v133 = v132;
          switch (v131) {
            default:
              {
              int v134 = 0;
              v133 = v134;
            }
            case 0:
              {
              int v135 = 3;
              v133 = v135;
              break;
            }
            case 1:
              {
              int v136 = 2;
              int v137 = v75 + v136;
              v133 = v137;
              break;
            }
          }
          bool v138 = true;
          v115 = v133;
          break;
        }
      }
      bool v139 = true;
      v86 = v115;
      break;
    }
    case 1:
      {
      v86 = v75;
      break;
    }
  }
  bool v140 = true;
  int v141 = 16;
  int v142 = v141 + v75;
  bool v143 = true;
  int v144 = simt_wave_count_bits(v143);
  v73[v142] = v144;
  int v145 = 48;
  int v146 = v145 + v75;
  int v147 = v74[v146];
  int v148 = 0;
  bool v149 = v147 != v148;
  int v150;
  if (v149) {
    int v151 = 52;
    int v152 = v151 + v75;
    int v153 = v74[v152];
    int v154 = 1;
    int v155;
    v155 = v154;
    switch (v153) {
      default:
        {
        int v156 = 56;
        int v157 = v156 + v75;
        int v158 = v74[v157];
        int v159 = 1;
        int v160;
        v160 = v159;
        switch (v158) {
          case 0:
            {
            int v161 = 1;
            v160 = v161;
            break;
          }
          default:
            {
            int v162 = 4;
            int v163 = v75 + v162;
            v160 = v163;
            break;
          }
        }
        bool v164 = true;
        v155 = v160;
        break;
      }
      case 0:
        {
        int v165 = 0;
        int v166 = 0;
        int v167;
        int v168;
        v167 = v165;
        v168 = v166;
        while (true) {
          int v169 = 4;
          int v170 = v168 * v169;
          int v171 = v170 + v75;
          int v172 = 60;
          int v173 = v172 + v171;
          int v174 = v74[v173];
          int v175 = 0;
          bool v176 = v174 != v175;
          v167 = v167;
          v168 = v168;
          if (!v176) break;
          int v177 = v167 + v168;
          int v178 = 1;
          int v179 = v168 + v178;
          v167 = v177;
          v168 = v179;
          break;
          ;
        }
        bool v180 = true;
        v155 = v167;
        break;
      }
    }
    bool v181 = true;
    v150 = v155;
  } else {
    int v182 = 80;
    int v183 = v182 + v75;
    int v184 = v74[v183];
    int v185 = 0;
    bool v186 = v184 != v185;
    int v187;
    if (v186) {
      int v188 = 2;
      int v189 = v75 + v188;
      v187 = v189;
    } else {
      int v190 = 84;
      int v191 = v190 + v75;
      int v192 = v74[v191];
      int v193 = 0;
      bool v194 = v192 != v193;
      int v195;
      if (v194) {
        uint v196 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v197 = (int)(v196);
        v195 = v197;
      } else {
        int v198 = 2;
        v195 = v198;
      }
      v187 = v195;
    }
    v150 = v187;
  }
  int v199 = 32;
  int v200 = v199 + v75;
  bool v201 = true;
  int v202 = simt_wave_count_bits(v201);
  v73[v200] = v202;
  int v203 = 88;
  int v204 = v203 + v75;
  int v205 = v74[v204];
  int v206 = 0;
  bool v207 = v205 != v206;
  int v208;
  if (v207) {
    uint v209 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v210 = (int)(v209);
    v208 = v210;
  } else {
    int v211 = 92;
    int v212 = v211 + v75;
    int v213 = v74[v212];
    int v214 = 0;
    bool v215 = v213 != v214;
    int v216;
    if (v215) {
      uint v217 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v218 = (int)(v217);
      v216 = v218;
    } else {
      int v219 = 96;
      int v220 = v219 + v75;
      int v221 = v74[v220];
      int v222 = 0;
      bool v223 = v221 != v222;
      int v224;
      if (v223) {
        uint v225 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v226 = (int)(v225);
        v224 = v226;
      } else {
        uint v227 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v228 = (int)(v227);
        v224 = v228;
      }
      v216 = v224;
    }
    v208 = v216;
  }
  int v229 = 48;
  int v230 = v229 + v75;
  bool v231 = true;
  int v232 = simt_wave_count_bits(v231);
  v73[v230] = v232;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
