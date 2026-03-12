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
    int v7 = 0;
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      int v16 = 0;
      int v17 = 0;
      int v18;
      int v19;
      v18 = v16;
      v19 = v17;
      while (true) {
        int v20 = 4;
        int v21 = v3 % v20;
        int v22 = 1;
        int v23 = v21 + v22;
        bool v24 = v19 < v23;
        v18 = v18;
        v19 = v19;
        if (!v24) break;
        int v25 = 1;
        int v26 = v19 + v25;
        v18 = v0;
        v19 = v26;
        break;
        ;
      }
      uint v27 = simt_lane_id(__simt_tid);
      int v28 = (int)(v27);
      int v29 = 1;
      int v30 = v10 + v29;
      v9 = v18;
      v10 = v30;
      continue;
      ;
    }
    int v31 = 3;
    int v32 = v0 + v31;
    v6 = v9;
  } else {
    int v33 = 0;
    int v34 = v0 + v33;
    int v35;
    v35 = v34;
    switch (v3) {
      case 0:
        {
        int v36 = 0;
        int v37 = v0 + v36;
        v35 = v37;
      }
      default:
        {
        int v38 = 0;
        bool v39 = v2 != v38;
        int v40;
        if (v39) {
          v40 = v0;
        } else {
          int v41 = 3;
          v40 = v41;
        }
        v35 = v40;
        break;
      }
    }
    uint v42 = simt_subgroup_id(__simt_tid);
    int v43 = (int)(v42);
    v6 = v35;
  }
  bool v44 = true;
  int v45 = simt_wave_count_bits(v44);
  int v46 = 0;
  int v47 = v46 + v0;
  v1[v47] = v45;
  return;
}

kernel void kernel_main(device int* v48 [[buffer(0)]], device int* v49 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v50 = static_cast<int>(__simt_tid3.x);
  int v51 = 0;
  int v52 = v51 + v50;
  int v53 = v49[v52];
  int v54 = 4;
  int v55 = v54 + v50;
  int v56 = v49[v55];
  helper0(v50, v48, v53, v56, static_cast<int>(__simt_tid3.x));
  int v57 = 8;
  int v58 = v57 + v50;
  int v59 = v49[v58];
  int v60 = 0;
  bool v61 = v59 != v60;
  int v62;
  if (v61) {
    int v63 = 12;
    int v64 = v63 + v50;
    int v65 = v49[v64];
    int v66 = 0;
    bool v67 = v65 != v66;
    int v68;
    if (v67) {
      int v69 = 16;
      int v70 = v69 + v50;
      int v71 = v49[v70];
      int v72 = 3;
      int v73 = v50 + v72;
      int v74;
      v74 = v73;
      switch (v71) {
        case 0:
          {
          int v75 = 1;
          v74 = v75;
          break;
        }
        default:
          {
          int v76 = 1;
          int v77 = v50 + v76;
          v74 = v77;
          break;
        }
        case 1:
          {
          int v78 = 0;
          v74 = v78;
          break;
        }
      }
      bool v79 = true;
      v68 = v74;
    } else {
      int v80 = 20;
      int v81 = v80 + v50;
      int v82 = v49[v81];
      uint v83 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v84 = (int)(v83);
      int v85;
      v85 = v84;
      switch (v82) {
        default:
          {
          int v86 = 2;
          int v87 = v50 + v86;
          v85 = v87;
          break;
        }
        case 0:
          {
          v85 = v50;
          break;
        }
        case 1:
          {
          v85 = v50;
          break;
        }
        case 2:
          {
          int v88 = 2;
          v85 = v88;
          break;
        }
      }
      bool v89 = true;
      v68 = v85;
    }
    v62 = v68;
  } else {
    int v90 = 24;
    int v91 = v90 + v50;
    int v92 = v49[v91];
    int v93 = 0;
    int v94;
    v94 = v93;
    switch (v92) {
      default:
        {
        v94 = v50;
        break;
      }
      case 0:
        {
        int v95 = 28;
        int v96 = v95 + v50;
        int v97 = v49[v96];
        int v98;
        v98 = v50;
        switch (v97) {
          case 0:
            {
            v98 = v50;
          }
          case 1:
            {
            int v99 = 2;
            int v100 = v50 + v99;
            v98 = v100;
          }
          default:
            {
            int v101 = 2;
            v98 = v101;
            break;
          }
        }
        bool v102 = true;
        v94 = v98;
      }
      case 1:
        {
        int v103 = 32;
        int v104 = v103 + v50;
        int v105 = v49[v104];
        int v106 = 0;
        bool v107 = v105 != v106;
        int v108;
        if (v107) {
          v108 = v50;
        } else {
          int v109 = 3;
          int v110 = v50 + v109;
          v108 = v110;
        }
        v94 = v108;
      }
      case 2:
        {
        int v111 = 3;
        v94 = v111;
        break;
      }
    }
    bool v112 = true;
    v62 = v94;
  }
  int v113 = 16;
  int v114 = v113 + v50;
  bool v115 = true;
  int v116 = simt_wave_count_bits(v115);
  v48[v114] = v116;
  int v117 = 36;
  int v118 = v117 + v50;
  int v119 = v49[v118];
  int v120 = 0;
  bool v121 = v119 != v120;
  int v122;
  if (v121) {
    int v123 = 40;
    int v124 = v123 + v50;
    int v125 = v49[v124];
    int v126 = 0;
    bool v127 = v125 != v126;
    int v128;
    if (v127) {
      int v129 = 44;
      int v130 = v129 + v50;
      int v131 = v49[v130];
      int v132 = 0;
      bool v133 = v131 != v132;
      int v134;
      if (v133) {
        uint v135 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v136 = (int)(v135);
        v134 = v136;
      } else {
        uint v137 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v138 = (int)(v137);
        v134 = v138;
      }
      v128 = v134;
    } else {
      uint v139 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v140 = (int)(v139);
      v128 = v140;
    }
    v122 = v128;
  } else {
    int v141 = 0;
    int v142 = 0;
    int v143;
    int v144;
    v143 = v141;
    v144 = v142;
    while (true) {
      int v145 = 4;
      int v146 = v144 * v145;
      int v147 = v146 + v50;
      int v148 = 48;
      int v149 = v148 + v147;
      int v150 = v49[v149];
      int v151 = 0;
      bool v152 = v150 != v151;
      v143 = v143;
      v144 = v144;
      if (!v152) break;
      int v153 = 68;
      int v154 = v153 + v50;
      int v155 = v49[v154];
      int v156 = 0;
      bool v157 = v155 != v156;
      int v158;
      if (v157) {
        uint v159 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v160 = (int)(v159);
        v158 = v160;
      } else {
        int v161 = 2;
        v158 = v161;
      }
      int v162 = v143 + v158;
      int v163 = 1;
      int v164 = v144 + v163;
      v143 = v162;
      v144 = v164;
      continue;
      ;
    }
    bool v165 = true;
    v122 = v143;
  }
  int v166 = 32;
  int v167 = v166 + v50;
  bool v168 = true;
  int v169 = simt_wave_count_bits(v168);
  v48[v167] = v169;
  int v170 = 0;
  int v171 = 0;
  int v172;
  int v173;
  v172 = v170;
  v173 = v171;
  while (true) {
    int v174 = 4;
    int v175 = v173 * v174;
    int v176 = v175 + v50;
    int v177 = 72;
    int v178 = v177 + v176;
    int v179 = v49[v178];
    int v180 = 0;
    bool v181 = v179 != v180;
    v172 = v172;
    v173 = v173;
    if (!v181) break;
    int v182 = 0;
    int v183 = 0;
    int v184;
    int v185;
    v184 = v182;
    v185 = v183;
    while (true) {
      int v186 = 4;
      int v187 = v185 * v186;
      int v188 = v187 + v50;
      int v189 = 92;
      int v190 = v189 + v188;
      int v191 = v49[v190];
      int v192 = 0;
      bool v193 = v191 != v192;
      v184 = v184;
      v185 = v185;
      if (!v193) break;
      int v194 = 112;
      int v195 = v194 + v50;
      int v196 = v49[v195];
      uint v197 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v198 = (int)(v197);
      int v199;
      v199 = v198;
      switch (v196) {
        case 0:
          {
          v199 = v50;
          break;
        }
        case 1:
          {
          int v200 = 2;
          int v201 = v50 + v200;
          v199 = v201;
          break;
        }
        default:
          {
          int v202 = 1;
          int v203 = v50 + v202;
          v199 = v203;
          break;
        }
        case 2:
          {
          v199 = v50;
          break;
        }
      }
      bool v204 = true;
      int v205 = v184 + v199;
      int v206 = 1;
      int v207 = v185 + v206;
      v184 = v205;
      v185 = v207;
    }
    bool v208 = true;
    int v209 = v172 + v184;
    int v210 = 1;
    int v211 = v173 + v210;
    v172 = v209;
    v173 = v211;
  }
  bool v212 = true;
  int v213 = 48;
  int v214 = v213 + v50;
  bool v215 = true;
  int v216 = simt_wave_count_bits(v215);
  v48[v214] = v216;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 116; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
