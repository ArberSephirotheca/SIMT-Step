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
      %12 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %12, %c1_i32 : i32
      %14 = arith.cmpi slt, %arg5, %13 : i32
      "simt_step.condition"(%14, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true_8 = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %c4_i32 = arith.constant 4 : i32
      %13 = arith.muli %arg5, %c4_i32 : i32
      %14 = arith.addi %c16_i32, %13 : i32
      %15 = arith.addi %14, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%12, %16) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %12 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %12, %c1_i32 : i32
      %14 = arith.cmpi slt, %arg5, %13 : i32
      "simt_step.condition"(%14, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true_8 = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %c4_i32 = arith.constant 4 : i32
      %13 = arith.muli %arg5, %c4_i32 : i32
      %14 = arith.addi %c32_i32, %13 : i32
      %15 = arith.addi %14, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%12, %16) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_5 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
    %7 = arith.select %6, %4, %5#0 : i32
    %c0_i32_6 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
    %9 = "simt_step.if"(%8) ({
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %13 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %13, %c1_i32 : i32
        %15 = arith.cmpi slt, %arg5, %14 : i32
        "simt_step.condition"(%15, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32_12 : i32
          %17 = arith.cmpi slt, %arg7, %16 : i32
          "simt_step.condition"(%17, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_12 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.muli %arg7, %c4_i32 : i32
          %17 = arith.addi %c48_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_13 = arith.constant 1 : i32
          %19 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.continue"(%15, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%13#0, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) : (i32) -> ()
    }, {
      %c0_i32_8 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
      %13 = "simt_step.if"(%12) ({
        %c0_i32_9 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %15 = "simt_step.if"(%14) ({
          %true_10 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %17 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }, {
          %true_10 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %17 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%15) : (i32) -> ()
      }, {
        %true_9 = arith.constant true
        %14 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %15 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%14) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%13) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_7 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
    %11 = arith.select %10, %7, %9 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_2 : i32
      %12 = arith.addi %11, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %13 = arith.addi %c8_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_3 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %11 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c112_i32 = arith.constant 112 : i32
      %c4_i32_2 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_2 : i32
      %14 = arith.addi %c112_i32, %13 : i32
      %15 = arith.addi %14, %0 : i32
      %true_3 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %6 = arith.addi %c28_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c32_i32 = arith.constant 32 : i32
      %11 = arith.addi %c32_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_2 : i32
      %14 = "simt_step.if"(%13) ({
        %c36_i32 = arith.constant 36 : i32
        %19 = arith.addi %c36_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_4 : i32
        %22 = "simt_step.if"(%21) ({
          %c0_i32_5 = arith.constant 0 : i32
          %23 = arith.addi %0, %c0_i32_5 : i32
          "simt_step.yield"(%23) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) : (i32) -> ()
      }, {
        %c40_i32 = arith.constant 40 : i32
        %19 = arith.addi %c40_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_4 : i32
        %22 = "simt_step.if"(%21) ({
          %c3_i32 = arith.constant 3 : i32
          %23 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%23) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %16 = arith.addi %c44_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %18 = "simt_step.switch"(%17, %c0_i32_3) ({
      ^bb0(%arg3: i32):
        %c48_i32 = arith.constant 48 : i32
        %19 = arith.addi %c48_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %21 = arith.addi %0, %c0_i32_4 : i32
        %22 = "simt_step.switch"(%20, %21) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          %30 = arith.addi %0, %c4_i32_8 : i32
          "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %32 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb3(%33: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          %34 = arith.addi %0, %c0_i32_9 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %29 = arith.muli %arg5, %c4_i32_8 : i32
          %30 = arith.addi %29, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %31 = arith.addi %c52_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_9 : i32
          "simt_step.condition"(%33, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %29 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %arg5, %c1_i32 : i32
          %true_8 = arith.constant true
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%25: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %26 = arith.addi %c72_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %28 = "simt_step.switch"(%27, %c3_i32) ({
        ^bb0(%arg4: i32):
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %30 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %c2_i32_9 = arith.constant 2 : i32
          %32 = arith.addi %0, %c2_i32_9 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb3(%33: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

