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
  int v8 = 3;
  int v9 = v3 % v8;
  uint v10 = simt_lane_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    case 0:
      {
      int v13 = 2;
      v12 = v13;
    }
    case 1:
      {
      int v14 = 0;
      int v15 = v0 + v14;
      v12 = v15;
      break;
    }
    default:
      {
      int v16 = 2;
      int v17 = v3 % v16;
      int v18 = 0;
      int v19 = v0 + v18;
      int v20;
      v20 = v19;
      switch (v17) {
        default:
          {
          int v21 = 0;
          int v22 = v0 + v21;
          v20 = v22;
        }
        case 0:
          {
          int v23 = 0;
          int v24 = 0;
          int v25;
          int v26;
          v25 = v23;
          v26 = v24;
          while (true) {
            int v27 = 4;
            int v28 = v3 % v27;
            int v29 = 1;
            int v30 = v28 + v29;
            bool v31 = v26 < v30;
            v25 = v25;
            v26 = v26;
            if (!v31) break;
            int v32 = 4;
            int v33 = 1;
            int v34 = v26 + v33;
            v25 = v32;
            v26 = v34;
          }
          v20 = v25;
        }
        case 1:
          {
          int v35 = 3;
          int v36 = v3 % v35;
          int v37;
          v37 = v0;
          switch (v36) {
            default:
              {
              int v38 = 0;
              v37 = v38;
              break;
            }
            case 0:
              {
              v37 = v0;
              break;
            }
            case 1:
              {
              int v39 = 2;
              v37 = v39;
              break;
            }
            case 2:
              {
              v37 = v0;
              break;
            }
          }
          v20 = v37;
          break;
        }
      }
      v12 = v20;
    }
    case 2:
      {
      int v40 = 0;
      bool v41 = v2 != v40;
      int v42;
      if (v41) {
        int v43 = 0;
        int v44;
        v44 = v43;
        switch (v3) {
          default:
            {
            int v45 = 2;
            int v46 = v0 + v45;
            v44 = v46;
            break;
          }
          case 0:
            {
            int v47 = 3;
            v44 = v47;
            break;
          }
        }
        v42 = v44;
      } else {
        int v48 = 3;
        int v49 = v3 % v48;
        int v50;
        v50 = v0;
        switch (v49) {
          case 0:
            {
            int v51 = 4;
            v50 = v51;
            break;
          }
          case 1:
            {
            int v52 = 4;
            int v53 = v0 + v52;
            v50 = v53;
            break;
          }
          default:
            {
            int v54 = 1;
            v50 = v54;
            break;
          }
        }
        int v55 = 1;
        v42 = v50;
      }
      v12 = v42;
      break;
    }
  }
  bool v56 = true;
  int v57 = simt_wave_count_bits(v56);
  int v58 = 16;
  int v59 = v58 + v0;
  v1[v59] = v57;
  int v60 = 0;
  bool v61 = v2 != v60;
  int v62 = v61 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v63 [[buffer(0)]], device int* v64 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v65 = static_cast<int>(__simt_tid3.x);
  int v66 = 0;
  int v67 = v66 + v65;
  int v68 = v64[v67];
  int v69 = 4;
  int v70 = v69 + v65;
  int v71 = v64[v70];
  helper0(v65, v63, v68, v71, static_cast<int>(__simt_tid3.x));
  int v72 = 0;
  int v73 = 0;
  int v74;
  int v75;
  v74 = v72;
  v75 = v73;
  while (true) {
    int v76 = 4;
    int v77 = v75 * v76;
    int v78 = v77 + v65;
    int v79 = 8;
    int v80 = v79 + v78;
    int v81 = v64[v80];
    int v82 = 0;
    bool v83 = v81 != v82;
    v74 = v74;
    v75 = v75;
    if (!v83) break;
    int v84 = v74 + v75;
    int v85 = 1;
    int v86 = v75 + v85;
    bool v87 = true;
    int v88 = 32;
    int v89 = 4;
    int v90 = v75 * v89;
    int v91 = v88 + v90;
    int v92 = v91 + v65;
    bool v93 = true;
    int v94 = simt_wave_count_bits(v93);
    v63[v92] = v94;
    v74 = v84;
    v75 = v86;
    break;
    ;
  }
  int v95 = 4;
  uint v96 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v97 = (int)(v96);
  int v98 = 0;
  int v99 = 0;
  int v100;
  int v101;
  v100 = v98;
  v101 = v99;
  while (true) {
    int v102 = 4;
    int v103 = v101 * v102;
    int v104 = v103 + v65;
    int v105 = 28;
    int v106 = v105 + v104;
    int v107 = v64[v106];
    int v108 = 0;
    bool v109 = v107 != v108;
    v100 = v100;
    v101 = v101;
    if (!v109) break;
    int v110 = v100 + v101;
    int v111 = 1;
    int v112 = v101 + v111;
    bool v113 = true;
    int v114 = 48;
    int v115 = 4;
    int v116 = v101 * v115;
    int v117 = v114 + v116;
    int v118 = v117 + v65;
    bool v119 = true;
    int v120 = simt_wave_count_bits(v119);
    v63[v118] = v120;
    v100 = v110;
    v101 = v112;
    continue;
    ;
  }
  int v121 = 48;
  int v122 = v121 + v65;
  int v123 = v64[v122];
  uint v124 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v125 = (int)(v124);
  int v126;
  v126 = v125;
  switch (v123) {
    case 0:
      {
      int v127 = 52;
      int v128 = v127 + v65;
      int v129 = v64[v128];
      int v130;
      v130 = v65;
      switch (v129) {
        case 0:
          {
          v130 = v65;
          break;
        }
        default:
          {
          int v131 = 1;
          int v132 = v65 + v131;
          v130 = v132;
          break;
        }
      }
      v126 = v130;
      break;
    }
    default:
      {
      int v133 = 56;
      int v134 = v133 + v65;
      int v135 = v64[v134];
      int v136 = 0;
      bool v137 = v135 != v136;
      int v138;
      if (v137) {
        int v139 = 60;
        int v140 = v139 + v65;
        int v141 = v64[v140];
        int v142 = 2;
        int v143 = v65 + v142;
        int v144;
        v144 = v143;
        switch (v141) {
          case 0:
            {
            v144 = v65;
            break;
          }
          default:
            {
            int v145 = 0;
            v144 = v145;
          }
          case 1:
            {
            v144 = v65;
            break;
          }
        }
        bool v146 = true;
        v138 = v144;
      } else {
        v138 = v65;
      }
      v126 = v138;
      break;
    }
    case 1:
      {
      int v147 = 64;
      int v148 = v147 + v65;
      int v149 = v64[v148];
      int v150 = 2;
      int v151 = v65 + v150;
      int v152;
      v152 = v151;
      switch (v149) {
        default:
          {
          int v153 = 0;
          int v154 = 0;
          int v155;
          int v156;
          v155 = v153;
          v156 = v154;
          while (true) {
            int v157 = 4;
            int v158 = v156 * v157;
            int v159 = v158 + v65;
            int v160 = 68;
            int v161 = v160 + v159;
            int v162 = v64[v161];
            int v163 = 0;
            bool v164 = v162 != v163;
            v155 = v155;
            v156 = v156;
            if (!v164) break;
            int v165 = v155 + v156;
            int v166 = 1;
            int v167 = v156 + v166;
            bool v168 = true;
            v155 = v165;
            v156 = v167;
            continue;
            ;
          }
          v152 = v155;
          break;
        }
        case 0:
          {
          int v169 = 88;
          int v170 = v169 + v65;
          int v171 = v64[v170];
          int v172 = 0;
          int v173;
          v173 = v172;
          switch (v171) {
            case 0:
              {
              int v174 = 3;
              int v175 = v65 + v174;
              v173 = v175;
              break;
            }
            default:
              {
              v173 = v65;
              break;
            }
            case 1:
              {
              int v176 = 4;
              int v177 = v65 + v176;
              v173 = v177;
              break;
            }
          }
          bool v178 = true;
          v152 = v173;
          break;
        }
        case 1:
          {
          int v179 = 2;
          int v180 = v65 + v179;
          v152 = v180;
          break;
        }
        case 2:
          {
          int v181 = 0;
          int v182 = 0;
          int v183;
          int v184;
          v183 = v181;
          v184 = v182;
          while (true) {
            int v185 = 4;
            int v186 = v184 * v185;
            int v187 = v186 + v65;
            int v188 = 92;
            int v189 = v188 + v187;
            int v190 = v64[v189];
            int v191 = 0;
            bool v192 = v190 != v191;
            v183 = v183;
            v184 = v184;
            if (!v192) break;
            int v193 = v183 + v184;
            int v194 = 1;
            int v195 = v184 + v194;
            bool v196 = true;
            v183 = v193;
            v184 = v195;
            break;
            ;
          }
          v152 = v183;
          break;
        }
      }
      v126 = v152;
      break;
    }
    case 2:
      {
      int v197 = 112;
      int v198 = v197 + v65;
      int v199 = v64[v198];
      int v200 = 0;
      bool v201 = v199 != v200;
      int v202;
      if (v201) {
        int v203 = 116;
        int v204 = v203 + v65;
        int v205 = v64[v204];
        int v206 = 0;
        int v207;
        v207 = v206;
        switch (v205) {
          case 0:
            {
            int v208 = 4;
            int v209 = v65 + v208;
            v207 = v209;
            break;
          }
          case 1:
            {
            v207 = v65;
          }
          default:
            {
            v207 = v65;
            break;
          }
        }
        v202 = v207;
      } else {
        v202 = v65;
      }
      v126 = v202;
      break;
    }
  }
  bool v210 = true;
  int v211 = 64;
  int v212 = v211 + v65;
  bool v213 = true;
  int v214 = simt_wave_count_bits(v213);
  v63[v212] = v214;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
