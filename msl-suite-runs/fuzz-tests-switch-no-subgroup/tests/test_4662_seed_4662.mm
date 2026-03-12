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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 0;
  bool v9 = v2 != v8;
  int v10;
  if (v9) {
    bool v11 = true;
    int v12 = simt_wave_count_bits(v11);
    int v13 = 16;
    int v14 = v13 + v0;
    v1[v14] = v12;
    v10 = v12;
  } else {
    int v15 = 0;
    int v16 = 0;
    int v17;
    int v18;
    v17 = v15;
    v18 = v16;
    while (true) {
      int v19 = 4;
      int v20 = v3 % v19;
      int v21 = 1;
      int v22 = v20 + v21;
      bool v23 = v18 < v22;
      v17 = v17;
      v18 = v18;
      if (!v23) break;
      bool v24 = true;
      int v25 = simt_wave_count_bits(v24);
      int v26 = 32;
      int v27 = 4;
      int v28 = v18 * v27;
      int v29 = v26 + v28;
      int v30 = v29 + v0;
      v1[v30] = v25;
      int v31 = 1;
      int v32 = v18 + v31;
      v17 = v25;
      v18 = v32;
    }
    v10 = v17;
  }
  int v33 = 0;
  bool v34 = v2 != v33;
  int v35 = v34 ? v5 : v10;
  int v36 = 3;
  int v37 = v3 % v36;
  uint v38 = simt_lane_id(__simt_tid);
  int v39 = (int)(v38);
  int v40;
  v40 = v39;
  switch (v37) {
    case 0:
      {
      int v41 = 0;
      int v42 = 0;
      int v43;
      int v44;
      v43 = v41;
      v44 = v42;
      while (true) {
        int v45 = 4;
        int v46 = v3 % v45;
        int v47 = 1;
        int v48 = v46 + v47;
        bool v49 = v44 < v48;
        v43 = v43;
        v44 = v44;
        if (!v49) break;
        int v50 = 2;
        int v51 = 1;
        int v52 = v44 + v51;
        v43 = v50;
        v44 = v52;
      }
      v40 = v43;
    }
    default:
      {
      v40 = v0;
    }
    case 1:
      {
      int v53 = 0;
      bool v54 = v2 != v53;
      int v55;
      if (v54) {
        int v56 = 0;
        bool v57 = v2 != v56;
        int v58;
        if (v57) {
          int v59 = 4;
          int v60 = v0 + v59;
          v58 = v60;
        } else {
          v58 = v0;
        }
        v55 = v58;
      } else {
        int v61 = 2;
        int v62 = v3 % v61;
        int v63;
        v63 = v0;
        switch (v62) {
          default:
            {
            int v64 = 1;
            v63 = v64;
          }
          case 0:
            {
            int v65 = 0;
            int v66 = v0 + v65;
            v63 = v66;
            break;
          }
        }
        v55 = v63;
      }
      v40 = v55;
      break;
    }
  }
  int v67 = 0;
  bool v68 = v2 != v67;
  int v69 = v68 ? v35 : v40;
  return;
}

kernel void kernel_main(device int* v70 [[buffer(0)]], device int* v71 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v72 = static_cast<int>(__simt_tid3.x);
  int v73 = 0;
  int v74 = v73 + v72;
  int v75 = v71[v74];
  int v76 = 4;
  int v77 = v76 + v72;
  int v78 = v71[v77];
  helper0(v72, v70, v75, v78, static_cast<int>(__simt_tid3.x));
  int v79 = 8;
  int v80 = v79 + v72;
  int v81 = v71[v80];
  int v82 = 0;
  bool v83 = v81 != v82;
  int v84;
  if (v83) {
    int v85 = 0;
    int v86 = 0;
    int v87;
    int v88;
    v87 = v85;
    v88 = v86;
    while (true) {
      int v89 = 4;
      int v90 = v88 * v89;
      int v91 = v90 + v72;
      int v92 = 12;
      int v93 = v92 + v91;
      int v94 = v71[v93];
      int v95 = 0;
      bool v96 = v94 != v95;
      v87 = v87;
      v88 = v88;
      if (!v96) break;
      int v97 = 32;
      int v98 = v97 + v72;
      int v99 = v71[v98];
      int v100 = 0;
      bool v101 = v99 != v100;
      int v102;
      if (v101) {
        uint v103 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v104 = (int)(v103);
        v102 = v104;
      } else {
        int v105 = 1;
        v102 = v105;
      }
      int v106 = 48;
      int v107 = v106 + v72;
      bool v108 = true;
      int v109 = simt_wave_count_bits(v108);
      v70[v107] = v109;
      int v110 = v87 + v102;
      int v111 = 1;
      int v112 = v88 + v111;
      bool v113 = true;
      int v114 = 64;
      int v115 = 4;
      int v116 = v88 * v115;
      int v117 = v114 + v116;
      int v118 = v117 + v72;
      bool v119 = true;
      int v120 = simt_wave_count_bits(v119);
      v70[v118] = v120;
      v87 = v110;
      v88 = v112;
    }
    v84 = v87;
  } else {
    uint v121 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v122 = (int)(v121);
    v84 = v122;
  }
  int v123 = 80;
  int v124 = v123 + v72;
  bool v125 = true;
  int v126 = simt_wave_count_bits(v125);
  v70[v124] = v126;
  int v127 = 36;
  int v128 = v127 + v72;
  int v129 = v71[v128];
  int v130 = 0;
  bool v131 = v129 != v130;
  int v132;
  if (v131) {
    int v133 = 40;
    int v134 = v133 + v72;
    int v135 = v71[v134];
    uint v136 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v137 = (int)(v136);
    int v138;
    v138 = v137;
    switch (v135) {
      case 0:
        {
        int v139 = 4;
        v138 = v139;
        break;
      }
      case 1:
        {
        v138 = v72;
        break;
      }
      default:
        {
        v138 = v72;
        break;
      }
    }
    v132 = v138;
  } else {
    int v140 = 0;
    int v141 = 0;
    int v142;
    int v143;
    v142 = v140;
    v143 = v141;
    while (true) {
      int v144 = 4;
      int v145 = v143 * v144;
      int v146 = v145 + v72;
      int v147 = 44;
      int v148 = v147 + v146;
      int v149 = v71[v148];
      int v150 = 0;
      bool v151 = v149 != v150;
      v142 = v142;
      v143 = v143;
      if (!v151) break;
      int v152 = 64;
      int v153 = v152 + v72;
      int v154 = v71[v153];
      int v155 = 0;
      bool v156 = v154 != v155;
      int v157;
      if (v156) {
        v157 = v72;
      } else {
        int v158 = 1;
        v157 = v158;
      }
      int v159 = 96;
      int v160 = v159 + v72;
      bool v161 = true;
      int v162 = simt_wave_count_bits(v161);
      v70[v160] = v162;
      int v163 = v142 + v157;
      int v164 = 1;
      int v165 = v143 + v164;
      bool v166 = true;
      int v167 = 112;
      int v168 = 4;
      int v169 = v143 * v168;
      int v170 = v167 + v169;
      int v171 = v170 + v72;
      bool v172 = true;
      int v173 = simt_wave_count_bits(v172);
      v70[v171] = v173;
      v142 = v163;
      v143 = v165;
    }
    v132 = v142;
  }
  int v174 = 128;
  int v175 = v174 + v72;
  bool v176 = true;
  int v177 = simt_wave_count_bits(v176);
  v70[v175] = v177;
  int v178 = 68;
  int v179 = v178 + v72;
  int v180 = v71[v179];
  int v181 = 0;
  bool v182 = v180 != v181;
  int v183;
  if (v182) {
    int v184 = 72;
    int v185 = v184 + v72;
    int v186 = v71[v185];
    int v187 = 2;
    int v188 = v72 + v187;
    int v189;
    v189 = v188;
    switch (v186) {
      case 0:
        {
        int v190 = 76;
        int v191 = v190 + v72;
        int v192 = v71[v191];
        int v193;
        v193 = v72;
        switch (v192) {
          case 0:
            {
            int v194 = 4;
            v193 = v194;
            break;
          }
          case 1:
            {
            int v195 = 3;
            v193 = v195;
          }
          case 2:
            {
            int v196 = 2;
            v193 = v196;
          }
          default:
            {
            v193 = v72;
            break;
          }
        }
        bool v197 = true;
        v189 = v193;
        break;
      }
      case 1:
        {
        int v198 = 80;
        int v199 = v198 + v72;
        int v200 = v71[v199];
        int v201 = 0;
        bool v202 = v200 != v201;
        int v203;
        if (v202) {
          v203 = v72;
        } else {
          int v204 = 0;
          v203 = v204;
        }
        v189 = v203;
        break;
      }
      default:
        {
        int v205 = 3;
        int v206 = v72 + v205;
        v189 = v206;
        break;
      }
    }
    v183 = v189;
  } else {
    uint v207 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v208 = (int)(v207);
    v183 = v208;
  }
  int v209 = 144;
  int v210 = v209 + v72;
  bool v211 = true;
  int v212 = simt_wave_count_bits(v211);
  v70[v210] = v212;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 148; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
