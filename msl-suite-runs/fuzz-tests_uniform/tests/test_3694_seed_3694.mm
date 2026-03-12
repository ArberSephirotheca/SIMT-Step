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
    int v7 = 3;
    int v8 = v3 % v7;
    int v9;
    v9 = v0;
    switch (v8) {
      default:
        {
        int v10 = 0;
        bool v11 = v2 != v10;
        int v12;
        if (v11) {
          int v13 = 2;
          v12 = v13;
        } else {
          int v14 = 4;
          v12 = v14;
        }
        int v15 = 1;
        int v16 = v0 + v15;
        v9 = v12;
        break;
      }
      case 0:
        {
        int v17 = 0;
        bool v18 = v2 != v17;
        int v19;
        if (v18) {
          int v20 = 3;
          v19 = v20;
        } else {
          int v21 = 1;
          int v22 = v0 + v21;
          v19 = v22;
        }
        v9 = v19;
      }
      case 1:
        {
        int v23 = 0;
        bool v24 = v2 != v23;
        int v25;
        if (v24) {
          v25 = v0;
        } else {
          int v26 = 4;
          v25 = v26;
        }
        int v27 = 1;
        v9 = v25;
        break;
      }
    }
    uint v28 = simt_lane_id(__simt_tid);
    int v29 = (int)(v28);
    v6 = v9;
  } else {
    int v30 = 4;
    int v31 = v3 % v30;
    uint v32 = simt_lane_id(__simt_tid);
    int v33 = (int)(v32);
    int v34;
    v34 = v33;
    switch (v31) {
      default:
        {
        int v35 = 1;
        v34 = v35;
        break;
      }
      case 0:
        {
        int v36 = 0;
        int v37 = 0;
        int v38;
        int v39;
        v38 = v36;
        v39 = v37;
        while (true) {
          int v40 = 4;
          int v41 = v3 % v40;
          int v42 = 1;
          int v43 = v41 + v42;
          bool v44 = v39 < v43;
          v38 = v38;
          v39 = v39;
          if (!v44) break;
          int v45 = 1;
          int v46 = v39 + v45;
          v38 = v0;
          v39 = v46;
          break;
          ;
        }
        int v47 = 1;
        int v48 = v0 + v47;
        v34 = v38;
        break;
      }
      case 1:
        {
        int v49 = 2;
        int v50 = v0 + v49;
        v34 = v50;
        break;
      }
      case 2:
        {
        int v51;
        v51 = v0;
        switch (v3) {
          default:
            {
            int v52 = 3;
            int v53 = v0 + v52;
            v51 = v53;
            break;
          }
          case 0:
            {
            v51 = v0;
            break;
          }
        }
        v34 = v51;
        break;
      }
    }
    int v54 = 1;
    int v55 = v0 + v54;
    v6 = v34;
  }
  bool v56 = true;
  int v57 = simt_wave_count_bits(v56);
  int v58 = 0;
  int v59 = v58 + v0;
  v1[v59] = v57;
  return;
}

kernel void kernel_main(device int* v60 [[buffer(0)]], device int* v61 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v62 = static_cast<int>(__simt_tid3.x);
  int v63 = 0;
  int v64 = v63 + v62;
  int v65 = v61[v64];
  int v66 = 4;
  int v67 = v66 + v62;
  int v68 = v61[v67];
  helper0(v62, v60, v65, v68, static_cast<int>(__simt_tid3.x));
  int v69 = 8;
  int v70 = v69 + v62;
  int v71 = v61[v70];
  int v72 = 0;
  bool v73 = v71 != v72;
  int v74;
  if (v73) {
    int v75 = 0;
    int v76 = 0;
    int v77;
    int v78;
    v77 = v75;
    v78 = v76;
    while (true) {
      int v79 = 4;
      int v80 = v78 * v79;
      int v81 = v80 + v62;
      int v82 = 12;
      int v83 = v82 + v81;
      int v84 = v61[v83];
      int v85 = 0;
      bool v86 = v84 != v85;
      v77 = v77;
      v78 = v78;
      if (!v86) break;
      int v87 = 32;
      int v88 = v87 + v62;
      int v89 = v61[v88];
      int v90 = 0;
      bool v91 = v89 != v90;
      int v92;
      if (v91) {
        v92 = v62;
      } else {
        v92 = v62;
      }
      int v93 = v77 + v92;
      int v94 = 1;
      int v95 = v78 + v94;
      v77 = v93;
      v78 = v95;
    }
    bool v96 = true;
    v74 = v77;
  } else {
    int v97 = 0;
    int v98 = 0;
    int v99;
    int v100;
    v99 = v97;
    v100 = v98;
    while (true) {
      int v101 = 4;
      int v102 = v100 * v101;
      int v103 = v102 + v62;
      int v104 = 36;
      int v105 = v104 + v103;
      int v106 = v61[v105];
      int v107 = 0;
      bool v108 = v106 != v107;
      v99 = v99;
      v100 = v100;
      if (!v108) break;
      int v109 = v99 + v100;
      int v110 = 1;
      int v111 = v100 + v110;
      v99 = v109;
      v100 = v111;
      continue;
      ;
    }
    bool v112 = true;
    v74 = v99;
  }
  int v113 = 16;
  int v114 = v113 + v62;
  bool v115 = true;
  int v116 = simt_wave_count_bits(v115);
  v60[v114] = v116;
  int v117 = 56;
  int v118 = v117 + v62;
  int v119 = v61[v118];
  int v120 = 0;
  bool v121 = v119 != v120;
  int v122;
  if (v121) {
    int v123 = 60;
    int v124 = v123 + v62;
    int v125 = v61[v124];
    int v126 = 0;
    bool v127 = v125 != v126;
    int v128;
    if (v127) {
      int v129 = 64;
      int v130 = v129 + v62;
      int v131 = v61[v130];
      int v132 = 0;
      int v133;
      v133 = v132;
      switch (v131) {
        default:
          {
          int v134 = 2;
          int v135 = v62 + v134;
          v133 = v135;
          break;
        }
        case 0:
          {
          int v136 = 3;
          int v137 = v62 + v136;
          v133 = v137;
          break;
        }
        case 1:
          {
          int v138 = 4;
          v133 = v138;
          break;
        }
        case 2:
          {
          v133 = v62;
          break;
        }
      }
      bool v139 = true;
      v128 = v133;
    } else {
      int v140 = 68;
      int v141 = v140 + v62;
      int v142 = v61[v141];
      int v143 = 0;
      bool v144 = v142 != v143;
      int v145;
      if (v144) {
        int v146 = 2;
        v145 = v146;
      } else {
        v145 = v62;
      }
      v128 = v145;
    }
    v122 = v128;
  } else {
    int v147 = 0;
    int v148 = 0;
    int v149;
    int v150;
    v149 = v147;
    v150 = v148;
    while (true) {
      int v151 = 4;
      int v152 = v150 * v151;
      int v153 = v152 + v62;
      int v154 = 72;
      int v155 = v154 + v153;
      int v156 = v61[v155];
      int v157 = 0;
      bool v158 = v156 != v157;
      v149 = v149;
      v150 = v150;
      if (!v158) break;
      int v159 = 0;
      int v160 = 0;
      int v161;
      int v162;
      v161 = v159;
      v162 = v160;
      while (true) {
        int v163 = 4;
        int v164 = v162 * v163;
        int v165 = v164 + v62;
        int v166 = 92;
        int v167 = v166 + v165;
        int v168 = v61[v167];
        int v169 = 0;
        bool v170 = v168 != v169;
        v161 = v161;
        v162 = v162;
        if (!v170) break;
        int v171 = v161 + v162;
        int v172 = 1;
        int v173 = v162 + v172;
        v161 = v171;
        v162 = v173;
      }
      bool v174 = true;
      int v175 = v149 + v161;
      int v176 = 1;
      int v177 = v150 + v176;
      v149 = v175;
      v150 = v177;
      continue;
      ;
    }
    bool v178 = true;
    v122 = v149;
  }
  int v179 = 32;
  int v180 = v179 + v62;
  bool v181 = true;
  int v182 = simt_wave_count_bits(v181);
  v60[v180] = v182;
  int v183 = 0;
  int v184 = 0;
  int v185;
  int v186;
  v185 = v183;
  v186 = v184;
  while (true) {
    int v187 = 4;
    int v188 = v186 * v187;
    int v189 = v188 + v62;
    int v190 = 112;
    int v191 = v190 + v189;
    int v192 = v61[v191];
    int v193 = 0;
    bool v194 = v192 != v193;
    v185 = v185;
    v186 = v186;
    if (!v194) break;
    int v195 = v185 + v62;
    int v196 = 1;
    int v197 = v186 + v196;
    v185 = v195;
    v186 = v197;
  }
  bool v198 = true;
  int v199 = 48;
  int v200 = v199 + v62;
  bool v201 = true;
  int v202 = simt_wave_count_bits(v201);
  v60[v200] = v202;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
