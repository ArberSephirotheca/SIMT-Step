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
    int v9 = v3 % v8;
    int v10;
    v10 = v0;
    switch (v9) {
      case 0:
        {
        int v11 = 3;
        int v12 = v3 % v11;
        int v13;
        v13 = v0;
        switch (v12) {
          case 0:
            {
            int v14 = 1;
            v13 = v14;
            break;
          }
          default:
            {
            v13 = v0;
            break;
          }
          case 1:
            {
            int v15 = 2;
            v13 = v15;
            break;
          }
        }
        int v16 = 4;
        int v17 = v0 + v16;
        v10 = v13;
        break;
      }
      default:
        {
        int v18 = 0;
        int v19 = 0;
        int v20;
        int v21;
        v20 = v18;
        v21 = v19;
        while (true) {
          int v22 = 4;
          int v23 = v3 % v22;
          int v24 = 1;
          int v25 = v23 + v24;
          bool v26 = v21 < v25;
          v20 = v20;
          v21 = v21;
          if (!v26) break;
          int v27 = 1;
          int v28 = v0 + v27;
          int v29 = 1;
          int v30 = v21 + v29;
          v20 = v28;
          v21 = v30;
        }
        int v31 = 3;
        v10 = v20;
        break;
      }
      case 1:
        {
        int v32 = 0;
        int v33 = 0;
        int v34;
        int v35;
        v34 = v32;
        v35 = v33;
        while (true) {
          int v36 = 4;
          int v37 = v3 % v36;
          int v38 = 1;
          int v39 = v37 + v38;
          bool v40 = v35 < v39;
          v34 = v34;
          v35 = v35;
          if (!v40) break;
          int v41 = 0;
          int v42 = 1;
          int v43 = v35 + v42;
          v34 = v41;
          v35 = v43;
        }
        int v44 = 1;
        int v45 = v0 + v44;
        v10 = v34;
        break;
      }
      case 2:
        {
        int v46 = 0;
        bool v47 = v2 != v46;
        int v48;
        if (v47) {
          v48 = v0;
        } else {
          int v49 = 3;
          int v50 = v0 + v49;
          v48 = v50;
        }
        int v51 = 1;
        int v52 = v0 + v51;
        v10 = v48;
        break;
      }
    }
    int v53 = 0;
    int v54 = v0 + v53;
    v7 = v10;
  } else {
    int v55 = 0;
    bool v56 = v2 != v55;
    int v57;
    if (v56) {
      int v58 = 3;
      int v59 = v3 % v58;
      uint v60 = simt_subgroup_id(__simt_tid);
      int v61 = (int)(v60);
      int v62;
      v62 = v61;
      switch (v59) {
        case 0:
          {
          int v63 = 2;
          int v64 = v0 + v63;
          v62 = v64;
          break;
        }
        default:
          {
          int v65 = 0;
          v62 = v65;
        }
        case 1:
          {
          v62 = v0;
          break;
        }
      }
      uint v66 = simt_lane_id(__simt_tid);
      int v67 = (int)(v66);
      v57 = v62;
    } else {
      int v68 = 2;
      int v69 = v0 + v68;
      v57 = v69;
    }
    uint v70 = simt_lane_id(__simt_tid);
    int v71 = (int)(v70);
    v7 = v57;
  }
  bool v72 = true;
  int v73 = simt_wave_count_bits(v72);
  int v74 = 0;
  int v75 = v74 + v0;
  v1[v75] = v73;
  int v76 = 0;
  bool v77 = v2 != v76;
  int v78 = v77 ? v4 : v7;
  return;
}

kernel void kernel_main(device int* v79 [[buffer(0)]], device int* v80 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v81 = static_cast<int>(__simt_tid3.x);
  int v82 = 0;
  int v83 = v82 + v81;
  int v84 = v80[v83];
  int v85 = 4;
  int v86 = v85 + v81;
  int v87 = v80[v86];
  helper0(v81, v79, v84, v87, static_cast<int>(__simt_tid3.x));
  int v88 = 8;
  int v89 = v88 + v81;
  int v90 = v80[v89];
  int v91 = 0;
  bool v92 = v90 != v91;
  int v93;
  if (v92) {
    int v94 = 12;
    int v95 = v94 + v81;
    int v96 = v80[v95];
    uint v97 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v98 = (int)(v97);
    int v99;
    v99 = v98;
    switch (v96) {
      default:
        {
        int v100 = 16;
        int v101 = v100 + v81;
        int v102 = v80[v101];
        int v103;
        v103 = v81;
        switch (v102) {
          default:
            {
            int v104 = 2;
            v103 = v104;
            break;
          }
          case 0:
            {
            int v105 = 4;
            v103 = v105;
            break;
          }
          case 1:
            {
            int v106 = 4;
            int v107 = v81 + v106;
            v103 = v107;
            break;
          }
        }
        bool v108 = true;
        v99 = v103;
        break;
      }
      case 0:
        {
        int v109 = 20;
        int v110 = v109 + v81;
        int v111 = v80[v110];
        int v112 = 0;
        bool v113 = v111 != v112;
        int v114;
        if (v113) {
          v114 = v81;
        } else {
          v114 = v81;
        }
        v99 = v114;
        break;
      }
      case 1:
        {
        int v115 = 24;
        int v116 = v115 + v81;
        int v117 = v80[v116];
        int v118 = 3;
        int v119 = v81 + v118;
        int v120;
        v120 = v119;
        switch (v117) {
          case 0:
            {
            v120 = v81;
            break;
          }
          case 1:
            {
            int v121 = 4;
            v120 = v121;
            break;
          }
          default:
            {
            v120 = v81;
            break;
          }
        }
        bool v122 = true;
        v99 = v120;
        break;
      }
      case 2:
        {
        int v123 = 28;
        int v124 = v123 + v81;
        int v125 = v80[v124];
        int v126 = 4;
        int v127;
        v127 = v126;
        switch (v125) {
          case 0:
            {
            v127 = v81;
            break;
          }
          default:
            {
            int v128 = 4;
            v127 = v128;
          }
          case 1:
            {
            int v129 = 4;
            v127 = v129;
            break;
          }
        }
        bool v130 = true;
        v99 = v127;
        break;
      }
    }
    bool v131 = true;
    v93 = v99;
  } else {
    int v132 = 32;
    int v133 = v132 + v81;
    int v134 = v80[v133];
    int v135 = 0;
    bool v136 = v134 != v135;
    int v137;
    if (v136) {
      int v138 = 0;
      int v139 = v81 + v138;
      v137 = v139;
    } else {
      int v140 = 0;
      int v141 = 0;
      int v142;
      int v143;
      v142 = v140;
      v143 = v141;
      while (true) {
        int v144 = 4;
        int v145 = v143 * v144;
        int v146 = v145 + v81;
        int v147 = 36;
        int v148 = v147 + v146;
        int v149 = v80[v148];
        int v150 = 0;
        bool v151 = v149 != v150;
        v142 = v142;
        v143 = v143;
        if (!v151) break;
        int v152 = v142 + v143;
        int v153 = 1;
        int v154 = v143 + v153;
        v142 = v152;
        v143 = v154;
      }
      bool v155 = true;
      v137 = v142;
    }
    v93 = v137;
  }
  int v156 = 16;
  int v157 = v156 + v81;
  bool v158 = true;
  int v159 = simt_wave_count_bits(v158);
  v79[v157] = v159;
  int v160 = 0;
  int v161 = 0;
  int v162;
  int v163;
  v162 = v160;
  v163 = v161;
  while (true) {
    int v164 = 4;
    int v165 = v163 * v164;
    int v166 = v165 + v81;
    int v167 = 56;
    int v168 = v167 + v166;
    int v169 = v80[v168];
    int v170 = 0;
    bool v171 = v169 != v170;
    v162 = v162;
    v163 = v163;
    if (!v171) break;
    int v172 = v162 + v163;
    int v173 = 1;
    int v174 = v163 + v173;
    v162 = v172;
    v163 = v174;
  }
  bool v175 = true;
  int v176 = 32;
  int v177 = v176 + v81;
  bool v178 = true;
  int v179 = simt_wave_count_bits(v178);
  v79[v177] = v179;
  int v180 = 76;
  int v181 = v180 + v81;
  int v182 = v80[v181];
  int v183 = 0;
  bool v184 = v182 != v183;
  int v185;
  if (v184) {
    uint v186 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v187 = (int)(v186);
    v185 = v187;
  } else {
    int v188 = 80;
    int v189 = v188 + v81;
    int v190 = v80[v189];
    int v191 = 0;
    bool v192 = v190 != v191;
    int v193;
    if (v192) {
      int v194 = 84;
      int v195 = v194 + v81;
      int v196 = v80[v195];
      int v197;
      v197 = v81;
      switch (v196) {
        case 0:
          {
          v197 = v81;
          break;
        }
        default:
          {
          int v198 = 3;
          int v199 = v81 + v198;
          v197 = v199;
          break;
        }
        case 1:
          {
          v197 = v81;
          break;
        }
      }
      bool v200 = true;
      v193 = v197;
    } else {
      int v201 = 0;
      int v202 = 0;
      int v203;
      int v204;
      v203 = v201;
      v204 = v202;
      while (true) {
        int v205 = 4;
        int v206 = v204 * v205;
        int v207 = v206 + v81;
        int v208 = 88;
        int v209 = v208 + v207;
        int v210 = v80[v209];
        int v211 = 0;
        bool v212 = v210 != v211;
        v203 = v203;
        v204 = v204;
        if (!v212) break;
        int v213 = v203 + v204;
        int v214 = 1;
        int v215 = v204 + v214;
        v203 = v213;
        v204 = v215;
      }
      bool v216 = true;
      v193 = v203;
    }
    v185 = v193;
  }
  int v217 = 48;
  int v218 = v217 + v81;
  bool v219 = true;
  int v220 = simt_wave_count_bits(v219);
  v79[v218] = v220;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
