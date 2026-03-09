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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 0;
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      int v10 = 0;
      bool v11 = v2 != v10;
      int v12;
      if (v11) {
        uint v13 = simt_lane_id(__simt_tid);
        int v14 = (int)(v13);
        v12 = v14;
      } else {
        v12 = v0;
      }
      uint v15 = simt_lane_id(__simt_tid);
      int v16 = (int)(v15);
      v9 = v12;
    } else {
      int v17 = 3;
      v9 = v17;
    }
    int v18 = 2;
    int v19 = v0 + v18;
    v6 = v9;
  } else {
    uint v20 = simt_lane_id(__simt_tid);
    int v21 = (int)(v20);
    v6 = v21;
  }
  bool v22 = true;
  int v23 = simt_wave_count_bits(v22);
  int v24 = 0;
  int v25 = v24 + v0;
  v1[v25] = v23;
  return;
}

kernel void kernel_main(device int* v26 [[buffer(0)]], device int* v27 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v28 = static_cast<int>(__simt_tid3.x);
  int v29 = 0;
  int v30 = v29 + v28;
  int v31 = v27[v30];
  int v32 = 4;
  int v33 = v32 + v28;
  int v34 = v27[v33];
  helper0(v28, v26, v31, v34, static_cast<int>(__simt_tid3.x));
  int v35 = 8;
  int v36 = v35 + v28;
  int v37 = v27[v36];
  int v38 = 0;
  bool v39 = v37 != v38;
  int v40;
  if (v39) {
    uint v41 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v42 = (int)(v41);
    v40 = v42;
  } else {
    int v43 = 0;
    int v44 = 0;
    int v45;
    int v46;
    v45 = v43;
    v46 = v44;
    while (true) {
      int v47 = 4;
      int v48 = v46 * v47;
      int v49 = v48 + v28;
      int v50 = 12;
      int v51 = v50 + v49;
      int v52 = v27[v51];
      int v53 = 0;
      bool v54 = v52 != v53;
      v45 = v45;
      v46 = v46;
      if (!v54) break;
      int v55 = 0;
      int v56 = 0;
      int v57;
      int v58;
      v57 = v55;
      v58 = v56;
      while (true) {
        int v59 = 4;
        int v60 = v58 * v59;
        int v61 = v60 + v28;
        int v62 = 32;
        int v63 = v62 + v61;
        int v64 = v27[v63];
        int v65 = 0;
        bool v66 = v64 != v65;
        v57 = v57;
        v58 = v58;
        if (!v66) break;
        int v67 = v57 + v58;
        int v68 = 1;
        int v69 = v58 + v68;
        v57 = v67;
        v58 = v69;
        continue;
        ;
      }
      bool v70 = true;
      int v71 = v45 + v57;
      int v72 = 1;
      int v73 = v46 + v72;
      v45 = v71;
      v46 = v73;
      continue;
      ;
    }
    bool v74 = true;
    v40 = v45;
  }
  int v75 = 16;
  int v76 = v75 + v28;
  bool v77 = true;
  int v78 = simt_wave_count_bits(v77);
  v26[v76] = v78;
  int v79 = 52;
  int v80 = v79 + v28;
  int v81 = v27[v80];
  int v82 = 0;
  bool v83 = v81 != v82;
  int v84;
  if (v83) {
    int v85 = 56;
    int v86 = v85 + v28;
    int v87 = v27[v86];
    int v88 = 4;
    int v89;
    v89 = v88;
    switch (v87) {
      case 0:
        {
        int v90 = 0;
        int v91 = 0;
        int v92;
        int v93;
        v92 = v90;
        v93 = v91;
        while (true) {
          int v94 = 4;
          int v95 = v93 * v94;
          int v96 = v95 + v28;
          int v97 = 60;
          int v98 = v97 + v96;
          int v99 = v27[v98];
          int v100 = 0;
          bool v101 = v99 != v100;
          v92 = v92;
          v93 = v93;
          if (!v101) break;
          int v102 = v92 + v93;
          int v103 = 1;
          int v104 = v93 + v103;
          v92 = v102;
          v93 = v104;
        }
        bool v105 = true;
        v89 = v92;
        break;
      }
      default:
        {
        int v106 = 80;
        int v107 = v106 + v28;
        int v108 = v27[v107];
        int v109;
        v109 = v28;
        switch (v108) {
          default:
            {
            int v110 = 0;
            v109 = v110;
            break;
          }
          case 0:
            {
            int v111 = 3;
            v109 = v111;
            break;
          }
        }
        bool v112 = true;
        v89 = v109;
      }
      case 1:
        {
        int v113 = 84;
        int v114 = v113 + v28;
        int v115 = v27[v114];
        int v116;
        v116 = v28;
        switch (v115) {
          default:
            {
            v116 = v28;
            break;
          }
          case 0:
            {
            int v117 = 1;
            v116 = v117;
            break;
          }
          case 1:
            {
            int v118 = 1;
            int v119 = v28 + v118;
            v116 = v119;
            break;
          }
          case 2:
            {
            v116 = v28;
            break;
          }
        }
        bool v120 = true;
        v89 = v116;
        break;
      }
    }
    bool v121 = true;
    v84 = v89;
  } else {
    int v122 = 88;
    int v123 = v122 + v28;
    int v124 = v27[v123];
    uint v125 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v126 = (int)(v125);
    int v127;
    v127 = v126;
    switch (v124) {
      default:
        {
        int v128 = 92;
        int v129 = v128 + v28;
        int v130 = v27[v129];
        int v131 = 2;
        int v132;
        v132 = v131;
        switch (v130) {
          default:
            {
            int v133 = 3;
            int v134 = v28 + v133;
            v132 = v134;
          }
          case 0:
            {
            v132 = v28;
            break;
          }
          case 1:
            {
            v132 = v28;
            break;
          }
        }
        bool v135 = true;
        v127 = v132;
        break;
      }
      case 0:
        {
        int v136 = 4;
        v127 = v136;
        break;
      }
      case 1:
        {
        int v137 = 0;
        int v138 = 0;
        int v139;
        int v140;
        v139 = v137;
        v140 = v138;
        while (true) {
          int v141 = 4;
          int v142 = v140 * v141;
          int v143 = v142 + v28;
          int v144 = 96;
          int v145 = v144 + v143;
          int v146 = v27[v145];
          int v147 = 0;
          bool v148 = v146 != v147;
          v139 = v139;
          v140 = v140;
          if (!v148) break;
          int v149 = v139 + v140;
          int v150 = 1;
          int v151 = v140 + v150;
          v139 = v149;
          v140 = v151;
        }
        bool v152 = true;
        v127 = v139;
        break;
      }
    }
    bool v153 = true;
    v84 = v127;
  }
  int v154 = 32;
  int v155 = v154 + v28;
  bool v156 = true;
  int v157 = simt_wave_count_bits(v156);
  v26[v155] = v157;
  int v158 = 116;
  int v159 = v158 + v28;
  int v160 = v27[v159];
  int v161 = 0;
  bool v162 = v160 != v161;
  int v163;
  if (v162) {
    int v164 = 120;
    int v165 = v164 + v28;
    int v166 = v27[v165];
    int v167 = 0;
    bool v168 = v166 != v167;
    int v169;
    if (v168) {
      int v170 = 1;
      int v171 = v28 + v170;
      v169 = v171;
    } else {
      int v172 = 0;
      v169 = v172;
    }
    v163 = v169;
  } else {
    int v173 = 124;
    int v174 = v173 + v28;
    int v175 = v27[v174];
    int v176 = 0;
    bool v177 = v175 != v176;
    int v178;
    if (v177) {
      int v179 = 128;
      int v180 = v179 + v28;
      int v181 = v27[v180];
      uint v182 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v183 = (int)(v182);
      int v184;
      v184 = v183;
      switch (v181) {
        case 0:
          {
          v184 = v28;
        }
        case 1:
          {
          v184 = v28;
          break;
        }
        default:
          {
          v184 = v28;
          break;
        }
        case 2:
          {
          int v185 = 2;
          v184 = v185;
          break;
        }
      }
      bool v186 = true;
      v178 = v184;
    } else {
      int v187 = 0;
      int v188 = 0;
      int v189;
      int v190;
      v189 = v187;
      v190 = v188;
      while (true) {
        int v191 = 4;
        int v192 = v190 * v191;
        int v193 = v192 + v28;
        int v194 = 132;
        int v195 = v194 + v193;
        int v196 = v27[v195];
        int v197 = 0;
        bool v198 = v196 != v197;
        v189 = v189;
        v190 = v190;
        if (!v198) break;
        int v199 = v189 + v190;
        int v200 = 1;
        int v201 = v190 + v200;
        v189 = v199;
        v190 = v201;
        continue;
        ;
      }
      bool v202 = true;
      v178 = v189;
    }
    v163 = v178;
  }
  int v203 = 48;
  int v204 = v203 + v28;
  bool v205 = true;
  int v206 = simt_wave_count_bits(v205);
  v26[v204] = v206;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 152; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
