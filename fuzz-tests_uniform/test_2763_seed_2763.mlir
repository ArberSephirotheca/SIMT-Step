module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c3_i32_0 = arith.constant 3 : i32
    %1 = "simt_step.switch"(%0, %c3_i32_0) ({
    ^bb0(%arg4: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32_4 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %12 = arith.addi %11, %c1_i32_5 : i32
        %13 = arith.cmpi slt, %arg6, %12 : i32
        "simt_step.condition"(%13, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %11 = arith.addi %arg0, %c4_i32_4 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %12 = arith.addi %arg6, %c1_i32_5 : i32
        "simt_step.yield"(%11, %12) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c3_i32_3 = arith.constant 3 : i32
      "simt_step.yield"(%4#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg0, %c1_i32 : i32
      %8 = "simt_step.switch"(%6, %7) ({
      ^bb0(%arg5: i32):
        %c3_i32_4 = arith.constant 3 : i32
        %11 = arith.remsi %arg3, %c3_i32_4 : i32
        %12 = "simt_step.switch"(%11, %arg0) ({
        ^bb0(%arg6: i32):
          %c3_i32_10 = arith.constant 3 : i32
          %19 = arith.addi %arg0, %c3_i32_10 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %c2_i32_11 = arith.constant 2 : i32
          %22 = arith.addi %arg0, %c2_i32_11 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c4_i32_5 = arith.constant 4 : i32
        %13 = arith.addi %arg0, %c4_i32_5 : i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb1(%14: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32_11 : i32
          %21 = arith.cmpi slt, %arg7, %20 : i32
          "simt_step.condition"(%21, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_10 = arith.constant 3 : i32
          %19 = arith.addi %arg0, %c3_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %20 = arith.addi %arg7, %c1_i32_11 : i32
          "simt_step.yield"(%19, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%16: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %18 = "simt_step.if"(%17) ({
          %c2_i32_10 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_10) : (i32) -> ()
        }, {
          %c4_i32_10 = arith.constant 4 : i32
          %19 = arith.addi %arg0, %c4_i32_10 : i32
          "simt_step.yield"(%19) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32_9 = arith.constant 2 : i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.addi %arg0, %c4_i32 : i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_8 = arith.constant 4 : i32
      %23 = arith.muli %arg3, %c4_i32_8 : i32
      %24 = arith.addi %23, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %25 = arith.addi %c8_i32, %24 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_9 : i32
      "simt_step.condition"(%27, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %23 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %24 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%23, %24) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c28_i32 = arith.constant 28 : i32
    %8 = arith.addi %c28_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %9, %c0_i32_3 : i32
    %11 = "simt_step.if"(%10) ({
      %c2_i32 = arith.constant 2 : i32
      %23 = arith.addi %0, %c2_i32 : i32
      "simt_step.yield"(%23) : (i32) -> ()
    }, {
      %23 = simt_step.subgroup_id
      %24 = arith.index_cast %23 : index to i32
      "simt_step.yield"(%24) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %12 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %14 = simt_step.subgroup_id
    %15 = arith.index_cast %14 : index to i32
    %c32_i32_5 = arith.constant 32 : i32
    %16 = arith.addi %c32_i32_5, %0 : i32
    %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
    %18 = simt_step.subgroup_id
    %19 = arith.index_cast %18 : index to i32
    %20 = "simt_step.switch"(%17, %19) ({
    ^bb0(%arg2: i32):
      %c36_i32 = arith.constant 36 : i32
      %23 = arith.addi %c36_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %25 = arith.addi %0, %c1_i32 : i32
      %26 = "simt_step.switch"(%24, %25) ({
      ^bb0(%arg3: i32):
        %c0_i32_13 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_13) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %36 = arith.addi %c40_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_14 : i32
        %39 = "simt_step.if"(%38) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_18 = arith.constant 0 : i32
          %42 = arith.addi %0, %c0_i32_18 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_18 : i32
          %43 = arith.addi %42, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %44 = arith.addi %c44_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_19 : i32
          "simt_step.condition"(%46, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %42 = arith.addi %arg4, %arg5 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %43 = arith.addi %arg5, %c1_i32_18 : i32
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        "simt_step.yield"(%41#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %29 = arith.addi %c64_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_9 : i32
      %32 = "simt_step.if"(%31) ({
        %c68_i32 = arith.constant 68 : i32
        %35 = arith.addi %c68_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_13 = arith.constant 4 : i32
        %37 = arith.addi %0, %c4_i32_13 : i32
        %38 = "simt_step.switch"(%36, %37) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %c1_i32_15 = arith.constant 1 : i32
          %40 = arith.addi %0, %c1_i32_15 : i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        %c72_i32 = arith.constant 72 : i32
        %35 = arith.addi %c72_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %37 = "simt_step.switch"(%36, %0) ({
        ^bb0(%arg3: i32):
          %c1_i32_14 = arith.constant 1 : i32
          %38 = arith.addi %0, %c1_i32_14 : i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %41 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb3(%42: i32):  // no predecessors
          %c0_i32_15 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_15) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        "simt_step.yield"(%37) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb3(%33: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %34:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_13 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_13 : i32
        %36 = arith.addi %35, %0 : i32
        %c76_i32 = arith.constant 76 : i32
        %37 = arith.addi %c76_i32, %36 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_14 : i32
        "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %35 = arith.addi %arg3, %arg4 : i32
        %c1_i32_13 = arith.constant 1 : i32
        %36 = arith.addi %arg4, %c1_i32_13 : i32
        "simt_step.continue"(%35, %36) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_12 = arith.constant true
      "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true_6 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %21 = arith.addi %c48_i32, %0 : i32
    %true_7 = arith.constant true
    %22 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

