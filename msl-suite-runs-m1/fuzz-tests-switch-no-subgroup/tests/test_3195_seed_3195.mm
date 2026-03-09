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
  int v8 = 0;
  bool v9 = v2 != v8;
  int v10;
  if (v9) {
    int v11 = 3;
    int v12 = v3 % v11;
    uint v13 = simt_lane_id(__simt_tid);
    int v14 = (int)(v13);
    int v15;
    v15 = v14;
    switch (v12) {
      case 0:
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
          int v25 = 2;
          int v26 = 1;
          int v27 = v19 + v26;
          v18 = v25;
          v19 = v27;
          break;
          ;
        }
        v15 = v18;
        break;
      }
      case 1:
        {
        int v28 = 1;
        v15 = v28;
        break;
      }
      default:
        {
        int v29 = 0;
        int v30 = 0;
        int v31;
        int v32;
        v31 = v29;
        v32 = v30;
        while (true) {
          int v33 = 4;
          int v34 = v3 % v33;
          int v35 = 1;
          int v36 = v34 + v35;
          bool v37 = v32 < v36;
          v31 = v31;
          v32 = v32;
          if (!v37) break;
          int v38 = 3;
          int v39 = v0 + v38;
          int v40 = 1;
          int v41 = v32 + v40;
          v31 = v39;
          v32 = v41;
          break;
          ;
        }
        v15 = v31;
        break;
      }
      case 2:
        {
        int v42 = 2;
        int v43 = v3 % v42;
        int v44 = 4;
        int v45;
        v45 = v44;
        switch (v43) {
          case 0:
            {
            v45 = v0;
          }
          default:
            {
            v45 = v0;
            break;
          }
        }
        v15 = v45;
        break;
      }
    }
    v10 = v15;
  } else {
    int v46 = 2;
    int v47 = v3 % v46;
    uint v48 = simt_subgroup_id(__simt_tid);
    int v49 = (int)(v48);
    int v50;
    v50 = v49;
    switch (v47) {
      case 0:
        {
        int v51 = 0;
        bool v52 = v2 != v51;
        int v53;
        if (v52) {
          v53 = v0;
        } else {
          v53 = v0;
        }
        v50 = v53;
        break;
      }
      default:
        {
        int v54 = 3;
        int v55 = v0 + v54;
        int v56;
        v56 = v55;
        switch (v3) {
          default:
            {
            int v57 = 4;
            int v58 = v0 + v57;
            v56 = v58;
            break;
          }
          case 0:
            {
            v56 = v0;
            break;
          }
        }
        int v59 = 2;
        v50 = v56;
        break;
      }
    }
    v10 = v50;
  }
  int v60 = 0;
  bool v61 = v2 != v60;
  int v62 = v61 ? v5 : v10;
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
  int v72 = 0;
  bool v73 = v68 != v72;
  if (v73) {
  } else {
    int v74 = 8;
    int v75 = v74 + v65;
    int v76 = v64[v75];
    int v77 = 0;
    bool v78 = v76 != v77;
    if (v78) {
      int v79 = 4;
      int v80 = v65 % v79;
      int v81;
      v81 = v65;
      switch (v80) {
        case 0:
          {
          int v82 = 1;
          int v83 = v81 + v82;
          v81 = v83;
          break;
        }
        default:
          {
          int v84 = 0;
          int v85 = v81 + v84;
          v81 = v85;
          break;
        }
        case 1:
          {
          int v86 = 4;
          int v87 = v81 + v86;
          v81 = v87;
          break;
        }
        case 2:
          {
          int v88 = 3;
          int v89 = v81 + v88;
          v81 = v89;
          break;
        }
      }
      helper0(v65, v63, v68, v71, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v90 = 12;
  int v91 = v90 + v65;
  int v92 = v64[v91];
  int v93;
  v93 = v65;
  switch (v92) {
    case 0:
      {
      int v94 = 0;
      int v95 = 0;
      int v96;
      int v97;
      v96 = v94;
      v97 = v95;
      while (true) {
        int v98 = 4;
        int v99 = v97 * v98;
        int v100 = v99 + v65;
        int v101 = 16;
        int v102 = v101 + v100;
        int v103 = v64[v102];
        int v104 = 0;
        bool v105 = v103 != v104;
        v96 = v96;
        v97 = v97;
        if (!v105) break;
        int v106 = 36;
        int v107 = v106 + v65;
        int v108 = v64[v107];
        int v109 = 0;
        bool v110 = v108 != v109;
        int v111;
        if (v110) {
          v111 = v65;
        } else {
          int v112 = 0;
          v111 = v112;
        }
        int v113 = v96 + v111;
        int v114 = 1;
        int v115 = v97 + v114;
        bool v116 = true;
        v96 = v113;
        v97 = v115;
      }
      v93 = v96;
      break;
    }
    default:
      {
      int v117 = 40;
      int v118 = v117 + v65;
      int v119 = v64[v118];
      int v120 = 0;
      int v121;
      v121 = v120;
      switch (v119) {
        case 0:
          {
          int v122 = 0;
          int v123 = 0;
          int v124;
          int v125;
          v124 = v122;
          v125 = v123;
          while (true) {
            int v126 = 4;
            int v127 = v125 * v126;
            int v128 = v127 + v65;
            int v129 = 44;
            int v130 = v129 + v128;
            int v131 = v64[v130];
            int v132 = 0;
            bool v133 = v131 != v132;
            v124 = v124;
            v125 = v125;
            if (!v133) break;
            int v134 = v124 + v125;
            int v135 = 1;
            int v136 = v125 + v135;
            bool v137 = true;
            v124 = v134;
            v125 = v136;
            continue;
            ;
          }
          v121 = v124;
          break;
        }
        case 1:
          {
          int v138 = 3;
          int v139 = v65 + v138;
          v121 = v139;
          break;
        }
        default:
          {
          int v140 = 64;
          int v141 = v140 + v65;
          int v142 = v64[v141];
          int v143 = 0;
          bool v144 = v142 != v143;
          int v145;
          if (v144) {
            int v146 = 2;
            v145 = v146;
          } else {
            int v147 = 4;
            int v148 = v65 + v147;
            v145 = v148;
          }
          v121 = v145;
          break;
        }
        case 2:
          {
          int v149 = 68;
          int v150 = v149 + v65;
          int v151 = v64[v150];
          int v152 = 3;
          int v153 = v65 + v152;
          int v154;
          v154 = v153;
          switch (v151) {
            default:
              {
              int v155 = 0;
              int v156 = v65 + v155;
              v154 = v156;
              break;
            }
            case 0:
              {
              int v157 = 1;
              int v158 = v65 + v157;
              v154 = v158;
              break;
            }
          }
          v121 = v154;
          break;
        }
      }
      v93 = v121;
    }
    case 1:
      {
      int v159 = 72;
      int v160 = v159 + v65;
      int v161 = v64[v160];
      int v162 = 0;
      bool v163 = v161 != v162;
      int v164;
      if (v163) {
        int v165 = 76;
        int v166 = v165 + v65;
        int v167 = v64[v166];
        int v168;
        v168 = v65;
        switch (v167) {
          case 0:
            {
            int v169 = 3;
            int v170 = v65 + v169;
            v168 = v170;
            break;
          }
          default:
            {
            int v171 = 0;
            int v172 = v65 + v171;
            v168 = v172;
            break;
          }
        }
        bool v173 = true;
        v164 = v168;
      } else {
        int v174 = 80;
        int v175 = v174 + v65;
        int v176 = v64[v175];
        int v177 = 0;
        bool v178 = v176 != v177;
        int v179;
        if (v178) {
          int v180 = 4;
          v179 = v180;
        } else {
          int v181 = 3;
          int v182 = v65 + v181;
          v179 = v182;
        }
        v164 = v179;
      }
      v93 = v164;
    }
    case 2:
      {
      int v183 = 84;
      int v184 = v183 + v65;
      int v185 = v64[v184];
      int v186 = 0;
      bool v187 = v185 != v186;
      int v188;
      if (v187) {
        int v189 = 88;
        int v190 = v189 + v65;
        int v191 = v64[v190];
        int v192;
        v192 = v65;
        switch (v191) {
          case 0:
            {
            v192 = v65;
            break;
          }
          case 1:
            {
            int v193 = 2;
            v192 = v193;
            break;
          }
          default:
            {
            v192 = v65;
            break;
          }
        }
        v188 = v192;
      } else {
        v188 = v65;
      }
      v93 = v188;
      break;
    }
  }
  int v194 = 3;
  int v195 = v65 + v194;
  int v196 = 92;
  int v197 = v196 + v65;
  int v198 = v64[v197];
  uint v199 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v200 = (int)(v199);
  int v201;
  v201 = v200;
  switch (v198) {
    default:
      {
      int v202 = 96;
      int v203 = v202 + v65;
      int v204 = v64[v203];
      int v205 = 0;
      bool v206 = v204 != v205;
      int v207;
      if (v206) {
        int v208 = 1;
        int v209 = v65 + v208;
        v207 = v209;
      } else {
        v207 = v65;
      }
      v201 = v207;
      break;
    }
    case 0:
      {
      int v210 = 2;
      int v211 = v65 + v210;
      v201 = v211;
      break;
    }
    case 1:
      {
      v201 = v65;
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
    static int32_t expected0[] = {};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 0; ++idx) {
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
