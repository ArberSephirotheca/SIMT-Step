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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 3;
  int v7 = v3 % v6;
  uint v8 = simt_lane_id(__simt_tid);
  int v9 = (int)(v8);
  int v10;
  v10 = v9;
  switch (v7) {
    case 0:
      {
      v10 = v0;
    }
    default:
      {
      int v11 = 4;
      int v12 = v0 + v11;
      v10 = v12;
      break;
    }
    case 1:
      {
      int v13 = 1;
      int v14 = v0 + v13;
      v10 = v14;
      break;
    }
  }
  bool v15 = true;
  int v16 = simt_wave_count_bits(v15);
  int v17 = 0;
  int v18 = v17 + v0;
  v1[v18] = v16;
  int v19 = 0;
  bool v20 = v2 != v19;
  int v21 = v20 ? v5 : v10;
  int v22 = 3;
  int v23 = v3 % v22;
  uint v24 = simt_subgroup_id(__simt_tid);
  int v25 = (int)(v24);
  int v26;
  v26 = v25;
  switch (v23) {
    case 0:
      {
      int v27 = 3;
      v26 = v27;
      break;
    }
    default:
      {
      int v28 = 2;
      int v29 = v3 % v28;
      int v30 = 3;
      int v31 = v0 + v30;
      int v32;
      v32 = v31;
      switch (v29) {
        default:
          {
          int v33 = 0;
          bool v34 = v2 != v33;
          int v35;
          if (v34) {
            int v36 = 1;
            int v37 = v0 + v36;
            v35 = v37;
          } else {
            int v38 = 2;
            v35 = v38;
          }
          v32 = v35;
          break;
        }
        case 0:
          {
          int v39 = 3;
          v32 = v39;
          break;
        }
        case 1:
          {
          int v40 = 0;
          int v41 = 0;
          int v42;
          int v43;
          v42 = v40;
          v43 = v41;
          while (true) {
            int v44 = 4;
            int v45 = v3 % v44;
            int v46 = 1;
            int v47 = v45 + v46;
            bool v48 = v43 < v47;
            v42 = v42;
            v43 = v43;
            if (!v48) break;
            int v49 = 3;
            int v50 = 1;
            int v51 = v43 + v50;
            v42 = v49;
            v43 = v51;
          }
          v32 = v42;
          break;
        }
      }
      int v52 = 3;
      v26 = v32;
      break;
    }
    case 1:
      {
      int v53 = 0;
      bool v54 = v2 != v53;
      int v55;
      if (v54) {
        int v56 = 0;
        v55 = v56;
      } else {
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
          int v66 = 2;
          int v67 = 1;
          int v68 = v60 + v67;
          v59 = v66;
          v60 = v68;
        }
        v55 = v59;
      }
      v26 = v55;
      break;
    }
  }
  bool v69 = true;
  int v70 = simt_wave_count_bits(v69);
  int v71 = 16;
  int v72 = v71 + v0;
  v1[v72] = v70;
  int v73 = 0;
  bool v74 = v2 != v73;
  int v75 = v74 ? v21 : v26;
  return;
}

kernel void kernel_main(device int* v76 [[buffer(0)]], device int* v77 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v78 = static_cast<int>(__simt_tid3.x);
  int v79 = 0;
  int v80 = v79 + v78;
  int v81 = v77[v80];
  int v82 = 4;
  int v83 = v82 + v78;
  int v84 = v77[v83];
  helper0(v78, v76, v81, v84, static_cast<int>(__simt_tid3.x));
  int v85 = 8;
  int v86 = v85 + v78;
  int v87 = v77[v86];
  uint v88 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v89 = (int)(v88);
  int v90;
  v90 = v89;
  switch (v87) {
    case 0:
      {
      int v91 = 3;
      v90 = v91;
    }
    default:
      {
      int v92 = 0;
      int v93 = 0;
      int v94;
      int v95;
      v94 = v92;
      v95 = v93;
      while (true) {
        int v96 = 4;
        int v97 = v95 * v96;
        int v98 = v97 + v78;
        int v99 = 12;
        int v100 = v99 + v98;
        int v101 = v77[v100];
        int v102 = 0;
        bool v103 = v101 != v102;
        v94 = v94;
        v95 = v95;
        if (!v103) break;
        int v104 = 32;
        int v105 = v104 + v78;
        int v106 = v77[v105];
        int v107 = 0;
        bool v108 = v106 != v107;
        int v109;
        if (v108) {
          v109 = v78;
        } else {
          int v110 = 2;
          v109 = v110;
        }
        int v111 = v94 + v109;
        int v112 = 1;
        int v113 = v95 + v112;
        v94 = v111;
        v95 = v113;
      }
      bool v114 = true;
      v90 = v94;
      break;
    }
    case 1:
      {
      int v115 = 0;
      int v116 = 0;
      int v117;
      int v118;
      v117 = v115;
      v118 = v116;
      while (true) {
        int v119 = 4;
        int v120 = v118 * v119;
        int v121 = v120 + v78;
        int v122 = 36;
        int v123 = v122 + v121;
        int v124 = v77[v123];
        int v125 = 0;
        bool v126 = v124 != v125;
        v117 = v117;
        v118 = v118;
        if (!v126) break;
        int v127 = v117 + v118;
        int v128 = 1;
        int v129 = v118 + v128;
        v117 = v127;
        v118 = v129;
      }
      bool v130 = true;
      v90 = v117;
      break;
    }
  }
  bool v131 = true;
  int v132 = 32;
  int v133 = v132 + v78;
  bool v134 = true;
  int v135 = simt_wave_count_bits(v134);
  v76[v133] = v135;
  int v136 = 56;
  int v137 = v136 + v78;
  int v138 = v77[v137];
  int v139 = 0;
  bool v140 = v138 != v139;
  int v141;
  if (v140) {
    int v142 = 60;
    int v143 = v142 + v78;
    int v144 = v77[v143];
    int v145 = 0;
    int v146;
    v146 = v145;
    switch (v144) {
      case 0:
        {
        v146 = v78;
        break;
      }
      default:
        {
        int v147 = 64;
        int v148 = v147 + v78;
        int v149 = v77[v148];
        int v150 = 4;
        int v151;
        v151 = v150;
        switch (v149) {
          case 0:
            {
            v151 = v78;
            break;
          }
          case 1:
            {
            int v152 = 0;
            v151 = v152;
            break;
          }
          default:
            {
            int v153 = 0;
            v151 = v153;
            break;
          }
          case 2:
            {
            v151 = v78;
            break;
          }
        }
        bool v154 = true;
        v146 = v151;
        break;
      }
    }
    bool v155 = true;
    v141 = v146;
  } else {
    int v156 = 3;
    v141 = v156;
  }
  int v157 = 48;
  int v158 = v157 + v78;
  bool v159 = true;
  int v160 = simt_wave_count_bits(v159);
  v76[v158] = v160;
  int v161 = 68;
  int v162 = v161 + v78;
  int v163 = v77[v162];
  uint v164 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v165 = (int)(v164);
  int v166;
  v166 = v165;
  switch (v163) {
    default:
      {
      int v167 = 0;
      int v168 = 0;
      int v169;
      int v170;
      v169 = v167;
      v170 = v168;
      while (true) {
        int v171 = 4;
        int v172 = v170 * v171;
        int v173 = v172 + v78;
        int v174 = 72;
        int v175 = v174 + v173;
        int v176 = v77[v175];
        int v177 = 0;
        bool v178 = v176 != v177;
        v169 = v169;
        v170 = v170;
        if (!v178) break;
        int v179 = v169 + v170;
        int v180 = 1;
        int v181 = v170 + v180;
        v169 = v179;
        v170 = v181;
      }
      bool v182 = true;
      v166 = v169;
    }
    case 0:
      {
      int v183 = 92;
      int v184 = v183 + v78;
      int v185 = v77[v184];
      int v186 = 2;
      int v187 = v78 + v186;
      int v188;
      v188 = v187;
      switch (v185) {
        default:
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
            int v195 = v194 + v78;
            int v196 = 96;
            int v197 = v196 + v195;
            int v198 = v77[v197];
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
            continue;
            ;
          }
          bool v204 = true;
          v188 = v191;
          break;
        }
        case 0:
          {
          int v205 = 2;
          v188 = v205;
          break;
        }
        case 1:
          {
          int v206 = 0;
          int v207 = 0;
          int v208;
          int v209;
          v208 = v206;
          v209 = v207;
          while (true) {
            int v210 = 4;
            int v211 = v209 * v210;
            int v212 = v211 + v78;
            int v213 = 116;
            int v214 = v213 + v212;
            int v215 = v77[v214];
            int v216 = 0;
            bool v217 = v215 != v216;
            v208 = v208;
            v209 = v209;
            if (!v217) break;
            int v218 = v208 + v209;
            int v219 = 1;
            int v220 = v209 + v219;
            v208 = v218;
            v209 = v220;
          }
          bool v221 = true;
          v188 = v208;
          break;
        }
      }
      bool v222 = true;
      v166 = v188;
      break;
    }
  }
  bool v223 = true;
  int v224 = 64;
  int v225 = v224 + v78;
  bool v226 = true;
  int v227 = simt_wave_count_bits(v226);
  v76[v225] = v227;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 136; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
