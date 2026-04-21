module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %3 = "simt_step.switch"(%2, %c1_i32) ({
    ^bb0(%arg4: i32):
      %true_1 = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %7 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) {fallthrough = true} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %17 = arith.addi %16, %c1_i32_6 : i32
        %18 = arith.cmpi slt, %arg6, %17 : i32
        "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32_9 : i32
          %20 = arith.cmpi slt, %arg8, %19 : i32
          "simt_step.condition"(%20, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_9 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %19 = arith.muli %arg8, %c4_i32 : i32
          %20 = arith.addi %c32_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_10 = arith.constant 1 : i32
          %22 = arith.addi %arg8, %c1_i32_10 : i32
          "simt_step.yield"(%18, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_8 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32_8 : i32
        "simt_step.break"(%16#0, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %12 = "simt_step.if"(%11) ({
        %c0_i32_6 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %17 = "simt_step.if"(%16) ({
          %true_7 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %19 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %19 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%17) : (i32) -> ()
      }, {
        %true_6 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %17 = arith.addi %c80_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb3(%13: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
      %15 = "simt_step.if"(%14) ({
        %true_6 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %17 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) : (i32) -> ()
      }, {
        %true_6 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %17 = arith.addi %c112_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %5 = arith.select %4, %0, %3 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %12 = arith.muli %arg3, %c4_i32_3 : i32
        %13 = arith.addi %12, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %14 = arith.addi %c12_i32, %13 : i32
        %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %15, %c0_i32_4 : i32
        "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %12 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %arg3, %c1_i32 : i32
        %true_3 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %c4_i32_4 = arith.constant 4 : i32
        %14 = arith.muli %arg3, %c4_i32_4 : i32
        %15 = arith.addi %c128_i32, %14 : i32
        %16 = arith.addi %15, %0 : i32
        %true_5 = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%12, %13) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %12 = arith.muli %arg3, %c4_i32_3 : i32
        %13 = arith.addi %12, %0 : i32
        %c32_i32 = arith.constant 32 : i32
        %14 = arith.addi %c32_i32, %13 : i32
        %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %15, %c0_i32_4 : i32
        "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c52_i32 = arith.constant 52 : i32
        %12 = arith.addi %c52_i32, %0 : i32
        %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %14 = arith.addi %0, %c0_i32_3 : i32
        %15 = "simt_step.switch"(%13, %14) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %23 = arith.addi %0, %c2_i32 : i32
          %true_7 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %24 = arith.addi %c144_i32, %0 : i32
          %true_8 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %true_9 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %27 = arith.addi %c160_i32, %0 : i32
          %true_10 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %16 = arith.addi %arg2, %15 : i32
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %arg3, %c1_i32 : i32
        %true_4 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %18 = arith.muli %arg3, %c4_i32_5 : i32
        %19 = arith.addi %c176_i32, %18 : i32
        %20 = arith.addi %19, %0 : i32
        %true_6 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) : (i32) -> ()
    }) : (i1) -> i32
    %c192_i32 = arith.constant 192 : i32
    %9 = arith.addi %c192_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

