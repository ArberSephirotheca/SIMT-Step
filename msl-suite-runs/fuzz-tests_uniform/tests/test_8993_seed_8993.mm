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
  bool v6 = v2 != v5;
  int v7;
  if (v6) {
    int v8 = 0;
    bool v9 = v2 != v8;
    int v10;
    if (v9) {
      int v11 = 0;
      bool v12 = v2 != v11;
      int v13;
      if (v12) {
        v13 = v0;
      } else {
        int v14 = 3;
        v13 = v14;
      }
      uint v15 = simt_lane_id(__simt_tid);
      int v16 = (int)(v15);
      v10 = v13;
    } else {
      int v17 = 0;
      int v18 = 0;
      int v19;
      int v20;
      v19 = v17;
      v20 = v18;
      while (true) {
        int v21 = 4;
        int v22 = v3 % v21;
        int v23 = 1;
        int v24 = v22 + v23;
        bool v25 = v20 < v24;
        v19 = v19;
        v20 = v20;
        if (!v25) break;
        int v26 = 3;
        int v27 = v0 + v26;
        int v28 = 1;
        int v29 = v20 + v28;
        v19 = v27;
        v20 = v29;
      }
      int v30 = 0;
      int v31 = v0 + v30;
      v10 = v19;
    }
    uint v32 = simt_lane_id(__simt_tid);
    int v33 = (int)(v32);
    v7 = v10;
  } else {
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
      int v43 = 4;
      int v44 = v3 % v43;
      int v45;
      v45 = v0;
      switch (v44) {
        case 0:
          {
          int v46 = 4;
          v45 = v46;
          break;
        }
        case 1:
          {
          int v47 = 1;
          int v48 = v0 + v47;
          v45 = v48;
          break;
        }
        default:
          {
          int v49 = 3;
          v45 = v49;
          break;
        }
        case 2:
          {
          int v50 = 2;
          int v51 = v0 + v50;
          v45 = v51;
          break;
        }
      }
      int v52 = 2;
      int v53 = v0 + v52;
      int v54 = 1;
      int v55 = v37 + v54;
      v36 = v45;
      v37 = v55;
      continue;
      ;
    }
    uint v56 = simt_subgroup_id(__simt_tid);
    int v57 = (int)(v56);
    v7 = v36;
  }
  bool v58 = true;
  int v59 = simt_wave_count_bits(v58);
  int v60 = 0;
  int v61 = v60 + v0;
  v1[v61] = v59;
  int v62 = 0;
  bool v63 = v2 != v62;
  int v64 = v63 ? v4 : v7;
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
  int v74 = 0;
  int v75 = 0;
  int v76;
  int v77;
  v76 = v74;
  v77 = v75;
  while (true) {
    int v78 = 4;
    int v79 = v77 * v78;
    int v80 = v79 + v67;
    int v81 = 8;
    int v82 = v81 + v80;
    int v83 = v66[v82];
    int v84 = 0;
    bool v85 = v83 != v84;
    v76 = v76;
    v77 = v77;
    if (!v85) break;
    int v86 = 0;
    int v87 = 0;
    int v88;
    int v89;
    v88 = v86;
    v89 = v87;
    while (true) {
      int v90 = 4;
      int v91 = v89 * v90;
      int v92 = v91 + v67;
      int v93 = 28;
      int v94 = v93 + v92;
      int v95 = v66[v94];
      int v96 = 0;
      bool v97 = v95 != v96;
      v88 = v88;
      v89 = v89;
      if (!v97) break;
      int v98 = v88 + v89;
      int v99 = 1;
      int v100 = v89 + v99;
      v88 = v98;
      v89 = v100;
    }
    bool v101 = true;
    int v102 = v76 + v88;
    int v103 = 1;
    int v104 = v77 + v103;
    v76 = v102;
    v77 = v104;
  }
  bool v105 = true;
  int v106 = 16;
  int v107 = v106 + v67;
  bool v108 = true;
  int v109 = simt_wave_count_bits(v108);
  v65[v107] = v109;
  int v110 = 0;
  int v111 = 0;
  int v112;
  int v113;
  v112 = v110;
  v113 = v111;
  while (true) {
    int v114 = 4;
    int v115 = v113 * v114;
    int v116 = v115 + v67;
    int v117 = 48;
    int v118 = v117 + v116;
    int v119 = v66[v118];
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
  int v126 = 32;
  int v127 = v126 + v67;
  bool v128 = true;
  int v129 = simt_wave_count_bits(v128);
  v65[v127] = v129;
  int v130 = 68;
  int v131 = v130 + v67;
  int v132 = v66[v131];
  int v133 = 0;
  bool v134 = v132 != v133;
  int v135;
  if (v134) {
    uint v136 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v137 = (int)(v136);
    v135 = v137;
  } else {
    int v138 = 72;
    int v139 = v138 + v67;
    int v140 = v66[v139];
    uint v141 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v142 = (int)(v141);
    int v143;
    v143 = v142;
    switch (v140) {
      case 0:
        {
        int v144 = 0;
        int v145 = 0;
        int v146;
        int v147;
        v146 = v144;
        v147 = v145;
        while (true) {
          int v148 = 4;
          int v149 = v147 * v148;
          int v150 = v149 + v67;
          int v151 = 76;
          int v152 = v151 + v150;
          int v153 = v66[v152];
          int v154 = 0;
          bool v155 = v153 != v154;
          v146 = v146;
          v147 = v147;
          if (!v155) break;
          int v156 = v146 + v147;
          int v157 = 1;
          int v158 = v147 + v157;
          v146 = v156;
          v147 = v158;
        }
        bool v159 = true;
        v143 = v146;
        break;
      }
      case 1:
        {
        int v160 = 0;
        int v161 = 0;
        int v162;
        int v163;
        v162 = v160;
        v163 = v161;
        while (true) {
          int v164 = 4;
          int v165 = v163 * v164;
          int v166 = v165 + v67;
          int v167 = 96;
          int v168 = v167 + v166;
          int v169 = v66[v168];
          int v170 = 0;
          bool v171 = v169 != v170;
          v162 = v162;
          v163 = v163;
          if (!v171) break;
          int v172 = v162 + v163;
          int v173 = 1;
          int v174 = v163 + v173;
          v162 = v172;
          v163 = v174;
        }
        bool v175 = true;
        v143 = v162;
        break;
      }
      case 2:
        {
        int v176 = 116;
        int v177 = v176 + v67;
        int v178 = v66[v177];
        int v179 = 0;
        bool v180 = v178 != v179;
        int v181;
        if (v180) {
          v181 = v67;
        } else {
          v181 = v67;
        }
        v143 = v181;
        break;
      }
      default:
        {
        int v182 = 120;
        int v183 = v182 + v67;
        int v184 = v66[v183];
        int v185 = 0;
        bool v186 = v184 != v185;
        int v187;
        if (v186) {
          int v188 = 3;
          int v189 = v67 + v188;
          v187 = v189;
        } else {
          int v190 = 4;
          v187 = v190;
        }
        v143 = v187;
        break;
      }
    }
    bool v191 = true;
    v135 = v143;
  }
  int v192 = 48;
  int v193 = v192 + v67;
  bool v194 = true;
  int v195 = simt_wave_count_bits(v194);
  v65[v193] = v195;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 124; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
