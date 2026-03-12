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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 2;
    int v8 = v3 % v7;
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      case 0:
        {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          int v15 = 1;
          v14 = v15;
        } else {
          int v16 = 2;
          v14 = v16;
        }
        int v17 = 0;
        int v18 = v0 + v17;
        v11 = v14;
        break;
      }
      default:
        {
        int v19 = 0;
        bool v20 = v2 != v19;
        int v21;
        if (v20) {
          v21 = v0;
        } else {
          int v22 = 4;
          v21 = v22;
        }
        int v23 = 1;
        int v24 = v0 + v23;
        v11 = v21;
        break;
      }
    }
    int v25 = 4;
    int v26 = v0 + v25;
    v6 = v11;
  } else {
    int v27 = 0;
    bool v28 = v2 != v27;
    int v29;
    if (v28) {
      int v30 = 0;
      int v31 = 0;
      int v32;
      int v33;
      v32 = v30;
      v33 = v31;
      while (true) {
        int v34 = 4;
        int v35 = v3 % v34;
        int v36 = 1;
        int v37 = v35 + v36;
        bool v38 = v33 < v37;
        v32 = v32;
        v33 = v33;
        if (!v38) break;
        uint v39 = simt_subgroup_id(__simt_tid);
        int v40 = (int)(v39);
        int v41 = 1;
        int v42 = v33 + v41;
        v32 = v40;
        v33 = v42;
        continue;
        ;
      }
      uint v43 = simt_lane_id(__simt_tid);
      int v44 = (int)(v43);
      v29 = v32;
    } else {
      int v45 = 0;
      bool v46 = v2 != v45;
      int v47;
      if (v46) {
        uint v48 = simt_lane_id(__simt_tid);
        int v49 = (int)(v48);
        v47 = v49;
      } else {
        v47 = v0;
      }
      uint v50 = simt_subgroup_id(__simt_tid);
      int v51 = (int)(v50);
      v29 = v47;
    }
    v6 = v29;
  }
  bool v52 = true;
  int v53 = simt_wave_count_bits(v52);
  int v54 = 0;
  int v55 = v54 + v0;
  v1[v55] = v53;
  return;
}

kernel void kernel_main(device int* v56 [[buffer(0)]], device int* v57 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v58 = static_cast<int>(__simt_tid3.x);
  int v59 = 0;
  int v60 = v59 + v58;
  int v61 = v57[v60];
  int v62 = 4;
  int v63 = v62 + v58;
  int v64 = v57[v63];
  helper0(v58, v56, v61, v64, static_cast<int>(__simt_tid3.x));
  int v65 = 0;
  int v66 = 0;
  int v67;
  int v68;
  v67 = v65;
  v68 = v66;
  while (true) {
    int v69 = 4;
    int v70 = v68 * v69;
    int v71 = v70 + v58;
    int v72 = 8;
    int v73 = v72 + v71;
    int v74 = v57[v73];
    int v75 = 0;
    bool v76 = v74 != v75;
    v67 = v67;
    v68 = v68;
    if (!v76) break;
    int v77 = 28;
    int v78 = v77 + v58;
    int v79 = v57[v78];
    uint v80 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v81 = (int)(v80);
    int v82;
    v82 = v81;
    switch (v79) {
      case 0:
        {
        int v83 = 32;
        int v84 = v83 + v58;
        int v85 = v57[v84];
        int v86 = 3;
        int v87 = v58 + v86;
        int v88;
        v88 = v87;
        switch (v85) {
          default:
            {
            int v89 = 4;
            v88 = v89;
            break;
          }
          case 0:
            {
            int v90 = 4;
            v88 = v90;
            break;
          }
        }
        bool v91 = true;
        v82 = v88;
        break;
      }
      case 1:
        {
        int v92 = 36;
        int v93 = v92 + v58;
        int v94 = v57[v93];
        int v95 = 3;
        int v96 = v58 + v95;
        int v97;
        v97 = v96;
        switch (v94) {
          case 0:
            {
            v97 = v58;
          }
          default:
            {
            v97 = v58;
          }
          case 1:
            {
            v97 = v58;
            break;
          }
        }
        bool v98 = true;
        v82 = v97;
        break;
      }
      default:
        {
        int v99 = 3;
        int v100 = v58 + v99;
        v82 = v100;
      }
      case 2:
        {
        int v101 = 40;
        int v102 = v101 + v58;
        int v103 = v57[v102];
        int v104;
        v104 = v58;
        switch (v103) {
          default:
            {
            int v105 = 3;
            int v106 = v58 + v105;
            v104 = v106;
            break;
          }
          case 0:
            {
            v104 = v58;
            break;
          }
        }
        bool v107 = true;
        v82 = v104;
        break;
      }
    }
    bool v108 = true;
    int v109 = v67 + v82;
    int v110 = 1;
    int v111 = v68 + v110;
    v67 = v109;
    v68 = v111;
  }
  bool v112 = true;
  int v113 = 16;
  int v114 = v113 + v58;
  bool v115 = true;
  int v116 = simt_wave_count_bits(v115);
  v56[v114] = v116;
  int v117 = 44;
  int v118 = v117 + v58;
  int v119 = v57[v118];
  uint v120 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v121 = (int)(v120);
  int v122;
  v122 = v121;
  switch (v119) {
    case 0:
      {
      int v123 = 0;
      int v124 = 0;
      int v125;
      int v126;
      v125 = v123;
      v126 = v124;
      while (true) {
        int v127 = 4;
        int v128 = v126 * v127;
        int v129 = v128 + v58;
        int v130 = 48;
        int v131 = v130 + v129;
        int v132 = v57[v131];
        int v133 = 0;
        bool v134 = v132 != v133;
        v125 = v125;
        v126 = v126;
        if (!v134) break;
        int v135 = 68;
        int v136 = v135 + v58;
        int v137 = v57[v136];
        int v138 = 3;
        int v139 = v58 + v138;
        int v140;
        v140 = v139;
        switch (v137) {
          case 0:
            {
            int v141 = 4;
            int v142 = v58 + v141;
            v140 = v142;
            break;
          }
          case 1:
            {
            int v143 = 3;
            v140 = v143;
            break;
          }
          default:
            {
            v140 = v58;
            break;
          }
          case 2:
            {
            int v144 = 3;
            v140 = v144;
            break;
          }
        }
        bool v145 = true;
        int v146 = v125 + v140;
        int v147 = 1;
        int v148 = v126 + v147;
        v125 = v146;
        v126 = v148;
      }
      bool v149 = true;
      v122 = v125;
      break;
    }
    default:
      {
      v122 = v58;
      break;
    }
  }
  bool v150 = true;
  int v151 = 32;
  int v152 = v151 + v58;
  bool v153 = true;
  int v154 = simt_wave_count_bits(v153);
  v56[v152] = v154;
  int v155 = 72;
  int v156 = v155 + v58;
  int v157 = v57[v156];
  int v158;
  v158 = v58;
  switch (v157) {
    case 0:
      {
      int v159 = 76;
      int v160 = v159 + v58;
      int v161 = v57[v160];
      int v162 = 0;
      bool v163 = v161 != v162;
      int v164;
      if (v163) {
        int v165 = 80;
        int v166 = v165 + v58;
        int v167 = v57[v166];
        int v168 = 3;
        int v169 = v58 + v168;
        int v170;
        v170 = v169;
        switch (v167) {
          default:
            {
            v170 = v58;
          }
          case 0:
            {
            int v171 = 2;
            int v172 = v58 + v171;
            v170 = v172;
          }
          case 1:
            {
            int v173 = 1;
            int v174 = v58 + v173;
            v170 = v174;
            break;
          }
        }
        bool v175 = true;
        v164 = v170;
      } else {
        int v176 = 84;
        int v177 = v176 + v58;
        int v178 = v57[v177];
        int v179 = 0;
        bool v180 = v178 != v179;
        int v181;
        if (v180) {
          int v182 = 3;
          int v183 = v58 + v182;
          v181 = v183;
        } else {
          int v184 = 2;
          int v185 = v58 + v184;
          v181 = v185;
        }
        v164 = v181;
      }
      v158 = v164;
      break;
    }
    default:
      {
      int v186 = 88;
      int v187 = v186 + v58;
      int v188 = v57[v187];
      int v189 = 4;
      int v190 = v58 + v189;
      int v191;
      v191 = v190;
      switch (v188) {
        case 0:
          {
          int v192 = 92;
          int v193 = v192 + v58;
          int v194 = v57[v193];
          int v195 = 0;
          bool v196 = v194 != v195;
          int v197;
          if (v196) {
            v197 = v58;
          } else {
            int v198 = 4;
            v197 = v198;
          }
          v191 = v197;
          break;
        }
        default:
          {
          int v199 = 96;
          int v200 = v199 + v58;
          int v201 = v57[v200];
          int v202 = 0;
          bool v203 = v201 != v202;
          int v204;
          if (v203) {
            int v205 = 1;
            v204 = v205;
          } else {
            int v206 = 2;
            v204 = v206;
          }
          v191 = v204;
        }
        case 1:
          {
          int v207 = 100;
          int v208 = v207 + v58;
          int v209 = v57[v208];
          int v210;
          v210 = v58;
          switch (v209) {
            default:
              {
              int v211 = 3;
              int v212 = v58 + v211;
              v210 = v212;
              break;
            }
            case 0:
              {
              int v213 = 1;
              v210 = v213;
              break;
            }
            case 1:
              {
              int v214 = 0;
              v210 = v214;
              break;
            }
          }
          bool v215 = true;
          v191 = v210;
          break;
        }
      }
      bool v216 = true;
      v158 = v191;
      break;
    }
  }
  bool v217 = true;
  int v218 = 48;
  int v219 = v218 + v58;
  bool v220 = true;
  int v221 = simt_wave_count_bits(v220);
  v56[v219] = v221;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
