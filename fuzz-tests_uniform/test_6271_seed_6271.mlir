module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %8, %c1_i32 : i32
      %10 = arith.cmpi slt, %arg5, %9 : i32
      "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %8 = simt_step.subgroup_id
      %9 = arith.index_cast %8 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%9, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %3:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %8, %c1_i32 : i32
      %10 = arith.cmpi slt, %arg5, %9 : i32
      "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %8 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
      %9 = "simt_step.if"(%8) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32_9 : i32
          %17 = arith.cmpi slt, %arg7, %16 : i32
          "simt_step.condition"(%17, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_9 = arith.constant 1 : i32
          %15 = arith.addi %arg7, %c1_i32_9 : i32
          "simt_step.continue"(%arg0, %15) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %13 = simt_step.subgroup_id
        %14 = arith.index_cast %13 : index to i32
        "simt_step.yield"(%12#0) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        %12 = arith.addi %arg0, %c3_i32 : i32
        "simt_step.yield"(%12) : (i32) -> ()
      }) : (i1) -> i32
      %c2_i32 = arith.constant 2 : i32
      %10 = arith.addi %arg0, %c2_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%9, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_4 = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %5 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_5 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
    %7 = arith.select %6, %0#0, %3#0 : i32
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
    %c4_i32_0 = arith.constant 4 : i32
    %5 = arith.addi %0, %c4_i32_0 : i32
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      "simt_step.yield"(%0) : (i32) -> ()
    }, {
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%19) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %10 = arith.addi %c32_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c12_i32 = arith.constant 12 : i32
    %12 = arith.addi %c12_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.lane_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %19 = arith.addi %c16_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %21 = "simt_step.switch"(%20, %c0_i32_4) ({
      ^bb0(%arg3: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_21 : i32
          %40 = arith.addi %39, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %41 = arith.addi %c20_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_22 : i32
          "simt_step.condition"(%43, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %39 = arith.addi %arg4, %arg5 : i32
          %c1_i32_21 = arith.constant 1 : i32
          %40 = arith.addi %arg5, %c1_i32_21 : i32
          "simt_step.yield"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %30 = arith.addi %c40_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %32 = "simt_step.switch"(%31, %c0_i32_15) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %39 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c0_i32_21 = arith.constant 0 : i32
          %41 = arith.addi %0, %c0_i32_21 : i32
          "simt_step.yield"(%41) {fallthrough = true} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %34 = arith.addi %c44_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = "simt_step.switch"(%35, %0) ({
        ^bb0(%arg4: i32):
          %c1_i32_21 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_21) {fallthrough = true} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb3(%37: i32):  // no predecessors
        %c0_i32_18 = arith.constant 0 : i32
        %c0_i32_19 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_18, %c0_i32_19) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_21 : i32
          %40 = arith.addi %39, %0 : i32
          %c48_i32_22 = arith.constant 48 : i32
          %41 = arith.addi %c48_i32_22, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_23 : i32
          "simt_step.condition"(%43, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %39 = arith.addi %arg4, %arg5 : i32
          %c1_i32_21 = arith.constant 1 : i32
          %40 = arith.addi %arg5, %c1_i32_21 : i32
          "simt_step.yield"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_20 = arith.constant true
        "simt_step.yield"(%38#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_12 : i32
        %29 = arith.addi %28, %0 : i32
        %c68_i32 = arith.constant 68 : i32
        %30 = arith.addi %c68_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_13 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %28 = arith.addi %arg3, %arg4 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32_12 : i32
        "simt_step.yield"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_12 : i32
        %29 = arith.addi %28, %0 : i32
        %c88_i32 = arith.constant 88 : i32
        %30 = arith.addi %c88_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_13 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c108_i32 = arith.constant 108 : i32
        %28 = arith.addi %c108_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_12 : i32
        %31 = "simt_step.if"(%30) ({
          %c1_i32_14 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_14) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %34 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        %32 = arith.addi %arg3, %31 : i32
        %c1_i32_13 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32_13 : i32
        "simt_step.yield"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_11 = arith.constant true
      "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%26: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %27 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %17 = arith.addi %c48_i32, %0 : i32
    %true_3 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

