module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %1 = arith.addi %arg0, %c1_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %c0_i32_0 = arith.constant 0 : i32
      %3:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32_5 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32_6 : i32
        %14 = arith.cmpi slt, %arg6, %13 : i32
        "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %13 = "simt_step.if"(%12) ({
          %true = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %16 = arith.muli %arg6, %c4_i32_8 : i32
          %17 = arith.addi %c0_i32_7, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %true = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %16 = arith.muli %arg6, %c4_i32_7 : i32
          %17 = arith.addi %c16_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_6 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32_6 : i32
        "simt_step.yield"(%13, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%3#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%4: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %5 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %6 = "simt_step.if"(%5) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32_8 : i32
          %15 = arith.cmpi slt, %arg6, %14 : i32
          "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %14 = arith.muli %arg6, %c4_i32_7 : i32
          %15 = arith.addi %c32_i32, %14 : i32
          %16 = arith.addi %15, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_8 = arith.constant 1 : i32
          %17 = arith.addi %arg6, %c1_i32_8 : i32
          "simt_step.break"(%13, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%12#0) : (i32) -> ()
      }, {
        %true = arith.constant true
        %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %13 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%12) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
    ^bb2(%7: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %8 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %9 = "simt_step.if"(%8) ({
        %c3_i32 = arith.constant 3 : i32
        %12 = arith.remsi %arg3, %c3_i32 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %13 = arith.addi %arg0, %c1_i32_5 : i32
        %14 = "simt_step.switch"(%12, %13) ({
        ^bb0(%arg5: i32):
          %true_6 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %18 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %true_7 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %21 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
        ^bb2(%22: i32):  // no predecessors
          %true_8 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %24 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
        ^bb3(%25: i32):  // no predecessors
          %true_9 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %27 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %15 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %16 = arith.addi %c128_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%14) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %13 = "simt_step.if"(%12) ({
          %true = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %15 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) : (i32) -> ()
        }, {
          %true = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %15 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%13) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb3(%10: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32_5 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32_6 : i32
        %14 = arith.cmpi slt, %arg6, %13 : i32
        "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %14 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %15 = arith.addi %14, %c1_i32_9 : i32
          %16 = arith.cmpi slt, %arg8, %15 : i32
          "simt_step.condition"(%16, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %15 = arith.muli %arg8, %c4_i32_8 : i32
          %16 = arith.addi %c176_i32, %15 : i32
          %17 = arith.addi %16, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_9 = arith.constant 1 : i32
          %18 = arith.addi %arg8, %c1_i32_9 : i32
          "simt_step.yield"(%14, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_7 = arith.constant 1 : i32
        %13 = arith.addi %arg6, %c1_i32_7 : i32
        "simt_step.yield"(%12#0, %13) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
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
    %5 = arith.addi %0, %c0_i32_0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_4 : i32
      %14 = arith.addi %13, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %15 = arith.addi %c8_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_5 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %13 = arith.addi %arg2, %0 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true_4 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_5 : i32
      %16 = arith.addi %c192_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_6 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %7 = arith.addi %c28_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %8, %c0_i32_3 : i32
    %10 = "simt_step.if"(%9) ({
      %c32_i32 = arith.constant 32 : i32
      %13 = arith.addi %c32_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_4 : i32
      %16 = "simt_step.if"(%15) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %20 = arith.muli %arg3, %c4_i32_8 : i32
          %21 = arith.addi %20, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %22 = arith.addi %c36_i32, %21 : i32
          %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %24 = arith.cmpi ne, %23, %c0_i32_9 : i32
          "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %20 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg3, %c1_i32 : i32
          %true_8 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %22 = arith.muli %arg3, %c4_i32_9 : i32
          %23 = arith.addi %c208_i32, %22 : i32
          %24 = arith.addi %23, %0 : i32
          %true_10 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %20 = arith.muli %arg3, %c4_i32_8 : i32
          %21 = arith.addi %20, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %22 = arith.addi %c56_i32, %21 : i32
          %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %24 = arith.cmpi ne, %23, %c0_i32_9 : i32
          "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %20 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg3, %c1_i32 : i32
          %true_8 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %22 = arith.muli %arg3, %c4_i32_9 : i32
          %23 = arith.addi %c224_i32, %22 : i32
          %24 = arith.addi %23, %0 : i32
          %true_10 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) : (i32) -> ()
      }) : (i1) -> i32
      %c240_i32 = arith.constant 240 : i32
      %17 = arith.addi %c240_i32, %0 : i32
      %true_5 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) : (i32) -> ()
    }, {
      %c76_i32 = arith.constant 76 : i32
      %13 = arith.addi %c76_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_4 : i32
      %16 = "simt_step.if"(%15) ({
        %c80_i32 = arith.constant 80 : i32
        %19 = arith.addi %c80_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_6 : i32
        %22 = "simt_step.if"(%21) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %23 = arith.addi %c256_i32, %0 : i32
        %true_7 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) : (i32) -> ()
      }, {
        %c84_i32 = arith.constant 84 : i32
        %19 = arith.addi %c84_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_6 : i32
        %22 = "simt_step.if"(%21) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %25 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%25) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %23 = arith.addi %c272_i32, %0 : i32
        %true_7 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      %c288_i32 = arith.constant 288 : i32
      %17 = arith.addi %c288_i32, %0 : i32
      %true_5 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) : (i32) -> ()
    }) : (i1) -> i32
    %c304_i32 = arith.constant 304 : i32
    %11 = arith.addi %c304_i32, %0 : i32
    %true = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

