module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    ^bb2(%7: i32):  // no predecessors
      %c2_i32_1 = arith.constant 2 : i32
      %8 = arith.addi %arg0, %c2_i32_1 : i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %3 = "simt_step.if"(%2) ({
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32 : i32
        %9 = arith.cmpi slt, %arg5, %8 : i32
        "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %7 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %8 = "simt_step.if"(%7) ({
          %true = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_4 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg5, %c4_i32 : i32
          %12 = arith.addi %c0_i32_4, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }, {
          %true = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg5, %c4_i32 : i32
          %12 = arith.addi %c16_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %9 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%8, %9) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%6#0) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      %6 = arith.remsi %arg3, %c3_i32 : i32
      %7 = "simt_step.switch"(%6, %arg0) ({
      ^bb0(%arg4: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32_4 : i32
          %15 = arith.cmpi slt, %arg6, %14 : i32
          "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c2_i32_4 = arith.constant 2 : i32
          %c1_i32_5 = arith.constant 1 : i32
          %13 = arith.addi %arg6, %c1_i32_5 : i32
          "simt_step.yield"(%c2_i32_4, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%9: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
      ^bb2(%10: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %11 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %12 = "simt_step.if"(%11) ({
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%7) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %5 = arith.select %4, %1, %3 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c2_i32_2 = arith.constant 2 : i32
      %15 = arith.addi %0, %c2_i32_2 : i32
      "simt_step.yield"(%15) : (i32) -> ()
    }, {
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %16 = arith.muli %arg3, %c4_i32_4 : i32
        %17 = arith.addi %16, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %18 = arith.addi %c12_i32, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_5 : i32
        "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %16 = arith.addi %arg2, %arg3 : i32
        %c1_i32_4 = arith.constant 1 : i32
        %17 = arith.addi %arg3, %c1_i32_4 : i32
        %true_5 = arith.constant true
        %c32_i32_6 = arith.constant 32 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %18 = arith.muli %arg3, %c4_i32_7 : i32
        %19 = arith.addi %c32_i32_6, %18 : i32
        %20 = arith.addi %19, %0 : i32
        %true_8 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%15#0) : (i32) -> ()
    }) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %9 = arith.addi %c48_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %13 = arith.addi %0, %c2_i32 : i32
    %14 = "simt_step.switch"(%12, %13) ({
    ^bb0(%arg2: i32):
      %c36_i32 = arith.constant 36 : i32
      %15 = arith.addi %c36_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_2 : i32
      %18 = "simt_step.if"(%17) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %32 = arith.muli %arg4, %c4_i32_9 : i32
          %33 = arith.addi %32, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %34 = arith.addi %c40_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_10 : i32
          "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %32 = arith.addi %arg3, %arg4 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %33 = arith.addi %arg4, %c1_i32_9 : i32
          %true_10 = arith.constant true
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%31#0) : (i32) -> ()
      }, {
        %c60_i32 = arith.constant 60 : i32
        %31 = arith.addi %c60_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_7 = arith.constant 4 : i32
        %33 = arith.addi %0, %c4_i32_7 : i32
        %34 = "simt_step.switch"(%32, %33) ({
        ^bb0(%arg3: i32):
          %c2_i32_8 = arith.constant 2 : i32
          %35 = arith.addi %0, %c2_i32_8 : i32
          "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          %38 = arith.addi %0, %c0_i32_9 : i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb3(%39: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%34) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %20 = arith.addi %c64_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_3 : i32
      %23 = "simt_step.if"(%22) ({
        %c68_i32 = arith.constant 68 : i32
        %31 = arith.addi %c68_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %33 = "simt_step.switch"(%32, %0) ({
        ^bb0(%arg3: i32):
          %c1_i32_8 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_9) {fallthrough = true} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %c2_i32_10 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_10) {fallthrough = true} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          %c3_i32_11 = arith.constant 3 : i32
          %37 = arith.addi %0, %c3_i32_11 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%33) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %31 = arith.addi %0, %c0_i32_7 : i32
        "simt_step.yield"(%31) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_7 : i32
        %32 = arith.addi %31, %0 : i32
        %c72_i32 = arith.constant 72 : i32
        %33 = arith.addi %c72_i32, %32 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_8 : i32
        "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %31 = arith.addi %arg3, %arg4 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %32 = arith.addi %arg4, %c1_i32_7 : i32
        %true_8 = arith.constant true
        "simt_step.continue"(%31, %32) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%26: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %27 = arith.addi %c92_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %29 = arith.addi %0, %c3_i32 : i32
      %30 = "simt_step.switch"(%28, %29) ({
      ^bb0(%arg3: i32):
        %c96_i32 = arith.constant 96 : i32
        %31 = arith.addi %c96_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_7 : i32
        %34 = "simt_step.if"(%33) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c100_i32 = arith.constant 100 : i32
        %36 = arith.addi %c100_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_8 = arith.constant 1 : i32
        %38 = "simt_step.switch"(%37, %c1_i32_8) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c4_i32_10 = arith.constant 4 : i32
          %41 = arith.addi %0, %c4_i32_10 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c4_i32_9 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_9) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

