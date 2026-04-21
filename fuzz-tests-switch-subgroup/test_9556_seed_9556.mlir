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
      %c3_i32 = arith.constant 3 : i32
      %5 = arith.remsi %arg3, %c3_i32 : i32
      %6 = "simt_step.switch"(%5, %arg0) ({
      ^bb0(%arg6: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32_10 : i32
          %24 = arith.cmpi slt, %arg8, %23 : i32
          "simt_step.condition"(%24, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_9 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %23 = arith.muli %arg8, %c4_i32_10 : i32
          %24 = arith.addi %c16_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_11 = arith.constant 1 : i32
          %26 = arith.addi %arg8, %c1_i32_11 : i32
          "simt_step.break"(%22, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%13: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32_10 : i32
          %24 = arith.cmpi slt, %arg8, %23 : i32
          "simt_step.condition"(%24, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_9 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %23 = arith.muli %arg8, %c4_i32_10 : i32
          %24 = arith.addi %c32_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_11 = arith.constant 1 : i32
          %26 = arith.addi %arg8, %c1_i32_11 : i32
          "simt_step.continue"(%22, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%15: i32):  // no predecessors
        %16 = simt_step.lane_id
        %17 = arith.index_cast %16 : index to i32
        %18 = "simt_step.switch"(%arg3, %17) ({
        ^bb0(%arg7: i32):
          %true_9 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %23 = arith.muli %arg5, %c4_i32_10 : i32
          %24 = arith.addi %c48_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %true_11 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %28 = arith.muli %arg5, %c4_i32_12 : i32
          %29 = arith.addi %c64_i32, %28 : i32
          %30 = arith.addi %29, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb3(%19: i32):  // no predecessors
        %c4_i32_8 = arith.constant 4 : i32
        %20 = arith.remsi %arg3, %c4_i32_8 : i32
        %21 = "simt_step.switch"(%20, %arg0) ({
        ^bb0(%arg7: i32):
          %true_9 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %23 = arith.muli %arg5, %c4_i32_10 : i32
          %24 = arith.addi %c80_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %true_11 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %28 = arith.muli %arg5, %c4_i32_12 : i32
          %29 = arith.addi %c96_i32, %28 : i32
          %30 = arith.addi %29, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %true_13 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %33 = arith.muli %arg5, %c4_i32_14 : i32
          %34 = arith.addi %c112_i32, %33 : i32
          %35 = arith.addi %34, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          %true_15 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %38 = arith.muli %arg5, %c4_i32_16 : i32
          %39 = arith.addi %c128_i32, %38 : i32
          %40 = arith.addi %39, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %40, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %7 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c144_i32 = arith.constant 144 : i32
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.muli %arg5, %c4_i32 : i32
      %9 = arith.addi %c144_i32, %8 : i32
      %10 = arith.addi %9, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%6, %11) : (i32, i32) -> ()
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
      "simt_step.yield"() : () -> ()
    }, {
      %c8_i32 = arith.constant 8 : i32
      %13 = arith.addi %c8_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_4 : i32
      "simt_step.if"(%15) ({
        "simt_step.yield"() : () -> ()
      }, {
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_4 : i32
      %14 = arith.addi %13, %0 : i32
      %c12_i32 = arith.constant 12 : i32
      %15 = arith.addi %c12_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_5 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %13 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true_4 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_5 : i32
      %16 = arith.addi %c160_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_6 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c32_i32 = arith.constant 32 : i32
    %7 = arith.addi %c32_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %8, %c0_i32_3 : i32
    %10 = "simt_step.if"(%9) ({
      %13 = simt_step.lane_id
      %14 = arith.index_cast %13 : index to i32
      "simt_step.yield"(%14) : (i32) -> ()
    }, {
      "simt_step.yield"(%0) : (i32) -> ()
    }) : (i1) -> i32
    %c176_i32 = arith.constant 176 : i32
    %11 = arith.addi %c176_i32, %0 : i32
    %true = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

