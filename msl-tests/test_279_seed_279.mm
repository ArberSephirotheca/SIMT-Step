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
  int v5 = v0 + v4;
  int v6 = 4;
  int v7 = v3 % v6;
  int v8 = 2;
  int v9 = v0 + v8;
  int v10;
  v10 = v9;
  switch (v7) {
    default:
      {
      int v11 = 0;
      int v12 = 0;
      int v13;
      int v14;
      v13 = v11;
      v14 = v12;
      while (true) {
        int v15 = 4;
        int v16 = v3 % v15;
        int v17 = 1;
        int v18 = v16 + v17;
        bool v19 = v14 < v18;
        v13 = v13;
        v14 = v14;
        if (!v19) break;
        int v20 = 1;
        int v21 = v0 + v20;
        int v22 = 1;
        int v23 = v14 + v22;
        v13 = v21;
        v14 = v23;
      }
      int v24 = 3;
      v10 = v13;
      break;
    }
    case 0:
      {
      int v25 = 0;
      int v26 = 0;
      int v27;
      int v28;
      v27 = v25;
      v28 = v26;
      while (true) {
        int v29 = 4;
        int v30 = v3 % v29;
        int v31 = 1;
        int v32 = v30 + v31;
        bool v33 = v28 < v32;
        v27 = v27;
        v28 = v28;
        if (!v33) break;
        int v34 = 1;
        int v35 = 1;
        int v36 = v28 + v35;
        v27 = v34;
        v28 = v36;
      }
      int v37 = 4;
      v10 = v27;
    }
    case 1:
      {
      int v38 = 2;
      int v39 = v3 % v38;
      int v40;
      v40 = v0;
      switch (v39) {
        default:
          {
          int v41 = 2;
          int v42 = v3 % v41;
          int v43 = 4;
          int v44 = v0 + v43;
          int v45;
          v45 = v44;
          switch (v42) {
            default:
              {
              int v46 = 1;
              int v47 = v0 + v46;
              v45 = v47;
              break;
            }
            case 0:
              {
              v45 = v0;
              break;
            }
          }
          int v48 = 1;
          v40 = v45;
          break;
        }
        case 0:
          {
          int v49 = 0;
          int v50 = 0;
          int v51;
          int v52;
          v51 = v49;
          v52 = v50;
          while (true) {
            int v53 = 4;
            int v54 = v3 % v53;
            int v55 = 1;
            int v56 = v54 + v55;
            bool v57 = v52 < v56;
            v51 = v51;
            v52 = v52;
            if (!v57) break;
            int v58 = 3;
            int v59 = v0 + v58;
            int v60 = 1;
            int v61 = v52 + v60;
            v51 = v59;
            v52 = v61;
          }
          int v62 = 0;
          int v63 = v0 + v62;
          v40 = v51;
          break;
        }
      }
      v10 = v40;
    }
    case 2:
      {
      int v64 = 0;
      int v65 = 0;
      int v66;
      int v67;
      v66 = v64;
      v67 = v65;
      while (true) {
        int v68 = 4;
        int v69 = v3 % v68;
        int v70 = 1;
        int v71 = v69 + v70;
        bool v72 = v67 < v71;
        v66 = v66;
        v67 = v67;
        if (!v72) break;
        int v73 = 0;
        bool v74 = v2 != v73;
        int v75;
        if (v74) {
          int v76 = 1;
          v75 = v76;
        } else {
          v75 = v0;
        }
        int v77 = 1;
        int v78 = 1;
        int v79 = v67 + v78;
        v66 = v75;
        v67 = v79;
        continue;
        ;
      }
      int v80 = 0;
      v10 = v66;
      break;
    }
  }
  bool v81 = true;
  int v82 = simt_wave_count_bits(v81);
  int v83 = 0;
  int v84 = v83 + v0;
  v1[v84] = v82;
  int v85 = 0;
  bool v86 = v2 != v85;
  int v87 = v86 ? v5 : v10;
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
  int v97 = 0;
  int v98 = 0;
  int v99;
  int v100;
  v99 = v97;
  v100 = v98;
  while (true) {
    int v101 = 4;
    int v102 = v100 * v101;
    int v103 = v102 + v90;
    int v104 = 8;
    int v105 = v104 + v103;
    int v106 = v89[v105];
    int v107 = 0;
    bool v108 = v106 != v107;
    v99 = v99;
    v100 = v100;
    if (!v108) break;
    int v109 = 28;
    int v110 = v109 + v90;
    int v111 = v89[v110];
    uint v112 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v113 = (int)(v112);
    int v114;
    v114 = v113;
    switch (v111) {
      case 0:
        {
        int v115 = 3;
        v114 = v115;
      }
      case 1:
        {
        v114 = v90;
        break;
      }
      case 2:
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
          int v122 = v121 + v90;
          int v123 = 32;
          int v124 = v123 + v122;
          int v125 = v89[v124];
          int v126 = 0;
          bool v127 = v125 != v126;
          v118 = v118;
          v119 = v119;
          if (!v127) break;
          int v128 = v118 + v119;
          int v129 = 1;
          int v130 = v119 + v129;
          v118 = v128;
          v119 = v130;
        }
        bool v131 = true;
        v114 = v118;
        break;
      }
      default:
        {
        int v132 = 1;
        v114 = v132;
        break;
      }
    }
    bool v133 = true;
    int v134 = v99 + v114;
    int v135 = 1;
    int v136 = v100 + v135;
    v99 = v134;
    v100 = v136;
    break;
    ;
  }
  bool v137 = true;
  int v138 = 16;
  int v139 = v138 + v90;
  bool v140 = true;
  int v141 = simt_wave_count_bits(v140);
  v88[v139] = v141;
  uint v142 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v143 = (int)(v142);
  int v144 = 52;
  int v145 = v144 + v90;
  int v146 = v89[v145];
  int v147;
  v147 = v90;
  switch (v146) {
    case 0:
      {
      int v148 = 0;
      int v149 = 0;
      int v150;
      int v151;
      v150 = v148;
      v151 = v149;
      while (true) {
        int v152 = 4;
        int v153 = v151 * v152;
        int v154 = v153 + v90;
        int v155 = 56;
        int v156 = v155 + v154;
        int v157 = v89[v156];
        int v158 = 0;
        bool v159 = v157 != v158;
        v150 = v150;
        v151 = v151;
        if (!v159) break;
        int v160 = v150 + v151;
        int v161 = 1;
        int v162 = v151 + v161;
        v150 = v160;
        v151 = v162;
      }
      bool v163 = true;
      v147 = v150;
      break;
    }
    case 1:
      {
      int v164 = 76;
      int v165 = v164 + v90;
      int v166 = v89[v165];
      int v167;
      v167 = v90;
      switch (v166) {
        default:
          {
          int v168 = 80;
          int v169 = v168 + v90;
          int v170 = v89[v169];
          int v171 = 0;
          bool v172 = v170 != v171;
          int v173;
          if (v172) {
            int v174 = 2;
            v173 = v174;
          } else {
            int v175 = 0;
            int v176 = v90 + v175;
            v173 = v176;
          }
          v167 = v173;
          break;
        }
        case 0:
          {
          int v177 = 0;
          int v178 = 0;
          int v179;
          int v180;
          v179 = v177;
          v180 = v178;
          while (true) {
            int v181 = 4;
            int v182 = v180 * v181;
            int v183 = v182 + v90;
            int v184 = 84;
            int v185 = v184 + v183;
            int v186 = v89[v185];
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
          v167 = v179;
          break;
        }
      }
      bool v193 = true;
      v147 = v167;
      break;
    }
    default:
      {
      int v194 = 0;
      int v195 = 0;
      int v196;
      int v197;
      v196 = v194;
      v197 = v195;
      while (true) {
        int v198 = 4;
        int v199 = v197 * v198;
        int v200 = v199 + v90;
        int v201 = 104;
        int v202 = v201 + v200;
        int v203 = v89[v202];
        int v204 = 0;
        bool v205 = v203 != v204;
        v196 = v196;
        v197 = v197;
        if (!v205) break;
        int v206 = v196 + v197;
        int v207 = 1;
        int v208 = v197 + v207;
        v196 = v206;
        v197 = v208;
      }
      bool v209 = true;
      v147 = v196;
      break;
    }
  }
  bool v210 = true;
  int v211 = 32;
  int v212 = v211 + v90;
  bool v213 = true;
  int v214 = simt_wave_count_bits(v213);
  v88[v212] = v214;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 124; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
