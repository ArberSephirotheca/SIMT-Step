module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.addi %arg0, %c2_i32 : i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %12 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %12, %c1_i32 : i32
      %14 = arith.cmpi slt, %arg5, %13 : i32
      "simt_step.condition"(%14, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32_5 = arith.constant 3 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%c3_i32_5, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %5 = arith.select %4, %0, %1#0 : i32
    %c3_i32 = arith.constant 3 : i32
    %6 = arith.remsi %arg3, %c3_i32 : i32
    %7 = "simt_step.switch"(%6, %arg0) ({
    ^bb0(%arg4: i32):
      %c2_i32_5 = arith.constant 2 : i32
      %12 = arith.remsi %arg3, %c2_i32_5 : i32
      %13 = "simt_step.switch"(%12, %arg0) ({
      ^bb0(%arg5: i32):
        %c3_i32_12 = arith.constant 3 : i32
        %21 = arith.remsi %arg3, %c3_i32_12 : i32
        %c2_i32_13 = arith.constant 2 : i32
        %22 = "simt_step.switch"(%21, %c2_i32_13) ({
        ^bb0(%arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %25 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %c3_i32_14 = arith.constant 3 : i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %24 = arith.addi %arg0, %c0_i32_15 : i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c3_i32_6 = arith.constant 3 : i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %21 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %21, %c1_i32 : i32
        %23 = arith.cmpi slt, %arg6, %22 : i32
        "simt_step.condition"(%23, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %24 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %25 = arith.addi %24, %c1_i32_15 : i32
          %26 = arith.cmpi slt, %arg8, %25 : i32
          "simt_step.condition"(%26, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c2_i32_15 = arith.constant 2 : i32
          %24 = arith.addi %arg0, %c2_i32_15 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %25 = arith.addi %arg8, %c1_i32_16 : i32
          "simt_step.yield"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_14 = arith.constant 3 : i32
        %22 = arith.addi %arg0, %c3_i32_14 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.break"(%21#0, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c2_i32_9 = arith.constant 2 : i32
      %16 = arith.addi %arg0, %c2_i32_9 : i32
      "simt_step.yield"(%15#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%17: i32):  // no predecessors
      %c2_i32_10 = arith.constant 2 : i32
      %18 = arith.remsi %arg3, %c2_i32_10 : i32
      %19 = "simt_step.switch"(%18, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
        %22 = "simt_step.if"(%21) ({
          %c2_i32_16 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_16) : (i32) -> ()
        }, {
          %c0_i32_16 = arith.constant 0 : i32
          %30 = arith.addi %arg0, %c0_i32_16 : i32
          "simt_step.yield"(%30) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32_13 = arith.constant 2 : i32
        %23 = arith.addi %arg0, %c2_i32_13 : i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c2_i32_14 = arith.constant 2 : i32
        %25 = arith.remsi %arg3, %c2_i32_14 : i32
        %c3_i32_15 = arith.constant 3 : i32
        %26 = arith.addi %arg0, %c3_i32_15 : i32
        %27 = "simt_step.switch"(%25, %26) ({
        ^bb0(%arg6: i32):
          %c3_i32_16 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_16) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          %c2_i32_17 = arith.constant 2 : i32
          %31 = arith.addi %arg0, %c2_i32_17 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c4_i32 = arith.constant 4 : i32
        %28 = arith.addi %arg0, %c4_i32 : i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb2(%29: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %c2_i32_11 = arith.constant 2 : i32
      %20 = arith.addi %arg0, %c2_i32_11 : i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
    %11 = arith.select %10, %5, %7 : i32
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
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %9 = arith.addi %c8_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %11 = simt_step.lane_id
    %12 = arith.index_cast %11 : index to i32
    %13 = "simt_step.switch"(%10, %12) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %18 = "simt_step.switch"(%17, %c0_i32_1) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %26 = arith.addi %c16_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_4 : i32
        %29 = "simt_step.if"(%28) ({
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }, {
          %c4_i32_9 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_9) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %31 = arith.addi %c20_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_5 = arith.constant 4 : i32
        %33 = arith.addi %0, %c4_i32_5 : i32
        %34 = "simt_step.switch"(%32, %33) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          %c4_i32_9 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_9) {fallthrough = false} : (i32) -> ()
        ^bb3(%42: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %36 = arith.addi %c24_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_7 = arith.constant 4 : i32
        %38 = arith.addi %0, %c4_i32_7 : i32
        %39 = "simt_step.switch"(%37, %38) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          %c1_i32_9 = arith.constant 1 : i32
          %42 = arith.addi %0, %c1_i32_9 : i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %20 = arith.addi %c28_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %22 = arith.addi %0, %c2_i32 : i32
      %23 = "simt_step.switch"(%21, %22) ({
      ^bb0(%arg3: i32):
        %c0_i32_4 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_4) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c2_i32_5 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_5) {fallthrough = false} : (i32) -> ()
      ^bb2(%27: i32):  // no predecessors
        %c32_i32_6 = arith.constant 32 : i32
        %28 = arith.addi %c32_i32_6, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %30 = "simt_step.switch"(%29, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb3(%25: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %14 = arith.addi %c32_i32, %0 : i32
    %true_0 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

