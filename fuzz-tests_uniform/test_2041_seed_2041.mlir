module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.subgroup_id
    %1 = arith.index_cast %0 : index to i32
    %c4_i32 = arith.constant 4 : i32
    %2 = arith.remsi %arg3, %c4_i32 : i32
    %c4_i32_0 = arith.constant 4 : i32
    %3 = arith.addi %arg0, %c4_i32_0 : i32
    %4 = "simt_step.switch"(%2, %3) ({
    ^bb0(%arg4: i32):
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    ^bb1(%9: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %19 = arith.remsi %arg3, %c4_i32_6 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %20 = arith.addi %19, %c1_i32_7 : i32
        %21 = arith.cmpi slt, %arg6, %20 : i32
        "simt_step.condition"(%21, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c3_i32_6 = arith.constant 3 : i32
        %19 = arith.remsi %arg3, %c3_i32_6 : i32
        %c3_i32_7 = arith.constant 3 : i32
        %20 = arith.addi %arg0, %c3_i32_7 : i32
        %21 = "simt_step.switch"(%19, %20) ({
        ^bb0(%arg7: i32):
          %c1_i32_9 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_9) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %c1_i32_10 = arith.constant 1 : i32
          %24 = arith.addi %arg0, %c1_i32_10 : i32
          "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %22 = arith.addi %arg6, %c1_i32_8 : i32
        "simt_step.break"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%11: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %12 = arith.remsi %arg3, %c3_i32 : i32
      %13 = "simt_step.switch"(%12, %arg0) ({
      ^bb0(%arg5: i32):
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %27 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %28 = arith.addi %27, %c1_i32_13 : i32
          %29 = arith.cmpi slt, %arg7, %28 : i32
          "simt_step.condition"(%29, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c0_i32_12 = arith.constant 0 : i32
          %27 = arith.addi %arg0, %c0_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %28 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.yield"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %27 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %28 = arith.addi %27, %c1_i32_13 : i32
          %29 = arith.cmpi slt, %arg7, %28 : i32
          "simt_step.condition"(%29, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_12 = arith.constant 1 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %27 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.break"(%c1_i32_12, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_10 = arith.constant 3 : i32
        %23 = arith.addi %arg0, %c3_i32_10 : i32
        "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        %c3_i32_11 = arith.constant 3 : i32
        %25 = arith.remsi %arg3, %c3_i32_11 : i32
        %26 = "simt_step.switch"(%25, %arg0) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          %28 = arith.addi %arg0, %c0_i32_12 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          %30 = arith.addi %arg0, %c0_i32_13 : i32
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb3(%31: i32):  // no predecessors
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %c4_i32_4 = arith.constant 4 : i32
      %14 = arith.addi %arg0, %c4_i32_4 : i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb3(%15: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
      %17 = "simt_step.if"(%16) ({
        %c3_i32_6 = arith.constant 3 : i32
        %19 = arith.addi %arg0, %c3_i32_6 : i32
        "simt_step.yield"(%19) : (i32) -> ()
      }, {
        %c3_i32_6 = arith.constant 3 : i32
        %19 = arith.addi %arg0, %c3_i32_6 : i32
        "simt_step.yield"(%19) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %6 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %8 = arith.select %7, %1, %4 : i32
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
    %5 = simt_step.lane_id
    %6 = arith.index_cast %5 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %7 = arith.addi %c8_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %8, %c0_i32_0 : i32
    %10 = "simt_step.if"(%9) ({
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %22 = arith.muli %arg3, %c4_i32_7 : i32
        %23 = arith.addi %22, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %24 = arith.addi %c12_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_8 : i32
        "simt_step.condition"(%26, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg2, %c1_i32 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %23 = arith.addi %arg3, %c1_i32_7 : i32
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      "simt_step.yield"(%21#0) : (i32) -> ()
    }, {
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %22 = arith.muli %arg3, %c4_i32_7 : i32
        %23 = arith.addi %22, %0 : i32
        %c32_i32_8 = arith.constant 32 : i32
        %24 = arith.addi %c32_i32_8, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_9 : i32
        "simt_step.condition"(%26, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %22 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      "simt_step.yield"(%21#0) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %11 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.addi %0, %c0_i32_1 : i32
    %c52_i32 = arith.constant 52 : i32
    %14 = arith.addi %c52_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %16 = simt_step.lane_id
    %17 = arith.index_cast %16 : index to i32
    %18 = "simt_step.switch"(%15, %17) ({
    ^bb0(%arg2: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %21 = arith.addi %0, %c4_i32_4 : i32
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %23 = arith.addi %c56_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %25 = arith.addi %0, %c2_i32 : i32
      %26 = "simt_step.switch"(%24, %25) ({
      ^bb0(%arg3: i32):
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %33 = arith.addi %c60_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_7 = arith.constant 4 : i32
        %35 = arith.addi %0, %c4_i32_7 : i32
        %36 = "simt_step.switch"(%34, %35) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          %c3_i32_13 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb3(%46: i32):  // no predecessors
          %c0_i32_14 = arith.constant 0 : i32
          %47 = arith.addi %0, %c0_i32_14 : i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_13 : i32
          %45 = arith.addi %44, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %46 = arith.addi %c64_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_14 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.break"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%38#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%39: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %40 = arith.addi %c84_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_12 : i32
        %43 = "simt_step.if"(%42) ({
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) : (i32) -> ()
        }, {
          %c3_i32_13 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c88_i32 = arith.constant 88 : i32
      %28 = arith.addi %c88_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %30 = arith.cmpi ne, %29, %c0_i32_6 : i32
      %31 = "simt_step.if"(%30) ({
        %c1_i32 = arith.constant 1 : i32
        %32 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%32) : (i32) -> ()
      }, {
        %c92_i32 = arith.constant 92 : i32
        %32 = arith.addi %c92_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %34 = arith.addi %0, %c3_i32 : i32
        %35 = "simt_step.switch"(%33, %34) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          %37 = arith.addi %0, %c2_i32_8 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          %39 = arith.addi %0, %c0_i32_9 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb3(%40: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%35) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %19 = arith.addi %c32_i32, %0 : i32
    %true_3 = arith.constant true
    %20 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

