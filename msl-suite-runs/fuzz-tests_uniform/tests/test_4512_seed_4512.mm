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
    v6 = v0;
  } else {
    uint v7 = simt_lane_id(__simt_tid);
    int v8 = (int)(v7);
    v6 = v8;
  }
  bool v9 = true;
  int v10 = simt_wave_count_bits(v9);
  int v11 = 0;
  int v12 = v11 + v0;
  v1[v12] = v10;
  int v13 = 0;
  bool v14 = v2 != v13;
  int v15 = v14 ? v0 : v6;
  int v16 = 0;
  bool v17 = v2 != v16;
  int v18;
  if (v17) {
    int v19 = 2;
    int v20 = v0 + v19;
    v18 = v20;
  } else {
    int v21 = 2;
    int v22 = v3 % v21;
    uint v23 = simt_subgroup_id(__simt_tid);
    int v24 = (int)(v23);
    int v25;
    v25 = v24;
    switch (v22) {
      case 0:
        {
        int v26 = 4;
        int v27 = v0 + v26;
        v25 = v27;
      }
      case 1:
        {
        int v28 = 3;
        int v29 = v3 % v28;
        int v30 = 4;
        int v31;
        v31 = v30;
        switch (v29) {
          case 0:
            {
            int v32 = 3;
            int v33 = v0 + v32;
            v31 = v33;
            break;
          }
          default:
            {
            int v34 = 3;
            v31 = v34;
            break;
          }
          case 1:
            {
            int v35 = 0;
            v31 = v35;
            break;
          }
        }
        int v36 = 0;
        int v37 = v0 + v36;
        v25 = v31;
        break;
      }
      default:
        {
        int v38 = 2;
        int v39 = v3 % v38;
        int v40 = 4;
        int v41 = v0 + v40;
        int v42;
        v42 = v41;
        switch (v39) {
          case 0:
            {
            int v43 = 2;
            v42 = v43;
            break;
          }
          default:
            {
            v42 = v0;
            break;
          }
        }
        int v44 = 0;
        v25 = v42;
        break;
      }
    }
    int v45 = 2;
    int v46 = v0 + v45;
    v18 = v25;
  }
  bool v47 = true;
  int v48 = simt_wave_count_bits(v47);
  int v49 = 16;
  int v50 = v49 + v0;
  v1[v50] = v48;
  int v51 = 0;
  bool v52 = v2 != v51;
  int v53 = v52 ? v15 : v18;
  return;
}

kernel void kernel_main(device int* v54 [[buffer(0)]], device int* v55 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v56 = static_cast<int>(__simt_tid3.x);
  int v57 = 0;
  int v58 = v57 + v56;
  int v59 = v55[v58];
  int v60 = 4;
  int v61 = v60 + v56;
  int v62 = v55[v61];
  helper0(v56, v54, v59, v62, static_cast<int>(__simt_tid3.x));
  uint v63 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v64 = (int)(v63);
  int v65 = 0;
  int v66 = 0;
  int v67;
  int v68;
  v67 = v65;
  v68 = v66;
  while (true) {
    int v69 = 4;
    int v70 = v68 * v69;
    int v71 = v70 + v56;
    int v72 = 8;
    int v73 = v72 + v71;
    int v74 = v55[v73];
    int v75 = 0;
    bool v76 = v74 != v75;
    v67 = v67;
    v68 = v68;
    if (!v76) break;
    int v77 = v67 + v68;
    int v78 = 1;
    int v79 = v68 + v78;
    v67 = v77;
    v68 = v79;
    break;
    ;
  }
  bool v80 = true;
  int v81 = 32;
  int v82 = v81 + v56;
  bool v83 = true;
  int v84 = simt_wave_count_bits(v83);
  v54[v82] = v84;
  int v85 = 28;
  int v86 = v85 + v56;
  int v87 = v55[v86];
  int v88 = 4;
  int v89;
  v89 = v88;
  switch (v87) {
    default:
      {
      int v90 = 32;
      int v91 = v90 + v56;
      int v92 = v55[v91];
      int v93 = 3;
      int v94;
      v94 = v93;
      switch (v92) {
        case 0:
          {
          int v95 = 3;
          v94 = v95;
          break;
        }
        case 1:
          {
          int v96 = 36;
          int v97 = v96 + v56;
          int v98 = v55[v97];
          int v99 = 0;
          bool v100 = v98 != v99;
          int v101;
          if (v100) {
            int v102 = 0;
            int v103 = v56 + v102;
            v101 = v103;
          } else {
            v101 = v56;
          }
          v94 = v101;
        }
        case 2:
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
            int v110 = v109 + v56;
            int v111 = 40;
            int v112 = v111 + v110;
            int v113 = v55[v112];
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
          v94 = v106;
          break;
        }
        default:
          {
          int v120 = 0;
          int v121 = 0;
          int v122;
          int v123;
          v122 = v120;
          v123 = v121;
          while (true) {
            int v124 = 4;
            int v125 = v123 * v124;
            int v126 = v125 + v56;
            int v127 = 60;
            int v128 = v127 + v126;
            int v129 = v55[v128];
            int v130 = 0;
            bool v131 = v129 != v130;
            v122 = v122;
            v123 = v123;
            if (!v131) break;
            int v132 = v122 + v123;
            int v133 = 1;
            int v134 = v123 + v133;
            v122 = v132;
            v123 = v134;
          }
          bool v135 = true;
          v94 = v122;
          break;
        }
      }
      bool v136 = true;
      v89 = v94;
    }
    case 0:
      {
      int v137 = 80;
      int v138 = v137 + v56;
      int v139 = v55[v138];
      int v140 = 1;
      int v141;
      v141 = v140;
      switch (v139) {
        case 0:
          {
          int v142 = 84;
          int v143 = v142 + v56;
          int v144 = v55[v143];
          int v145 = 3;
          int v146;
          v146 = v145;
          switch (v144) {
            case 0:
              {
              int v147 = 3;
              int v148 = v56 + v147;
              v146 = v148;
            }
            case 1:
              {
              int v149 = 0;
              v146 = v149;
              break;
            }
            default:
              {
              int v150 = 4;
              v146 = v150;
              break;
            }
          }
          bool v151 = true;
          v141 = v146;
        }
        case 1:
          {
          int v152 = 2;
          int v153 = v56 + v152;
          v141 = v153;
        }
        case 2:
          {
          int v154 = 1;
          v141 = v154;
        }
        default:
          {
          int v155 = 88;
          int v156 = v155 + v56;
          int v157 = v55[v156];
          int v158 = 3;
          int v159;
          v159 = v158;
          switch (v157) {
            default:
              {
              v159 = v56;
              break;
            }
            case 0:
              {
              int v160 = 4;
              int v161 = v56 + v160;
              v159 = v161;
              break;
            }
          }
          bool v162 = true;
          v141 = v159;
          break;
        }
      }
      bool v163 = true;
      v89 = v141;
      break;
    }
    case 1:
      {
      int v164 = 0;
      v89 = v164;
    }
    case 2:
      {
      int v165 = 0;
      int v166 = 0;
      int v167;
      int v168;
      v167 = v165;
      v168 = v166;
      while (true) {
        int v169 = 4;
        int v170 = v168 * v169;
        int v171 = v170 + v56;
        int v172 = 92;
        int v173 = v172 + v171;
        int v174 = v55[v173];
        int v175 = 0;
        bool v176 = v174 != v175;
        v167 = v167;
        v168 = v168;
        if (!v176) break;
        int v177 = 0;
        int v178 = 0;
        int v179;
        int v180;
        v179 = v177;
        v180 = v178;
        while (true) {
          int v181 = 4;
          int v182 = v180 * v181;
          int v183 = v182 + v56;
          int v184 = 112;
          int v185 = v184 + v183;
          int v186 = v55[v185];
          int v187 = 0;
          bool v188 = v186 != v187;
          v179 = v179;
          v180 = v180;
          if (!v188) break;
          int v189 = v179 + v180;
          int v190 = 1;
          int v191 = v180 + v190;
          v179 = v189;
          v180 = v191;
        }
        bool v192 = true;
        int v193 = v167 + v179;
        int v194 = 1;
        int v195 = v168 + v194;
        v167 = v193;
        v168 = v195;
      }
      bool v196 = true;
      v89 = v167;
      break;
    }
  }
  bool v197 = true;
  int v198 = 48;
  int v199 = v198 + v56;
  bool v200 = true;
  int v201 = simt_wave_count_bits(v200);
  v54[v199] = v201;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 132; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
