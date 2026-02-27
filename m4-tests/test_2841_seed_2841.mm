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
    bool v7 = true;
    int v8 = simt_wave_count_bits(v7);
    int v9 = 0;
    int v10 = v9 + v0;
    v1[v10] = v8;
    v6 = v8;
  } else {
    int v11 = 2;
    int v12 = v3 % v11;
    uint v13 = simt_lane_id(__simt_tid);
    int v14 = (int)(v13);
    int v15;
    v15 = v14;
    switch (v12) {
      default:
        {
        int v16 = 1;
        v15 = v16;
        break;
      }
      case 0:
        {
        int v17 = 3;
        int v18 = v3 % v17;
        int v19 = 3;
        int v20 = v0 + v19;
        int v21;
        v21 = v20;
        switch (v18) {
          case 0:
            {
            v21 = v0;
            break;
          }
          default:
            {
            int v22 = 3;
            int v23 = v0 + v22;
            v21 = v23;
            break;
          }
          case 1:
            {
            int v24 = 2;
            v21 = v24;
            break;
          }
        }
        v15 = v21;
        break;
      }
    }
    v6 = v15;
  }
  return;
}

kernel void kernel_main(device int* v25 [[buffer(0)]], device int* v26 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v27 = static_cast<int>(__simt_tid3.x);
  int v28 = 0;
  int v29 = v28 + v27;
  int v30 = v26[v29];
  int v31 = 4;
  int v32 = v31 + v27;
  int v33 = v26[v32];
  helper0(v27, v25, v30, v33, static_cast<int>(__simt_tid3.x));
  int v34 = 8;
  int v35 = v34 + v27;
  int v36 = v26[v35];
  int v37 = 0;
  bool v38 = v36 != v37;
  int v39;
  if (v38) {
    int v40 = 0;
    int v41 = 0;
    int v42;
    int v43;
    v42 = v40;
    v43 = v41;
    while (true) {
      int v44 = 4;
      int v45 = v43 * v44;
      int v46 = v45 + v27;
      int v47 = 12;
      int v48 = v47 + v46;
      int v49 = v26[v48];
      int v50 = 0;
      bool v51 = v49 != v50;
      v42 = v42;
      v43 = v43;
      if (!v51) break;
      int v52 = v42 + v43;
      int v53 = 1;
      int v54 = v43 + v53;
      bool v55 = true;
      int v56 = 16;
      int v57 = 4;
      int v58 = v43 * v57;
      int v59 = v56 + v58;
      int v60 = v59 + v27;
      bool v61 = true;
      int v62 = simt_wave_count_bits(v61);
      v25[v60] = v62;
      v42 = v52;
      v43 = v54;
    }
    v39 = v42;
  } else {
    int v63 = 32;
    int v64 = v63 + v27;
    int v65 = v26[v64];
    int v66 = 4;
    int v67;
    v67 = v66;
    switch (v65) {
      case 0:
        {
        int v68 = 0;
        int v69 = 0;
        int v70;
        int v71;
        v70 = v68;
        v71 = v69;
        while (true) {
          int v72 = 4;
          int v73 = v71 * v72;
          int v74 = v73 + v27;
          int v75 = 36;
          int v76 = v75 + v74;
          int v77 = v26[v76];
          int v78 = 0;
          bool v79 = v77 != v78;
          v70 = v70;
          v71 = v71;
          if (!v79) break;
          int v80 = v70 + v71;
          int v81 = 1;
          int v82 = v71 + v81;
          bool v83 = true;
          v70 = v80;
          v71 = v82;
        }
        v67 = v70;
        break;
      }
      case 1:
        {
        int v84 = 0;
        int v85 = 0;
        int v86;
        int v87;
        v86 = v84;
        v87 = v85;
        while (true) {
          int v88 = 4;
          int v89 = v87 * v88;
          int v90 = v89 + v27;
          int v91 = 56;
          int v92 = v91 + v90;
          int v93 = v26[v92];
          int v94 = 0;
          bool v95 = v93 != v94;
          v86 = v86;
          v87 = v87;
          if (!v95) break;
          int v96 = v86 + v87;
          int v97 = 1;
          int v98 = v87 + v97;
          bool v99 = true;
          v86 = v96;
          v87 = v98;
        }
        v67 = v86;
        break;
      }
      case 2:
        {
        int v100 = 0;
        int v101 = 0;
        int v102;
        int v103;
        v102 = v100;
        v103 = v101;
        while (true) {
          int v104 = 4;
          int v105 = v103 * v104;
          int v106 = v105 + v27;
          int v107 = 76;
          int v108 = v107 + v106;
          int v109 = v26[v108];
          int v110 = 0;
          bool v111 = v109 != v110;
          v102 = v102;
          v103 = v103;
          if (!v111) break;
          int v112 = v102 + v103;
          int v113 = 1;
          int v114 = v103 + v113;
          bool v115 = true;
          v102 = v112;
          v103 = v114;
          break;
          ;
        }
        v67 = v102;
        break;
      }
      default:
        {
        int v116 = 0;
        int v117 = 0;
        int v118;
        int v119;
        v118 = v116;
        v119 = v117;
        while (true) {
          int v120 = 4;
          int v121 = v119 * v120;
          int v122 = v121 + v27;
          int v123 = 96;
          int v124 = v123 + v122;
          int v125 = v26[v124];
          int v126 = 0;
          bool v127 = v125 != v126;
          v118 = v118;
          v119 = v119;
          if (!v127) break;
          int v128 = v118 + v119;
          int v129 = 1;
          int v130 = v119 + v129;
          bool v131 = true;
          v118 = v128;
          v119 = v130;
          continue;
          ;
        }
        v67 = v118;
        break;
      }
    }
    v39 = v67;
  }
  int v132 = 32;
  int v133 = v132 + v27;
  bool v134 = true;
  int v135 = simt_wave_count_bits(v134);
  v25[v133] = v135;
  int v136 = 116;
  int v137 = v136 + v27;
  int v138 = v26[v137];
  uint v139 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v140 = (int)(v139);
  int v141;
  v141 = v140;
  switch (v138) {
    case 0:
      {
      int v142 = 0;
      int v143 = 0;
      int v144;
      int v145;
      v144 = v142;
      v145 = v143;
      while (true) {
        int v146 = 4;
        int v147 = v145 * v146;
        int v148 = v147 + v27;
        int v149 = 120;
        int v150 = v149 + v148;
        int v151 = v26[v150];
        int v152 = 0;
        bool v153 = v151 != v152;
        v144 = v144;
        v145 = v145;
        if (!v153) break;
        int v154 = v144 + v145;
        int v155 = 1;
        int v156 = v145 + v155;
        bool v157 = true;
        v144 = v154;
        v145 = v156;
      }
      v141 = v144;
    }
    case 1:
      {
      int v158 = 140;
      int v159 = v158 + v27;
      int v160 = v26[v159];
      int v161 = 0;
      int v162 = v27 + v161;
      int v163;
      v163 = v162;
      switch (v160) {
        case 0:
          {
          int v164 = 144;
          int v165 = v164 + v27;
          int v166 = v26[v165];
          int v167;
          v167 = v27;
          switch (v166) {
            default:
              {
              v167 = v27;
              break;
            }
            case 0:
              {
              int v168 = 1;
              v167 = v168;
              break;
            }
          }
          v163 = v167;
          break;
        }
        default:
          {
          v163 = v27;
          break;
        }
        case 1:
          {
          v163 = v27;
          break;
        }
        case 2:
          {
          int v169 = 1;
          int v170 = v27 + v169;
          v163 = v170;
          break;
        }
      }
      v141 = v163;
      break;
    }
    default:
      {
      int v171 = 148;
      int v172 = v171 + v27;
      int v173 = v26[v172];
      int v174;
      v174 = v27;
      switch (v173) {
        case 0:
          {
          int v175 = 3;
          int v176 = v27 + v175;
          v174 = v176;
          break;
        }
        default:
          {
          int v177 = 152;
          int v178 = v177 + v27;
          int v179 = v26[v178];
          int v180 = 0;
          bool v181 = v179 != v180;
          int v182;
          if (v181) {
            int v183 = 0;
            int v184 = v27 + v183;
            v182 = v184;
          } else {
            v182 = v27;
          }
          v174 = v182;
          break;
        }
        case 1:
          {
          int v185 = 156;
          int v186 = v185 + v27;
          int v187 = v26[v186];
          int v188 = 0;
          bool v189 = v187 != v188;
          int v190;
          if (v189) {
            int v191 = 0;
            int v192 = v27 + v191;
            v190 = v192;
          } else {
            v190 = v27;
          }
          v174 = v190;
          break;
        }
        case 2:
          {
          int v193 = 160;
          int v194 = v193 + v27;
          int v195 = v26[v194];
          int v196 = 0;
          bool v197 = v195 != v196;
          int v198;
          if (v197) {
            int v199 = 1;
            int v200 = v27 + v199;
            v198 = v200;
          } else {
            int v201 = 4;
            int v202 = v27 + v201;
            v198 = v202;
          }
          v174 = v198;
          break;
        }
      }
      v141 = v174;
      break;
    }
    case 2:
      {
      int v203 = 164;
      int v204 = v203 + v27;
      int v205 = v26[v204];
      int v206 = 0;
      bool v207 = v205 != v206;
      int v208;
      if (v207) {
        v208 = v27;
      } else {
        int v209 = 168;
        int v210 = v209 + v27;
        int v211 = v26[v210];
        int v212;
        v212 = v27;
        switch (v211) {
          case 0:
            {
            v212 = v27;
          }
          default:
            {
            v212 = v27;
          }
          case 1:
            {
            v212 = v27;
            break;
          }
        }
        v208 = v212;
      }
      v141 = v208;
      break;
    }
  }
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 172; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
