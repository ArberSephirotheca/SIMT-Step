module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %3 = "simt_step.if"(%2) ({
      %c2_i32 = arith.constant 2 : i32
      %11 = arith.remsi %arg3, %c2_i32 : i32
      %12 = simt_step.lane_id
      %13 = arith.index_cast %12 : index to i32
      %14 = "simt_step.switch"(%11, %13) ({
      ^bb0(%arg4: i32):
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %18 = arith.addi %arg0, %c3_i32 : i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %16 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) : (i32) -> ()
    }, {
      %true_5 = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %12 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %0, %3 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6 = "simt_step.switch"(%arg3, %c0_i32_2) ({
    ^bb0(%arg4: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
      %12 = "simt_step.if"(%11) ({
        "simt_step.yield"(%arg0) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %16 = "simt_step.if"(%15) ({
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%16) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %15, %c1_i32 : i32
        %17 = arith.cmpi slt, %arg6, %16 : i32
        "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32_10 : i32
          %19 = arith.cmpi slt, %arg8, %18 : i32
          "simt_step.condition"(%19, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c1_i32_10 = arith.constant 1 : i32
          %17 = arith.addi %arg8, %c1_i32_10 : i32
          "simt_step.continue"(%arg0, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%15#0, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %8 = arith.addi %c48_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
    %10 = arith.select %9, %5, %6 : i32
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
      %c4_i32_6 = arith.constant 4 : i32
      %10 = arith.muli %arg3, %c4_i32_6 : i32
      %11 = arith.addi %10, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %12 = arith.addi %c8_i32, %11 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_7 : i32
      "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %10 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c64_i32 = arith.constant 64 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_6 : i32
      %13 = arith.addi %c64_i32, %12 : i32
      %14 = arith.addi %13, %0 : i32
      %true_7 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%10, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %10 = arith.muli %arg3, %c4_i32_6 : i32
      %11 = arith.addi %10, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %12 = arith.addi %c28_i32, %11 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_7 : i32
      "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %10 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_6 : i32
      %13 = arith.addi %c80_i32, %12 : i32
      %14 = arith.addi %13, %0 : i32
      %true_7 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %9:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %10 = arith.muli %arg3, %c4_i32_6 : i32
      %11 = arith.addi %10, %0 : i32
      %c48_i32 = arith.constant 48 : i32
      %12 = arith.addi %c48_i32, %11 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_7 : i32
      "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c68_i32 = arith.constant 68 : i32
      %10 = arith.addi %c68_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_6 : i32
      %13 = "simt_step.if"(%12) ({
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %23 = arith.muli %arg5, %c4_i32_12 : i32
          %24 = arith.addi %23, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %25 = arith.addi %c72_i32, %24 : i32
          %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %27 = arith.cmpi ne, %26, %c0_i32_13 : i32
          "simt_step.condition"(%27, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %23 = arith.addi %arg4, %arg5 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %24 = arith.addi %arg5, %c1_i32_12 : i32
          %true_13 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %25 = arith.muli %arg5, %c4_i32_14 : i32
          %26 = arith.addi %c96_i32, %25 : i32
          %27 = arith.addi %26, %0 : i32
          %true_15 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%22#0) : (i32) -> ()
      }, {
        %c92_i32 = arith.constant 92 : i32
        %22 = arith.addi %c92_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %24 = arith.addi %0, %c3_i32 : i32
        %25 = "simt_step.switch"(%23, %24) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          %c3_i32_12 = arith.constant 3 : i32
          %30 = arith.addi %0, %c3_i32_12 : i32
          "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
        ^bb3(%31: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %26 = arith.addi %c112_i32, %0 : i32
        %true_11 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) : (i32) -> ()
      }) : (i1) -> i32
      %c128_i32 = arith.constant 128 : i32
      %14 = arith.addi %c128_i32, %0 : i32
      %true = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %16 = arith.addi %arg2, %13 : i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg3, %c1_i32 : i32
      %true_7 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_8 : i32
      %19 = arith.addi %c144_i32, %18 : i32
      %20 = arith.addi %19, %0 : i32
      %true_9 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

