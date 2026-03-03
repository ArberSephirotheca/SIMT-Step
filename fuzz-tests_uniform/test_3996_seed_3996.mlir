module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c1_i32 = arith.constant 1 : i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %11 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32_6 = arith.constant 1 : i32
      %12 = arith.addi %11, %c1_i32_6 : i32
      %13 = arith.cmpi slt, %arg5, %12 : i32
      "simt_step.condition"(%13, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %11 = simt_step.subgroup_id
      %12 = arith.index_cast %11 : index to i32
      %c1_i32_6 = arith.constant 1 : i32
      %13 = arith.addi %arg5, %c1_i32_6 : i32
      "simt_step.yield"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %c1_i32, %0#0 : i32
    %c3_i32 = arith.constant 3 : i32
    %5 = arith.remsi %arg3, %c3_i32 : i32
    %c1_i32_3 = arith.constant 1 : i32
    %6 = "simt_step.switch"(%5, %c1_i32_3) ({
    ^bb0(%arg4: i32):
      %c4_i32 = arith.constant 4 : i32
      %11 = arith.addi %arg0, %c4_i32 : i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %13 = arith.remsi %arg3, %c2_i32 : i32
      %14 = "simt_step.switch"(%13, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
        %25 = "simt_step.if"(%24) ({
          %c4_i32_17 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_17) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %26 = arith.addi %arg0, %c0_i32_13 : i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c4_i32_14 = arith.constant 4 : i32
        %28 = arith.remsi %arg3, %c4_i32_14 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %29 = "simt_step.switch"(%28, %c0_i32_15) ({
        ^bb0(%arg6: i32):
          %c0_i32_17 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_17) {fallthrough = false} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          %c1_i32_18 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_18) {fallthrough = true} : (i32) -> ()
        ^bb3(%33: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %30 = arith.addi %arg0, %c0_i32_16 : i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32_6 = arith.constant 1 : i32
      %15 = arith.addi %arg0, %c1_i32_6 : i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb2(%16: i32):  // no predecessors
      %c2_i32_7 = arith.constant 2 : i32
      %17 = arith.remsi %arg3, %c2_i32_7 : i32
      %c2_i32_8 = arith.constant 2 : i32
      %18 = arith.addi %arg0, %c2_i32_8 : i32
      %19 = "simt_step.switch"(%17, %18) ({
      ^bb0(%arg5: i32):
        %c3_i32_12 = arith.constant 3 : i32
        %24 = arith.addi %arg0, %c3_i32_12 : i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %arg2, %c0_i32_13 : i32
        %27 = "simt_step.if"(%26) ({
          %c1_i32_17 = arith.constant 1 : i32
          %30 = arith.addi %arg0, %c1_i32_17 : i32
          "simt_step.yield"(%30) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32_14 = arith.constant 2 : i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %30 = arith.remsi %arg3, %c4_i32_17 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %31 = arith.addi %30, %c1_i32_18 : i32
          %32 = arith.cmpi slt, %arg7, %31 : i32
          "simt_step.condition"(%32, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c2_i32_17 = arith.constant 2 : i32
          %30 = arith.addi %arg0, %c2_i32_17 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %31 = arith.addi %arg7, %c1_i32_18 : i32
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c4_i32_9 = arith.constant 4 : i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb3(%20: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %arg2, %c0_i32_10 : i32
      %22 = "simt_step.if"(%21) ({
        %c1_i32_12 = arith.constant 1 : i32
        %24 = "simt_step.switch"(%arg3, %c1_i32_12) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %c2_i32_14 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c2_i32_13 = arith.constant 2 : i32
        %25 = arith.addi %arg0, %c2_i32_13 : i32
        "simt_step.yield"(%24) : (i32) -> ()
      }, {
        %c0_i32_12 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
        %25 = "simt_step.if"(%24) ({
          %c1_i32_14 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_14) : (i32) -> ()
        }, {
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_13 = arith.constant 4 : i32
        %26 = arith.addi %arg0, %c4_i32_13 : i32
        "simt_step.yield"(%25) : (i32) -> ()
      }) : (i1) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %23 = arith.addi %arg0, %c0_i32_11 : i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_4 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_5 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
    %10 = arith.select %9, %4, %6 : i32
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
      %15 = arith.muli %arg3, %c4_i32_5 : i32
      %16 = arith.addi %15, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %17 = arith.addi %c8_i32, %16 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_6 : i32
      "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %15 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.continue"(%15, %16) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %6 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c28_i32 = arith.constant 28 : i32
    %8 = arith.addi %c28_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = simt_step.subgroup_id
    %11 = arith.index_cast %10 : index to i32
    %12 = "simt_step.switch"(%9, %11) ({
    ^bb0(%arg2: i32):
      %c32_i32_5 = arith.constant 32 : i32
      %15 = arith.addi %c32_i32_5, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_6 = arith.constant 4 : i32
      %17 = "simt_step.switch"(%16, %c4_i32_6) ({
      ^bb0(%arg3: i32):
        %c0_i32_13 = arith.constant 0 : i32
        %30 = arith.addi %0, %c0_i32_13 : i32
        "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_18 : i32
          %35 = arith.addi %34, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %36 = arith.addi %c36_i32, %35 : i32
          %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %38 = arith.cmpi ne, %37, %c0_i32_19 : i32
          "simt_step.condition"(%38, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %34 = arith.addi %arg4, %arg5 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %35 = arith.addi %arg5, %c1_i32_18 : i32
          "simt_step.break"(%34, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        "simt_step.yield"(%32#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c0_i32_17 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_17) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_13 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_13 : i32
        %31 = arith.addi %30, %0 : i32
        %c56_i32 = arith.constant 56 : i32
        %32 = arith.addi %c56_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_14 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %33 = arith.muli %arg6, %c4_i32_17 : i32
          %34 = arith.addi %33, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %35 = arith.addi %c76_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_18 : i32
          "simt_step.condition"(%37, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %33 = arith.addi %arg5, %arg6 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %34 = arith.addi %arg6, %c1_i32_17 : i32
          "simt_step.yield"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        %31 = arith.addi %arg3, %30#0 : i32
        %c1_i32_16 = arith.constant 1 : i32
        %32 = arith.addi %arg4, %c1_i32_16 : i32
        "simt_step.yield"(%31, %32) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%19#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %c96_i32 = arith.constant 96 : i32
      %21 = arith.addi %c96_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_11 : i32
      %24 = "simt_step.if"(%23) ({
        %c0_i32_13 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_13) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
    ^bb3(%25: i32):  // no predecessors
      %c100_i32 = arith.constant 100 : i32
      %26 = arith.addi %c100_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %28 = arith.addi %0, %c1_i32 : i32
      %29 = "simt_step.switch"(%27, %28) ({
      ^bb0(%arg3: i32):
        %c104_i32 = arith.constant 104 : i32
        %30 = arith.addi %c104_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_13 : i32
        %33 = "simt_step.if"(%32) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c0_i32_15 = arith.constant 0 : i32
          %35 = arith.addi %0, %c0_i32_15 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c1_i32_14 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_12 = arith.constant true
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %13 = arith.addi %c48_i32, %0 : i32
    %true_4 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

