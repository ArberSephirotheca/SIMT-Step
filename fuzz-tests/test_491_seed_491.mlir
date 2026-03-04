module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32 : i32
        %5 = arith.cmpi slt, %arg5, %4 : i32
        "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %4 = "simt_step.if"(%3) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_3 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c0_i32_3, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c16_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %5 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.break"(%4, %5) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
    }, {
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %3 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) : (i32) -> ()
    }) : (i1) -> i32
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
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_4 : i32
        %28 = arith.addi %27, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %29 = arith.addi %c12_i32, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_5 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %27 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %28 = arith.addi %arg4, %c1_i32 : i32
        %true_4 = arith.constant true
        "simt_step.yield"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %24 = arith.addi %c32_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %26 = "simt_step.switch"(%25, %c0_i32_3) ({
      ^bb0(%arg3: i32):
        %c36_i32 = arith.constant 36 : i32
        %27 = arith.addi %c36_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %29 = arith.addi %0, %c3_i32 : i32
        %30 = "simt_step.switch"(%28, %29) ({
        ^bb0(%arg4: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %36 = arith.addi %0, %c4_i32_5 : i32
          "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %c0_i32_6 = arith.constant 0 : i32
          %38 = arith.addi %0, %c0_i32_6 : i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %32 = arith.addi %c40_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_4 : i32
        %35 = "simt_step.if"(%34) ({
          %c4_i32_5 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_5) : (i32) -> ()
        }, {
          %c3_i32_5 = arith.constant 3 : i32
          %36 = arith.addi %0, %c3_i32_5 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %10 = arith.addi %c48_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c44_i32 = arith.constant 44 : i32
    %12 = arith.addi %c44_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.subgroup_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_4 : i32
        %29 = arith.addi %28, %0 : i32
        %c48_i32_5 = arith.constant 48 : i32
        %30 = arith.addi %c48_i32_5, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_6 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %28 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32 : i32
        %true_4 = arith.constant true
        "simt_step.yield"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %24 = arith.addi %c68_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %26 = arith.addi %0, %c3_i32 : i32
      %27 = "simt_step.switch"(%25, %26) ({
      ^bb0(%arg3: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %37 = arith.muli %arg5, %c4_i32_6 : i32
          %38 = arith.addi %37, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %39 = arith.addi %c72_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_7 : i32
          "simt_step.condition"(%41, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %37 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg5, %c1_i32 : i32
          %true_6 = arith.constant true
          "simt_step.yield"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%28#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %30 = arith.addi %c92_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = "simt_step.switch"(%31, %0) ({
        ^bb0(%arg4: i32):
          %c3_i32_6 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_6) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %c3_i32_7 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_7) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c96_i32 = arith.constant 96 : i32
        %34 = arith.addi %c96_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %36 = "simt_step.switch"(%35, %c2_i32) ({
        ^bb0(%arg4: i32):
          %c3_i32_6 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_6) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %c100_i32 = arith.constant 100 : i32
    %17 = arith.addi %c100_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %19 = simt_step.lane_id
    %20 = arith.index_cast %19 : index to i32
    %21 = "simt_step.switch"(%18, %20) ({
    ^bb0(%arg2: i32):
      %c104_i32 = arith.constant 104 : i32
      %22 = arith.addi %c104_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %24 = arith.addi %0, %c1_i32 : i32
      %25 = "simt_step.switch"(%23, %24) ({
      ^bb0(%arg3: i32):
        %c108_i32 = arith.constant 108 : i32
        %36 = arith.addi %c108_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_3 = arith.constant 4 : i32
        %38 = "simt_step.switch"(%37, %c4_i32_3) ({
        ^bb0(%arg4: i32):
          %c0_i32_5 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_5) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %c4_i32_6 = arith.constant 4 : i32
          %43 = arith.addi %0, %c4_i32_6 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c1_i32_4 = arith.constant 1 : i32
        %40 = arith.addi %0, %c1_i32_4 : i32
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      %c112_i32 = arith.constant 112 : i32
      %27 = arith.addi %c112_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %29 = arith.cmpi ne, %28, %c0_i32_1 : i32
      %30 = "simt_step.if"(%29) ({
        %c116_i32 = arith.constant 116 : i32
        %36 = arith.addi %c116_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_3 : i32
        %39 = "simt_step.if"(%38) ({
          %c4_i32_4 = arith.constant 4 : i32
          %40 = arith.addi %0, %c4_i32_4 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }, {
          %c4_i32_4 = arith.constant 4 : i32
          %40 = arith.addi %0, %c4_i32_4 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%39) : (i32) -> ()
      }, {
        %c120_i32 = arith.constant 120 : i32
        %36 = arith.addi %c120_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %38 = arith.addi %0, %c3_i32 : i32
        %39 = "simt_step.switch"(%37, %38) ({
        ^bb0(%arg3: i32):
          %c4_i32_3 = arith.constant 4 : i32
          %40 = arith.addi %0, %c4_i32_3 : i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %42 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%39) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    ^bb2(%31: i32):  // no predecessors
      %c124_i32 = arith.constant 124 : i32
      %32 = arith.addi %c124_i32, %0 : i32
      %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %34 = arith.cmpi ne, %33, %c0_i32_2 : i32
      %35 = "simt_step.if"(%34) ({
        %c128_i32 = arith.constant 128 : i32
        %36 = arith.addi %c128_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %38 = "simt_step.switch"(%37, %c0_i32_3) ({
        ^bb0(%arg3: i32):
          %c0_i32_4 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_4) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %c2_i32_5 = arith.constant 2 : i32
          %41 = arith.addi %0, %c2_i32_5 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        %c132_i32 = arith.constant 132 : i32
        %36 = arith.addi %c132_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_3 : i32
        %39 = "simt_step.if"(%38) ({
          %c4_i32_4 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_4) : (i32) -> ()
        }, {
          %c4_i32_4 = arith.constant 4 : i32
          %40 = arith.addi %0, %c4_i32_4 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%39) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

