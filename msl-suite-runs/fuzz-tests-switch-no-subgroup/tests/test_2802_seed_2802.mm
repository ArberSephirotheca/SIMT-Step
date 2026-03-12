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
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
  }
  int v22 = 0;
  bool v23 = v2 != v22;
  int v24;
  if (v23) {
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
      int v34 = 0;
      int v35 = 0;
      int v36;
      int v37;
      v36 = v34;
      v37 = v35;
      while (true) {
        int v38 = 4;
        int v39 = v3 % v38;
        int v40 = 1;
        int v41 = v39 + v40;
        bool v42 = v37 < v41;
        v36 = v36;
        v37 = v37;
        if (!v42) break;
        bool v43 = true;
        int v44 = simt_wave_count_bits(v43);
        int v45 = 16;
        int v46 = 4;
        int v47 = v37 * v46;
        int v48 = v45 + v47;
        int v49 = v48 + v0;
        v1[v49] = v44;
        int v50 = 1;
        int v51 = v37 + v50;
        v36 = v44;
        v37 = v51;
        continue;
        ;
      }
      int v52 = 1;
      int v53 = v28 + v52;
      v27 = v36;
      v28 = v53;
    }
    v24 = v27;
  } else {
    int v54 = 2;
    int v55 = v3 % v54;
    int v56 = 2;
    int v57;
    v57 = v56;
    switch (v55) {
      case 0:
        {
        int v58 = 0;
        bool v59 = v2 != v58;
        int v60;
        if (v59) {
          int v61 = 2;
          v60 = v61;
        } else {
          int v62 = 1;
          v60 = v62;
        }
        v57 = v60;
      }
      default:
        {
        int v63 = 2;
        int v64 = v0 + v63;
        int v65;
        v65 = v64;
        switch (v3) {
          case 0:
            {
            v65 = v0;
          }
          default:
            {
            int v66 = 2;
            int v67 = v0 + v66;
            v65 = v67;
            break;
          }
        }
        v57 = v65;
        break;
      }
      case 1:
        {
        int v68;
        v68 = v0;
        switch (v3) {
          default:
            {
            int v69 = 4;
            v68 = v69;
            break;
          }
          case 0:
            {
            int v70 = 2;
            int v71 = v0 + v70;
            v68 = v71;
            break;
          }
        }
        v57 = v68;
        break;
      }
    }
    v24 = v57;
  }
  int v72 = 0;
  bool v73 = v2 != v72;
  int v74 = v73 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v75 [[buffer(0)]], device int* v76 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v77 = static_cast<int>(__simt_tid3.x);
  int v78 = 0;
  int v79 = v78 + v77;
  int v80 = v76[v79];
  int v81 = 4;
  int v82 = v81 + v77;
  int v83 = v76[v82];
  helper0(v77, v75, v80, v83, static_cast<int>(__simt_tid3.x));
  int v84 = 1;
  int v85 = v77 + v84;
  int v86 = 0;
  int v87 = 0;
  int v88;
  int v89;
  v88 = v86;
  v89 = v87;
  while (true) {
    int v90 = 4;
    int v91 = v89 * v90;
    int v92 = v91 + v77;
    int v93 = 8;
    int v94 = v93 + v92;
    int v95 = v76[v94];
    int v96 = 0;
    bool v97 = v95 != v96;
    v88 = v88;
    v89 = v89;
    if (!v97) break;
    int v98 = 28;
    int v99 = v98 + v77;
    int v100 = v76[v99];
    uint v101 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v102 = (int)(v101);
    int v103;
    v103 = v102;
    switch (v100) {
      default:
        {
        int v104 = 32;
        int v105 = v104 + v77;
        int v106 = v76[v105];
        int v107 = 3;
        int v108 = v77 + v107;
        int v109;
        v109 = v108;
        switch (v106) {
          case 0:
            {
            int v110 = 3;
            int v111 = v77 + v110;
            v109 = v111;
          }
          default:
            {
            v109 = v77;
          }
          case 1:
            {
            int v112 = 3;
            int v113 = v77 + v112;
            v109 = v113;
            break;
          }
          case 2:
            {
            v109 = v77;
            break;
          }
        }
        v103 = v109;
        break;
      }
      case 0:
        {
        int v114 = 36;
        int v115 = v114 + v77;
        int v116 = v76[v115];
        int v117 = 4;
        int v118 = v77 + v117;
        int v119;
        v119 = v118;
        switch (v116) {
          case 0:
            {
            int v120 = 0;
            v119 = v120;
          }
          case 1:
            {
            int v121 = 4;
            int v122 = v77 + v121;
            v119 = v122;
          }
          default:
            {
            v119 = v77;
            break;
          }
        }
        bool v123 = true;
        v103 = v119;
        break;
      }
      case 1:
        {
        int v124 = 1;
        v103 = v124;
        break;
      }
    }
    int v125 = v88 + v103;
    int v126 = 1;
    int v127 = v89 + v126;
    bool v128 = true;
    int v129 = 32;
    int v130 = 4;
    int v131 = v89 * v130;
    int v132 = v129 + v131;
    int v133 = v132 + v77;
    bool v134 = true;
    int v135 = simt_wave_count_bits(v134);
    v75[v133] = v135;
    v88 = v125;
    v89 = v127;
  }
  int v136 = 0;
  int v137 = 0;
  int v138;
  int v139;
  v138 = v136;
  v139 = v137;
  while (true) {
    int v140 = 4;
    int v141 = v139 * v140;
    int v142 = v141 + v77;
    int v143 = 40;
    int v144 = v143 + v142;
    int v145 = v76[v144];
    int v146 = 0;
    bool v147 = v145 != v146;
    v138 = v138;
    v139 = v139;
    if (!v147) break;
    int v148 = 60;
    int v149 = v148 + v77;
    int v150 = v76[v149];
    int v151 = 0;
    int v152 = v77 + v151;
    int v153;
    v153 = v152;
    switch (v150) {
      case 0:
        {
        int v154 = 0;
        int v155 = 0;
        int v156;
        int v157;
        v156 = v154;
        v157 = v155;
        while (true) {
          int v158 = 4;
          int v159 = v157 * v158;
          int v160 = v159 + v77;
          int v161 = 64;
          int v162 = v161 + v160;
          int v163 = v76[v162];
          int v164 = 0;
          bool v165 = v163 != v164;
          v156 = v156;
          v157 = v157;
          if (!v165) break;
          int v166 = v156 + v157;
          int v167 = 1;
          int v168 = v157 + v167;
          bool v169 = true;
          v156 = v166;
          v157 = v168;
        }
        v153 = v156;
        break;
      }
      default:
        {
        int v170 = 84;
        int v171 = v170 + v77;
        int v172 = v76[v171];
        int v173 = 0;
        bool v174 = v172 != v173;
        int v175;
        if (v174) {
          int v176 = 1;
          v175 = v176;
        } else {
          v175 = v77;
        }
        v153 = v175;
        break;
      }
      case 1:
        {
        v153 = v77;
        break;
      }
      case 2:
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
          int v183 = v182 + v77;
          int v184 = 88;
          int v185 = v184 + v183;
          int v186 = v76[v185];
          int v187 = 0;
          bool v188 = v186 != v187;
          v179 = v179;
          v180 = v180;
          if (!v188) break;
          int v189 = v179 + v180;
          int v190 = 1;
          int v191 = v180 + v190;
          bool v192 = true;
          v179 = v189;
          v180 = v191;
        }
        v153 = v179;
        break;
      }
    }
    int v193 = v138 + v153;
    int v194 = 1;
    int v195 = v139 + v194;
    bool v196 = true;
    int v197 = 48;
    int v198 = 4;
    int v199 = v139 * v198;
    int v200 = v197 + v199;
    int v201 = v200 + v77;
    bool v202 = true;
    int v203 = simt_wave_count_bits(v202);
    v75[v201] = v203;
    v138 = v193;
    v139 = v195;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
