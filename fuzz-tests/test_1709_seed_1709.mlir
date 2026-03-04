module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c3_i32 = arith.constant 3 : i32
        %4 = arith.remsi %arg3, %c3_i32 : i32
        %5 = "simt_step.switch"(%4, %arg0) ({
        ^bb0(%arg4: i32):
          %c3_i32_1 = arith.constant 3 : i32
          %6 = arith.addi %arg0, %c3_i32_1 : i32
          "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
        ^bb1(%7: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%8: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%9: i32):  // no predecessors
          %c2_i32_2 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_2) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%5) : (i32) -> ()
      }, {
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32 : i32
          %7 = arith.cmpi slt, %arg5, %6 : i32
          "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_3 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg5, %c4_i32 : i32
          %7 = arith.addi %c0_i32_3, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %9 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
    }, {
      %c4_i32 = arith.constant 4 : i32
      %2 = arith.remsi %arg3, %c4_i32 : i32
      %3 = simt_step.subgroup_id
      %4 = arith.index_cast %3 : index to i32
      %5 = "simt_step.switch"(%2, %4) ({
      ^bb0(%arg4: i32):
        %c2_i32 = arith.constant 2 : i32
        %6 = arith.remsi %arg3, %c2_i32 : i32
        %c2_i32_0 = arith.constant 2 : i32
        %7 = "simt_step.switch"(%6, %c2_i32_0) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%15: i32):  // no predecessors
          %c4_i32_6 = arith.constant 4 : i32
          %16 = arith.addi %arg0, %c4_i32_6 : i32
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb2(%17: i32):  // no predecessors
          %c1_i32_7 = arith.constant 1 : i32
          %18 = arith.addi %arg0, %c1_i32_7 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        %c2_i32_1 = arith.constant 2 : i32
        %9 = arith.remsi %arg3, %c2_i32_1 : i32
        %c1_i32 = arith.constant 1 : i32
        %10 = arith.addi %arg0, %c1_i32 : i32
        %11 = "simt_step.switch"(%9, %10) ({
        ^bb0(%arg5: i32):
          %c0_i32_6 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_6) {fallthrough = false} : (i32) -> ()
        ^bb1(%15: i32):  // no predecessors
          %c1_i32_7 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_7) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32_2 = arith.constant 1 : i32
        "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
      ^bb2(%12: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32_6 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32_7 : i32
          %17 = arith.cmpi slt, %arg6, %16 : i32
          "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c0_i32_6 = arith.constant 0 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %15 = arith.addi %arg6, %c1_i32_7 : i32
          "simt_step.yield"(%c0_i32_6, %15) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%14: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_5) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%5) : (i32) -> ()
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
    %c1_i32 = arith.constant 1 : i32
    %5 = arith.addi %0, %c1_i32 : i32
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_0 : i32
    %9 = "simt_step.if"(%8) ({
      "simt_step.yield"(%0) : (i32) -> ()
    }, {
      %17 = simt_step.subgroup_id
      %18 = arith.index_cast %17 : index to i32
      "simt_step.yield"(%18) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c12_i32 = arith.constant 12 : i32
    %12 = arith.addi %c12_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = "simt_step.switch"(%13, %0) ({
    ^bb0(%arg2: i32):
      %c16_i32_3 = arith.constant 16 : i32
      %17 = arith.addi %c16_i32_3, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %19 = "simt_step.switch"(%18, %c3_i32) ({
      ^bb0(%arg3: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %37 = arith.muli %arg5, %c4_i32_9 : i32
          %38 = arith.addi %37, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %39 = arith.addi %c20_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_10 : i32
          "simt_step.condition"(%41, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %37 = arith.addi %arg4, %arg5 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %38 = arith.addi %arg5, %c1_i32_9 : i32
          %true_10 = arith.constant true
          "simt_step.break"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %36 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %21 = arith.addi %c40_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_4 : i32
      %24 = "simt_step.if"(%23) ({
        %c44_i32 = arith.constant 44 : i32
        %34 = arith.addi %c44_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_7 : i32
        %37 = "simt_step.if"(%36) ({
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) : (i32) -> ()
        }, {
          %c3_i32_8 = arith.constant 3 : i32
          %38 = arith.addi %0, %c3_i32_8 : i32
          "simt_step.yield"(%38) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%37) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %34 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%34) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %26 = arith.addi %c48_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32_5 = arith.constant 1 : i32
      %28 = "simt_step.switch"(%27, %c1_i32_5) ({
      ^bb0(%arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %34 = arith.addi %0, %c4_i32_7 : i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %36 = arith.addi %c52_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_8 = arith.constant 3 : i32
        %38 = "simt_step.switch"(%37, %c3_i32_8) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %c3_i32_10 = arith.constant 3 : i32
          %40 = arith.addi %0, %c3_i32_10 : i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %42 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%42) {fallthrough = true} : (i32) -> ()
        ^bb3(%43: i32):  // no predecessors
          %c0_i32_11 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    ^bb3(%29: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %30 = arith.addi %c56_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %32 = arith.cmpi ne, %31, %c0_i32_6 : i32
      %33 = "simt_step.if"(%32) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_9 : i32
          %36 = arith.addi %35, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %37 = arith.addi %c60_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_10 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32_9 : i32
          %true_10 = arith.constant true
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %15 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

