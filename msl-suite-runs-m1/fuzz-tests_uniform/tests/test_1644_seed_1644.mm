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
  int v6 = 1;
  int v7;
  v7 = v6;
  switch (v5) {
    default:
      {
      int v8 = 2;
      int v9 = v3 % v8;
      int v10;
      v10 = v0;
      switch (v9) {
        default:
          {
          int v11 = 0;
          bool v12 = v2 != v11;
          int v13;
          if (v12) {
            v13 = v0;
          } else {
            int v14 = 3;
            v13 = v14;
          }
          v10 = v13;
          break;
        }
        case 0:
          {
          int v15 = 3;
          int v16 = v3 % v15;
          int v17 = 0;
          int v18 = v0 + v17;
          int v19;
          v19 = v18;
          switch (v16) {
            default:
              {
              int v20 = 3;
              int v21 = v0 + v20;
              v19 = v21;
              break;
            }
            case 0:
              {
              int v22 = 4;
              v19 = v22;
              break;
            }
            case 1:
              {
              int v23 = 1;
              int v24 = v0 + v23;
              v19 = v24;
            }
            case 2:
              {
              int v25 = 2;
              int v26 = v0 + v25;
              v19 = v26;
              break;
            }
          }
          int v27 = 4;
          v10 = v19;
          break;
        }
        case 1:
          {
          int v28 = 4;
          int v29;
          v29 = v28;
          switch (v3) {
            case 0:
              {
              int v30 = 3;
              v29 = v30;
              break;
            }
            default:
              {
              v29 = v0;
              break;
            }
          }
          int v31 = 0;
          int v32 = v0 + v31;
          v10 = v29;
          break;
        }
      }
      int v33 = 3;
      int v34 = v0 + v33;
      v7 = v10;
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
        int v44 = 4;
        int v45 = 1;
        int v46 = v38 + v45;
        v37 = v44;
        v38 = v46;
      }
      v7 = v37;
    }
    case 1:
      {
      int v47 = 3;
      int v48 = v3 % v47;
      int v49 = 3;
      int v50;
      v50 = v49;
      switch (v48) {
        case 0:
          {
          int v51 = 4;
          int v52 = v3 % v51;
          int v53 = 0;
          int v54 = v0 + v53;
          int v55;
          v55 = v54;
          switch (v52) {
            default:
              {
              v55 = v0;
              break;
            }
            case 0:
              {
              v55 = v0;
              break;
            }
            case 1:
              {
              int v56 = 2;
              v55 = v56;
              break;
            }
            case 2:
              {
              v55 = v0;
              break;
            }
          }
          int v57 = 1;
          int v58 = v0 + v57;
          v50 = v55;
          break;
        }
        case 1:
          {
          int v59 = 0;
          int v60 = 0;
          int v61;
          int v62;
          v61 = v59;
          v62 = v60;
          while (true) {
            int v63 = 4;
            int v64 = v3 % v63;
            int v65 = 1;
            int v66 = v64 + v65;
            bool v67 = v62 < v66;
            v61 = v61;
            v62 = v62;
            if (!v67) break;
            int v68 = 3;
            int v69 = v0 + v68;
            int v70 = 1;
            int v71 = v62 + v70;
            v61 = v69;
            v62 = v71;
          }
          int v72 = 1;
          int v73 = v0 + v72;
          v50 = v61;
          break;
        }
        case 2:
          {
          int v74 = 0;
          bool v75 = v2 != v74;
          int v76;
          if (v75) {
            int v77 = 0;
            v76 = v77;
          } else {
            int v78 = 2;
            v76 = v78;
          }
          int v79 = 3;
          v50 = v76;
          break;
        }
        default:
          {
          v50 = v0;
          break;
        }
      }
      int v80 = 3;
      v7 = v50;
      break;
    }
  }
  bool v81 = true;
  int v82 = simt_wave_count_bits(v81);
  int v83 = 0;
  int v84 = v83 + v0;
  v1[v84] = v82;
  return;
}

kernel void kernel_main(device int* v85 [[buffer(0)]], device int* v86 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v87 = static_cast<int>(__simt_tid3.x);
  int v88 = 0;
  int v89 = v88 + v87;
  int v90 = v86[v89];
  int v91 = 4;
  int v92 = v91 + v87;
  int v93 = v86[v92];
  helper0(v87, v85, v90, v93, static_cast<int>(__simt_tid3.x));
  int v94 = 8;
  int v95 = v94 + v87;
  int v96 = v86[v95];
  int v97 = 1;
  int v98;
  v98 = v97;
  switch (v96) {
    case 0:
      {
      int v99 = 0;
      v98 = v99;
      break;
    }
    default:
      {
      int v100 = 0;
      int v101 = 0;
      int v102;
      int v103;
      v102 = v100;
      v103 = v101;
      while (true) {
        int v104 = 4;
        int v105 = v103 * v104;
        int v106 = v105 + v87;
        int v107 = 12;
        int v108 = v107 + v106;
        int v109 = v86[v108];
        int v110 = 0;
        bool v111 = v109 != v110;
        v102 = v102;
        v103 = v103;
        if (!v111) break;
        int v112 = v102 + v87;
        int v113 = 1;
        int v114 = v103 + v113;
        v102 = v112;
        v103 = v114;
        break;
        ;
      }
      bool v115 = true;
      v98 = v102;
      break;
    }
  }
  bool v116 = true;
  int v117 = 16;
  int v118 = v117 + v87;
  bool v119 = true;
  int v120 = simt_wave_count_bits(v119);
  v85[v118] = v120;
  int v121 = 32;
  int v122 = v121 + v87;
  int v123 = v86[v122];
  int v124 = 0;
  bool v125 = v123 != v124;
  int v126;
  if (v125) {
    int v127 = 36;
    int v128 = v127 + v87;
    int v129 = v86[v128];
    int v130 = 0;
    int v131 = v87 + v130;
    int v132;
    v132 = v131;
    switch (v129) {
      case 0:
        {
        int v133 = 40;
        int v134 = v133 + v87;
        int v135 = v86[v134];
        int v136 = 0;
        bool v137 = v135 != v136;
        int v138;
        if (v137) {
          int v139 = 1;
          int v140 = v87 + v139;
          v138 = v140;
        } else {
          int v141 = 1;
          int v142 = v87 + v141;
          v138 = v142;
        }
        v132 = v138;
        break;
      }
      default:
        {
        int v143 = 44;
        int v144 = v143 + v87;
        int v145 = v86[v144];
        int v146 = 0;
        bool v147 = v145 != v146;
        int v148;
        if (v147) {
          v148 = v87;
        } else {
          v148 = v87;
        }
        v132 = v148;
        break;
      }
      case 1:
        {
        int v149 = 48;
        int v150 = v149 + v87;
        int v151 = v86[v150];
        int v152 = 4;
        int v153;
        v153 = v152;
        switch (v151) {
          default:
            {
            int v154 = 4;
            int v155 = v87 + v154;
            v153 = v155;
            break;
          }
          case 0:
            {
            int v156 = 2;
            v153 = v156;
            break;
          }
        }
        bool v157 = true;
        v132 = v153;
        break;
      }
      case 2:
        {
        int v158 = 0;
        int v159 = 0;
        int v160;
        int v161;
        v160 = v158;
        v161 = v159;
        while (true) {
          int v162 = 4;
          int v163 = v161 * v162;
          int v164 = v163 + v87;
          int v165 = 52;
          int v166 = v165 + v164;
          int v167 = v86[v166];
          int v168 = 0;
          bool v169 = v167 != v168;
          v160 = v160;
          v161 = v161;
          if (!v169) break;
          int v170 = v160 + v161;
          int v171 = 1;
          int v172 = v161 + v171;
          v160 = v170;
          v161 = v172;
          break;
          ;
        }
        bool v173 = true;
        v132 = v160;
        break;
      }
    }
    bool v174 = true;
    v126 = v132;
  } else {
    int v175 = 72;
    int v176 = v175 + v87;
    int v177 = v86[v176];
    int v178 = 0;
    bool v179 = v177 != v178;
    int v180;
    if (v179) {
      int v181 = 76;
      int v182 = v181 + v87;
      int v183 = v86[v182];
      int v184;
      v184 = v87;
      switch (v183) {
        case 0:
          {
          v184 = v87;
        }
        case 1:
          {
          int v185 = 3;
          int v186 = v87 + v185;
          v184 = v186;
        }
        case 2:
          {
          v184 = v87;
          break;
        }
        default:
          {
          int v187 = 0;
          v184 = v187;
          break;
        }
      }
      bool v188 = true;
      v180 = v184;
    } else {
      uint v189 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v190 = (int)(v189);
      v180 = v190;
    }
    v126 = v180;
  }
  int v191 = 32;
  int v192 = v191 + v87;
  bool v193 = true;
  int v194 = simt_wave_count_bits(v193);
  v85[v192] = v194;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
