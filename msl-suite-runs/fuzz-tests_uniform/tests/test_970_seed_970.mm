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
  int v4 = 3;
  int v5;
  v5 = v4;
  switch (v3) {
    case 0:
      {
      int v6 = 1;
      v5 = v6;
    }
    default:
      {
      int v7 = 3;
      int v8 = v3 % v7;
      int v9 = 3;
      int v10 = v0 + v9;
      int v11;
      v11 = v10;
      switch (v8) {
        case 0:
          {
          int v12 = 3;
          int v13 = v3 % v12;
          int v14;
          v14 = v0;
          switch (v13) {
            case 0:
              {
              v14 = v0;
              break;
            }
            default:
              {
              int v15 = 3;
              v14 = v15;
            }
            case 1:
              {
              v14 = v0;
              break;
            }
            case 2:
              {
              int v16 = 2;
              int v17 = v0 + v16;
              v14 = v17;
              break;
            }
          }
          v11 = v14;
          break;
        }
        case 1:
          {
          int v18 = 4;
          int v19 = v3 % v18;
          int v20;
          v20 = v0;
          switch (v19) {
            case 0:
              {
              int v21 = 2;
              int v22 = v0 + v21;
              v20 = v22;
              break;
            }
            case 1:
              {
              int v23 = 2;
              int v24 = v0 + v23;
              v20 = v24;
              break;
            }
            default:
              {
              int v25 = 0;
              int v26 = v0 + v25;
              v20 = v26;
              break;
            }
            case 2:
              {
              v20 = v0;
              break;
            }
          }
          int v27 = 0;
          v11 = v20;
          break;
        }
        default:
          {
          int v28 = 2;
          int v29 = v3 % v28;
          int v30 = 2;
          int v31 = v0 + v30;
          int v32;
          v32 = v31;
          switch (v29) {
            default:
              {
              int v33 = 2;
              v32 = v33;
            }
            case 0:
              {
              int v34 = 0;
              v32 = v34;
            }
            case 1:
              {
              int v35 = 2;
              int v36 = v0 + v35;
              v32 = v36;
              break;
            }
          }
          int v37 = 1;
          v11 = v32;
        }
        case 2:
          {
          int v38;
          v38 = v0;
          switch (v3) {
            case 0:
              {
              v38 = v0;
              break;
            }
            default:
              {
              v38 = v0;
              break;
            }
          }
          int v39 = 4;
          v11 = v38;
          break;
        }
      }
      v5 = v11;
      break;
    }
  }
  bool v40 = true;
  int v41 = simt_wave_count_bits(v40);
  int v42 = 0;
  int v43 = v42 + v0;
  v1[v43] = v41;
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
  helper0(v46, v44, v49, v52, static_cast<int>(__simt_tid3.x));
  int v53 = 8;
  int v54 = v53 + v46;
  int v55 = v45[v54];
  int v56 = 0;
  bool v57 = v55 != v56;
  int v58;
  if (v57) {
    int v59 = 12;
    int v60 = v59 + v46;
    int v61 = v45[v60];
    int v62 = 0;
    bool v63 = v61 != v62;
    int v64;
    if (v63) {
      int v65 = 0;
      int v66 = 0;
      int v67;
      int v68;
      v67 = v65;
      v68 = v66;
      while (true) {
        int v69 = 4;
        int v70 = v68 * v69;
        int v71 = v70 + v46;
        int v72 = 16;
        int v73 = v72 + v71;
        int v74 = v45[v73];
        int v75 = 0;
        bool v76 = v74 != v75;
        v67 = v67;
        v68 = v68;
        if (!v76) break;
        int v77 = v67 + v68;
        int v78 = 1;
        int v79 = v68 + v78;
        v67 = v77;
        v68 = v79;
      }
      bool v80 = true;
      v64 = v67;
    } else {
      v64 = v46;
    }
    v58 = v64;
  } else {
    int v81 = 36;
    int v82 = v81 + v46;
    int v83 = v45[v82];
    uint v84 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v85 = (int)(v84);
    int v86;
    v86 = v85;
    switch (v83) {
      default:
        {
        int v87 = 40;
        int v88 = v87 + v46;
        int v89 = v45[v88];
        int v90;
        v90 = v46;
        switch (v89) {
          case 0:
            {
            int v91 = 1;
            v90 = v91;
            break;
          }
          default:
            {
            int v92 = 1;
            v90 = v92;
            break;
          }
          case 1:
            {
            int v93 = 3;
            v90 = v93;
            break;
          }
        }
        bool v94 = true;
        v86 = v90;
      }
      case 0:
        {
        int v95 = 44;
        int v96 = v95 + v46;
        int v97 = v45[v96];
        int v98 = 4;
        int v99;
        v99 = v98;
        switch (v97) {
          default:
            {
            v99 = v46;
            break;
          }
          case 0:
            {
            int v100 = 2;
            int v101 = v46 + v100;
            v99 = v101;
            break;
          }
        }
        bool v102 = true;
        v86 = v99;
        break;
      }
      case 1:
        {
        int v103 = 3;
        v86 = v103;
      }
      case 2:
        {
        int v104 = 48;
        int v105 = v104 + v46;
        int v106 = v45[v105];
        int v107;
        v107 = v46;
        switch (v106) {
          case 0:
            {
            int v108 = 1;
            int v109 = v46 + v108;
            v107 = v109;
            break;
          }
          default:
            {
            int v110 = 1;
            v107 = v110;
            break;
          }
        }
        bool v111 = true;
        v86 = v107;
        break;
      }
    }
    bool v112 = true;
    v58 = v86;
  }
  int v113 = 16;
  int v114 = v113 + v46;
  bool v115 = true;
  int v116 = simt_wave_count_bits(v115);
  v44[v114] = v116;
  int v117 = 0;
  int v118 = 52;
  int v119 = v118 + v46;
  int v120 = v45[v119];
  int v121 = 3;
  int v122;
  v122 = v121;
  switch (v120) {
    case 0:
      {
      int v123 = 1;
      v122 = v123;
      break;
    }
    case 1:
      {
      int v124 = 56;
      int v125 = v124 + v46;
      int v126 = v45[v125];
      int v127;
      v127 = v46;
      switch (v126) {
        case 0:
          {
          int v128 = 2;
          int v129 = v46 + v128;
          v127 = v129;
          break;
        }
        default:
          {
          int v130 = 0;
          int v131 = 0;
          int v132;
          int v133;
          v132 = v130;
          v133 = v131;
          while (true) {
            int v134 = 4;
            int v135 = v133 * v134;
            int v136 = v135 + v46;
            int v137 = 60;
            int v138 = v137 + v136;
            int v139 = v45[v138];
            int v140 = 0;
            bool v141 = v139 != v140;
            v132 = v132;
            v133 = v133;
            if (!v141) break;
            int v142 = v132 + v133;
            int v143 = 1;
            int v144 = v133 + v143;
            v132 = v142;
            v133 = v144;
          }
          bool v145 = true;
          v127 = v132;
          break;
        }
      }
      bool v146 = true;
      v122 = v127;
    }
    case 2:
      {
      int v147 = 80;
      int v148 = v147 + v46;
      int v149 = v45[v148];
      int v150 = 0;
      bool v151 = v149 != v150;
      int v152;
      if (v151) {
        int v153 = 84;
        int v154 = v153 + v46;
        int v155 = v45[v154];
        int v156 = 0;
        bool v157 = v155 != v156;
        int v158;
        if (v157) {
          int v159 = 4;
          int v160 = v46 + v159;
          v158 = v160;
        } else {
          int v161 = 2;
          v158 = v161;
        }
        v152 = v158;
      } else {
        int v162 = 4;
        v152 = v162;
      }
      v122 = v152;
      break;
    }
    default:
      {
      int v163 = 88;
      int v164 = v163 + v46;
      int v165 = v45[v164];
      int v166 = 3;
      int v167;
      v167 = v166;
      switch (v165) {
        case 0:
          {
          int v168 = 4;
          v167 = v168;
          break;
        }
        case 1:
          {
          int v169 = 0;
          int v170 = 0;
          int v171;
          int v172;
          v171 = v169;
          v172 = v170;
          while (true) {
            int v173 = 4;
            int v174 = v172 * v173;
            int v175 = v174 + v46;
            int v176 = 92;
            int v177 = v176 + v175;
            int v178 = v45[v177];
            int v179 = 0;
            bool v180 = v178 != v179;
            v171 = v171;
            v172 = v172;
            if (!v180) break;
            int v181 = v171 + v172;
            int v182 = 1;
            int v183 = v172 + v182;
            v171 = v181;
            v172 = v183;
          }
          bool v184 = true;
          v167 = v171;
          break;
        }
        default:
          {
          int v185 = 112;
          int v186 = v185 + v46;
          int v187 = v45[v186];
          int v188 = 2;
          int v189;
          v189 = v188;
          switch (v187) {
            case 0:
              {
              int v190 = 0;
              int v191 = v46 + v190;
              v189 = v191;
              break;
            }
            case 1:
              {
              int v192 = 1;
              int v193 = v46 + v192;
              v189 = v193;
              break;
            }
            case 2:
              {
              int v194 = 0;
              int v195 = v46 + v194;
              v189 = v195;
              break;
            }
            default:
              {
              int v196 = 1;
              int v197 = v46 + v196;
              v189 = v197;
              break;
            }
          }
          bool v198 = true;
          v167 = v189;
          break;
        }
        case 2:
          {
          int v199 = 3;
          int v200 = v46 + v199;
          v167 = v200;
          break;
        }
      }
      bool v201 = true;
      v122 = v167;
      break;
    }
  }
  bool v202 = true;
  int v203 = 32;
  int v204 = v203 + v46;
  bool v205 = true;
  int v206 = simt_wave_count_bits(v205);
  v44[v204] = v206;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
