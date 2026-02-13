module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.addi %arg0, %c4_i32 : i32
      %6 = "simt_step.switch"(%arg3, %5) ({
      ^bb0(%arg6: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %9 = "simt_step.if"(%8) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) {fallthrough = true} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%6, %7) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
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
      %c8_i32 = arith.constant 8 : i32
      %24 = arith.addi %c8_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
      "simt_step.if"(%26) ({
        "simt_step.yield"() : () -> ()
      }, {
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c3_i32 = arith.constant 3 : i32
    %8 = "simt_step.switch"(%7, %c3_i32) ({
    ^bb0(%arg2: i32):
      %c16_i32_6 = arith.constant 16 : i32
      %24 = arith.addi %c16_i32_6, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_7 : i32
      %27 = "simt_step.if"(%26) ({
        %c4_i32_12 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_12) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb1(%28: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %29 = arith.addi %c20_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %31 = "simt_step.switch"(%30, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c2_i32_12 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_12) {fallthrough = false} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %37 = arith.addi %c24_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_13 = arith.constant 4 : i32
        %39 = arith.addi %0, %c4_i32_13 : i32
        %40 = "simt_step.switch"(%38, %39) ({
        ^bb0(%arg4: i32):
          %c2_i32_14 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_14) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%43: i32):  // no predecessors
          %c2_i32_15 = arith.constant 2 : i32
          %44 = arith.addi %0, %c2_i32_15 : i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb2(%32: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %33:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_12 : i32
        %37 = arith.addi %36, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %38 = arith.addi %c28_i32, %37 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_13 : i32
        "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %36 = arith.addi %arg3, %0 : i32
        %c1_i32 = arith.constant 1 : i32
        %37 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        "simt_step.continue"(%36, %37) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%34: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %35:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_12 : i32
        %37 = arith.addi %36, %0 : i32
        %c48_i32 = arith.constant 48 : i32
        %38 = arith.addi %c48_i32, %37 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_13 : i32
        "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %39 = arith.muli %arg6, %c4_i32_15 : i32
          %40 = arith.addi %39, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %41 = arith.addi %c68_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_16 : i32
          "simt_step.condition"(%43, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %39 = arith.addi %arg5, %arg6 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %40 = arith.addi %arg6, %c1_i32_15 : i32
          %true_16 = arith.constant true
          "simt_step.break"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %37 = arith.addi %arg3, %36#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %38 = arith.addi %arg4, %c1_i32 : i32
        %true_14 = arith.constant true
        "simt_step.yield"(%37, %38) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c88_i32 = arith.constant 88 : i32
    %11 = arith.addi %c88_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_2 : i32
    %14 = "simt_step.if"(%13) ({
      %c92_i32 = arith.constant 92 : i32
      %24 = arith.addi %c92_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
      %27 = "simt_step.if"(%26) ({
        %c96_i32_8 = arith.constant 96 : i32
        %30 = arith.addi %c96_i32_8, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_9 = arith.constant 4 : i32
        %32 = "simt_step.switch"(%31, %c4_i32_9) ({
        ^bb0(%arg2: i32):
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %c1_i32_10 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %37 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }, {
        %c100_i32 = arith.constant 100 : i32
        %30 = arith.addi %c100_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = "simt_step.switch"(%31, %0) ({
        ^bb0(%arg2: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %33 = arith.addi %0, %c4_i32_8 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %28 = arith.addi %c32_i32, %0 : i32
      %true_7 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) : (i32) -> ()
    }, {
      %c104_i32 = arith.constant 104 : i32
      %24 = arith.addi %c104_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
      %27 = "simt_step.if"(%26) ({
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %31 = arith.muli %arg3, %c4_i32_10 : i32
          %32 = arith.addi %31, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %33 = arith.addi %c108_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_11 : i32
          "simt_step.condition"(%35, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %31 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg3, %c1_i32 : i32
          %true_10 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %33 = arith.muli %arg3, %c4_i32_11 : i32
          %34 = arith.addi %c48_i32, %33 : i32
          %35 = arith.addi %34, %0 : i32
          %true_12 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) : (i32) -> ()
      }, {
        %c128_i32 = arith.constant 128 : i32
        %30 = arith.addi %c128_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %32 = "simt_step.switch"(%31, %c1_i32) ({
        ^bb0(%arg2: i32):
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %28 = arith.addi %c64_i32, %0 : i32
      %true_7 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) : (i32) -> ()
    }) : (i1) -> i32
    %c80_i32 = arith.constant 80 : i32
    %15 = arith.addi %c80_i32, %0 : i32
    %true_3 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c132_i32 = arith.constant 132 : i32
    %17 = arith.addi %c132_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %19 = simt_step.lane_id
    %20 = arith.index_cast %19 : index to i32
    %21 = "simt_step.switch"(%18, %20) ({
    ^bb0(%arg2: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %39 = arith.muli %arg4, %c4_i32_11 : i32
        %40 = arith.addi %39, %0 : i32
        %c136_i32 = arith.constant 136 : i32
        %41 = arith.addi %c136_i32, %40 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_12 : i32
        "simt_step.condition"(%43, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %39 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %40 = arith.addi %arg4, %c1_i32 : i32
        %true_11 = arith.constant true
        "simt_step.continue"(%39, %40) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c156_i32 = arith.constant 156 : i32
      %26 = arith.addi %c156_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_8 : i32
      %29 = "simt_step.if"(%28) ({
        %c160_i32 = arith.constant 160 : i32
        %39 = arith.addi %c160_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %41 = "simt_step.switch"(%40, %c2_i32) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c3_i32_11 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb2(%43: i32):  // no predecessors
          %c2_i32_12 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb3(%44: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%41) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb2(%30: i32):  // no predecessors
      %c164_i32 = arith.constant 164 : i32
      %31 = arith.addi %c164_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32_9 = arith.constant 3 : i32
      %33 = "simt_step.switch"(%32, %c3_i32_9) ({
      ^bb0(%arg3: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_17 : i32
          %52 = arith.addi %51, %0 : i32
          %c168_i32 = arith.constant 168 : i32
          %53 = arith.addi %c168_i32, %52 : i32
          %54 = "simt_step.buffer.load"(%arg1, %53) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %55 = arith.cmpi ne, %54, %c0_i32_18 : i32
          "simt_step.condition"(%55, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %51 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %52 = arith.addi %arg5, %c1_i32 : i32
          %true_17 = arith.constant true
          "simt_step.yield"(%51, %52) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c188_i32 = arith.constant 188 : i32
        %41 = arith.addi %c188_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_13 : i32
        %44 = "simt_step.if"(%43) ({
          %c3_i32_17 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_17) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb2(%45: i32):  // no predecessors
        %c192_i32 = arith.constant 192 : i32
        %46 = arith.addi %c192_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %48 = "simt_step.switch"(%47, %0) ({
        ^bb0(%arg4: i32):
          %c0_i32_17 = arith.constant 0 : i32
          %51 = arith.addi %0, %c0_i32_17 : i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        ^bb1(%52: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %53 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      ^bb3(%49: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %50:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_17 : i32
          %52 = arith.addi %51, %0 : i32
          %c196_i32 = arith.constant 196 : i32
          %53 = arith.addi %c196_i32, %52 : i32
          %54 = "simt_step.buffer.load"(%arg1, %53) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %55 = arith.cmpi ne, %54, %c0_i32_18 : i32
          "simt_step.condition"(%55, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %51 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %52 = arith.addi %arg5, %c1_i32 : i32
          %true_17 = arith.constant true
          "simt_step.yield"(%51, %52) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%50#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    ^bb3(%34: i32):  // no predecessors
      %c216_i32 = arith.constant 216 : i32
      %35 = arith.addi %c216_i32, %0 : i32
      %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %37 = arith.cmpi ne, %36, %c0_i32_10 : i32
      %38 = "simt_step.if"(%37) ({
        %c220_i32 = arith.constant 220 : i32
        %39 = arith.addi %c220_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = "simt_step.switch"(%40, %0) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%43: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%41) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true_4 = arith.constant true
    %c96_i32 = arith.constant 96 : i32
    %22 = arith.addi %c96_i32, %0 : i32
    %true_5 = arith.constant true
    %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

