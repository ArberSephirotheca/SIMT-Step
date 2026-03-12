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
  int v4 = 1;
  int v5 = v0 + v4;
  int v6 = 0;
  int v7 = 0;
  int v8;
  int v9;
  v8 = v6;
  v9 = v7;
  while (true) {
    int v10 = 4;
    int v11 = v3 % v10;
    int v12 = 1;
    int v13 = v11 + v12;
    bool v14 = v9 < v13;
    v8 = v8;
    v9 = v9;
    if (!v14) break;
    int v15 = 0;
    int v16 = v0 + v15;
    int v17 = 1;
    int v18 = v9 + v17;
    v8 = v16;
    v9 = v18;
  }
  bool v19 = true;
  int v20 = simt_wave_count_bits(v19);
  int v21 = 0;
  int v22 = v21 + v0;
  v1[v22] = v20;
  int v23 = 0;
  bool v24 = v2 != v23;
  int v25 = v24 ? v5 : v8;
  int v26 = 0;
  bool v27 = v2 != v26;
  int v28;
  if (v27) {
    int v29 = 0;
    bool v30 = v2 != v29;
    int v31;
    if (v30) {
      int v32 = 3;
      int v33 = v3 % v32;
      uint v34 = simt_lane_id(__simt_tid);
      int v35 = (int)(v34);
      int v36;
      v36 = v35;
      switch (v33) {
        case 0:
          {
          int v37 = 2;
          int v38 = v0 + v37;
          v36 = v38;
          break;
        }
        case 1:
          {
          int v39 = 0;
          v36 = v39;
          break;
        }
        default:
          {
          int v40 = 4;
          int v41 = v0 + v40;
          v36 = v41;
          break;
        }
      }
      int v42 = 0;
      int v43 = v0 + v42;
      v31 = v36;
    } else {
      int v44 = 3;
      int v45 = v3 % v44;
      uint v46 = simt_subgroup_id(__simt_tid);
      int v47 = (int)(v46);
      int v48;
      v48 = v47;
      switch (v45) {
        case 0:
          {
          v48 = v0;
          break;
        }
        default:
          {
          v48 = v0;
          break;
        }
        case 1:
          {
          int v49 = 4;
          v48 = v49;
          break;
        }
      }
      uint v50 = simt_subgroup_id(__simt_tid);
      int v51 = (int)(v50);
      v31 = v48;
    }
    int v52 = 0;
    int v53 = v0 + v52;
    v28 = v31;
  } else {
    int v54 = 3;
    int v55 = v3 % v54;
    int v56 = 0;
    int v57;
    v57 = v56;
    switch (v55) {
      case 0:
        {
        int v58;
        v58 = v0;
        switch (v3) {
          default:
            {
            v58 = v0;
            break;
          }
          case 0:
            {
            int v59 = 2;
            v58 = v59;
            break;
          }
        }
        v57 = v58;
        break;
      }
      case 1:
        {
        int v60 = 3;
        v57 = v60;
        break;
      }
      default:
        {
        int v61 = 3;
        int v62 = v3 % v61;
        int v63;
        v63 = v0;
        switch (v62) {
          default:
            {
            int v64 = 0;
            v63 = v64;
          }
          case 0:
            {
            int v65 = 3;
            int v66 = v0 + v65;
            v63 = v66;
            break;
          }
          case 1:
            {
            v63 = v0;
            break;
          }
        }
        int v67 = 3;
        v57 = v63;
        break;
      }
      case 2:
        {
        int v68 = 0;
        bool v69 = v2 != v68;
        int v70;
        if (v69) {
          int v71 = 4;
          v70 = v71;
        } else {
          v70 = v0;
        }
        int v72 = 1;
        int v73 = v0 + v72;
        v57 = v70;
        break;
      }
    }
    int v74 = 2;
    v28 = v57;
  }
  bool v75 = true;
  int v76 = simt_wave_count_bits(v75);
  int v77 = 16;
  int v78 = v77 + v0;
  v1[v78] = v76;
  int v79 = 0;
  bool v80 = v2 != v79;
  int v81 = v80 ? v25 : v28;
  return;
}

kernel void kernel_main(device int* v82 [[buffer(0)]], device int* v83 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v84 = static_cast<int>(__simt_tid3.x);
  int v85 = 0;
  int v86 = v85 + v84;
  int v87 = v83[v86];
  int v88 = 4;
  int v89 = v88 + v84;
  int v90 = v83[v89];
  helper0(v84, v82, v87, v90, static_cast<int>(__simt_tid3.x));
  int v91 = 8;
  int v92 = v91 + v84;
  int v93 = v83[v92];
  int v94 = 0;
  bool v95 = v93 != v94;
  int v96;
  if (v95) {
    int v97 = 12;
    int v98 = v97 + v84;
    int v99 = v83[v98];
    int v100;
    v100 = v84;
    switch (v99) {
      default:
        {
        int v101 = 16;
        int v102 = v101 + v84;
        int v103 = v83[v102];
        int v104 = 0;
        bool v105 = v103 != v104;
        int v106;
        if (v105) {
          int v107 = 1;
          v106 = v107;
        } else {
          int v108 = 2;
          int v109 = v84 + v108;
          v106 = v109;
        }
        v100 = v106;
      }
      case 0:
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
          int v116 = v115 + v84;
          int v117 = 20;
          int v118 = v117 + v116;
          int v119 = v83[v118];
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
        v100 = v112;
        break;
      }
    }
    bool v126 = true;
    v96 = v100;
  } else {
    int v127 = 40;
    int v128 = v127 + v84;
    int v129 = v83[v128];
    int v130 = 0;
    bool v131 = v129 != v130;
    int v132;
    if (v131) {
      int v133 = 44;
      int v134 = v133 + v84;
      int v135 = v83[v134];
      uint v136 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v137 = (int)(v136);
      int v138;
      v138 = v137;
      switch (v135) {
        default:
          {
          int v139 = 1;
          int v140 = v84 + v139;
          v138 = v140;
          break;
        }
        case 0:
          {
          v138 = v84;
          break;
        }
        case 1:
          {
          int v141 = 3;
          v138 = v141;
          break;
        }
      }
      bool v142 = true;
      v132 = v138;
    } else {
      int v143 = 0;
      int v144 = 0;
      int v145;
      int v146;
      v145 = v143;
      v146 = v144;
      while (true) {
        int v147 = 4;
        int v148 = v146 * v147;
        int v149 = v148 + v84;
        int v150 = 48;
        int v151 = v150 + v149;
        int v152 = v83[v151];
        int v153 = 0;
        bool v154 = v152 != v153;
        v145 = v145;
        v146 = v146;
        if (!v154) break;
        int v155 = v145 + v146;
        int v156 = 1;
        int v157 = v146 + v156;
        v145 = v155;
        v146 = v157;
        continue;
        ;
      }
      bool v158 = true;
      v132 = v145;
    }
    v96 = v132;
  }
  int v159 = 32;
  int v160 = v159 + v84;
  bool v161 = true;
  int v162 = simt_wave_count_bits(v161);
  v82[v160] = v162;
  int v163 = 0;
  int v164 = 0;
  int v165;
  int v166;
  v165 = v163;
  v166 = v164;
  while (true) {
    int v167 = 4;
    int v168 = v166 * v167;
    int v169 = v168 + v84;
    int v170 = 68;
    int v171 = v170 + v169;
    int v172 = v83[v171];
    int v173 = 0;
    bool v174 = v172 != v173;
    v165 = v165;
    v166 = v166;
    if (!v174) break;
    int v175 = 88;
    int v176 = v175 + v84;
    int v177 = v83[v176];
    int v178 = 0;
    int v179;
    v179 = v178;
    switch (v177) {
      case 0:
        {
        int v180 = 92;
        int v181 = v180 + v84;
        int v182 = v83[v181];
        int v183 = 1;
        int v184 = v84 + v183;
        int v185;
        v185 = v184;
        switch (v182) {
          case 0:
            {
            v185 = v84;
          }
          default:
            {
            int v186 = 2;
            v185 = v186;
            break;
          }
        }
        bool v187 = true;
        v179 = v185;
        break;
      }
      default:
        {
        int v188 = 96;
        int v189 = v188 + v84;
        int v190 = v83[v189];
        int v191 = 0;
        bool v192 = v190 != v191;
        int v193;
        if (v192) {
          int v194 = 0;
          v193 = v194;
        } else {
          v193 = v84;
        }
        v179 = v193;
        break;
      }
    }
    bool v195 = true;
    int v196 = v165 + v179;
    int v197 = 1;
    int v198 = v166 + v197;
    v165 = v196;
    v166 = v198;
    continue;
    ;
  }
  bool v199 = true;
  int v200 = 48;
  int v201 = v200 + v84;
  bool v202 = true;
  int v203 = simt_wave_count_bits(v202);
  v82[v201] = v203;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
