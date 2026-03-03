module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %3 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %4 = arith.addi %3, %c1_i32 : i32
      %5 = arith.cmpi slt, %arg5, %4 : i32
      "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %4 = "simt_step.if"(%3) ({
        %c2_i32 = arith.constant 2 : i32
        %6 = arith.remsi %arg3, %c2_i32 : i32
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.addi %arg0, %c4_i32 : i32
        %8 = "simt_step.switch"(%6, %7) ({
        ^bb0(%arg6: i32):
          %c3_i32 = arith.constant 3 : i32
          %11 = arith.addi %arg0, %c3_i32 : i32
          "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
        ^bb1(%12: i32):  // no predecessors
          %c3_i32_4 = arith.constant 3 : i32
          %13 = arith.addi %arg0, %c3_i32_4 : i32
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %9 = simt_step.subgroup_id
        %10 = arith.index_cast %9 : index to i32
        "simt_step.yield"(%8) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %6 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %7 = "simt_step.if"(%6) ({
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) : (i32) -> ()
        }, {
          %c1_i32_6 = arith.constant 1 : i32
          %9 = arith.addi %arg0, %c1_i32_6 : i32
          "simt_step.yield"(%9) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %8 = arith.addi %arg0, %c0_i32_5 : i32
        "simt_step.yield"(%7) : (i32) -> ()
      }) : (i1) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%4, %5) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
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
      %c4_i32_13 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_13 : i32
      %21 = arith.addi %20, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %22 = arith.addi %c8_i32, %21 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_14 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_14 : i32
      "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %20 = arith.addi %arg2, %0 : i32
      %c1_i32 = arith.constant 1 : i32
      %21 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%20, %21) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_13 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_13 : i32
      %21 = arith.addi %20, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %22 = arith.addi %c28_i32, %21 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_14 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_14 : i32
      "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %20 = simt_step.subgroup_id
      %21 = arith.index_cast %20 : index to i32
      %22 = arith.addi %arg2, %21 : i32
      %c1_i32 = arith.constant 1 : i32
      %23 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%22, %23) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %9 = arith.addi %c32_i32, %0 : i32
    %true_6 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_7 = arith.constant 0 : i32
    %c0_i32_8 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_13 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_13 : i32
      %21 = arith.addi %20, %0 : i32
      %c48_i32_14 = arith.constant 48 : i32
      %22 = arith.addi %c48_i32_14, %21 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_15 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_15 : i32
      "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %20 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %21 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%20, %21) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_9 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %12 = arith.addi %c48_i32, %0 : i32
    %true_10 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c68_i32 = arith.constant 68 : i32
    %14 = arith.addi %c68_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_11 = arith.constant 0 : i32
    %16 = arith.cmpi ne, %15, %c0_i32_11 : i32
    %17 = "simt_step.if"(%16) ({
      %c72_i32 = arith.constant 72 : i32
      %20 = arith.addi %c72_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_13 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_13 : i32
      %23 = "simt_step.if"(%22) ({
        %c76_i32 = arith.constant 76 : i32
        %24 = arith.addi %c76_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %26 = "simt_step.switch"(%25, %0) ({
        ^bb0(%arg2: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %27 = arith.addi %0, %c4_i32_15 : i32
          "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%31: i32):  // no predecessors
          %c1_i32_16 = arith.constant 1 : i32
          %32 = arith.addi %0, %c1_i32_16 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%26) : (i32) -> ()
      }, {
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %25 = arith.muli %arg3, %c4_i32_17 : i32
          %26 = arith.addi %25, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %27 = arith.addi %c80_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_18 : i32
          "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %25 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg3, %c1_i32 : i32
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        "simt_step.yield"(%24#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) : (i32) -> ()
    }, {
      %c100_i32 = arith.constant 100 : i32
      %20 = arith.addi %c100_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_13 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_13 : i32
      %23 = "simt_step.if"(%22) ({
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %25 = arith.muli %arg3, %c4_i32_17 : i32
          %26 = arith.addi %25, %0 : i32
          %c104_i32 = arith.constant 104 : i32
          %27 = arith.addi %c104_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_18 : i32
          "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %25 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg3, %c1_i32 : i32
          "simt_step.break"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        "simt_step.yield"(%24#0) : (i32) -> ()
      }, {
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %25 = arith.muli %arg3, %c4_i32_17 : i32
          %26 = arith.addi %25, %0 : i32
          %c124_i32 = arith.constant 124 : i32
          %27 = arith.addi %c124_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_18 : i32
          "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %25 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg3, %c1_i32 : i32
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        "simt_step.yield"(%24#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) : (i32) -> ()
    }) : (i1) -> i32
    %c64_i32 = arith.constant 64 : i32
    %18 = arith.addi %c64_i32, %0 : i32
    %true_12 = arith.constant true
    %19 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

