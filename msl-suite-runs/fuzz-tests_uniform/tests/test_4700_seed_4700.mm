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
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      case 0:
        {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          int v15 = 0;
          v14 = v15;
        } else {
          int v16 = 3;
          v14 = v16;
        }
        int v17 = 4;
        int v18 = v0 + v17;
        v11 = v14;
      }
      default:
        {
        int v19 = 0;
        int v20 = 0;
        int v21;
        int v22;
        v21 = v19;
        v22 = v20;
        while (true) {
          int v23 = 4;
          int v24 = v3 % v23;
          int v25 = 1;
          int v26 = v24 + v25;
          bool v27 = v22 < v26;
          v21 = v21;
          v22 = v22;
          if (!v27) break;
          int v28 = 2;
          int v29 = v0 + v28;
          int v30 = 1;
          int v31 = v22 + v30;
          v21 = v29;
          v22 = v31;
          continue;
          ;
        }
        int v32 = 2;
        v11 = v21;
        break;
      }
      case 1:
        {
        int v33 = 3;
        int v34 = v3 % v33;
        int v35 = 0;
        int v36;
        v36 = v35;
        switch (v34) {
          case 0:
            {
            v36 = v0;
            break;
          }
          case 1:
            {
            int v37 = 2;
            v36 = v37;
          }
          default:
            {
            int v38 = 3;
            v36 = v38;
            break;
          }
        }
        int v39 = 4;
        int v40 = v0 + v39;
        v11 = v36;
        break;
      }
    }
    v6 = v11;
  } else {
    int v41 = 2;
    int v42 = v3 % v41;
    int v43 = 3;
    int v44 = v0 + v43;
    int v45;
    v45 = v44;
    switch (v42) {
      case 0:
        {
        int v46 = 2;
        int v47 = v3 % v46;
        int v48;
        v48 = v0;
        switch (v47) {
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
        }
        int v49 = 1;
        int v50 = v0 + v49;
        v45 = v48;
        break;
      }
      case 1:
        {
        int v51 = 0;
        bool v52 = v2 != v51;
        int v53;
        if (v52) {
          int v54 = 0;
          v53 = v54;
        } else {
          v53 = v0;
        }
        v45 = v53;
        break;
      }
      default:
        {
        int v55 = 0;
        bool v56 = v2 != v55;
        int v57;
        if (v56) {
          int v58 = 2;
          int v59 = v0 + v58;
          v57 = v59;
        } else {
          int v60 = 2;
          v57 = v60;
        }
        int v61 = 1;
        v45 = v57;
        break;
      }
    }
    int v62 = 3;
    v6 = v45;
  }
  bool v63 = true;
  int v64 = simt_wave_count_bits(v63);
  int v65 = 0;
  int v66 = v65 + v0;
  v1[v66] = v64;
  return;
}

kernel void kernel_main(device int* v67 [[buffer(0)]], device int* v68 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v69 = static_cast<int>(__simt_tid3.x);
  int v70 = 0;
  int v71 = v70 + v69;
  int v72 = v68[v71];
  int v73 = 4;
  int v74 = v73 + v69;
  int v75 = v68[v74];
  helper0(v69, v67, v72, v75, static_cast<int>(__simt_tid3.x));
  int v76 = 8;
  int v77 = v76 + v69;
  int v78 = v68[v77];
  int v79;
  v79 = v69;
  switch (v78) {
    default:
      {
      v79 = v69;
      break;
    }
    case 0:
      {
      int v80 = 12;
      int v81 = v80 + v69;
      int v82 = v68[v81];
      int v83 = 0;
      bool v84 = v82 != v83;
      int v85;
      if (v84) {
        int v86 = 16;
        int v87 = v86 + v69;
        int v88 = v68[v87];
        int v89 = 0;
        bool v90 = v88 != v89;
        int v91;
        if (v90) {
          int v92 = 1;
          v91 = v92;
        } else {
          int v93 = 4;
          int v94 = v69 + v93;
          v91 = v94;
        }
        v85 = v91;
      } else {
        int v95 = 20;
        int v96 = v95 + v69;
        int v97 = v68[v96];
        int v98 = 2;
        int v99 = v69 + v98;
        int v100;
        v100 = v99;
        switch (v97) {
          case 0:
            {
            int v101 = 1;
            v100 = v101;
            break;
          }
          case 1:
            {
            v100 = v69;
            break;
          }
          case 2:
            {
            int v102 = 1;
            v100 = v102;
            break;
          }
          default:
            {
            v100 = v69;
            break;
          }
        }
        bool v103 = true;
        v85 = v100;
      }
      v79 = v85;
      break;
    }
    case 1:
      {
      int v104 = 24;
      int v105 = v104 + v69;
      int v106 = v68[v105];
      int v107 = 0;
      bool v108 = v106 != v107;
      int v109;
      if (v108) {
        int v110 = 28;
        int v111 = v110 + v69;
        int v112 = v68[v111];
        int v113 = 0;
        bool v114 = v112 != v113;
        int v115;
        if (v114) {
          int v116 = 3;
          v115 = v116;
        } else {
          v115 = v69;
        }
        v109 = v115;
      } else {
        int v117 = 32;
        int v118 = v117 + v69;
        int v119 = v68[v118];
        int v120 = 0;
        int v121 = v69 + v120;
        int v122;
        v122 = v121;
        switch (v119) {
          case 0:
            {
            int v123 = 3;
            v122 = v123;
            break;
          }
          case 1:
            {
            int v124 = 0;
            v122 = v124;
            break;
          }
          default:
            {
            v122 = v69;
          }
          case 2:
            {
            int v125 = 0;
            int v126 = v69 + v125;
            v122 = v126;
            break;
          }
        }
        bool v127 = true;
        v109 = v122;
      }
      v79 = v109;
      break;
    }
  }
  bool v128 = true;
  int v129 = 16;
  int v130 = v129 + v69;
  bool v131 = true;
  int v132 = simt_wave_count_bits(v131);
  v67[v130] = v132;
  int v133 = 36;
  int v134 = v133 + v69;
  int v135 = v68[v134];
  uint v136 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v137 = (int)(v136);
  int v138;
  v138 = v137;
  switch (v135) {
    case 0:
      {
      int v139 = 40;
      int v140 = v139 + v69;
      int v141 = v68[v140];
      int v142;
      v142 = v69;
      switch (v141) {
        case 0:
          {
          int v143 = 44;
          int v144 = v143 + v69;
          int v145 = v68[v144];
          int v146 = 0;
          bool v147 = v145 != v146;
          int v148;
          if (v147) {
            int v149 = 2;
            int v150 = v69 + v149;
            v148 = v150;
          } else {
            int v151 = 0;
            int v152 = v69 + v151;
            v148 = v152;
          }
          v142 = v148;
        }
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
            int v159 = v158 + v69;
            int v160 = 48;
            int v161 = v160 + v159;
            int v162 = v68[v161];
            int v163 = 0;
            bool v164 = v162 != v163;
            v155 = v155;
            v156 = v156;
            if (!v164) break;
            int v165 = v155 + v156;
            int v166 = 1;
            int v167 = v156 + v166;
            v155 = v165;
            v156 = v167;
          }
          bool v168 = true;
          v142 = v155;
          break;
        }
      }
      bool v169 = true;
      v138 = v142;
      break;
    }
    case 1:
      {
      int v170 = 68;
      int v171 = v170 + v69;
      int v172 = v68[v171];
      int v173 = 0;
      bool v174 = v172 != v173;
      int v175;
      if (v174) {
        int v176 = 72;
        int v177 = v176 + v69;
        int v178 = v68[v177];
        int v179 = 0;
        bool v180 = v178 != v179;
        int v181;
        if (v180) {
          int v182 = 3;
          v181 = v182;
        } else {
          int v183 = 4;
          v181 = v183;
        }
        v175 = v181;
      } else {
        int v184 = 76;
        int v185 = v184 + v69;
        int v186 = v68[v185];
        int v187;
        v187 = v69;
        switch (v186) {
          default:
            {
            int v188 = 3;
            int v189 = v69 + v188;
            v187 = v189;
          }
          case 0:
            {
            v187 = v69;
          }
          case 1:
            {
            int v190 = 0;
            v187 = v190;
            break;
          }
          case 2:
            {
            int v191 = 0;
            v187 = v191;
            break;
          }
        }
        bool v192 = true;
        v175 = v187;
      }
      v138 = v175;
    }
    default:
      {
      int v193 = 80;
      int v194 = v193 + v69;
      int v195 = v68[v194];
      int v196 = 0;
      bool v197 = v195 != v196;
      int v198;
      if (v197) {
        int v199 = 84;
        int v200 = v199 + v69;
        int v201 = v68[v200];
        int v202 = 0;
        bool v203 = v201 != v202;
        int v204;
        if (v203) {
          v204 = v69;
        } else {
          v204 = v69;
        }
        v198 = v204;
      } else {
        int v205 = 88;
        int v206 = v205 + v69;
        int v207 = v68[v206];
        int v208;
        v208 = v69;
        switch (v207) {
          case 0:
            {
            v208 = v69;
            break;
          }
          default:
            {
            v208 = v69;
            break;
          }
        }
        bool v209 = true;
        v198 = v208;
      }
      v138 = v198;
      break;
    }
  }
  bool v210 = true;
  int v211 = 32;
  int v212 = v211 + v69;
  bool v213 = true;
  int v214 = simt_wave_count_bits(v213);
  v67[v212] = v214;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 92; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
