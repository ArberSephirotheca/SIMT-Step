module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %3 = arith.addi %c0_i32_0, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %4 = simt_step.subgroup_id
        %5 = arith.index_cast %4 : index to i32
        %6 = "simt_step.switch"(%arg3, %5) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%9: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %8 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%6) : (i32) -> ()
      }, {
        %c0_i32_1 = arith.constant 0 : i32
        %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %5 = "simt_step.if"(%4) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %7 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %7 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%5) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c8_i32 = arith.constant 8 : i32
      %13 = arith.addi %c8_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_2 : i32
      "simt_step.if"(%15) ({
        %c3_i32_3 = arith.constant 3 : i32
        %16 = arith.remsi %0, %c3_i32_3 : i32
        %17 = "simt_step.switch"(%16, %0) ({
        ^bb0(%arg2: i32):
          %c3_i32_4 = arith.constant 3 : i32
          %18 = arith.addi %arg2, %c3_i32_4 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %c4_i32_5 = arith.constant 4 : i32
          %20 = arith.addi %19, %c4_i32_5 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %c2_i32_6 = arith.constant 2 : i32
          %22 = arith.addi %21, %c2_i32_6 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c2_i32 = arith.constant 2 : i32
    %6 = arith.addi %0, %c2_i32 : i32
    %c12_i32 = arith.constant 12 : i32
    %7 = arith.addi %c12_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c3_i32 = arith.constant 3 : i32
    %9 = arith.addi %0, %c3_i32 : i32
    %10 = "simt_step.switch"(%8, %9) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %13 = arith.addi %c16_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %0, %c1_i32 : i32
      %16 = "simt_step.switch"(%14, %15) ({
      ^bb0(%arg3: i32):
        %c20_i32 = arith.constant 20 : i32
        %28 = arith.addi %c20_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_5 : i32
        %31 = "simt_step.if"(%30) ({
          %c0_i32_7 = arith.constant 0 : i32
          %33 = arith.addi %0, %c0_i32_7 : i32
          "simt_step.yield"(%33) : (i32) -> ()
        }, {
          %c3_i32_7 = arith.constant 3 : i32
          %33 = arith.addi %0, %c3_i32_7 : i32
          "simt_step.yield"(%33) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_6) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_5 : i32
        %29 = arith.addi %28, %0 : i32
        %c24_i32 = arith.constant 24 : i32
        %30 = arith.addi %c24_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_6 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c44_i32 = arith.constant 44 : i32
        %28 = arith.addi %c44_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_5 = arith.constant 3 : i32
        %30 = arith.addi %0, %c3_i32_5 : i32
        %31 = "simt_step.switch"(%29, %30) ({
        ^bb0(%arg5: i32):
          %c2_i32_8 = arith.constant 2 : i32
          %34 = arith.addi %0, %c2_i32_8 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %32 = arith.addi %arg3, %31 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32_6 : i32
        %true_7 = arith.constant true
        "simt_step.yield"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%19: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %20 = arith.addi %c48_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = "simt_step.switch"(%21, %0) ({
      ^bb0(%arg3: i32):
        %c52_i32 = arith.constant 52 : i32
        %28 = arith.addi %c52_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_5 : i32
        %31 = "simt_step.if"(%30) ({
          %c4_i32_10 = arith.constant 4 : i32
          %44 = arith.addi %0, %c4_i32_10 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %33 = arith.addi %c56_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_6 : i32
        %36 = "simt_step.if"(%35) ({
          %c3_i32_10 = arith.constant 3 : i32
          %44 = arith.addi %0, %c3_i32_10 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }, {
          %c3_i32_10 = arith.constant 3 : i32
          %44 = arith.addi %0, %c3_i32_10 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %38 = arith.addi %c60_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_7 : i32
        %41 = "simt_step.if"(%40) ({
          %c3_i32_10 = arith.constant 3 : i32
          %44 = arith.addi %0, %c3_i32_10 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb3(%42: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_10 : i32
          %45 = arith.addi %44, %0 : i32
          %c64_i32_11 = arith.constant 64 : i32
          %46 = arith.addi %c64_i32_11, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_12 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_10 : i32
          %true_11 = arith.constant true
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb3(%23: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %24 = arith.addi %c84_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_4 : i32
      %27 = "simt_step.if"(%26) ({
        %c88_i32 = arith.constant 88 : i32
        %28 = arith.addi %c88_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_5 : i32
        %31 = "simt_step.if"(%30) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_6 = arith.constant 4 : i32
          %32 = arith.addi %0, %c4_i32_6 : i32
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) : (i32) -> ()
      }, {
        %c3_i32_5 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_5) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %11 = arith.addi %c64_i32, %0 : i32
    %true_1 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

