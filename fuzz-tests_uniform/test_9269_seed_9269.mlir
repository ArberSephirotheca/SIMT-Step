module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %9, %c1_i32 : i32
      %11 = arith.cmpi slt, %arg5, %10 : i32
      "simt_step.condition"(%11, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %9 = simt_step.subgroup_id
      %10 = arith.index_cast %9 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%10, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = "simt_step.if"(%3) ({
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.remsi %arg3, %c4_i32 : i32
      %10 = simt_step.lane_id
      %11 = arith.index_cast %10 : index to i32
      %12 = "simt_step.switch"(%9, %11) ({
      ^bb0(%arg4: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %14 = "simt_step.if"(%13) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %23 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_6 = arith.constant 4 : i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %17 = "simt_step.if"(%16) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_8 = arith.constant 4 : i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb2(%18: i32):  // no predecessors
        %c4_i32_9 = arith.constant 4 : i32
        %19 = arith.addi %arg0, %c4_i32_9 : i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb3(%20: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32 : i32
          %25 = arith.cmpi slt, %arg6, %24 : i32
          "simt_step.condition"(%25, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.break"(%arg0, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c0_i32_12 = arith.constant 0 : i32
        %22 = arith.addi %arg0, %c0_i32_12 : i32
        "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) : (i32) -> ()
    }, {
      %9 = simt_step.lane_id
      %10 = arith.index_cast %9 : index to i32
      "simt_step.yield"(%10) : (i32) -> ()
    }) : (i1) -> i32
    %true_3 = arith.constant true
    %5 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
    %8 = arith.select %7, %0#0, %4 : i32
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
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %17 = arith.addi %c12_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %19 = arith.addi %0, %c3_i32 : i32
      %20 = "simt_step.switch"(%18, %19) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %31 = arith.addi %c16_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_7 : i32
        %34 = "simt_step.if"(%33) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %36 = arith.addi %c20_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_8 : i32
        %39 = "simt_step.if"(%38) ({
          %c4_i32_10 = arith.constant 4 : i32
          %45 = arith.addi %0, %c4_i32_10 : i32
          "simt_step.yield"(%45) : (i32) -> ()
        }, {
          %c3_i32_10 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %41 = arith.addi %c24_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_9 : i32
        %44 = "simt_step.if"(%43) ({
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%45) : (i32) -> ()
        }, {
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %23 = arith.addi %c28_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_4 : i32
      %26 = "simt_step.if"(%25) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_7) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb3(%27: i32):  // no predecessors
      %c32_i32_5 = arith.constant 32 : i32
      %28 = arith.addi %c32_i32_5, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %30 = "simt_step.switch"(%29, %0) ({
      ^bb0(%arg3: i32):
        %c36_i32 = arith.constant 36 : i32
        %31 = arith.addi %c36_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %33 = "simt_step.switch"(%32, %c0_i32_7) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %36 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          %38 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_12 : i32
          %37 = arith.addi %36, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %38 = arith.addi %c40_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_13 : i32
          "simt_step.condition"(%40, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %36 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.continue"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %8 = arith.addi %c32_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c60_i32 = arith.constant 60 : i32
    %10 = arith.addi %c60_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %12 = simt_step.subgroup_id
    %13 = arith.index_cast %12 : index to i32
    %14 = "simt_step.switch"(%11, %13) ({
    ^bb0(%arg2: i32):
      %c64_i32 = arith.constant 64 : i32
      %17 = arith.addi %c64_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %19 = arith.addi %0, %c3_i32 : i32
      %20 = "simt_step.switch"(%18, %19) ({
      ^bb0(%arg3: i32):
        %c68_i32 = arith.constant 68 : i32
        %23 = arith.addi %c68_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %25 = arith.addi %0, %c0_i32_7 : i32
        %26 = "simt_step.switch"(%24, %25) ({
        ^bb0(%arg4: i32):
          %c0_i32_13 = arith.constant 0 : i32
          %42 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %c0_i32_14 = arith.constant 0 : i32
          %44 = arith.addi %0, %c0_i32_14 : i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %28 = arith.addi %c72_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_9 : i32
        %31 = "simt_step.if"(%30) ({
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) : (i32) -> ()
        }, {
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %33 = arith.addi %c76_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_10 = arith.constant 4 : i32
        %35 = arith.addi %0, %c4_i32_10 : i32
        %36 = "simt_step.switch"(%34, %35) ({
        ^bb0(%arg4: i32):
          %c3_i32_13 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
      ^bb3(%37: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %38 = arith.addi %c80_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_12 : i32
        %41 = "simt_step.if"(%40) ({
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_7 : i32
        %24 = arith.addi %23, %0 : i32
        %c84_i32 = arith.constant 84 : i32
        %25 = arith.addi %c84_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_8 : i32
        "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %23 = arith.addi %arg3, %0 : i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %15 = arith.addi %c48_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

