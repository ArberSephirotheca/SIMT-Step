module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %arg0, %c0_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32_0, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c4_i32 = arith.constant 4 : i32
    %5 = arith.remsi %arg3, %c4_i32 : i32
    %6 = simt_step.subgroup_id
    %7 = arith.index_cast %6 : index to i32
    %8 = "simt_step.switch"(%5, %7) ({
    ^bb0(%arg4: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %25 = arith.remsi %arg3, %c4_i32_12 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %25, %c1_i32 : i32
        %27 = arith.cmpi slt, %arg6, %26 : i32
        "simt_step.condition"(%27, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %27 = arith.remsi %arg3, %c4_i32_15 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %28 = arith.addi %27, %c1_i32_16 : i32
          %29 = arith.cmpi slt, %arg8, %28 : i32
          "simt_step.condition"(%29, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c1_i32_15 = arith.constant 1 : i32
          %27 = arith.addi %arg8, %c1_i32_15 : i32
          "simt_step.yield"(%arg0, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32_14 = arith.constant 2 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%25#0, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %25 = arith.remsi %arg3, %c4_i32_12 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %25, %c1_i32 : i32
        %27 = arith.cmpi slt, %arg6, %26 : i32
        "simt_step.condition"(%27, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %25 = arith.addi %arg0, %c4_i32_12 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c2_i32_7 = arith.constant 2 : i32
      "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%16: i32):  // no predecessors
      %c2_i32_8 = arith.constant 2 : i32
      %17 = arith.remsi %arg3, %c2_i32_8 : i32
      %c4_i32_9 = arith.constant 4 : i32
      %18 = arith.addi %arg0, %c4_i32_9 : i32
      %19 = "simt_step.switch"(%17, %18) ({
      ^bb0(%arg5: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %30 = arith.remsi %arg3, %c4_i32_18 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %30, %c1_i32 : i32
          %32 = arith.cmpi slt, %arg7, %31 : i32
          "simt_step.condition"(%32, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %arg0, %c1_i32 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %31 = arith.addi %arg7, %c1_i32_18 : i32
          "simt_step.continue"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c4_i32_14 = arith.constant 4 : i32
        %27 = arith.addi %arg0, %c4_i32_14 : i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %30 = arith.remsi %arg3, %c4_i32_18 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %30, %c1_i32 : i32
          %32 = arith.cmpi slt, %arg7, %31 : i32
          "simt_step.condition"(%32, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_18 = arith.constant 3 : i32
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.break"(%c3_i32_18, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c4_i32_17 = arith.constant 4 : i32
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c2_i32_10 = arith.constant 2 : i32
      %20 = arith.addi %arg0, %c2_i32_10 : i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb3(%21: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %22 = arith.remsi %arg3, %c3_i32 : i32
      %23 = "simt_step.switch"(%22, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %32 = arith.remsi %arg3, %c4_i32_19 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %32, %c1_i32 : i32
          %34 = arith.cmpi slt, %arg7, %33 : i32
          "simt_step.condition"(%34, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg0, %c1_i32 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %33 = arith.addi %arg7, %c1_i32_19 : i32
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
      ^bb2(%27: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %32 = arith.remsi %arg3, %c4_i32_19 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %32, %c1_i32 : i32
          %34 = arith.cmpi slt, %arg7, %33 : i32
          "simt_step.condition"(%34, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%arg0, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%28#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%29: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %32 = arith.remsi %arg3, %c4_i32_19 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %32, %c1_i32 : i32
          %34 = arith.cmpi slt, %arg7, %33 : i32
          "simt_step.condition"(%34, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%arg0, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c0_i32_18 = arith.constant 0 : i32
        %31 = arith.addi %arg0, %c0_i32_18 : i32
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %24 = arith.addi %arg0, %c0_i32_11 : i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %12 = arith.select %11, %2, %8 : i32
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
      %c4_i32_7 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_7 : i32
      %12 = arith.addi %11, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %13 = arith.addi %c8_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_8 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %11 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %6 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_7 : i32
      %12 = arith.addi %11, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %13 = arith.addi %c28_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_8 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c48_i32_7 = arith.constant 48 : i32
      %11 = arith.addi %c48_i32_7, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_8 : i32
      %14 = "simt_step.if"(%13) ({
        %17 = simt_step.lane_id
        %18 = arith.index_cast %17 : index to i32
        "simt_step.yield"(%18) : (i32) -> ()
      }, {
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %18 = arith.muli %arg5, %c4_i32_12 : i32
          %19 = arith.addi %18, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %20 = arith.addi %c52_i32, %19 : i32
          %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %22 = arith.cmpi ne, %21, %c0_i32_13 : i32
          "simt_step.condition"(%22, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %18 = arith.addi %arg4, %arg5 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %19 = arith.addi %arg5, %c1_i32_12 : i32
          "simt_step.yield"(%18, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%17#0) : (i32) -> ()
      }) : (i1) -> i32
      %15 = arith.addi %arg2, %14 : i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.continue"(%15, %16) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %9 = arith.addi %c48_i32, %0 : i32
    %true_6 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

