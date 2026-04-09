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
        uint v25 = simt_subgroup_id(__simt_tid);
        int v26 = (int)(v25);
        int v27 = 1;
        int v28 = v19 + v27;
        v18 = v26;
        v19 = v28;
      }
      int v29 = 1;
      int v30 = 1;
      int v31 = v10 + v30;
      v9 = v18;
      v10 = v31;
    }
    int v32 = 1;
    v6 = v9;
  } else {
    int v33 = 3;
    int v34 = v0 + v33;
    int v35;
    v35 = v34;
    switch (v3) {
      default:
        {
        v35 = v0;
        break;
      }
      case 0:
        {
        int v36 = 0;
        v35 = v36;
        break;
      }
    }
    int v37 = 3;
    int v38 = v0 + v37;
    v6 = v35;
  }
  bool v39 = true;
  int v40 = simt_wave_count_bits(v39);
  int v41 = 0;
  int v42 = v41 + v0;
  v1[v42] = v40;
  return;
}

kernel void kernel_main(device int* v43 [[buffer(0)]], device int* v44 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v45 = static_cast<int>(__simt_tid3.x);
  int v46 = 0;
  int v47 = v46 + v45;
  int v48 = v44[v47];
  int v49 = 4;
  int v50 = v49 + v45;
  int v51 = v44[v50];
  helper0(v45, v43, v48, v51, static_cast<int>(__simt_tid3.x));
  int v52 = 8;
  int v53 = v52 + v45;
  int v54 = v44[v53];
  int v55;
  v55 = v45;
  switch (v54) {
    case 0:
      {
      int v56 = 12;
      int v57 = v56 + v45;
      int v58 = v44[v57];
      int v59 = 0;
      bool v60 = v58 != v59;
      int v61;
      if (v60) {
        int v62 = 1;
        v61 = v62;
      } else {
        int v63 = 0;
        int v64 = 0;
        int v65;
        int v66;
        v65 = v63;
        v66 = v64;
        while (true) {
          int v67 = 4;
          int v68 = v66 * v67;
          int v69 = v68 + v45;
          int v70 = 16;
          int v71 = v70 + v69;
          int v72 = v44[v71];
          int v73 = 0;
          bool v74 = v72 != v73;
          v65 = v65;
          v66 = v66;
          if (!v74) break;
          int v75 = v65 + v66;
          int v76 = 1;
          int v77 = v66 + v76;
          v65 = v75;
          v66 = v77;
        }
        bool v78 = true;
        v61 = v65;
      }
      v55 = v61;
      break;
    }
    default:
      {
      int v79 = 0;
      int v80 = 0;
      int v81;
      int v82;
      v81 = v79;
      v82 = v80;
      while (true) {
        int v83 = 4;
        int v84 = v82 * v83;
        int v85 = v84 + v45;
        int v86 = 36;
        int v87 = v86 + v85;
        int v88 = v44[v87];
        int v89 = 0;
        bool v90 = v88 != v89;
        v81 = v81;
        v82 = v82;
        if (!v90) break;
        int v91 = 56;
        int v92 = v91 + v45;
        int v93 = v44[v92];
        int v94 = 0;
        bool v95 = v93 != v94;
        int v96;
        if (v95) {
          v96 = v45;
        } else {
          int v97 = 1;
          v96 = v97;
        }
        int v98 = v81 + v96;
        int v99 = 1;
        int v100 = v82 + v99;
        v81 = v98;
        v82 = v100;
      }
      bool v101 = true;
      v55 = v81;
    }
    case 1:
      {
      int v102 = 1;
      int v103 = v45 + v102;
      v55 = v103;
      break;
    }
  }
  bool v104 = true;
  int v105 = 16;
  int v106 = v105 + v45;
  bool v107 = true;
  int v108 = simt_wave_count_bits(v107);
  v43[v106] = v108;
  int v109 = 0;
  int v110 = 0;
  int v111;
  int v112;
  v111 = v109;
  v112 = v110;
  while (true) {
    int v113 = 4;
    int v114 = v112 * v113;
    int v115 = v114 + v45;
    int v116 = 60;
    int v117 = v116 + v115;
    int v118 = v44[v117];
    int v119 = 0;
    bool v120 = v118 != v119;
    v111 = v111;
    v112 = v112;
    if (!v120) break;
    int v121 = v111 + v112;
    int v122 = 1;
    int v123 = v112 + v122;
    v111 = v121;
    v112 = v123;
  }
  bool v124 = true;
  int v125 = 32;
  int v126 = v125 + v45;
  bool v127 = true;
  int v128 = simt_wave_count_bits(v127);
  v43[v126] = v128;
  int v129 = 80;
  int v130 = v129 + v45;
  int v131 = v44[v130];
  int v132 = 0;
  bool v133 = v131 != v132;
  int v134;
  if (v133) {
    int v135 = 84;
    int v136 = v135 + v45;
    int v137 = v44[v136];
    int v138 = 1;
    int v139;
    v139 = v138;
    switch (v137) {
      case 0:
        {
        int v140 = 88;
        int v141 = v140 + v45;
        int v142 = v44[v141];
        int v143 = 1;
        int v144 = v45 + v143;
        int v145;
        v145 = v144;
        switch (v142) {
          case 0:
            {
            int v146 = 0;
            v145 = v146;
          }
          case 1:
            {
            int v147 = 1;
            int v148 = v45 + v147;
            v145 = v148;
          }
          case 2:
            {
            int v149 = 2;
            v145 = v149;
            break;
          }
          default:
            {
            int v150 = 0;
            int v151 = v45 + v150;
            v145 = v151;
            break;
          }
        }
        bool v152 = true;
        v139 = v145;
        break;
      }
      default:
        {
        int v153 = 92;
        int v154 = v153 + v45;
        int v155 = v44[v154];
        int v156 = 1;
        int v157;
        v157 = v156;
        switch (v155) {
          case 0:
            {
            int v158 = 2;
            int v159 = v45 + v158;
            v157 = v159;
            break;
          }
          default:
            {
            int v160 = 4;
            v157 = v160;
            break;
          }
          case 1:
            {
            int v161 = 1;
            v157 = v161;
            break;
          }
        }
        bool v162 = true;
        v139 = v157;
        break;
      }
      case 1:
        {
        int v163 = 96;
        int v164 = v163 + v45;
        int v165 = v44[v164];
        int v166;
        v166 = v45;
        switch (v165) {
          default:
            {
            int v167 = 0;
            int v168 = v45 + v167;
            v166 = v168;
          }
          case 0:
            {
            int v169 = 2;
            int v170 = v45 + v169;
            v166 = v170;
            break;
          }
        }
        bool v171 = true;
        v139 = v166;
        break;
      }
      case 2:
        {
        int v172 = 100;
        int v173 = v172 + v45;
        int v174 = v44[v173];
        int v175 = 0;
        bool v176 = v174 != v175;
        int v177;
        if (v176) {
          int v178 = 1;
          v177 = v178;
        } else {
          int v179 = 4;
          int v180 = v45 + v179;
          v177 = v180;
        }
        v139 = v177;
        break;
      }
    }
    bool v181 = true;
    v134 = v139;
  } else {
    int v182 = 0;
    int v183 = 0;
    int v184;
    int v185;
    v184 = v182;
    v185 = v183;
    while (true) {
      int v186 = 4;
      int v187 = v185 * v186;
      int v188 = v187 + v45;
      int v189 = 104;
      int v190 = v189 + v188;
      int v191 = v44[v190];
      int v192 = 0;
      bool v193 = v191 != v192;
      v184 = v184;
      v185 = v185;
      if (!v193) break;
      int v194 = 124;
      int v195 = v194 + v45;
      int v196 = v44[v195];
      int v197 = 0;
      bool v198 = v196 != v197;
      int v199;
      if (v198) {
        int v200 = 1;
        int v201 = v45 + v200;
        v199 = v201;
      } else {
        uint v202 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v203 = (int)(v202);
        v199 = v203;
      }
      int v204 = v184 + v199;
      int v205 = 1;
      int v206 = v185 + v205;
      v184 = v204;
      v185 = v206;
      break;
      ;
    }
    bool v207 = true;
    v134 = v184;
  }
  int v208 = 48;
  int v209 = v208 + v45;
  bool v210 = true;
  int v211 = simt_wave_count_bits(v210);
  v43[v209] = v211;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
