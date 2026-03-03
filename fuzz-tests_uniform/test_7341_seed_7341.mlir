module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32 : i32
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
        %10 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %11 = "simt_step.if"(%10) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%11) : (i32) -> ()
      }, {
        %c2_i32_4 = arith.constant 2 : i32
        %10 = arith.remsi %arg3, %c2_i32_4 : i32
        %c3_i32 = arith.constant 3 : i32
        %11 = arith.addi %arg0, %c3_i32 : i32
        %12 = "simt_step.switch"(%10, %11) ({
        ^bb0(%arg6: i32):
          %c3_i32_5 = arith.constant 3 : i32
          %13 = arith.addi %arg0, %c3_i32_5 : i32
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          %c1_i32_6 = arith.constant 1 : i32
          %15 = arith.addi %arg0, %c1_i32_6 : i32
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%12) : (i32) -> ()
      }) : (i1) -> i32
      %7 = simt_step.subgroup_id
      %8 = arith.index_cast %7 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%6, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %c2_i32, %0#0 : i32
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
    %c4_i32_0 = arith.constant 4 : i32
    %7 = arith.addi %0, %c4_i32_0 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %11 = arith.addi %c12_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_2 : i32
      %14 = "simt_step.if"(%13) ({
        %c16_i32_6 = arith.constant 16 : i32
        %29 = arith.addi %c16_i32_6, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_7 : i32
        %32 = "simt_step.if"(%31) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %30 = arith.muli %arg4, %c4_i32_9 : i32
          %31 = arith.addi %30, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %32 = arith.addi %c20_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_10 : i32
          "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %30 = arith.addi %arg3, %arg4 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %31 = arith.addi %arg4, %c1_i32_9 : i32
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        "simt_step.yield"(%29#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %16 = arith.addi %c40_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_3 : i32
      %19 = "simt_step.if"(%18) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %30 = arith.muli %arg4, %c4_i32_9 : i32
          %31 = arith.addi %30, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %32 = arith.addi %c44_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_10 : i32
          "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %30 = arith.addi %arg3, %arg4 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %31 = arith.addi %arg4, %c1_i32_9 : i32
          "simt_step.continue"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        "simt_step.yield"(%29#0) : (i32) -> ()
      }, {
        %c64_i32 = arith.constant 64 : i32
        %29 = arith.addi %c64_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_6 : i32
        %32 = "simt_step.if"(%31) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %33 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%33) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %21 = arith.addi %c68_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %23 = arith.addi %0, %c1_i32 : i32
      %24 = "simt_step.switch"(%22, %23) ({
      ^bb0(%arg3: i32):
        %c72_i32 = arith.constant 72 : i32
        %29 = arith.addi %c72_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_6 : i32
        %32 = "simt_step.if"(%31) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %34 = arith.addi %c76_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %36 = "simt_step.switch"(%35, %c3_i32) ({
        ^bb0(%arg4: i32):
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_9) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          %c3_i32_10 = arith.constant 3 : i32
          %39 = arith.addi %0, %c3_i32_10 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb3(%25: i32):  // no predecessors
      %c80_i32 = arith.constant 80 : i32
      %26 = arith.addi %c80_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %28 = "simt_step.switch"(%27, %0) ({
      ^bb0(%arg3: i32):
        %c84_i32 = arith.constant 84 : i32
        %29 = arith.addi %c84_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_6 : i32
        %32 = "simt_step.if"(%31) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c1_i32_8 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_8) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %34 = arith.addi %c88_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = "simt_step.switch"(%35, %0) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          %38 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %40 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

