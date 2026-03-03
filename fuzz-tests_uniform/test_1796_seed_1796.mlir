module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32_9 = arith.constant 4 : i32
      %15 = arith.remsi %arg3, %c4_i32_9 : i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %15, %c1_i32 : i32
      %17 = arith.cmpi slt, %arg5, %16 : i32
      "simt_step.condition"(%17, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %15 = simt_step.lane_id
      %16 = arith.index_cast %15 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%16, %17) : (i32, i32) -> ()
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
      %c4_i32_9 = arith.constant 4 : i32
      %15 = arith.remsi %arg3, %c4_i32_9 : i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %15, %c1_i32 : i32
      %17 = arith.cmpi slt, %arg5, %16 : i32
      "simt_step.condition"(%17, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %15 = simt_step.lane_id
      %16 = arith.index_cast %15 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_4 = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %5 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_5 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
    %7 = arith.select %6, %0#0, %3#0 : i32
    %c4_i32 = arith.constant 4 : i32
    %8 = arith.remsi %arg3, %c4_i32 : i32
    %c4_i32_6 = arith.constant 4 : i32
    %9 = arith.addi %arg0, %c4_i32_6 : i32
    %10 = "simt_step.switch"(%8, %9) ({
    ^bb0(%arg4: i32):
      %c2_i32 = arith.constant 2 : i32
      %15 = arith.remsi %arg3, %c2_i32 : i32
      %16 = "simt_step.switch"(%15, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %31 = arith.remsi %arg3, %c4_i32_16 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %32 = arith.addi %31, %c1_i32_17 : i32
          %33 = arith.cmpi slt, %arg7, %32 : i32
          "simt_step.condition"(%33, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_16 = arith.constant 3 : i32
          %31 = arith.addi %arg0, %c3_i32_16 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %32 = arith.addi %arg7, %c1_i32_17 : i32
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c1_i32_14 = arith.constant 1 : i32
        %28 = arith.addi %arg0, %c1_i32_14 : i32
        %29 = "simt_step.switch"(%arg3, %28) ({
        ^bb0(%arg6: i32):
          %c1_i32_16 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_16) {fallthrough = false} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %c3_i32_17 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c2_i32_15 = arith.constant 2 : i32
        %30 = arith.addi %arg0, %c2_i32_15 : i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %17 = arith.addi %arg0, %c3_i32 : i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
      %22 = "simt_step.if"(%21) ({
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %27 = arith.remsi %arg3, %c4_i32_14 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %28 = arith.addi %27, %c1_i32_15 : i32
          %29 = arith.cmpi slt, %arg6, %28 : i32
          "simt_step.condition"(%29, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_14 = arith.constant 1 : i32
          %27 = arith.addi %arg0, %c1_i32_14 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %28 = arith.addi %arg6, %c1_i32_15 : i32
          "simt_step.yield"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) : (i32) -> ()
      }, {
        %c2_i32_12 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_12) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32_10 = arith.constant 1 : i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb3(%23: i32):  // no predecessors
      %c2_i32_11 = arith.constant 2 : i32
      %24 = arith.remsi %arg3, %c2_i32_11 : i32
      %25 = "simt_step.switch"(%24, %arg0) ({
      ^bb0(%arg5: i32):
        %c3_i32_12 = arith.constant 3 : i32
        %26 = arith.remsi %arg3, %c3_i32_12 : i32
        %27 = "simt_step.switch"(%26, %arg0) ({
        ^bb0(%arg6: i32):
          %c4_i32_18 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_18) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %c4_i32_19 = arith.constant 4 : i32
          %35 = arith.addi %arg0, %c4_i32_19 : i32
          "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          %c1_i32_20 = arith.constant 1 : i32
          %37 = arith.addi %arg0, %c1_i32_20 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %33 = arith.remsi %arg3, %c4_i32_18 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %34 = arith.addi %33, %c1_i32_19 : i32
          %35 = arith.cmpi slt, %arg7, %34 : i32
          "simt_step.condition"(%35, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %33 = arith.addi %arg0, %c4_i32_18 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %34 = arith.addi %arg7, %c1_i32_19 : i32
          "simt_step.continue"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_15 = arith.constant 1 : i32
        %30 = arith.addi %arg0, %c1_i32_15 : i32
        "simt_step.yield"(%29#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%31: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %33 = arith.remsi %arg3, %c4_i32_18 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %34 = arith.addi %33, %c1_i32_19 : i32
          %35 = arith.cmpi slt, %arg7, %34 : i32
          "simt_step.condition"(%35, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_18 = arith.constant 1 : i32
          %33 = arith.addi %arg0, %c1_i32_18 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %34 = arith.addi %arg7, %c1_i32_19 : i32
          "simt_step.break"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_7 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %12 = arith.addi %c32_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_8 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
    %14 = arith.select %13, %7, %10 : i32
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
      %c4_i32_11 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_11 : i32
      %15 = arith.addi %14, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %16 = arith.addi %c8_i32, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_12 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %14 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %6 = arith.addi %c48_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_11 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_11 : i32
      %15 = arith.addi %14, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %16 = arith.addi %c28_i32, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_12 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_11 = arith.constant 0 : i32
      %c0_i32_12 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %17 = arith.muli %arg5, %c4_i32_14 : i32
        %18 = arith.addi %17, %0 : i32
        %c48_i32_15 = arith.constant 48 : i32
        %19 = arith.addi %c48_i32_15, %18 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_16 : i32
        "simt_step.condition"(%21, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %17 = arith.addi %arg4, %arg5 : i32
        %c1_i32_14 = arith.constant 1 : i32
        %18 = arith.addi %arg5, %c1_i32_14 : i32
        "simt_step.yield"(%17, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_13 = arith.constant true
      %15 = arith.addi %arg2, %14#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%15, %16) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %9 = arith.addi %c64_i32, %0 : i32
    %true_6 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_7 = arith.constant 0 : i32
    %c0_i32_8 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_11 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_11 : i32
      %15 = arith.addi %14, %0 : i32
      %c68_i32 = arith.constant 68 : i32
      %16 = arith.addi %c68_i32, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_12 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %14 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_9 = arith.constant true
    %c80_i32 = arith.constant 80 : i32
    %12 = arith.addi %c80_i32, %0 : i32
    %true_10 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

