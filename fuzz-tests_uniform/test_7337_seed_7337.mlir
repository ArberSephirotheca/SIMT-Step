module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c1_i32 = arith.constant 1 : i32
    %0 = arith.addi %arg0, %c1_i32 : i32
    %c3_i32 = arith.constant 3 : i32
    %1 = arith.remsi %arg3, %c3_i32 : i32
    %c0_i32 = arith.constant 0 : i32
    %2 = "simt_step.switch"(%1, %c0_i32) ({
    ^bb0(%arg4: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %7:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32_9 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %16 = arith.addi %15, %c1_i32_10 : i32
        %17 = arith.cmpi slt, %arg6, %16 : i32
        "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %16 = "simt_step.if"(%15) ({
          %c3_i32_11 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_11) : (i32) -> ()
        }, {
          %c3_i32_11 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_11) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_10 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32_10 : i32
        "simt_step.continue"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%7#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32_9 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %16 = arith.addi %15, %c1_i32_10 : i32
        %17 = arith.cmpi slt, %arg6, %16 : i32
        "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %16 = "simt_step.if"(%15) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c4_i32_12 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32_10 = arith.constant 2 : i32
        %17 = arith.addi %arg0, %c2_i32_10 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %18 = arith.addi %arg6, %c1_i32_11 : i32
        "simt_step.yield"(%16, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c4_i32 = arith.constant 4 : i32
      "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %11 = arith.remsi %arg3, %c2_i32 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %12 = "simt_step.switch"(%11, %c0_i32_6) ({
      ^bb0(%arg5: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32_14 : i32
          %22 = arith.cmpi slt, %arg7, %21 : i32
          "simt_step.condition"(%22, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_13 = arith.constant 1 : i32
          %20 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.break"(%arg0, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32_11 = arith.constant 2 : i32
        %16 = arith.addi %arg0, %c2_i32_11 : i32
        "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
      ^bb2(%18: i32):  // no predecessors
        %c2_i32_12 = arith.constant 2 : i32
        %19 = arith.addi %arg0, %c2_i32_12 : i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb3(%13: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32_9 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %16 = arith.addi %15, %c1_i32_10 : i32
        %17 = arith.cmpi slt, %arg6, %16 : i32
        "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c2_i32_9 = arith.constant 2 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %15 = arith.addi %arg6, %c1_i32_10 : i32
        "simt_step.yield"(%c2_i32_9, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32_0, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %6 = arith.select %5, %0, %2 : i32
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
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %25 = arith.addi %c12_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_5 : i32
      %28 = "simt_step.if"(%27) ({
        %c16_i32_11 = arith.constant 16 : i32
        %38 = arith.addi %c16_i32_11, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %40 = arith.addi %0, %c2_i32 : i32
        %41 = "simt_step.switch"(%39, %40) ({
        ^bb0(%arg3: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %42 = arith.addi %0, %c4_i32_13 : i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %c0_i32_14 = arith.constant 0 : i32
          %44 = arith.addi %0, %c0_i32_14 : i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%41) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %38 = arith.addi %c20_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %40 = arith.addi %0, %c0_i32_11 : i32
        %41 = "simt_step.switch"(%39, %40) ({
        ^bb0(%arg3: i32):
          %c0_i32_13 = arith.constant 0 : i32
          %42 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%42) {fallthrough = true} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%41) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
    ^bb1(%29: i32):  // no predecessors
      %c24_i32 = arith.constant 24 : i32
      %30 = arith.addi %c24_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %32 = arith.cmpi ne, %31, %c0_i32_6 : i32
      %33 = "simt_step.if"(%32) ({
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) : (i32) -> ()
      }, {
        %c28_i32 = arith.constant 28 : i32
        %38 = arith.addi %c28_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_11 : i32
        %41 = "simt_step.if"(%40) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %42 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    ^bb2(%34: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %35:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %38 = arith.muli %arg4, %c4_i32_11 : i32
        %39 = arith.addi %38, %0 : i32
        %c32_i32_12 = arith.constant 32 : i32
        %40 = arith.addi %c32_i32_12, %39 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_13 : i32
        "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %38 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %39 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%38, %39) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_9 = arith.constant true
      "simt_step.yield"(%35#0) {fallthrough = true} : (i32) -> ()
    ^bb3(%36: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %37 = arith.addi %0, %c0_i32_10 : i32
      "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c52_i32 = arith.constant 52 : i32
    %12 = arith.addi %c52_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.lane_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c56_i32 = arith.constant 56 : i32
      %25 = arith.addi %c56_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_5 : i32
      %28 = "simt_step.if"(%27) ({
        %c60_i32 = arith.constant 60 : i32
        %38 = arith.addi %c60_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_8 : i32
        %41 = "simt_step.if"(%40) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %38 = arith.addi %0, %c0_i32_8 : i32
        "simt_step.yield"(%38) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
    ^bb1(%29: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %30 = arith.addi %c64_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %32 = "simt_step.switch"(%31, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_8 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_8) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb2(%33: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %34 = arith.addi %c68_i32, %0 : i32
      %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %36 = arith.cmpi ne, %35, %c0_i32_7 : i32
      %37 = "simt_step.if"(%36) ({
        %c72_i32 = arith.constant 72 : i32
        %38 = arith.addi %c72_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_8 : i32
        %41 = "simt_step.if"(%40) ({
          %c4_i32_9 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_9) : (i32) -> ()
        }, {
          %c0_i32_9 = arith.constant 0 : i32
          %42 = arith.addi %0, %c0_i32_9 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %17 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c76_i32 = arith.constant 76 : i32
    %19 = arith.addi %c76_i32, %0 : i32
    %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %21 = arith.cmpi ne, %20, %c0_i32_3 : i32
    %22 = "simt_step.if"(%21) ({
      %c80_i32 = arith.constant 80 : i32
      %25 = arith.addi %c80_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_5 : i32
      %28 = "simt_step.if"(%27) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %30 = arith.muli %arg3, %c4_i32_9 : i32
          %31 = arith.addi %30, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %32 = arith.addi %c84_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_10 : i32
          "simt_step.condition"(%34, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %30 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg3, %c1_i32 : i32
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        "simt_step.yield"(%29#0) : (i32) -> ()
      }, {
        %c104_i32 = arith.constant 104 : i32
        %29 = arith.addi %c104_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_6 : i32
        %32 = "simt_step.if"(%31) ({
          %33 = simt_step.subgroup_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) : (i32) -> ()
        }, {
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%28) : (i32) -> ()
    }, {
      %c108_i32 = arith.constant 108 : i32
      %25 = arith.addi %c108_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_5 : i32
      %28 = "simt_step.if"(%27) ({
        %c112_i32 = arith.constant 112 : i32
        %29 = arith.addi %c112_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_6 : i32
        %32 = "simt_step.if"(%31) ({
          %33 = simt_step.subgroup_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) : (i32) -> ()
        }, {
          %33 = simt_step.subgroup_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }, {
        %29 = simt_step.lane_id
        %30 = arith.index_cast %29 : index to i32
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%28) : (i32) -> ()
    }) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %23 = arith.addi %c48_i32, %0 : i32
    %true_4 = arith.constant true
    %24 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

