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
      %c1_i32 = arith.constant 1 : i32
      %1 = "simt_step.switch"(%arg3, %c1_i32) ({
      ^bb0(%arg6: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %4 = "simt_step.if"(%3) ({
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_4 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.muli %arg5, %c4_i32 : i32
          %10 = arith.addi %c0_i32_4, %9 : i32
          %11 = arith.addi %10, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%8) : (i32) -> ()
        }, {
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.muli %arg5, %c4_i32 : i32
          %10 = arith.addi %c16_i32, %9 : i32
          %11 = arith.addi %10, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%8) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
      ^bb1(%5: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %6 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %7 = "simt_step.if"(%6) ({
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.muli %arg5, %c4_i32 : i32
          %10 = arith.addi %c32_i32, %9 : i32
          %11 = arith.addi %10, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%8) : (i32) -> ()
        }, {
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.muli %arg5, %c4_i32 : i32
          %10 = arith.addi %c48_i32, %9 : i32
          %11 = arith.addi %10, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%8) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32_1 = arith.constant 1 : i32
      %2 = arith.addi %arg5, %c1_i32_1 : i32
      "simt_step.yield"(%1, %2) : (i32, i32) -> ()
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
    %c2_i32 = arith.constant 2 : i32
    %5 = arith.addi %0, %c2_i32 : i32
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_0 : i32
    %9 = "simt_step.if"(%8) ({
      %c12_i32 = arith.constant 12 : i32
      %12 = arith.addi %c12_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_1 : i32
      %15 = "simt_step.if"(%14) ({
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %19 = arith.muli %arg3, %c4_i32_5 : i32
          %20 = arith.addi %19, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %21 = arith.addi %c16_i32, %20 : i32
          %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %23 = arith.cmpi ne, %22, %c0_i32_6 : i32
          "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %19 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg3, %c1_i32 : i32
          %true_5 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %21 = arith.muli %arg3, %c4_i32_6 : i32
          %22 = arith.addi %c64_i32, %21 : i32
          %23 = arith.addi %22, %0 : i32
          %true_7 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%18#0) : (i32) -> ()
      }, {
        %c36_i32 = arith.constant 36 : i32
        %18 = arith.addi %c36_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %20 = "simt_step.switch"(%19, %0) ({
        ^bb0(%arg2: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %23 = arith.addi %0, %c4_i32_5 : i32
          %true_6 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %24 = arith.addi %c80_i32, %0 : i32
          %true_7 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_3 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %21 = arith.addi %c96_i32, %0 : i32
        %true_4 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) : (i32) -> ()
      }) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %16 = arith.addi %c112_i32, %0 : i32
      %true_2 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %13 = arith.muli %arg3, %c4_i32_3 : i32
        %14 = arith.addi %13, %0 : i32
        %c40_i32 = arith.constant 40 : i32
        %15 = arith.addi %c40_i32, %14 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %16, %c0_i32_4 : i32
        "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %13 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg3, %c1_i32 : i32
        %true_3 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %c4_i32_4 = arith.constant 4 : i32
        %15 = arith.muli %arg3, %c4_i32_4 : i32
        %16 = arith.addi %c128_i32, %15 : i32
        %17 = arith.addi %16, %0 : i32
        %true_5 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%13, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) : (i32) -> ()
    }) : (i1) -> i32
    %c144_i32 = arith.constant 144 : i32
    %10 = arith.addi %c144_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

