module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %c4_i32 = arith.constant 4 : i32
    %1 = "simt_step.switch"(%0, %c4_i32) ({
    ^bb0(%arg4: i32):
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    ^bb1(%4: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32_3 : i32
        %c1_i32 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32 : i32
        %9 = arith.cmpi slt, %arg6, %8 : i32
        "simt_step.condition"(%9, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32_3 : i32
        %8 = "simt_step.switch"(%7, %arg0) ({
        ^bb0(%arg7: i32):
          %c2_i32_5 = arith.constant 2 : i32
          %11 = arith.addi %arg0, %c2_i32_5 : i32
          "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
        ^bb1(%12: i32):  // no predecessors
          %c4_i32_6 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_6) {fallthrough = false} : (i32) -> ()
        ^bb2(%13: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb3(%14: i32):  // no predecessors
          %c4_i32_7 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_7) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %9 = arith.addi %arg0, %c1_i32 : i32
        %c1_i32_4 = arith.constant 1 : i32
        %10 = arith.addi %arg6, %c1_i32_4 : i32
        "simt_step.yield"(%8, %10) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c4_i32_2 = arith.constant 4 : i32
      %6 = arith.addi %arg0, %c4_i32_2 : i32
      "simt_step.yield"(%5#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %5 = arith.addi %0, %c1_i32 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_5 : i32
      %17 = arith.addi %16, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %18 = arith.addi %c8_i32, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %19 = arith.muli %arg5, %c4_i32_9 : i32
        %20 = arith.addi %19, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %21 = arith.addi %c28_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_10 : i32
        "simt_step.condition"(%23, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c48_i32 = arith.constant 48 : i32
        %19 = arith.addi %c48_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_9 : i32
        %22 = "simt_step.if"(%21) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32_11 = arith.constant 1 : i32
          %25 = arith.addi %0, %c1_i32_11 : i32
          "simt_step.yield"(%25) : (i32) -> ()
        }) : (i1) -> i32
        %23 = arith.addi %arg4, %22 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %24 = arith.addi %arg5, %c1_i32_10 : i32
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      %17 = arith.addi %arg2, %16#0 : i32
      %c1_i32_8 = arith.constant 1 : i32
      %18 = arith.addi %arg3, %c1_i32_8 : i32
      "simt_step.yield"(%17, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %7 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c52_i32 = arith.constant 52 : i32
    %9 = arith.addi %c52_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %11 = simt_step.lane_id
    %12 = arith.index_cast %11 : index to i32
    %13 = "simt_step.switch"(%10, %12) ({
    ^bb0(%arg2: i32):
      %c56_i32 = arith.constant 56 : i32
      %16 = arith.addi %c56_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_5 : i32
      %19 = "simt_step.if"(%18) ({
        %c60_i32 = arith.constant 60 : i32
        %34 = arith.addi %c60_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_9 = arith.constant 1 : i32
        %36 = "simt_step.switch"(%35, %c1_i32_9) ({
        ^bb0(%arg3: i32):
          %c2_i32_11 = arith.constant 2 : i32
          %37 = arith.addi %0, %c2_i32_11 : i32
          "simt_step.yield"(%37) {fallthrough = true} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %c4_i32_13 = arith.constant 4 : i32
          %40 = arith.addi %0, %c4_i32_13 : i32
          "simt_step.yield"(%40) {fallthrough = true} : (i32) -> ()
        ^bb3(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%36) : (i32) -> ()
      }, {
        %c64_i32 = arith.constant 64 : i32
        %34 = arith.addi %c64_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_9 : i32
        %37 = "simt_step.if"(%36) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32_10 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%37) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %21 = arith.addi %c68_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_6 : i32
      %24 = "simt_step.if"(%23) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c4_i32_9 = arith.constant 4 : i32
        %34 = arith.addi %0, %c4_i32_9 : i32
        "simt_step.yield"(%34) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %26 = arith.addi %c72_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_7 : i32
      %29 = "simt_step.if"(%28) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_12 : i32
          %36 = arith.addi %35, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %37 = arith.addi %c76_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_13 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32_12 : i32
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%34#0) : (i32) -> ()
      }, {
        %c96_i32 = arith.constant 96 : i32
        %34 = arith.addi %c96_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = "simt_step.switch"(%35, %0) ({
        ^bb0(%arg3: i32):
          %c1_i32_10 = arith.constant 1 : i32
          %37 = arith.addi %0, %c1_i32_10 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c1_i32_11 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%40: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%36) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb3(%30: i32):  // no predecessors
      %c100_i32 = arith.constant 100 : i32
      %31 = arith.addi %c100_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %33 = "simt_step.switch"(%32, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_14 : i32
          %43 = arith.addi %42, %0 : i32
          %c104_i32 = arith.constant 104 : i32
          %44 = arith.addi %c104_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_15 : i32
          "simt_step.condition"(%46, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %42 = arith.addi %arg4, %arg5 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %43 = arith.addi %arg5, %c1_i32_14 : i32
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c124_i32 = arith.constant 124 : i32
        %36 = arith.addi %c124_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_12 : i32
        %39 = "simt_step.if"(%38) ({
          %c0_i32_14 = arith.constant 0 : i32
          %42 = arith.addi %0, %c0_i32_14 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %c4_i32_13 = arith.constant 4 : i32
        %41 = arith.addi %0, %c4_i32_13 : i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %14 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

