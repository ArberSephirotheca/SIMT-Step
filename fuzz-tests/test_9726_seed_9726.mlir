module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %3 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %4 = arith.addi %3, %c1_i32 : i32
      %5 = arith.cmpi slt, %arg5, %4 : i32
      "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32 = arith.constant 3 : i32
      %3 = arith.remsi %arg3, %c3_i32 : i32
      %4 = "simt_step.switch"(%3, %arg0) ({
      ^bb0(%arg6: i32):
        %c1_i32_2 = arith.constant 1 : i32
        %6 = arith.addi %arg0, %c1_i32_2 : i32
        "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
      ^bb1(%7: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %9 = "simt_step.if"(%8) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c3_i32_5 = arith.constant 3 : i32
          %17 = arith.addi %arg0, %c3_i32_5 : i32
          "simt_step.yield"(%17) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb2(%10: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %11 = arith.remsi %arg3, %c2_i32 : i32
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.addi %arg0, %c4_i32 : i32
        %13 = "simt_step.switch"(%11, %12) ({
        ^bb0(%arg7: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %c1_i32_5 = arith.constant 1 : i32
          %18 = arith.addi %arg0, %c1_i32_5 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb2(%19: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb3(%14: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %16 = "simt_step.if"(%15) ({
          %c2_i32_5 = arith.constant 2 : i32
          %17 = arith.addi %arg0, %c2_i32_5 : i32
          "simt_step.yield"(%17) : (i32) -> ()
        }, {
          %c3_i32_5 = arith.constant 3 : i32
          %17 = arith.addi %arg0, %c3_i32_5 : i32
          "simt_step.yield"(%17) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%4, %5) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %24 = arith.addi %c12_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
      %27 = "simt_step.if"(%26) ({
        %c1_i32_7 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_7) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %30 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb1(%28: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %29 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c16_i32_1 = arith.constant 16 : i32
    %12 = arith.addi %c16_i32_1, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_2 : i32
    %15 = "simt_step.if"(%14) ({
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%c1_i32) : (i32) -> ()
    }, {
      %24 = simt_step.subgroup_id
      %25 = arith.index_cast %24 : index to i32
      "simt_step.yield"(%25) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %16 = arith.addi %c32_i32, %0 : i32
    %true_3 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c20_i32 = arith.constant 20 : i32
    %18 = arith.addi %c20_i32, %0 : i32
    %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_4 = arith.constant 0 : i32
    %20 = arith.cmpi ne, %19, %c0_i32_4 : i32
    %21 = "simt_step.if"(%20) ({
      %c24_i32 = arith.constant 24 : i32
      %24 = arith.addi %c24_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = "simt_step.switch"(%25, %0) ({
      ^bb0(%arg2: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_10 : i32
          %38 = arith.addi %37, %0 : i32
          %c28_i32 = arith.constant 28 : i32
          %39 = arith.addi %c28_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_11 : i32
          "simt_step.condition"(%41, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %37 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg4, %c1_i32 : i32
          %true_10 = arith.constant true
          "simt_step.yield"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%27#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %29 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %31 = arith.addi %c48_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_8 : i32
        %34 = "simt_step.if"(%33) ({
          %c0_i32_10 = arith.constant 0 : i32
          %37 = arith.addi %0, %c0_i32_10 : i32
          "simt_step.yield"(%37) : (i32) -> ()
        }, {
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb3(%35: i32):  // no predecessors
        %c2_i32_9 = arith.constant 2 : i32
        %36 = arith.addi %0, %c2_i32_9 : i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%26) : (i32) -> ()
    }, {
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %25 = arith.muli %arg3, %c4_i32_8 : i32
        %26 = arith.addi %25, %0 : i32
        %c52_i32 = arith.constant 52 : i32
        %27 = arith.addi %c52_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_9 : i32
        "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %32 = arith.muli %arg5, %c4_i32_13 : i32
          %33 = arith.addi %32, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %34 = arith.addi %c72_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_14 : i32
          "simt_step.condition"(%36, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %32 = arith.addi %arg4, %arg5 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %33 = arith.addi %arg5, %c1_i32_13 : i32
          %true_14 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_15 : i32
          %35 = arith.addi %c48_i32, %34 : i32
          %36 = arith.addi %35, %0 : i32
          %true_16 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %26 = arith.addi %arg2, %25#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %27 = arith.addi %arg3, %c1_i32 : i32
        %true_10 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %28 = arith.muli %arg3, %c4_i32_11 : i32
        %29 = arith.addi %c64_i32, %28 : i32
        %30 = arith.addi %29, %0 : i32
        %true_12 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%24#0) : (i32) -> ()
    }) : (i1) -> i32
    %c80_i32 = arith.constant 80 : i32
    %22 = arith.addi %c80_i32, %0 : i32
    %true_5 = arith.constant true
    %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

