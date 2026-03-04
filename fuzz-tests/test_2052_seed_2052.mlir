module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
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
    %c0_i32_0 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %3 = "simt_step.if"(%2) ({
      %c3_i32 = arith.constant 3 : i32
      %6 = arith.remsi %arg3, %c3_i32 : i32
      %7 = simt_step.lane_id
      %8 = arith.index_cast %7 : index to i32
      %9 = "simt_step.switch"(%6, %8) ({
      ^bb0(%arg4: i32):
        "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %11 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %12 = "simt_step.if"(%11) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%16) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb2(%13: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %15 = "simt_step.if"(%14) ({
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%16) : (i32) -> ()
        }, {
          %c0_i32_4 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_4) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%9) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %7 = "simt_step.switch"(%6, %c0_i32_2) ({
      ^bb0(%arg4: i32):
        %c2_i32_3 = arith.constant 2 : i32
        %8 = arith.remsi %arg3, %c2_i32_3 : i32
        %c3_i32 = arith.constant 3 : i32
        %9 = arith.addi %arg0, %c3_i32 : i32
        %10 = "simt_step.switch"(%8, %9) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%13: i32):  // no predecessors
          %c3_i32_4 = arith.constant 3 : i32
          %14 = arith.addi %arg0, %c3_i32_4 : i32
          "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %12 = "simt_step.switch"(%arg3, %arg0) ({
        ^bb0(%arg5: i32):
          %c3_i32_4 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_4) {fallthrough = false} : (i32) -> ()
        ^bb1(%13: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%7) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %1, %3 : i32
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
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      "simt_step.yield"(%0) : (i32) -> ()
    }, {
      %c16_i32 = arith.constant 16 : i32
      %12 = arith.addi %c16_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_2 : i32
      %15 = "simt_step.if"(%14) ({
        %c20_i32 = arith.constant 20 : i32
        %18 = arith.addi %c20_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_4 : i32
        %21 = "simt_step.if"(%20) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_6 = arith.constant 4 : i32
          %24 = arith.addi %0, %c4_i32_6 : i32
          "simt_step.yield"(%24) : (i32) -> ()
        }) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %22 = arith.addi %c32_i32, %0 : i32
        %true_5 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21) : (i32) -> ()
      }, {
        %c24_i32 = arith.constant 24 : i32
        %18 = arith.addi %c24_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %20 = arith.addi %0, %c2_i32 : i32
        %21 = "simt_step.switch"(%19, %20) ({
        ^bb0(%arg2: i32):
          %c4_i32_6 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_6) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        %c48_i32 = arith.constant 48 : i32
        %22 = arith.addi %c48_i32, %0 : i32
        %true_5 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21) : (i32) -> ()
      }) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %16 = arith.addi %c64_i32, %0 : i32
      %true_3 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) : (i32) -> ()
    }) : (i1) -> i32
    %c80_i32 = arith.constant 80 : i32
    %10 = arith.addi %c80_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

