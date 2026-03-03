module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.subgroup_id
    %1 = arith.index_cast %0 : index to i32
    %2 = "simt_step.switch"(%arg3, %1) ({
    ^bb0(%arg4: i32):
      %c2_i32 = arith.constant 2 : i32
      %7 = arith.remsi %arg3, %c2_i32 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %8 = arith.addi %arg0, %c0_i32_1 : i32
      %9 = "simt_step.switch"(%7, %8) ({
      ^bb0(%arg5: i32):
        %c3_i32_4 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_4) {fallthrough = false} : (i32) -> ()
      ^bb1(%13: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32 : i32
          %18 = arith.cmpi slt, %arg7, %17 : i32
          "simt_step.condition"(%18, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32 = arith.constant 1 : i32
          %16 = arith.addi %arg0, %c1_i32 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %17 = arith.addi %arg7, %c1_i32_8 : i32
          "simt_step.continue"(%16, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_7 = arith.constant 3 : i32
        %15 = arith.addi %arg0, %c3_i32_7 : i32
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %c4_i32 = arith.constant 4 : i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %11 = arith.remsi %arg3, %c3_i32 : i32
      %c3_i32_2 = arith.constant 3 : i32
      %12 = "simt_step.switch"(%11, %c3_i32_2) ({
      ^bb0(%arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32_10 : i32
          %22 = arith.cmpi slt, %arg7, %21 : i32
          "simt_step.condition"(%22, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_9 = arith.constant 1 : i32
          %20 = arith.addi %arg0, %c1_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %21 = arith.addi %arg7, %c1_i32_10 : i32
          "simt_step.break"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%14: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %16 = "simt_step.if"(%15) ({
          %c1_i32_9 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_9) : (i32) -> ()
        }, {
          %c4_i32_9 = arith.constant 4 : i32
          %20 = arith.addi %arg0, %c4_i32_9 : i32
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        %c3_i32_7 = arith.constant 3 : i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      ^bb2(%17: i32):  // no predecessors
        %c4_i32_8 = arith.constant 4 : i32
        %18 = arith.remsi %arg3, %c4_i32_8 : i32
        %19 = "simt_step.switch"(%18, %arg0) ({
        ^bb0(%arg6: i32):
          %c0_i32_9 = arith.constant 0 : i32
          %20 = arith.addi %arg0, %c0_i32_9 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%22: i32):  // no predecessors
          %c2_i32_10 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb3(%23: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c4_i32_3 = arith.constant 4 : i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %6 = arith.select %5, %arg0, %2 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_10 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_10 : i32
      %20 = arith.addi %19, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %21 = arith.addi %c8_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_11 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %10:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_10 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_10 : i32
      %20 = arith.addi %19, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %21 = arith.addi %c28_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_11 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = simt_step.lane_id
      %20 = arith.index_cast %19 : index to i32
      %21 = arith.addi %arg2, %20 : i32
      %c1_i32 = arith.constant 1 : i32
      %22 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%21, %22) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %true_6 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c48_i32 = arith.constant 48 : i32
    %13 = arith.addi %c48_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %15 = arith.addi %0, %c2_i32 : i32
    %16 = "simt_step.switch"(%14, %15) ({
    ^bb0(%arg2: i32):
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_16 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_16 : i32
        %32 = arith.addi %31, %0 : i32
        %c52_i32 = arith.constant 52 : i32
        %33 = arith.addi %c52_i32, %32 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_17 : i32
        "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %34 = arith.muli %arg6, %c4_i32_19 : i32
          %35 = arith.addi %34, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %36 = arith.addi %c72_i32, %35 : i32
          %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %38 = arith.cmpi ne, %37, %c0_i32_20 : i32
          "simt_step.condition"(%38, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %34 = arith.addi %arg5, %arg6 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %35 = arith.addi %arg6, %c1_i32_19 : i32
          "simt_step.continue"(%34, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        %32 = arith.addi %arg3, %31#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_12 = arith.constant true
      "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %21 = arith.addi %c92_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32_13 = arith.constant 2 : i32
      %23 = "simt_step.switch"(%22, %c2_i32_13) ({
      ^bb0(%arg3: i32):
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %45 = arith.muli %arg5, %c4_i32_23 : i32
          %46 = arith.addi %45, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %47 = arith.addi %c96_i32, %46 : i32
          %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %49 = arith.cmpi ne, %48, %c0_i32_24 : i32
          "simt_step.condition"(%49, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %45 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %46 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%45, %46) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c116_i32 = arith.constant 116 : i32
        %33 = arith.addi %c116_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %35 = "simt_step.switch"(%34, %0) ({
        ^bb0(%arg4: i32):
          %c0_i32_23 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_23) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%46: i32):  // no predecessors
          %c3_i32_24 = arith.constant 3 : i32
          %47 = arith.addi %0, %c3_i32_24 : i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c120_i32 = arith.constant 120 : i32
        %37 = arith.addi %c120_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_20 = arith.constant 0 : i32
        %39 = "simt_step.switch"(%38, %c0_i32_20) ({
        ^bb0(%arg4: i32):
          %c0_i32_23 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_23) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %c2_i32_24 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_24) {fallthrough = false} : (i32) -> ()
        ^bb2(%46: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_21 = arith.constant true
        "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
      ^bb3(%40: i32):  // no predecessors
        %c124_i32 = arith.constant 124 : i32
        %41 = arith.addi %c124_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_22 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_22 : i32
        %44 = "simt_step.if"(%43) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_14 = arith.constant true
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %25 = arith.addi %0, %c3_i32 : i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb3(%26: i32):  // no predecessors
      %c128_i32 = arith.constant 128 : i32
      %27 = arith.addi %c128_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_15 = arith.constant 0 : i32
      %29 = arith.cmpi ne, %28, %c0_i32_15 : i32
      %30 = "simt_step.if"(%29) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %32 = arith.muli %arg4, %c4_i32_19 : i32
          %33 = arith.addi %32, %0 : i32
          %c132_i32 = arith.constant 132 : i32
          %34 = arith.addi %c132_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_20 : i32
          "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %32 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        "simt_step.yield"(%31#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_7 = arith.constant true
    %c48_i32_8 = arith.constant 48 : i32
    %17 = arith.addi %c48_i32_8, %0 : i32
    %true_9 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

