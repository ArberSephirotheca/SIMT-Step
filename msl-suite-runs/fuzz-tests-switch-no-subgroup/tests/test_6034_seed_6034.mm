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
  int v6 = 1;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 3;
      int v9 = v3 % v8;
      int v10;
      v10 = v0;
      switch (v9) {
        default:
          {
          int v11 = 0;
          bool v12 = v2 != v11;
          int v13;
          if (v12) {
            int v14 = 0;
            int v15 = v0 + v14;
            v13 = v15;
          } else {
            int v16 = 4;
            v13 = v16;
          }
          v10 = v13;
        }
        case 0:
          {
          int v17 = 1;
          int v18 = v0 + v17;
          v10 = v18;
        }
        case 1:
          {
          v10 = v0;
        }
        case 2:
          {
          int v19 = 0;
          int v20 = 0;
          int v21;
          int v22;
          v21 = v19;
          v22 = v20;
          while (true) {
            int v23 = 4;
            int v24 = v3 % v23;
            int v25 = 1;
            int v26 = v24 + v25;
            bool v27 = v22 < v26;
            v21 = v21;
            v22 = v22;
            if (!v27) break;
            int v28 = 1;
            int v29 = v22 + v28;
            v21 = v0;
            v22 = v29;
          }
          v10 = v21;
          break;
        }
      }
      v7 = v10;
    }
    default:
      {
      int v30 = 0;
      bool v31 = v2 != v30;
      int v32;
      if (v31) {
        int v33 = 4;
        v32 = v33;
      } else {
        int v34 = 0;
        bool v35 = v2 != v34;
        int v36;
        if (v35) {
          int v37 = 0;
          int v38 = v0 + v37;
          v36 = v38;
        } else {
          v36 = v0;
        }
        v32 = v36;
      }
      v7 = v32;
      break;
    }
    case 1:
      {
      int v39 = 3;
      int v40 = v3 % v39;
      int v41 = 1;
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
          bool v47 = v2 != v46;
          int v48;
          if (v47) {
            int v49 = 2;
            int v50 = v0 + v49;
            v48 = v50;
          } else {
            int v51 = 4;
            int v52 = v0 + v51;
            v48 = v52;
          }
          v43 = v48;
          break;
        }
        default:
          {
          int v53 = 0;
          bool v54 = v2 != v53;
          int v55;
          if (v54) {
            v55 = v0;
          } else {
            int v56 = 1;
            v55 = v56;
          }
          v43 = v55;
          break;
        }
      }
      v7 = v43;
    }
    case 2:
      {
      int v57 = 2;
      v7 = v57;
      break;
    }
  }
  bool v58 = true;
  int v59 = simt_wave_count_bits(v58);
  int v60 = 0;
  int v61 = v60 + v0;
  v1[v61] = v59;
  return;
}

kernel void kernel_main(device int* v62 [[buffer(0)]], device int* v63 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v64 = static_cast<int>(__simt_tid3.x);
  int v65 = 0;
  int v66 = v65 + v64;
  int v67 = v63[v66];
  int v68 = 4;
  int v69 = v68 + v64;
  int v70 = v63[v69];
  helper0(v64, v62, v67, v70, static_cast<int>(__simt_tid3.x));
  int v71 = 0;
  int v72 = 0;
  int v73;
  int v74;
  v73 = v71;
  v74 = v72;
  while (true) {
    int v75 = 4;
    int v76 = v74 * v75;
    int v77 = v76 + v64;
    int v78 = 8;
    int v79 = v78 + v77;
    int v80 = v63[v79];
    int v81 = 0;
    bool v82 = v80 != v81;
    v73 = v73;
    v74 = v74;
    if (!v82) break;
    int v83 = 28;
    int v84 = v83 + v64;
    int v85 = v63[v84];
    int v86 = 0;
    bool v87 = v85 != v86;
    int v88;
    if (v87) {
      int v89 = 0;
      int v90 = v64 + v89;
      v88 = v90;
    } else {
      int v91 = 32;
      int v92 = v91 + v64;
      int v93 = v63[v92];
      int v94 = 0;
      bool v95 = v93 != v94;
      int v96;
      if (v95) {
        uint v97 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v98 = (int)(v97);
        v96 = v98;
      } else {
        v96 = v64;
      }
      int v99 = 16;
      int v100 = v99 + v64;
      bool v101 = true;
      int v102 = simt_wave_count_bits(v101);
      v62[v100] = v102;
      v88 = v96;
    }
    int v103 = 32;
    int v104 = v103 + v64;
    bool v105 = true;
    int v106 = simt_wave_count_bits(v105);
    v62[v104] = v106;
    int v107 = v73 + v88;
    int v108 = 1;
    int v109 = v74 + v108;
    bool v110 = true;
    int v111 = 48;
    int v112 = 4;
    int v113 = v74 * v112;
    int v114 = v111 + v113;
    int v115 = v114 + v64;
    bool v116 = true;
    int v117 = simt_wave_count_bits(v116);
    v62[v115] = v117;
    v73 = v107;
    v74 = v109;
  }
  int v118 = 36;
  int v119 = v118 + v64;
  int v120 = v63[v119];
  uint v121 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v122 = (int)(v121);
  int v123;
  v123 = v122;
  switch (v120) {
    case 0:
      {
      int v124 = 40;
      int v125 = v124 + v64;
      int v126 = v63[v125];
      int v127 = 0;
      bool v128 = v126 != v127;
      int v129;
      if (v128) {
        int v130 = 0;
        int v131 = 0;
        int v132;
        int v133;
        v132 = v130;
        v133 = v131;
        while (true) {
          int v134 = 4;
          int v135 = v133 * v134;
          int v136 = v135 + v64;
          int v137 = 44;
          int v138 = v137 + v136;
          int v139 = v63[v138];
          int v140 = 0;
          bool v141 = v139 != v140;
          v132 = v132;
          v133 = v133;
          if (!v141) break;
          int v142 = v132 + v133;
          int v143 = 1;
          int v144 = v133 + v143;
          bool v145 = true;
          v132 = v142;
          v133 = v144;
          break;
          ;
        }
        v129 = v132;
      } else {
        int v146 = 64;
        int v147 = v146 + v64;
        int v148 = v63[v147];
        int v149 = 3;
        int v150 = v64 + v149;
        int v151;
        v151 = v150;
        switch (v148) {
          case 0:
            {
            v151 = v64;
            break;
          }
          case 1:
            {
            v151 = v64;
            break;
          }
          case 2:
            {
            v151 = v64;
            break;
          }
          default:
            {
            int v152 = 2;
            int v153 = v64 + v152;
            v151 = v153;
            break;
          }
        }
        bool v154 = true;
        v129 = v151;
      }
      v123 = v129;
      break;
    }
    default:
      {
      int v155 = 0;
      int v156 = 0;
      int v157;
      int v158;
      v157 = v155;
      v158 = v156;
      while (true) {
        int v159 = 4;
        int v160 = v158 * v159;
        int v161 = v160 + v64;
        int v162 = 68;
        int v163 = v162 + v161;
        int v164 = v63[v163];
        int v165 = 0;
        bool v166 = v164 != v165;
        v157 = v157;
        v158 = v158;
        if (!v166) break;
        int v167 = v157 + v158;
        int v168 = 1;
        int v169 = v158 + v168;
        bool v170 = true;
        v157 = v167;
        v158 = v169;
      }
      v123 = v157;
      break;
    }
    case 1:
      {
      int v171 = 0;
      int v172 = 0;
      int v173;
      int v174;
      v173 = v171;
      v174 = v172;
      while (true) {
        int v175 = 4;
        int v176 = v174 * v175;
        int v177 = v176 + v64;
        int v178 = 88;
        int v179 = v178 + v177;
        int v180 = v63[v179];
        int v181 = 0;
        bool v182 = v180 != v181;
        v173 = v173;
        v174 = v174;
        if (!v182) break;
        int v183 = 108;
        int v184 = v183 + v64;
        int v185 = v63[v184];
        int v186 = 0;
        bool v187 = v185 != v186;
        int v188;
        if (v187) {
          v188 = v64;
        } else {
          int v189 = 4;
          int v190 = v64 + v189;
          v188 = v190;
        }
        int v191 = v173 + v188;
        int v192 = 1;
        int v193 = v174 + v192;
        bool v194 = true;
        v173 = v191;
        v174 = v193;
      }
      v123 = v173;
      break;
    }
    case 2:
      {
      int v195 = 0;
      int v196 = 0;
      int v197;
      int v198;
      v197 = v195;
      v198 = v196;
      while (true) {
        int v199 = 4;
        int v200 = v198 * v199;
        int v201 = v200 + v64;
        int v202 = 112;
        int v203 = v202 + v201;
        int v204 = v63[v203];
        int v205 = 0;
        bool v206 = v204 != v205;
        v197 = v197;
        v198 = v198;
        if (!v206) break;
        int v207 = v197 + v198;
        int v208 = 1;
        int v209 = v198 + v208;
        bool v210 = true;
        v197 = v207;
        v198 = v209;
      }
      v123 = v197;
      break;
    }
  }
  bool v211 = true;
  int v212 = 64;
  int v213 = v212 + v64;
  bool v214 = true;
  int v215 = simt_wave_count_bits(v214);
  v62[v213] = v215;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 132; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
