module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %1 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %1, %c1_i32 : i32
      %3 = arith.cmpi slt, %arg5, %2 : i32
      "simt_step.condition"(%3, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %1:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_3 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32_3 : i32
        %5 = arith.cmpi slt, %arg7, %4 : i32
        "simt_step.condition"(%5, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %3:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg8: i32, %arg9: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32_6 : i32
          %7 = arith.cmpi slt, %arg9, %6 : i32
          "simt_step.condition"(%7, %arg8, %arg9) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg8: i32, %arg9: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg9, %c4_i32 : i32
          %7 = arith.addi %c0_i32_6, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_7 = arith.constant 1 : i32
          %9 = arith.addi %arg9, %c1_i32_7 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_5 = arith.constant 1 : i32
        %4 = arith.addi %arg7, %c1_i32_5 : i32
        "simt_step.yield"(%3#0, %4) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%1#0, %2) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
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
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %22 = arith.addi %c12_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %24 = "simt_step.switch"(%23, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_11 : i32
          %45 = arith.addi %44, %0 : i32
          %c16_i32_12 = arith.constant 16 : i32
          %46 = arith.addi %c16_i32_12, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_13 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32 : i32
          %true_11 = arith.constant true
          "simt_step.continue"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_11 : i32
          %45 = arith.addi %44, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %46 = arith.addi %c36_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_12 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32 : i32
          %true_11 = arith.constant true
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%41#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_11 : i32
          %45 = arith.addi %44, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %46 = arith.addi %c56_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_12 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32 : i32
          %true_11 = arith.constant true
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %26 = arith.addi %c76_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_3 : i32
      %29 = "simt_step.if"(%28) ({
        %c80_i32 = arith.constant 80 : i32
        %39 = arith.addi %c80_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_5 : i32
        %42 = "simt_step.if"(%41) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_6 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%42) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_7 : i32
          %41 = arith.addi %40, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %42 = arith.addi %c84_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_8 : i32
          "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %40 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %arg4, %c1_i32 : i32
          %true_7 = arith.constant true
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb2(%30: i32):  // no predecessors
      %c104_i32 = arith.constant 104 : i32
      %31 = arith.addi %c104_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %33 = arith.cmpi ne, %32, %c0_i32_4 : i32
      %34 = "simt_step.if"(%33) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_7 : i32
          %41 = arith.addi %40, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %42 = arith.addi %c108_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_8 : i32
          "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %40 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %arg4, %c1_i32 : i32
          %true_7 = arith.constant true
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_7 : i32
          %41 = arith.addi %40, %0 : i32
          %c128_i32 = arith.constant 128 : i32
          %42 = arith.addi %c128_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_8 : i32
          "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %40 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %arg4, %c1_i32 : i32
          %true_7 = arith.constant true
          "simt_step.continue"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    ^bb3(%35: i32):  // no predecessors
      %c148_i32 = arith.constant 148 : i32
      %36 = arith.addi %c148_i32, %0 : i32
      %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
      %38 = "simt_step.switch"(%37, %0) ({
      ^bb0(%arg3: i32):
        %c152_i32 = arith.constant 152 : i32
        %39 = arith.addi %c152_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %41 = "simt_step.switch"(%40, %c0_i32_5) ({
        ^bb0(%arg4: i32):
          %c3_i32_7 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          %47 = arith.addi %0, %c4_i32_8 : i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%49: i32):  // no predecessors
          %c3_i32_9 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_9) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c156_i32 = arith.constant 156 : i32
        %43 = arith.addi %c156_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %45 = "simt_step.switch"(%44, %c3_i32) ({
        ^bb0(%arg4: i32):
          %c3_i32_7 = arith.constant 3 : i32
          %46 = arith.addi %0, %c3_i32_7 : i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %c3_i32_8 = arith.constant 3 : i32
          %48 = arith.addi %0, %c3_i32_8 : i32
          "simt_step.yield"(%48) {fallthrough = true} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c160_i32 = arith.constant 160 : i32
    %12 = arith.addi %c160_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = "simt_step.switch"(%13, %0) ({
    ^bb0(%arg2: i32):
      %c164_i32 = arith.constant 164 : i32
      %22 = arith.addi %c164_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_3 : i32
      %25 = "simt_step.if"(%24) ({
        %c168_i32 = arith.constant 168 : i32
        %30 = arith.addi %c168_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = "simt_step.switch"(%31, %0) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          %33 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c2_i32_4 = arith.constant 2 : i32
          %35 = arith.addi %0, %c2_i32_4 : i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %c2_i32_5 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_5) {fallthrough = true} : (i32) -> ()
        ^bb3(%37: i32):  // no predecessors
          %c1_i32_6 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_6) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      %c172_i32 = arith.constant 172 : i32
      %27 = arith.addi %c172_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %29 = "simt_step.switch"(%28, %c1_i32) ({
      ^bb0(%arg3: i32):
        %c176_i32 = arith.constant 176 : i32
        %30 = arith.addi %c176_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_4 : i32
        %33 = "simt_step.if"(%32) ({
          %c1_i32_8 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_8) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %41 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%41) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%33) {fallthrough = true} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_8 : i32
          %42 = arith.addi %41, %0 : i32
          %c180_i32 = arith.constant 180 : i32
          %43 = arith.addi %c180_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_9 : i32
          "simt_step.condition"(%45, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %41 = arith.addi %arg4, %arg5 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %42 = arith.addi %arg5, %c1_i32_8 : i32
          %true_9 = arith.constant true
          "simt_step.yield"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c200_i32 = arith.constant 200 : i32
        %37 = arith.addi %c200_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_7 : i32
        %40 = "simt_step.if"(%39) ({
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %15 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c204_i32 = arith.constant 204 : i32
    %17 = arith.addi %c204_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %19 = simt_step.subgroup_id
    %20 = arith.index_cast %19 : index to i32
    %21 = "simt_step.switch"(%18, %20) ({
    ^bb0(%arg2: i32):
      %c208_i32 = arith.constant 208 : i32
      %22 = arith.addi %c208_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_3 : i32
      %25 = "simt_step.if"(%24) ({
        %c212_i32 = arith.constant 212 : i32
        %27 = arith.addi %c212_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_4 : i32
        %30 = "simt_step.if"(%29) ({
          %c3_i32 = arith.constant 3 : i32
          %31 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %c4_i32_5 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_5) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        %27 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%27) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

