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
    int v7 = 4;
    int v8;
    v8 = v7;
    switch (v3) {
      default:
        {
        int v9 = 2;
        int v10 = v3 % v9;
        int v11;
        v11 = v0;
        switch (v10) {
          default:
            {
            int v12 = 1;
            v11 = v12;
          }
          case 0:
            {
            int v13 = 1;
            v11 = v13;
          }
          case 1:
            {
            int v14 = 0;
            v11 = v14;
            break;
          }
        }
        int v15 = 3;
        int v16 = v0 + v15;
        v8 = v11;
        break;
      }
      case 0:
        {
        int v17 = 0;
        int v18 = 0;
        int v19;
        int v20;
        v19 = v17;
        v20 = v18;
        while (true) {
          int v21 = 4;
          int v22 = v3 % v21;
          int v23 = 1;
          int v24 = v22 + v23;
          bool v25 = v20 < v24;
          v19 = v19;
          v20 = v20;
          if (!v25) break;
          int v26 = 1;
          int v27 = v20 + v26;
          v19 = v0;
          v20 = v27;
        }
        v8 = v19;
        break;
      }
    }
    int v28 = 4;
    int v29 = v0 + v28;
    v6 = v8;
  } else {
    int v30 = 0;
    bool v31 = v2 != v30;
    int v32;
    if (v31) {
      uint v33 = simt_lane_id(__simt_tid);
      int v34 = (int)(v33);
      int v35;
      v35 = v34;
      switch (v3) {
        default:
          {
          int v36 = 1;
          int v37 = v0 + v36;
          v35 = v37;
          break;
        }
        case 0:
          {
          v35 = v0;
          break;
        }
      }
      int v38 = 3;
      v32 = v35;
    } else {
      int v39 = 3;
      int v40 = v3 % v39;
      int v41 = 3;
      int v42 = v0 + v41;
      int v43;
      v43 = v42;
      switch (v40) {
        case 0:
          {
          int v44 = 0;
          int v45 = v0 + v44;
          v43 = v45;
          break;
        }
        case 1:
          {
          int v46 = 0;
          int v47 = v0 + v46;
          v43 = v47;
          break;
        }
        default:
          {
          v43 = v0;
          break;
        }
      }
      int v48 = 1;
      int v49 = v0 + v48;
      v32 = v43;
    }
    int v50 = 4;
    int v51 = v0 + v50;
    v6 = v32;
  }
  bool v52 = true;
  int v53 = simt_wave_count_bits(v52);
  int v54 = 0;
  int v55 = v54 + v0;
  v1[v55] = v53;
  return;
}

kernel void kernel_main(device int* v56 [[buffer(0)]], device int* v57 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v58 = static_cast<int>(__simt_tid3.x);
  int v59 = 0;
  int v60 = v59 + v58;
  int v61 = v57[v60];
  int v62 = 4;
  int v63 = v62 + v58;
  int v64 = v57[v63];
  helper0(v58, v56, v61, v64, static_cast<int>(__simt_tid3.x));
  int v65 = 1;
  int v66 = v58 + v65;
  int v67 = 8;
  int v68 = v67 + v58;
  int v69 = v57[v68];
  int v70 = 0;
  bool v71 = v69 != v70;
  int v72;
  if (v71) {
    int v73 = 1;
    int v74 = v58 + v73;
    v72 = v74;
  } else {
    int v75 = 0;
    int v76 = 0;
    int v77;
    int v78;
    v77 = v75;
    v78 = v76;
    while (true) {
      int v79 = 4;
      int v80 = v78 * v79;
      int v81 = v80 + v58;
      int v82 = 12;
      int v83 = v82 + v81;
      int v84 = v57[v83];
      int v85 = 0;
      bool v86 = v84 != v85;
      v77 = v77;
      v78 = v78;
      if (!v86) break;
      int v87 = v77 + v78;
      int v88 = 1;
      int v89 = v78 + v88;
      v77 = v87;
      v78 = v89;
    }
    bool v90 = true;
    v72 = v77;
  }
  int v91 = 16;
  int v92 = v91 + v58;
  bool v93 = true;
  int v94 = simt_wave_count_bits(v93);
  v56[v92] = v94;
  int v95 = 32;
  int v96 = v95 + v58;
  int v97 = v57[v96];
  int v98 = 3;
  int v99 = v58 + v98;
  int v100;
  v100 = v99;
  switch (v97) {
    case 0:
      {
      int v101 = 36;
      int v102 = v101 + v58;
      int v103 = v57[v102];
      int v104 = 0;
      bool v105 = v103 != v104;
      int v106;
      if (v105) {
        int v107 = 40;
        int v108 = v107 + v58;
        int v109 = v57[v108];
        int v110 = 3;
        int v111 = v58 + v110;
        int v112;
        v112 = v111;
        switch (v109) {
          default:
            {
            int v113 = 1;
            v112 = v113;
            break;
          }
          case 0:
            {
            int v114 = 3;
            int v115 = v58 + v114;
            v112 = v115;
            break;
          }
          case 1:
            {
            v112 = v58;
            break;
          }
          case 2:
            {
            int v116 = 2;
            int v117 = v58 + v116;
            v112 = v117;
            break;
          }
        }
        bool v118 = true;
        v106 = v112;
      } else {
        int v119 = 0;
        int v120 = 0;
        int v121;
        int v122;
        v121 = v119;
        v122 = v120;
        while (true) {
          int v123 = 4;
          int v124 = v122 * v123;
          int v125 = v124 + v58;
          int v126 = 44;
          int v127 = v126 + v125;
          int v128 = v57[v127];
          int v129 = 0;
          bool v130 = v128 != v129;
          v121 = v121;
          v122 = v122;
          if (!v130) break;
          int v131 = v121 + v122;
          int v132 = 1;
          int v133 = v122 + v132;
          v121 = v131;
          v122 = v133;
        }
        bool v134 = true;
        v106 = v121;
      }
      v100 = v106;
      break;
    }
    case 1:
      {
      int v135 = 64;
      int v136 = v135 + v58;
      int v137 = v57[v136];
      int v138;
      v138 = v58;
      switch (v137) {
        default:
          {
          int v139 = 68;
          int v140 = v139 + v58;
          int v141 = v57[v140];
          int v142 = 4;
          int v143;
          v143 = v142;
          switch (v141) {
            default:
              {
              v143 = v58;
              break;
            }
            case 0:
              {
              int v144 = 0;
              v143 = v144;
              break;
            }
            case 1:
              {
              v143 = v58;
              break;
            }
            case 2:
              {
              v143 = v58;
              break;
            }
          }
          bool v145 = true;
          v138 = v143;
          break;
        }
        case 0:
          {
          int v146 = 0;
          int v147 = 0;
          int v148;
          int v149;
          v148 = v146;
          v149 = v147;
          while (true) {
            int v150 = 4;
            int v151 = v149 * v150;
            int v152 = v151 + v58;
            int v153 = 72;
            int v154 = v153 + v152;
            int v155 = v57[v154];
            int v156 = 0;
            bool v157 = v155 != v156;
            v148 = v148;
            v149 = v149;
            if (!v157) break;
            int v158 = v148 + v149;
            int v159 = 1;
            int v160 = v149 + v159;
            v148 = v158;
            v149 = v160;
          }
          bool v161 = true;
          v138 = v148;
          break;
        }
        case 1:
          {
          int v162 = 92;
          int v163 = v162 + v58;
          int v164 = v57[v163];
          int v165 = 0;
          bool v166 = v164 != v165;
          int v167;
          if (v166) {
            v167 = v58;
          } else {
            int v168 = 3;
            v167 = v168;
          }
          v138 = v167;
          break;
        }
        case 2:
          {
          int v169 = 4;
          v138 = v169;
          break;
        }
      }
      bool v170 = true;
      v100 = v138;
      break;
    }
    default:
      {
      int v171 = 96;
      int v172 = v171 + v58;
      int v173 = v57[v172];
      int v174 = 0;
      int v175 = v58 + v174;
      int v176;
      v176 = v175;
      switch (v173) {
        case 0:
          {
          int v177 = 100;
          int v178 = v177 + v58;
          int v179 = v57[v178];
          int v180;
          v180 = v58;
          switch (v179) {
            case 0:
              {
              int v181 = 0;
              v180 = v181;
              break;
            }
            case 1:
              {
              int v182 = 2;
              v180 = v182;
              break;
            }
            default:
              {
              v180 = v58;
              break;
            }
          }
          bool v183 = true;
          v176 = v180;
          break;
        }
        case 1:
          {
          int v184 = 104;
          int v185 = v184 + v58;
          int v186 = v57[v185];
          int v187 = 3;
          int v188 = v58 + v187;
          int v189;
          v189 = v188;
          switch (v186) {
            case 0:
              {
              int v190 = 0;
              v189 = v190;
              break;
            }
            default:
              {
              v189 = v58;
              break;
            }
            case 1:
              {
              int v191 = 2;
              v189 = v191;
              break;
            }
            case 2:
              {
              int v192 = 0;
              int v193 = v58 + v192;
              v189 = v193;
              break;
            }
          }
          bool v194 = true;
          v176 = v189;
          break;
        }
        default:
          {
          int v195 = 108;
          int v196 = v195 + v58;
          int v197 = v57[v196];
          int v198;
          v198 = v58;
          switch (v197) {
            default:
              {
              v198 = v58;
              break;
            }
            case 0:
              {
              int v199 = 3;
              v198 = v199;
              break;
            }
          }
          bool v200 = true;
          v176 = v198;
          break;
        }
        case 2:
          {
          int v201 = 112;
          int v202 = v201 + v58;
          int v203 = v57[v202];
          int v204;
          v204 = v58;
          switch (v203) {
            case 0:
              {
              int v205 = 3;
              v204 = v205;
              break;
            }
            case 1:
              {
              int v206 = 2;
              int v207 = v58 + v206;
              v204 = v207;
              break;
            }
            default:
              {
              int v208 = 2;
              int v209 = v58 + v208;
              v204 = v209;
              break;
            }
            case 2:
              {
              int v210 = 2;
              v204 = v210;
              break;
            }
          }
          bool v211 = true;
          v176 = v204;
          break;
        }
      }
      bool v212 = true;
      v100 = v176;
      break;
    }
  }
  bool v213 = true;
  int v214 = 32;
  int v215 = v214 + v58;
  bool v216 = true;
  int v217 = simt_wave_count_bits(v216);
  v56[v215] = v217;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 116; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
