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
      int v22 = 3;
      int v23 = v0 + v22;
      int v24 = 1;
      int v25 = v16 + v24;
      v15 = v23;
      v16 = v25;
      continue;
      ;
    }
    uint v26 = simt_lane_id(__simt_tid);
    int v27 = (int)(v26);
    int v28 = 1;
    int v29 = v7 + v28;
    v6 = v15;
    v7 = v29;
    break;
    ;
  }
  bool v30 = true;
  int v31 = simt_wave_count_bits(v30);
  int v32 = 0;
  int v33 = v32 + v0;
  v1[v33] = v31;
  int v34 = 0;
  bool v35 = v2 != v34;
  int v36 = v35 ? v0 : v6;
  int v37 = 4;
  int v38 = v3 % v37;
  int v39;
  v39 = v0;
  switch (v38) {
    case 0:
      {
      int v40 = 4;
      int v41 = v0 + v40;
      v39 = v41;
    }
    default:
      {
      int v42 = 0;
      int v43;
      v43 = v42;
      switch (v3) {
        case 0:
          {
          int v44 = 2;
          int v45 = v3 % v44;
          int v46 = 2;
          int v47 = v0 + v46;
          int v48;
          v48 = v47;
          switch (v45) {
            case 0:
              {
              v48 = v0;
              break;
            }
            default:
              {
              v48 = v0;
              break;
            }
          }
          int v49 = 3;
          v43 = v48;
          break;
        }
        default:
          {
          int v50 = 0;
          bool v51 = v2 != v50;
          int v52;
          if (v51) {
            int v53 = 0;
            v52 = v53;
          } else {
            int v54 = 4;
            int v55 = v0 + v54;
            v52 = v55;
          }
          int v56 = 4;
          int v57 = v0 + v56;
          v43 = v52;
          break;
        }
      }
      int v58 = 2;
      int v59 = v0 + v58;
      v39 = v43;
      break;
    }
    case 1:
      {
      int v60 = 3;
      v39 = v60;
      break;
    }
    case 2:
      {
      int v61 = 0;
      int v62 = 0;
      int v63;
      int v64;
      v63 = v61;
      v64 = v62;
      while (true) {
        int v65 = 4;
        int v66 = v3 % v65;
        int v67 = 1;
        int v68 = v66 + v67;
        bool v69 = v64 < v68;
        v63 = v63;
        v64 = v64;
        if (!v69) break;
        int v70 = 4;
        int v71 = v3 % v70;
        int v72 = 4;
        int v73;
        v73 = v72;
        switch (v71) {
          case 0:
            {
            int v74 = 2;
            v73 = v74;
            break;
          }
          case 1:
            {
            v73 = v0;
            break;
          }
          case 2:
            {
            v73 = v0;
            break;
          }
          default:
            {
            int v75 = 0;
            int v76 = v0 + v75;
            v73 = v76;
            break;
          }
        }
        int v77 = 4;
        int v78 = v0 + v77;
        int v79 = 1;
        int v80 = v64 + v79;
        v63 = v73;
        v64 = v80;
      }
      v39 = v63;
      break;
    }
  }
  bool v81 = true;
  int v82 = simt_wave_count_bits(v81);
  int v83 = 16;
  int v84 = v83 + v0;
  v1[v84] = v82;
  int v85 = 0;
  bool v86 = v2 != v85;
  int v87 = v86 ? v36 : v39;
  return;
}

kernel void kernel_main(device int* v88 [[buffer(0)]], device int* v89 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v90 = static_cast<int>(__simt_tid3.x);
  int v91 = 0;
  int v92 = v91 + v90;
  int v93 = v89[v92];
  int v94 = 4;
  int v95 = v94 + v90;
  int v96 = v89[v95];
  helper0(v90, v88, v93, v96, static_cast<int>(__simt_tid3.x));
  int v97 = 8;
  int v98 = v97 + v90;
  int v99 = v89[v98];
  uint v100 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v101 = (int)(v100);
  int v102;
  v102 = v101;
  switch (v99) {
    case 0:
      {
      int v103 = 12;
      int v104 = v103 + v90;
      int v105 = v89[v104];
      int v106 = 4;
      int v107 = v90 + v106;
      int v108;
      v108 = v107;
      switch (v105) {
        case 0:
          {
          int v109 = 16;
          int v110 = v109 + v90;
          int v111 = v89[v110];
          int v112 = 1;
          int v113;
          v113 = v112;
          switch (v111) {
            default:
              {
              int v114 = 4;
              v113 = v114;
              break;
            }
            case 0:
              {
              int v115 = 4;
              v113 = v115;
              break;
            }
          }
          bool v116 = true;
          v108 = v113;
          break;
        }
        default:
          {
          int v117 = 0;
          int v118 = 0;
          int v119;
          int v120;
          v119 = v117;
          v120 = v118;
          while (true) {
            int v121 = 4;
            int v122 = v120 * v121;
            int v123 = v122 + v90;
            int v124 = 20;
            int v125 = v124 + v123;
            int v126 = v89[v125];
            int v127 = 0;
            bool v128 = v126 != v127;
            v119 = v119;
            v120 = v120;
            if (!v128) break;
            int v129 = v119 + v120;
            int v130 = 1;
            int v131 = v120 + v130;
            v119 = v129;
            v120 = v131;
            break;
            ;
          }
          bool v132 = true;
          v108 = v119;
          break;
        }
        case 1:
          {
          int v133 = 0;
          int v134 = 0;
          int v135;
          int v136;
          v135 = v133;
          v136 = v134;
          while (true) {
            int v137 = 4;
            int v138 = v136 * v137;
            int v139 = v138 + v90;
            int v140 = 40;
            int v141 = v140 + v139;
            int v142 = v89[v141];
            int v143 = 0;
            bool v144 = v142 != v143;
            v135 = v135;
            v136 = v136;
            if (!v144) break;
            int v145 = v135 + v136;
            int v146 = 1;
            int v147 = v136 + v146;
            v135 = v145;
            v136 = v147;
          }
          bool v148 = true;
          v108 = v135;
          break;
        }
      }
      bool v149 = true;
      v102 = v108;
      break;
    }
    case 1:
      {
      int v150 = 60;
      int v151 = v150 + v90;
      int v152 = v89[v151];
      int v153;
      v153 = v90;
      switch (v152) {
        case 0:
          {
          int v154 = 64;
          int v155 = v154 + v90;
          int v156 = v89[v155];
          int v157 = 0;
          bool v158 = v156 != v157;
          int v159;
          if (v158) {
            v159 = v90;
          } else {
            v159 = v90;
          }
          v153 = v159;
        }
        default:
          {
          int v160 = 0;
          int v161 = 0;
          int v162;
          int v163;
          v162 = v160;
          v163 = v161;
          while (true) {
            int v164 = 4;
            int v165 = v163 * v164;
            int v166 = v165 + v90;
            int v167 = 68;
            int v168 = v167 + v166;
            int v169 = v89[v168];
            int v170 = 0;
            bool v171 = v169 != v170;
            v162 = v162;
            v163 = v163;
            if (!v171) break;
            int v172 = v162 + v163;
            int v173 = 1;
            int v174 = v163 + v173;
            v162 = v172;
            v163 = v174;
            continue;
            ;
          }
          bool v175 = true;
          v153 = v162;
        }
        case 1:
          {
          int v176 = 0;
          v153 = v176;
          break;
        }
        case 2:
          {
          int v177 = 88;
          int v178 = v177 + v90;
          int v179 = v89[v178];
          int v180 = 4;
          int v181;
          v181 = v180;
          switch (v179) {
            case 0:
              {
              int v182 = 0;
              int v183 = v90 + v182;
              v181 = v183;
              break;
            }
            case 1:
              {
              int v184 = 1;
              int v185 = v90 + v184;
              v181 = v185;
              break;
            }
            case 2:
              {
              int v186 = 4;
              v181 = v186;
              break;
            }
            default:
              {
              int v187 = 4;
              v181 = v187;
              break;
            }
          }
          bool v188 = true;
          v153 = v181;
          break;
        }
      }
      bool v189 = true;
      v102 = v153;
      break;
    }
    case 2:
      {
      int v190 = 92;
      int v191 = v190 + v90;
      int v192 = v89[v191];
      int v193 = 0;
      bool v194 = v192 != v193;
      int v195;
      if (v194) {
        v195 = v90;
      } else {
        int v196 = 96;
        int v197 = v196 + v90;
        int v198 = v89[v197];
        int v199 = 1;
        int v200;
        v200 = v199;
        switch (v198) {
          case 0:
            {
            v200 = v90;
          }
          default:
            {
            int v201 = 2;
            v200 = v201;
            break;
          }
          case 1:
            {
            v200 = v90;
          }
          case 2:
            {
            int v202 = 0;
            int v203 = v90 + v202;
            v200 = v203;
            break;
          }
        }
        bool v204 = true;
        v195 = v200;
      }
      v102 = v195;
      break;
    }
    default:
      {
      int v205 = 100;
      int v206 = v205 + v90;
      int v207 = v89[v206];
      int v208 = 0;
      bool v209 = v207 != v208;
      int v210;
      if (v209) {
        int v211 = 104;
        int v212 = v211 + v90;
        int v213 = v89[v212];
        int v214 = 2;
        int v215;
        v215 = v214;
        switch (v213) {
          case 0:
            {
            int v216 = 1;
            int v217 = v90 + v216;
            v215 = v217;
            break;
          }
          case 1:
            {
            int v218 = 3;
            int v219 = v90 + v218;
            v215 = v219;
            break;
          }
          default:
            {
            int v220 = 0;
            int v221 = v90 + v220;
            v215 = v221;
            break;
          }
        }
        bool v222 = true;
        v210 = v215;
      } else {
        int v223 = 108;
        int v224 = v223 + v90;
        int v225 = v89[v224];
        int v226;
        v226 = v90;
        switch (v225) {
          default:
            {
            v226 = v90;
            break;
          }
          case 0:
            {
            int v227 = 0;
            v226 = v227;
            break;
          }
          case 1:
            {
            int v228 = 1;
            int v229 = v90 + v228;
            v226 = v229;
            break;
          }
        }
        bool v230 = true;
        v210 = v226;
      }
      v102 = v210;
      break;
    }
  }
  bool v231 = true;
  int v232 = 32;
  int v233 = v232 + v90;
  bool v234 = true;
  int v235 = simt_wave_count_bits(v234);
  v88[v233] = v235;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
