module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.addi %arg0, %c3_i32 : i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %6 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %6, %c1_i32 : i32
      %8 = arith.cmpi slt, %arg5, %7 : i32
      "simt_step.condition"(%8, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %8 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %9 = arith.addi %8, %c1_i32_5 : i32
        %10 = arith.cmpi slt, %arg7, %9 : i32
        "simt_step.condition"(%10, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %9 = "simt_step.if"(%8) ({
          %11 = simt_step.subgroup_id
          %12 = arith.index_cast %11 : index to i32
          "simt_step.yield"(%12) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_6 = arith.constant 1 : i32
        %10 = arith.addi %arg7, %c1_i32_6 : i32
        "simt_step.break"(%9, %10) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%6#0, %7) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %5 = arith.select %4, %0, %1#0 : i32
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
      %c4_i32_11 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_11 : i32
      %15 = arith.addi %14, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %16 = arith.addi %c8_i32, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_12 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %14 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_11 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_11 : i32
      %15 = arith.addi %14, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %16 = arith.addi %c28_i32, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_12 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %14 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.break"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %9 = arith.addi %c32_i32, %0 : i32
    %true_6 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_7 = arith.constant 0 : i32
    %c0_i32_8 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_11 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_11 : i32
      %15 = arith.addi %14, %0 : i32
      %c48_i32_12 = arith.constant 48 : i32
      %16 = arith.addi %c48_i32_12, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_13 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_13 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c68_i32 = arith.constant 68 : i32
      %14 = arith.addi %c68_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %16 = "simt_step.switch"(%15, %c2_i32) ({
      ^bb0(%arg4: i32):
        %c72_i32 = arith.constant 72 : i32
        %19 = arith.addi %c72_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_12 : i32
        %22 = "simt_step.if"(%21) ({
          %c2_i32_16 = arith.constant 2 : i32
          %36 = arith.addi %0, %c2_i32_16 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %24 = arith.addi %c76_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %26 = arith.addi %0, %c3_i32 : i32
        %27 = "simt_step.switch"(%25, %26) ({
        ^bb0(%arg5: i32):
          %c1_i32_16 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_16) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %c0_i32_17 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_17) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %29 = arith.addi %c80_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %31 = "simt_step.switch"(%30, %0) ({
        ^bb0(%arg5: i32):
          %c2_i32_16 = arith.constant 2 : i32
          %36 = arith.addi %0, %c2_i32_16 : i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%39: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb3(%32: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %33 = arith.addi %c84_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %35 = "simt_step.switch"(%34, %0) ({
        ^bb0(%arg5: i32):
          %c3_i32_16 = arith.constant 3 : i32
          %36 = arith.addi %0, %c3_i32_16 : i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %c4_i32_17 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_17) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          %c4_i32_18 = arith.constant 4 : i32
          %39 = arith.addi %0, %c4_i32_18 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb3(%40: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_11 = arith.constant true
      %17 = arith.addi %arg2, %16 : i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.break"(%17, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_9 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %12 = arith.addi %c48_i32, %0 : i32
    %true_10 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

