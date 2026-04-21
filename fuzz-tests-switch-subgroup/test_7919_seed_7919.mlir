module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.lane_id
    %1 = arith.index_cast %0 : index to i32
    %2 = "simt_step.switch"(%arg3, %1) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %3 = arith.cmpi ne, %arg2, %c0_i32 : i32
      %4 = "simt_step.if"(%3) ({
        %true = arith.constant true
        %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %8 = arith.addi %c0_i32_2, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%7) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %7 = arith.remsi %arg3, %c2_i32 : i32
        %8 = "simt_step.switch"(%7, %arg0) ({
        ^bb0(%arg5: i32):
          %true = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %10 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%9) {fallthrough = true} : (i32) -> ()
        ^bb1(%11: i32):  // no predecessors
          %true_2 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %13 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%8) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%4) {fallthrough = true} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32 : i32
        %9 = arith.cmpi slt, %arg6, %8 : i32
        "simt_step.condition"(%9, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true = arith.constant true
        %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %c4_i32 = arith.constant 4 : i32
        %8 = arith.muli %arg6, %c4_i32 : i32
        %9 = arith.addi %c48_i32, %8 : i32
        %10 = arith.addi %9, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%7, %11) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%6#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
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
      %19 = arith.addi %c8_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_6 : i32
      "simt_step.if"(%21) ({
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
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      %c16_i32 = arith.constant 16 : i32
      %19 = arith.addi %c16_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_6 : i32
      %22 = "simt_step.if"(%21) ({
        %c20_i32 = arith.constant 20 : i32
        %25 = arith.addi %c20_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %27 = simt_step.subgroup_id
        %28 = arith.index_cast %27 : index to i32
        %29 = "simt_step.switch"(%26, %28) ({
        ^bb0(%arg2: i32):
          %true_8 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %30 = arith.addi %c64_i32, %0 : i32
          %true_9 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c0_i32_10 = arith.constant 0 : i32
          %33 = arith.addi %0, %c0_i32_10 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%29) : (i32) -> ()
      }, {
        %c24_i32 = arith.constant 24 : i32
        %25 = arith.addi %c24_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_8 : i32
        %28 = "simt_step.if"(%27) ({
          %c3_i32 = arith.constant 3 : i32
          %31 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %c0_i32_10 = arith.constant 0 : i32
          %31 = arith.addi %0, %c0_i32_10 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %29 = arith.addi %c80_i32, %0 : i32
        %true_9 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) : (i32) -> ()
      }) : (i1) -> i32
      %c96_i32 = arith.constant 96 : i32
      %23 = arith.addi %c96_i32, %0 : i32
      %true_7 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) : (i32) -> ()
    }, {
      "simt_step.yield"(%0) : (i32) -> ()
    }) : (i1) -> i32
    %c112_i32 = arith.constant 112 : i32
    %10 = arith.addi %c112_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c28_i32 = arith.constant 28 : i32
    %12 = arith.addi %c28_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_2 : i32
    %15 = "simt_step.if"(%14) ({
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %20 = arith.muli %arg3, %c4_i32_8 : i32
        %21 = arith.addi %20, %0 : i32
        %c32_i32 = arith.constant 32 : i32
        %22 = arith.addi %c32_i32, %21 : i32
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
        %c128_i32 = arith.constant 128 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %22 = arith.muli %arg3, %c4_i32_9 : i32
        %23 = arith.addi %c128_i32, %22 : i32
        %24 = arith.addi %23, %0 : i32
        %true_10 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%20, %21) : (i32, i32) -> ()
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
        %c52_i32 = arith.constant 52 : i32
        %22 = arith.addi %c52_i32, %21 : i32
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
        %c144_i32 = arith.constant 144 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %22 = arith.muli %arg3, %c4_i32_9 : i32
        %23 = arith.addi %c144_i32, %22 : i32
        %24 = arith.addi %23, %0 : i32
        %true_10 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%19#0) : (i32) -> ()
    }) : (i1) -> i32
    %c160_i32 = arith.constant 160 : i32
    %16 = arith.addi %c160_i32, %0 : i32
    %true_3 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %18:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_6 : i32
      %20 = arith.addi %19, %0 : i32
      %c72_i32 = arith.constant 72 : i32
      %21 = arith.addi %c72_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_7 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = arith.addi %arg2, %0 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      %true_6 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %c4_i32_7 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_7 : i32
      %22 = arith.addi %c176_i32, %21 : i32
      %23 = arith.addi %22, %0 : i32
      %true_8 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

