module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %1 = "simt_step.switch"(%0, %c1_i32) ({
    ^bb0(%arg4: i32):
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32 = arith.constant 0 : i32
      %3 = arith.addi %c0_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) {fallthrough = false} : (i32) -> ()
    ^bb1(%4: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %11 = arith.addi %10, %c1_i32_6 : i32
        %12 = arith.cmpi slt, %arg6, %11 : i32
        "simt_step.condition"(%12, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %13 = arith.addi %12, %c1_i32_9 : i32
          %14 = arith.cmpi slt, %arg8, %13 : i32
          "simt_step.condition"(%14, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_9 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.muli %arg8, %c4_i32 : i32
          %14 = arith.addi %c16_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_10 = arith.constant 1 : i32
          %16 = arith.addi %arg8, %c1_i32_10 : i32
          "simt_step.yield"(%12, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_8 = arith.constant 1 : i32
        %11 = arith.addi %arg6, %c1_i32_8 : i32
        "simt_step.yield"(%10#0, %11) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%5#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%6: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %7:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %11 = arith.addi %10, %c1_i32_6 : i32
        %12 = arith.cmpi slt, %arg6, %11 : i32
        "simt_step.condition"(%12, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true_6 = arith.constant true
        %10 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %c4_i32 = arith.constant 4 : i32
        %11 = arith.muli %arg6, %c4_i32 : i32
        %12 = arith.addi %c32_i32, %11 : i32
        %13 = arith.addi %12, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_7 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32_7 : i32
        "simt_step.yield"(%10, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%7#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%8: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %11 = arith.addi %10, %c1_i32_6 : i32
        %12 = arith.cmpi slt, %arg6, %11 : i32
        "simt_step.condition"(%12, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true_6 = arith.constant true
        %10 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %c4_i32 = arith.constant 4 : i32
        %11 = arith.muli %arg6, %c4_i32 : i32
        %12 = arith.addi %c48_i32, %11 : i32
        %13 = arith.addi %12, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_7 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32_7 : i32
        "simt_step.yield"(%10, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
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
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %16 = simt_step.lane_id
      %17 = arith.index_cast %16 : index to i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %19 = arith.addi %c12_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_1 : i32
      %22 = "simt_step.if"(%21) ({
        %c16_i32 = arith.constant 16 : i32
        %33 = arith.addi %c16_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_11 : i32
        %36 = "simt_step.if"(%35) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %39 = simt_step.subgroup_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) : (i32) -> ()
        }) : (i1) -> i32
        %c64_i32_12 = arith.constant 64 : i32
        %37 = arith.addi %c64_i32_12, %0 : i32
        %true_13 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) : (i32) -> ()
      }, {
        %33 = simt_step.lane_id
        %34 = arith.index_cast %33 : index to i32
        "simt_step.yield"(%34) : (i32) -> ()
      }) : (i1) -> i32
      %c80_i32 = arith.constant 80 : i32
      %23 = arith.addi %c80_i32, %0 : i32
      %true_2 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %26:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_11 : i32
        %34 = arith.addi %33, %0 : i32
        %c20_i32 = arith.constant 20 : i32
        %35 = arith.addi %c20_i32, %34 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_12 : i32
        "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %33 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %34 = arith.addi %arg4, %c1_i32 : i32
        %true_11 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_12 : i32
        %36 = arith.addi %c96_i32, %35 : i32
        %37 = arith.addi %36, %0 : i32
        %true_13 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%33, %34) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      %c112_i32 = arith.constant 112 : i32
      %27 = arith.addi %c112_i32, %0 : i32
      %true_6 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26#0) {fallthrough = true} : (i32) -> ()
    ^bb3(%29: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %30:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_11 : i32
        %34 = arith.addi %33, %0 : i32
        %c40_i32 = arith.constant 40 : i32
        %35 = arith.addi %c40_i32, %34 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_12 : i32
        "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c60_i32 = arith.constant 60 : i32
        %33 = arith.addi %c60_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_11 = arith.constant 4 : i32
        %35 = arith.addi %0, %c4_i32_11 : i32
        %36 = "simt_step.switch"(%34, %35) ({
        ^bb0(%arg5: i32):
          %c1_i32_15 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %44 = simt_step.lane_id
          %45 = arith.index_cast %44 : index to i32
          %true_16 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %46 = arith.addi %c128_i32, %0 : i32
          %true_17 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %37 = arith.addi %arg3, %36 : i32
        %c1_i32 = arith.constant 1 : i32
        %38 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %39 = arith.muli %arg4, %c4_i32_13 : i32
        %40 = arith.addi %c144_i32, %39 : i32
        %41 = arith.addi %40, %0 : i32
        %true_14 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%37, %38) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_9 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %31 = arith.addi %c160_i32, %0 : i32
      %true_10 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c64_i32 = arith.constant 64 : i32
    %10 = arith.addi %c64_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %11, %c0_i32_0 : i32
    %13 = "simt_step.if"(%12) ({
      %c3_i32 = arith.constant 3 : i32
      %16 = arith.addi %0, %c3_i32 : i32
      "simt_step.yield"(%16) : (i32) -> ()
    }, {
      %c68_i32 = arith.constant 68 : i32
      %16 = arith.addi %c68_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_1 = arith.constant 4 : i32
      %18 = "simt_step.switch"(%17, %c4_i32_1) ({
      ^bb0(%arg2: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %22 = arith.addi %c72_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %24 = simt_step.lane_id
        %25 = arith.index_cast %24 : index to i32
        %26 = "simt_step.switch"(%23, %25) ({
        ^bb0(%arg3: i32):
          %31 = simt_step.subgroup_id
          %32 = arith.index_cast %31 : index to i32
          %true_8 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %33 = arith.addi %c176_i32, %0 : i32
          %true_9 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %27 = arith.addi %c192_i32, %0 : i32
        %true_5 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_6 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %29 = arith.addi %c208_i32, %0 : i32
        %true_7 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %19 = arith.addi %c224_i32, %0 : i32
      %true_3 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) : (i32) -> ()
    }) : (i1) -> i32
    %c240_i32 = arith.constant 240 : i32
    %14 = arith.addi %c240_i32, %0 : i32
    %true = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

