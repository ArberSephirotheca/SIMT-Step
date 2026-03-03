module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.subgroup_id
    %1 = arith.index_cast %0 : index to i32
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %3 = "simt_step.switch"(%2, %arg0) ({
    ^bb0(%arg4: i32):
      %c3_i32_1 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32_1) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_2) {fallthrough = false} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %10 = arith.remsi %arg3, %c2_i32 : i32
      %c2_i32_3 = arith.constant 2 : i32
      %11 = arith.addi %arg0, %c2_i32_3 : i32
      %12 = "simt_step.switch"(%10, %11) ({
      ^bb0(%arg5: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %14 = "simt_step.if"(%13) ({
          %c0_i32_10 = arith.constant 0 : i32
          %20 = arith.addi %arg0, %c0_i32_10 : i32
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %15 = arith.addi %arg0, %c0_i32_6 : i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb2(%17: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32 : i32
          %22 = arith.cmpi slt, %arg7, %21 : i32
          "simt_step.condition"(%22, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%arg0, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32_9 = arith.constant 2 : i32
        %19 = arith.addi %arg0, %c2_i32_9 : i32
        "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %c2_i32_4 = arith.constant 2 : i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %7 = arith.select %6, %1, %3 : i32
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
      %c4_i32_5 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_5 : i32
      %14 = arith.addi %13, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %15 = arith.addi %c8_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_6 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %16 = arith.muli %arg5, %c4_i32_9 : i32
        %17 = arith.addi %16, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %18 = arith.addi %c28_i32, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_10 : i32
        "simt_step.condition"(%20, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %16 = arith.addi %arg4, %arg5 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %17 = arith.addi %arg5, %c1_i32_9 : i32
        "simt_step.yield"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      %14 = arith.addi %arg2, %13#0 : i32
      %c1_i32_8 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32_8 : i32
      "simt_step.break"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c48_i32 = arith.constant 48 : i32
    %8 = arith.addi %c48_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %10 = "simt_step.switch"(%9, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c52_i32 = arith.constant 52 : i32
      %13 = arith.addi %c52_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_5 : i32
      %16 = "simt_step.if"(%15) ({
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %29 = arith.muli %arg4, %c4_i32_14 : i32
          %30 = arith.addi %29, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %31 = arith.addi %c56_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_15 : i32
          "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %29 = arith.addi %arg3, %arg4 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %30 = arith.addi %arg4, %c1_i32_14 : i32
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%28#0) : (i32) -> ()
      }, {
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %29 = arith.muli %arg4, %c4_i32_14 : i32
          %30 = arith.addi %29, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %31 = arith.addi %c76_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_15 : i32
          "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %29 = arith.addi %arg3, %arg4 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %30 = arith.addi %arg4, %c1_i32_14 : i32
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%28#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c96_i32 = arith.constant 96 : i32
      %18 = arith.addi %c96_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
      %21 = "simt_step.if"(%20) ({
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %29 = arith.muli %arg4, %c4_i32_14 : i32
          %30 = arith.addi %29, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %31 = arith.addi %c100_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_15 : i32
          "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %29 = arith.addi %arg3, %arg4 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %30 = arith.addi %arg4, %c1_i32_14 : i32
          "simt_step.continue"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%28#0) : (i32) -> ()
      }, {
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %29 = arith.muli %arg4, %c4_i32_14 : i32
          %30 = arith.addi %29, %0 : i32
          %c120_i32 = arith.constant 120 : i32
          %31 = arith.addi %c120_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_15 : i32
          "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %29 = arith.addi %arg3, %arg4 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %30 = arith.addi %arg4, %c1_i32_14 : i32
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%28#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c140_i32 = arith.constant 140 : i32
      %23 = arith.addi %c140_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = "simt_step.switch"(%24, %0) ({
      ^bb0(%arg3: i32):
        %c144_i32 = arith.constant 144 : i32
        %28 = arith.addi %c144_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_11 : i32
        %31 = "simt_step.if"(%30) ({
          %c1_i32_15 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_15) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c148_i32 = arith.constant 148 : i32
        %33 = arith.addi %c148_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %35 = arith.addi %0, %c2_i32 : i32
        %36 = "simt_step.switch"(%34, %35) ({
        ^bb0(%arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c152_i32 = arith.constant 152 : i32
        %38 = arith.addi %c152_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_13 = arith.constant 4 : i32
        %40 = "simt_step.switch"(%39, %c4_i32_13) ({
        ^bb0(%arg4: i32):
          %c0_i32_15 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %42 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb2(%43: i32):  // no predecessors
          %c1_i32_16 = arith.constant 1 : i32
          %44 = arith.addi %0, %c1_i32_16 : i32
          "simt_step.yield"(%44) {fallthrough = true} : (i32) -> ()
        ^bb3(%45: i32):  // no predecessors
          %c3_i32_17 = arith.constant 3 : i32
          %46 = arith.addi %0, %c3_i32_17 : i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb3(%26: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %27:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_11 : i32
        %29 = arith.addi %28, %0 : i32
        %c156_i32 = arith.constant 156 : i32
        %30 = arith.addi %c156_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_12 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %28 = arith.addi %arg3, %arg4 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32_11 : i32
        "simt_step.continue"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

