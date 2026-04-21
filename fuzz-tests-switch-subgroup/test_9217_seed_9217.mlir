module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c0_i32_1 = arith.constant 0 : i32
        %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %5 = "simt_step.if"(%4) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_2 = arith.constant 0 : i32
          %7 = arith.addi %c0_i32_2, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %7 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%5) : (i32) -> ()
      }, {
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32 : i32
          %7 = arith.cmpi slt, %arg5, %6 : i32
          "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg5, %c4_i32 : i32
          %7 = arith.addi %c32_i32, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %9 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32 : i32
        %5 = arith.cmpi slt, %arg5, %4 : i32
        "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c3_i32 = arith.constant 3 : i32
        %3 = arith.remsi %arg3, %c3_i32 : i32
        %4 = simt_step.lane_id
        %5 = arith.index_cast %4 : index to i32
        %6 = "simt_step.switch"(%3, %5) ({
        ^bb0(%arg6: i32):
          %true_2 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_3 = arith.constant 4 : i32
          %13 = arith.muli %arg5, %c4_i32_3 : i32
          %14 = arith.addi %c48_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          %true_4 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_5 = arith.constant 4 : i32
          %18 = arith.muli %arg5, %c4_i32_5 : i32
          %19 = arith.addi %c64_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %true_6 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %23 = arith.muli %arg5, %c4_i32_7 : i32
          %24 = arith.addi %c80_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
        ^bb3(%26: i32):  // no predecessors
          %true_8 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %28 = arith.muli %arg5, %c4_i32_9 : i32
          %29 = arith.addi %c96_i32, %28 : i32
          %30 = arith.addi %29, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %c4_i32 = arith.constant 4 : i32
        %8 = arith.muli %arg5, %c4_i32 : i32
        %9 = arith.addi %c112_i32, %8 : i32
        %10 = arith.addi %9, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%6, %11) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
    }) : (i1) -> i32
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
      %7 = arith.addi %c8_i32, %0 : i32
      %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %9 = arith.cmpi ne, %8, %c0_i32_3 : i32
      "simt_step.if"(%9) ({
        %10 = simt_step.subgroup_id
        %11 = arith.index_cast %10 : index to i32
        %12 = "simt_step.switch"(%0, %11) ({
        ^bb0(%arg2: i32):
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %arg2, %c1_i32 : i32
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          %c0_i32_4 = arith.constant 0 : i32
          %15 = arith.addi %14, %c0_i32_4 : i32
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
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
      %c4_i32_3 = arith.constant 4 : i32
      %7 = arith.muli %arg3, %c4_i32_3 : i32
      %8 = arith.addi %7, %0 : i32
      %c12_i32 = arith.constant 12 : i32
      %9 = arith.addi %c12_i32, %8 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_4 : i32
      "simt_step.condition"(%11, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %7 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %c4_i32_3 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_3 : i32
      %10 = arith.addi %c128_i32, %9 : i32
      %11 = arith.addi %10, %0 : i32
      %true_4 = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%7, %8) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

