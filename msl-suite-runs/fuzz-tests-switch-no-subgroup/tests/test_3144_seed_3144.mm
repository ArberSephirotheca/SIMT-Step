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
    int v13 = 0;
    int v14 = 0;
    int v15;
    int v16;
    v15 = v13;
    v16 = v14;
    while (true) {
      int v17 = 4;
      int v18 = v3 % v17;
      int v19 = 1;
      int v20 = v18 + v19;
      bool v21 = v16 < v20;
      v15 = v15;
      v16 = v16;
      if (!v21) break;
      bool v22 = true;
      int v23 = simt_wave_count_bits(v22);
      int v24 = 0;
      int v25 = 4;
      int v26 = v16 * v25;
      int v27 = v24 + v26;
      int v28 = v27 + v0;
      v1[v28] = v23;
      int v29 = 1;
      int v30 = v16 + v29;
      v15 = v23;
      v16 = v30;
      break;
      ;
    }
    int v31 = 1;
    int v32 = v7 + v31;
    v6 = v15;
    v7 = v32;
  }
  int v33 = 2;
  int v34 = v3 % v33;
  int v35 = 2;
  int v36;
  v36 = v35;
  switch (v34) {
    case 0:
      {
      int v37 = 2;
      int v38 = v3 % v37;
      int v39 = 3;
      int v40 = v0 + v39;
      int v41;
      v41 = v40;
      switch (v38) {
        case 0:
          {
          int v42 = 0;
          int v43 = v0 + v42;
          v41 = v43;
          break;
        }
        default:
          {
          int v44 = 4;
          int v45 = v0 + v44;
          v41 = v45;
          break;
        }
      }
      v36 = v41;
      break;
    }
    default:
      {
      int v46 = 0;
      int v47 = 0;
      int v48;
      int v49;
      v48 = v46;
      v49 = v47;
      while (true) {
        int v50 = 4;
        int v51 = v3 % v50;
        int v52 = 1;
        int v53 = v51 + v52;
        bool v54 = v49 < v53;
        v48 = v48;
        v49 = v49;
        if (!v54) break;
        int v55 = 0;
        bool v56 = v2 != v55;
        int v57;
        if (v56) {
          int v58 = 4;
          v57 = v58;
        } else {
          v57 = v0;
        }
        int v59 = 1;
        int v60 = v49 + v59;
        v48 = v57;
        v49 = v60;
        continue;
        ;
      }
      v36 = v48;
      break;
    }
  }
  int v61 = 0;
  bool v62 = v2 != v61;
  int v63 = v62 ? v6 : v36;
  return;
}

kernel void kernel_main(device int* v64 [[buffer(0)]], device int* v65 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v66 = static_cast<int>(__simt_tid3.x);
  int v67 = 0;
  int v68 = v67 + v66;
  int v69 = v65[v68];
  int v70 = 4;
  int v71 = v70 + v66;
  int v72 = v65[v71];
  int v73 = 0;
  bool v74 = v69 != v73;
  if (v74) {
    int v75 = 8;
    int v76 = v75 + v66;
    int v77 = v65[v76];
    int v78 = 0;
    bool v79 = v77 != v78;
    if (v79) {
    } else {
      uint v80 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v81 = (int)(v80);
      int v82;
      v82 = v81;
      switch (v66) {
        case 0:
          {
          int v83 = 0;
          int v84 = v82 + v83;
          v82 = v84;
          break;
        }
        default:
          {
          int v85 = 0;
          int v86 = v82 + v85;
          v82 = v86;
          break;
        }
      }
      helper0(v66, v64, v69, v72, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v87 = 12;
  int v88 = v87 + v66;
  int v89 = v65[v88];
  uint v90 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v91 = (int)(v90);
  int v92;
  v92 = v91;
  switch (v89) {
    default:
      {
      int v93 = 16;
      int v94 = v93 + v66;
      int v95 = v65[v94];
      int v96 = 0;
      bool v97 = v95 != v96;
      int v98;
      if (v97) {
        int v99 = 0;
        int v100 = 0;
        int v101;
        int v102;
        v101 = v99;
        v102 = v100;
        while (true) {
          int v103 = 4;
          int v104 = v102 * v103;
          int v105 = v104 + v66;
          int v106 = 20;
          int v107 = v106 + v105;
          int v108 = v65[v107];
          int v109 = 0;
          bool v110 = v108 != v109;
          v101 = v101;
          v102 = v102;
          if (!v110) break;
          int v111 = v101 + v102;
          int v112 = 1;
          int v113 = v102 + v112;
          bool v114 = true;
          v101 = v111;
          v102 = v113;
        }
        v98 = v101;
      } else {
        int v115 = 40;
        int v116 = v115 + v66;
        int v117 = v65[v116];
        int v118 = 0;
        int v119;
        v119 = v118;
        switch (v117) {
          case 0:
            {
            v119 = v66;
          }
          case 1:
            {
            int v120 = 0;
            v119 = v120;
          }
          case 2:
            {
            int v121 = 4;
            int v122 = v66 + v121;
            v119 = v122;
          }
          default:
            {
            int v123 = 4;
            v119 = v123;
            break;
          }
        }
        bool v124 = true;
        v98 = v119;
      }
      v92 = v98;
      break;
    }
    case 0:
      {
      int v125 = 44;
      int v126 = v125 + v66;
      int v127 = v65[v126];
      int v128 = 0;
      bool v129 = v127 != v128;
      int v130;
      if (v129) {
        int v131 = 48;
        int v132 = v131 + v66;
        int v133 = v65[v132];
        int v134 = 4;
        int v135;
        v135 = v134;
        switch (v133) {
          case 0:
            {
            int v136 = 1;
            v135 = v136;
            break;
          }
          case 1:
            {
            int v137 = 2;
            int v138 = v66 + v137;
            v135 = v138;
            break;
          }
          default:
            {
            int v139 = 2;
            int v140 = v66 + v139;
            v135 = v140;
            break;
          }
          case 2:
            {
            int v141 = 4;
            v135 = v141;
            break;
          }
        }
        v130 = v135;
      } else {
        int v142 = 52;
        int v143 = v142 + v66;
        int v144 = v65[v143];
        int v145 = 2;
        int v146;
        v146 = v145;
        switch (v144) {
          case 0:
            {
            int v147 = 2;
            int v148 = v66 + v147;
            v146 = v148;
            break;
          }
          default:
            {
            int v149 = 0;
            int v150 = v66 + v149;
            v146 = v150;
            break;
          }
          case 1:
            {
            int v151 = 3;
            int v152 = v66 + v151;
            v146 = v152;
            break;
          }
        }
        v130 = v146;
      }
      v92 = v130;
    }
    case 1:
      {
      int v153 = 56;
      int v154 = v153 + v66;
      int v155 = v65[v154];
      int v156;
      v156 = v66;
      switch (v155) {
        case 0:
          {
          int v157 = 0;
          int v158 = 0;
          int v159;
          int v160;
          v159 = v157;
          v160 = v158;
          while (true) {
            int v161 = 4;
            int v162 = v160 * v161;
            int v163 = v162 + v66;
            int v164 = 60;
            int v165 = v164 + v163;
            int v166 = v65[v165];
            int v167 = 0;
            bool v168 = v166 != v167;
            v159 = v159;
            v160 = v160;
            if (!v168) break;
            int v169 = v159 + v160;
            int v170 = 1;
            int v171 = v160 + v170;
            bool v172 = true;
            v159 = v169;
            v160 = v171;
          }
          v156 = v159;
        }
        case 1:
          {
          int v173 = 1;
          int v174 = v66 + v173;
          v156 = v174;
        }
        default:
          {
          int v175 = 0;
          int v176 = 0;
          int v177;
          int v178;
          v177 = v175;
          v178 = v176;
          while (true) {
            int v179 = 4;
            int v180 = v178 * v179;
            int v181 = v180 + v66;
            int v182 = 80;
            int v183 = v182 + v181;
            int v184 = v65[v183];
            int v185 = 0;
            bool v186 = v184 != v185;
            v177 = v177;
            v178 = v178;
            if (!v186) break;
            int v187 = v177 + v178;
            int v188 = 1;
            int v189 = v178 + v188;
            bool v190 = true;
            v177 = v187;
            v178 = v189;
          }
          v156 = v177;
          break;
        }
      }
      v92 = v156;
      break;
    }
    case 2:
      {
      int v191 = 100;
      int v192 = v191 + v66;
      int v193 = v65[v192];
      int v194 = 0;
      bool v195 = v193 != v194;
      int v196;
      if (v195) {
        int v197 = 104;
        int v198 = v197 + v66;
        int v199 = v65[v198];
        int v200 = 4;
        int v201;
        v201 = v200;
        switch (v199) {
          case 0:
            {
            int v202 = 2;
            int v203 = v66 + v202;
            v201 = v203;
            break;
          }
          case 1:
            {
            int v204 = 3;
            int v205 = v66 + v204;
            v201 = v205;
          }
          default:
            {
            v201 = v66;
          }
          case 2:
            {
            v201 = v66;
            break;
          }
        }
        bool v206 = true;
        v196 = v201;
      } else {
        int v207 = 108;
        int v208 = v207 + v66;
        int v209 = v65[v208];
        int v210 = 4;
        int v211;
        v211 = v210;
        switch (v209) {
          case 0:
            {
            int v212 = 3;
            int v213 = v66 + v212;
            v211 = v213;
            break;
          }
          case 1:
            {
            int v214 = 0;
            v211 = v214;
            break;
          }
          case 2:
            {
            int v215 = 1;
            v211 = v215;
            break;
          }
          default:
            {
            int v216 = 0;
            v211 = v216;
            break;
          }
        }
        v196 = v211;
      }
      v92 = v196;
      break;
    }
  }
  bool v217 = true;
  int v218 = 16;
  int v219 = v218 + v66;
  bool v220 = true;
  int v221 = simt_wave_count_bits(v220);
  v64[v219] = v221;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
