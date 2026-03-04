module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = "simt_step.switch"(%arg3, %c4_i32) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %3 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %4 = "simt_step.if"(%3) ({
        %c0_i32_3 = arith.constant 0 : i32
        %9 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %10 = "simt_step.if"(%9) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%10) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %9:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %10 = arith.remsi %arg3, %c4_i32_5 : i32
          %c1_i32 = arith.constant 1 : i32
          %11 = arith.addi %10, %c1_i32 : i32
          %12 = arith.cmpi slt, %arg6, %11 : i32
          "simt_step.condition"(%12, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c2_i32 = arith.constant 2 : i32
          %10 = arith.addi %arg0, %c2_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %11 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.break"(%10, %11) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%9#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c4_i32_1 = arith.constant 4 : i32
      %6 = arith.remsi %arg3, %c4_i32_1 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %7 = arith.addi %arg0, %c0_i32_2 : i32
      %8 = "simt_step.switch"(%6, %7) ({
      ^bb0(%arg5: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %9:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32 : i32
          %18 = arith.cmpi slt, %arg7, %17 : i32
          "simt_step.condition"(%18, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32 = arith.constant 1 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %16 = arith.addi %arg7, %c1_i32_10 : i32
          "simt_step.yield"(%c1_i32, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %c4_i32_5 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32_5 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %12 = "simt_step.switch"(%11, %c0_i32_6) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %17 = arith.addi %arg0, %c3_i32 : i32
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb2(%18: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %19 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb3(%20: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb2(%13: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32 : i32
          %18 = arith.cmpi slt, %arg7, %17 : i32
          "simt_step.condition"(%18, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32 = arith.constant 3 : i32
          %c1_i32 = arith.constant 1 : i32
          %16 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%c3_i32, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%15: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_9) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32, %arg0 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_2 : i32
      %12 = arith.addi %11, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %13 = arith.addi %c8_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_3 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %18 = arith.muli %arg5, %c4_i32_6 : i32
        %19 = arith.addi %18, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %20 = arith.addi %c28_i32, %19 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_7 : i32
        "simt_step.condition"(%22, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c48_i32_6 = arith.constant 48 : i32
        %18 = arith.addi %c48_i32_6, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_7 : i32
        %21 = "simt_step.if"(%20) ({
          %30 = simt_step.subgroup_id
          %31 = arith.index_cast %30 : index to i32
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %22 = arith.addi %c16_i32, %0 : i32
        %true_8 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %24 = arith.addi %arg4, %21 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %25 = arith.addi %arg5, %c1_i32_9 : i32
        %true_10 = arith.constant true
        %c32_i32 = arith.constant 32 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %26 = arith.muli %arg5, %c4_i32_11 : i32
        %27 = arith.addi %c32_i32, %26 : i32
        %28 = arith.addi %27, %0 : i32
        %true_12 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %12 = arith.addi %arg2, %11#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c48_i32 = arith.constant 48 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_4 : i32
      %15 = arith.addi %c48_i32, %14 : i32
      %16 = arith.addi %15, %0 : i32
      %true_5 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c52_i32 = arith.constant 52 : i32
    %6 = arith.addi %c52_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.lane_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c56_i32 = arith.constant 56 : i32
      %11 = arith.addi %c56_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_2 : i32
      %14 = "simt_step.if"(%13) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %20 = arith.muli %arg4, %c4_i32_9 : i32
          %21 = arith.addi %20, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %22 = arith.addi %c60_i32, %21 : i32
          %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %24 = arith.cmpi ne, %23, %c0_i32_10 : i32
          "simt_step.condition"(%24, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %20 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg4, %c1_i32 : i32
          %true = arith.constant true
          "simt_step.yield"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) : (i32) -> ()
      }, {
        %c80_i32 = arith.constant 80 : i32
        %19 = arith.addi %c80_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_7 : i32
        %22 = "simt_step.if"(%21) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %19 = arith.muli %arg4, %c4_i32_7 : i32
        %20 = arith.addi %19, %0 : i32
        %c84_i32 = arith.constant 84 : i32
        %21 = arith.addi %c84_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_8 : i32
        "simt_step.condition"(%23, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c104_i32 = arith.constant 104 : i32
        %19 = arith.addi %c104_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %21 = "simt_step.switch"(%20, %c1_i32) ({
        ^bb0(%arg5: i32):
          %c0_i32_8 = arith.constant 0 : i32
          %24 = arith.addi %0, %c0_i32_8 : i32
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %22 = arith.addi %arg3, %21 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %23 = arith.addi %arg4, %c1_i32_7 : i32
        %true = arith.constant true
        "simt_step.break"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%17: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %19 = arith.muli %arg4, %c4_i32_7 : i32
        %20 = arith.addi %19, %0 : i32
        %c108_i32 = arith.constant 108 : i32
        %21 = arith.addi %c108_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_8 : i32
        "simt_step.condition"(%23, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %22 = arith.muli %arg6, %c4_i32_9 : i32
          %23 = arith.addi %22, %0 : i32
          %c128_i32 = arith.constant 128 : i32
          %24 = arith.addi %c128_i32, %23 : i32
          %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %26 = arith.cmpi ne, %25, %c0_i32_10 : i32
          "simt_step.condition"(%26, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %22 = arith.addi %arg5, %arg6 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %23 = arith.addi %arg6, %c1_i32_9 : i32
          %true_10 = arith.constant true
          "simt_step.break"(%22, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %20 = arith.addi %arg3, %19#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.addi %arg4, %c1_i32 : i32
        %true = arith.constant true
        "simt_step.break"(%20, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

