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
    uint v7 = simt_subgroup_id(__simt_tid);
    int v8 = (int)(v7);
    v6 = v8;
  } else {
    v6 = v0;
  }
  bool v9 = true;
  int v10 = simt_wave_count_bits(v9);
  int v11 = 0;
  int v12 = v11 + v0;
  v1[v12] = v10;
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
    int v22 = 2;
    int v23 = v3 % v22;
    uint v24 = simt_lane_id(__simt_tid);
    int v25 = (int)(v24);
    int v26;
    v26 = v25;
    switch (v23) {
      case 0:
        {
        int v27 = 0;
        bool v28 = v2 != v27;
        int v29;
        if (v28) {
          v29 = v0;
        } else {
          int v30 = 0;
          int v31 = v0 + v30;
          v29 = v31;
        }
        int v32 = 1;
        v26 = v29;
        break;
      }
      default:
        {
        int v33 = 2;
        int v34 = v0 + v33;
        v26 = v34;
        break;
      }
      case 1:
        {
        int v35 = 4;
        int v36 = v0 + v35;
        v26 = v36;
        break;
      }
    }
    int v37 = 1;
    int v38 = 1;
    int v39 = v16 + v38;
    v15 = v26;
    v16 = v39;
  }
  bool v40 = true;
  int v41 = simt_wave_count_bits(v40);
  int v42 = 16;
  int v43 = v42 + v0;
  v1[v43] = v41;
  int v44 = 0;
  bool v45 = v2 != v44;
  int v46 = v45 ? v6 : v15;
  return;
}

kernel void kernel_main(device int* v47 [[buffer(0)]], device int* v48 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v49 = static_cast<int>(__simt_tid3.x);
  int v50 = 0;
  int v51 = v50 + v49;
  int v52 = v48[v51];
  int v53 = 4;
  int v54 = v53 + v49;
  int v55 = v48[v54];
  helper0(v49, v47, v52, v55, static_cast<int>(__simt_tid3.x));
  int v56 = 0;
  int v57 = 0;
  int v58;
  int v59;
  v58 = v56;
  v59 = v57;
  while (true) {
    int v60 = 4;
    int v61 = v59 * v60;
    int v62 = v61 + v49;
    int v63 = 8;
    int v64 = v63 + v62;
    int v65 = v48[v64];
    int v66 = 0;
    bool v67 = v65 != v66;
    v58 = v58;
    v59 = v59;
    if (!v67) break;
    int v68 = 28;
    int v69 = v68 + v49;
    int v70 = v48[v69];
    int v71 = 0;
    bool v72 = v70 != v71;
    int v73;
    if (v72) {
      v73 = v49;
    } else {
      int v74 = 32;
      int v75 = v74 + v49;
      int v76 = v48[v75];
      int v77 = 0;
      bool v78 = v76 != v77;
      int v79;
      if (v78) {
        uint v80 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v81 = (int)(v80);
        v79 = v81;
      } else {
        v79 = v49;
      }
      v73 = v79;
    }
    int v82 = v58 + v73;
    int v83 = 1;
    int v84 = v59 + v83;
    v58 = v82;
    v59 = v84;
  }
  bool v85 = true;
  int v86 = 32;
  int v87 = v86 + v49;
  bool v88 = true;
  int v89 = simt_wave_count_bits(v88);
  v47[v87] = v89;
  int v90 = 36;
  int v91 = v90 + v49;
  int v92 = v48[v91];
  int v93 = 1;
  int v94 = v49 + v93;
  int v95;
  v95 = v94;
  switch (v92) {
    case 0:
      {
      int v96 = 40;
      int v97 = v96 + v49;
      int v98 = v48[v97];
      int v99 = 4;
      int v100 = v49 + v99;
      int v101;
      v101 = v100;
      switch (v98) {
        case 0:
          {
          int v102 = 0;
          int v103 = 0;
          int v104;
          int v105;
          v104 = v102;
          v105 = v103;
          while (true) {
            int v106 = 4;
            int v107 = v105 * v106;
            int v108 = v107 + v49;
            int v109 = 44;
            int v110 = v109 + v108;
            int v111 = v48[v110];
            int v112 = 0;
            bool v113 = v111 != v112;
            v104 = v104;
            v105 = v105;
            if (!v113) break;
            int v114 = v104 + v105;
            int v115 = 1;
            int v116 = v105 + v115;
            v104 = v114;
            v105 = v116;
          }
          bool v117 = true;
          v101 = v104;
          break;
        }
        default:
          {
          int v118 = 64;
          int v119 = v118 + v49;
          int v120 = v48[v119];
          int v121 = 0;
          int v122;
          v122 = v121;
          switch (v120) {
            default:
              {
              int v123 = 2;
              int v124 = v49 + v123;
              v122 = v124;
            }
            case 0:
              {
              int v125 = 3;
              v122 = v125;
              break;
            }
          }
          bool v126 = true;
          v101 = v122;
          break;
        }
        case 1:
          {
          int v127 = 3;
          v101 = v127;
          break;
        }
      }
      bool v128 = true;
      v95 = v101;
      break;
    }
    default:
      {
      int v129 = 68;
      int v130 = v129 + v49;
      int v131 = v48[v130];
      int v132 = 0;
      bool v133 = v131 != v132;
      int v134;
      if (v133) {
        int v135 = 72;
        int v136 = v135 + v49;
        int v137 = v48[v136];
        int v138;
        v138 = v49;
        switch (v137) {
          default:
            {
            v138 = v49;
            break;
          }
          case 0:
            {
            int v139 = 1;
            int v140 = v49 + v139;
            v138 = v140;
            break;
          }
        }
        bool v141 = true;
        v134 = v138;
      } else {
        int v142 = 76;
        int v143 = v142 + v49;
        int v144 = v48[v143];
        int v145;
        v145 = v49;
        switch (v144) {
          default:
            {
            int v146 = 3;
            int v147 = v49 + v146;
            v145 = v147;
            break;
          }
          case 0:
            {
            v145 = v49;
            break;
          }
        }
        bool v148 = true;
        v134 = v145;
      }
      v95 = v134;
      break;
    }
    case 1:
      {
      int v149 = 80;
      int v150 = v149 + v49;
      int v151 = v48[v150];
      int v152 = 0;
      bool v153 = v151 != v152;
      int v154;
      if (v153) {
        int v155 = 84;
        int v156 = v155 + v49;
        int v157 = v48[v156];
        int v158 = 1;
        int v159;
        v159 = v158;
        switch (v157) {
          default:
            {
            int v160 = 2;
            int v161 = v49 + v160;
            v159 = v161;
            break;
          }
          case 0:
            {
            v159 = v49;
            break;
          }
        }
        bool v162 = true;
        v154 = v159;
      } else {
        int v163 = 88;
        int v164 = v163 + v49;
        int v165 = v48[v164];
        int v166 = 1;
        int v167;
        v167 = v166;
        switch (v165) {
          default:
            {
            v167 = v49;
            break;
          }
          case 0:
            {
            v167 = v49;
            break;
          }
          case 1:
            {
            int v168 = 4;
            v167 = v168;
          }
          case 2:
            {
            int v169 = 2;
            int v170 = v49 + v169;
            v167 = v170;
            break;
          }
        }
        bool v171 = true;
        v154 = v167;
      }
      v95 = v154;
      break;
    }
    case 2:
      {
      v95 = v49;
      break;
    }
  }
  bool v172 = true;
  int v173 = 48;
  int v174 = v173 + v49;
  bool v175 = true;
  int v176 = simt_wave_count_bits(v175);
  v47[v174] = v176;
  int v177 = 0;
  int v178 = 0;
  int v179;
  int v180;
  v179 = v177;
  v180 = v178;
  while (true) {
    int v181 = 4;
    int v182 = v180 * v181;
    int v183 = v182 + v49;
    int v184 = 92;
    int v185 = v184 + v183;
    int v186 = v48[v185];
    int v187 = 0;
    bool v188 = v186 != v187;
    v179 = v179;
    v180 = v180;
    if (!v188) break;
    int v189 = 112;
    int v190 = v189 + v49;
    int v191 = v48[v190];
    int v192 = 3;
    int v193 = v49 + v192;
    int v194;
    v194 = v193;
    switch (v191) {
      case 0:
        {
        int v195 = 116;
        int v196 = v195 + v49;
        int v197 = v48[v196];
        int v198 = 4;
        int v199 = v49 + v198;
        int v200;
        v200 = v199;
        switch (v197) {
          default:
            {
            v200 = v49;
          }
          case 0:
            {
            int v201 = 1;
            int v202 = v49 + v201;
            v200 = v202;
            break;
          }
        }
        bool v203 = true;
        v194 = v200;
        break;
      }
      case 1:
        {
        int v204 = 3;
        v194 = v204;
        break;
      }
      default:
        {
        v194 = v49;
        break;
      }
    }
    bool v205 = true;
    int v206 = v179 + v194;
    int v207 = 1;
    int v208 = v180 + v207;
    v179 = v206;
    v180 = v208;
  }
  bool v209 = true;
  int v210 = 64;
  int v211 = v210 + v49;
  bool v212 = true;
  int v213 = simt_wave_count_bits(v212);
  v47[v211] = v213;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
