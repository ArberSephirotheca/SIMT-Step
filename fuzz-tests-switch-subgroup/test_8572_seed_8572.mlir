module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
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
        %true = arith.constant true
        %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %8 = arith.muli %arg7, %c4_i32 : i32
        %9 = arith.addi %c0_i32_5, %8 : i32
        %10 = arith.addi %9, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_6 = arith.constant 1 : i32
        %11 = arith.addi %arg7, %c1_i32_6 : i32
        "simt_step.break"(%7, %11) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%5#0, %6) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_1 = arith.constant 0 : i32
    %1 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %2 = "simt_step.if"(%1) ({
      %true = arith.constant true
      %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %6 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %6 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %6, %c1_i32 : i32
        %8 = arith.cmpi slt, %arg5, %7 : i32
        "simt_step.condition"(%8, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %6:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %9 = arith.addi %8, %c1_i32_7 : i32
          %10 = arith.cmpi slt, %arg7, %9 : i32
          "simt_step.condition"(%10, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.muli %arg7, %c4_i32 : i32
          %10 = arith.addi %c32_i32, %9 : i32
          %11 = arith.addi %10, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_7 = arith.constant 1 : i32
          %12 = arith.addi %arg7, %c1_i32_7 : i32
          "simt_step.yield"(%8, %12) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%6#0, %7) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%5#0) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0#0, %2 : i32
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
      "simt_step.yield"() : () -> ()
    }, {
      %c8_i32 = arith.constant 8 : i32
      %12 = arith.addi %c8_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_2 : i32
      "simt_step.if"(%14) ({
        "simt_step.yield"() : () -> ()
      }, {
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %8 = arith.addi %0, %c1_i32 : i32
    %9 = "simt_step.switch"(%7, %8) ({
    ^bb0(%arg2: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_14 : i32
        %24 = arith.addi %23, %0 : i32
        %c16_i32 = arith.constant 16 : i32
        %25 = arith.addi %c16_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_15 : i32
        "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %30 = arith.muli %arg6, %c4_i32_20 : i32
          %31 = arith.addi %30, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %32 = arith.addi %c36_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_21 : i32
          "simt_step.condition"(%34, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %30 = arith.addi %arg5, %arg6 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %31 = arith.addi %arg6, %c1_i32_20 : i32
          %true_21 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %32 = arith.muli %arg6, %c4_i32_22 : i32
          %33 = arith.addi %c48_i32, %32 : i32
          %34 = arith.addi %33, %0 : i32
          %true_23 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %24 = arith.addi %arg3, %23#0 : i32
        %c1_i32_16 = arith.constant 1 : i32
        %25 = arith.addi %arg4, %c1_i32_16 : i32
        %true_17 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %c4_i32_18 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_18 : i32
        %27 = arith.addi %c64_i32, %26 : i32
        %28 = arith.addi %27, %0 : i32
        %true_19 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_14 : i32
        %24 = arith.addi %23, %0 : i32
        %c56_i32 = arith.constant 56 : i32
        %25 = arith.addi %c56_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_15 : i32
        "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %30 = arith.muli %arg6, %c4_i32_20 : i32
          %31 = arith.addi %30, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %32 = arith.addi %c76_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_21 : i32
          "simt_step.condition"(%34, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %30 = arith.addi %arg5, %arg6 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %31 = arith.addi %arg6, %c1_i32_20 : i32
          %true_21 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %32 = arith.muli %arg6, %c4_i32_22 : i32
          %33 = arith.addi %c80_i32, %32 : i32
          %34 = arith.addi %33, %0 : i32
          %true_23 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %24 = arith.addi %arg3, %23#0 : i32
        %c1_i32_16 = arith.constant 1 : i32
        %25 = arith.addi %arg4, %c1_i32_16 : i32
        %true_17 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %c4_i32_18 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_18 : i32
        %27 = arith.addi %c96_i32, %26 : i32
        %28 = arith.addi %27, %0 : i32
        %true_19 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_14 : i32
        %24 = arith.addi %23, %0 : i32
        %c96_i32 = arith.constant 96 : i32
        %25 = arith.addi %c96_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_15 : i32
        "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %23 = arith.addi %arg3, %arg4 : i32
        %c1_i32_14 = arith.constant 1 : i32
        %24 = arith.addi %arg4, %c1_i32_14 : i32
        %true_15 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %c4_i32_16 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_16 : i32
        %26 = arith.addi %c112_i32, %25 : i32
        %27 = arith.addi %26, %0 : i32
        %true_17 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %17 = arith.addi %c128_i32, %0 : i32
      %true_9 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%19: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_14 : i32
        %24 = arith.addi %23, %0 : i32
        %c116_i32 = arith.constant 116 : i32
        %25 = arith.addi %c116_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_15 : i32
        "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %30 = arith.muli %arg6, %c4_i32_20 : i32
          %31 = arith.addi %30, %0 : i32
          %c136_i32 = arith.constant 136 : i32
          %32 = arith.addi %c136_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_21 : i32
          "simt_step.condition"(%34, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %30 = arith.addi %arg5, %arg6 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %31 = arith.addi %arg6, %c1_i32_20 : i32
          %true_21 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %32 = arith.muli %arg6, %c4_i32_22 : i32
          %33 = arith.addi %c144_i32, %32 : i32
          %34 = arith.addi %33, %0 : i32
          %true_23 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %24 = arith.addi %arg3, %23#0 : i32
        %c1_i32_16 = arith.constant 1 : i32
        %25 = arith.addi %arg4, %c1_i32_16 : i32
        %true_17 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %c4_i32_18 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_18 : i32
        %27 = arith.addi %c160_i32, %26 : i32
        %28 = arith.addi %27, %0 : i32
        %true_19 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_12 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %21 = arith.addi %c176_i32, %0 : i32
      %true_13 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c192_i32 = arith.constant 192 : i32
    %10 = arith.addi %c192_i32, %0 : i32
    %true_1 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

