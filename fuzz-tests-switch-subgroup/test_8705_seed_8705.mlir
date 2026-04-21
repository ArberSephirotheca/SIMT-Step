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
      %2 = simt_step.subgroup_id
      %3 = arith.index_cast %2 : index to i32
      %4 = "simt_step.switch"(%1, %3) ({
      ^bb0(%arg6: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %14 = arith.remsi %arg3, %c4_i32_5 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %15 = arith.addi %14, %c1_i32_6 : i32
          %16 = arith.cmpi slt, %arg8, %15 : i32
          "simt_step.condition"(%16, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_5 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %15 = arith.muli %arg8, %c4_i32_7 : i32
          %16 = arith.addi %c0_i32_6, %15 : i32
          %17 = arith.addi %16, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_8 = arith.constant 1 : i32
          %18 = arith.addi %arg8, %c1_i32_8 : i32
          "simt_step.yield"(%14, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%6#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%7: i32):  // no predecessors
        %true = arith.constant true
        %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.muli %arg5, %c4_i32 : i32
        %10 = arith.addi %c16_i32, %9 : i32
        %11 = arith.addi %10, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
      ^bb2(%12: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %14 = arith.remsi %arg3, %c4_i32_5 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %15 = arith.addi %14, %c1_i32_6 : i32
          %16 = arith.cmpi slt, %arg8, %15 : i32
          "simt_step.condition"(%16, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_5 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %15 = arith.muli %arg8, %c4_i32_6 : i32
          %16 = arith.addi %c32_i32, %15 : i32
          %17 = arith.addi %16, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_7 = arith.constant 1 : i32
          %18 = arith.addi %arg8, %c1_i32_7 : i32
          "simt_step.yield"(%14, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%4, %5) : (i32, i32) -> ()
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
    %5 = simt_step.subgroup_id
    %6 = arith.index_cast %5 : index to i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %8 = arith.muli %arg3, %c4_i32_2 : i32
      %9 = arith.addi %8, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %10 = arith.addi %c8_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_3 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %8 = arith.addi %c28_i32, %0 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %10 = arith.addi %0, %c0_i32_2 : i32
      %11 = "simt_step.switch"(%9, %10) ({
      ^bb0(%arg4: i32):
        %20 = simt_step.subgroup_id
        %21 = arith.index_cast %20 : index to i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %31 = arith.muli %arg6, %c4_i32_15 : i32
          %32 = arith.addi %31, %0 : i32
          %c32_i32 = arith.constant 32 : i32
          %33 = arith.addi %c32_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_16 : i32
          "simt_step.condition"(%35, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %31 = arith.addi %arg5, %arg6 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %32 = arith.addi %arg6, %c1_i32_15 : i32
          %true_16 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %33 = arith.muli %arg6, %c4_i32_17 : i32
          %34 = arith.addi %c48_i32, %33 : i32
          %35 = arith.addi %34, %0 : i32
          %true_18 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %true_9 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %25 = arith.addi %c64_i32, %0 : i32
        %true_10 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
      ^bb3(%27: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %31 = arith.muli %arg6, %c4_i32_15 : i32
          %32 = arith.addi %31, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %33 = arith.addi %c52_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_16 : i32
          "simt_step.condition"(%35, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %31 = arith.addi %arg5, %arg6 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %32 = arith.addi %arg6, %c1_i32_15 : i32
          %true_16 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %33 = arith.muli %arg6, %c4_i32_17 : i32
          %34 = arith.addi %c80_i32, %33 : i32
          %35 = arith.addi %34, %0 : i32
          %true_18 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %29 = arith.addi %c96_i32, %0 : i32
        %true_14 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c112_i32 = arith.constant 112 : i32
      %12 = arith.addi %c112_i32, %0 : i32
      %true_3 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %14 = arith.addi %arg2, %11 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      %true_4 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_5 : i32
      %17 = arith.addi %c128_i32, %16 : i32
      %18 = arith.addi %17, %0 : i32
      %true_6 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

