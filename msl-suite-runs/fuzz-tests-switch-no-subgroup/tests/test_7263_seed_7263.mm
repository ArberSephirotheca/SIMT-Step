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
    int v13 = 3;
    int v14 = v3 % v13;
    int v15 = 4;
    int v16;
    v16 = v15;
    switch (v14) {
      case 0:
        {
        int v17 = 0;
        bool v18 = v2 != v17;
        int v19;
        if (v18) {
          int v20 = 2;
          v19 = v20;
        } else {
          int v21 = 4;
          int v22 = v0 + v21;
          v19 = v22;
        }
        v16 = v19;
        break;
      }
      case 1:
        {
        int v23 = 2;
        int v24 = v3 % v23;
        int v25 = 3;
        int v26 = v0 + v25;
        int v27;
        v27 = v26;
        switch (v24) {
          default:
            {
            int v28 = 3;
            v27 = v28;
          }
          case 0:
            {
            v27 = v0;
          }
          case 1:
            {
            int v29 = 4;
            v27 = v29;
            break;
          }
        }
        v16 = v27;
        break;
      }
      default:
        {
        int v30 = 0;
        int v31 = 0;
        int v32;
        int v33;
        v32 = v30;
        v33 = v31;
        while (true) {
          int v34 = 4;
          int v35 = v3 % v34;
          int v36 = 1;
          int v37 = v35 + v36;
          bool v38 = v33 < v37;
          v32 = v32;
          v33 = v33;
          if (!v38) break;
          int v39 = 1;
          int v40 = v33 + v39;
          v32 = v0;
          v33 = v40;
        }
        v16 = v32;
      }
      case 2:
        {
        int v41 = 2;
        int v42 = v3 % v41;
        int v43;
        v43 = v0;
        switch (v42) {
          default:
            {
            int v44 = 4;
            int v45 = v0 + v44;
            v43 = v45;
          }
          case 0:
            {
            v43 = v0;
            break;
          }
        }
        v16 = v43;
        break;
      }
    }
    bool v46 = true;
    int v47 = simt_wave_count_bits(v46);
    int v48 = 0;
    int v49 = 4;
    int v50 = v7 * v49;
    int v51 = v48 + v50;
    int v52 = v51 + v0;
    v1[v52] = v47;
    int v53 = 1;
    int v54 = v7 + v53;
    v6 = v16;
    v7 = v54;
  }
  return;
}

kernel void kernel_main(device int* v55 [[buffer(0)]], device int* v56 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v57 = static_cast<int>(__simt_tid3.x);
  int v58 = 0;
  int v59 = v58 + v57;
  int v60 = v56[v59];
  int v61 = 4;
  int v62 = v61 + v57;
  int v63 = v56[v62];
  helper0(v57, v55, v60, v63, static_cast<int>(__simt_tid3.x));
  int v64 = 8;
  int v65 = v64 + v57;
  int v66 = v56[v65];
  int v67;
  v67 = v57;
  switch (v66) {
    default:
      {
      int v68 = 0;
      int v69 = v57 + v68;
      v67 = v69;
      break;
    }
    case 0:
      {
      v67 = v57;
      break;
    }
  }
  bool v70 = true;
  int v71 = 16;
  int v72 = v71 + v57;
  bool v73 = true;
  int v74 = simt_wave_count_bits(v73);
  v55[v72] = v74;
  int v75 = 12;
  int v76 = v75 + v57;
  int v77 = v56[v76];
  int v78 = 1;
  int v79 = v57 + v78;
  int v80;
  v80 = v79;
  switch (v77) {
    default:
      {
      int v81 = 16;
      int v82 = v81 + v57;
      int v83 = v56[v82];
      int v84 = 2;
      int v85;
      v85 = v84;
      switch (v83) {
        case 0:
          {
          int v86 = 2;
          v85 = v86;
          break;
        }
        default:
          {
          int v87 = 20;
          int v88 = v87 + v57;
          int v89 = v56[v88];
          int v90 = 0;
          bool v91 = v89 != v90;
          int v92;
          if (v91) {
            int v93 = 4;
            v92 = v93;
          } else {
            int v94 = 0;
            v92 = v94;
          }
          v85 = v92;
          break;
        }
        case 1:
          {
          v85 = v57;
          break;
        }
      }
      bool v95 = true;
      v80 = v85;
      break;
    }
    case 0:
      {
      int v96 = 0;
      int v97 = 0;
      int v98;
      int v99;
      v98 = v96;
      v99 = v97;
      while (true) {
        int v100 = 4;
        int v101 = v99 * v100;
        int v102 = v101 + v57;
        int v103 = 24;
        int v104 = v103 + v102;
        int v105 = v56[v104];
        int v106 = 0;
        bool v107 = v105 != v106;
        v98 = v98;
        v99 = v99;
        if (!v107) break;
        int v108 = 44;
        int v109 = v108 + v57;
        int v110 = v56[v109];
        int v111 = 1;
        int v112;
        v112 = v111;
        switch (v110) {
          case 0:
            {
            int v113 = 2;
            int v114 = v57 + v113;
            v112 = v114;
            break;
          }
          case 1:
            {
            int v115 = 3;
            v112 = v115;
            break;
          }
          default:
            {
            int v116 = 2;
            v112 = v116;
            break;
          }
          case 2:
            {
            int v117 = 1;
            int v118 = v57 + v117;
            v112 = v118;
            break;
          }
        }
        bool v119 = true;
        int v120 = v98 + v112;
        int v121 = 1;
        int v122 = v99 + v121;
        bool v123 = true;
        v98 = v120;
        v99 = v122;
      }
      v80 = v98;
      break;
    }
    case 1:
      {
      v80 = v57;
      break;
    }
    case 2:
      {
      int v124 = 48;
      int v125 = v124 + v57;
      int v126 = v56[v125];
      int v127 = 1;
      int v128 = v57 + v127;
      int v129;
      v129 = v128;
      switch (v126) {
        case 0:
          {
          v129 = v57;
          break;
        }
        default:
          {
          int v130 = 52;
          int v131 = v130 + v57;
          int v132 = v56[v131];
          int v133;
          v133 = v57;
          switch (v132) {
            case 0:
              {
              int v134 = 1;
              int v135 = v57 + v134;
              v133 = v135;
            }
            default:
              {
              int v136 = 0;
              v133 = v136;
              break;
            }
            case 1:
              {
              int v137 = 4;
              int v138 = v57 + v137;
              v133 = v138;
            }
            case 2:
              {
              int v139 = 3;
              int v140 = v57 + v139;
              v133 = v140;
              break;
            }
          }
          bool v141 = true;
          v129 = v133;
        }
        case 1:
          {
          int v142 = 0;
          int v143 = 0;
          int v144;
          int v145;
          v144 = v142;
          v145 = v143;
          while (true) {
            int v146 = 4;
            int v147 = v145 * v146;
            int v148 = v147 + v57;
            int v149 = 56;
            int v150 = v149 + v148;
            int v151 = v56[v150];
            int v152 = 0;
            bool v153 = v151 != v152;
            v144 = v144;
            v145 = v145;
            if (!v153) break;
            int v154 = v144 + v145;
            int v155 = 1;
            int v156 = v145 + v155;
            bool v157 = true;
            v144 = v154;
            v145 = v156;
            continue;
            ;
          }
          v129 = v144;
        }
        case 2:
          {
          int v158 = 0;
          int v159 = 0;
          int v160;
          int v161;
          v160 = v158;
          v161 = v159;
          while (true) {
            int v162 = 4;
            int v163 = v161 * v162;
            int v164 = v163 + v57;
            int v165 = 76;
            int v166 = v165 + v164;
            int v167 = v56[v166];
            int v168 = 0;
            bool v169 = v167 != v168;
            v160 = v160;
            v161 = v161;
            if (!v169) break;
            int v170 = v160 + v161;
            int v171 = 1;
            int v172 = v161 + v171;
            bool v173 = true;
            v160 = v170;
            v161 = v172;
          }
          v129 = v160;
          break;
        }
      }
      v80 = v129;
      break;
    }
  }
  int v174 = 96;
  int v175 = v174 + v57;
  int v176 = v56[v175];
  int v177 = 0;
  bool v178 = v176 != v177;
  int v179;
  if (v178) {
    uint v180 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v181 = (int)(v180);
    v179 = v181;
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
      int v188 = v187 + v57;
      int v189 = 100;
      int v190 = v189 + v188;
      int v191 = v56[v190];
      int v192 = 0;
      bool v193 = v191 != v192;
      v184 = v184;
      v185 = v185;
      if (!v193) break;
      int v194 = v184 + v57;
      int v195 = 1;
      int v196 = v185 + v195;
      bool v197 = true;
      int v198 = 32;
      int v199 = 4;
      int v200 = v185 * v199;
      int v201 = v198 + v200;
      int v202 = v201 + v57;
      bool v203 = true;
      int v204 = simt_wave_count_bits(v203);
      v55[v202] = v204;
      v184 = v194;
      v185 = v196;
    }
    v179 = v184;
  }
  int v205 = 48;
  int v206 = v205 + v57;
  bool v207 = true;
  int v208 = simt_wave_count_bits(v207);
  v55[v206] = v208;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
