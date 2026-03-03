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
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 2;
      v8 = v9;
    }
    case 1:
      {
      int v10 = 0;
      bool v11 = v2 != v10;
      int v12;
      if (v11) {
        int v13 = 4;
        int v14 = v3 % v13;
        int v15;
        v15 = v0;
        switch (v14) {
          case 0:
            {
            v15 = v0;
            break;
          }
          default:
            {
            int v16 = 2;
            v15 = v16;
            break;
          }
          case 1:
            {
            int v17 = 3;
            v15 = v17;
            break;
          }
          case 2:
            {
            v15 = v0;
            break;
          }
        }
        v12 = v15;
      } else {
        int v18 = 0;
        int v19 = 0;
        int v20;
        int v21;
        v20 = v18;
        v21 = v19;
        while (true) {
          int v22 = 4;
          int v23 = v3 % v22;
          int v24 = 1;
          int v25 = v23 + v24;
          bool v26 = v21 < v25;
          v20 = v20;
          v21 = v21;
          if (!v26) break;
          int v27 = 3;
          int v28 = v0 + v27;
          int v29 = 1;
          int v30 = v21 + v29;
          v20 = v28;
          v21 = v30;
        }
        int v31 = 1;
        v12 = v20;
      }
      int v32 = 3;
      v8 = v12;
    }
    default:
      {
      int v33 = 0;
      bool v34 = v2 != v33;
      int v35;
      if (v34) {
        int v36 = 3;
        int v37 = v3 % v36;
        int v38 = 0;
        int v39;
        v39 = v38;
        switch (v37) {
          case 0:
            {
            int v40 = 4;
            int v41 = v0 + v40;
            v39 = v41;
            break;
          }
          case 1:
            {
            int v42 = 2;
            int v43 = v0 + v42;
            v39 = v43;
          }
          case 2:
            {
            v39 = v0;
            break;
          }
          default:
            {
            int v44 = 4;
            int v45 = v0 + v44;
            v39 = v45;
            break;
          }
        }
        int v46 = 1;
        int v47 = v0 + v46;
        v35 = v39;
      } else {
        int v48 = 0;
        bool v49 = v2 != v48;
        int v50;
        if (v49) {
          int v51 = 2;
          v50 = v51;
        } else {
          int v52 = 1;
          v50 = v52;
        }
        int v53 = 1;
        v35 = v50;
      }
      int v54 = 1;
      v8 = v35;
      break;
    }
    case 2:
      {
      int v55 = 3;
      int v56 = v3 % v55;
      int v57;
      v57 = v0;
      switch (v56) {
        case 0:
          {
          int v58 = 0;
          bool v59 = v2 != v58;
          int v60;
          if (v59) {
            int v61 = 2;
            int v62 = v0 + v61;
            v60 = v62;
          } else {
            int v63 = 4;
            int v64 = v0 + v63;
            v60 = v64;
          }
          int v65 = 4;
          v57 = v60;
        }
        case 1:
          {
          int v66 = 1;
          int v67 = v0 + v66;
          v57 = v67;
          break;
        }
        case 2:
          {
          int v68 = 2;
          int v69 = v3 % v68;
          int v70;
          v70 = v0;
          switch (v69) {
            default:
              {
              int v71 = 1;
              v70 = v71;
            }
            case 0:
              {
              v70 = v0;
              break;
            }
          }
          v57 = v70;
          break;
        }
        default:
          {
          v57 = v0;
          break;
        }
      }
      int v72 = 3;
      int v73 = v0 + v72;
      v8 = v57;
      break;
    }
  }
  bool v74 = true;
  int v75 = simt_wave_count_bits(v74);
  int v76 = 0;
  int v77 = v76 + v0;
  v1[v77] = v75;
  return;
}

kernel void kernel_main(device int* v78 [[buffer(0)]], device int* v79 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v80 = static_cast<int>(__simt_tid3.x);
  int v81 = 0;
  int v82 = v81 + v80;
  int v83 = v79[v82];
  int v84 = 4;
  int v85 = v84 + v80;
  int v86 = v79[v85];
  helper0(v80, v78, v83, v86, static_cast<int>(__simt_tid3.x));
  int v87 = 8;
  int v88 = v87 + v80;
  int v89 = v79[v88];
  int v90 = 0;
  bool v91 = v89 != v90;
  int v92;
  if (v91) {
    uint v93 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v94 = (int)(v93);
    v92 = v94;
  } else {
    int v95 = 12;
    int v96 = v95 + v80;
    int v97 = v79[v96];
    int v98 = 0;
    bool v99 = v97 != v98;
    int v100;
    if (v99) {
      int v101 = 4;
      int v102 = v80 + v101;
      v100 = v102;
    } else {
      int v103 = 16;
      int v104 = v103 + v80;
      int v105 = v79[v104];
      int v106;
      v106 = v80;
      switch (v105) {
        default:
          {
          int v107 = 2;
          v106 = v107;
        }
        case 0:
          {
          int v108 = 2;
          v106 = v108;
          break;
        }
        case 1:
          {
          v106 = v80;
          break;
        }
        case 2:
          {
          int v109 = 4;
          v106 = v109;
          break;
        }
      }
      bool v110 = true;
      v100 = v106;
    }
    v92 = v100;
  }
  int v111 = 16;
  int v112 = v111 + v80;
  bool v113 = true;
  int v114 = simt_wave_count_bits(v113);
  v78[v112] = v114;
  int v115 = 20;
  int v116 = v115 + v80;
  int v117 = v79[v116];
  uint v118 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v119 = (int)(v118);
  int v120;
  v120 = v119;
  switch (v117) {
    default:
      {
      int v121 = 0;
      int v122 = 0;
      int v123;
      int v124;
      v123 = v121;
      v124 = v122;
      while (true) {
        int v125 = 4;
        int v126 = v124 * v125;
        int v127 = v126 + v80;
        int v128 = 24;
        int v129 = v128 + v127;
        int v130 = v79[v129];
        int v131 = 0;
        bool v132 = v130 != v131;
        v123 = v123;
        v124 = v124;
        if (!v132) break;
        int v133 = 3;
        int v134 = v80 + v133;
        int v135 = v123 + v134;
        int v136 = 1;
        int v137 = v124 + v136;
        v123 = v135;
        v124 = v137;
        break;
        ;
      }
      bool v138 = true;
      v120 = v123;
      break;
    }
    case 0:
      {
      int v139 = 44;
      int v140 = v139 + v80;
      int v141 = v79[v140];
      int v142 = 4;
      int v143;
      v143 = v142;
      switch (v141) {
        case 0:
          {
          v143 = v80;
        }
        case 1:
          {
          int v144 = 0;
          int v145 = 0;
          int v146;
          int v147;
          v146 = v144;
          v147 = v145;
          while (true) {
            int v148 = 4;
            int v149 = v147 * v148;
            int v150 = v149 + v80;
            int v151 = 48;
            int v152 = v151 + v150;
            int v153 = v79[v152];
            int v154 = 0;
            bool v155 = v153 != v154;
            v146 = v146;
            v147 = v147;
            if (!v155) break;
            int v156 = v146 + v147;
            int v157 = 1;
            int v158 = v147 + v157;
            v146 = v156;
            v147 = v158;
          }
          bool v159 = true;
          v143 = v146;
          break;
        }
        default:
          {
          int v160 = 68;
          int v161 = v160 + v80;
          int v162 = v79[v161];
          int v163 = 0;
          bool v164 = v162 != v163;
          int v165;
          if (v164) {
            v165 = v80;
          } else {
            int v166 = 3;
            v165 = v166;
          }
          v143 = v165;
        }
        case 2:
          {
          int v167 = 1;
          int v168 = v80 + v167;
          v143 = v168;
          break;
        }
      }
      bool v169 = true;
      v120 = v143;
      break;
    }
  }
  bool v170 = true;
  int v171 = 32;
  int v172 = v171 + v80;
  bool v173 = true;
  int v174 = simt_wave_count_bits(v173);
  v78[v172] = v174;
  int v175 = 72;
  int v176 = v175 + v80;
  int v177 = v79[v176];
  int v178 = 0;
  bool v179 = v177 != v178;
  int v180;
  if (v179) {
    uint v181 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v182 = (int)(v181);
    v180 = v182;
  } else {
    int v183 = 76;
    int v184 = v183 + v80;
    int v185 = v79[v184];
    int v186;
    v186 = v80;
    switch (v185) {
      case 0:
        {
        int v187 = 80;
        int v188 = v187 + v80;
        int v189 = v79[v188];
        int v190 = 0;
        bool v191 = v189 != v190;
        int v192;
        if (v191) {
          v192 = v80;
        } else {
          int v193 = 0;
          v192 = v193;
        }
        v186 = v192;
        break;
      }
      default:
        {
        int v194 = 84;
        int v195 = v194 + v80;
        int v196 = v79[v195];
        int v197 = 0;
        bool v198 = v196 != v197;
        int v199;
        if (v198) {
          int v200 = 2;
          v199 = v200;
        } else {
          int v201 = 1;
          int v202 = v80 + v201;
          v199 = v202;
        }
        v186 = v199;
        break;
      }
      case 1:
        {
        int v203 = 0;
        int v204 = 0;
        int v205;
        int v206;
        v205 = v203;
        v206 = v204;
        while (true) {
          int v207 = 4;
          int v208 = v206 * v207;
          int v209 = v208 + v80;
          int v210 = 88;
          int v211 = v210 + v209;
          int v212 = v79[v211];
          int v213 = 0;
          bool v214 = v212 != v213;
          v205 = v205;
          v206 = v206;
          if (!v214) break;
          int v215 = v205 + v206;
          int v216 = 1;
          int v217 = v206 + v216;
          v205 = v215;
          v206 = v217;
        }
        bool v218 = true;
        v186 = v205;
        break;
      }
    }
    bool v219 = true;
    v180 = v186;
  }
  int v220 = 48;
  int v221 = v220 + v80;
  bool v222 = true;
  int v223 = simt_wave_count_bits(v222);
  v78[v221] = v223;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
