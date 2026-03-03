module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32_3 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %5 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %6 = "simt_step.if"(%5) ({
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %9 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %10 = arith.addi %9, %c1_i32_8 : i32
          %11 = arith.cmpi slt, %arg7, %10 : i32
          "simt_step.condition"(%11, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %9 = simt_step.subgroup_id
          %10 = arith.index_cast %9 : index to i32
          %c1_i32_7 = arith.constant 1 : i32
          %11 = arith.addi %arg7, %c1_i32_7 : i32
          "simt_step.yield"(%10, %11) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c0_i32_6 = arith.constant 0 : i32
        "simt_step.yield"(%8#0) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        %8 = arith.remsi %arg3, %c3_i32 : i32
        %9 = simt_step.subgroup_id
        %10 = arith.index_cast %9 : index to i32
        %11 = "simt_step.switch"(%8, %10) ({
        ^bb0(%arg6: i32):
          %c3_i32_5 = arith.constant 3 : i32
          %13 = arith.addi %arg0, %c3_i32_5 : i32
          "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %15 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%15) {fallthrough = true} : (i32) -> ()
        ^bb2(%16: i32):  // no predecessors
          %c2_i32_6 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_6) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %c1_i32_4 = arith.constant 1 : i32
        %12 = arith.addi %arg0, %c1_i32_4 : i32
        "simt_step.yield"(%11) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%6, %7) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %c4_i32, %0#0 : i32
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
      %18 = arith.addi %c12_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %31 = arith.addi %0, %c0_i32_6 : i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c16_i32_7 = arith.constant 16 : i32
        %33 = arith.addi %c16_i32_7, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %35 = arith.addi %0, %c0_i32_8 : i32
        %36 = "simt_step.switch"(%34, %35) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          %c2_i32_11 = arith.constant 2 : i32
          %39 = arith.addi %0, %c2_i32_11 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %22 = arith.addi %c20_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %24 = "simt_step.switch"(%23, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c24_i32 = arith.constant 24 : i32
        %29 = arith.addi %c24_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_6 = arith.constant 2 : i32
        %31 = "simt_step.switch"(%30, %c2_i32_6) ({
        ^bb0(%arg4: i32):
          %c2_i32_11 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c2_i32_12 = arith.constant 2 : i32
          %43 = arith.addi %0, %c2_i32_12 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %33 = arith.addi %c28_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_8 : i32
        %36 = "simt_step.if"(%35) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c32_i32_9 = arith.constant 32 : i32
        %38 = arith.addi %c32_i32_9, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_10 : i32
        %41 = "simt_step.if"(%40) ({
          %c0_i32_11 = arith.constant 0 : i32
          %42 = arith.addi %0, %c0_i32_11 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          %c2_i32_11 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_11) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %26 = arith.addi %c36_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %28 = "simt_step.switch"(%27, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_10 : i32
          %35 = arith.addi %34, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %36 = arith.addi %c40_i32, %35 : i32
          %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %38 = arith.cmpi ne, %37, %c0_i32_11 : i32
          "simt_step.condition"(%38, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %34 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.break"(%34, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        "simt_step.yield"(%29#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %31 = arith.addi %c60_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %33 = "simt_step.switch"(%32, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
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
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %19 = arith.muli %arg3, %c4_i32_6 : i32
        %20 = arith.addi %19, %0 : i32
        %c68_i32 = arith.constant 68 : i32
        %21 = arith.addi %c68_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_7 : i32
        "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %19 = simt_step.subgroup_id
        %20 = arith.index_cast %19 : index to i32
        %21 = arith.addi %arg2, %20 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      "simt_step.yield"(%18#0) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %19 = arith.muli %arg3, %c4_i32_6 : i32
        %20 = arith.addi %19, %0 : i32
        %c88_i32 = arith.constant 88 : i32
        %21 = arith.addi %c88_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_7 : i32
        "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c108_i32 = arith.constant 108 : i32
        %19 = arith.addi %c108_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %21 = simt_step.lane_id
        %22 = arith.index_cast %21 : index to i32
        %23 = "simt_step.switch"(%20, %22) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %28 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %24 = arith.addi %arg2, %23 : i32
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      "simt_step.yield"(%18#0) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %16 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

