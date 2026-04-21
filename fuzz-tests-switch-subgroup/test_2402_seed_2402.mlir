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
      %5 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %6 = "simt_step.if"(%5) ({
        %c0_i32_4 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %9 = "simt_step.if"(%8) ({
          %true_5 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg5, %c4_i32 : i32
          %12 = arith.addi %c16_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }, {
          %true_5 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg5, %c4_i32 : i32
          %12 = arith.addi %c32_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) : (i32) -> ()
      }, {
        %c4_i32 = arith.constant 4 : i32
        %8 = arith.remsi %arg3, %c4_i32 : i32
        %9 = simt_step.lane_id
        %10 = arith.index_cast %9 : index to i32
        %11 = "simt_step.switch"(%8, %10) ({
        ^bb0(%arg6: i32):
          %true_6 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %17 = arith.muli %arg5, %c4_i32_7 : i32
          %18 = arith.addi %c48_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %true_8 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %22 = arith.muli %arg5, %c4_i32_9 : i32
          %23 = arith.addi %c64_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %27 = arith.muli %arg5, %c4_i32_11 : i32
          %28 = arith.addi %c80_i32, %27 : i32
          %29 = arith.addi %28, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb3(%30: i32):  // no predecessors
          %true_12 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %32 = arith.muli %arg5, %c4_i32_13 : i32
          %33 = arith.addi %c96_i32, %32 : i32
          %34 = arith.addi %33, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        %12 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %13 = arith.muli %arg5, %c4_i32_5 : i32
        %14 = arith.addi %c112_i32, %13 : i32
        %15 = arith.addi %14, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%11) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%6, %7) : (i32, i32) -> ()
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %9 = arith.addi %c12_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %11 = simt_step.subgroup_id
      %12 = arith.index_cast %11 : index to i32
      %13 = "simt_step.switch"(%10, %12) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %16 = arith.addi %c16_i32, %0 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_1 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %17, %c0_i32_1 : i32
        %19 = "simt_step.if"(%18) ({
          %26 = simt_step.subgroup_id
          %27 = arith.index_cast %26 : index to i32
          "simt_step.yield"(%27) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %20 = arith.addi %c128_i32, %0 : i32
        %true_2 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_3 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %22 = arith.addi %c144_i32, %0 : i32
        %true_4 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %26 = arith.muli %arg5, %c4_i32_7 : i32
          %27 = arith.addi %26, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %28 = arith.addi %c20_i32, %27 : i32
          %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %30 = arith.cmpi ne, %29, %c0_i32_8 : i32
          "simt_step.condition"(%30, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %26 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg5, %c1_i32 : i32
          %true_7 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %28 = arith.muli %arg5, %c4_i32_8 : i32
          %29 = arith.addi %c160_i32, %28 : i32
          %30 = arith.addi %29, %0 : i32
          %true_9 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %14 = arith.addi %c176_i32, %0 : i32
      %true_0 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

