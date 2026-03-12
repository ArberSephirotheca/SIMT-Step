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
  int v5 = v3 % v4;
  int v6 = 4;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 0;
      int v9 = 0;
      int v10;
      int v11;
      v10 = v8;
      v11 = v9;
      while (true) {
        int v12 = 4;
        int v13 = v3 % v12;
        int v14 = 1;
        int v15 = v13 + v14;
        bool v16 = v11 < v15;
        v10 = v10;
        v11 = v11;
        if (!v16) break;
        int v17 = 4;
        int v18;
        v18 = v17;
        switch (v3) {
          case 0:
            {
            v18 = v0;
            break;
          }
          default:
            {
            v18 = v0;
            break;
          }
        }
        int v19 = 1;
        int v20 = v0 + v19;
        int v21 = 1;
        int v22 = v11 + v21;
        v10 = v18;
        v11 = v22;
      }
      v7 = v10;
      break;
    }
    case 1:
      {
      int v23 = 0;
      int v24 = 0;
      int v25;
      int v26;
      v25 = v23;
      v26 = v24;
      while (true) {
        int v27 = 4;
        int v28 = v3 % v27;
        int v29 = 1;
        int v30 = v28 + v29;
        bool v31 = v26 < v30;
        v25 = v25;
        v26 = v26;
        if (!v31) break;
        int v32 = 3;
        int v33 = 1;
        int v34 = v26 + v33;
        v25 = v32;
        v26 = v34;
      }
      v7 = v25;
      break;
    }
    case 2:
      {
      int v35;
      v35 = v0;
      switch (v3) {
        default:
          {
          int v36 = 4;
          int v37 = v0 + v36;
          v35 = v37;
          break;
        }
        case 0:
          {
          int v38 = 1;
          int v39;
          v39 = v38;
          switch (v3) {
            default:
              {
              v39 = v0;
              break;
            }
            case 0:
              {
              v39 = v0;
              break;
            }
          }
          v35 = v39;
          break;
        }
      }
      int v40 = 1;
      v7 = v35;
      break;
    }
    default:
      {
      v7 = v0;
      break;
    }
  }
  bool v41 = true;
  int v42 = simt_wave_count_bits(v41);
  int v43 = 0;
  int v44 = v43 + v0;
  v1[v44] = v42;
  return;
}

kernel void kernel_main(device int* v45 [[buffer(0)]], device int* v46 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v47 = static_cast<int>(__simt_tid3.x);
  int v48 = 0;
  int v49 = v48 + v47;
  int v50 = v46[v49];
  int v51 = 4;
  int v52 = v51 + v47;
  int v53 = v46[v52];
  helper0(v47, v45, v50, v53, static_cast<int>(__simt_tid3.x));
  int v54 = 8;
  int v55 = v54 + v47;
  int v56 = v46[v55];
  int v57 = 0;
  int v58;
  v58 = v57;
  switch (v56) {
    case 0:
      {
      int v59 = 3;
      v58 = v59;
      break;
    }
    case 1:
      {
      int v60 = 12;
      int v61 = v60 + v47;
      int v62 = v46[v61];
      int v63;
      v63 = v47;
      switch (v62) {
        case 0:
          {
          int v64 = 16;
          int v65 = v64 + v47;
          int v66 = v46[v65];
          int v67 = 0;
          bool v68 = v66 != v67;
          int v69;
          if (v68) {
            int v70 = 3;
            int v71 = v47 + v70;
            v69 = v71;
          } else {
            int v72 = 1;
            int v73 = v47 + v72;
            v69 = v73;
          }
          v63 = v69;
          break;
        }
        default:
          {
          int v74 = 1;
          v63 = v74;
        }
        case 1:
          {
          int v75 = 0;
          int v76 = 0;
          int v77;
          int v78;
          v77 = v75;
          v78 = v76;
          while (true) {
            int v79 = 4;
            int v80 = v78 * v79;
            int v81 = v80 + v47;
            int v82 = 20;
            int v83 = v82 + v81;
            int v84 = v46[v83];
            int v85 = 0;
            bool v86 = v84 != v85;
            v77 = v77;
            v78 = v78;
            if (!v86) break;
            int v87 = v77 + v78;
            int v88 = 1;
            int v89 = v78 + v88;
            bool v90 = true;
            v77 = v87;
            v78 = v89;
          }
          v63 = v77;
          break;
        }
      }
      bool v91 = true;
      v58 = v63;
      break;
    }
    default:
      {
      int v92 = 40;
      int v93 = v92 + v47;
      int v94 = v46[v93];
      int v95 = 1;
      int v96;
      v96 = v95;
      switch (v94) {
        default:
          {
          int v97 = 44;
          int v98 = v97 + v47;
          int v99 = v46[v98];
          int v100 = 3;
          int v101;
          v101 = v100;
          switch (v99) {
            case 0:
              {
              v101 = v47;
              break;
            }
            default:
              {
              v101 = v47;
            }
            case 1:
              {
              v101 = v47;
            }
            case 2:
              {
              v101 = v47;
              break;
            }
          }
          v96 = v101;
        }
        case 0:
          {
          v96 = v47;
        }
        case 1:
          {
          int v102 = 48;
          int v103 = v102 + v47;
          int v104 = v46[v103];
          int v105 = 0;
          bool v106 = v104 != v105;
          int v107;
          if (v106) {
            v107 = v47;
          } else {
            int v108 = 2;
            v107 = v108;
          }
          v96 = v107;
          break;
        }
        case 2:
          {
          int v109 = 0;
          int v110 = 0;
          int v111;
          int v112;
          v111 = v109;
          v112 = v110;
          while (true) {
            int v113 = 4;
            int v114 = v112 * v113;
            int v115 = v114 + v47;
            int v116 = 52;
            int v117 = v116 + v115;
            int v118 = v46[v117];
            int v119 = 0;
            bool v120 = v118 != v119;
            v111 = v111;
            v112 = v112;
            if (!v120) break;
            int v121 = v111 + v112;
            int v122 = 1;
            int v123 = v112 + v122;
            bool v124 = true;
            v111 = v121;
            v112 = v123;
          }
          v96 = v111;
          break;
        }
      }
      bool v125 = true;
      v58 = v96;
    }
    case 2:
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
        int v132 = v131 + v47;
        int v133 = 72;
        int v134 = v133 + v132;
        int v135 = v46[v134];
        int v136 = 0;
        bool v137 = v135 != v136;
        v128 = v128;
        v129 = v129;
        if (!v137) break;
        int v138 = 92;
        int v139 = v138 + v47;
        int v140 = v46[v139];
        int v141 = 3;
        int v142 = v47 + v141;
        int v143;
        v143 = v142;
        switch (v140) {
          default:
            {
            int v144 = 4;
            v143 = v144;
          }
          case 0:
            {
            int v145 = 0;
            v143 = v145;
            break;
          }
          case 1:
            {
            int v146 = 0;
            int v147 = v47 + v146;
            v143 = v147;
          }
          case 2:
            {
            int v148 = 1;
            int v149 = v47 + v148;
            v143 = v149;
            break;
          }
        }
        int v150 = v128 + v143;
        int v151 = 1;
        int v152 = v129 + v151;
        bool v153 = true;
        v128 = v150;
        v129 = v152;
      }
      v58 = v128;
      break;
    }
  }
  int v154 = 96;
  int v155 = v154 + v47;
  int v156 = v46[v155];
  int v157 = 2;
  int v158;
  v158 = v157;
  switch (v156) {
    case 0:
      {
      int v159 = 100;
      int v160 = v159 + v47;
      int v161 = v46[v160];
      int v162 = 0;
      bool v163 = v161 != v162;
      int v164;
      if (v163) {
        int v165 = 2;
        v164 = v165;
      } else {
        int v166 = 4;
        int v167 = v47 + v166;
        v164 = v167;
      }
      v158 = v164;
      break;
    }
    default:
      {
      int v168 = 104;
      int v169 = v168 + v47;
      int v170 = v46[v169];
      int v171;
      v171 = v47;
      switch (v170) {
        case 0:
          {
          int v172 = 108;
          int v173 = v172 + v47;
          int v174 = v46[v173];
          int v175 = 0;
          bool v176 = v174 != v175;
          int v177;
          if (v176) {
            v177 = v47;
          } else {
            int v178 = 0;
            v177 = v178;
          }
          v171 = v177;
        }
        case 1:
          {
          int v179 = 112;
          int v180 = v179 + v47;
          int v181 = v46[v180];
          int v182;
          v182 = v47;
          switch (v181) {
            case 0:
              {
              int v183 = 3;
              int v184 = v47 + v183;
              v182 = v184;
              break;
            }
            default:
              {
              int v185 = 1;
              v182 = v185;
              break;
            }
            case 1:
              {
              int v186 = 4;
              int v187 = v47 + v186;
              v182 = v187;
              break;
            }
            case 2:
              {
              v182 = v47;
              break;
            }
          }
          v171 = v182;
        }
        default:
          {
          int v188 = 116;
          int v189 = v188 + v47;
          int v190 = v46[v189];
          int v191 = 3;
          int v192 = v47 + v191;
          int v193;
          v193 = v192;
          switch (v190) {
            default:
              {
              int v194 = 2;
              int v195 = v47 + v194;
              v193 = v195;
            }
            case 0:
              {
              int v196 = 0;
              int v197 = v47 + v196;
              v193 = v197;
            }
            case 1:
              {
              int v198 = 4;
              v193 = v198;
            }
            case 2:
              {
              int v199 = 2;
              int v200 = v47 + v199;
              v193 = v200;
              break;
            }
          }
          v171 = v193;
          break;
        }
      }
      bool v201 = true;
      v158 = v171;
      break;
    }
    case 1:
      {
      int v202 = 120;
      int v203 = v202 + v47;
      int v204 = v46[v203];
      int v205 = 0;
      bool v206 = v204 != v205;
      int v207;
      if (v206) {
        int v208 = 124;
        int v209 = v208 + v47;
        int v210 = v46[v209];
        int v211 = 0;
        bool v212 = v210 != v211;
        int v213;
        if (v212) {
          v213 = v47;
        } else {
          int v214 = 0;
          v213 = v214;
        }
        v207 = v213;
      } else {
        int v215 = 1;
        v207 = v215;
      }
      v158 = v207;
      break;
    }
  }
  bool v216 = true;
  int v217 = 16;
  int v218 = v217 + v47;
  bool v219 = true;
  int v220 = simt_wave_count_bits(v219);
  v45[v218] = v220;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
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
