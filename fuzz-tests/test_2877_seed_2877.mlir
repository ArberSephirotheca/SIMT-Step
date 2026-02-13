module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = arith.addi %arg0, %c2_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c2_i32_0 = arith.constant 2 : i32
      %5 = arith.remsi %arg3, %c2_i32_0 : i32
      %c4_i32 = arith.constant 4 : i32
      %6 = "simt_step.switch"(%5, %c4_i32) ({
      ^bb0(%arg5: i32):
        %c2_i32_5 = arith.constant 2 : i32
        %15 = arith.remsi %arg3, %c2_i32_5 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %16 = arith.addi %arg0, %c0_i32_6 : i32
        %17 = "simt_step.switch"(%15, %16) ({
        ^bb0(%arg6: i32):
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = true} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %c1_i32_13 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c3_i32_7 = arith.constant 3 : i32
        "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c4_i32_8 = arith.constant 4 : i32
        %19 = arith.remsi %arg3, %c4_i32_8 : i32
        %c3_i32_9 = arith.constant 3 : i32
        %20 = "simt_step.switch"(%19, %c3_i32_9) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %c1_i32_12 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb3(%26: i32):  // no predecessors
          %c1_i32_13 = arith.constant 1 : i32
          %27 = arith.addi %arg0, %c1_i32_13 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c4_i32_10 = arith.constant 4 : i32
        %22 = arith.remsi %arg3, %c4_i32_10 : i32
        %c2_i32_11 = arith.constant 2 : i32
        %23 = "simt_step.switch"(%22, %c2_i32_11) ({
        ^bb0(%arg6: i32):
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = true} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %c2_i32_13 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %c4_i32_14 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_14) {fallthrough = true} : (i32) -> ()
        ^bb3(%26: i32):  // no predecessors
          %c3_i32_15 = arith.constant 3 : i32
          %27 = arith.addi %arg0, %c3_i32_15 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c3_i32_1 = arith.constant 3 : i32
      %8 = arith.addi %arg0, %c3_i32_1 : i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c2_i32_2 = arith.constant 2 : i32
      %10 = arith.remsi %arg3, %c2_i32_2 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg0, %c1_i32 : i32
      %12 = "simt_step.switch"(%10, %11) ({
      ^bb0(%arg5: i32):
        %c2_i32_5 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_5) {fallthrough = false} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c1_i32_6 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_6) {fallthrough = false} : (i32) -> ()
      ^bb2(%16: i32):  // no predecessors
        %c2_i32_7 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32_7 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %18 = "simt_step.switch"(%17, %c0_i32_8) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          %20 = arith.addi %arg0, %c0_i32_9 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb3(%13: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32_5 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %16 = arith.addi %15, %c1_i32_6 : i32
        %17 = arith.cmpi slt, %arg6, %16 : i32
        "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %16 = "simt_step.if"(%15) ({
          %c1_i32_7 = arith.constant 1 : i32
          %18 = arith.addi %arg0, %c1_i32_7 : i32
          "simt_step.yield"(%18) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_6 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32_6 : i32
        "simt_step.yield"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %5 = simt_step.subgroup_id
    %6 = arith.index_cast %5 : index to i32
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %9 = arith.addi %c8_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_0 = arith.constant 4 : i32
    %11 = arith.addi %0, %c4_i32_0 : i32
    %12 = "simt_step.switch"(%10, %11) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %15 = arith.addi %c12_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_2 : i32
      %18 = "simt_step.if"(%17) ({
        %c16_i32_5 = arith.constant 16 : i32
        %34 = arith.addi %c16_i32_5, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = "simt_step.switch"(%35, %0) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %c4_i32_7 = arith.constant 4 : i32
          %38 = arith.addi %0, %c4_i32_7 : i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%40: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          %41 = arith.addi %0, %c2_i32_8 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%36) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %20 = arith.addi %c20_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %22 = arith.addi %0, %c1_i32 : i32
      %23 = "simt_step.switch"(%21, %22) ({
      ^bb0(%arg3: i32):
        %c24_i32 = arith.constant 24 : i32
        %34 = arith.addi %c24_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = "simt_step.switch"(%35, %0) ({
        ^bb0(%arg4: i32):
          %c1_i32_8 = arith.constant 1 : i32
          %44 = arith.addi %0, %c1_i32_8 : i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%46: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %47 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_8 : i32
          %45 = arith.addi %44, %0 : i32
          %c28_i32 = arith.constant 28 : i32
          %46 = arith.addi %c28_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_9 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_8 : i32
          %true_9 = arith.constant true
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%38#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %40 = arith.addi %c48_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_7 : i32
        %43 = "simt_step.if"(%42) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c52_i32 = arith.constant 52 : i32
      %25 = arith.addi %c52_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_3 : i32
      %28 = "simt_step.if"(%27) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_7 : i32
          %36 = arith.addi %35, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %37 = arith.addi %c56_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_8 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32_7 : i32
          %true_8 = arith.constant true
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) : (i32) -> ()
      }, {
        %c76_i32 = arith.constant 76 : i32
        %34 = arith.addi %c76_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_5 : i32
        %37 = "simt_step.if"(%36) ({
          %c4_i32_6 = arith.constant 4 : i32
          %38 = arith.addi %0, %c4_i32_6 : i32
          "simt_step.yield"(%38) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %38 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%38) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%37) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    ^bb3(%29: i32):  // no predecessors
      %c80_i32 = arith.constant 80 : i32
      %30 = arith.addi %c80_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %32 = arith.cmpi ne, %31, %c0_i32_4 : i32
      %33 = "simt_step.if"(%32) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_7 : i32
          %36 = arith.addi %35, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %37 = arith.addi %c84_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_8 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32_7 : i32
          %true_8 = arith.constant true
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) : (i32) -> ()
      }, {
        %c104_i32 = arith.constant 104 : i32
        %34 = arith.addi %c104_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_5 : i32
        %37 = "simt_step.if"(%36) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c1_i32_6 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%37) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %13 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

