module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %1 = "simt_step.switch"(%0, %c1_i32) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %6 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_2 = arith.constant 1 : i32
        %7 = arith.addi %6, %c1_i32_2 : i32
        %8 = arith.cmpi slt, %arg6, %7 : i32
        "simt_step.condition"(%8, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c3_i32 = arith.constant 3 : i32
        %6 = arith.remsi %arg3, %c3_i32 : i32
        %7 = "simt_step.switch"(%6, %arg0) ({
        ^bb0(%arg7: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%9: i32):  // no predecessors
          %c0_i32_3 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_3) {fallthrough = false} : (i32) -> ()
        ^bb2(%10: i32):  // no predecessors
          %c3_i32_4 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_4) {fallthrough = false} : (i32) -> ()
        ^bb3(%11: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32_2 = arith.constant 1 : i32
        %8 = arith.addi %arg6, %c1_i32_2 : i32
        "simt_step.yield"(%7, %8) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%4#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c4_i32_2 = arith.constant 4 : i32
      %6 = arith.muli %arg3, %c4_i32_2 : i32
      %7 = arith.addi %6, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %8 = arith.addi %c8_i32, %7 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %9, %c0_i32_3 : i32
      "simt_step.condition"(%10, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %6 = arith.addi %c28_i32, %0 : i32
      %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
      %8 = "simt_step.switch"(%7, %0) ({
      ^bb0(%arg4: i32):
        %c32_i32_6 = arith.constant 32 : i32
        %17 = arith.addi %c32_i32_6, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_7 : i32
        %20 = "simt_step.if"(%19) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32_10 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %22 = arith.addi %c36_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_8 : i32
        %25 = "simt_step.if"(%24) ({
          %c1_i32_10 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_10) : (i32) -> ()
        }, {
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %27 = arith.addi %c40_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %29 = "simt_step.switch"(%28, %0) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
      ^bb3(%30: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %31 = arith.addi %c44_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_9 : i32
        %34 = "simt_step.if"(%33) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32_10 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c16_i32 = arith.constant 16 : i32
      %9 = arith.addi %c16_i32, %0 : i32
      %true_2 = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %11 = arith.addi %arg2, %8 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32 : i32
      %true_3 = arith.constant true
      %c32_i32 = arith.constant 32 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_4 : i32
      %14 = arith.addi %c32_i32, %13 : i32
      %15 = arith.addi %14, %0 : i32
      %true_5 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

