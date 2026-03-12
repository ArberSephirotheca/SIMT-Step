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
  int v4 = 2;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 1;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        default:
          {
          int v14 = 0;
          bool v15 = v2 != v14;
          int v16;
          if (v15) {
            int v17 = 3;
            int v18 = v0 + v17;
            v16 = v18;
          } else {
            int v19 = 2;
            int v20 = v0 + v19;
            v16 = v20;
          }
          int v21 = 2;
          int v22 = v0 + v21;
          v13 = v16;
          break;
        }
        case 0:
          {
          int v23 = 4;
          int v24 = v0 + v23;
          v13 = v24;
          break;
        }
        case 1:
          {
          int v25 = 3;
          int v26 = v3 % v25;
          int v27;
          v27 = v0;
          switch (v26) {
            case 0:
              {
              int v28 = 2;
              int v29 = v0 + v28;
              v27 = v29;
              break;
            }
            default:
              {
              v27 = v0;
              break;
            }
            case 1:
              {
              int v30 = 4;
              int v31 = v0 + v30;
              v27 = v31;
              break;
            }
          }
          int v32 = 3;
          int v33 = v0 + v32;
          v13 = v27;
          break;
        }
      }
      int v34 = 0;
      v8 = v13;
      break;
    }
    case 0:
      {
      int v35 = 0;
      int v36 = 0;
      int v37;
      int v38;
      v37 = v35;
      v38 = v36;
      while (true) {
        int v39 = 4;
        int v40 = v3 % v39;
        int v41 = 1;
        int v42 = v40 + v41;
        bool v43 = v38 < v42;
        v37 = v37;
        v38 = v38;
        if (!v43) break;
        int v44 = 0;
        int v45 = 0;
        int v46;
        int v47;
        v46 = v44;
        v47 = v45;
        while (true) {
          int v48 = 4;
          int v49 = v3 % v48;
          int v50 = 1;
          int v51 = v49 + v50;
          bool v52 = v47 < v51;
          v46 = v46;
          v47 = v47;
          if (!v52) break;
          int v53 = 1;
          int v54 = v47 + v53;
          v46 = v0;
          v47 = v54;
        }
        int v55 = 1;
        int v56 = v0 + v55;
        int v57 = 1;
        int v58 = v38 + v57;
        v37 = v46;
        v38 = v58;
        break;
        ;
      }
      int v59 = 4;
      int v60 = v0 + v59;
      v8 = v37;
      break;
    }
    case 1:
      {
      int v61 = 0;
      bool v62 = v2 != v61;
      int v63;
      if (v62) {
        int v64 = 0;
        int v65 = 0;
        int v66;
        int v67;
        v66 = v64;
        v67 = v65;
        while (true) {
          int v68 = 4;
          int v69 = v3 % v68;
          int v70 = 1;
          int v71 = v69 + v70;
          bool v72 = v67 < v71;
          v66 = v66;
          v67 = v67;
          if (!v72) break;
          int v73 = 0;
          int v74 = v0 + v73;
          int v75 = 1;
          int v76 = v67 + v75;
          v66 = v74;
          v67 = v76;
          break;
          ;
        }
        int v77 = 0;
        v63 = v66;
      } else {
        int v78 = 0;
        bool v79 = v2 != v78;
        int v80;
        if (v79) {
          int v81 = 2;
          v80 = v81;
        } else {
          int v82 = 4;
          v80 = v82;
        }
        v63 = v80;
      }
      int v83 = 3;
      v8 = v63;
      break;
    }
  }
  bool v84 = true;
  int v85 = simt_wave_count_bits(v84);
  int v86 = 0;
  int v87 = v86 + v0;
  v1[v87] = v85;
  return;
}

kernel void kernel_main(device int* v88 [[buffer(0)]], device int* v89 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v90 = static_cast<int>(__simt_tid3.x);
  int v91 = 0;
  int v92 = v91 + v90;
  int v93 = v89[v92];
  int v94 = 4;
  int v95 = v94 + v90;
  int v96 = v89[v95];
  helper0(v90, v88, v93, v96, static_cast<int>(__simt_tid3.x));
  int v97 = 8;
  int v98 = v97 + v90;
  int v99 = v89[v98];
  int v100 = 0;
  bool v101 = v99 != v100;
  int v102;
  if (v101) {
    uint v103 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v104 = (int)(v103);
    v102 = v104;
  } else {
    int v105 = 12;
    int v106 = v105 + v90;
    int v107 = v89[v106];
    int v108 = 0;
    bool v109 = v107 != v108;
    int v110;
    if (v109) {
      int v111 = 0;
      int v112 = 0;
      int v113;
      int v114;
      v113 = v111;
      v114 = v112;
      while (true) {
        int v115 = 4;
        int v116 = v114 * v115;
        int v117 = v116 + v90;
        int v118 = 16;
        int v119 = v118 + v117;
        int v120 = v89[v119];
        int v121 = 0;
        bool v122 = v120 != v121;
        v113 = v113;
        v114 = v114;
        if (!v122) break;
        int v123 = v113 + v114;
        int v124 = 1;
        int v125 = v114 + v124;
        v113 = v123;
        v114 = v125;
      }
      bool v126 = true;
      v110 = v113;
    } else {
      int v127 = 36;
      int v128 = v127 + v90;
      int v129 = v89[v128];
      int v130 = 0;
      int v131;
      v131 = v130;
      switch (v129) {
        case 0:
          {
          int v132 = 2;
          v131 = v132;
        }
        case 1:
          {
          v131 = v90;
          break;
        }
        default:
          {
          int v133 = 1;
          v131 = v133;
          break;
        }
      }
      bool v134 = true;
      v110 = v131;
    }
    v102 = v110;
  }
  int v135 = 16;
  int v136 = v135 + v90;
  bool v137 = true;
  int v138 = simt_wave_count_bits(v137);
  v88[v136] = v138;
  int v139 = 0;
  int v140 = 0;
  int v141;
  int v142;
  v141 = v139;
  v142 = v140;
  while (true) {
    int v143 = 4;
    int v144 = v142 * v143;
    int v145 = v144 + v90;
    int v146 = 40;
    int v147 = v146 + v145;
    int v148 = v89[v147];
    int v149 = 0;
    bool v150 = v148 != v149;
    v141 = v141;
    v142 = v142;
    if (!v150) break;
    int v151 = 60;
    int v152 = v151 + v90;
    int v153 = v89[v152];
    int v154 = 0;
    bool v155 = v153 != v154;
    int v156;
    if (v155) {
      int v157 = 64;
      int v158 = v157 + v90;
      int v159 = v89[v158];
      int v160 = 0;
      bool v161 = v159 != v160;
      int v162;
      if (v161) {
        uint v163 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v164 = (int)(v163);
        v162 = v164;
      } else {
        uint v165 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v166 = (int)(v165);
        v162 = v166;
      }
      v156 = v162;
    } else {
      int v167 = 68;
      int v168 = v167 + v90;
      int v169 = v89[v168];
      uint v170 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v171 = (int)(v170);
      int v172;
      v172 = v171;
      switch (v169) {
        default:
          {
          int v173 = 3;
          int v174 = v90 + v173;
          v172 = v174;
          break;
        }
        case 0:
          {
          int v175 = 1;
          v172 = v175;
          break;
        }
      }
      bool v176 = true;
      v156 = v172;
    }
    int v177 = v141 + v156;
    int v178 = 1;
    int v179 = v142 + v178;
    v141 = v177;
    v142 = v179;
  }
  bool v180 = true;
  int v181 = 32;
  int v182 = v181 + v90;
  bool v183 = true;
  int v184 = simt_wave_count_bits(v183);
  v88[v182] = v184;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
