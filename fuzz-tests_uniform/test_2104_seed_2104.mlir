module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_1 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %5 = "simt_step.if"(%4) ({
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %12 = arith.addi %11, %c1_i32 : i32
          %13 = arith.cmpi slt, %arg5, %12 : i32
          "simt_step.condition"(%13, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %11 = simt_step.lane_id
          %12 = arith.index_cast %11 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%12, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %9 = simt_step.subgroup_id
        %10 = arith.index_cast %9 : index to i32
        "simt_step.yield"(%8#0) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %12 = arith.addi %11, %c1_i32 : i32
          %13 = arith.cmpi slt, %arg5, %12 : i32
          "simt_step.condition"(%13, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %11 = simt_step.subgroup_id
          %12 = arith.index_cast %11 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%12, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %9 = simt_step.lane_id
        %10 = arith.index_cast %9 : index to i32
        "simt_step.yield"(%8#0) : (i32) -> ()
      }) : (i1) -> i32
      %6 = simt_step.lane_id
      %7 = arith.index_cast %6 : index to i32
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %5 = "simt_step.if"(%4) ({
        %6 = simt_step.lane_id
        %7 = arith.index_cast %6 : index to i32
        "simt_step.yield"(%7) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %6 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %7 = "simt_step.if"(%6) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %10 = simt_step.lane_id
          %11 = arith.index_cast %10 : index to i32
          "simt_step.yield"(%11) : (i32) -> ()
        }) : (i1) -> i32
        %8 = simt_step.subgroup_id
        %9 = arith.index_cast %8 : index to i32
        "simt_step.yield"(%7) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%5) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_0, %arg0 : i32
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
      %c12_i32 = arith.constant 12 : i32
      %20 = arith.addi %c12_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %22 = arith.addi %0, %c1_i32 : i32
      %23 = "simt_step.switch"(%21, %22) ({
      ^bb0(%arg3: i32):
        %c16_i32_9 = arith.constant 16 : i32
        %36 = arith.addi %c16_i32_9, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %38 = arith.addi %0, %c2_i32 : i32
        %39 = "simt_step.switch"(%37, %38) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c4_i32_15 = arith.constant 4 : i32
          %49 = arith.addi %0, %c4_i32_15 : i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          %c4_i32_16 = arith.constant 4 : i32
          %51 = arith.addi %0, %c4_i32_16 : i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        ^bb3(%52: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %53 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %41 = arith.addi %c20_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_11 : i32
        %44 = "simt_step.if"(%43) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb2(%45: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb3(%46: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %47:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_15 : i32
          %49 = arith.addi %48, %0 : i32
          %c24_i32 = arith.constant 24 : i32
          %50 = arith.addi %c24_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_16 : i32
          "simt_step.condition"(%52, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %48 = arith.addi %arg4, %arg5 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %49 = arith.addi %arg5, %c1_i32_15 : i32
          "simt_step.break"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        "simt_step.yield"(%47#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %25 = arith.addi %c44_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_4 : i32
      %28 = "simt_step.if"(%27) ({
        %c48_i32 = arith.constant 48 : i32
        %36 = arith.addi %c48_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %38 = "simt_step.switch"(%37, %c3_i32) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          %39 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%42: i32):  // no predecessors
          %c3_i32_11 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    ^bb2(%29: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %30:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_9 : i32
        %37 = arith.addi %36, %0 : i32
        %c52_i32 = arith.constant 52 : i32
        %38 = arith.addi %c52_i32, %37 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_10 : i32
        "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %36 = arith.addi %0, %c0_i32_9 : i32
        %37 = arith.addi %arg3, %36 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %38 = arith.addi %arg4, %c1_i32_10 : i32
        "simt_step.break"(%37, %38) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%31: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %32 = arith.addi %c72_i32, %0 : i32
      %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %34 = arith.cmpi ne, %33, %c0_i32_8 : i32
      %35 = "simt_step.if"(%34) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_12 : i32
          %38 = arith.addi %37, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %39 = arith.addi %c76_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_13 : i32
          "simt_step.condition"(%41, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %37 = arith.addi %arg3, %arg4 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %38 = arith.addi %arg4, %c1_i32_12 : i32
          "simt_step.continue"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%36#0) : (i32) -> ()
      }, {
        %c96_i32 = arith.constant 96 : i32
        %36 = arith.addi %c96_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_9 : i32
        %39 = "simt_step.if"(%38) ({
          %c0_i32_10 = arith.constant 0 : i32
          %40 = arith.addi %0, %c0_i32_10 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }, {
          %c1_i32_10 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%39) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c100_i32 = arith.constant 100 : i32
    %12 = arith.addi %c100_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_1 : i32
    %15 = "simt_step.if"(%14) ({
      %c104_i32 = arith.constant 104 : i32
      %20 = arith.addi %c104_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = simt_step.lane_id
      %23 = arith.index_cast %22 : index to i32
      %24 = "simt_step.switch"(%21, %23) ({
      ^bb0(%arg2: i32):
        %c108_i32 = arith.constant 108 : i32
        %25 = arith.addi %c108_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_4 : i32
        %28 = "simt_step.if"(%27) ({
          %c3_i32 = arith.constant 3 : i32
          %32 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %32 = arith.muli %arg4, %c4_i32_8 : i32
          %33 = arith.addi %32, %0 : i32
          %c112_i32 = arith.constant 112 : i32
          %34 = arith.addi %c112_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_9 : i32
          "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %32 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.continue"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%31: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      "simt_step.yield"(%24) : (i32) -> ()
    }, {
      %c132_i32 = arith.constant 132 : i32
      %20 = arith.addi %c132_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_3 : i32
      %23 = "simt_step.if"(%22) ({
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %25 = arith.muli %arg3, %c4_i32_7 : i32
          %26 = arith.addi %25, %0 : i32
          %c136_i32 = arith.constant 136 : i32
          %27 = arith.addi %c136_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_8 : i32
          "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %25 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg3, %c1_i32 : i32
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_6 = arith.constant true
        "simt_step.yield"(%24#0) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %25 = arith.muli %arg3, %c4_i32_7 : i32
          %26 = arith.addi %25, %0 : i32
          %c156_i32 = arith.constant 156 : i32
          %27 = arith.addi %c156_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_8 : i32
          "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %25 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg3, %c1_i32 : i32
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_6 = arith.constant true
        "simt_step.yield"(%24#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %16 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %18 = simt_step.subgroup_id
    %19 = arith.index_cast %18 : index to i32
    return
  }
}

