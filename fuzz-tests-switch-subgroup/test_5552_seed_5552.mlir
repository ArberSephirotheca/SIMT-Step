module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32_5 : i32
        %9 = arith.cmpi slt, %arg7, %8 : i32
        "simt_step.condition"(%9, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %7 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %8 = "simt_step.if"(%7) ({
          %true_7 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg7, %c4_i32 : i32
          %12 = arith.addi %c16_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg7, %c4_i32 : i32
          %12 = arith.addi %c32_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_6 = arith.constant 1 : i32
        %9 = arith.addi %arg7, %c1_i32_6 : i32
        "simt_step.continue"(%8, %9) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%5#0, %6) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
    return
  }
  func.func @main(%arg0: !simt_step.resource<Global, i32>, %arg1: !simt_step.resource<Global, i32>) attributes {simt.num_threads = [4, 1, 1], simt.subgroup_width = 8 : i64} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %0 : i32
    %2 = "simt_step.buffer.load"(%arg1, %1) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32 = arith.constant 4 : i32
    %3 = arith.addi %c4_i32, %0 : i32
    %4 = "simt_step.buffer.load"(%arg1, %3) : (!simt_step.resource<Global, i32>, i32) -> i32
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_0 = arith.constant 4 : i32
    %7 = arith.addi %0, %c4_i32_0 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %18 = arith.addi %c12_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
      %21 = "simt_step.if"(%20) ({
        %c0_i32_21 = arith.constant 0 : i32
        %c0_i32_22 = arith.constant 0 : i32
        %52:2 = "simt_step.loop"(%c0_i32_21, %c0_i32_22) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %53 = arith.muli %arg4, %c4_i32_23 : i32
          %54 = arith.addi %53, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %55 = arith.addi %c16_i32, %54 : i32
          %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %57 = arith.cmpi ne, %56, %c0_i32_24 : i32
          "simt_step.condition"(%57, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %53 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %54 = arith.addi %arg4, %c1_i32 : i32
          %true_23 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_24 = arith.constant 4 : i32
          %55 = arith.muli %arg4, %c4_i32_24 : i32
          %56 = arith.addi %c48_i32, %55 : i32
          %57 = arith.addi %56, %0 : i32
          %true_25 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%53, %54) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%52#0) : (i32) -> ()
      }, {
        %52 = simt_step.lane_id
        %53 = arith.index_cast %52 : index to i32
        "simt_step.yield"(%53) : (i32) -> ()
      }) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %22 = arith.addi %c64_i32, %0 : i32
      %true_7 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_8 = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %24 = arith.addi %c80_i32, %0 : i32
      %true_9 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %27 = arith.addi %c36_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = simt_step.lane_id
      %30 = arith.index_cast %29 : index to i32
      %31 = "simt_step.switch"(%28, %30) ({
      ^bb0(%arg3: i32):
        %c4_i32_21 = arith.constant 4 : i32
        %true_22 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %52 = arith.addi %c96_i32, %0 : i32
        %true_23 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c4_i32_21) {fallthrough = true} : (i32) -> ()
      ^bb1(%54: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%55: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %56 = arith.addi %c40_i32, %0 : i32
        %57 = "simt_step.buffer.load"(%arg1, %56) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_24 = arith.constant 0 : i32
        %58 = arith.addi %0, %c0_i32_24 : i32
        %59 = "simt_step.switch"(%57, %58) ({
        ^bb0(%arg4: i32):
          %68 = simt_step.subgroup_id
          %69 = arith.index_cast %68 : index to i32
          "simt_step.yield"(%69) {fallthrough = true} : (i32) -> ()
        ^bb1(%70: i32):  // no predecessors
          %71 = simt_step.subgroup_id
          %72 = arith.index_cast %71 : index to i32
          %true_34 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %73 = arith.addi %c112_i32, %0 : i32
          %true_35 = arith.constant true
          %74 = "simt_step.wave_count_bits"(%true_35) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %73, %74) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%72) {fallthrough = false} : (i32) -> ()
        ^bb2(%75: i32):  // no predecessors
          %76 = simt_step.subgroup_id
          %77 = arith.index_cast %76 : index to i32
          %true_36 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %78 = arith.addi %c128_i32, %0 : i32
          %true_37 = arith.constant true
          %79 = "simt_step.wave_count_bits"(%true_37) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %78, %79) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%77) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_25 = arith.constant true
        %c144_i32_26 = arith.constant 144 : i32
        %60 = arith.addi %c144_i32_26, %0 : i32
        %true_27 = arith.constant true
        %61 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_28 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %62 = arith.addi %c160_i32, %0 : i32
        %true_29 = arith.constant true
        %63 = "simt_step.wave_count_bits"(%true_29) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
      ^bb3(%64: i32):  // no predecessors
        %c0_i32_30 = arith.constant 0 : i32
        %c0_i32_31 = arith.constant 0 : i32
        %65:2 = "simt_step.loop"(%c0_i32_30, %c0_i32_31) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_34 = arith.constant 4 : i32
          %68 = arith.muli %arg5, %c4_i32_34 : i32
          %69 = arith.addi %68, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %70 = arith.addi %c44_i32, %69 : i32
          %71 = "simt_step.buffer.load"(%arg1, %70) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_35 = arith.constant 0 : i32
          %72 = arith.cmpi ne, %71, %c0_i32_35 : i32
          "simt_step.condition"(%72, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %68 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %69 = arith.addi %arg5, %c1_i32 : i32
          %true_34 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_35 = arith.constant 4 : i32
          %70 = arith.muli %arg5, %c4_i32_35 : i32
          %71 = arith.addi %c176_i32, %70 : i32
          %72 = arith.addi %71, %0 : i32
          %true_36 = arith.constant true
          %73 = "simt_step.wave_count_bits"(%true_36) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %72, %73) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%68, %69) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_32 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %66 = arith.addi %c192_i32, %0 : i32
        %true_33 = arith.constant true
        %67 = "simt_step.wave_count_bits"(%true_33) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%65#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %32 = arith.addi %c208_i32, %0 : i32
      %true_11 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_12 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %34 = arith.addi %c224_i32, %0 : i32
      %true_13 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb2(%36: i32):  // no predecessors
      %c64_i32_14 = arith.constant 64 : i32
      %37 = arith.addi %c64_i32_14, %0 : i32
      %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_15 = arith.constant 0 : i32
      %39 = arith.cmpi ne, %38, %c0_i32_15 : i32
      %40 = "simt_step.if"(%39) ({
        %c68_i32 = arith.constant 68 : i32
        %52 = arith.addi %c68_i32, %0 : i32
        %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_21 = arith.constant 0 : i32
        %54 = arith.cmpi ne, %53, %c0_i32_21 : i32
        %55 = "simt_step.if"(%54) ({
          %58 = simt_step.subgroup_id
          %59 = arith.index_cast %58 : index to i32
          "simt_step.yield"(%59) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %58 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%58) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %56 = arith.addi %c240_i32, %0 : i32
        %true_22 = arith.constant true
        %57 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%55) : (i32) -> ()
      }, {
        %c0_i32_21 = arith.constant 0 : i32
        %c0_i32_22 = arith.constant 0 : i32
        %52:2 = "simt_step.loop"(%c0_i32_21, %c0_i32_22) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %53 = arith.muli %arg4, %c4_i32_23 : i32
          %54 = arith.addi %53, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %55 = arith.addi %c72_i32, %54 : i32
          %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %57 = arith.cmpi ne, %56, %c0_i32_24 : i32
          "simt_step.condition"(%57, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %53 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %54 = arith.addi %arg4, %c1_i32 : i32
          %true_23 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_24 = arith.constant 4 : i32
          %55 = arith.muli %arg4, %c4_i32_24 : i32
          %56 = arith.addi %c256_i32, %55 : i32
          %57 = arith.addi %56, %0 : i32
          %true_25 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%53, %54) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%52#0) : (i32) -> ()
      }) : (i1) -> i32
      %c272_i32 = arith.constant 272 : i32
      %41 = arith.addi %c272_i32, %0 : i32
      %true_16 = arith.constant true
      %42 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
    ^bb3(%43: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %44 = arith.addi %c92_i32, %0 : i32
      %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_17 = arith.constant 0 : i32
      %46 = arith.cmpi ne, %45, %c0_i32_17 : i32
      %47 = "simt_step.if"(%46) ({
        %c96_i32 = arith.constant 96 : i32
        %52 = arith.addi %c96_i32, %0 : i32
        %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_21 = arith.constant 0 : i32
        %54 = "simt_step.switch"(%53, %c0_i32_21) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%55: i32):  // no predecessors
          %56 = simt_step.lane_id
          %57 = arith.index_cast %56 : index to i32
          %true_22 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %58 = arith.addi %c288_i32, %0 : i32
          %true_23 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57) {fallthrough = true} : (i32) -> ()
        ^bb2(%60: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %true_24 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %61 = arith.addi %c304_i32, %0 : i32
          %true_25 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%63: i32):  // no predecessors
          %64 = simt_step.subgroup_id
          %65 = arith.index_cast %64 : index to i32
          %true_26 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %66 = arith.addi %c320_i32, %0 : i32
          %true_27 = arith.constant true
          %67 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%54) : (i32) -> ()
      }, {
        %c100_i32 = arith.constant 100 : i32
        %52 = arith.addi %c100_i32, %0 : i32
        %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_21 = arith.constant 0 : i32
        %54 = arith.addi %0, %c0_i32_21 : i32
        %55 = "simt_step.switch"(%53, %54) ({
        ^bb0(%arg3: i32):
          %56 = simt_step.subgroup_id
          %57 = arith.index_cast %56 : index to i32
          "simt_step.yield"(%57) {fallthrough = true} : (i32) -> ()
        ^bb1(%58: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
        ^bb2(%59: i32):  // no predecessors
          %c4_i32_22 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_22) {fallthrough = true} : (i32) -> ()
        ^bb3(%60: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %true_23 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %61 = arith.addi %c336_i32, %0 : i32
          %true_24 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%55) : (i32) -> ()
      }) : (i1) -> i32
      %c352_i32 = arith.constant 352 : i32
      %48 = arith.addi %c352_i32, %0 : i32
      %true_18 = arith.constant true
      %49 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_19 = arith.constant true
      %c368_i32 = arith.constant 368 : i32
      %50 = arith.addi %c368_i32, %0 : i32
      %true_20 = arith.constant true
      %51 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c384_i32 = arith.constant 384 : i32
    %9 = arith.addi %c384_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_6 : i32
      %19 = arith.addi %18, %0 : i32
      %c104_i32 = arith.constant 104 : i32
      %20 = arith.addi %c104_i32, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_7 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %25 = arith.muli %arg5, %c4_i32_11 : i32
        %26 = arith.addi %25, %0 : i32
        %c124_i32 = arith.constant 124 : i32
        %27 = arith.addi %c124_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_12 : i32
        "simt_step.condition"(%29, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %25 = arith.addi %arg4, %arg5 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %26 = arith.addi %arg5, %c1_i32_11 : i32
        %true_12 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %27 = arith.muli %arg5, %c4_i32_13 : i32
        %28 = arith.addi %c400_i32, %27 : i32
        %29 = arith.addi %28, %0 : i32
        %true_14 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %19 = arith.addi %arg2, %18#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      %true_8 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %c4_i32_9 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_9 : i32
      %22 = arith.addi %c416_i32, %21 : i32
      %23 = arith.addi %22, %0 : i32
      %true_10 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c144_i32 = arith.constant 144 : i32
    %12 = arith.addi %c144_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_4 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_4 : i32
    %15 = "simt_step.if"(%14) ({
      %c148_i32 = arith.constant 148 : i32
      %18 = arith.addi %c148_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
      %21 = "simt_step.if"(%20) ({
        %c4_i32_8 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_8) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %25 = arith.muli %arg3, %c4_i32_10 : i32
          %26 = arith.addi %25, %0 : i32
          %c152_i32 = arith.constant 152 : i32
          %27 = arith.addi %c152_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_11 : i32
          "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %25 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg3, %c1_i32 : i32
          %true_10 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %27 = arith.muli %arg3, %c4_i32_11 : i32
          %28 = arith.addi %c432_i32, %27 : i32
          %29 = arith.addi %28, %0 : i32
          %true_12 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) : (i32) -> ()
      }) : (i1) -> i32
      %c448_i32 = arith.constant 448 : i32
      %22 = arith.addi %c448_i32, %0 : i32
      %true_7 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) : (i32) -> ()
    }, {
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%c1_i32) : (i32) -> ()
    }) : (i1) -> i32
    %c464_i32 = arith.constant 464 : i32
    %16 = arith.addi %c464_i32, %0 : i32
    %true_5 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

