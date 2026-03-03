module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %5 = "simt_step.if"(%4) ({
        %c0_i32_4 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %17 = "simt_step.if"(%16) ({
          %c3_i32_6 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_6) : (i32) -> ()
        }, {
          %c3_i32_6 = arith.constant 3 : i32
          %19 = arith.addi %arg0, %c3_i32_6 : i32
          "simt_step.yield"(%19) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_5 = arith.constant 1 : i32
        %18 = arith.addi %arg0, %c1_i32_5 : i32
        "simt_step.yield"(%17) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32_8 : i32
          %20 = arith.cmpi slt, %arg6, %19 : i32
          "simt_step.condition"(%20, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c0_i32_7 = arith.constant 0 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %18 = arith.addi %arg6, %c1_i32_8 : i32
          "simt_step.yield"(%c0_i32_7, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c0_i32_6 = arith.constant 0 : i32
        %17 = arith.addi %arg0, %c0_i32_6 : i32
        "simt_step.yield"(%16#0) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %8 = arith.remsi %arg3, %c3_i32 : i32
      %9 = "simt_step.switch"(%8, %arg0) ({
      ^bb0(%arg5: i32):
        %c3_i32_4 = arith.constant 3 : i32
        %16 = arith.remsi %arg3, %c3_i32_4 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %17 = "simt_step.switch"(%16, %c4_i32_5) ({
        ^bb0(%arg6: i32):
          %c0_i32_13 = arith.constant 0 : i32
          %25 = arith.addi %arg0, %c0_i32_13 : i32
          "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %c3_i32_14 = arith.constant 3 : i32
          %27 = arith.addi %arg0, %c3_i32_14 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%29: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c2_i32_6 = arith.constant 2 : i32
        %19 = arith.remsi %arg3, %c2_i32_6 : i32
        %c2_i32_7 = arith.constant 2 : i32
        %20 = "simt_step.switch"(%19, %c2_i32_7) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c2_i32_8 = arith.constant 2 : i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32_14 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_13 = arith.constant 1 : i32
          %25 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.yield"(%arg0, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%23: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32_14 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c2_i32_13 = arith.constant 2 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %25 = arith.addi %arg7, %c1_i32_14 : i32
          "simt_step.yield"(%c2_i32_13, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %c3_i32_1 = arith.constant 3 : i32
      %10 = arith.addi %arg0, %c3_i32_1 : i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb2(%11: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %13 = "simt_step.if"(%12) ({
        %c2_i32_4 = arith.constant 2 : i32
        %16 = arith.remsi %arg3, %c2_i32_4 : i32
        %17 = "simt_step.switch"(%16, %arg0) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %c4_i32_5 = arith.constant 4 : i32
          %19 = arith.addi %arg0, %c4_i32_5 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%17) : (i32) -> ()
      }, {
        "simt_step.yield"(%arg0) : (i32) -> ()
      }) : (i1) -> i32
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb3(%14: i32):  // no predecessors
      %c4_i32_3 = arith.constant 4 : i32
      %15 = "simt_step.switch"(%arg3, %c4_i32_3) ({
      ^bb0(%arg5: i32):
        "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c3_i32_4 = arith.constant 3 : i32
        %17 = arith.addi %arg0, %c3_i32_4 : i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
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
      %c12_i32 = arith.constant 12 : i32
      %24 = arith.addi %c12_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %26 = "simt_step.switch"(%25, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c16_i32_11 = arith.constant 16 : i32
        %34 = arith.addi %c16_i32_11, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_12 : i32
        %37 = "simt_step.if"(%36) ({
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) : (i32) -> ()
        }, {
          %c2_i32_13 = arith.constant 2 : i32
          %40 = arith.addi %0, %c2_i32_13 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %39 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %28:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_11 : i32
        %35 = arith.addi %34, %0 : i32
        %c20_i32 = arith.constant 20 : i32
        %36 = arith.addi %c20_i32, %35 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_12 : i32
        "simt_step.condition"(%38, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %34 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %35 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%34, %35) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_9 = arith.constant true
      "simt_step.yield"(%28#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%29: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %30 = arith.addi %c40_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %32 = arith.cmpi ne, %31, %c0_i32_10 : i32
      %33 = "simt_step.if"(%32) ({
        %c0_i32_11 = arith.constant 0 : i32
        %34 = arith.addi %0, %c0_i32_11 : i32
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_14 : i32
          %36 = arith.addi %35, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %37 = arith.addi %c44_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_15 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.continue"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%34#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c64_i32 = arith.constant 64 : i32
    %12 = arith.addi %c64_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_1 : i32
    %15 = "simt_step.if"(%14) ({
      %24 = simt_step.subgroup_id
      %25 = arith.index_cast %24 : index to i32
      "simt_step.yield"(%25) : (i32) -> ()
    }, {
      "simt_step.yield"(%0) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %16 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c68_i32 = arith.constant 68 : i32
    %18 = arith.addi %c68_i32, %0 : i32
    %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_3 = arith.constant 4 : i32
    %20 = arith.addi %0, %c4_i32_3 : i32
    %21 = "simt_step.switch"(%19, %20) ({
    ^bb0(%arg2: i32):
      %c72_i32 = arith.constant 72 : i32
      %24 = arith.addi %c72_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
      %27 = "simt_step.if"(%26) ({
        %c76_i32 = arith.constant 76 : i32
        %39 = arith.addi %c76_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = "simt_step.switch"(%40, %0) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%43: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %44 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%41) : (i32) -> ()
      }, {
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_13 : i32
          %41 = arith.addi %40, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %42 = arith.addi %c80_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_14 : i32
          "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %40 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%39#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb1(%28: i32):  // no predecessors
      %c100_i32 = arith.constant 100 : i32
      %29 = arith.addi %c100_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %31 = arith.addi %0, %c0_i32_7 : i32
      %32 = "simt_step.switch"(%30, %31) ({
      ^bb0(%arg3: i32):
        %c104_i32 = arith.constant 104 : i32
        %39 = arith.addi %c104_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %41 = arith.addi %0, %c3_i32 : i32
        %42 = "simt_step.switch"(%40, %41) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%48: i32):  // no predecessors
          %c3_i32_11 = arith.constant 3 : i32
          %49 = arith.addi %0, %c3_i32_11 : i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      ^bb1(%43: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %44 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb2(%33: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb3(%34: i32):  // no predecessors
      %c108_i32 = arith.constant 108 : i32
      %35 = arith.addi %c108_i32, %0 : i32
      %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %37 = arith.cmpi ne, %36, %c0_i32_9 : i32
      %38 = "simt_step.if"(%37) ({
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_13 : i32
          %41 = arith.addi %40, %0 : i32
          %c112_i32 = arith.constant 112 : i32
          %42 = arith.addi %c112_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_14 : i32
          "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %40 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%39#0) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_4 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %22 = arith.addi %c48_i32, %0 : i32
    %true_5 = arith.constant true
    %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

