module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32 : i32
        %5 = arith.cmpi slt, %arg5, %4 : i32
        "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c2_i32 = arith.constant 2 : i32
        %3 = arith.remsi %arg3, %c2_i32 : i32
        %c4_i32 = arith.constant 4 : i32
        %4 = arith.addi %arg0, %c4_i32 : i32
        %5 = "simt_step.switch"(%3, %4) ({
        ^bb0(%arg6: i32):
          %true_3 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c0_i32_4 = arith.constant 0 : i32
          %c4_i32_5 = arith.constant 4 : i32
          %12 = arith.muli %arg5, %c4_i32_5 : i32
          %13 = arith.addi %c0_i32_4, %12 : i32
          %14 = arith.addi %13, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
        ^bb1(%15: i32):  // no predecessors
          %true_6 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %17 = arith.muli %arg5, %c4_i32_7 : i32
          %18 = arith.addi %c16_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %c4_i32_2 = arith.constant 4 : i32
        %7 = arith.muli %arg5, %c4_i32_2 : i32
        %8 = arith.addi %c32_i32, %7 : i32
        %9 = arith.addi %8, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %10 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.continue"(%5, %10) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %2 = "simt_step.switch"(%arg3, %c0_i32_0) ({
      ^bb0(%arg4: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %3:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.addi %6, %c1_i32 : i32
          %8 = arith.cmpi slt, %arg6, %7 : i32
          "simt_step.condition"(%8, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg6, %c4_i32 : i32
          %8 = arith.addi %c48_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%6, %10) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%3#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%4: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.addi %6, %c1_i32 : i32
          %8 = arith.cmpi slt, %arg6, %7 : i32
          "simt_step.condition"(%8, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg6, %c4_i32 : i32
          %8 = arith.addi %c64_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%6, %10) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%5#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%2) : (i32) -> ()
    }) : (i1) -> i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %7 = arith.muli %arg3, %c4_i32_4 : i32
      %8 = arith.addi %7, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %9 = arith.addi %c8_i32, %8 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_5 : i32
      "simt_step.condition"(%11, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %7 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_4 : i32
      %10 = arith.addi %c80_i32, %9 : i32
      %11 = arith.addi %10, %0 : i32
      %true_5 = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%7, %8) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %7 = arith.muli %arg3, %c4_i32_4 : i32
      %8 = arith.addi %7, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %9 = arith.addi %c28_i32, %8 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_5 : i32
      "simt_step.condition"(%11, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c48_i32 = arith.constant 48 : i32
      %7 = arith.addi %c48_i32, %0 : i32
      %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %9 = arith.addi %0, %c0_i32_4 : i32
      %10 = "simt_step.switch"(%8, %9) ({
      ^bb0(%arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %true_8 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %17 = arith.addi %c96_i32, %0 : i32
        %true_9 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c4_i32_7) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %20 = arith.addi %c52_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %22 = "simt_step.switch"(%21, %0) ({
        ^bb0(%arg5: i32):
          %36 = simt_step.subgroup_id
          %37 = arith.index_cast %36 : index to i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %c2_i32_19 = arith.constant 2 : i32
          %40 = arith.addi %0, %c2_i32_19 : i32
          %true_20 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %41 = arith.addi %c112_i32, %0 : i32
          %true_21 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb3(%43: i32):  // no predecessors
          %c2_i32_22 = arith.constant 2 : i32
          %44 = arith.addi %0, %c2_i32_22 : i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %23 = arith.addi %c128_i32, %0 : i32
        %true_11 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %25 = arith.addi %c144_i32, %0 : i32
        %true_13 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
      ^bb2(%27: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %28 = arith.addi %c56_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_14 = arith.constant 1 : i32
        %30 = arith.addi %0, %c1_i32_14 : i32
        %31 = "simt_step.switch"(%29, %30) ({
        ^bb0(%arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %true_20 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %36 = arith.addi %c160_i32, %0 : i32
          %true_21 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_19) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %39 = simt_step.lane_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %32 = arith.addi %c176_i32, %0 : i32
        %true_16 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb3(%34: i32):  // no predecessors
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %36 = arith.muli %arg6, %c4_i32_19 : i32
          %37 = arith.addi %36, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %38 = arith.addi %c60_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_20 : i32
          "simt_step.condition"(%40, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %36 = arith.addi %arg5, %arg6 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %37 = arith.addi %arg6, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %38 = arith.muli %arg6, %c4_i32_21 : i32
          %39 = arith.addi %c192_i32, %38 : i32
          %40 = arith.addi %39, %0 : i32
          %true_22 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %11 = arith.addi %arg2, %10 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_5 : i32
      %14 = arith.addi %c208_i32, %13 : i32
      %15 = arith.addi %14, %0 : i32
      %true_6 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

