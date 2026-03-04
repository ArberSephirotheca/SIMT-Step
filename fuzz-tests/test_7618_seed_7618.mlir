module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %3 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %4 = arith.addi %3, %c1_i32 : i32
      %5 = arith.cmpi slt, %arg5, %4 : i32
      "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %3 = arith.remsi %arg3, %c4_i32 : i32
      %4 = simt_step.subgroup_id
      %5 = arith.index_cast %4 : index to i32
      %6 = "simt_step.switch"(%3, %5) ({
      ^bb0(%arg6: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32_10 : i32
          %20 = arith.cmpi slt, %arg8, %19 : i32
          "simt_step.condition"(%20, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c2_i32_9 = arith.constant 2 : i32
          %18 = arith.addi %arg0, %c2_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %19 = arith.addi %arg8, %c1_i32_10 : i32
          "simt_step.yield"(%18, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%9: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %10 = arith.remsi %arg3, %c2_i32 : i32
        %11 = "simt_step.switch"(%10, %arg0) ({
        ^bb0(%arg7: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb2(%12: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32_10 : i32
          %20 = arith.cmpi slt, %arg8, %19 : i32
          "simt_step.condition"(%20, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c1_i32_9 = arith.constant 1 : i32
          %18 = arith.addi %arg8, %c1_i32_9 : i32
          "simt_step.yield"(%arg0, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%14: i32):  // no predecessors
        %c2_i32_7 = arith.constant 2 : i32
        %15 = arith.remsi %arg3, %c2_i32_7 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %16 = arith.addi %arg0, %c1_i32_8 : i32
        %17 = "simt_step.switch"(%15, %16) ({
        ^bb0(%arg7: i32):
          %c2_i32_9 = arith.constant 2 : i32
          %18 = arith.addi %arg0, %c2_i32_9 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb2(%20: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %21 = arith.addi %arg0, %c3_i32 : i32
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%6, %7) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c12_i32 = arith.constant 12 : i32
      %24 = arith.addi %c12_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = "simt_step.switch"(%25, %0) ({
      ^bb0(%arg2: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %31 = arith.muli %arg4, %c4_i32_9 : i32
          %32 = arith.addi %31, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %33 = arith.addi %c16_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_10 : i32
          "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %31 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%27#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb2(%29: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %31 = arith.muli %arg4, %c4_i32_9 : i32
          %32 = arith.addi %31, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %33 = arith.addi %c36_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_10 : i32
          "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %31 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          "simt_step.break"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%26) : (i32) -> ()
    }, {
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %25 = arith.muli %arg3, %c4_i32_7 : i32
        %26 = arith.addi %25, %0 : i32
        %c56_i32 = arith.constant 56 : i32
        %27 = arith.addi %c56_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_8 : i32
        "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %32 = arith.muli %arg5, %c4_i32_12 : i32
          %33 = arith.addi %32, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %34 = arith.addi %c76_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_13 : i32
          "simt_step.condition"(%36, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %32 = arith.addi %arg4, %arg5 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %33 = arith.addi %arg5, %c1_i32_12 : i32
          %true_13 = arith.constant true
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_14 : i32
          %35 = arith.addi %c16_i32, %34 : i32
          %36 = arith.addi %35, %0 : i32
          %true_15 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %26 = arith.addi %arg2, %25#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %27 = arith.addi %arg3, %c1_i32 : i32
        %true_9 = arith.constant true
        %c32_i32 = arith.constant 32 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %28 = arith.muli %arg3, %c4_i32_10 : i32
        %29 = arith.addi %c32_i32, %28 : i32
        %30 = arith.addi %29, %0 : i32
        %true_11 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%24#0) : (i32) -> ()
    }) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %9 = arith.addi %c48_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c96_i32 = arith.constant 96 : i32
    %11 = arith.addi %c96_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = simt_step.lane_id
    %14 = arith.index_cast %13 : index to i32
    %15 = "simt_step.switch"(%12, %14) ({
    ^bb0(%arg2: i32):
      %c100_i32 = arith.constant 100 : i32
      %24 = arith.addi %c100_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_5 : i32
      %27 = "simt_step.if"(%26) ({
        %c104_i32 = arith.constant 104 : i32
        %30 = arith.addi %c104_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_8 : i32
        %33 = "simt_step.if"(%32) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_9 = arith.constant 0 : i32
          %34 = arith.addi %0, %c0_i32_9 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%33) : (i32) -> ()
      }, {
        %c108_i32 = arith.constant 108 : i32
        %30 = arith.addi %c108_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_8 = arith.constant 4 : i32
        %32 = "simt_step.switch"(%31, %c4_i32_8) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %c1_i32_10 = arith.constant 1 : i32
          %35 = arith.addi %0, %c1_i32_10 : i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb1(%28: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %29:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_8 : i32
        %31 = arith.addi %30, %0 : i32
        %c112_i32 = arith.constant 112 : i32
        %32 = arith.addi %c112_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_9 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %33 = arith.muli %arg6, %c4_i32_11 : i32
          %34 = arith.addi %33, %0 : i32
          %c132_i32 = arith.constant 132 : i32
          %35 = arith.addi %c132_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_12 : i32
          "simt_step.condition"(%37, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %33 = arith.addi %arg5, %arg6 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %34 = arith.addi %arg6, %c1_i32_11 : i32
          %true_12 = arith.constant true
          "simt_step.yield"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %31 = arith.addi %arg3, %30#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %32 = arith.addi %arg4, %c1_i32 : i32
        %true_10 = arith.constant true
        "simt_step.yield"(%31, %32) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %16 = arith.addi %c64_i32, %0 : i32
    %true_2 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c152_i32 = arith.constant 152 : i32
    %18 = arith.addi %c152_i32, %0 : i32
    %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %20 = arith.cmpi ne, %19, %c0_i32_3 : i32
    %21 = "simt_step.if"(%20) ({
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %25 = arith.muli %arg3, %c4_i32_7 : i32
        %26 = arith.addi %25, %0 : i32
        %c156_i32 = arith.constant 156 : i32
        %27 = arith.addi %c156_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_8 : i32
        "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %25 = simt_step.lane_id
        %26 = arith.index_cast %25 : index to i32
        %27 = arith.addi %arg2, %26 : i32
        %c1_i32 = arith.constant 1 : i32
        %28 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %29 = arith.muli %arg3, %c4_i32_8 : i32
        %30 = arith.addi %c80_i32, %29 : i32
        %31 = arith.addi %30, %0 : i32
        %true_9 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%24#0) : (i32) -> ()
    }, {
      %c176_i32 = arith.constant 176 : i32
      %24 = arith.addi %c176_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_5 : i32
      %27 = "simt_step.if"(%26) ({
        %c3_i32 = arith.constant 3 : i32
        %30 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%30) : (i32) -> ()
      }, {
        %c180_i32 = arith.constant 180 : i32
        %30 = arith.addi %c180_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %32 = "simt_step.switch"(%31, %c2_i32) ({
        ^bb0(%arg2: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c96_i32_8 = arith.constant 96 : i32
        %33 = arith.addi %c96_i32_8, %0 : i32
        %true_9 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %28 = arith.addi %c112_i32, %0 : i32
      %true_6 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) : (i32) -> ()
    }) : (i1) -> i32
    %c128_i32 = arith.constant 128 : i32
    %22 = arith.addi %c128_i32, %0 : i32
    %true_4 = arith.constant true
    %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

