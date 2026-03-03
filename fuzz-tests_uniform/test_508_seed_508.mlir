module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c2_i32 = arith.constant 2 : i32
      %4 = arith.remsi %arg3, %c2_i32 : i32
      %5 = simt_step.subgroup_id
      %6 = arith.index_cast %5 : index to i32
      %7 = "simt_step.switch"(%4, %6) ({
      ^bb0(%arg4: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %9 = "simt_step.if"(%8) ({
          %c2_i32_5 = arith.constant 2 : i32
          %15 = arith.addi %arg0, %c2_i32_5 : i32
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %c4_i32_5 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_5) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.addi %arg0, %c4_i32 : i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_3) {fallthrough = false} : (i32) -> ()
      ^bb2(%12: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %14 = "simt_step.if"(%13) ({
          %c4_i32_5 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_5) : (i32) -> ()
        }, {
          %c2_i32_5 = arith.constant 2 : i32
          %15 = arith.addi %arg0, %c2_i32_5 : i32
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      "simt_step.yield"(%7) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %5 = "simt_step.if"(%4) ({
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %7:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %11 = arith.addi %10, %c1_i32 : i32
          %12 = arith.cmpi slt, %arg5, %11 : i32
          "simt_step.condition"(%12, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.addi %arg0, %c1_i32 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %11 = arith.addi %arg5, %c1_i32_4 : i32
          "simt_step.break"(%10, %11) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %8 = simt_step.subgroup_id
        %9 = arith.index_cast %8 : index to i32
        "simt_step.yield"(%7#0) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %7 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %8 = "simt_step.if"(%7) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%8) : (i32) -> ()
      }) : (i1) -> i32
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.addi %arg0, %c2_i32 : i32
      "simt_step.yield"(%5) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_0, %arg0 : i32
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_12 : i32
        %23 = arith.addi %22, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %24 = arith.addi %c12_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_13 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c32_i32_12 = arith.constant 32 : i32
        %22 = arith.addi %c32_i32_12, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %24 = "simt_step.switch"(%23, %0) ({
        ^bb0(%arg5: i32):
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %c1_i32_15 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_15) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %25 = arith.addi %arg3, %24 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_12 : i32
        %23 = arith.addi %22, %0 : i32
        %c36_i32 = arith.constant 36 : i32
        %24 = arith.addi %c36_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_13 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c56_i32 = arith.constant 56 : i32
        %22 = arith.addi %c56_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_12 : i32
        %25 = "simt_step.if"(%24) ({
          %c3_i32 = arith.constant 3 : i32
          %28 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %26 = arith.addi %arg3, %25 : i32
        %c1_i32 = arith.constant 1 : i32
        %27 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.break"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c60_i32 = arith.constant 60 : i32
      %19 = arith.addi %c60_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = "simt_step.switch"(%20, %0) ({
      ^bb0(%arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %22 = arith.addi %c64_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_12 = arith.constant 4 : i32
        %24 = arith.addi %0, %c4_i32_12 : i32
        %25 = "simt_step.switch"(%23, %24) ({
        ^bb0(%arg4: i32):
          %c0_i32_21 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_21) {fallthrough = true} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
        ^bb3(%37: i32):  // no predecessors
          %c1_i32_22 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %35 = arith.muli %arg5, %c4_i32_21 : i32
          %36 = arith.addi %35, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %37 = arith.addi %c68_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_22 : i32
          "simt_step.condition"(%39, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %35 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.break"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        "simt_step.yield"(%27#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %35 = arith.muli %arg5, %c4_i32_21 : i32
          %36 = arith.addi %35, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %37 = arith.addi %c88_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_22 : i32
          "simt_step.condition"(%39, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %35 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_19 = arith.constant true
        "simt_step.yield"(%29#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%30: i32):  // no predecessors
        %c108_i32 = arith.constant 108 : i32
        %31 = arith.addi %c108_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_20 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_20 : i32
        %34 = "simt_step.if"(%33) ({
          %c3_i32 = arith.constant 3 : i32
          %35 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_11 = arith.constant true
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %12:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_5 : i32
      %16 = arith.addi %15, %0 : i32
      %c112_i32 = arith.constant 112 : i32
      %17 = arith.addi %c112_i32, %16 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_6 : i32
      "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %15 = simt_step.subgroup_id
      %16 = arith.index_cast %15 : index to i32
      %17 = arith.addi %arg2, %16 : i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.continue"(%17, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %13 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

