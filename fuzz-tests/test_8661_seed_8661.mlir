module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = "simt_step.switch"(%0, %c2_i32) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      %4 = arith.remsi %arg3, %c3_i32 : i32
      %c4_i32_0 = arith.constant 4 : i32
      %5 = "simt_step.switch"(%4, %c4_i32_0) ({
      ^bb0(%arg5: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32 : i32
          %22 = arith.cmpi slt, %arg7, %21 : i32
          "simt_step.condition"(%22, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c0_i32_10 = arith.constant 0 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.break"(%c0_i32_10, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%14: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %16 = "simt_step.if"(%15) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          %c2_i32_10 = arith.constant 2 : i32
          %20 = arith.addi %arg0, %c2_i32_10 : i32
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
      ^bb2(%17: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %19 = "simt_step.if"(%18) ({
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %7:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %13 = arith.remsi %arg3, %c4_i32_6 : i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %13, %c1_i32 : i32
        %15 = arith.cmpi slt, %arg6, %14 : i32
        "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32_9 : i32
          %17 = arith.cmpi slt, %arg8, %16 : i32
          "simt_step.condition"(%17, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c2_i32_8 = arith.constant 2 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %15 = arith.addi %arg8, %c1_i32_9 : i32
          "simt_step.yield"(%c2_i32_8, %15) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%13#0, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%7#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%8: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %9 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %10 = "simt_step.if"(%9) ({
        %c3_i32_6 = arith.constant 3 : i32
        %13 = arith.addi %arg0, %c3_i32_6 : i32
        "simt_step.yield"(%13) : (i32) -> ()
      }, {
        %c4_i32_6 = arith.constant 4 : i32
        %13 = arith.remsi %arg3, %c4_i32_6 : i32
        %c3_i32_7 = arith.constant 3 : i32
        %14 = "simt_step.switch"(%13, %c3_i32_7) ({
        ^bb0(%arg5: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
        ^bb1(%15: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb2(%16: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          %17 = arith.addi %arg0, %c4_i32_8 : i32
          "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
        ^bb3(%18: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%14) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb3(%11: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %13 = arith.remsi %arg3, %c4_i32_6 : i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %13, %c1_i32 : i32
        %15 = arith.cmpi slt, %arg6, %14 : i32
        "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %13 = arith.remsi %arg3, %c4_i32_6 : i32
        %14 = "simt_step.switch"(%13, %arg0) ({
        ^bb0(%arg7: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%17: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%18: i32):  // no predecessors
          %c2_i32_7 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_7) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%14, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %14 = arith.addi %0, %c0_i32_0 : i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_5 : i32
        %25 = arith.addi %24, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %26 = arith.addi %c12_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_6 : i32
        "simt_step.condition"(%28, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %24 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %arg4, %c1_i32 : i32
        %true = arith.constant true
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%17: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %18 = arith.addi %c32_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %20 = arith.addi %0, %c2_i32 : i32
      %21 = "simt_step.switch"(%19, %20) ({
      ^bb0(%arg3: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_9 : i32
          %32 = arith.addi %31, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %33 = arith.addi %c36_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_10 : i32
          "simt_step.condition"(%35, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %31 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg5, %c1_i32 : i32
          %true = arith.constant true
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c2_i32_7 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_7) {fallthrough = false} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %27 = arith.addi %c56_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_8 : i32
        %30 = "simt_step.if"(%29) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb3(%22: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_5 : i32
        %25 = arith.addi %24, %0 : i32
        %c60_i32 = arith.constant 60 : i32
        %26 = arith.addi %c60_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_6 : i32
        "simt_step.condition"(%28, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c80_i32 = arith.constant 80 : i32
        %24 = arith.addi %c80_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %26 = "simt_step.switch"(%25, %0) ({
        ^bb0(%arg5: i32):
          %c2_i32_5 = arith.constant 2 : i32
          %29 = arith.addi %0, %c2_i32_5 : i32
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          %c2_i32_6 = arith.constant 2 : i32
          %31 = arith.addi %0, %c2_i32_6 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %27 = arith.addi %arg3, %26 : i32
        %c1_i32 = arith.constant 1 : i32
        %28 = arith.addi %arg4, %c1_i32 : i32
        %true = arith.constant true
        "simt_step.yield"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %c84_i32 = arith.constant 84 : i32
    %8 = arith.addi %c84_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = "simt_step.switch"(%9, %0) ({
    ^bb0(%arg2: i32):
      %c88_i32 = arith.constant 88 : i32
      %14 = arith.addi %c88_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_0 : i32
      %17 = "simt_step.if"(%16) ({
        %c92_i32 = arith.constant 92 : i32
        %29 = arith.addi %c92_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_5 : i32
        %32 = "simt_step.if"(%31) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c4_i32_6 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }, {
        %c96_i32 = arith.constant 96 : i32
        %29 = arith.addi %c96_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_5 : i32
        %32 = "simt_step.if"(%31) ({
          %c2_i32 = arith.constant 2 : i32
          %33 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%33) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c100_i32 = arith.constant 100 : i32
      %19 = arith.addi %c100_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %21 = "simt_step.switch"(%20, %c0_i32_1) ({
      ^bb0(%arg3: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %29 = arith.addi %0, %c0_i32_5 : i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c104_i32 = arith.constant 104 : i32
        %31 = arith.addi %c104_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_6 : i32
        %34 = "simt_step.if"(%33) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c108_i32 = arith.constant 108 : i32
        %36 = arith.addi %c108_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_7 : i32
        %39 = "simt_step.if"(%38) ({
          %c2_i32 = arith.constant 2 : i32
          %45 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%45) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%45) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb3(%40: i32):  // no predecessors
        %c112_i32 = arith.constant 112 : i32
        %41 = arith.addi %c112_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_8 = arith.constant 4 : i32
        %43 = arith.addi %0, %c4_i32_8 : i32
        %44 = "simt_step.switch"(%42, %43) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = true} : (i32) -> ()
        ^bb2(%46: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_5 : i32
        %30 = arith.addi %29, %0 : i32
        %c116_i32 = arith.constant 116 : i32
        %31 = arith.addi %c116_i32, %30 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_6 : i32
        "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %29 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32 : i32
        %true = arith.constant true
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) {fallthrough = true} : (i32) -> ()
    ^bb3(%24: i32):  // no predecessors
      %c136_i32 = arith.constant 136 : i32
      %25 = arith.addi %c136_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_4 : i32
      %28 = "simt_step.if"(%27) ({
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) : (i32) -> ()
      }, {
        %c140_i32 = arith.constant 140 : i32
        %29 = arith.addi %c140_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %31 = arith.addi %0, %c1_i32 : i32
        %32 = "simt_step.switch"(%30, %31) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c1_i32_5 = arith.constant 1 : i32
          %34 = arith.addi %0, %c1_i32_5 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %c4_i32_6 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_6) {fallthrough = false} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c144_i32 = arith.constant 144 : i32
    %11 = arith.addi %c144_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = "simt_step.switch"(%12, %0) ({
    ^bb0(%arg2: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_5 : i32
        %23 = arith.addi %22, %0 : i32
        %c148_i32 = arith.constant 148 : i32
        %24 = arith.addi %c148_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %0, %c1_i32 : i32
        %23 = arith.addi %arg3, %22 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %24 = arith.addi %arg4, %c1_i32_5 : i32
        %true = arith.constant true
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_5 : i32
        %23 = arith.addi %22, %0 : i32
        %c168_i32 = arith.constant 168 : i32
        %24 = arith.addi %c168_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %22 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg4, %c1_i32 : i32
        %true = arith.constant true
        "simt_step.break"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%17: i32):  // no predecessors
      %c188_i32 = arith.constant 188 : i32
      %18 = arith.addi %c188_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_4 : i32
      %21 = "simt_step.if"(%20) ({
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%22) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

