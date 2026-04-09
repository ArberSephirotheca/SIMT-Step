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
    bool v14 = v2 != v13;
    int v15;
    if (v14) {
      int v16 = 2;
      int v17 = v3 % v16;
      int v18 = 3;
      int v19;
      v19 = v18;
      switch (v17) {
        case 0:
          {
          int v20 = 2;
          int v21 = v0 + v20;
          v19 = v21;
          break;
        }
        case 1:
          {
          int v22 = 4;
          v19 = v22;
          break;
        }
        default:
          {
          int v23 = 2;
          int v24 = v0 + v23;
          v19 = v24;
          break;
        }
      }
      bool v25 = true;
      int v26 = simt_wave_count_bits(v25);
      int v27 = 0;
      int v28 = 4;
      int v29 = v7 * v28;
      int v30 = v27 + v29;
      int v31 = v30 + v0;
      v1[v31] = v26;
      v15 = v19;
    } else {
      bool v32 = true;
      int v33 = simt_wave_count_bits(v32);
      int v34 = 16;
      int v35 = 4;
      int v36 = v7 * v35;
      int v37 = v34 + v36;
      int v38 = v37 + v0;
      v1[v38] = v33;
      v15 = v33;
    }
    int v39 = 1;
    int v40 = v7 + v39;
    v6 = v15;
    v7 = v40;
  }
  return;
}

kernel void kernel_main(device int* v41 [[buffer(0)]], device int* v42 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v43 = static_cast<int>(__simt_tid3.x);
  int v44 = 0;
  int v45 = v44 + v43;
  int v46 = v42[v45];
  int v47 = 4;
  int v48 = v47 + v43;
  int v49 = v42[v48];
  helper0(v43, v41, v46, v49, static_cast<int>(__simt_tid3.x));
  int v50 = 0;
  int v51 = 0;
  int v52;
  int v53;
  v52 = v50;
  v53 = v51;
  while (true) {
    int v54 = 4;
    int v55 = v53 * v54;
    int v56 = v55 + v43;
    int v57 = 8;
    int v58 = v57 + v56;
    int v59 = v42[v58];
    int v60 = 0;
    bool v61 = v59 != v60;
    v52 = v52;
    v53 = v53;
    if (!v61) break;
    int v62 = v52 + v53;
    int v63 = 1;
    int v64 = v53 + v63;
    bool v65 = true;
    int v66 = 32;
    int v67 = 4;
    int v68 = v53 * v67;
    int v69 = v66 + v68;
    int v70 = v69 + v43;
    bool v71 = true;
    int v72 = simt_wave_count_bits(v71);
    v41[v70] = v72;
    v52 = v62;
    v53 = v64;
  }
  int v73 = 28;
  int v74 = v73 + v43;
  int v75 = v42[v74];
  int v76 = 3;
  int v77 = v43 + v76;
  int v78;
  v78 = v77;
  switch (v75) {
    case 0:
      {
      int v79 = 32;
      int v80 = v79 + v43;
      int v81 = v42[v80];
      int v82 = 4;
      int v83 = v43 + v82;
      int v84;
      v84 = v83;
      switch (v81) {
        case 0:
          {
          int v85 = 0;
          int v86 = 0;
          int v87;
          int v88;
          v87 = v85;
          v88 = v86;
          while (true) {
            int v89 = 4;
            int v90 = v88 * v89;
            int v91 = v90 + v43;
            int v92 = 36;
            int v93 = v92 + v91;
            int v94 = v42[v93];
            int v95 = 0;
            bool v96 = v94 != v95;
            v87 = v87;
            v88 = v88;
            if (!v96) break;
            int v97 = v87 + v88;
            int v98 = 1;
            int v99 = v88 + v98;
            bool v100 = true;
            v87 = v97;
            v88 = v99;
          }
          v84 = v87;
          break;
        }
        default:
          {
          int v101 = 0;
          int v102 = 0;
          int v103;
          int v104;
          v103 = v101;
          v104 = v102;
          while (true) {
            int v105 = 4;
            int v106 = v104 * v105;
            int v107 = v106 + v43;
            int v108 = 56;
            int v109 = v108 + v107;
            int v110 = v42[v109];
            int v111 = 0;
            bool v112 = v110 != v111;
            v103 = v103;
            v104 = v104;
            if (!v112) break;
            int v113 = v103 + v104;
            int v114 = 1;
            int v115 = v104 + v114;
            bool v116 = true;
            v103 = v113;
            v104 = v115;
          }
          v84 = v103;
          break;
        }
        case 1:
          {
          int v117 = 76;
          int v118 = v117 + v43;
          int v119 = v42[v118];
          int v120 = 0;
          bool v121 = v119 != v120;
          int v122;
          if (v121) {
            v122 = v43;
          } else {
            v122 = v43;
          }
          v84 = v122;
          break;
        }
        case 2:
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
            int v129 = v128 + v43;
            int v130 = 80;
            int v131 = v130 + v129;
            int v132 = v42[v131];
            int v133 = 0;
            bool v134 = v132 != v133;
            v125 = v125;
            v126 = v126;
            if (!v134) break;
            int v135 = v125 + v126;
            int v136 = 1;
            int v137 = v126 + v136;
            bool v138 = true;
            v125 = v135;
            v126 = v137;
          }
          v84 = v125;
          break;
        }
      }
      v78 = v84;
    }
    case 1:
      {
      int v139 = 0;
      int v140 = 0;
      int v141;
      int v142;
      v141 = v139;
      v142 = v140;
      while (true) {
        int v143 = 4;
        int v144 = v142 * v143;
        int v145 = v144 + v43;
        int v146 = 100;
        int v147 = v146 + v145;
        int v148 = v42[v147];
        int v149 = 0;
        bool v150 = v148 != v149;
        v141 = v141;
        v142 = v142;
        if (!v150) break;
        int v151 = v141 + v142;
        int v152 = 1;
        int v153 = v142 + v152;
        bool v154 = true;
        v141 = v151;
        v142 = v153;
      }
      v78 = v141;
      break;
    }
    case 2:
      {
      int v155 = 120;
      int v156 = v155 + v43;
      int v157 = v42[v156];
      int v158 = 0;
      bool v159 = v157 != v158;
      int v160;
      if (v159) {
        v160 = v43;
      } else {
        int v161 = 124;
        int v162 = v161 + v43;
        int v163 = v42[v162];
        int v164 = 0;
        int v165 = v43 + v164;
        int v166;
        v166 = v165;
        switch (v163) {
          default:
            {
            v166 = v43;
            break;
          }
          case 0:
            {
            int v167 = 2;
            int v168 = v43 + v167;
            v166 = v168;
            break;
          }
          case 1:
            {
            int v169 = 3;
            v166 = v169;
            break;
          }
        }
        v160 = v166;
      }
      v78 = v160;
    }
    default:
      {
      int v170 = 128;
      int v171 = v170 + v43;
      int v172 = v42[v171];
      int v173 = 0;
      bool v174 = v172 != v173;
      int v175;
      if (v174) {
        int v176 = 0;
        int v177 = 0;
        int v178;
        int v179;
        v178 = v176;
        v179 = v177;
        while (true) {
          int v180 = 4;
          int v181 = v179 * v180;
          int v182 = v181 + v43;
          int v183 = 132;
          int v184 = v183 + v182;
          int v185 = v42[v184];
          int v186 = 0;
          bool v187 = v185 != v186;
          v178 = v178;
          v179 = v179;
          if (!v187) break;
          int v188 = v178 + v179;
          int v189 = 1;
          int v190 = v179 + v189;
          bool v191 = true;
          v178 = v188;
          v179 = v190;
        }
        v175 = v178;
      } else {
        int v192 = 0;
        int v193 = 0;
        int v194;
        int v195;
        v194 = v192;
        v195 = v193;
        while (true) {
          int v196 = 4;
          int v197 = v195 * v196;
          int v198 = v197 + v43;
          int v199 = 152;
          int v200 = v199 + v198;
          int v201 = v42[v200];
          int v202 = 0;
          bool v203 = v201 != v202;
          v194 = v194;
          v195 = v195;
          if (!v203) break;
          int v204 = v194 + v195;
          int v205 = 1;
          int v206 = v195 + v205;
          bool v207 = true;
          v194 = v204;
          v195 = v206;
        }
        v175 = v194;
      }
      v78 = v175;
      break;
    }
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 172; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
