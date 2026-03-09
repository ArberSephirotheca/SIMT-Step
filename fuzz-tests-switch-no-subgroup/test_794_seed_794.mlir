module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32_5 : i32
        %9 = arith.cmpi slt, %arg7, %8 : i32
        "simt_step.condition"(%9, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %7 = arith.addi %arg0, %c0_i32_5 : i32
        %8 = "simt_step.switch"(%arg3, %7) ({
        ^bb0(%arg8: i32):
          %c2_i32 = arith.constant 2 : i32
          %10 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
        ^bb1(%11: i32):  // no predecessors
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32_6 = arith.constant 1 : i32
        %9 = arith.addi %arg7, %c1_i32_6 : i32
        "simt_step.break"(%8, %9) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%5#0, %6) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c8_i32 = arith.constant 8 : i32
      %9 = arith.addi %c8_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_7 : i32
      "simt_step.if"(%11) ({
        "simt_step.yield"() : () -> ()
      }, {
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_7 : i32
      %10 = arith.addi %9, %0 : i32
      %c12_i32 = arith.constant 12 : i32
      %11 = arith.addi %c12_i32, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_8 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c32_i32 = arith.constant 32 : i32
      %9 = arith.addi %c32_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_7 : i32
      %12 = "simt_step.if"(%11) ({
        %c36_i32 = arith.constant 36 : i32
        %21 = arith.addi %c36_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_12 : i32
        %24 = "simt_step.if"(%23) ({
          %27 = simt_step.lane_id
          %28 = arith.index_cast %27 : index to i32
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %27 = simt_step.lane_id
          %28 = arith.index_cast %27 : index to i32
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %25 = arith.addi %c16_i32, %0 : i32
        %true_13 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) : (i32) -> ()
      }, {
        %21 = simt_step.lane_id
        %22 = arith.index_cast %21 : index to i32
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      %c32_i32_8 = arith.constant 32 : i32
      %13 = arith.addi %c32_i32_8, %0 : i32
      %true = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %15 = arith.addi %arg2, %12 : i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %arg3, %c1_i32 : i32
      %true_9 = arith.constant true
      %c48_i32 = arith.constant 48 : i32
      %c4_i32_10 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_10 : i32
      %18 = arith.addi %c48_i32, %17 : i32
      %19 = arith.addi %18, %0 : i32
      %true_11 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15, %16) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_7 : i32
      %10 = arith.addi %9, %0 : i32
      %c40_i32 = arith.constant 40 : i32
      %11 = arith.addi %c40_i32, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_8 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %16 = arith.muli %arg5, %c4_i32_11 : i32
        %17 = arith.addi %16, %0 : i32
        %c60_i32 = arith.constant 60 : i32
        %18 = arith.addi %c60_i32, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_12 : i32
        "simt_step.condition"(%20, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %16 = arith.addi %arg4, %arg5 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %17 = arith.addi %arg5, %c1_i32_11 : i32
        %true_12 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %18 = arith.muli %arg5, %c4_i32_13 : i32
        %19 = arith.addi %c64_i32, %18 : i32
        %20 = arith.addi %19, %0 : i32
        %true_14 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %10 = arith.addi %arg2, %9#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %c4_i32_9 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_9 : i32
      %13 = arith.addi %c80_i32, %12 : i32
      %14 = arith.addi %13, %0 : i32
      %true_10 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%10, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_5 = arith.constant 0 : i32
    %c0_i32_6 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_7 : i32
      %10 = arith.addi %9, %0 : i32
      %c80_i32 = arith.constant 80 : i32
      %11 = arith.addi %c80_i32, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_8 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %9 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c96_i32 = arith.constant 96 : i32
      %c4_i32_7 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_7 : i32
      %12 = arith.addi %c96_i32, %11 : i32
      %13 = arith.addi %12, %0 : i32
      %true_8 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

