module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %3 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %4 = arith.addi %3, %c1_i32 : i32
      %5 = arith.cmpi slt, %arg5, %4 : i32
      "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c2_i32 = arith.constant 2 : i32
      %3 = arith.remsi %arg3, %c2_i32 : i32
      %4 = "simt_step.switch"(%3, %arg0) ({
      ^bb0(%arg6: i32):
        %c3_i32 = arith.constant 3 : i32
        %8 = arith.remsi %arg3, %c3_i32 : i32
        %c1_i32_2 = arith.constant 1 : i32
        %9 = "simt_step.switch"(%8, %c1_i32_2) ({
        ^bb0(%arg7: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb2(%17: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb3(%18: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c3_i32_3 = arith.constant 3 : i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %11 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %12 = "simt_step.if"(%11) ({
          %c1_i32_7 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_7) : (i32) -> ()
        }, {
          %c1_i32_7 = arith.constant 1 : i32
          %16 = arith.addi %arg0, %c1_i32_7 : i32
          "simt_step.yield"(%16) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%12) {fallthrough = true} : (i32) -> ()
      ^bb2(%13: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %15 = "simt_step.if"(%14) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c1_i32_7 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_7) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %5 = simt_step.subgroup_id
      %6 = arith.index_cast %5 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%4, %7) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %17 = arith.addi %c12_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_3 : i32
      %20 = "simt_step.if"(%19) ({
        %c16_i32_9 = arith.constant 16 : i32
        %28 = arith.addi %c16_i32_9, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_10 : i32
        %31 = "simt_step.if"(%30) ({
          %c4_i32_11 = arith.constant 4 : i32
          %32 = arith.addi %0, %c4_i32_11 : i32
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %c3_i32_11 = arith.constant 3 : i32
          %32 = arith.addi %0, %c3_i32_11 : i32
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %22 = arith.addi %c20_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %24 = "simt_step.switch"(%23, %c0_i32_4) ({
      ^bb0(%arg3: i32):
        %c24_i32 = arith.constant 24 : i32
        %28 = arith.addi %c24_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_9 : i32
        %31 = "simt_step.if"(%30) ({
          %c2_i32_12 = arith.constant 2 : i32
          %39 = arith.addi %0, %c2_i32_12 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          %c4_i32_12 = arith.constant 4 : i32
          %39 = arith.addi %0, %c4_i32_12 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %33 = arith.addi %c28_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_10 : i32
        %36 = "simt_step.if"(%35) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
      ^bb3(%38: i32):  // no predecessors
        %c2_i32_11 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_11) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
    ^bb3(%26: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %27:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_9 : i32
        %29 = arith.addi %28, %0 : i32
        %c32_i32_10 = arith.constant 32 : i32
        %30 = arith.addi %c32_i32_10, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_11 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c52_i32 = arith.constant 52 : i32
        %28 = arith.addi %c52_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_9 : i32
        %31 = "simt_step.if"(%30) ({
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) : (i32) -> ()
        }, {
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        %32 = arith.addi %arg3, %31 : i32
        %c1_i32 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c56_i32 = arith.constant 56 : i32
    %12 = arith.addi %c56_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = "simt_step.switch"(%13, %0) ({
    ^bb0(%arg2: i32):
      %c60_i32 = arith.constant 60 : i32
      %17 = arith.addi %c60_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_3 : i32
      %20 = "simt_step.if"(%19) ({
        %c64_i32 = arith.constant 64 : i32
        %31 = arith.addi %c64_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_10 : i32
        %34 = "simt_step.if"(%33) ({
          %c3_i32 = arith.constant 3 : i32
          %35 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %22 = arith.addi %c68_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_4 = arith.constant 4 : i32
      %24 = "simt_step.switch"(%23, %c4_i32_4) ({
      ^bb0(%arg3: i32):
        %c72_i32 = arith.constant 72 : i32
        %31 = arith.addi %c72_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_10 : i32
        %34 = "simt_step.if"(%33) ({
          %c0_i32_12 = arith.constant 0 : i32
          %36 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %36 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_11) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %26:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_10 : i32
        %32 = arith.addi %31, %0 : i32
        %c76_i32 = arith.constant 76 : i32
        %33 = arith.addi %c76_i32, %32 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_11 : i32
        "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c96_i32 = arith.constant 96 : i32
        %31 = arith.addi %c96_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_10 : i32
        %34 = "simt_step.if"(%33) ({
          %c1_i32_12 = arith.constant 1 : i32
          %37 = arith.addi %0, %c1_i32_12 : i32
          "simt_step.yield"(%37) : (i32) -> ()
        }, {
          %c1_i32_12 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        %35 = arith.addi %arg3, %34 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %36 = arith.addi %arg4, %c1_i32_11 : i32
        "simt_step.continue"(%35, %36) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%27: i32):  // no predecessors
      %c100_i32 = arith.constant 100 : i32
      %28 = arith.addi %c100_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %30 = "simt_step.switch"(%29, %c1_i32) ({
      ^bb0(%arg3: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_15 : i32
          %43 = arith.addi %42, %0 : i32
          %c104_i32 = arith.constant 104 : i32
          %44 = arith.addi %c104_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_16 : i32
          "simt_step.condition"(%46, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %42 = arith.addi %arg4, %arg5 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %43 = arith.addi %arg5, %c1_i32_15 : i32
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%31#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c124_i32 = arith.constant 124 : i32
        %33 = arith.addi %c124_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_13 : i32
        %36 = "simt_step.if"(%35) ({
          %c4_i32_15 = arith.constant 4 : i32
          %42 = arith.addi %0, %c4_i32_15 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          %c0_i32_15 = arith.constant 0 : i32
          %42 = arith.addi %0, %c0_i32_15 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c128_i32 = arith.constant 128 : i32
        %38 = arith.addi %c128_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_14 : i32
        %41 = "simt_step.if"(%40) ({
          %c0_i32_15 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_15) : (i32) -> ()
        }, {
          %c1_i32_15 = arith.constant 1 : i32
          %42 = arith.addi %0, %c1_i32_15 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %15 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

