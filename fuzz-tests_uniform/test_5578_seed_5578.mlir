module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %8 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %9 = arith.addi %8, %c1_i32 : i32
        %10 = arith.cmpi slt, %arg6, %9 : i32
        "simt_step.condition"(%10, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c1_i32 = arith.constant 1 : i32
        %8 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%arg0, %8) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c2_i32_2 = arith.constant 2 : i32
      "simt_step.yield"(%4#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %6 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %7 = "simt_step.if"(%6) ({
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %11 = arith.addi %10, %c1_i32 : i32
          %12 = arith.cmpi slt, %arg6, %11 : i32
          "simt_step.condition"(%12, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c3_i32 = arith.constant 3 : i32
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%c3_i32, %10) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32_6 = arith.constant 2 : i32
        %9 = arith.addi %arg0, %c2_i32_6 : i32
        "simt_step.yield"(%8#0) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %9 = "simt_step.if"(%8) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c4_i32_5 = arith.constant 4 : i32
          %11 = arith.addi %arg0, %c4_i32_5 : i32
          "simt_step.yield"(%11) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.addi %arg0, %c4_i32 : i32
        "simt_step.yield"(%9) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
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
    %5 = simt_step.subgroup_id
    %6 = arith.index_cast %5 : index to i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_10 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_10 : i32
      %21 = arith.addi %20, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %22 = arith.addi %c8_i32, %21 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_11 : i32
      "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %20 = simt_step.subgroup_id
      %21 = arith.index_cast %20 : index to i32
      %22 = arith.addi %arg2, %21 : i32
      %c1_i32 = arith.constant 1 : i32
      %23 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%22, %23) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %10:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_10 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_10 : i32
      %21 = arith.addi %20, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %22 = arith.addi %c28_i32, %21 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_11 : i32
      "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %20 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %21 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.continue"(%20, %21) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %true_6 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c48_i32 = arith.constant 48 : i32
    %13 = arith.addi %c48_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %15 = simt_step.lane_id
    %16 = arith.index_cast %15 : index to i32
    %17 = "simt_step.switch"(%14, %16) ({
    ^bb0(%arg2: i32):
      %c52_i32 = arith.constant 52 : i32
      %20 = arith.addi %c52_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %22 = "simt_step.switch"(%21, %c0_i32_10) ({
      ^bb0(%arg3: i32):
        %c56_i32 = arith.constant 56 : i32
        %35 = arith.addi %c56_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_14 : i32
        %38 = "simt_step.if"(%37) ({
          %c2_i32 = arith.constant 2 : i32
          %41 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%41) : (i32) -> ()
        }, {
          %c0_i32_18 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_18) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_18 : i32
          %42 = arith.addi %41, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %43 = arith.addi %c60_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_19 : i32
          "simt_step.condition"(%45, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %41 = arith.addi %arg4, %arg5 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %42 = arith.addi %arg5, %c1_i32_18 : i32
          "simt_step.yield"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        "simt_step.yield"(%40#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_11 = arith.constant true
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c80_i32 = arith.constant 80 : i32
      %24 = arith.addi %c80_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %26 = arith.addi %0, %c3_i32 : i32
      %27 = "simt_step.switch"(%25, %26) ({
      ^bb0(%arg3: i32):
        %c84_i32 = arith.constant 84 : i32
        %35 = arith.addi %c84_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_14 : i32
        %38 = "simt_step.if"(%37) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_23 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_23) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_23 : i32
          %49 = arith.addi %48, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %50 = arith.addi %c88_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_24 : i32
          "simt_step.condition"(%52, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %48 = arith.addi %arg4, %arg5 : i32
          %c1_i32_23 = arith.constant 1 : i32
          %49 = arith.addi %arg5, %c1_i32_23 : i32
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        "simt_step.yield"(%40#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%41: i32):  // no predecessors
        %c0_i32_18 = arith.constant 0 : i32
        %c0_i32_19 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_18, %c0_i32_19) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_23 : i32
          %49 = arith.addi %48, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %50 = arith.addi %c108_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_24 : i32
          "simt_step.condition"(%52, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %48 = arith.addi %arg4, %arg5 : i32
          %c1_i32_23 = arith.constant 1 : i32
          %49 = arith.addi %arg5, %c1_i32_23 : i32
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_20 = arith.constant true
        "simt_step.yield"(%42#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%43: i32):  // no predecessors
        %c128_i32 = arith.constant 128 : i32
        %44 = arith.addi %c128_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_21 = arith.constant 0 : i32
        %46 = arith.addi %0, %c0_i32_21 : i32
        %47 = "simt_step.switch"(%45, %46) ({
        ^bb0(%arg4: i32):
          %c4_i32_23 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_23) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c3_i32_24 = arith.constant 3 : i32
          %49 = arith.addi %0, %c3_i32_24 : i32
          "simt_step.yield"(%49) {fallthrough = true} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          %c0_i32_25 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_25) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_22 = arith.constant true
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_12 = arith.constant true
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %29 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
    ^bb3(%30: i32):  // no predecessors
      %c132_i32 = arith.constant 132 : i32
      %31 = arith.addi %c132_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_13 = arith.constant 0 : i32
      %33 = arith.cmpi ne, %32, %c0_i32_13 : i32
      %34 = "simt_step.if"(%33) ({
        %c136_i32 = arith.constant 136 : i32
        %35 = arith.addi %c136_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %37 = "simt_step.switch"(%36, %0) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%37) : (i32) -> ()
      }, {
        %c140_i32 = arith.constant 140 : i32
        %35 = arith.addi %c140_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %37 = "simt_step.switch"(%36, %0) ({
        ^bb0(%arg3: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %38 = arith.addi %0, %c4_i32_15 : i32
          "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %c3_i32_16 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_16) {fallthrough = true} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %c4_i32_17 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%37) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_7 = arith.constant true
    %c48_i32_8 = arith.constant 48 : i32
    %18 = arith.addi %c48_i32_8, %0 : i32
    %true_9 = arith.constant true
    %19 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

