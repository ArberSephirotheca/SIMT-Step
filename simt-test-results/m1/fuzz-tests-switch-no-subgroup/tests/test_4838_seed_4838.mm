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
    int v13 = 0;
    int v14 = 0;
    int v15;
    int v16;
    v15 = v13;
    v16 = v14;
    while (true) {
      int v17 = 4;
      int v18 = v3 % v17;
      int v19 = 1;
      int v20 = v18 + v19;
      bool v21 = v16 < v20;
      v15 = v15;
      v16 = v16;
      if (!v21) break;
      int v22 = 0;
      int v23 = 0;
      int v24;
      int v25;
      v24 = v22;
      v25 = v23;
      while (true) {
        int v26 = 4;
        int v27 = v3 % v26;
        int v28 = 1;
        int v29 = v27 + v28;
        bool v30 = v25 < v29;
        v24 = v24;
        v25 = v25;
        if (!v30) break;
        bool v31 = true;
        int v32 = simt_wave_count_bits(v31);
        int v33 = 0;
        int v34 = 4;
        int v35 = v25 * v34;
        int v36 = v33 + v35;
        int v37 = v36 + v0;
        v1[v37] = v32;
        int v38 = 1;
        int v39 = v25 + v38;
        v24 = v32;
        v25 = v39;
        continue;
        ;
      }
      int v40 = 1;
      int v41 = v16 + v40;
      v15 = v24;
      v16 = v41;
      continue;
      ;
    }
    int v42 = 1;
    int v43 = v7 + v42;
    v6 = v15;
    v7 = v43;
  }
  return;
}

kernel void kernel_main(device int* v44 [[buffer(0)]], device int* v45 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v46 = static_cast<int>(__simt_tid3.x);
  int v47 = 0;
  int v48 = v47 + v46;
  int v49 = v45[v48];
  int v50 = 4;
  int v51 = v50 + v46;
  int v52 = v45[v51];
  int v53 = 0;
  bool v54 = v49 != v53;
  if (v54) {
  } else {
    int v55 = 8;
    int v56 = v55 + v46;
    int v57 = v45[v56];
    int v58 = 0;
    bool v59 = v57 != v58;
    if (v59) {
      helper0(v46, v44, v49, v52, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v60 = 12;
  int v61 = v60 + v46;
  int v62 = v45[v61];
  int v63 = 0;
  bool v64 = v62 != v63;
  int v65;
  if (v64) {
    int v66 = 16;
    int v67 = v66 + v46;
    int v68 = v45[v67];
    uint v69 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v70 = (int)(v69);
    int v71;
    v71 = v70;
    switch (v68) {
      default:
        {
        int v72 = 20;
        int v73 = v72 + v46;
        int v74 = v45[v73];
        int v75 = 3;
        int v76;
        v76 = v75;
        switch (v74) {
          case 0:
            {
            int v77 = 2;
            v76 = v77;
            break;
          }
          case 1:
            {
            int v78 = 1;
            v76 = v78;
            break;
          }
          default:
            {
            int v79 = 0;
            v76 = v79;
            break;
          }
        }
        v71 = v76;
        break;
      }
      case 0:
        {
        int v80 = 24;
        int v81 = v80 + v46;
        int v82 = v45[v81];
        int v83 = 0;
        bool v84 = v82 != v83;
        int v85;
        if (v84) {
          int v86 = 2;
          int v87 = v46 + v86;
          v85 = v87;
        } else {
          int v88 = 1;
          v85 = v88;
        }
        v71 = v85;
        break;
      }
      case 1:
        {
        int v89 = 28;
        int v90 = v89 + v46;
        int v91 = v45[v90];
        int v92 = 0;
        bool v93 = v91 != v92;
        int v94;
        if (v93) {
          v94 = v46;
        } else {
          int v95 = 1;
          int v96 = v46 + v95;
          v94 = v96;
        }
        v71 = v94;
        break;
      }
    }
    v65 = v71;
  } else {
    int v97 = 32;
    int v98 = v97 + v46;
    int v99 = v45[v98];
    int v100 = 1;
    int v101;
    v101 = v100;
    switch (v99) {
      default:
        {
        int v102 = 1;
        int v103 = v46 + v102;
        v101 = v103;
        break;
      }
      case 0:
        {
        int v104 = 2;
        int v105 = v46 + v104;
        v101 = v105;
        break;
      }
    }
    v65 = v101;
  }
  int v106 = 16;
  int v107 = v106 + v46;
  bool v108 = true;
  int v109 = simt_wave_count_bits(v108);
  v44[v107] = v109;
  int v110 = 0;
  int v111 = 0;
  int v112;
  int v113;
  v112 = v110;
  v113 = v111;
  while (true) {
    int v114 = 4;
    int v115 = v113 * v114;
    int v116 = v115 + v46;
    int v117 = 36;
    int v118 = v117 + v116;
    int v119 = v45[v118];
    int v120 = 0;
    bool v121 = v119 != v120;
    v112 = v112;
    v113 = v113;
    if (!v121) break;
    int v122 = 56;
    int v123 = v122 + v46;
    int v124 = v45[v123];
    int v125;
    v125 = v46;
    switch (v124) {
      default:
        {
        int v126 = 0;
        int v127 = 0;
        int v128;
        int v129;
        v128 = v126;
        v129 = v127;
        while (true) {
          int v130 = 4;
          int v131 = v129 * v130;
          int v132 = v131 + v46;
          int v133 = 60;
          int v134 = v133 + v132;
          int v135 = v45[v134];
          int v136 = 0;
          bool v137 = v135 != v136;
          v128 = v128;
          v129 = v129;
          if (!v137) break;
          int v138 = v128 + v129;
          int v139 = 1;
          int v140 = v129 + v139;
          bool v141 = true;
          v128 = v138;
          v129 = v140;
        }
        v125 = v128;
        break;
      }
      case 0:
        {
        int v142 = 80;
        int v143 = v142 + v46;
        int v144 = v45[v143];
        int v145 = 0;
        bool v146 = v144 != v145;
        int v147;
        if (v146) {
          int v148 = 0;
          int v149 = v46 + v148;
          v147 = v149;
        } else {
          int v150 = 3;
          v147 = v150;
        }
        v125 = v147;
        break;
      }
      case 1:
        {
        int v151 = 84;
        int v152 = v151 + v46;
        int v153 = v45[v152];
        int v154 = 0;
        bool v155 = v153 != v154;
        int v156;
        if (v155) {
          int v157 = 2;
          v156 = v157;
        } else {
          int v158 = 1;
          v156 = v158;
        }
        v125 = v156;
        break;
      }
      case 2:
        {
        int v159 = 3;
        int v160 = v46 + v159;
        v125 = v160;
        break;
      }
    }
    bool v161 = true;
    int v162 = 32;
    int v163 = v162 + v46;
    bool v164 = true;
    int v165 = simt_wave_count_bits(v164);
    v44[v163] = v165;
    int v166 = v112 + v125;
    int v167 = 1;
    int v168 = v113 + v167;
    bool v169 = true;
    int v170 = 48;
    int v171 = 4;
    int v172 = v113 * v171;
    int v173 = v170 + v172;
    int v174 = v173 + v46;
    bool v175 = true;
    int v176 = simt_wave_count_bits(v175);
    v44[v174] = v176;
    v112 = v166;
    v113 = v168;
  }
  int v177 = 0;
  int v178 = 0;
  int v179;
  int v180;
  v179 = v177;
  v180 = v178;
  while (true) {
    int v181 = 4;
    int v182 = v180 * v181;
    int v183 = v182 + v46;
    int v184 = 88;
    int v185 = v184 + v183;
    int v186 = v45[v185];
    int v187 = 0;
    bool v188 = v186 != v187;
    v179 = v179;
    v180 = v180;
    if (!v188) break;
    int v189 = v179 + v180;
    int v190 = 1;
    int v191 = v180 + v190;
    bool v192 = true;
    int v193 = 64;
    int v194 = 4;
    int v195 = v180 * v194;
    int v196 = v193 + v195;
    int v197 = v196 + v46;
    bool v198 = true;
    int v199 = simt_wave_count_bits(v198);
    v44[v197] = v199;
    v179 = v189;
    v180 = v191;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 75; ++idx) {
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
