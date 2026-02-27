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
  int v4 = 4;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 3;
        int v13 = v0 + v12;
        v11 = v13;
      } else {
        int v14 = 3;
        int v15 = v0 + v14;
        v11 = v15;
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v16 = 0;
      int v17 = 0;
      int v18;
      int v19;
      v18 = v16;
      v19 = v17;
      while (true) {
        int v20 = 4;
        int v21 = v3 % v20;
        int v22 = 1;
        int v23 = v21 + v22;
        bool v24 = v19 < v23;
        v18 = v18;
        v19 = v19;
        if (!v24) break;
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
          int v34 = 3;
          int v35 = v0 + v34;
          int v36 = 1;
          int v37 = v28 + v36;
          v27 = v35;
          v28 = v37;
        }
        int v38 = 1;
        int v39 = v19 + v38;
        v18 = v27;
        v19 = v39;
      }
      v8 = v18;
      break;
    }
    case 2:
      {
      int v40 = 3;
      int v41 = v3 % v40;
      int v42 = 3;
      int v43;
      v43 = v42;
      switch (v41) {
        case 0:
          {
          int v44 = 2;
          int v45 = v3 % v44;
          int v46 = 1;
          int v47 = v0 + v46;
          int v48;
          v48 = v47;
          switch (v45) {
            case 0:
              {
              int v49 = 2;
              int v50 = v0 + v49;
              v48 = v50;
              break;
            }
            case 1:
              {
              v48 = v0;
              break;
            }
            default:
              {
              int v51 = 1;
              v48 = v51;
              break;
            }
          }
          v43 = v48;
          break;
        }
        default:
          {
          int v52 = 0;
          int v53 = 0;
          int v54;
          int v55;
          v54 = v52;
          v55 = v53;
          while (true) {
            int v56 = 4;
            int v57 = v3 % v56;
            int v58 = 1;
            int v59 = v57 + v58;
            bool v60 = v55 < v59;
            v54 = v54;
            v55 = v55;
            if (!v60) break;
            int v61 = 2;
            int v62 = 1;
            int v63 = v55 + v62;
            v54 = v61;
            v55 = v63;
          }
          v43 = v54;
          break;
        }
        case 1:
          {
          int v64 = 0;
          bool v65 = v2 != v64;
          int v66;
          if (v65) {
            int v67 = 2;
            int v68 = v0 + v67;
            v66 = v68;
          } else {
            int v69 = 3;
            v66 = v69;
          }
          v43 = v66;
          break;
        }
        case 2:
          {
          int v70 = 0;
          bool v71 = v2 != v70;
          int v72;
          if (v71) {
            int v73 = 1;
            v72 = v73;
          } else {
            int v74 = 1;
            int v75 = v0 + v74;
            v72 = v75;
          }
          v43 = v72;
          break;
        }
      }
      v8 = v43;
      break;
    }
    default:
      {
      int v76 = 0;
      bool v77 = v2 != v76;
      int v78;
      if (v77) {
        int v79 = 0;
        bool v80 = v2 != v79;
        int v81;
        if (v80) {
          int v82 = 4;
          int v83 = v0 + v82;
          v81 = v83;
        } else {
          int v84 = 3;
          int v85 = v0 + v84;
          v81 = v85;
        }
        v78 = v81;
      } else {
        int v86 = 2;
        int v87 = v3 % v86;
        int v88 = 1;
        int v89;
        v89 = v88;
        switch (v87) {
          case 0:
            {
            int v90 = 0;
            v89 = v90;
          }
          default:
            {
            int v91 = 1;
            v89 = v91;
            break;
          }
        }
        v78 = v89;
      }
      v8 = v78;
      break;
    }
  }
  bool v92 = true;
  int v93 = simt_wave_count_bits(v92);
  int v94 = 0;
  int v95 = v94 + v0;
  v1[v95] = v93;
  return;
}

kernel void kernel_main(device int* v96 [[buffer(0)]], device int* v97 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v98 = static_cast<int>(__simt_tid3.x);
  int v99 = 0;
  int v100 = v99 + v98;
  int v101 = v97[v100];
  int v102 = 4;
  int v103 = v102 + v98;
  int v104 = v97[v103];
  helper0(v98, v96, v101, v104, static_cast<int>(__simt_tid3.x));
  int v105 = 8;
  int v106 = v105 + v98;
  int v107 = v97[v106];
  int v108 = 0;
  int v109;
  v109 = v108;
  switch (v107) {
    case 0:
      {
      int v110 = 2;
      int v111 = v98 + v110;
      v109 = v111;
      break;
    }
    default:
      {
      int v112 = 12;
      int v113 = v112 + v98;
      int v114 = v97[v113];
      int v115 = 0;
      bool v116 = v114 != v115;
      int v117;
      if (v116) {
        int v118 = 16;
        int v119 = v118 + v98;
        int v120 = v97[v119];
        int v121 = 0;
        bool v122 = v120 != v121;
        int v123;
        if (v122) {
          int v124 = 2;
          int v125 = v98 + v124;
          v123 = v125;
        } else {
          int v126 = 0;
          int v127 = v98 + v126;
          v123 = v127;
        }
        v117 = v123;
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
          int v134 = v133 + v98;
          int v135 = 20;
          int v136 = v135 + v134;
          int v137 = v97[v136];
          int v138 = 0;
          bool v139 = v137 != v138;
          v130 = v130;
          v131 = v131;
          if (!v139) break;
          int v140 = v130 + v131;
          int v141 = 1;
          int v142 = v131 + v141;
          bool v143 = true;
          v130 = v140;
          v131 = v142;
        }
        v117 = v130;
      }
      v109 = v117;
      break;
    }
    case 1:
      {
      v109 = v98;
      break;
    }
  }
  int v144 = 2;
  int v145 = 40;
  int v146 = v145 + v98;
  int v147 = v97[v146];
  int v148 = 1;
  int v149 = v98 + v148;
  int v150;
  v150 = v149;
  switch (v147) {
    default:
      {
      int v151 = 44;
      int v152 = v151 + v98;
      int v153 = v97[v152];
      int v154 = 3;
      int v155;
      v155 = v154;
      switch (v153) {
        default:
          {
          int v156 = 48;
          int v157 = v156 + v98;
          int v158 = v97[v157];
          int v159;
          v159 = v98;
          switch (v158) {
            case 0:
              {
              int v160 = 4;
              int v161 = v98 + v160;
              v159 = v161;
            }
            case 1:
              {
              int v162 = 3;
              int v163 = v98 + v162;
              v159 = v163;
            }
            default:
              {
              int v164 = 4;
              int v165 = v98 + v164;
              v159 = v165;
              break;
            }
          }
          bool v166 = true;
          v155 = v159;
          break;
        }
        case 0:
          {
          int v167 = 0;
          v155 = v167;
          break;
        }
      }
      v150 = v155;
      break;
    }
    case 0:
      {
      int v168 = 52;
      int v169 = v168 + v98;
      int v170 = v97[v169];
      int v171 = 0;
      bool v172 = v170 != v171;
      int v173;
      if (v172) {
        v173 = v98;
      } else {
        int v174 = 0;
        int v175 = 0;
        int v176;
        int v177;
        v176 = v174;
        v177 = v175;
        while (true) {
          int v178 = 4;
          int v179 = v177 * v178;
          int v180 = v179 + v98;
          int v181 = 56;
          int v182 = v181 + v180;
          int v183 = v97[v182];
          int v184 = 0;
          bool v185 = v183 != v184;
          v176 = v176;
          v177 = v177;
          if (!v185) break;
          int v186 = v176 + v177;
          int v187 = 1;
          int v188 = v177 + v187;
          bool v189 = true;
          v176 = v186;
          v177 = v188;
          continue;
          ;
        }
        v173 = v176;
      }
      v150 = v173;
      break;
    }
    case 1:
      {
      int v190 = 76;
      int v191 = v190 + v98;
      int v192 = v97[v191];
      int v193 = 0;
      bool v194 = v192 != v193;
      int v195;
      if (v194) {
        int v196 = 0;
        int v197 = 0;
        int v198;
        int v199;
        v198 = v196;
        v199 = v197;
        while (true) {
          int v200 = 4;
          int v201 = v199 * v200;
          int v202 = v201 + v98;
          int v203 = 80;
          int v204 = v203 + v202;
          int v205 = v97[v204];
          int v206 = 0;
          bool v207 = v205 != v206;
          v198 = v198;
          v199 = v199;
          if (!v207) break;
          int v208 = v198 + v199;
          int v209 = 1;
          int v210 = v199 + v209;
          bool v211 = true;
          v198 = v208;
          v199 = v210;
          continue;
          ;
        }
        v195 = v198;
      } else {
        int v212 = 0;
        int v213 = 0;
        int v214;
        int v215;
        v214 = v212;
        v215 = v213;
        while (true) {
          int v216 = 4;
          int v217 = v215 * v216;
          int v218 = v217 + v98;
          int v219 = 100;
          int v220 = v219 + v218;
          int v221 = v97[v220];
          int v222 = 0;
          bool v223 = v221 != v222;
          v214 = v214;
          v215 = v215;
          if (!v223) break;
          int v224 = v214 + v215;
          int v225 = 1;
          int v226 = v215 + v225;
          bool v227 = true;
          v214 = v224;
          v215 = v226;
        }
        v195 = v214;
      }
      v150 = v195;
      break;
    }
  }
  bool v228 = true;
  int v229 = 16;
  int v230 = v229 + v98;
  bool v231 = true;
  int v232 = simt_wave_count_bits(v231);
  v96[v230] = v232;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
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
