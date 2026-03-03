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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
  int v6;
  v6 = v5;
  switch (v3) {
    case 0:
      {
      int v7 = 1;
      v6 = v7;
    }
    default:
      {
      int v8 = 2;
      int v9 = v3 % v8;
      int v10 = 4;
      int v11 = v0 + v10;
      int v12;
      v12 = v11;
      switch (v9) {
        case 0:
          {
          int v13 = 3;
          int v14 = v3 % v13;
          int v15 = 2;
          int v16 = v0 + v15;
          int v17;
          v17 = v16;
          switch (v14) {
            case 0:
              {
              int v18 = 2;
              int v19 = v0 + v18;
              v17 = v19;
              break;
            }
            default:
              {
              int v20 = 0;
              int v21 = v0 + v20;
              v17 = v21;
              break;
            }
            case 1:
              {
              int v22 = 0;
              int v23 = v0 + v22;
              v17 = v23;
              break;
            }
          }
          int v24 = 2;
          v12 = v17;
          break;
        }
        case 1:
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
            int v34 = 2;
            int v35 = v0 + v34;
            int v36 = 1;
            int v37 = v28 + v36;
            v27 = v35;
            v28 = v37;
          }
          int v38 = 4;
          v12 = v27;
          break;
        }
        default:
          {
          int v39 = 0;
          int v40 = 0;
          int v41;
          int v42;
          v41 = v39;
          v42 = v40;
          while (true) {
            int v43 = 4;
            int v44 = v3 % v43;
            int v45 = 1;
            int v46 = v44 + v45;
            bool v47 = v42 < v46;
            v41 = v41;
            v42 = v42;
            if (!v47) break;
            int v48 = 3;
            int v49 = v0 + v48;
            int v50 = 1;
            int v51 = v42 + v50;
            v41 = v49;
            v42 = v51;
          }
          int v52 = 2;
          v12 = v41;
          break;
        }
      }
      int v53 = 3;
      int v54 = v0 + v53;
      v6 = v12;
      break;
    }
  }
  bool v55 = true;
  int v56 = simt_wave_count_bits(v55);
  int v57 = 0;
  int v58 = v57 + v0;
  v1[v58] = v56;
  return;
}

kernel void kernel_main(device int* v59 [[buffer(0)]], device int* v60 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v61 = static_cast<int>(__simt_tid3.x);
  int v62 = 0;
  int v63 = v62 + v61;
  int v64 = v60[v63];
  int v65 = 4;
  int v66 = v65 + v61;
  int v67 = v60[v66];
  helper0(v61, v59, v64, v67, static_cast<int>(__simt_tid3.x));
  int v68 = 0;
  int v69 = 0;
  int v70;
  int v71;
  v70 = v68;
  v71 = v69;
  while (true) {
    int v72 = 4;
    int v73 = v71 * v72;
    int v74 = v73 + v61;
    int v75 = 8;
    int v76 = v75 + v74;
    int v77 = v60[v76];
    int v78 = 0;
    bool v79 = v77 != v78;
    v70 = v70;
    v71 = v71;
    if (!v79) break;
    int v80 = v70 + v71;
    int v81 = 1;
    int v82 = v71 + v81;
    v70 = v80;
    v71 = v82;
  }
  bool v83 = true;
  int v84 = 16;
  int v85 = v84 + v61;
  bool v86 = true;
  int v87 = simt_wave_count_bits(v86);
  v59[v85] = v87;
  int v88 = 28;
  int v89 = v88 + v61;
  int v90 = v60[v89];
  uint v91 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v92 = (int)(v91);
  int v93;
  v93 = v92;
  switch (v90) {
    case 0:
      {
      int v94 = 32;
      int v95 = v94 + v61;
      int v96 = v60[v95];
      int v97 = 2;
      int v98 = v61 + v97;
      int v99;
      v99 = v98;
      switch (v96) {
        case 0:
          {
          int v100 = 36;
          int v101 = v100 + v61;
          int v102 = v60[v101];
          int v103 = 1;
          int v104 = v61 + v103;
          int v105;
          v105 = v104;
          switch (v102) {
            default:
              {
              int v106 = 2;
              v105 = v106;
            }
            case 0:
              {
              int v107 = 1;
              int v108 = v61 + v107;
              v105 = v108;
              break;
            }
          }
          bool v109 = true;
          v99 = v105;
        }
        case 1:
          {
          int v110 = 0;
          int v111 = 0;
          int v112;
          int v113;
          v112 = v110;
          v113 = v111;
          while (true) {
            int v114 = 4;
            int v115 = v113 * v114;
            int v116 = v115 + v61;
            int v117 = 40;
            int v118 = v117 + v116;
            int v119 = v60[v118];
            int v120 = 0;
            bool v121 = v119 != v120;
            v112 = v112;
            v113 = v113;
            if (!v121) break;
            int v122 = v112 + v113;
            int v123 = 1;
            int v124 = v113 + v123;
            v112 = v122;
            v113 = v124;
          }
          bool v125 = true;
          v99 = v112;
          break;
        }
        default:
          {
          int v126 = 0;
          int v127 = 0;
          int v128;
          int v129;
          v128 = v126;
          v129 = v127;
          while (true) {
            int v130 = 4;
            int v131 = v129 * v130;
            int v132 = v131 + v61;
            int v133 = 60;
            int v134 = v133 + v132;
            int v135 = v60[v134];
            int v136 = 0;
            bool v137 = v135 != v136;
            v128 = v128;
            v129 = v129;
            if (!v137) break;
            int v138 = v128 + v129;
            int v139 = 1;
            int v140 = v129 + v139;
            v128 = v138;
            v129 = v140;
          }
          bool v141 = true;
          v99 = v128;
          break;
        }
      }
      bool v142 = true;
      v93 = v99;
    }
    default:
      {
      int v143 = 2;
      v93 = v143;
      break;
    }
    case 1:
      {
      int v144 = 80;
      int v145 = v144 + v61;
      int v146 = v60[v145];
      int v147 = 0;
      bool v148 = v146 != v147;
      int v149;
      if (v148) {
        int v150 = 84;
        int v151 = v150 + v61;
        int v152 = v60[v151];
        int v153;
        v153 = v61;
        switch (v152) {
          case 0:
            {
            int v154 = 1;
            int v155 = v61 + v154;
            v153 = v155;
          }
          default:
            {
            int v156 = 4;
            int v157 = v61 + v156;
            v153 = v157;
            break;
          }
          case 1:
            {
            v153 = v61;
          }
          case 2:
            {
            v153 = v61;
            break;
          }
        }
        bool v158 = true;
        v149 = v153;
      } else {
        int v159 = 88;
        int v160 = v159 + v61;
        int v161 = v60[v160];
        int v162;
        v162 = v61;
        switch (v161) {
          case 0:
            {
            v162 = v61;
            break;
          }
          default:
            {
            int v163 = 1;
            int v164 = v61 + v163;
            v162 = v164;
            break;
          }
          case 1:
            {
            v162 = v61;
            break;
          }
          case 2:
            {
            int v165 = 0;
            int v166 = v61 + v165;
            v162 = v166;
            break;
          }
        }
        bool v167 = true;
        v149 = v162;
      }
      v93 = v149;
      break;
    }
  }
  bool v168 = true;
  int v169 = 32;
  int v170 = v169 + v61;
  bool v171 = true;
  int v172 = simt_wave_count_bits(v171);
  v59[v170] = v172;
  int v173 = 92;
  int v174 = v173 + v61;
  int v175 = v60[v174];
  int v176 = 3;
  int v177;
  v177 = v176;
  switch (v175) {
    default:
      {
      int v178 = 0;
      int v179 = 0;
      int v180;
      int v181;
      v180 = v178;
      v181 = v179;
      while (true) {
        int v182 = 4;
        int v183 = v181 * v182;
        int v184 = v183 + v61;
        int v185 = 96;
        int v186 = v185 + v184;
        int v187 = v60[v186];
        int v188 = 0;
        bool v189 = v187 != v188;
        v180 = v180;
        v181 = v181;
        if (!v189) break;
        int v190 = 116;
        int v191 = v190 + v61;
        int v192 = v60[v191];
        int v193 = 4;
        int v194 = v61 + v193;
        int v195;
        v195 = v194;
        switch (v192) {
          default:
            {
            int v196 = 4;
            v195 = v196;
          }
          case 0:
            {
            int v197 = 2;
            v195 = v197;
            break;
          }
          case 1:
            {
            int v198 = 0;
            v195 = v198;
            break;
          }
        }
        bool v199 = true;
        int v200 = v180 + v195;
        int v201 = 1;
        int v202 = v181 + v201;
        v180 = v200;
        v181 = v202;
      }
      bool v203 = true;
      v177 = v180;
      break;
    }
    case 0:
      {
      int v204 = 0;
      int v205 = v61 + v204;
      v177 = v205;
      break;
    }
  }
  bool v206 = true;
  int v207 = 48;
  int v208 = v207 + v61;
  bool v209 = true;
  int v210 = simt_wave_count_bits(v209);
  v59[v208] = v210;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
