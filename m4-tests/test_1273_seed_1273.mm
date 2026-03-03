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
  int v4 = 3;
  int v5 = v3 % v4;
  int v6 = 4;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 2;
        int v13 = v3 % v12;
        int v14 = 4;
        int v15;
        v15 = v14;
        switch (v13) {
          case 0:
            {
            int v16 = 1;
            int v17 = v0 + v16;
            v15 = v17;
            break;
          }
          default:
            {
            int v18 = 0;
            int v19 = v0 + v18;
            v15 = v19;
            break;
          }
        }
        int v20 = 3;
        v11 = v15;
      } else {
        int v21 = 2;
        int v22 = v3 % v21;
        int v23;
        v23 = v0;
        switch (v22) {
          default:
            {
            v23 = v0;
          }
          case 0:
            {
            int v24 = 2;
            int v25 = v0 + v24;
            v23 = v25;
          }
          case 1:
            {
            int v26 = 1;
            int v27 = v0 + v26;
            v23 = v27;
            break;
          }
        }
        v11 = v23;
      }
      v8 = v11;
      break;
    }
    default:
      {
      int v28 = 0;
      int v29 = 0;
      int v30;
      int v31;
      v30 = v28;
      v31 = v29;
      while (true) {
        int v32 = 4;
        int v33 = v3 % v32;
        int v34 = 1;
        int v35 = v33 + v34;
        bool v36 = v31 < v35;
        v30 = v30;
        v31 = v31;
        if (!v36) break;
        int v37 = 1;
        int v38 = v31 + v37;
        v30 = v0;
        v31 = v38;
      }
      v8 = v30;
    }
    case 1:
      {
      int v39 = 2;
      int v40 = v3 % v39;
      int v41;
      v41 = v0;
      switch (v40) {
        default:
          {
          int v42 = 0;
          bool v43 = v2 != v42;
          int v44;
          if (v43) {
            int v45 = 4;
            int v46 = v0 + v45;
            v44 = v46;
          } else {
            v44 = v0;
          }
          v41 = v44;
          break;
        }
        case 0:
          {
          int v47 = 0;
          int v48 = 0;
          int v49;
          int v50;
          v49 = v47;
          v50 = v48;
          while (true) {
            int v51 = 4;
            int v52 = v3 % v51;
            int v53 = 1;
            int v54 = v52 + v53;
            bool v55 = v50 < v54;
            v49 = v49;
            v50 = v50;
            if (!v55) break;
            int v56 = 0;
            int v57 = v0 + v56;
            int v58 = 1;
            int v59 = v50 + v58;
            v49 = v57;
            v50 = v59;
          }
          v41 = v49;
          break;
        }
        case 1:
          {
          int v60 = 4;
          int v61 = v0 + v60;
          int v62;
          v62 = v61;
          switch (v3) {
            default:
              {
              int v63 = 4;
              v62 = v63;
              break;
            }
            case 0:
              {
              v62 = v0;
              break;
            }
          }
          v41 = v62;
          break;
        }
      }
      v8 = v41;
      break;
    }
  }
  bool v64 = true;
  int v65 = simt_wave_count_bits(v64);
  int v66 = 0;
  int v67 = v66 + v0;
  v1[v67] = v65;
  return;
}

kernel void kernel_main(device int* v68 [[buffer(0)]], device int* v69 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v70 = static_cast<int>(__simt_tid3.x);
  int v71 = 0;
  int v72 = v71 + v70;
  int v73 = v69[v72];
  int v74 = 4;
  int v75 = v74 + v70;
  int v76 = v69[v75];
  helper0(v70, v68, v73, v76, static_cast<int>(__simt_tid3.x));
  int v77 = 8;
  int v78 = v77 + v70;
  int v79 = v69[v78];
  int v80 = 0;
  int v81;
  v81 = v80;
  switch (v79) {
    default:
      {
      int v82 = 12;
      int v83 = v82 + v70;
      int v84 = v69[v83];
      int v85;
      v85 = v70;
      switch (v84) {
        default:
          {
          int v86 = 3;
          v85 = v86;
          break;
        }
        case 0:
          {
          v85 = v70;
        }
        case 1:
          {
          int v87 = 0;
          int v88 = 0;
          int v89;
          int v90;
          v89 = v87;
          v90 = v88;
          while (true) {
            int v91 = 4;
            int v92 = v90 * v91;
            int v93 = v92 + v70;
            int v94 = 16;
            int v95 = v94 + v93;
            int v96 = v69[v95];
            int v97 = 0;
            bool v98 = v96 != v97;
            v89 = v89;
            v90 = v90;
            if (!v98) break;
            int v99 = v89 + v90;
            int v100 = 1;
            int v101 = v90 + v100;
            bool v102 = true;
            v89 = v99;
            v90 = v101;
            break;
            ;
          }
          v85 = v89;
          break;
        }
        case 2:
          {
          int v103 = 36;
          int v104 = v103 + v70;
          int v105 = v69[v104];
          int v106 = 0;
          bool v107 = v105 != v106;
          int v108;
          if (v107) {
            v108 = v70;
          } else {
            v108 = v70;
          }
          v85 = v108;
          break;
        }
      }
      bool v109 = true;
      v81 = v85;
      break;
    }
    case 0:
      {
      int v110 = 40;
      int v111 = v110 + v70;
      int v112 = v69[v111];
      int v113 = 0;
      bool v114 = v112 != v113;
      int v115;
      if (v114) {
        int v116 = 44;
        int v117 = v116 + v70;
        int v118 = v69[v117];
        int v119 = 0;
        bool v120 = v118 != v119;
        int v121;
        if (v120) {
          int v122 = 3;
          int v123 = v70 + v122;
          v121 = v123;
        } else {
          int v124 = 1;
          v121 = v124;
        }
        v115 = v121;
      } else {
        int v125 = 48;
        int v126 = v125 + v70;
        int v127 = v69[v126];
        int v128 = 0;
        bool v129 = v127 != v128;
        int v130;
        if (v129) {
          int v131 = 4;
          v130 = v131;
        } else {
          int v132 = 1;
          int v133 = v70 + v132;
          v130 = v133;
        }
        v115 = v130;
      }
      v81 = v115;
      break;
    }
  }
  int v134 = 52;
  int v135 = v134 + v70;
  int v136 = v69[v135];
  uint v137 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v138 = (int)(v137);
  int v139;
  v139 = v138;
  switch (v136) {
    default:
      {
      int v140 = 0;
      int v141 = 0;
      int v142;
      int v143;
      v142 = v140;
      v143 = v141;
      while (true) {
        int v144 = 4;
        int v145 = v143 * v144;
        int v146 = v145 + v70;
        int v147 = 56;
        int v148 = v147 + v146;
        int v149 = v69[v148];
        int v150 = 0;
        bool v151 = v149 != v150;
        v142 = v142;
        v143 = v143;
        if (!v151) break;
        int v152 = v142 + v143;
        int v153 = 1;
        int v154 = v143 + v153;
        bool v155 = true;
        v142 = v152;
        v143 = v154;
      }
      v139 = v142;
      break;
    }
    case 0:
      {
      v139 = v70;
      break;
    }
    case 1:
      {
      int v156 = 76;
      int v157 = v156 + v70;
      int v158 = v69[v157];
      int v159 = 0;
      bool v160 = v158 != v159;
      int v161;
      if (v160) {
        int v162 = 0;
        int v163 = 0;
        int v164;
        int v165;
        v164 = v162;
        v165 = v163;
        while (true) {
          int v166 = 4;
          int v167 = v165 * v166;
          int v168 = v167 + v70;
          int v169 = 80;
          int v170 = v169 + v168;
          int v171 = v69[v170];
          int v172 = 0;
          bool v173 = v171 != v172;
          v164 = v164;
          v165 = v165;
          if (!v173) break;
          int v174 = v164 + v165;
          int v175 = 1;
          int v176 = v165 + v175;
          bool v177 = true;
          v164 = v174;
          v165 = v176;
        }
        v161 = v164;
      } else {
        int v178 = 100;
        int v179 = v178 + v70;
        int v180 = v69[v179];
        int v181 = 0;
        bool v182 = v180 != v181;
        int v183;
        if (v182) {
          int v184 = 4;
          int v185 = v70 + v184;
          v183 = v185;
        } else {
          int v186 = 0;
          int v187 = v70 + v186;
          v183 = v187;
        }
        v161 = v183;
      }
      v139 = v161;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
