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
  int v4 = 2;
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
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
        int v18 = 1;
        int v19 = v12 + v18;
        v11 = v0;
        v12 = v19;
      }
      int v20 = 2;
      v8 = v11;
    }
    case 0:
      {
      int v21 = 0;
      bool v22 = v2 != v21;
      int v23;
      if (v22) {
        int v24 = 3;
        int v25 = v3 % v24;
        int v26 = 3;
        int v27;
        v27 = v26;
        switch (v25) {
          case 0:
            {
            int v28 = 3;
            v27 = v28;
            break;
          }
          case 1:
            {
            v27 = v0;
          }
          default:
            {
            int v29 = 1;
            v27 = v29;
            break;
          }
        }
        int v30 = 4;
        int v31 = v0 + v30;
        v23 = v27;
      } else {
        int v32 = 3;
        int v33;
        v33 = v32;
        switch (v3) {
          default:
            {
            int v34 = 3;
            v33 = v34;
            break;
          }
          case 0:
            {
            int v35 = 2;
            v33 = v35;
            break;
          }
        }
        v23 = v33;
      }
      v8 = v23;
      break;
    }
  }
  bool v36 = true;
  int v37 = simt_wave_count_bits(v36);
  int v38 = 0;
  int v39 = v38 + v0;
  v1[v39] = v37;
  return;
}

kernel void kernel_main(device int* v40 [[buffer(0)]], device int* v41 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v42 = static_cast<int>(__simt_tid3.x);
  int v43 = 0;
  int v44 = v43 + v42;
  int v45 = v41[v44];
  int v46 = 4;
  int v47 = v46 + v42;
  int v48 = v41[v47];
  helper0(v42, v40, v45, v48, static_cast<int>(__simt_tid3.x));
  int v49 = 8;
  int v50 = v49 + v42;
  int v51 = v41[v50];
  int v52 = 0;
  int v53;
  v53 = v52;
  switch (v51) {
    case 0:
      {
      int v54 = 4;
      v53 = v54;
    }
    case 1:
      {
      int v55 = 0;
      int v56 = 0;
      int v57;
      int v58;
      v57 = v55;
      v58 = v56;
      while (true) {
        int v59 = 4;
        int v60 = v58 * v59;
        int v61 = v60 + v42;
        int v62 = 12;
        int v63 = v62 + v61;
        int v64 = v41[v63];
        int v65 = 0;
        bool v66 = v64 != v65;
        v57 = v57;
        v58 = v58;
        if (!v66) break;
        int v67 = 0;
        int v68 = 0;
        int v69;
        int v70;
        v69 = v67;
        v70 = v68;
        while (true) {
          int v71 = 4;
          int v72 = v70 * v71;
          int v73 = v72 + v42;
          int v74 = 32;
          int v75 = v74 + v73;
          int v76 = v41[v75];
          int v77 = 0;
          bool v78 = v76 != v77;
          v69 = v69;
          v70 = v70;
          if (!v78) break;
          int v79 = v69 + v70;
          int v80 = 1;
          int v81 = v70 + v80;
          v69 = v79;
          v70 = v81;
          break;
          ;
        }
        bool v82 = true;
        int v83 = v57 + v69;
        int v84 = 1;
        int v85 = v58 + v84;
        v57 = v83;
        v58 = v85;
        continue;
        ;
      }
      bool v86 = true;
      v53 = v57;
    }
    default:
      {
      int v87 = 52;
      int v88 = v87 + v42;
      int v89 = v41[v88];
      int v90;
      v90 = v42;
      switch (v89) {
        case 0:
          {
          v90 = v42;
          break;
        }
        default:
          {
          int v91 = 56;
          int v92 = v91 + v42;
          int v93 = v41[v92];
          int v94 = 0;
          int v95 = v42 + v94;
          int v96;
          v96 = v95;
          switch (v93) {
            case 0:
              {
              v96 = v42;
              break;
            }
            default:
              {
              int v97 = 3;
              v96 = v97;
              break;
            }
          }
          bool v98 = true;
          v90 = v96;
          break;
        }
        case 1:
          {
          int v99 = 60;
          int v100 = v99 + v42;
          int v101 = v41[v100];
          int v102 = 0;
          int v103 = v42 + v102;
          int v104;
          v104 = v103;
          switch (v101) {
            case 0:
              {
              v104 = v42;
            }
            case 1:
              {
              v104 = v42;
            }
            default:
              {
              v104 = v42;
              break;
            }
          }
          bool v105 = true;
          v90 = v104;
          break;
        }
      }
      bool v106 = true;
      v53 = v90;
    }
    case 2:
      {
      int v107 = 64;
      int v108 = v107 + v42;
      int v109 = v41[v108];
      int v110 = 4;
      int v111 = v42 + v110;
      int v112;
      v112 = v111;
      switch (v109) {
        case 0:
          {
          int v113 = 2;
          int v114 = v42 + v113;
          v112 = v114;
          break;
        }
        case 1:
          {
          int v115 = 0;
          int v116 = 0;
          int v117;
          int v118;
          v117 = v115;
          v118 = v116;
          while (true) {
            int v119 = 4;
            int v120 = v118 * v119;
            int v121 = v120 + v42;
            int v122 = 68;
            int v123 = v122 + v121;
            int v124 = v41[v123];
            int v125 = 0;
            bool v126 = v124 != v125;
            v117 = v117;
            v118 = v118;
            if (!v126) break;
            int v127 = v117 + v118;
            int v128 = 1;
            int v129 = v118 + v128;
            v117 = v127;
            v118 = v129;
          }
          bool v130 = true;
          v112 = v117;
        }
        default:
          {
          int v131 = 1;
          v112 = v131;
          break;
        }
      }
      bool v132 = true;
      v53 = v112;
      break;
    }
  }
  bool v133 = true;
  int v134 = 16;
  int v135 = v134 + v42;
  bool v136 = true;
  int v137 = simt_wave_count_bits(v136);
  v40[v135] = v137;
  int v138 = 0;
  int v139 = 0;
  int v140;
  int v141;
  v140 = v138;
  v141 = v139;
  while (true) {
    int v142 = 4;
    int v143 = v141 * v142;
    int v144 = v143 + v42;
    int v145 = 88;
    int v146 = v145 + v144;
    int v147 = v41[v146];
    int v148 = 0;
    bool v149 = v147 != v148;
    v140 = v140;
    v141 = v141;
    if (!v149) break;
    int v150 = v140 + v141;
    int v151 = 1;
    int v152 = v141 + v151;
    v140 = v150;
    v141 = v152;
    continue;
    ;
  }
  bool v153 = true;
  int v154 = 32;
  int v155 = v154 + v42;
  bool v156 = true;
  int v157 = simt_wave_count_bits(v156);
  v40[v155] = v157;
  int v158 = 108;
  int v159 = v158 + v42;
  int v160 = v41[v159];
  int v161;
  v161 = v42;
  switch (v160) {
    case 0:
      {
      int v162 = 0;
      int v163 = 0;
      int v164;
      int v165;
      v164 = v162;
      v165 = v163;
      while (true) {
        int v166 = 4;
        int v167 = v165 * v166;
        int v168 = v167 + v42;
        int v169 = 112;
        int v170 = v169 + v168;
        int v171 = v41[v170];
        int v172 = 0;
        bool v173 = v171 != v172;
        v164 = v164;
        v165 = v165;
        if (!v173) break;
        int v174 = 132;
        int v175 = v174 + v42;
        int v176 = v41[v175];
        int v177 = 0;
        bool v178 = v176 != v177;
        int v179;
        if (v178) {
          v179 = v42;
        } else {
          int v180 = 2;
          int v181 = v42 + v180;
          v179 = v181;
        }
        int v182 = v164 + v179;
        int v183 = 1;
        int v184 = v165 + v183;
        v164 = v182;
        v165 = v184;
      }
      bool v185 = true;
      v161 = v164;
      break;
    }
    default:
      {
      int v186 = 136;
      int v187 = v186 + v42;
      int v188 = v41[v187];
      int v189 = 0;
      bool v190 = v188 != v189;
      int v191;
      if (v190) {
        int v192 = 140;
        int v193 = v192 + v42;
        int v194 = v41[v193];
        int v195;
        v195 = v42;
        switch (v194) {
          case 0:
            {
            int v196 = 3;
            v195 = v196;
            break;
          }
          case 1:
            {
            v195 = v42;
          }
          default:
            {
            int v197 = 4;
            int v198 = v42 + v197;
            v195 = v198;
            break;
          }
          case 2:
            {
            int v199 = 2;
            v195 = v199;
            break;
          }
        }
        bool v200 = true;
        v191 = v195;
      } else {
        int v201 = 144;
        int v202 = v201 + v42;
        int v203 = v41[v202];
        int v204 = 4;
        int v205 = v42 + v204;
        int v206;
        v206 = v205;
        switch (v203) {
          default:
            {
            int v207 = 4;
            int v208 = v42 + v207;
            v206 = v208;
            break;
          }
          case 0:
            {
            int v209 = 4;
            v206 = v209;
            break;
          }
        }
        bool v210 = true;
        v191 = v206;
      }
      v161 = v191;
      break;
    }
  }
  bool v211 = true;
  int v212 = 48;
  int v213 = v212 + v42;
  bool v214 = true;
  int v215 = simt_wave_count_bits(v214);
  v40[v213] = v215;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 148; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
