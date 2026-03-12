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
    int v13 = 4;
    int v14 = v0 + v13;
    int v15 = 1;
    int v16 = v7 + v15;
    v6 = v14;
    v7 = v16;
  }
  bool v17 = true;
  int v18 = simt_wave_count_bits(v17);
  int v19 = 0;
  int v20 = v19 + v0;
  v1[v20] = v18;
  int v21 = 3;
  int v22 = v3 % v21;
  int v23;
  v23 = v0;
  switch (v22) {
    case 0:
      {
      int v24 = 0;
      bool v25 = v2 != v24;
      int v26;
      if (v25) {
        int v27 = 0;
        bool v28 = v2 != v27;
        int v29;
        if (v28) {
          v29 = v0;
        } else {
          int v30 = 0;
          v29 = v30;
        }
        int v31 = 2;
        int v32 = v0 + v31;
        v26 = v29;
      } else {
        int v33 = 4;
        int v34 = v3 % v33;
        int v35 = 4;
        int v36;
        v36 = v35;
        switch (v34) {
          case 0:
            {
            int v37 = 4;
            int v38 = v0 + v37;
            v36 = v38;
            break;
          }
          case 1:
            {
            int v39 = 1;
            v36 = v39;
            break;
          }
          case 2:
            {
            v36 = v0;
            break;
          }
          default:
            {
            int v40 = 2;
            v36 = v40;
            break;
          }
        }
        int v41 = 3;
        int v42 = v0 + v41;
        v26 = v36;
      }
      v23 = v26;
      break;
    }
    case 1:
      {
      int v43 = 0;
      int v44 = 0;
      int v45;
      int v46;
      v45 = v43;
      v46 = v44;
      while (true) {
        int v47 = 4;
        int v48 = v3 % v47;
        int v49 = 1;
        int v50 = v48 + v49;
        bool v51 = v46 < v50;
        v45 = v45;
        v46 = v46;
        if (!v51) break;
        int v52 = 0;
        bool v53 = v2 != v52;
        int v54;
        if (v53) {
          int v55 = 2;
          v54 = v55;
        } else {
          v54 = v0;
        }
        int v56 = 4;
        int v57 = v0 + v56;
        int v58 = 1;
        int v59 = v46 + v58;
        v45 = v54;
        v46 = v59;
      }
      int v60 = 3;
      v23 = v45;
    }
    default:
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
        int v70 = 0;
        bool v71 = v2 != v70;
        int v72;
        if (v71) {
          v72 = v0;
        } else {
          int v73 = 3;
          v72 = v73;
        }
        int v74 = 1;
        int v75 = v64 + v74;
        v63 = v72;
        v64 = v75;
      }
      int v76 = 2;
      v23 = v63;
      break;
    }
  }
  bool v77 = true;
  int v78 = simt_wave_count_bits(v77);
  int v79 = 16;
  int v80 = v79 + v0;
  v1[v80] = v78;
  int v81 = 0;
  bool v82 = v2 != v81;
  int v83 = v82 ? v6 : v23;
  return;
}

kernel void kernel_main(device int* v84 [[buffer(0)]], device int* v85 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v86 = static_cast<int>(__simt_tid3.x);
  int v87 = 0;
  int v88 = v87 + v86;
  int v89 = v85[v88];
  int v90 = 4;
  int v91 = v90 + v86;
  int v92 = v85[v91];
  helper0(v86, v84, v89, v92, static_cast<int>(__simt_tid3.x));
  int v93 = 8;
  int v94 = v93 + v86;
  int v95 = v85[v94];
  int v96 = 0;
  bool v97 = v95 != v96;
  int v98;
  if (v97) {
    int v99 = 12;
    int v100 = v99 + v86;
    int v101 = v85[v100];
    int v102 = 2;
    int v103;
    v103 = v102;
    switch (v101) {
      case 0:
        {
        int v104 = 0;
        int v105 = 0;
        int v106;
        int v107;
        v106 = v104;
        v107 = v105;
        while (true) {
          int v108 = 4;
          int v109 = v107 * v108;
          int v110 = v109 + v86;
          int v111 = 16;
          int v112 = v111 + v110;
          int v113 = v85[v112];
          int v114 = 0;
          bool v115 = v113 != v114;
          v106 = v106;
          v107 = v107;
          if (!v115) break;
          int v116 = v106 + v107;
          int v117 = 1;
          int v118 = v107 + v117;
          v106 = v116;
          v107 = v118;
          break;
          ;
        }
        bool v119 = true;
        v103 = v106;
        break;
      }
      case 1:
        {
        int v120 = 3;
        v103 = v120;
        break;
      }
      default:
        {
        int v121 = 36;
        int v122 = v121 + v86;
        int v123 = v85[v122];
        int v124;
        v124 = v86;
        switch (v123) {
          default:
            {
            int v125 = 4;
            v124 = v125;
            break;
          }
          case 0:
            {
            v124 = v86;
            break;
          }
          case 1:
            {
            v124 = v86;
            break;
          }
        }
        bool v126 = true;
        v103 = v124;
        break;
      }
    }
    bool v127 = true;
    v98 = v103;
  } else {
    int v128 = 0;
    int v129 = 0;
    int v130;
    int v131;
    v130 = v128;
    v131 = v129;
    while (true) {
      int v132 = 4;
      int v133 = v131 * v132;
      int v134 = v133 + v86;
      int v135 = 40;
      int v136 = v135 + v134;
      int v137 = v85[v136];
      int v138 = 0;
      bool v139 = v137 != v138;
      v130 = v130;
      v131 = v131;
      if (!v139) break;
      int v140 = 0;
      int v141 = 0;
      int v142;
      int v143;
      v142 = v140;
      v143 = v141;
      while (true) {
        int v144 = 4;
        int v145 = v143 * v144;
        int v146 = v145 + v86;
        int v147 = 60;
        int v148 = v147 + v146;
        int v149 = v85[v148];
        int v150 = 0;
        bool v151 = v149 != v150;
        v142 = v142;
        v143 = v143;
        if (!v151) break;
        int v152 = v142 + v143;
        int v153 = 1;
        int v154 = v143 + v153;
        v142 = v152;
        v143 = v154;
        continue;
        ;
      }
      bool v155 = true;
      int v156 = v130 + v142;
      int v157 = 1;
      int v158 = v131 + v157;
      v130 = v156;
      v131 = v158;
    }
    bool v159 = true;
    v98 = v130;
  }
  int v160 = 32;
  int v161 = v160 + v86;
  bool v162 = true;
  int v163 = simt_wave_count_bits(v162);
  v84[v161] = v163;
  int v164 = 80;
  int v165 = v164 + v86;
  int v166 = v85[v165];
  int v167 = 0;
  bool v168 = v166 != v167;
  int v169;
  if (v168) {
    int v170 = 84;
    int v171 = v170 + v86;
    int v172 = v85[v171];
    int v173 = 0;
    bool v174 = v172 != v173;
    int v175;
    if (v174) {
      int v176 = 2;
      v175 = v176;
    } else {
      int v177 = 88;
      int v178 = v177 + v86;
      int v179 = v85[v178];
      int v180 = 0;
      bool v181 = v179 != v180;
      int v182;
      if (v181) {
        int v183 = 1;
        int v184 = v86 + v183;
        v182 = v184;
      } else {
        v182 = v86;
      }
      v175 = v182;
    }
    v169 = v175;
  } else {
    int v185 = 92;
    int v186 = v185 + v86;
    int v187 = v85[v186];
    uint v188 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v189 = (int)(v188);
    int v190;
    v190 = v189;
    switch (v187) {
      case 0:
        {
        int v191 = 96;
        int v192 = v191 + v86;
        int v193 = v85[v192];
        int v194 = 1;
        int v195 = v86 + v194;
        int v196;
        v196 = v195;
        switch (v193) {
          case 0:
            {
            int v197 = 3;
            v196 = v197;
          }
          case 1:
            {
            v196 = v86;
            break;
          }
          default:
            {
            int v198 = 4;
            int v199 = v86 + v198;
            v196 = v199;
          }
          case 2:
            {
            int v200 = 0;
            int v201 = v86 + v200;
            v196 = v201;
            break;
          }
        }
        bool v202 = true;
        v190 = v196;
        break;
      }
      default:
        {
        int v203 = 100;
        int v204 = v203 + v86;
        int v205 = v85[v204];
        int v206;
        v206 = v86;
        switch (v205) {
          default:
            {
            v206 = v86;
            break;
          }
          case 0:
            {
            int v207 = 4;
            v206 = v207;
            break;
          }
          case 1:
            {
            v206 = v86;
            break;
          }
        }
        bool v208 = true;
        v190 = v206;
        break;
      }
      case 1:
        {
        int v209 = 4;
        v190 = v209;
        break;
      }
      case 2:
        {
        int v210 = 2;
        v190 = v210;
        break;
      }
    }
    bool v211 = true;
    v169 = v190;
  }
  int v212 = 48;
  int v213 = v212 + v86;
  bool v214 = true;
  int v215 = simt_wave_count_bits(v214);
  v84[v213] = v215;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
