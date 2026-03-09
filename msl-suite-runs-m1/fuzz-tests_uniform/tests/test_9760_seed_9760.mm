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
  int v5 = v0 + v4;
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
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
        uint v21 = simt_subgroup_id(__simt_tid);
        int v22 = (int)(v21);
        v20 = v22;
      }
      int v23 = 1;
      int v24 = v12 + v23;
      v11 = v20;
      v12 = v24;
    }
    uint v25 = simt_subgroup_id(__simt_tid);
    int v26 = (int)(v25);
    v8 = v11;
  } else {
    int v27 = 0;
    bool v28 = v2 != v27;
    int v29;
    if (v28) {
      int v30 = 0;
      bool v31 = v2 != v30;
      int v32;
      if (v31) {
        v32 = v0;
      } else {
        int v33 = 3;
        v32 = v33;
      }
      v29 = v32;
    } else {
      int v34 = 4;
      int v35 = v3 % v34;
      uint v36 = simt_subgroup_id(__simt_tid);
      int v37 = (int)(v36);
      int v38;
      v38 = v37;
      switch (v35) {
        default:
          {
          int v39 = 1;
          v38 = v39;
          break;
        }
        case 0:
          {
          v38 = v0;
          break;
        }
        case 1:
          {
          int v40 = 0;
          int v41 = v0 + v40;
          v38 = v41;
          break;
        }
        case 2:
          {
          v38 = v0;
          break;
        }
      }
      v29 = v38;
    }
    int v42 = 4;
    int v43 = v0 + v42;
    v8 = v29;
  }
  bool v44 = true;
  int v45 = simt_wave_count_bits(v44);
  int v46 = 0;
  int v47 = v46 + v0;
  v1[v47] = v45;
  int v48 = 0;
  bool v49 = v2 != v48;
  int v50 = v49 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v51 [[buffer(0)]], device int* v52 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v53 = static_cast<int>(__simt_tid3.x);
  int v54 = 0;
  int v55 = v54 + v53;
  int v56 = v52[v55];
  int v57 = 4;
  int v58 = v57 + v53;
  int v59 = v52[v58];
  helper0(v53, v51, v56, v59, static_cast<int>(__simt_tid3.x));
  int v60 = 8;
  int v61 = v60 + v53;
  int v62 = v52[v61];
  int v63 = 0;
  bool v64 = v62 != v63;
  int v65;
  if (v64) {
    int v66 = 12;
    int v67 = v66 + v53;
    int v68 = v52[v67];
    int v69;
    v69 = v53;
    switch (v68) {
      default:
        {
        int v70 = 16;
        int v71 = v70 + v53;
        int v72 = v52[v71];
        int v73 = 0;
        bool v74 = v72 != v73;
        int v75;
        if (v74) {
          int v76 = 3;
          int v77 = v53 + v76;
          v75 = v77;
        } else {
          int v78 = 0;
          int v79 = v53 + v78;
          v75 = v79;
        }
        v69 = v75;
        break;
      }
      case 0:
        {
        int v80 = 0;
        int v81 = v53 + v80;
        v69 = v81;
        break;
      }
    }
    bool v82 = true;
    v65 = v69;
  } else {
    int v83 = 20;
    int v84 = v83 + v53;
    int v85 = v52[v84];
    uint v86 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v87 = (int)(v86);
    int v88;
    v88 = v87;
    switch (v85) {
      case 0:
        {
        int v89 = 24;
        int v90 = v89 + v53;
        int v91 = v52[v90];
        int v92 = 0;
        bool v93 = v91 != v92;
        int v94;
        if (v93) {
          int v95 = 4;
          int v96 = v53 + v95;
          v94 = v96;
        } else {
          int v97 = 1;
          int v98 = v53 + v97;
          v94 = v98;
        }
        v88 = v94;
      }
      case 1:
        {
        int v99 = 0;
        v88 = v99;
      }
      default:
        {
        int v100 = 28;
        int v101 = v100 + v53;
        int v102 = v52[v101];
        int v103 = 0;
        bool v104 = v102 != v103;
        int v105;
        if (v104) {
          int v106 = 4;
          int v107 = v53 + v106;
          v105 = v107;
        } else {
          v105 = v53;
        }
        v88 = v105;
      }
      case 2:
        {
        int v108 = 32;
        int v109 = v108 + v53;
        int v110 = v52[v109];
        int v111 = 0;
        bool v112 = v110 != v111;
        int v113;
        if (v112) {
          int v114 = 1;
          v113 = v114;
        } else {
          int v115 = 0;
          v113 = v115;
        }
        v88 = v113;
        break;
      }
    }
    bool v116 = true;
    v65 = v88;
  }
  int v117 = 16;
  int v118 = v117 + v53;
  bool v119 = true;
  int v120 = simt_wave_count_bits(v119);
  v51[v118] = v120;
  int v121 = 36;
  int v122 = v121 + v53;
  int v123 = v52[v122];
  int v124 = 0;
  bool v125 = v123 != v124;
  int v126;
  if (v125) {
    int v127 = 40;
    int v128 = v127 + v53;
    int v129 = v52[v128];
    int v130 = 0;
    int v131 = v53 + v130;
    int v132;
    v132 = v131;
    switch (v129) {
      case 0:
        {
        int v133 = 44;
        int v134 = v133 + v53;
        int v135 = v52[v134];
        int v136 = 1;
        int v137;
        v137 = v136;
        switch (v135) {
          case 0:
            {
            int v138 = 3;
            v137 = v138;
          }
          case 1:
            {
            v137 = v53;
            break;
          }
          case 2:
            {
            v137 = v53;
            break;
          }
          default:
            {
            v137 = v53;
            break;
          }
        }
        bool v139 = true;
        v132 = v137;
      }
      default:
        {
        int v140 = 48;
        int v141 = v140 + v53;
        int v142 = v52[v141];
        int v143 = 3;
        int v144 = v53 + v143;
        int v145;
        v145 = v144;
        switch (v142) {
          case 0:
            {
            v145 = v53;
          }
          case 1:
            {
            int v146 = 0;
            v145 = v146;
            break;
          }
          default:
            {
            v145 = v53;
          }
          case 2:
            {
            int v147 = 2;
            int v148 = v53 + v147;
            v145 = v148;
            break;
          }
        }
        bool v149 = true;
        v132 = v145;
      }
      case 1:
        {
        int v150 = 52;
        int v151 = v150 + v53;
        int v152 = v52[v151];
        int v153 = 0;
        bool v154 = v152 != v153;
        int v155;
        if (v154) {
          v155 = v53;
        } else {
          int v156 = 1;
          v155 = v156;
        }
        v132 = v155;
        break;
      }
      case 2:
        {
        int v157 = 2;
        int v158 = v53 + v157;
        v132 = v158;
        break;
      }
    }
    bool v159 = true;
    v126 = v132;
  } else {
    int v160 = 56;
    int v161 = v160 + v53;
    int v162 = v52[v161];
    int v163;
    v163 = v53;
    switch (v162) {
      case 0:
        {
        int v164 = 60;
        int v165 = v164 + v53;
        int v166 = v52[v165];
        int v167 = 0;
        bool v168 = v166 != v167;
        int v169;
        if (v168) {
          int v170 = 0;
          v169 = v170;
        } else {
          int v171 = 4;
          int v172 = v53 + v171;
          v169 = v172;
        }
        v163 = v169;
        break;
      }
      case 1:
        {
        int v173 = 64;
        int v174 = v173 + v53;
        int v175 = v52[v174];
        int v176 = 0;
        bool v177 = v175 != v176;
        int v178;
        if (v177) {
          v178 = v53;
        } else {
          int v179 = 3;
          v178 = v179;
        }
        v163 = v178;
      }
      default:
        {
        int v180 = 68;
        int v181 = v180 + v53;
        int v182 = v52[v181];
        int v183 = 1;
        int v184 = v53 + v183;
        int v185;
        v185 = v184;
        switch (v182) {
          default:
            {
            int v186 = 2;
            v185 = v186;
            break;
          }
          case 0:
            {
            v185 = v53;
            break;
          }
          case 1:
            {
            int v187 = 1;
            v185 = v187;
            break;
          }
          case 2:
            {
            int v188 = 1;
            int v189 = v53 + v188;
            v185 = v189;
            break;
          }
        }
        bool v190 = true;
        v163 = v185;
        break;
      }
    }
    bool v191 = true;
    v126 = v163;
  }
  int v192 = 32;
  int v193 = v192 + v53;
  bool v194 = true;
  int v195 = simt_wave_count_bits(v194);
  v51[v193] = v195;
  int v196 = 0;
  int v197 = 0;
  int v198;
  int v199;
  v198 = v196;
  v199 = v197;
  while (true) {
    int v200 = 4;
    int v201 = v199 * v200;
    int v202 = v201 + v53;
    int v203 = 72;
    int v204 = v203 + v202;
    int v205 = v52[v204];
    int v206 = 0;
    bool v207 = v205 != v206;
    v198 = v198;
    v199 = v199;
    if (!v207) break;
    int v208 = 0;
    int v209 = 0;
    int v210;
    int v211;
    v210 = v208;
    v211 = v209;
    while (true) {
      int v212 = 4;
      int v213 = v211 * v212;
      int v214 = v213 + v53;
      int v215 = 92;
      int v216 = v215 + v214;
      int v217 = v52[v216];
      int v218 = 0;
      bool v219 = v217 != v218;
      v210 = v210;
      v211 = v211;
      if (!v219) break;
      int v220 = v210 + v211;
      int v221 = 1;
      int v222 = v211 + v221;
      v210 = v220;
      v211 = v222;
      continue;
      ;
    }
    bool v223 = true;
    int v224 = v198 + v210;
    int v225 = 1;
    int v226 = v199 + v225;
    v198 = v224;
    v199 = v226;
  }
  bool v227 = true;
  int v228 = 48;
  int v229 = v228 + v53;
  bool v230 = true;
  int v231 = simt_wave_count_bits(v230);
  v51[v229] = v231;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
