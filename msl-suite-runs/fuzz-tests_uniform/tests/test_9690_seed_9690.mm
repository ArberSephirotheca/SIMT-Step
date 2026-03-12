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
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 2;
        int v13 = v3 % v12;
        int v14 = 3;
        int v15;
        v15 = v14;
        switch (v13) {
          case 0:
            {
            int v16 = 3;
            int v17 = v0 + v16;
            v15 = v17;
            break;
          }
          default:
            {
            v15 = v0;
            break;
          }
        }
        int v18 = 2;
        int v19 = v0 + v18;
        v11 = v15;
      } else {
        int v20 = 2;
        v11 = v20;
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v21 = 0;
      bool v22 = v2 != v21;
      int v23;
      if (v22) {
        int v24 = 4;
        int v25 = v3 % v24;
        int v26;
        v26 = v0;
        switch (v25) {
          case 0:
            {
            int v27 = 3;
            v26 = v27;
            break;
          }
          case 1:
            {
            int v28 = 2;
            int v29 = v0 + v28;
            v26 = v29;
            break;
          }
          default:
            {
            v26 = v0;
            break;
          }
          case 2:
            {
            v26 = v0;
            break;
          }
        }
        int v30 = 0;
        int v31 = v0 + v30;
        v23 = v26;
      } else {
        int v32 = 2;
        int v33 = v3 % v32;
        int v34 = 3;
        int v35 = v0 + v34;
        int v36;
        v36 = v35;
        switch (v33) {
          case 0:
            {
            v36 = v0;
            break;
          }
          case 1:
            {
            v36 = v0;
            break;
          }
          default:
            {
            int v37 = 2;
            int v38 = v0 + v37;
            v36 = v38;
            break;
          }
        }
        int v39 = 2;
        v23 = v36;
      }
      int v40 = 2;
      v8 = v23;
      break;
    }
    default:
      {
      int v41 = 0;
      int v42 = 0;
      int v43;
      int v44;
      v43 = v41;
      v44 = v42;
      while (true) {
        int v45 = 4;
        int v46 = v3 % v45;
        int v47 = 1;
        int v48 = v46 + v47;
        bool v49 = v44 < v48;
        v43 = v43;
        v44 = v44;
        if (!v49) break;
        int v50 = 2;
        int v51 = 1;
        int v52 = v44 + v51;
        v43 = v50;
        v44 = v52;
      }
      int v53 = 1;
      v8 = v43;
      break;
    }
  }
  bool v54 = true;
  int v55 = simt_wave_count_bits(v54);
  int v56 = 0;
  int v57 = v56 + v0;
  v1[v57] = v55;
  return;
}

kernel void kernel_main(device int* v58 [[buffer(0)]], device int* v59 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v60 = static_cast<int>(__simt_tid3.x);
  int v61 = 0;
  int v62 = v61 + v60;
  int v63 = v59[v62];
  int v64 = 4;
  int v65 = v64 + v60;
  int v66 = v59[v65];
  helper0(v60, v58, v63, v66, static_cast<int>(__simt_tid3.x));
  int v67 = 8;
  int v68 = v67 + v60;
  int v69 = v59[v68];
  int v70 = 0;
  bool v71 = v69 != v70;
  int v72;
  if (v71) {
    int v73 = 0;
    int v74 = 0;
    int v75;
    int v76;
    v75 = v73;
    v76 = v74;
    while (true) {
      int v77 = 4;
      int v78 = v76 * v77;
      int v79 = v78 + v60;
      int v80 = 12;
      int v81 = v80 + v79;
      int v82 = v59[v81];
      int v83 = 0;
      bool v84 = v82 != v83;
      v75 = v75;
      v76 = v76;
      if (!v84) break;
      int v85 = 32;
      int v86 = v85 + v60;
      int v87 = v59[v86];
      int v88;
      v88 = v60;
      switch (v87) {
        case 0:
          {
          int v89 = 3;
          v88 = v89;
          break;
        }
        case 1:
          {
          int v90 = 4;
          int v91 = v60 + v90;
          v88 = v91;
          break;
        }
        default:
          {
          int v92 = 1;
          v88 = v92;
          break;
        }
      }
      bool v93 = true;
      int v94 = v75 + v88;
      int v95 = 1;
      int v96 = v76 + v95;
      v75 = v94;
      v76 = v96;
    }
    bool v97 = true;
    v72 = v75;
  } else {
    uint v98 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v99 = (int)(v98);
    v72 = v99;
  }
  int v100 = 16;
  int v101 = v100 + v60;
  bool v102 = true;
  int v103 = simt_wave_count_bits(v102);
  v58[v101] = v103;
  uint v104 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v105 = (int)(v104);
  int v106 = 36;
  int v107 = v106 + v60;
  int v108 = v59[v107];
  uint v109 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v110 = (int)(v109);
  int v111;
  v111 = v110;
  switch (v108) {
    case 0:
      {
      int v112 = 40;
      int v113 = v112 + v60;
      int v114 = v59[v113];
      int v115;
      v115 = v60;
      switch (v114) {
        case 0:
          {
          int v116 = 44;
          int v117 = v116 + v60;
          int v118 = v59[v117];
          int v119 = 0;
          bool v120 = v118 != v119;
          int v121;
          if (v120) {
            v121 = v60;
          } else {
            int v122 = 2;
            int v123 = v60 + v122;
            v121 = v123;
          }
          v115 = v121;
          break;
        }
        default:
          {
          int v124 = 3;
          int v125 = v60 + v124;
          v115 = v125;
          break;
        }
      }
      bool v126 = true;
      v111 = v115;
      break;
    }
    case 1:
      {
      int v127 = 48;
      int v128 = v127 + v60;
      int v129 = v59[v128];
      int v130 = 0;
      bool v131 = v129 != v130;
      int v132;
      if (v131) {
        int v133 = 0;
        int v134 = 0;
        int v135;
        int v136;
        v135 = v133;
        v136 = v134;
        while (true) {
          int v137 = 4;
          int v138 = v136 * v137;
          int v139 = v138 + v60;
          int v140 = 52;
          int v141 = v140 + v139;
          int v142 = v59[v141];
          int v143 = 0;
          bool v144 = v142 != v143;
          v135 = v135;
          v136 = v136;
          if (!v144) break;
          int v145 = v135 + v136;
          int v146 = 1;
          int v147 = v136 + v146;
          v135 = v145;
          v136 = v147;
        }
        bool v148 = true;
        v132 = v135;
      } else {
        int v149 = 0;
        int v150 = 0;
        int v151;
        int v152;
        v151 = v149;
        v152 = v150;
        while (true) {
          int v153 = 4;
          int v154 = v152 * v153;
          int v155 = v154 + v60;
          int v156 = 72;
          int v157 = v156 + v155;
          int v158 = v59[v157];
          int v159 = 0;
          bool v160 = v158 != v159;
          v151 = v151;
          v152 = v152;
          if (!v160) break;
          int v161 = v151 + v152;
          int v162 = 1;
          int v163 = v152 + v162;
          v151 = v161;
          v152 = v163;
        }
        bool v164 = true;
        v132 = v151;
      }
      v111 = v132;
      break;
    }
    default:
      {
      int v165 = 92;
      int v166 = v165 + v60;
      int v167 = v59[v166];
      int v168 = 0;
      bool v169 = v167 != v168;
      int v170;
      if (v169) {
        int v171 = 96;
        int v172 = v171 + v60;
        int v173 = v59[v172];
        int v174 = 1;
        int v175;
        v175 = v174;
        switch (v173) {
          case 0:
            {
            int v176 = 2;
            v175 = v176;
            break;
          }
          case 1:
            {
            v175 = v60;
            break;
          }
          case 2:
            {
            int v177 = 1;
            v175 = v177;
            break;
          }
          default:
            {
            v175 = v60;
            break;
          }
        }
        bool v178 = true;
        v170 = v175;
      } else {
        int v179 = 0;
        int v180 = 0;
        int v181;
        int v182;
        v181 = v179;
        v182 = v180;
        while (true) {
          int v183 = 4;
          int v184 = v182 * v183;
          int v185 = v184 + v60;
          int v186 = 100;
          int v187 = v186 + v185;
          int v188 = v59[v187];
          int v189 = 0;
          bool v190 = v188 != v189;
          v181 = v181;
          v182 = v182;
          if (!v190) break;
          int v191 = v181 + v182;
          int v192 = 1;
          int v193 = v182 + v192;
          v181 = v191;
          v182 = v193;
        }
        bool v194 = true;
        v170 = v181;
      }
      v111 = v170;
      break;
    }
  }
  bool v195 = true;
  int v196 = 32;
  int v197 = v196 + v60;
  bool v198 = true;
  int v199 = simt_wave_count_bits(v198);
  v58[v197] = v199;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
