module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.addi %arg0, %c3_i32 : i32
    %c3_i32_0 = arith.constant 3 : i32
    %1 = arith.remsi %arg3, %c3_i32_0 : i32
    %2 = simt_step.subgroup_id
    %3 = arith.index_cast %2 : index to i32
    %4 = "simt_step.switch"(%1, %3) ({
    ^bb0(%arg4: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %18 = arith.remsi %arg3, %c4_i32_8 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %19 = arith.addi %18, %c1_i32_9 : i32
        %20 = arith.cmpi slt, %arg6, %19 : i32
        "simt_step.condition"(%20, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %21 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %22 = arith.addi %21, %c1_i32_12 : i32
          %23 = arith.cmpi slt, %arg8, %22 : i32
          "simt_step.condition"(%23, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c3_i32_11 = arith.constant 3 : i32
          %21 = arith.addi %arg0, %c3_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %22 = arith.addi %arg8, %c1_i32_12 : i32
          "simt_step.yield"(%21, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32 = arith.constant 2 : i32
        %19 = arith.addi %arg0, %c2_i32 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %20 = arith.addi %arg6, %c1_i32_10 : i32
        "simt_step.yield"(%18#0, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c4_i32 = arith.constant 4 : i32
      "simt_step.yield"(%9#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %18 = arith.remsi %arg3, %c4_i32_8 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %19 = arith.addi %18, %c1_i32_9 : i32
        %20 = arith.cmpi slt, %arg6, %19 : i32
        "simt_step.condition"(%20, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c2_i32 = arith.constant 2 : i32
        %18 = arith.remsi %arg3, %c2_i32 : i32
        %19 = "simt_step.switch"(%18, %arg0) ({
        ^bb0(%arg7: i32):
          %c2_i32_10 = arith.constant 2 : i32
          %22 = arith.addi %arg0, %c2_i32_10 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %c3_i32_11 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %c3_i32_8 = arith.constant 3 : i32
        %20 = arith.addi %arg0, %c3_i32_8 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %21 = arith.addi %arg6, %c1_i32_9 : i32
        "simt_step.break"(%19, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      %c3_i32_6 = arith.constant 3 : i32
      %13 = arith.addi %arg0, %c3_i32_6 : i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb3(%14: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
      %16 = "simt_step.if"(%15) ({
        %c0_i32_8 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %19 = "simt_step.if"(%18) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%19) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32_11 : i32
          %21 = arith.cmpi slt, %arg6, %20 : i32
          "simt_step.condition"(%21, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_10 = arith.constant 1 : i32
          %19 = arith.addi %arg0, %c1_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %20 = arith.addi %arg6, %c1_i32_11 : i32
          "simt_step.break"(%19, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%18#0) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %6 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %8 = arith.select %7, %0, %4 : i32
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
    %c8_i32 = arith.constant 8 : i32
    %7 = arith.addi %c8_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %9 = "simt_step.switch"(%8, %0) ({
    ^bb0(%arg2: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %17 = arith.addi %0, %c4_i32_4 : i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_9 : i32
        %23 = arith.addi %22, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %24 = arith.addi %c12_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_10 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %22 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %21 = arith.addi %0, %c0_i32_8 : i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c32_i32 = arith.constant 32 : i32
    %12 = arith.addi %c32_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = "simt_step.switch"(%13, %0) ({
    ^bb0(%arg2: i32):
      %c36_i32 = arith.constant 36 : i32
      %17 = arith.addi %c36_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %19 = arith.addi %0, %c3_i32 : i32
      %20 = "simt_step.switch"(%18, %19) ({
      ^bb0(%arg3: i32):
        %c40_i32 = arith.constant 40 : i32
        %28 = arith.addi %c40_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_6 = arith.constant 3 : i32
        %30 = arith.addi %0, %c3_i32_6 : i32
        %31 = "simt_step.switch"(%29, %30) ({
        ^bb0(%arg4: i32):
          %c1_i32_12 = arith.constant 1 : i32
          %39 = arith.addi %0, %c1_i32_12 : i32
          "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%42: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %33:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_12 : i32
          %40 = arith.addi %39, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %41 = arith.addi %c44_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_13 : i32
          "simt_step.condition"(%43, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %39 = arith.addi %arg4, %arg5 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %40 = arith.addi %arg5, %c1_i32_12 : i32
          "simt_step.yield"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        "simt_step.yield"(%33#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%34: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %35 = arith.addi %c64_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_11 : i32
        %38 = "simt_step.if"(%37) ({
          %c0_i32_12 = arith.constant 0 : i32
          %39 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %22 = arith.addi %c68_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_5 : i32
      %25 = "simt_step.if"(%24) ({
        %c72_i32 = arith.constant 72 : i32
        %28 = arith.addi %c72_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_6 = arith.constant 1 : i32
        %30 = arith.addi %0, %c1_i32_6 : i32
        %31 = "simt_step.switch"(%29, %30) ({
        ^bb0(%arg3: i32):
          %c0_i32_8 = arith.constant 0 : i32
          %32 = arith.addi %0, %c0_i32_8 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_9) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%31) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %27 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32_2 = arith.constant 32 : i32
    %15 = arith.addi %c32_i32_2, %0 : i32
    %true_3 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

