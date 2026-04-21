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
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %1:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_3 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32_3 : i32
        %5 = arith.cmpi slt, %arg7, %4 : i32
        "simt_step.condition"(%5, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %3:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg8: i32, %arg9: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32_6 : i32
          %7 = arith.cmpi slt, %arg9, %6 : i32
          "simt_step.condition"(%7, %arg8, %arg9) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg8: i32, %arg9: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg9, %c4_i32 : i32
          %7 = arith.addi %c0_i32_6, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_7 = arith.constant 1 : i32
          %9 = arith.addi %arg9, %c1_i32_7 : i32
          "simt_step.continue"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_5 = arith.constant 1 : i32
        %4 = arith.addi %arg7, %c1_i32_5 : i32
        "simt_step.yield"(%3#0, %4) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%1#0, %2) : (i32, i32) -> ()
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
    %c1_i32 = arith.constant 1 : i32
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
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %19 = arith.muli %arg5, %c4_i32_9 : i32
          %20 = arith.addi %19, %0 : i32
          %c32_i32_10 = arith.constant 32 : i32
          %21 = arith.addi %c32_i32_10, %20 : i32
          %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %23 = arith.cmpi ne, %22, %c0_i32_11 : i32
          "simt_step.condition"(%23, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %19 = arith.addi %arg4, %arg5 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %20 = arith.addi %arg5, %c1_i32_9 : i32
          %true_10 = arith.constant true
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %21 = arith.muli %arg5, %c4_i32_11 : i32
          %22 = arith.addi %c16_i32, %21 : i32
          %23 = arith.addi %22, %0 : i32
          %true_12 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%19, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %13 = arith.addi %arg2, %12#0 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %14 = arith.addi %arg3, %c1_i32_5 : i32
        %true_6 = arith.constant true
        %c32_i32 = arith.constant 32 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %15 = arith.muli %arg3, %c4_i32_7 : i32
        %16 = arith.addi %c32_i32, %15 : i32
        %17 = arith.addi %16, %0 : i32
        %true_8 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) : (i32) -> ()
    }, {
      %c52_i32 = arith.constant 52 : i32
      %11 = arith.addi %c52_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %13 = simt_step.subgroup_id
      %14 = arith.index_cast %13 : index to i32
      %15 = "simt_step.switch"(%12, %14) ({
      ^bb0(%arg2: i32):
        %c56_i32 = arith.constant 56 : i32
        %16 = arith.addi %c56_i32, %0 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %18 = simt_step.lane_id
        %19 = arith.index_cast %18 : index to i32
        %20 = "simt_step.switch"(%17, %19) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_6 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %34 = arith.addi %c48_i32, %0 : i32
          %true_7 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %c0_i32_8 = arith.constant 0 : i32
          %37 = arith.addi %0, %c0_i32_8 : i32
          %true_9 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %38 = arith.addi %c64_i32, %0 : i32
          %true_10 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c4_i32_1 = arith.constant 4 : i32
        %22 = arith.addi %0, %c4_i32_1 : i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %24 = arith.addi %c60_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %26 = simt_step.lane_id
        %27 = arith.index_cast %26 : index to i32
        %28 = "simt_step.switch"(%25, %27) ({
        ^bb0(%arg3: i32):
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %36 = simt_step.subgroup_id
          %37 = arith.index_cast %36 : index to i32
          %true_6 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %38 = arith.addi %c80_i32, %0 : i32
          %true_7 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_2 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %29 = arith.addi %c96_i32, %0 : i32
        %true_3 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_4 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %31 = arith.addi %c112_i32, %0 : i32
        %true_5 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%15) : (i32) -> ()
    }) : (i1) -> i32
    %c128_i32 = arith.constant 128 : i32
    %9 = arith.addi %c128_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

