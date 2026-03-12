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
    int v7 = 0;
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      int v16 = 0;
      bool v17 = v2 != v16;
      int v18;
      if (v17) {
        uint v19 = simt_lane_id(__simt_tid);
        int v20 = (int)(v19);
        v18 = v20;
      } else {
        int v21 = 4;
        v18 = v21;
      }
      int v22 = 2;
      int v23 = v0 + v22;
      int v24 = 1;
      int v25 = v10 + v24;
      v9 = v18;
      v10 = v25;
      continue;
      ;
    }
    uint v26 = simt_subgroup_id(__simt_tid);
    int v27 = (int)(v26);
    v6 = v9;
  } else {
    int v28 = 0;
    bool v29 = v2 != v28;
    int v30;
    if (v29) {
      int v31 = 2;
      int v32 = v3 % v31;
      int v33 = 4;
      int v34;
      v34 = v33;
      switch (v32) {
        case 0:
          {
          int v35 = 4;
          v34 = v35;
        }
        default:
          {
          int v36 = 2;
          int v37 = v0 + v36;
          v34 = v37;
        }
        case 1:
          {
          int v38 = 1;
          int v39 = v0 + v38;
          v34 = v39;
          break;
        }
      }
      uint v40 = simt_subgroup_id(__simt_tid);
      int v41 = (int)(v40);
      v30 = v34;
    } else {
      int v42 = 4;
      int v43 = v3 % v42;
      int v44 = 2;
      int v45 = v0 + v44;
      int v46;
      v46 = v45;
      switch (v43) {
        case 0:
          {
          int v47 = 4;
          int v48 = v0 + v47;
          v46 = v48;
          break;
        }
        case 1:
          {
          int v49 = 1;
          int v50 = v0 + v49;
          v46 = v50;
          break;
        }
        default:
          {
          int v51 = 2;
          v46 = v51;
          break;
        }
        case 2:
          {
          int v52 = 3;
          int v53 = v0 + v52;
          v46 = v53;
          break;
        }
      }
      uint v54 = simt_lane_id(__simt_tid);
      int v55 = (int)(v54);
      v30 = v46;
    }
    int v56 = 2;
    int v57 = v0 + v56;
    v6 = v30;
  }
  bool v58 = true;
  int v59 = simt_wave_count_bits(v58);
  int v60 = 0;
  int v61 = v60 + v0;
  v1[v61] = v59;
  int v62 = 0;
  bool v63 = v2 != v62;
  int v64 = v63 ? v0 : v6;
  return;
}

kernel void kernel_main(device int* v65 [[buffer(0)]], device int* v66 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v67 = static_cast<int>(__simt_tid3.x);
  int v68 = 0;
  int v69 = v68 + v67;
  int v70 = v66[v69];
  int v71 = 4;
  int v72 = v71 + v67;
  int v73 = v66[v72];
  helper0(v67, v65, v70, v73, static_cast<int>(__simt_tid3.x));
  int v74 = 8;
  int v75 = v74 + v67;
  int v76 = v66[v75];
  int v77 = 0;
  bool v78 = v76 != v77;
  int v79;
  if (v78) {
    int v80 = 12;
    int v81 = v80 + v67;
    int v82 = v66[v81];
    uint v83 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v84 = (int)(v83);
    int v85;
    v85 = v84;
    switch (v82) {
      case 0:
        {
        int v86 = 4;
        v85 = v86;
        break;
      }
      default:
        {
        int v87 = 16;
        int v88 = v87 + v67;
        int v89 = v66[v88];
        int v90 = 0;
        bool v91 = v89 != v90;
        int v92;
        if (v91) {
          int v93 = 1;
          v92 = v93;
        } else {
          v92 = v67;
        }
        v85 = v92;
        break;
      }
      case 1:
        {
        int v94 = 20;
        int v95 = v94 + v67;
        int v96 = v66[v95];
        int v97;
        v97 = v67;
        switch (v96) {
          case 0:
            {
            v97 = v67;
            break;
          }
          default:
            {
            int v98 = 2;
            v97 = v98;
            break;
          }
          case 1:
            {
            int v99 = 4;
            v97 = v99;
            break;
          }
        }
        bool v100 = true;
        v85 = v97;
        break;
      }
    }
    bool v101 = true;
    v79 = v85;
  } else {
    int v102 = 24;
    int v103 = v102 + v67;
    int v104 = v66[v103];
    uint v105 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v106 = (int)(v105);
    int v107;
    v107 = v106;
    switch (v104) {
      default:
        {
        int v108 = 28;
        int v109 = v108 + v67;
        int v110 = v66[v109];
        int v111 = 0;
        int v112;
        v112 = v111;
        switch (v110) {
          case 0:
            {
            v112 = v67;
            break;
          }
          case 1:
            {
            v112 = v67;
            break;
          }
          default:
            {
            int v113 = 4;
            int v114 = v67 + v113;
            v112 = v114;
            break;
          }
          case 2:
            {
            int v115 = 4;
            v112 = v115;
            break;
          }
        }
        bool v116 = true;
        v107 = v112;
      }
      case 0:
        {
        int v117 = 0;
        int v118 = 0;
        int v119;
        int v120;
        v119 = v117;
        v120 = v118;
        while (true) {
          int v121 = 4;
          int v122 = v120 * v121;
          int v123 = v122 + v67;
          int v124 = 32;
          int v125 = v124 + v123;
          int v126 = v66[v125];
          int v127 = 0;
          bool v128 = v126 != v127;
          v119 = v119;
          v120 = v120;
          if (!v128) break;
          int v129 = v119 + v120;
          int v130 = 1;
          int v131 = v120 + v130;
          v119 = v129;
          v120 = v131;
          break;
          ;
        }
        bool v132 = true;
        v107 = v119;
      }
      case 1:
        {
        int v133 = 52;
        int v134 = v133 + v67;
        int v135 = v66[v134];
        int v136 = 2;
        int v137;
        v137 = v136;
        switch (v135) {
          case 0:
            {
            int v138 = 1;
            v137 = v138;
            break;
          }
          default:
            {
            int v139 = 0;
            v137 = v139;
            break;
          }
        }
        bool v140 = true;
        v107 = v137;
        break;
      }
    }
    bool v141 = true;
    v79 = v107;
  }
  int v142 = 16;
  int v143 = v142 + v67;
  bool v144 = true;
  int v145 = simt_wave_count_bits(v144);
  v65[v143] = v145;
  int v146 = 56;
  int v147 = v146 + v67;
  int v148 = v66[v147];
  int v149 = 0;
  bool v150 = v148 != v149;
  int v151;
  if (v150) {
    int v152 = 60;
    int v153 = v152 + v67;
    int v154 = v66[v153];
    int v155 = 0;
    int v156 = v67 + v155;
    int v157;
    v157 = v156;
    switch (v154) {
      case 0:
        {
        int v158 = 64;
        int v159 = v158 + v67;
        int v160 = v66[v159];
        int v161;
        v161 = v67;
        switch (v160) {
          default:
            {
            int v162 = 0;
            int v163 = v67 + v162;
            v161 = v163;
          }
          case 0:
            {
            int v164 = 4;
            v161 = v164;
            break;
          }
        }
        bool v165 = true;
        v157 = v161;
      }
      default:
        {
        int v166 = 68;
        int v167 = v166 + v67;
        int v168 = v66[v167];
        int v169;
        v169 = v67;
        switch (v168) {
          case 0:
            {
            int v170 = 1;
            int v171 = v67 + v170;
            v169 = v171;
            break;
          }
          case 1:
            {
            int v172 = 3;
            v169 = v172;
            break;
          }
          default:
            {
            int v173 = 0;
            v169 = v173;
            break;
          }
          case 2:
            {
            v169 = v67;
            break;
          }
        }
        bool v174 = true;
        v157 = v169;
        break;
      }
    }
    bool v175 = true;
    v151 = v157;
  } else {
    int v176 = 72;
    int v177 = v176 + v67;
    int v178 = v66[v177];
    uint v179 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v180 = (int)(v179);
    int v181;
    v181 = v180;
    switch (v178) {
      case 0:
        {
        int v182 = 0;
        int v183 = 0;
        int v184;
        int v185;
        v184 = v182;
        v185 = v183;
        while (true) {
          int v186 = 4;
          int v187 = v185 * v186;
          int v188 = v187 + v67;
          int v189 = 76;
          int v190 = v189 + v188;
          int v191 = v66[v190];
          int v192 = 0;
          bool v193 = v191 != v192;
          v184 = v184;
          v185 = v185;
          if (!v193) break;
          int v194 = v184 + v185;
          int v195 = 1;
          int v196 = v185 + v195;
          v184 = v194;
          v185 = v196;
        }
        bool v197 = true;
        v181 = v184;
        break;
      }
      default:
        {
        int v198 = 3;
        int v199 = v67 + v198;
        v181 = v199;
        break;
      }
      case 1:
        {
        int v200 = 96;
        int v201 = v200 + v67;
        int v202 = v66[v201];
        int v203 = 0;
        bool v204 = v202 != v203;
        int v205;
        if (v204) {
          v205 = v67;
        } else {
          v205 = v67;
        }
        v181 = v205;
        break;
      }
    }
    bool v206 = true;
    v151 = v181;
  }
  int v207 = 32;
  int v208 = v207 + v67;
  bool v209 = true;
  int v210 = simt_wave_count_bits(v209);
  v65[v208] = v210;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
