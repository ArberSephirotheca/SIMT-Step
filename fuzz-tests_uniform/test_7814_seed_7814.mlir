module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.lane_id
    %1 = arith.index_cast %0 : index to i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %2:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %13 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %13, %c1_i32 : i32
      %15 = arith.cmpi slt, %arg5, %14 : i32
      "simt_step.condition"(%15, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%arg0, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %6 = arith.select %5, %1, %2#0 : i32
    %c3_i32 = arith.constant 3 : i32
    %7 = arith.remsi %arg3, %c3_i32 : i32
    %8 = "simt_step.switch"(%7, %arg0) ({
    ^bb0(%arg4: i32):
      %c2_i32 = arith.constant 2 : i32
      %13 = arith.remsi %arg3, %c2_i32 : i32
      %14 = "simt_step.switch"(%13, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %28 = arith.remsi %arg3, %c4_i32_14 : i32
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %28, %c1_i32 : i32
          %30 = arith.cmpi slt, %arg7, %29 : i32
          "simt_step.condition"(%30, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.break"(%c4_i32_14, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_11 = arith.constant 3 : i32
        %23 = arith.addi %arg0, %c3_i32_11 : i32
        "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
        %26 = "simt_step.if"(%25) ({
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_13 = arith.constant 4 : i32
        %27 = arith.addi %arg0, %c4_i32_13 : i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c3_i32_5 = arith.constant 3 : i32
      %15 = arith.addi %arg0, %c3_i32_5 : i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c2_i32_6 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32_6) {fallthrough = true} : (i32) -> ()
    ^bb2(%17: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      %18 = arith.remsi %arg3, %c4_i32 : i32
      %c3_i32_7 = arith.constant 3 : i32
      %19 = arith.addi %arg0, %c3_i32_7 : i32
      %20 = "simt_step.switch"(%18, %19) ({
      ^bb0(%arg5: i32):
        %c0_i32_9 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_9) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c2_i32_10 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_10) {fallthrough = false} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %arg2, %c0_i32_11 : i32
        %26 = "simt_step.if"(%25) ({
          %c3_i32_13 = arith.constant 3 : i32
          %27 = arith.addi %arg0, %c3_i32_13 : i32
          "simt_step.yield"(%27) : (i32) -> ()
        }, {
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        %c3_i32_12 = arith.constant 3 : i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %21 = arith.addi %arg0, %c0_i32_8 : i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
    %12 = arith.select %11, %6, %8 : i32
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
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %25 = arith.muli %arg3, %c4_i32_8 : i32
        %26 = arith.addi %25, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %27 = arith.addi %c12_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_9 : i32
        "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %25 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.continue"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%24#0) : (i32) -> ()
    }, {
      %c32_i32_5 = arith.constant 32 : i32
      %24 = arith.addi %c32_i32_5, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
      %27 = "simt_step.if"(%26) ({
        %c36_i32 = arith.constant 36 : i32
        %28 = arith.addi %c36_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %30 = simt_step.lane_id
        %31 = arith.index_cast %30 : index to i32
        %32 = "simt_step.switch"(%29, %31) ({
        ^bb0(%arg2: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %35 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%32) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %9 = arith.addi %c32_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c40_i32 = arith.constant 40 : i32
    %11 = arith.addi %c40_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = simt_step.subgroup_id
    %14 = arith.index_cast %13 : index to i32
    %15 = "simt_step.switch"(%12, %14) ({
    ^bb0(%arg2: i32):
      %c44_i32 = arith.constant 44 : i32
      %24 = arith.addi %c44_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_5 : i32
      %27 = "simt_step.if"(%26) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_12 : i32
          %44 = arith.addi %43, %0 : i32
          %c48_i32_13 = arith.constant 48 : i32
          %45 = arith.addi %c48_i32_13, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_14 : i32
          "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %43 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%42#0) : (i32) -> ()
      }, {
        %c68_i32 = arith.constant 68 : i32
        %42 = arith.addi %c68_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_9 = arith.constant 4 : i32
        %44 = "simt_step.switch"(%43, %c4_i32_9) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) {fallthrough = true} : (i32) -> ()
        ^bb2(%46: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          %47 = arith.addi %0, %c4_i32_12 : i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%44) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb1(%28: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %29 = arith.addi %c72_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %31 = "simt_step.switch"(%30, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_13 : i32
          %49 = arith.addi %48, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %50 = arith.addi %c76_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_14 : i32
          "simt_step.condition"(%52, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %48 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %49 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%42#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%43: i32):  // no predecessors
        %c96_i32 = arith.constant 96 : i32
        %44 = arith.addi %c96_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %46 = arith.cmpi ne, %45, %c0_i32_12 : i32
        %47 = "simt_step.if"(%46) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %48 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
    ^bb2(%32: i32):  // no predecessors
      %c100_i32 = arith.constant 100 : i32
      %33 = arith.addi %c100_i32, %0 : i32
      %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %35 = arith.addi %0, %c3_i32 : i32
      %36 = "simt_step.switch"(%34, %35) ({
      ^bb0(%arg3: i32):
        %c104_i32 = arith.constant 104 : i32
        %42 = arith.addi %c104_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %44 = "simt_step.switch"(%43, %c1_i32) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c3_i32_14 = arith.constant 3 : i32
          %49 = arith.addi %0, %c3_i32_14 : i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%51: i32):  // no predecessors
          %c4_i32_15 = arith.constant 4 : i32
          %52 = arith.addi %0, %c4_i32_15 : i32
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb1(%45: i32):  // no predecessors
        %c4_i32_10 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_10) {fallthrough = false} : (i32) -> ()
      ^bb2(%46: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %47:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_14 : i32
          %49 = arith.addi %48, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %50 = arith.addi %c108_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_15 : i32
          "simt_step.condition"(%52, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %48 = arith.addi %arg4, %arg5 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %49 = arith.addi %arg5, %c1_i32_14 : i32
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%47#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
    ^bb3(%37: i32):  // no predecessors
      %c128_i32 = arith.constant 128 : i32
      %38 = arith.addi %c128_i32, %0 : i32
      %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %40 = arith.cmpi ne, %39, %c0_i32_8 : i32
      %41 = "simt_step.if"(%40) ({
        %c132_i32 = arith.constant 132 : i32
        %42 = arith.addi %c132_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %44 = arith.addi %0, %c0_i32_9 : i32
        %45 = "simt_step.switch"(%43, %44) ({
        ^bb0(%arg3: i32):
          %c3_i32_11 = arith.constant 3 : i32
          %46 = arith.addi %0, %c3_i32_11 : i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          %48 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%45) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %16 = arith.addi %c48_i32, %0 : i32
    %true_2 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c136_i32 = arith.constant 136 : i32
    %18 = arith.addi %c136_i32, %0 : i32
    %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %20 = arith.cmpi ne, %19, %c0_i32_3 : i32
    %21 = "simt_step.if"(%20) ({
      %c140_i32 = arith.constant 140 : i32
      %24 = arith.addi %c140_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_5 : i32
      %27 = "simt_step.if"(%26) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %29 = arith.muli %arg3, %c4_i32_9 : i32
          %30 = arith.addi %29, %0 : i32
          %c144_i32 = arith.constant 144 : i32
          %31 = arith.addi %c144_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_10 : i32
          "simt_step.condition"(%33, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %29 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %arg3, %c1_i32 : i32
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        "simt_step.yield"(%28#0) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %29 = arith.muli %arg3, %c4_i32_9 : i32
          %30 = arith.addi %29, %0 : i32
          %c164_i32 = arith.constant 164 : i32
          %31 = arith.addi %c164_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_10 : i32
          "simt_step.condition"(%33, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %29 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %arg3, %c1_i32 : i32
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        "simt_step.yield"(%28#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) : (i32) -> ()
    }, {
      %24 = simt_step.lane_id
      %25 = arith.index_cast %24 : index to i32
      "simt_step.yield"(%25) : (i32) -> ()
    }) : (i1) -> i32
    %c64_i32 = arith.constant 64 : i32
    %22 = arith.addi %c64_i32, %0 : i32
    %true_4 = arith.constant true
    %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

