module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %4 = "simt_step.switch"(%arg3, %arg0) ({
      ^bb0(%arg5: i32):
        %c2_i32 = arith.constant 2 : i32
        %15 = arith.remsi %arg3, %c2_i32 : i32
        %16 = "simt_step.switch"(%15, %arg0) ({
        ^bb0(%arg6: i32):
          %c2_i32_7 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_7) {fallthrough = true} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c2_i32_5 = arith.constant 2 : i32
        %18 = arith.remsi %arg3, %c2_i32_5 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %19 = "simt_step.switch"(%18, %c1_i32_6) ({
        ^bb0(%arg6: i32):
          %c1_i32_7 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %c3_i32_8 = arith.constant 3 : i32
          %22 = arith.addi %arg0, %c3_i32_8 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %7 = "simt_step.if"(%6) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32_9 : i32
          %19 = arith.cmpi slt, %arg6, %18 : i32
          "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_8 = arith.constant 1 : i32
          %17 = arith.addi %arg6, %c1_i32_8 : i32
          "simt_step.yield"(%arg0, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c4_i32_7 = arith.constant 4 : i32
        %16 = arith.addi %arg0, %c4_i32_7 : i32
        "simt_step.yield"(%15#0) : (i32) -> ()
      }, {
        %c3_i32_5 = arith.constant 3 : i32
        %15 = arith.remsi %arg3, %c3_i32_5 : i32
        %16 = "simt_step.switch"(%15, %arg0) ({
        ^bb0(%arg5: i32):
          %c2_i32 = arith.constant 2 : i32
          %17 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %c2_i32_7 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_7) {fallthrough = true} : (i32) -> ()
        ^bb2(%19: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          %20 = arith.addi %arg0, %c4_i32_8 : i32
          "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
        ^bb3(%21: i32):  // no predecessors
          %c2_i32_9 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_9) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %c3_i32_6 = arith.constant 3 : i32
        "simt_step.yield"(%16) : (i32) -> ()
      }) : (i1) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      "simt_step.yield"(%7) {fallthrough = true} : (i32) -> ()
    ^bb2(%8: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %9 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %10 = "simt_step.if"(%9) ({
        %c0_i32_5 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %16 = "simt_step.if"(%15) ({
          %c4_i32_7 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_7) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_6 = arith.constant 4 : i32
        "simt_step.yield"(%16) : (i32) -> ()
      }, {
        %c3_i32_5 = arith.constant 3 : i32
        %15 = arith.remsi %arg3, %c3_i32_5 : i32
        %c3_i32_6 = arith.constant 3 : i32
        %16 = arith.addi %arg0, %c3_i32_6 : i32
        %17 = "simt_step.switch"(%15, %16) ({
        ^bb0(%arg5: i32):
          %c1_i32_8 = arith.constant 1 : i32
          %19 = arith.addi %arg0, %c1_i32_8 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %c3_i32_9 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_9) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %c4_i32_7 = arith.constant 4 : i32
        %18 = arith.addi %arg0, %c4_i32_7 : i32
        "simt_step.yield"(%17) : (i32) -> ()
      }) : (i1) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %11 = arith.addi %arg0, %c0_i32_3 : i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb3(%12: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      %13 = "simt_step.switch"(%arg3, %c4_i32) ({
      ^bb0(%arg5: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32_9 : i32
          %21 = arith.cmpi slt, %arg7, %20 : i32
          "simt_step.condition"(%21, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_8 = arith.constant 3 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %19 = arith.addi %arg7, %c1_i32_9 : i32
          "simt_step.yield"(%c3_i32_8, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32 : i32
        %18 = "simt_step.switch"(%17, %arg0) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %c1_i32_8 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb2(%20: i32):  // no predecessors
          %c1_i32_9 = arith.constant 1 : i32
          %21 = arith.addi %arg0, %c1_i32_9 : i32
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c2_i32_7 = arith.constant 2 : i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32_4 = arith.constant 1 : i32
      %14 = arith.addi %arg0, %c1_i32_4 : i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %26 = arith.addi %0, %c0_i32_5 : i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %28 = arith.addi %c12_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %30 = "simt_step.switch"(%29, %0) ({
      ^bb0(%arg3: i32):
        %c16_i32_9 = arith.constant 16 : i32
        %41 = arith.addi %c16_i32_9, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_10 : i32
        %44 = "simt_step.if"(%43) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_17 = arith.constant 4 : i32
          %50 = arith.addi %0, %c4_i32_17 : i32
          "simt_step.yield"(%50) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%44) {fallthrough = true} : (i32) -> ()
      ^bb1(%45: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %46:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_17 : i32
          %51 = arith.addi %50, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %52 = arith.addi %c20_i32, %51 : i32
          %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %54 = arith.cmpi ne, %53, %c0_i32_18 : i32
          "simt_step.condition"(%54, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %50 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %51 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%50, %51) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%46#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%47: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %48:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_17 : i32
          %51 = arith.addi %50, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %52 = arith.addi %c40_i32, %51 : i32
          %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %54 = arith.cmpi ne, %53, %c0_i32_18 : i32
          "simt_step.condition"(%54, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %50 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %51 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.break"(%50, %51) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        "simt_step.yield"(%48#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%49: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    ^bb2(%31: i32):  // no predecessors
      %c60_i32 = arith.constant 60 : i32
      %32 = arith.addi %c60_i32, %0 : i32
      %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %34 = arith.cmpi ne, %33, %c0_i32_7 : i32
      %35 = "simt_step.if"(%34) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c64_i32 = arith.constant 64 : i32
        %41 = arith.addi %c64_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %43 = "simt_step.switch"(%42, %c3_i32) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%43) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
    ^bb3(%36: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %37 = arith.addi %c68_i32, %0 : i32
      %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %39 = arith.cmpi ne, %38, %c0_i32_8 : i32
      %40 = "simt_step.if"(%39) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %42 = arith.muli %arg4, %c4_i32_12 : i32
          %43 = arith.addi %42, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %44 = arith.addi %c72_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_13 : i32
          "simt_step.condition"(%46, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %42 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%41#0) : (i32) -> ()
      }, {
        %c92_i32 = arith.constant 92 : i32
        %41 = arith.addi %c92_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %43 = arith.addi %0, %c1_i32 : i32
        %44 = "simt_step.switch"(%42, %43) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%44) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c96_i32 = arith.constant 96 : i32
    %12 = arith.addi %c96_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.lane_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %26:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_8 : i32
        %29 = arith.addi %28, %0 : i32
        %c100_i32 = arith.constant 100 : i32
        %30 = arith.addi %c100_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_9 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %28 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.continue"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %17 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c120_i32 = arith.constant 120 : i32
    %19 = arith.addi %c120_i32, %0 : i32
    %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
    %21 = simt_step.lane_id
    %22 = arith.index_cast %21 : index to i32
    %23 = "simt_step.switch"(%20, %22) ({
    ^bb0(%arg2: i32):
      %c2_i32 = arith.constant 2 : i32
      %26 = arith.addi %0, %c2_i32 : i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c124_i32 = arith.constant 124 : i32
      %29 = arith.addi %c124_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_5 : i32
      %32 = "simt_step.if"(%31) ({
        %c4_i32_6 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_6) : (i32) -> ()
      }, {
        %c128_i32 = arith.constant 128 : i32
        %33 = arith.addi %c128_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %35 = arith.addi %0, %c0_i32_6 : i32
        %36 = "simt_step.switch"(%34, %35) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%36) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %24 = arith.addi %c48_i32, %0 : i32
    %true_4 = arith.constant true
    %25 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

