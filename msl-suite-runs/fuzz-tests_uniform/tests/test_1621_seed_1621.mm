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
  int v6 = 1;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 0;
        v11 = v12;
      } else {
        int v13 = 2;
        int v14 = v0 + v13;
        v11 = v14;
      }
      int v15 = 1;
      v8 = v11;
      break;
    }
    case 0:
      {
      int v16 = 4;
      int v17 = v3 % v16;
      int v18 = 4;
      int v19;
      v19 = v18;
      switch (v17) {
        default:
          {
          v19 = v0;
          break;
        }
        case 0:
          {
          int v20 = 0;
          int v21 = 0;
          int v22;
          int v23;
          v22 = v20;
          v23 = v21;
          while (true) {
            int v24 = 4;
            int v25 = v3 % v24;
            int v26 = 1;
            int v27 = v25 + v26;
            bool v28 = v23 < v27;
            v22 = v22;
            v23 = v23;
            if (!v28) break;
            int v29 = 4;
            int v30 = v0 + v29;
            int v31 = 1;
            int v32 = v23 + v31;
            v22 = v30;
            v23 = v32;
            break;
            ;
          }
          int v33 = 1;
          v19 = v22;
          break;
        }
        case 1:
          {
          int v34 = 4;
          v19 = v34;
          break;
        }
        case 2:
          {
          int v35 = 0;
          int v36 = 0;
          int v37;
          int v38;
          v37 = v35;
          v38 = v36;
          while (true) {
            int v39 = 4;
            int v40 = v3 % v39;
            int v41 = 1;
            int v42 = v40 + v41;
            bool v43 = v38 < v42;
            v37 = v37;
            v38 = v38;
            if (!v43) break;
            int v44 = 1;
            int v45 = v38 + v44;
            v37 = v0;
            v38 = v45;
          }
          int v46 = 1;
          v19 = v37;
          break;
        }
      }
      int v47 = 1;
      v8 = v19;
      break;
    }
    case 1:
      {
      int v48 = 0;
      int v49 = 0;
      int v50;
      int v51;
      v50 = v48;
      v51 = v49;
      while (true) {
        int v52 = 4;
        int v53 = v3 % v52;
        int v54 = 1;
        int v55 = v53 + v54;
        bool v56 = v51 < v55;
        v50 = v50;
        v51 = v51;
        if (!v56) break;
        int v57 = 0;
        int v58 = 0;
        int v59;
        int v60;
        v59 = v57;
        v60 = v58;
        while (true) {
          int v61 = 4;
          int v62 = v3 % v61;
          int v63 = 1;
          int v64 = v62 + v63;
          bool v65 = v60 < v64;
          v59 = v59;
          v60 = v60;
          if (!v65) break;
          int v66 = 3;
          int v67 = v0 + v66;
          int v68 = 1;
          int v69 = v60 + v68;
          v59 = v67;
          v60 = v69;
        }
        int v70 = 1;
        int v71 = 1;
        int v72 = v51 + v71;
        v50 = v59;
        v51 = v72;
      }
      int v73 = 1;
      int v74 = v0 + v73;
      v8 = v50;
      break;
    }
    case 2:
      {
      int v75 = 3;
      int v76 = v0 + v75;
      v8 = v76;
      break;
    }
  }
  bool v77 = true;
  int v78 = simt_wave_count_bits(v77);
  int v79 = 0;
  int v80 = v79 + v0;
  v1[v80] = v78;
  return;
}

kernel void kernel_main(device int* v81 [[buffer(0)]], device int* v82 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v83 = static_cast<int>(__simt_tid3.x);
  int v84 = 0;
  int v85 = v84 + v83;
  int v86 = v82[v85];
  int v87 = 4;
  int v88 = v87 + v83;
  int v89 = v82[v88];
  helper0(v83, v81, v86, v89, static_cast<int>(__simt_tid3.x));
  int v90 = 8;
  int v91 = v90 + v83;
  int v92 = v82[v91];
  int v93 = 0;
  bool v94 = v92 != v93;
  int v95;
  if (v94) {
    int v96 = 0;
    int v97 = 0;
    int v98;
    int v99;
    v98 = v96;
    v99 = v97;
    while (true) {
      int v100 = 4;
      int v101 = v99 * v100;
      int v102 = v101 + v83;
      int v103 = 12;
      int v104 = v103 + v102;
      int v105 = v82[v104];
      int v106 = 0;
      bool v107 = v105 != v106;
      v98 = v98;
      v99 = v99;
      if (!v107) break;
      int v108 = v98 + v99;
      int v109 = 1;
      int v110 = v99 + v109;
      v98 = v108;
      v99 = v110;
    }
    bool v111 = true;
    v95 = v98;
  } else {
    int v112 = 32;
    int v113 = v112 + v83;
    int v114 = v82[v113];
    uint v115 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v116 = (int)(v115);
    int v117;
    v117 = v116;
    switch (v114) {
      case 0:
        {
        int v118 = 0;
        int v119 = 0;
        int v120;
        int v121;
        v120 = v118;
        v121 = v119;
        while (true) {
          int v122 = 4;
          int v123 = v121 * v122;
          int v124 = v123 + v83;
          int v125 = 36;
          int v126 = v125 + v124;
          int v127 = v82[v126];
          int v128 = 0;
          bool v129 = v127 != v128;
          v120 = v120;
          v121 = v121;
          if (!v129) break;
          int v130 = v120 + v121;
          int v131 = 1;
          int v132 = v121 + v131;
          v120 = v130;
          v121 = v132;
        }
        bool v133 = true;
        v117 = v120;
        break;
      }
      case 1:
        {
        int v134 = 0;
        int v135 = 0;
        int v136;
        int v137;
        v136 = v134;
        v137 = v135;
        while (true) {
          int v138 = 4;
          int v139 = v137 * v138;
          int v140 = v139 + v83;
          int v141 = 56;
          int v142 = v141 + v140;
          int v143 = v82[v142];
          int v144 = 0;
          bool v145 = v143 != v144;
          v136 = v136;
          v137 = v137;
          if (!v145) break;
          int v146 = v136 + v137;
          int v147 = 1;
          int v148 = v137 + v147;
          v136 = v146;
          v137 = v148;
        }
        bool v149 = true;
        v117 = v136;
        break;
      }
      case 2:
        {
        int v150 = 4;
        int v151 = v83 + v150;
        v117 = v151;
        break;
      }
      default:
        {
        int v152 = 0;
        int v153 = 0;
        int v154;
        int v155;
        v154 = v152;
        v155 = v153;
        while (true) {
          int v156 = 4;
          int v157 = v155 * v156;
          int v158 = v157 + v83;
          int v159 = 76;
          int v160 = v159 + v158;
          int v161 = v82[v160];
          int v162 = 0;
          bool v163 = v161 != v162;
          v154 = v154;
          v155 = v155;
          if (!v163) break;
          int v164 = v154 + v155;
          int v165 = 1;
          int v166 = v155 + v165;
          v154 = v164;
          v155 = v166;
        }
        bool v167 = true;
        v117 = v154;
        break;
      }
    }
    bool v168 = true;
    v95 = v117;
  }
  int v169 = 16;
  int v170 = v169 + v83;
  bool v171 = true;
  int v172 = simt_wave_count_bits(v171);
  v81[v170] = v172;
  int v173 = 96;
  int v174 = v173 + v83;
  int v175 = v82[v174];
  int v176 = 0;
  bool v177 = v175 != v176;
  int v178;
  if (v177) {
    int v179 = 100;
    int v180 = v179 + v83;
    int v181 = v82[v180];
    int v182 = 0;
    bool v183 = v181 != v182;
    int v184;
    if (v183) {
      int v185 = 104;
      int v186 = v185 + v83;
      int v187 = v82[v186];
      int v188 = 0;
      bool v189 = v187 != v188;
      int v190;
      if (v189) {
        int v191 = 1;
        int v192 = v83 + v191;
        v190 = v192;
      } else {
        int v193 = 4;
        int v194 = v83 + v193;
        v190 = v194;
      }
      v184 = v190;
    } else {
      uint v195 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v196 = (int)(v195);
      v184 = v196;
    }
    v178 = v184;
  } else {
    int v197 = 0;
    int v198 = 0;
    int v199;
    int v200;
    v199 = v197;
    v200 = v198;
    while (true) {
      int v201 = 4;
      int v202 = v200 * v201;
      int v203 = v202 + v83;
      int v204 = 108;
      int v205 = v204 + v203;
      int v206 = v82[v205];
      int v207 = 0;
      bool v208 = v206 != v207;
      v199 = v199;
      v200 = v200;
      if (!v208) break;
      uint v209 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v210 = (int)(v209);
      int v211 = v199 + v210;
      int v212 = 1;
      int v213 = v200 + v212;
      v199 = v211;
      v200 = v213;
      continue;
      ;
    }
    bool v214 = true;
    v178 = v199;
  }
  int v215 = 32;
  int v216 = v215 + v83;
  bool v217 = true;
  int v218 = simt_wave_count_bits(v217);
  v81[v216] = v218;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
