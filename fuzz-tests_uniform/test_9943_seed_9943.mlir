module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.subgroup_id
    %1 = arith.index_cast %0 : index to i32
    %c0_i32 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %3 = "simt_step.if"(%2) ({
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %10, %c1_i32 : i32
        %12 = arith.cmpi slt, %arg5, %11 : i32
        "simt_step.condition"(%12, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %10 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %11 = "simt_step.if"(%10) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %13 = simt_step.lane_id
          %14 = arith.index_cast %13 : index to i32
          "simt_step.yield"(%14) : (i32) -> ()
        }) : (i1) -> i32
        %c3_i32_5 = arith.constant 3 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.break"(%11, %12) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c3_i32 = arith.constant 3 : i32
      %9 = arith.addi %arg0, %c3_i32 : i32
      "simt_step.yield"(%8#0) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %8 = arith.remsi %arg3, %c2_i32 : i32
      %9 = simt_step.subgroup_id
      %10 = arith.index_cast %9 : index to i32
      %11 = "simt_step.switch"(%8, %10) ({
      ^bb0(%arg4: i32):
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
      ^bb1(%14: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %15 = arith.remsi %arg3, %c3_i32 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %16 = arith.addi %arg0, %c0_i32_2 : i32
        %17 = "simt_step.switch"(%15, %16) ({
        ^bb0(%arg5: i32):
          %c1_i32_4 = arith.constant 1 : i32
          %18 = arith.addi %arg0, %c1_i32_4 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %c3_i32_5 = arith.constant 3 : i32
          %20 = arith.addi %arg0, %c3_i32_5 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %c3_i32_6 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_6) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %c3_i32_3 = arith.constant 3 : i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %12 = simt_step.subgroup_id
      %13 = arith.index_cast %12 : index to i32
      "simt_step.yield"(%11) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32_0, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %7 = arith.select %6, %1, %3 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_11 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_11 : i32
      %20 = arith.addi %19, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %21 = arith.addi %c8_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_12 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_11 = arith.constant 0 : i32
      %19 = arith.addi %0, %c0_i32_11 : i32
      %20 = arith.addi %arg2, %19 : i32
      %c1_i32 = arith.constant 1 : i32
      %21 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.continue"(%20, %21) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %10:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_11 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_11 : i32
      %20 = arith.addi %19, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %21 = arith.addi %c28_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_12 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
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
    %c4_i32_7 = arith.constant 4 : i32
    %15 = arith.addi %0, %c4_i32_7 : i32
    %16 = "simt_step.switch"(%14, %15) ({
    ^bb0(%arg2: i32):
      %c52_i32 = arith.constant 52 : i32
      %19 = arith.addi %c52_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %21 = "simt_step.switch"(%20, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c56_i32 = arith.constant 56 : i32
        %37 = arith.addi %c56_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_15 : i32
        %40 = "simt_step.if"(%39) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c2_i32_20 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_20) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%40) {fallthrough = true} : (i32) -> ()
      ^bb1(%41: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %42 = arith.addi %c60_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_16 : i32
        %45 = "simt_step.if"(%44) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_20 = arith.constant 4 : i32
          %56 = arith.addi %0, %c4_i32_20 : i32
          "simt_step.yield"(%56) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%45) {fallthrough = true} : (i32) -> ()
      ^bb2(%46: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %47 = arith.addi %c64_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_17 : i32
        %50 = "simt_step.if"(%49) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_20 = arith.constant 0 : i32
          %56 = arith.addi %0, %c0_i32_20 : i32
          "simt_step.yield"(%56) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%50) {fallthrough = true} : (i32) -> ()
      ^bb3(%51: i32):  // no predecessors
        %c68_i32 = arith.constant 68 : i32
        %52 = arith.addi %c68_i32, %0 : i32
        %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_18 = arith.constant 1 : i32
        %54 = arith.addi %0, %c1_i32_18 : i32
        %55 = "simt_step.switch"(%53, %54) ({
        ^bb0(%arg4: i32):
          %c2_i32_20 = arith.constant 2 : i32
          %56 = arith.addi %0, %c2_i32_20 : i32
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb1(%57: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%58: i32):  // no predecessors
          %c1_i32_21 = arith.constant 1 : i32
          %59 = arith.addi %0, %c1_i32_21 : i32
          "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
        ^bb3(%60: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %61 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_11 = arith.constant true
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %23 = arith.addi %c72_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_12 : i32
      %26 = "simt_step.if"(%25) ({
        %c76_i32 = arith.constant 76 : i32
        %37 = arith.addi %c76_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = "simt_step.switch"(%38, %0) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        "simt_step.yield"(%39) : (i32) -> ()
      }, {
        %c80_i32 = arith.constant 80 : i32
        %37 = arith.addi %c80_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = "simt_step.switch"(%38, %0) ({
        ^bb0(%arg3: i32):
          %c1_i32_16 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_16) {fallthrough = true} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %41 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %c3_i32_17 = arith.constant 3 : i32
          %43 = arith.addi %0, %c3_i32_17 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb3(%44: i32):  // no predecessors
          %c3_i32_18 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        "simt_step.yield"(%39) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %28 = arith.addi %c84_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %30 = arith.addi %0, %c1_i32 : i32
      %31 = "simt_step.switch"(%29, %30) ({
      ^bb0(%arg3: i32):
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_19 : i32
          %40 = arith.addi %39, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %41 = arith.addi %c88_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_20 : i32
          "simt_step.condition"(%43, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %39 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %40 = arith.addi %arg5, %c1_i32_19 : i32
          "simt_step.yield"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        "simt_step.yield"(%37#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c2_i32_18 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_18) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_13 = arith.constant true
      "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
    ^bb3(%32: i32):  // no predecessors
      %c108_i32 = arith.constant 108 : i32
      %33 = arith.addi %c108_i32, %0 : i32
      %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_14 = arith.constant 0 : i32
      %35 = arith.cmpi ne, %34, %c0_i32_14 : i32
      %36 = "simt_step.if"(%35) ({
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_18 : i32
          %39 = arith.addi %38, %0 : i32
          %c112_i32 = arith.constant 112 : i32
          %40 = arith.addi %c112_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_19 : i32
          "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %38 = arith.addi %arg3, %arg4 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %39 = arith.addi %arg4, %c1_i32_18 : i32
          "simt_step.break"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        "simt_step.yield"(%37#0) : (i32) -> ()
      }, {
        %c1_i32_15 = arith.constant 1 : i32
        %37 = arith.addi %0, %c1_i32_15 : i32
        "simt_step.yield"(%37) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_8 = arith.constant true
    %c48_i32_9 = arith.constant 48 : i32
    %17 = arith.addi %c48_i32_9, %0 : i32
    %true_10 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

