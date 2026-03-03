module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c3_i32 = arith.constant 3 : i32
      %6 = arith.remsi %arg3, %c3_i32 : i32
      %7 = simt_step.subgroup_id
      %8 = arith.index_cast %7 : index to i32
      %9 = "simt_step.switch"(%6, %8) ({
      ^bb0(%arg4: i32):
        %c0_i32_2 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_2) {fallthrough = false} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32 : i32
          %19 = arith.cmpi slt, %arg6, %18 : i32
          "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c3_i32_7 = arith.constant 3 : i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.break"(%c3_i32_7, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_5 = arith.constant 3 : i32
        "simt_step.yield"(%13#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %16 = "simt_step.if"(%15) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %17 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%17) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %10 = simt_step.lane_id
      %11 = arith.index_cast %10 : index to i32
      "simt_step.yield"(%9) : (i32) -> ()
    }, {
      %c0_i32_2 = arith.constant 0 : i32
      %6 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %7 = "simt_step.if"(%6) ({
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        %8 = arith.addi %arg0, %c3_i32 : i32
        "simt_step.yield"(%8) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%7) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_0, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %arg0, %1 : i32
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
    %c2_i32 = arith.constant 2 : i32
    %7 = "simt_step.switch"(%6, %c2_i32) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %24 = arith.addi %c12_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_5 : i32
      %27 = "simt_step.if"(%26) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_12 : i32
          %41 = arith.addi %40, %0 : i32
          %c16_i32_13 = arith.constant 16 : i32
          %42 = arith.addi %c16_i32_13, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_14 : i32
          "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %40 = arith.addi %arg3, %arg4 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %41 = arith.addi %arg4, %c1_i32_12 : i32
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%39#0) : (i32) -> ()
      }, {
        %c36_i32 = arith.constant 36 : i32
        %39 = arith.addi %c36_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_9 : i32
        %42 = "simt_step.if"(%41) ({
          %c2_i32_10 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_10) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%42) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb1(%28: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %29 = arith.addi %c40_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_6 : i32
      %32 = "simt_step.if"(%31) ({
        %c0_i32_9 = arith.constant 0 : i32
        %39 = arith.addi %0, %c0_i32_9 : i32
        "simt_step.yield"(%39) : (i32) -> ()
      }, {
        %c44_i32 = arith.constant 44 : i32
        %39 = arith.addi %c44_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %41 = arith.addi %0, %c0_i32_9 : i32
        %42 = "simt_step.switch"(%40, %41) ({
        ^bb0(%arg3: i32):
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%42) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb2(%33: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %34 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    ^bb3(%35: i32):  // no predecessors
      %c48_i32_7 = arith.constant 48 : i32
      %36 = arith.addi %c48_i32_7, %0 : i32
      %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %38 = "simt_step.switch"(%37, %c3_i32) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c1_i32_9 = arith.constant 1 : i32
        %40 = arith.addi %0, %c1_i32_9 : i32
        "simt_step.yield"(%40) {fallthrough = true} : (i32) -> ()
      ^bb2(%41: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %43 = arith.muli %arg5, %c4_i32_13 : i32
          %44 = arith.addi %43, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %45 = arith.addi %c52_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_14 : i32
          "simt_step.condition"(%47, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %43 = arith.addi %arg4, %arg5 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %44 = arith.addi %arg5, %c1_i32_13 : i32
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%42#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c72_i32 = arith.constant 72 : i32
    %10 = arith.addi %c72_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %12 = simt_step.subgroup_id
    %13 = arith.index_cast %12 : index to i32
    %14 = "simt_step.switch"(%11, %13) ({
    ^bb0(%arg2: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_11 : i32
        %28 = arith.addi %27, %0 : i32
        %c76_i32 = arith.constant 76 : i32
        %29 = arith.addi %c76_i32, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_12 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %30 = arith.muli %arg6, %c4_i32_14 : i32
          %31 = arith.addi %30, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %32 = arith.addi %c96_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_15 : i32
          "simt_step.condition"(%34, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %30 = arith.addi %arg5, %arg6 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %31 = arith.addi %arg6, %c1_i32_14 : i32
          "simt_step.continue"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %28 = arith.addi %arg3, %27#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.break"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %26:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_11 : i32
        %28 = arith.addi %27, %0 : i32
        %c116_i32 = arith.constant 116 : i32
        %29 = arith.addi %c116_i32, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_12 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %30 = arith.muli %arg6, %c4_i32_14 : i32
          %31 = arith.addi %30, %0 : i32
          %c136_i32 = arith.constant 136 : i32
          %32 = arith.addi %c136_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_15 : i32
          "simt_step.condition"(%34, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %30 = arith.addi %arg5, %arg6 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %31 = arith.addi %arg6, %c1_i32_14 : i32
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %28 = arith.addi %arg3, %27#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %15 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c156_i32 = arith.constant 156 : i32
    %17 = arith.addi %c156_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %19 = simt_step.subgroup_id
    %20 = arith.index_cast %19 : index to i32
    %21 = "simt_step.switch"(%18, %20) ({
    ^bb0(%arg2: i32):
      %c160_i32 = arith.constant 160 : i32
      %24 = arith.addi %c160_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_5 : i32
      %27 = "simt_step.if"(%26) ({
        %c164_i32 = arith.constant 164 : i32
        %35 = arith.addi %c164_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_10 : i32
        %38 = "simt_step.if"(%37) ({
          %c0_i32_11 = arith.constant 0 : i32
          %39 = arith.addi %0, %c0_i32_11 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        %c168_i32 = arith.constant 168 : i32
        %35 = arith.addi %c168_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_10 : i32
        %38 = "simt_step.if"(%37) ({
          %c2_i32_11 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_11) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %39 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb1(%28: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %29:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_10 : i32
        %36 = arith.addi %35, %0 : i32
        %c172_i32 = arith.constant 172 : i32
        %37 = arith.addi %c172_i32, %36 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_11 : i32
        "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c3_i32 = arith.constant 3 : i32
        %35 = arith.addi %0, %c3_i32 : i32
        %36 = arith.addi %arg3, %35 : i32
        %c1_i32 = arith.constant 1 : i32
        %37 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%36, %37) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%30: i32):  // no predecessors
      %c192_i32 = arith.constant 192 : i32
      %31 = arith.addi %c192_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %33 = arith.cmpi ne, %32, %c0_i32_9 : i32
      %34 = "simt_step.if"(%33) ({
        %c196_i32 = arith.constant 196 : i32
        %35 = arith.addi %c196_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_10 = arith.constant 2 : i32
        %37 = "simt_step.switch"(%36, %c2_i32_10) ({
        ^bb0(%arg3: i32):
          %c4_i32_12 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) {fallthrough = true} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%37) : (i32) -> ()
      }, {
        %c200_i32 = arith.constant 200 : i32
        %35 = arith.addi %c200_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_10 = arith.constant 4 : i32
        %37 = arith.addi %0, %c4_i32_10 : i32
        %38 = "simt_step.switch"(%36, %37) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %c2_i32_12 = arith.constant 2 : i32
          %40 = arith.addi %0, %c2_i32_12 : i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%38) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %22 = arith.addi %c48_i32, %0 : i32
    %true_4 = arith.constant true
    %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

