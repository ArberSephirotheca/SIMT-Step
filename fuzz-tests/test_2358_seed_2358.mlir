module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c4_i32 = arith.constant 4 : i32
    %1 = arith.addi %arg0, %c4_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %5 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %6 = "simt_step.if"(%5) ({
        "simt_step.yield"(%arg0) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %14 = arith.remsi %arg3, %c2_i32 : i32
        %c2_i32_4 = arith.constant 2 : i32
        %15 = "simt_step.switch"(%14, %c2_i32_4) ({
        ^bb0(%arg5: i32):
          %c0_i32_5 = arith.constant 0 : i32
          %16 = arith.addi %arg0, %c0_i32_5 : i32
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %c3_i32_6 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_6) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%15) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32_4 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %15 = arith.addi %14, %c1_i32_5 : i32
        %16 = arith.cmpi slt, %arg6, %15 : i32
        "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c3_i32_4 = arith.constant 3 : i32
        %14 = arith.remsi %arg3, %c3_i32_4 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %15 = arith.addi %arg0, %c4_i32_5 : i32
        %16 = "simt_step.switch"(%14, %15) ({
        ^bb0(%arg7: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%19: i32):  // no predecessors
          %c3_i32_7 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb3(%20: i32):  // no predecessors
          %c1_i32_8 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %c1_i32_6 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32_6 : i32
        "simt_step.yield"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    ^bb3(%10: i32):  // no predecessors
      %c4_i32_3 = arith.constant 4 : i32
      %11 = arith.remsi %arg3, %c4_i32_3 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg0, %c1_i32 : i32
      %13 = "simt_step.switch"(%11, %12) ({
      ^bb0(%arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32_11 : i32
          %22 = arith.cmpi slt, %arg7, %21 : i32
          "simt_step.condition"(%22, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c2_i32 = arith.constant 2 : i32
          %20 = arith.addi %arg0, %c2_i32 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %21 = arith.addi %arg7, %c1_i32_10 : i32
          "simt_step.continue"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb2(%16: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32_11 : i32
          %22 = arith.cmpi slt, %arg7, %21 : i32
          "simt_step.condition"(%22, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_10 = arith.constant 3 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %20 = arith.addi %arg7, %c1_i32_11 : i32
          "simt_step.break"(%c3_i32_10, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%18: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32_11 : i32
          %22 = arith.cmpi slt, %arg7, %21 : i32
          "simt_step.condition"(%22, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %20 = arith.addi %arg7, %c1_i32_11 : i32
          "simt_step.yield"(%c4_i32_10, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %18 = arith.cmpi slt, %arg3, %c2_i32 : i32
        "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c2_i32 = arith.constant 2 : i32
      %17 = arith.addi %0, %c2_i32 : i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %19 = arith.addi %c12_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = "simt_step.switch"(%20, %0) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %30 = arith.addi %c16_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_3 : i32
        %33 = "simt_step.if"(%32) ({
          %c1_i32_6 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_6) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %35 = arith.addi %c20_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %37 = arith.addi %0, %c1_i32 : i32
        %38 = "simt_step.switch"(%36, %37) ({
        ^bb0(%arg4: i32):
          %c0_i32_6 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_6) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          %c2_i32_7 = arith.constant 2 : i32
          %50 = arith.addi %0, %c2_i32_7 : i32
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        ^bb2(%51: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%52: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %40 = arith.addi %c24_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_4 : i32
        %43 = "simt_step.if"(%42) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c2_i32_6 = arith.constant 2 : i32
          %49 = arith.addi %0, %c2_i32_6 : i32
          "simt_step.yield"(%49) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb3(%44: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %45 = arith.addi %c28_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_5 : i32
        %48 = "simt_step.if"(%47) ({
          %c0_i32_6 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_6) : (i32) -> ()
        }, {
          %c1_i32_6 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %23 = arith.addi %c32_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = "simt_step.switch"(%24, %0) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %31 = arith.addi %c36_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_3 : i32
        %34 = "simt_step.if"(%33) ({
          %c4_i32_4 = arith.constant 4 : i32
          %35 = arith.addi %0, %c4_i32_4 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %c4_i32_4 = arith.constant 4 : i32
          %35 = arith.addi %0, %c4_i32_4 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb3(%26: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %27 = arith.addi %c40_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = "simt_step.switch"(%28, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_7 : i32
          %37 = arith.addi %36, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %38 = arith.addi %c44_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_8 : i32
          "simt_step.condition"(%40, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %36 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg5, %c1_i32 : i32
          %true_7 = arith.constant true
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %32 = arith.addi %c64_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_5 = arith.constant 2 : i32
        %34 = arith.addi %0, %c2_i32_5 : i32
        %35 = "simt_step.switch"(%33, %34) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%37) {fallthrough = true} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb3(%39: i32):  // no predecessors
          %c1_i32_8 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %c68_i32 = arith.constant 68 : i32
    %11 = arith.addi %c68_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
    %14 = "simt_step.if"(%13) ({
      %c72_i32 = arith.constant 72 : i32
      %17 = arith.addi %c72_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_2 : i32
      %20 = "simt_step.if"(%19) ({
        %23 = simt_step.lane_id
        %24 = arith.index_cast %23 : index to i32
        "simt_step.yield"(%24) : (i32) -> ()
      }, {
        %c76_i32 = arith.constant 76 : i32
        %23 = arith.addi %c76_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_4 : i32
        %26 = "simt_step.if"(%25) ({
          %29 = simt_step.lane_id
          %30 = arith.index_cast %29 : index to i32
          "simt_step.yield"(%30) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %29 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%29) : (i32) -> ()
        }) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %27 = arith.addi %c16_i32, %0 : i32
        %true_5 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) : (i32) -> ()
      }) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %21 = arith.addi %c32_i32, %0 : i32
      %true_3 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) : (i32) -> ()
    }, {
      %c80_i32_2 = arith.constant 80 : i32
      %17 = arith.addi %c80_i32_2, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_3 : i32
      %20 = "simt_step.if"(%19) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %24 = arith.muli %arg3, %c4_i32_7 : i32
          %25 = arith.addi %24, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %26 = arith.addi %c84_i32, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_8 : i32
          "simt_step.condition"(%28, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %24 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %25 = arith.addi %arg3, %c1_i32 : i32
          %true_7 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %26 = arith.muli %arg3, %c4_i32_8 : i32
          %27 = arith.addi %c48_i32, %26 : i32
          %28 = arith.addi %27, %0 : i32
          %true_9 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) : (i32) -> ()
      }, {
        %23 = simt_step.subgroup_id
        %24 = arith.index_cast %23 : index to i32
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %21 = arith.addi %c64_i32, %0 : i32
      %true_4 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) : (i32) -> ()
    }) : (i1) -> i32
    %c80_i32 = arith.constant 80 : i32
    %15 = arith.addi %c80_i32, %0 : i32
    %true = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

