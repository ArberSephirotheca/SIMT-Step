module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %1 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %1, %c1_i32 : i32
      %3 = arith.cmpi slt, %arg5, %2 : i32
      "simt_step.condition"(%3, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32 = arith.constant 3 : i32
      %1 = arith.remsi %arg3, %c3_i32 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %2 = arith.addi %arg0, %c0_i32_1 : i32
      %3 = "simt_step.switch"(%1, %2) ({
      ^bb0(%arg6: i32):
        %true = arith.constant true
        %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %6 = arith.muli %arg5, %c4_i32 : i32
        %7 = arith.addi %c0_i32_2, %6 : i32
        %8 = arith.addi %7, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
      ^bb1(%9: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %21 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %22 = arith.addi %21, %c1_i32_10 : i32
          %23 = arith.cmpi slt, %arg8, %22 : i32
          "simt_step.condition"(%23, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_9 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %22 = arith.muli %arg8, %c4_i32_10 : i32
          %23 = arith.addi %c16_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_11 = arith.constant 1 : i32
          %25 = arith.addi %arg8, %c1_i32_11 : i32
          "simt_step.break"(%21, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%11: i32):  // no predecessors
        %true_5 = arith.constant true
        %12 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %13 = arith.muli %arg5, %c4_i32_6 : i32
        %14 = arith.addi %c32_i32, %13 : i32
        %15 = arith.addi %14, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb3(%16: i32):  // no predecessors
        %true_7 = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %18 = arith.muli %arg5, %c4_i32_8 : i32
        %19 = arith.addi %c48_i32, %18 : i32
        %20 = arith.addi %19, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %4 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%3, %4) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
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
    %8 = simt_step.lane_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %21 = arith.muli %arg4, %c4_i32_6 : i32
        %22 = arith.addi %21, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %23 = arith.addi %c12_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_7 : i32
        "simt_step.condition"(%25, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %21 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg4, %c1_i32 : i32
        %true_6 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_7 : i32
        %24 = arith.addi %c64_i32, %23 : i32
        %25 = arith.addi %24, %0 : i32
        %true_8 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %12 = arith.addi %c80_i32, %0 : i32
      %true_3 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %15 = arith.addi %c32_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %17 = arith.addi %0, %c2_i32 : i32
      %18 = "simt_step.switch"(%16, %17) ({
      ^bb0(%arg3: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_15 : i32
          %40 = arith.addi %39, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %41 = arith.addi %c36_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_16 : i32
          "simt_step.condition"(%43, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %39 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %arg5, %c1_i32 : i32
          %true_15 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_16 : i32
          %42 = arith.addi %c96_i32, %41 : i32
          %43 = arith.addi %42, %0 : i32
          %true_17 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %23 = arith.addi %c56_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %25 = "simt_step.switch"(%24, %0) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          %39 = arith.addi %0, %c1_i32 : i32
          %true_15 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %40 = arith.addi %c112_i32, %0 : i32
          %true_16 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c0_i32_17 = arith.constant 0 : i32
          %43 = arith.addi %0, %c0_i32_17 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %26 = arith.addi %c128_i32, %0 : i32
        %true_9 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %29 = arith.addi %0, %c0_i32_10 : i32
        %true_11 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %30 = arith.addi %c144_i32, %0 : i32
        %true_12 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
      ^bb3(%32: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %33 = arith.addi %c60_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_13 : i32
        %36 = "simt_step.if"(%35) ({
          %c3_i32 = arith.constant 3 : i32
          %39 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %37 = arith.addi %c160_i32, %0 : i32
        %true_14 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %19 = arith.addi %c176_i32, %0 : i32
      %true_5 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

