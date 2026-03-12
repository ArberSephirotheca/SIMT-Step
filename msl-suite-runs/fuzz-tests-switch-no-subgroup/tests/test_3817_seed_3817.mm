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
  int v9 = 0;
  int v10;
  int v11;
  v10 = v8;
  v11 = v9;
  while (true) {
    int v12 = 4;
    int v13 = v3 % v12;
    int v14 = 1;
    int v15 = v13 + v14;
    bool v16 = v11 < v15;
    v10 = v10;
    v11 = v11;
    if (!v16) break;
    int v17 = 3;
    int v18 = v3 % v17;
    int v19;
    v19 = v0;
    switch (v18) {
      default:
        {
        int v20 = 2;
        int v21 = v3 % v20;
        int v22;
        v22 = v0;
        switch (v21) {
          default:
            {
            int v23 = 2;
            v22 = v23;
            break;
          }
          case 0:
            {
            int v24 = 4;
            int v25 = v0 + v24;
            v22 = v25;
            break;
          }
          case 1:
            {
            v22 = v0;
            break;
          }
        }
        v19 = v22;
        break;
      }
      case 0:
        {
        int v26 = 0;
        int v27 = 0;
        int v28;
        int v29;
        v28 = v26;
        v29 = v27;
        while (true) {
          int v30 = 4;
          int v31 = v3 % v30;
          int v32 = 1;
          int v33 = v31 + v32;
          bool v34 = v29 < v33;
          v28 = v28;
          v29 = v29;
          if (!v34) break;
          int v35 = 1;
          int v36 = v0 + v35;
          int v37 = 1;
          int v38 = v29 + v37;
          v28 = v36;
          v29 = v38;
        }
        v19 = v28;
      }
      case 1:
        {
        v19 = v0;
        break;
      }
    }
    bool v39 = true;
    int v40 = simt_wave_count_bits(v39);
    int v41 = 16;
    int v42 = 4;
    int v43 = v11 * v42;
    int v44 = v41 + v43;
    int v45 = v44 + v0;
    v1[v45] = v40;
    int v46 = 1;
    int v47 = v11 + v46;
    v10 = v19;
    v11 = v47;
  }
  int v48 = 0;
  bool v49 = v2 != v48;
  int v50 = v49 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v51 [[buffer(0)]], device int* v52 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v53 = static_cast<int>(__simt_tid3.x);
  int v54 = 0;
  int v55 = v54 + v53;
  int v56 = v52[v55];
  int v57 = 4;
  int v58 = v57 + v53;
  int v59 = v52[v58];
  helper0(v53, v51, v56, v59, static_cast<int>(__simt_tid3.x));
  int v60 = 8;
  int v61 = v60 + v53;
  int v62 = v52[v61];
  int v63 = 3;
  int v64 = v53 + v63;
  int v65;
  v65 = v64;
  switch (v62) {
    case 0:
      {
      int v66 = 12;
      int v67 = v66 + v53;
      int v68 = v52[v67];
      int v69;
      v69 = v53;
      switch (v68) {
        case 0:
          {
          int v70 = 16;
          int v71 = v70 + v53;
          int v72 = v52[v71];
          int v73 = 0;
          bool v74 = v72 != v73;
          int v75;
          if (v74) {
            int v76 = 3;
            int v77 = v53 + v76;
            v75 = v77;
          } else {
            int v78 = 1;
            v75 = v78;
          }
          v69 = v75;
        }
        case 1:
          {
          int v79 = 20;
          int v80 = v79 + v53;
          int v81 = v52[v80];
          int v82 = 3;
          int v83 = v53 + v82;
          int v84;
          v84 = v83;
          switch (v81) {
            case 0:
              {
              v84 = v53;
              break;
            }
            case 1:
              {
              v84 = v53;
              break;
            }
            case 2:
              {
              int v85 = 2;
              v84 = v85;
              break;
            }
            default:
              {
              int v86 = 0;
              v84 = v86;
              break;
            }
          }
          v69 = v84;
          break;
        }
        default:
          {
          int v87 = 24;
          int v88 = v87 + v53;
          int v89 = v52[v88];
          int v90 = 0;
          bool v91 = v89 != v90;
          int v92;
          if (v91) {
            int v93 = 1;
            v92 = v93;
          } else {
            int v94 = 3;
            v92 = v94;
          }
          v69 = v92;
          break;
        }
      }
      v65 = v69;
      break;
    }
    default:
      {
      int v95 = 28;
      int v96 = v95 + v53;
      int v97 = v52[v96];
      int v98 = 2;
      int v99;
      v99 = v98;
      switch (v97) {
        default:
          {
          int v100 = 32;
          int v101 = v100 + v53;
          int v102 = v52[v101];
          int v103 = 4;
          int v104;
          v104 = v103;
          switch (v102) {
            case 0:
              {
              v104 = v53;
              break;
            }
            case 1:
              {
              int v105 = 4;
              int v106 = v53 + v105;
              v104 = v106;
              break;
            }
            default:
              {
              int v107 = 2;
              int v108 = v53 + v107;
              v104 = v108;
              break;
            }
          }
          bool v109 = true;
          v99 = v104;
          break;
        }
        case 0:
          {
          int v110 = 36;
          int v111 = v110 + v53;
          int v112 = v52[v111];
          int v113 = 4;
          int v114;
          v114 = v113;
          switch (v112) {
            default:
              {
              int v115 = 0;
              int v116 = v53 + v115;
              v114 = v116;
              break;
            }
            case 0:
              {
              int v117 = 1;
              int v118 = v53 + v117;
              v114 = v118;
            }
            case 1:
              {
              v114 = v53;
              break;
            }
          }
          v99 = v114;
          break;
        }
      }
      v65 = v99;
      break;
    }
    case 1:
      {
      int v119 = 0;
      int v120 = 0;
      int v121;
      int v122;
      v121 = v119;
      v122 = v120;
      while (true) {
        int v123 = 4;
        int v124 = v122 * v123;
        int v125 = v124 + v53;
        int v126 = 40;
        int v127 = v126 + v125;
        int v128 = v52[v127];
        int v129 = 0;
        bool v130 = v128 != v129;
        v121 = v121;
        v122 = v122;
        if (!v130) break;
        int v131 = 60;
        int v132 = v131 + v53;
        int v133 = v52[v132];
        int v134 = 2;
        int v135 = v53 + v134;
        int v136;
        v136 = v135;
        switch (v133) {
          case 0:
            {
            int v137 = 3;
            int v138 = v53 + v137;
            v136 = v138;
            break;
          }
          default:
            {
            int v139 = 2;
            v136 = v139;
            break;
          }
        }
        int v140 = v121 + v136;
        int v141 = 1;
        int v142 = v122 + v141;
        bool v143 = true;
        v121 = v140;
        v122 = v142;
      }
      v65 = v121;
      break;
    }
  }
  int v144 = 64;
  int v145 = v144 + v53;
  int v146 = v52[v145];
  int v147 = 0;
  bool v148 = v146 != v147;
  int v149;
  if (v148) {
    int v150 = 68;
    int v151 = v150 + v53;
    int v152 = v52[v151];
    int v153 = 0;
    bool v154 = v152 != v153;
    int v155;
    if (v154) {
      int v156 = 72;
      int v157 = v156 + v53;
      int v158 = v52[v157];
      int v159 = 0;
      bool v160 = v158 != v159;
      int v161;
      if (v160) {
        uint v162 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v163 = (int)(v162);
        v161 = v163;
      } else {
        int v164 = 0;
        int v165 = v53 + v164;
        v161 = v165;
      }
      int v166 = 32;
      int v167 = v166 + v53;
      bool v168 = true;
      int v169 = simt_wave_count_bits(v168);
      v51[v167] = v169;
      v155 = v161;
    } else {
      int v170 = 76;
      int v171 = v170 + v53;
      int v172 = v52[v171];
      int v173 = 0;
      bool v174 = v172 != v173;
      int v175;
      if (v174) {
        int v176 = 2;
        int v177 = v53 + v176;
        v175 = v177;
      } else {
        uint v178 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v179 = (int)(v178);
        v175 = v179;
      }
      int v180 = 48;
      int v181 = v180 + v53;
      bool v182 = true;
      int v183 = simt_wave_count_bits(v182);
      v51[v181] = v183;
      v155 = v175;
    }
    int v184 = 64;
    int v185 = v184 + v53;
    bool v186 = true;
    int v187 = simt_wave_count_bits(v186);
    v51[v185] = v187;
    v149 = v155;
  } else {
    int v188 = 3;
    int v189 = v53 + v188;
    v149 = v189;
  }
  int v190 = 80;
  int v191 = v190 + v53;
  bool v192 = true;
  int v193 = simt_wave_count_bits(v192);
  v51[v191] = v193;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
