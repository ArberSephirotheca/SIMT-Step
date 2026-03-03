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
  int v6 = 3;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 2;
      int v9 = v3 % v8;
      int v10;
      v10 = v0;
      switch (v9) {
        case 0:
          {
          int v11 = 0;
          int v12 = 0;
          int v13;
          int v14;
          v13 = v11;
          v14 = v12;
          while (true) {
            int v15 = 4;
            int v16 = v3 % v15;
            int v17 = 1;
            int v18 = v16 + v17;
            bool v19 = v14 < v18;
            v13 = v13;
            v14 = v14;
            if (!v19) break;
            int v20 = 1;
            int v21 = v14 + v20;
            v13 = v0;
            v14 = v21;
          }
          int v22 = 3;
          int v23 = v0 + v22;
          v10 = v13;
        }
        case 1:
          {
          int v24 = 2;
          v10 = v24;
          break;
        }
        default:
          {
          int v25 = 4;
          int v26 = v3 % v25;
          int v27 = 2;
          int v28 = v0 + v27;
          int v29;
          v29 = v28;
          switch (v26) {
            case 0:
              {
              int v30 = 4;
              int v31 = v0 + v30;
              v29 = v31;
              break;
            }
            case 1:
              {
              int v32 = 4;
              int v33 = v0 + v32;
              v29 = v33;
              break;
            }
            case 2:
              {
              v29 = v0;
              break;
            }
            default:
              {
              v29 = v0;
              break;
            }
          }
          int v34 = 4;
          int v35 = v0 + v34;
          v10 = v29;
          break;
        }
      }
      int v36 = 1;
      v7 = v10;
    }
    default:
      {
      int v37 = 3;
      int v38 = v3 % v37;
      int v39 = 3;
      int v40;
      v40 = v39;
      switch (v38) {
        default:
          {
          int v41 = 3;
          int v42;
          v42 = v41;
          switch (v3) {
            default:
              {
              v42 = v0;
            }
            case 0:
              {
              int v43 = 0;
              v42 = v43;
              break;
            }
          }
          int v44 = 0;
          int v45 = v0 + v44;
          v40 = v42;
          break;
        }
        case 0:
          {
          int v46 = 0;
          bool v47 = v2 != v46;
          int v48;
          if (v47) {
            v48 = v0;
          } else {
            int v49 = 2;
            int v50 = v0 + v49;
            v48 = v50;
          }
          int v51 = 4;
          v40 = v48;
          break;
        }
        case 1:
          {
          int v52 = 0;
          bool v53 = v2 != v52;
          int v54;
          if (v53) {
            v54 = v0;
          } else {
            int v55 = 4;
            int v56 = v0 + v55;
            v54 = v56;
          }
          int v57 = 1;
          int v58 = v0 + v57;
          v40 = v54;
          break;
        }
        case 2:
          {
          int v59 = 0;
          int v60 = 0;
          int v61;
          int v62;
          v61 = v59;
          v62 = v60;
          while (true) {
            int v63 = 4;
            int v64 = v3 % v63;
            int v65 = 1;
            int v66 = v64 + v65;
            bool v67 = v62 < v66;
            v61 = v61;
            v62 = v62;
            if (!v67) break;
            int v68 = 0;
            int v69 = 1;
            int v70 = v62 + v69;
            v61 = v68;
            v62 = v70;
          }
          int v71 = 1;
          int v72 = v0 + v71;
          v40 = v61;
          break;
        }
      }
      int v73 = 2;
      int v74 = v0 + v73;
      v7 = v40;
    }
    case 1:
      {
      int v75 = 0;
      bool v76 = v2 != v75;
      int v77;
      if (v76) {
        int v78 = 2;
        int v79 = v3 % v78;
        int v80 = 4;
        int v81 = v0 + v80;
        int v82;
        v82 = v81;
        switch (v79) {
          case 0:
            {
            int v83 = 3;
            int v84 = v0 + v83;
            v82 = v84;
            break;
          }
          case 1:
            {
            int v85 = 2;
            v82 = v85;
            break;
          }
          default:
            {
            v82 = v0;
            break;
          }
        }
        v77 = v82;
      } else {
        int v86 = 2;
        int v87 = v3 % v86;
        int v88;
        v88 = v0;
        switch (v87) {
          case 0:
            {
            v88 = v0;
            break;
          }
          case 1:
            {
            v88 = v0;
            break;
          }
          default:
            {
            v88 = v0;
            break;
          }
        }
        int v89 = 2;
        v77 = v88;
      }
      v7 = v77;
      break;
    }
  }
  bool v90 = true;
  int v91 = simt_wave_count_bits(v90);
  int v92 = 0;
  int v93 = v92 + v0;
  v1[v93] = v91;
  return;
}

kernel void kernel_main(device int* v94 [[buffer(0)]], device int* v95 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v96 = static_cast<int>(__simt_tid3.x);
  int v97 = 0;
  int v98 = v97 + v96;
  int v99 = v95[v98];
  int v100 = 4;
  int v101 = v100 + v96;
  int v102 = v95[v101];
  helper0(v96, v94, v99, v102, static_cast<int>(__simt_tid3.x));
  uint v103 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v104 = (int)(v103);
  int v105 = 0;
  int v106 = 0;
  int v107;
  int v108;
  v107 = v105;
  v108 = v106;
  while (true) {
    int v109 = 4;
    int v110 = v108 * v109;
    int v111 = v110 + v96;
    int v112 = 8;
    int v113 = v112 + v111;
    int v114 = v95[v113];
    int v115 = 0;
    bool v116 = v114 != v115;
    v107 = v107;
    v108 = v108;
    if (!v116) break;
    int v117 = 0;
    int v118 = 0;
    int v119;
    int v120;
    v119 = v117;
    v120 = v118;
    while (true) {
      int v121 = 4;
      int v122 = v120 * v121;
      int v123 = v122 + v96;
      int v124 = 28;
      int v125 = v124 + v123;
      int v126 = v95[v125];
      int v127 = 0;
      bool v128 = v126 != v127;
      v119 = v119;
      v120 = v120;
      if (!v128) break;
      int v129 = 48;
      int v130 = v129 + v96;
      int v131 = v95[v130];
      int v132;
      v132 = v96;
      switch (v131) {
        case 0:
          {
          v132 = v96;
          break;
        }
        default:
          {
          int v133 = 4;
          int v134 = v96 + v133;
          v132 = v134;
          break;
        }
      }
      bool v135 = true;
      int v136 = v119 + v132;
      int v137 = 1;
      int v138 = v120 + v137;
      v119 = v136;
      v120 = v138;
    }
    bool v139 = true;
    int v140 = v107 + v119;
    int v141 = 1;
    int v142 = v108 + v141;
    v107 = v140;
    v108 = v142;
  }
  bool v143 = true;
  int v144 = 16;
  int v145 = v144 + v96;
  bool v146 = true;
  int v147 = simt_wave_count_bits(v146);
  v94[v145] = v147;
  int v148 = 52;
  int v149 = v148 + v96;
  int v150 = v95[v149];
  int v151 = 0;
  bool v152 = v150 != v151;
  int v153;
  if (v152) {
    int v154 = 56;
    int v155 = v154 + v96;
    int v156 = v95[v155];
    int v157;
    v157 = v96;
    switch (v156) {
      case 0:
        {
        int v158 = 60;
        int v159 = v158 + v96;
        int v160 = v95[v159];
        int v161;
        v161 = v96;
        switch (v160) {
          case 0:
            {
            int v162 = 4;
            int v163 = v96 + v162;
            v161 = v163;
          }
          default:
            {
            v161 = v96;
            break;
          }
        }
        bool v164 = true;
        v157 = v161;
        break;
      }
      default:
        {
        int v165 = 64;
        int v166 = v165 + v96;
        int v167 = v95[v166];
        int v168;
        v168 = v96;
        switch (v167) {
          case 0:
            {
            v168 = v96;
            break;
          }
          case 1:
            {
            v168 = v96;
            break;
          }
          default:
            {
            int v169 = 4;
            v168 = v169;
            break;
          }
        }
        bool v170 = true;
        v157 = v168;
        break;
      }
    }
    bool v171 = true;
    v153 = v157;
  } else {
    int v172 = 68;
    int v173 = v172 + v96;
    int v174 = v95[v173];
    int v175 = 2;
    int v176 = v96 + v175;
    int v177;
    v177 = v176;
    switch (v174) {
      default:
        {
        int v178 = 0;
        int v179 = 0;
        int v180;
        int v181;
        v180 = v178;
        v181 = v179;
        while (true) {
          int v182 = 4;
          int v183 = v181 * v182;
          int v184 = v183 + v96;
          int v185 = 72;
          int v186 = v185 + v184;
          int v187 = v95[v186];
          int v188 = 0;
          bool v189 = v187 != v188;
          v180 = v180;
          v181 = v181;
          if (!v189) break;
          int v190 = v180 + v181;
          int v191 = 1;
          int v192 = v181 + v191;
          v180 = v190;
          v181 = v192;
          break;
          ;
        }
        bool v193 = true;
        v177 = v180;
        break;
      }
      case 0:
        {
        int v194 = 92;
        int v195 = v194 + v96;
        int v196 = v95[v195];
        int v197 = 0;
        bool v198 = v196 != v197;
        int v199;
        if (v198) {
          v199 = v96;
        } else {
          int v200 = 1;
          v199 = v200;
        }
        v177 = v199;
      }
      case 1:
        {
        int v201 = 0;
        int v202 = 0;
        int v203;
        int v204;
        v203 = v201;
        v204 = v202;
        while (true) {
          int v205 = 4;
          int v206 = v204 * v205;
          int v207 = v206 + v96;
          int v208 = 96;
          int v209 = v208 + v207;
          int v210 = v95[v209];
          int v211 = 0;
          bool v212 = v210 != v211;
          v203 = v203;
          v204 = v204;
          if (!v212) break;
          int v213 = v203 + v204;
          int v214 = 1;
          int v215 = v204 + v214;
          v203 = v213;
          v204 = v215;
        }
        bool v216 = true;
        v177 = v203;
        break;
      }
    }
    bool v217 = true;
    v153 = v177;
  }
  int v218 = 32;
  int v219 = v218 + v96;
  bool v220 = true;
  int v221 = simt_wave_count_bits(v220);
  v94[v219] = v221;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
