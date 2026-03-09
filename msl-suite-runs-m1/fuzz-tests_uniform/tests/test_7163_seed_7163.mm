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
    int v7 = 3;
    int v8 = v3 % v7;
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      default:
        {
        int v12 = 2;
        int v13 = v3 % v12;
        int v14 = 0;
        int v15;
        v15 = v14;
        switch (v13) {
          default:
            {
            int v16 = 3;
            int v17 = v0 + v16;
            v15 = v17;
            break;
          }
          case 0:
            {
            int v18 = 0;
            int v19 = v0 + v18;
            v15 = v19;
          }
          case 1:
            {
            int v20 = 4;
            v15 = v20;
            break;
          }
        }
        int v21 = 3;
        v11 = v15;
        break;
      }
      case 0:
        {
        int v22 = 0;
        bool v23 = v2 != v22;
        int v24;
        if (v23) {
          int v25 = 3;
          int v26 = v0 + v25;
          v24 = v26;
        } else {
          int v27 = 1;
          int v28 = v0 + v27;
          v24 = v28;
        }
        int v29 = 3;
        v11 = v24;
        break;
      }
      case 1:
        {
        int v30 = 4;
        int v31 = v0 + v30;
        v11 = v31;
        break;
      }
      case 2:
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
          int v41 = 4;
          int v42 = v0 + v41;
          int v43 = 1;
          int v44 = v35 + v43;
          v34 = v42;
          v35 = v44;
        }
        int v45 = 4;
        int v46 = v0 + v45;
        v11 = v34;
        break;
      }
    }
    int v47 = 1;
    v6 = v11;
  } else {
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
      int v57 = 0;
      bool v58 = v2 != v57;
      int v59;
      if (v58) {
        uint v60 = simt_lane_id(__simt_tid);
        int v61 = (int)(v60);
        v59 = v61;
      } else {
        int v62 = 3;
        v59 = v62;
      }
      uint v63 = simt_subgroup_id(__simt_tid);
      int v64 = (int)(v63);
      int v65 = 1;
      int v66 = v51 + v65;
      v50 = v59;
      v51 = v66;
    }
    uint v67 = simt_lane_id(__simt_tid);
    int v68 = (int)(v67);
    v6 = v50;
  }
  bool v69 = true;
  int v70 = simt_wave_count_bits(v69);
  int v71 = 0;
  int v72 = v71 + v0;
  v1[v72] = v70;
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
  int v82 = 0;
  int v83 = 0;
  int v84;
  int v85;
  v84 = v82;
  v85 = v83;
  while (true) {
    int v86 = 4;
    int v87 = v85 * v86;
    int v88 = v87 + v75;
    int v89 = 8;
    int v90 = v89 + v88;
    int v91 = v74[v90];
    int v92 = 0;
    bool v93 = v91 != v92;
    v84 = v84;
    v85 = v85;
    if (!v93) break;
    int v94 = 0;
    int v95 = 0;
    int v96;
    int v97;
    v96 = v94;
    v97 = v95;
    while (true) {
      int v98 = 4;
      int v99 = v97 * v98;
      int v100 = v99 + v75;
      int v101 = 28;
      int v102 = v101 + v100;
      int v103 = v74[v102];
      int v104 = 0;
      bool v105 = v103 != v104;
      v96 = v96;
      v97 = v97;
      if (!v105) break;
      int v106 = 48;
      int v107 = v106 + v75;
      int v108 = v74[v107];
      uint v109 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v110 = (int)(v109);
      int v111;
      v111 = v110;
      switch (v108) {
        default:
          {
          int v112 = 1;
          int v113 = v75 + v112;
          v111 = v113;
          break;
        }
        case 0:
          {
          v111 = v75;
          break;
        }
        case 1:
          {
          int v114 = 2;
          int v115 = v75 + v114;
          v111 = v115;
          break;
        }
      }
      bool v116 = true;
      int v117 = v96 + v111;
      int v118 = 1;
      int v119 = v97 + v118;
      v96 = v117;
      v97 = v119;
    }
    bool v120 = true;
    int v121 = v84 + v96;
    int v122 = 1;
    int v123 = v85 + v122;
    v84 = v121;
    v85 = v123;
  }
  bool v124 = true;
  int v125 = 16;
  int v126 = v125 + v75;
  bool v127 = true;
  int v128 = simt_wave_count_bits(v127);
  v73[v126] = v128;
  uint v129 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v130 = (int)(v129);
  int v131 = 52;
  int v132 = v131 + v75;
  int v133 = v74[v132];
  int v134 = 0;
  bool v135 = v133 != v134;
  int v136;
  if (v135) {
    int v137 = 56;
    int v138 = v137 + v75;
    int v139 = v74[v138];
    int v140;
    v140 = v75;
    switch (v139) {
      default:
        {
        int v141 = 60;
        int v142 = v141 + v75;
        int v143 = v74[v142];
        int v144;
        v144 = v75;
        switch (v143) {
          case 0:
            {
            int v145 = 1;
            v144 = v145;
          }
          default:
            {
            int v146 = 2;
            v144 = v146;
          }
          case 1:
            {
            v144 = v75;
            break;
          }
        }
        bool v147 = true;
        v140 = v144;
        break;
      }
      case 0:
        {
        int v148 = 0;
        int v149 = 0;
        int v150;
        int v151;
        v150 = v148;
        v151 = v149;
        while (true) {
          int v152 = 4;
          int v153 = v151 * v152;
          int v154 = v153 + v75;
          int v155 = 64;
          int v156 = v155 + v154;
          int v157 = v74[v156];
          int v158 = 0;
          bool v159 = v157 != v158;
          v150 = v150;
          v151 = v151;
          if (!v159) break;
          int v160 = v150 + v151;
          int v161 = 1;
          int v162 = v151 + v161;
          v150 = v160;
          v151 = v162;
        }
        bool v163 = true;
        v140 = v150;
        break;
      }
      case 1:
        {
        int v164 = 84;
        int v165 = v164 + v75;
        int v166 = v74[v165];
        int v167 = 0;
        bool v168 = v166 != v167;
        int v169;
        if (v168) {
          int v170 = 1;
          v169 = v170;
        } else {
          int v171 = 4;
          v169 = v171;
        }
        v140 = v169;
        break;
      }
      case 2:
        {
        int v172 = 88;
        int v173 = v172 + v75;
        int v174 = v74[v173];
        int v175 = 3;
        int v176;
        v176 = v175;
        switch (v174) {
          case 0:
            {
            int v177 = 4;
            int v178 = v75 + v177;
            v176 = v178;
            break;
          }
          case 1:
            {
            v176 = v75;
          }
          default:
            {
            int v179 = 1;
            v176 = v179;
            break;
          }
        }
        bool v180 = true;
        v140 = v176;
        break;
      }
    }
    bool v181 = true;
    v136 = v140;
  } else {
    int v182 = 92;
    int v183 = v182 + v75;
    int v184 = v74[v183];
    int v185 = 0;
    bool v186 = v184 != v185;
    int v187;
    if (v186) {
      int v188 = 96;
      int v189 = v188 + v75;
      int v190 = v74[v189];
      uint v191 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v192 = (int)(v191);
      int v193;
      v193 = v192;
      switch (v190) {
        case 0:
          {
          int v194 = 2;
          v193 = v194;
          break;
        }
        default:
          {
          int v195 = 1;
          int v196 = v75 + v195;
          v193 = v196;
          break;
        }
        case 1:
          {
          int v197 = 3;
          int v198 = v75 + v197;
          v193 = v198;
          break;
        }
        case 2:
          {
          int v199 = 2;
          v193 = v199;
          break;
        }
      }
      bool v200 = true;
      v187 = v193;
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
        int v207 = v206 + v75;
        int v208 = 100;
        int v209 = v208 + v207;
        int v210 = v74[v209];
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
      v187 = v203;
    }
    v136 = v187;
  }
  int v217 = 32;
  int v218 = v217 + v75;
  bool v219 = true;
  int v220 = simt_wave_count_bits(v219);
  v73[v218] = v220;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
