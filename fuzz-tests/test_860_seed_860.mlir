module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %true = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %9 = arith.addi %c0_i32_1, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8) : (i32) -> ()
    }, {
      %true = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %9 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8) : (i32) -> ()
    }) : (i1) -> i32
    %c2_i32 = arith.constant 2 : i32
    %2 = arith.remsi %arg3, %c2_i32 : i32
    %3 = simt_step.lane_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      %c2_i32_1 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32_1) {fallthrough = true} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c2_i32_2 = arith.constant 2 : i32
      %10 = arith.remsi %arg3, %c2_i32_2 : i32
      %c3_i32 = arith.constant 3 : i32
      %11 = arith.addi %arg0, %c3_i32 : i32
      %12 = "simt_step.switch"(%10, %11) ({
      ^bb0(%arg5: i32):
        "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
      ^bb1(%13: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32 : i32
          %17 = arith.cmpi slt, %arg7, %16 : i32
          "simt_step.condition"(%17, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32 = arith.constant 1 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %15 = arith.addi %arg7, %c1_i32_6 : i32
          "simt_step.continue"(%c1_i32, %15) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %7 = arith.select %6, %1, %5 : i32
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
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = "simt_step.switch"(%17, %0) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %24 = arith.addi %c16_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_3 : i32
        %27 = "simt_step.if"(%26) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %32 = arith.muli %arg5, %c4_i32_6 : i32
          %33 = arith.addi %32, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %34 = arith.addi %c20_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_7 : i32
          "simt_step.condition"(%36, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %32 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %arg5, %c1_i32 : i32
          %true_6 = arith.constant true
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb3(%31: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %20 = arith.addi %c40_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_2 : i32
      %23 = "simt_step.if"(%22) ({
        %c44_i32 = arith.constant 44 : i32
        %24 = arith.addi %c44_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_3 : i32
        %27 = "simt_step.if"(%26) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) : (i32) -> ()
      }, {
        %c48_i32 = arith.constant 48 : i32
        %24 = arith.addi %c48_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_3 = arith.constant 4 : i32
        %26 = "simt_step.switch"(%25, %c4_i32_3) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        "simt_step.yield"(%26) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c52_i32 = arith.constant 52 : i32
    %10 = arith.addi %c52_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %12 = simt_step.lane_id
    %13 = arith.index_cast %12 : index to i32
    %14 = "simt_step.switch"(%11, %13) ({
    ^bb0(%arg2: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_4 : i32
        %23 = arith.addi %22, %0 : i32
        %c56_i32 = arith.constant 56 : i32
        %24 = arith.addi %c56_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_5 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %25 = arith.muli %arg6, %c4_i32_6 : i32
          %26 = arith.addi %25, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %27 = arith.addi %c76_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_7 : i32
          "simt_step.condition"(%29, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %25 = arith.addi %arg5, %arg6 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %26 = arith.addi %arg6, %c1_i32_6 : i32
          %true_7 = arith.constant true
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %23 = arith.addi %arg3, %22#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg4, %c1_i32 : i32
        %true = arith.constant true
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c96_i32 = arith.constant 96 : i32
      %18 = arith.addi %c96_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %20 = arith.addi %0, %c3_i32 : i32
      %21 = "simt_step.switch"(%19, %20) ({
      ^bb0(%arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %22 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        %c100_i32 = arith.constant 100 : i32
        %25 = arith.addi %c100_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_4 : i32
        %28 = "simt_step.if"(%27) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
      ^bb3(%29: i32):  // no predecessors
        %c104_i32 = arith.constant 104 : i32
        %30 = arith.addi %c104_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_5 : i32
        %33 = "simt_step.if"(%32) ({
          %c3_i32_6 = arith.constant 3 : i32
          %34 = arith.addi %0, %c3_i32_6 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }, {
          %c2_i32_6 = arith.constant 2 : i32
          %34 = arith.addi %0, %c2_i32_6 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %15:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_2 : i32
      %17 = arith.addi %16, %0 : i32
      %c108_i32 = arith.constant 108 : i32
      %18 = arith.addi %c108_i32, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_3 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c128_i32 = arith.constant 128 : i32
      %16 = arith.addi %c128_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_2 : i32
      %19 = "simt_step.if"(%18) ({
        %c132_i32 = arith.constant 132 : i32
        %28 = arith.addi %c132_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %30 = simt_step.subgroup_id
        %31 = arith.index_cast %30 : index to i32
        %32 = "simt_step.switch"(%29, %31) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %35 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          %c2_i32_6 = arith.constant 2 : i32
          %37 = arith.addi %0, %c2_i32_6 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %20 = arith.addi %c32_i32, %0 : i32
      %true = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %22 = arith.addi %arg2, %19 : i32
      %c1_i32 = arith.constant 1 : i32
      %23 = arith.addi %arg3, %c1_i32 : i32
      %true_3 = arith.constant true
      %c48_i32 = arith.constant 48 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %24 = arith.muli %arg3, %c4_i32_4 : i32
      %25 = arith.addi %c48_i32, %24 : i32
      %26 = arith.addi %25, %0 : i32
      %true_5 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%22, %23) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

