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
  int v6 = 4;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 2;
      int v10 = v3 % v9;
      int v11 = 3;
      int v12;
      v12 = v11;
      switch (v10) {
        case 0:
          {
          int v13 = 3;
          int v14 = v0 + v13;
          v12 = v14;
          break;
        }
        default:
          {
          int v15 = 1;
          v12 = v15;
          break;
        }
        case 1:
          {
          int v16 = 0;
          bool v17 = v2 != v16;
          int v18;
          if (v17) {
            v18 = v0;
          } else {
            int v19 = 2;
            v18 = v19;
          }
          int v20 = 2;
          int v21 = v0 + v20;
          v12 = v18;
          break;
        }
      }
      v8 = v12;
    }
    case 1:
      {
      int v22 = 0;
      int v23 = 0;
      int v24;
      int v25;
      v24 = v22;
      v25 = v23;
      while (true) {
        int v26 = 4;
        int v27 = v3 % v26;
        int v28 = 1;
        int v29 = v27 + v28;
        bool v30 = v25 < v29;
        v24 = v24;
        v25 = v25;
        if (!v30) break;
        int v31 = 3;
        int v32 = v3 % v31;
        int v33 = 3;
        int v34 = v0 + v33;
        int v35;
        v35 = v34;
        switch (v32) {
          case 0:
            {
            int v36 = 1;
            int v37 = v0 + v36;
            v35 = v37;
            break;
          }
          case 1:
            {
            int v38 = 2;
            int v39 = v0 + v38;
            v35 = v39;
            break;
          }
          default:
            {
            int v40 = 2;
            v35 = v40;
            break;
          }
        }
        int v41 = 1;
        int v42 = 1;
        int v43 = v25 + v42;
        v24 = v35;
        v25 = v43;
      }
      v8 = v24;
    }
    default:
      {
      int v44 = 0;
      int v45 = 0;
      int v46;
      int v47;
      v46 = v44;
      v47 = v45;
      while (true) {
        int v48 = 4;
        int v49 = v3 % v48;
        int v50 = 1;
        int v51 = v49 + v50;
        bool v52 = v47 < v51;
        v46 = v46;
        v47 = v47;
        if (!v52) break;
        int v53 = 2;
        int v54 = v3 % v53;
        int v55 = 3;
        int v56;
        v56 = v55;
        switch (v54) {
          default:
            {
            int v57 = 1;
            v56 = v57;
            break;
          }
          case 0:
            {
            int v58 = 3;
            v56 = v58;
            break;
          }
          case 1:
            {
            v56 = v0;
            break;
          }
        }
        int v59 = 3;
        int v60 = 1;
        int v61 = v47 + v60;
        v46 = v56;
        v47 = v61;
      }
      int v62 = 2;
      int v63 = v0 + v62;
      v8 = v46;
      break;
    }
  }
  bool v64 = true;
  int v65 = simt_wave_count_bits(v64);
  int v66 = 0;
  int v67 = v66 + v0;
  v1[v67] = v65;
  return;
}

kernel void kernel_main(device int* v68 [[buffer(0)]], device int* v69 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v70 = static_cast<int>(__simt_tid3.x);
  int v71 = 0;
  int v72 = v71 + v70;
  int v73 = v69[v72];
  int v74 = 4;
  int v75 = v74 + v70;
  int v76 = v69[v75];
  helper0(v70, v68, v73, v76, static_cast<int>(__simt_tid3.x));
  int v77 = 3;
  int v78 = 8;
  int v79 = v78 + v70;
  int v80 = v69[v79];
  int v81;
  v81 = v70;
  switch (v80) {
    case 0:
      {
      int v82 = 12;
      int v83 = v82 + v70;
      int v84 = v69[v83];
      int v85;
      v85 = v70;
      switch (v84) {
        default:
          {
          int v86 = 16;
          int v87 = v86 + v70;
          int v88 = v69[v87];
          int v89 = 1;
          int v90 = v70 + v89;
          int v91;
          v91 = v90;
          switch (v88) {
            case 0:
              {
              v91 = v70;
            }
            case 1:
              {
              v91 = v70;
              break;
            }
            default:
              {
              v91 = v70;
              break;
            }
            case 2:
              {
              int v92 = 2;
              int v93 = v70 + v92;
              v91 = v93;
              break;
            }
          }
          bool v94 = true;
          v85 = v91;
          break;
        }
        case 0:
          {
          int v95 = 0;
          int v96 = 0;
          int v97;
          int v98;
          v97 = v95;
          v98 = v96;
          while (true) {
            int v99 = 4;
            int v100 = v98 * v99;
            int v101 = v100 + v70;
            int v102 = 20;
            int v103 = v102 + v101;
            int v104 = v69[v103];
            int v105 = 0;
            bool v106 = v104 != v105;
            v97 = v97;
            v98 = v98;
            if (!v106) break;
            int v107 = v97 + v98;
            int v108 = 1;
            int v109 = v98 + v108;
            v97 = v107;
            v98 = v109;
            continue;
            ;
          }
          bool v110 = true;
          v85 = v97;
          break;
        }
      }
      bool v111 = true;
      v81 = v85;
      break;
    }
    case 1:
      {
      int v112 = 0;
      int v113 = 0;
      int v114;
      int v115;
      v114 = v112;
      v115 = v113;
      while (true) {
        int v116 = 4;
        int v117 = v115 * v116;
        int v118 = v117 + v70;
        int v119 = 40;
        int v120 = v119 + v118;
        int v121 = v69[v120];
        int v122 = 0;
        bool v123 = v121 != v122;
        v114 = v114;
        v115 = v115;
        if (!v123) break;
        int v124 = 2;
        int v125 = v114 + v124;
        int v126 = 1;
        int v127 = v115 + v126;
        v114 = v125;
        v115 = v127;
        break;
        ;
      }
      bool v128 = true;
      v81 = v114;
      break;
    }
    default:
      {
      int v129 = 60;
      int v130 = v129 + v70;
      int v131 = v69[v130];
      int v132;
      v132 = v70;
      switch (v131) {
        case 0:
          {
          int v133 = 64;
          int v134 = v133 + v70;
          int v135 = v69[v134];
          int v136 = 0;
          bool v137 = v135 != v136;
          int v138;
          if (v137) {
            v138 = v70;
          } else {
            int v139 = 2;
            v138 = v139;
          }
          v132 = v138;
          break;
        }
        default:
          {
          int v140 = 68;
          int v141 = v140 + v70;
          int v142 = v69[v141];
          int v143 = 3;
          int v144;
          v144 = v143;
          switch (v142) {
            case 0:
              {
              int v145 = 4;
              int v146 = v70 + v145;
              v144 = v146;
            }
            default:
              {
              int v147 = 0;
              v144 = v147;
              break;
            }
          }
          bool v148 = true;
          v132 = v144;
          break;
        }
        case 1:
          {
          v132 = v70;
          break;
        }
        case 2:
          {
          int v149 = 72;
          int v150 = v149 + v70;
          int v151 = v69[v150];
          int v152 = 2;
          int v153 = v70 + v152;
          int v154;
          v154 = v153;
          switch (v151) {
            case 0:
              {
              int v155 = 4;
              int v156 = v70 + v155;
              v154 = v156;
              break;
            }
            default:
              {
              v154 = v70;
              break;
            }
            case 1:
              {
              int v157 = 0;
              int v158 = v70 + v157;
              v154 = v158;
              break;
            }
          }
          bool v159 = true;
          v132 = v154;
          break;
        }
      }
      bool v160 = true;
      v81 = v132;
      break;
    }
  }
  bool v161 = true;
  int v162 = 16;
  int v163 = v162 + v70;
  bool v164 = true;
  int v165 = simt_wave_count_bits(v164);
  v68[v163] = v165;
  int v166 = 76;
  int v167 = v166 + v70;
  int v168 = v69[v167];
  int v169 = 0;
  bool v170 = v168 != v169;
  int v171;
  if (v170) {
    uint v172 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v173 = (int)(v172);
    v171 = v173;
  } else {
    int v174 = 80;
    int v175 = v174 + v70;
    int v176 = v69[v175];
    uint v177 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v178 = (int)(v177);
    int v179;
    v179 = v178;
    switch (v176) {
      case 0:
        {
        int v180 = 84;
        int v181 = v180 + v70;
        int v182 = v69[v181];
        int v183 = 0;
        bool v184 = v182 != v183;
        int v185;
        if (v184) {
          int v186 = 1;
          v185 = v186;
        } else {
          int v187 = 4;
          int v188 = v70 + v187;
          v185 = v188;
        }
        v179 = v185;
      }
      case 1:
        {
        int v189 = 0;
        int v190 = 0;
        int v191;
        int v192;
        v191 = v189;
        v192 = v190;
        while (true) {
          int v193 = 4;
          int v194 = v192 * v193;
          int v195 = v194 + v70;
          int v196 = 88;
          int v197 = v196 + v195;
          int v198 = v69[v197];
          int v199 = 0;
          bool v200 = v198 != v199;
          v191 = v191;
          v192 = v192;
          if (!v200) break;
          int v201 = v191 + v192;
          int v202 = 1;
          int v203 = v192 + v202;
          v191 = v201;
          v192 = v203;
        }
        bool v204 = true;
        v179 = v191;
      }
      default:
        {
        int v205 = 108;
        int v206 = v205 + v70;
        int v207 = v69[v206];
        int v208 = 2;
        int v209 = v70 + v208;
        int v210;
        v210 = v209;
        switch (v207) {
          case 0:
            {
            int v211 = 3;
            v210 = v211;
            break;
          }
          default:
            {
            int v212 = 2;
            v210 = v212;
            break;
          }
          case 1:
            {
            int v213 = 0;
            int v214 = v70 + v213;
            v210 = v214;
            break;
          }
        }
        bool v215 = true;
        v179 = v210;
        break;
      }
    }
    bool v216 = true;
    v171 = v179;
  }
  int v217 = 32;
  int v218 = v217 + v70;
  bool v219 = true;
  int v220 = simt_wave_count_bits(v219);
  v68[v218] = v220;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
