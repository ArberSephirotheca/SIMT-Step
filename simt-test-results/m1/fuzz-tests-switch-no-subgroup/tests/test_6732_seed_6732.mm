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
        bool v25 = true;
        int v26 = simt_wave_count_bits(v25);
        int v27 = 0;
        int v28 = 4;
        int v29 = v19 * v28;
        int v30 = v27 + v29;
        int v31 = v30 + v0;
        v1[v31] = v26;
        int v32 = 1;
        int v33 = v19 + v32;
        v18 = v26;
        v19 = v33;
      }
      int v34 = 1;
      int v35 = v10 + v34;
      v9 = v18;
      v10 = v35;
    }
    v6 = v9;
  } else {
    int v36 = 3;
    int v37 = v3 % v36;
    int v38;
    v38 = v0;
    switch (v37) {
      case 0:
        {
        int v39 = 0;
        int v40 = 0;
        int v41;
        int v42;
        v41 = v39;
        v42 = v40;
        while (true) {
          int v43 = 4;
          int v44 = v3 % v43;
          int v45 = 1;
          int v46 = v44 + v45;
          bool v47 = v42 < v46;
          v41 = v41;
          v42 = v42;
          if (!v47) break;
          int v48 = 1;
          int v49 = v0 + v48;
          int v50 = 1;
          int v51 = v42 + v50;
          v41 = v49;
          v42 = v51;
        }
        v38 = v41;
        break;
      }
      case 1:
        {
        int v52 = 2;
        int v53 = v3 % v52;
        int v54 = 3;
        int v55;
        v55 = v54;
        switch (v53) {
          case 0:
            {
            v55 = v0;
            break;
          }
          case 1:
            {
            int v56 = 0;
            int v57 = v0 + v56;
            v55 = v57;
            break;
          }
          default:
            {
            int v58 = 3;
            v55 = v58;
            break;
          }
        }
        v38 = v55;
      }
      case 2:
        {
        int v59 = 0;
        bool v60 = v2 != v59;
        int v61;
        if (v60) {
          int v62 = 4;
          int v63 = v0 + v62;
          v61 = v63;
        } else {
          int v64 = 3;
          int v65 = v0 + v64;
          v61 = v65;
        }
        v38 = v61;
      }
      default:
        {
        int v66 = 3;
        int v67 = v3 % v66;
        int v68 = 3;
        int v69 = v0 + v68;
        int v70;
        v70 = v69;
        switch (v67) {
          case 0:
            {
            int v71 = 4;
            int v72 = v0 + v71;
            v70 = v72;
            break;
          }
          default:
            {
            int v73 = 1;
            v70 = v73;
          }
          case 1:
            {
            int v74 = 2;
            int v75 = v0 + v74;
            v70 = v75;
            break;
          }
        }
        v38 = v70;
        break;
      }
    }
    v6 = v38;
  }
  return;
}

kernel void kernel_main(device int* v76 [[buffer(0)]], device int* v77 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v78 = static_cast<int>(__simt_tid3.x);
  int v79 = 0;
  int v80 = v79 + v78;
  int v81 = v77[v80];
  int v82 = 4;
  int v83 = v82 + v78;
  int v84 = v77[v83];
  helper0(v78, v76, v81, v84, static_cast<int>(__simt_tid3.x));
  int v85 = 8;
  int v86 = v85 + v78;
  int v87 = v77[v86];
  int v88;
  v88 = v78;
  switch (v87) {
    default:
      {
      int v89 = 12;
      int v90 = v89 + v78;
      int v91 = v77[v90];
      int v92 = 3;
      int v93;
      v93 = v92;
      switch (v91) {
        default:
          {
          int v94 = 16;
          int v95 = v94 + v78;
          int v96 = v77[v95];
          int v97 = 0;
          bool v98 = v96 != v97;
          int v99;
          if (v98) {
            int v100 = 4;
            v99 = v100;
          } else {
            v99 = v78;
          }
          v93 = v99;
          break;
        }
        case 0:
          {
          int v101 = 0;
          int v102 = v78 + v101;
          v93 = v102;
          break;
        }
      }
      bool v103 = true;
      v88 = v93;
    }
    case 0:
      {
      int v104 = 20;
      int v105 = v104 + v78;
      int v106 = v77[v105];
      int v107 = 4;
      int v108;
      v108 = v107;
      switch (v106) {
        case 0:
          {
          int v109 = 24;
          int v110 = v109 + v78;
          int v111 = v77[v110];
          int v112 = 0;
          bool v113 = v111 != v112;
          int v114;
          if (v113) {
            int v115 = 2;
            int v116 = v78 + v115;
            v114 = v116;
          } else {
            int v117 = 3;
            v114 = v117;
          }
          v108 = v114;
          break;
        }
        case 1:
          {
          int v118 = 0;
          v108 = v118;
        }
        case 2:
          {
          int v119 = 28;
          int v120 = v119 + v78;
          int v121 = v77[v120];
          int v122;
          v122 = v78;
          switch (v121) {
            case 0:
              {
              int v123 = 1;
              v122 = v123;
              break;
            }
            default:
              {
              v122 = v78;
              break;
            }
          }
          v108 = v122;
        }
        default:
          {
          int v124 = 32;
          int v125 = v124 + v78;
          int v126 = v77[v125];
          int v127 = 0;
          bool v128 = v126 != v127;
          int v129;
          if (v128) {
            int v130 = 4;
            int v131 = v78 + v130;
            v129 = v131;
          } else {
            int v132 = 1;
            int v133 = v78 + v132;
            v129 = v133;
          }
          v108 = v129;
          break;
        }
      }
      v88 = v108;
      break;
    }
  }
  int v134 = 0;
  int v135 = 0;
  int v136;
  int v137;
  v136 = v134;
  v137 = v135;
  while (true) {
    int v138 = 4;
    int v139 = v137 * v138;
    int v140 = v139 + v78;
    int v141 = 36;
    int v142 = v141 + v140;
    int v143 = v77[v142];
    int v144 = 0;
    bool v145 = v143 != v144;
    v136 = v136;
    v137 = v137;
    if (!v145) break;
    int v146 = 56;
    int v147 = v146 + v78;
    int v148 = v77[v147];
    uint v149 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v150 = (int)(v149);
    int v151;
    v151 = v150;
    switch (v148) {
      case 0:
        {
        int v152 = 60;
        int v153 = v152 + v78;
        int v154 = v77[v153];
        int v155 = 2;
        int v156 = v78 + v155;
        int v157;
        v157 = v156;
        switch (v154) {
          case 0:
            {
            int v158 = 0;
            v157 = v158;
            break;
          }
          case 1:
            {
            int v159 = 3;
            int v160 = v78 + v159;
            v157 = v160;
            break;
          }
          default:
            {
            int v161 = 4;
            v157 = v161;
            break;
          }
          case 2:
            {
            int v162 = 3;
            int v163 = v78 + v162;
            v157 = v163;
            break;
          }
        }
        v151 = v157;
        break;
      }
      default:
        {
        int v164 = 64;
        int v165 = v164 + v78;
        int v166 = v77[v165];
        int v167 = 0;
        bool v168 = v166 != v167;
        int v169;
        if (v168) {
          v169 = v78;
        } else {
          v169 = v78;
        }
        v151 = v169;
        break;
      }
    }
    int v170 = v136 + v151;
    int v171 = 1;
    int v172 = v137 + v171;
    bool v173 = true;
    int v174 = 16;
    int v175 = 4;
    int v176 = v137 * v175;
    int v177 = v174 + v176;
    int v178 = v177 + v78;
    bool v179 = true;
    int v180 = simt_wave_count_bits(v179);
    v76[v178] = v180;
    v136 = v170;
    v137 = v172;
    continue;
    ;
  }
  int v181 = 68;
  int v182 = v181 + v78;
  int v183 = v77[v182];
  int v184 = 0;
  bool v185 = v183 != v184;
  int v186;
  if (v185) {
    uint v187 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v188 = (int)(v187);
    v186 = v188;
  } else {
    int v189 = 0;
    int v190 = 0;
    int v191;
    int v192;
    v191 = v189;
    v192 = v190;
    while (true) {
      int v193 = 4;
      int v194 = v192 * v193;
      int v195 = v194 + v78;
      int v196 = 72;
      int v197 = v196 + v195;
      int v198 = v77[v197];
      int v199 = 0;
      bool v200 = v198 != v199;
      v191 = v191;
      v192 = v192;
      if (!v200) break;
      int v201 = v191 + v192;
      int v202 = 1;
      int v203 = v192 + v202;
      bool v204 = true;
      int v205 = 32;
      int v206 = 4;
      int v207 = v192 * v206;
      int v208 = v205 + v207;
      int v209 = v208 + v78;
      bool v210 = true;
      int v211 = simt_wave_count_bits(v210);
      v76[v209] = v211;
      v191 = v201;
      v192 = v203;
    }
    v186 = v191;
  }
  int v212 = 48;
  int v213 = v212 + v78;
  bool v214 = true;
  int v215 = simt_wave_count_bits(v214);
  v76[v213] = v215;
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
    static int32_t expected0[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 92; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
