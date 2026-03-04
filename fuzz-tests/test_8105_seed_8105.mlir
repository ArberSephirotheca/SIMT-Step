module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %7 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %7, %c1_i32 : i32
      %9 = arith.cmpi slt, %arg5, %8 : i32
      "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.muli %arg5, %c4_i32 : i32
      %9 = arith.addi %c0_i32_2, %8 : i32
      %10 = arith.addi %9, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%7, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c3_i32 = arith.constant 3 : i32
    %1 = arith.remsi %arg3, %c3_i32 : i32
    %2 = simt_step.subgroup_id
    %3 = arith.index_cast %2 : index to i32
    %4 = "simt_step.switch"(%1, %3) ({
    ^bb0(%arg4: i32):
      %c4_i32 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32_6 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %11, %c1_i32 : i32
        %13 = arith.cmpi slt, %arg6, %12 : i32
        "simt_step.condition"(%13, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c2_i32 = arith.constant 2 : i32
        %11 = arith.addi %arg0, %c2_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%11, %12) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32_6 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %11, %c1_i32 : i32
        %13 = arith.cmpi slt, %arg6, %12 : i32
        "simt_step.condition"(%13, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %11:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32_9 : i32
          %15 = arith.cmpi slt, %arg8, %14 : i32
          "simt_step.condition"(%15, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %13 = arith.addi %arg8, %c1_i32_9 : i32
          "simt_step.yield"(%c4_i32_8, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%11#0, %12) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %6 = arith.select %5, %0#0, %4 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c8_i32 = arith.constant 8 : i32
      %19 = arith.addi %c8_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_2 : i32
      "simt_step.if"(%21) ({
        "simt_step.yield"() : () -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        %22 = arith.remsi %0, %c3_i32 : i32
        %23 = simt_step.subgroup_id
        %24 = arith.index_cast %23 : index to i32
        %25 = "simt_step.switch"(%22, %24) ({
        ^bb0(%arg2: i32):
          %c2_i32 = arith.constant 2 : i32
          %26 = arith.addi %arg2, %c2_i32 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %c4_i32_3 = arith.constant 4 : i32
          %28 = arith.addi %27, %c4_i32_3 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          %c2_i32_4 = arith.constant 2 : i32
          %30 = arith.addi %29, %c2_i32_4 : i32
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb3(%31: i32):  // no predecessors
          %c2_i32_5 = arith.constant 2 : i32
          %32 = arith.addi %31, %c2_i32_5 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c1_i32_2 = arith.constant 1 : i32
      %21 = arith.addi %0, %c1_i32_2 : i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c16_i32 = arith.constant 16 : i32
      %23 = arith.addi %c16_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = "simt_step.switch"(%24, %0) ({
      ^bb0(%arg3: i32):
        %c3_i32 = arith.constant 3 : i32
        %31 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %33 = arith.addi %c20_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %35 = "simt_step.switch"(%34, %0) ({
        ^bb0(%arg4: i32):
          %c3_i32_6 = arith.constant 3 : i32
          %38 = arith.addi %0, %c3_i32_6 : i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %c3_i32_7 = arith.constant 3 : i32
          %40 = arith.addi %0, %c3_i32_7 : i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          %c0_i32_8 = arith.constant 0 : i32
          %42 = arith.addi %0, %c0_i32_8 : i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %38 = arith.muli %arg5, %c4_i32_6 : i32
          %39 = arith.addi %38, %0 : i32
          %c24_i32 = arith.constant 24 : i32
          %40 = arith.addi %c24_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_7 : i32
          "simt_step.condition"(%42, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %38 = arith.addi %arg4, %arg5 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %39 = arith.addi %arg5, %c1_i32_6 : i32
          %true_7 = arith.constant true
          "simt_step.break"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb3(%26: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %27 = arith.addi %c44_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %29 = arith.cmpi ne, %28, %c0_i32_3 : i32
      %30 = "simt_step.if"(%29) ({
        %c48_i32 = arith.constant 48 : i32
        %31 = arith.addi %c48_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %33 = "simt_step.switch"(%32, %c3_i32) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %c4_i32_4 = arith.constant 4 : i32
          %36 = arith.addi %0, %c4_i32_4 : i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%33) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %32 = arith.muli %arg4, %c4_i32_6 : i32
          %33 = arith.addi %32, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %34 = arith.addi %c52_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_7 : i32
          "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %32 = arith.addi %arg3, %arg4 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %33 = arith.addi %arg4, %c1_i32_6 : i32
          %true_7 = arith.constant true
          "simt_step.break"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%31#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %11 = simt_step.lane_id
    %12 = arith.index_cast %11 : index to i32
    %c72_i32 = arith.constant 72 : i32
    %13 = arith.addi %c72_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %15 = arith.cmpi ne, %14, %c0_i32_1 : i32
    %16 = "simt_step.if"(%15) ({
      %c76_i32 = arith.constant 76 : i32
      %19 = arith.addi %c76_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_2 : i32
      %22 = "simt_step.if"(%21) ({
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%25) : (i32) -> ()
      }, {
        %c80_i32 = arith.constant 80 : i32
        %25 = arith.addi %c80_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %27 = "simt_step.switch"(%26, %0) ({
        ^bb0(%arg2: i32):
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c4_i32_4 = arith.constant 4 : i32
          %30 = arith.addi %0, %c4_i32_4 : i32
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%32: i32):  // no predecessors
          %c4_i32_5 = arith.constant 4 : i32
          %33 = arith.addi %0, %c4_i32_5 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%27) : (i32) -> ()
      }) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %23 = arith.addi %c16_i32, %0 : i32
      %true_3 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) : (i32) -> ()
    }, {
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %20 = arith.muli %arg3, %c4_i32_4 : i32
        %21 = arith.addi %20, %0 : i32
        %c84_i32 = arith.constant 84 : i32
        %22 = arith.addi %c84_i32, %21 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_5 : i32
        "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c104_i32 = arith.constant 104 : i32
        %20 = arith.addi %c104_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_4 : i32
        %23 = "simt_step.if"(%22) ({
          %32 = simt_step.subgroup_id
          %33 = arith.index_cast %32 : index to i32
          "simt_step.yield"(%33) : (i32) -> ()
        }, {
          %32 = simt_step.subgroup_id
          %33 = arith.index_cast %32 : index to i32
          "simt_step.yield"(%33) : (i32) -> ()
        }) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %24 = arith.addi %c32_i32, %0 : i32
        %true_5 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %26 = arith.addi %arg2, %23 : i32
        %c1_i32 = arith.constant 1 : i32
        %27 = arith.addi %arg3, %c1_i32 : i32
        %true_6 = arith.constant true
        %c48_i32 = arith.constant 48 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %28 = arith.muli %arg3, %c4_i32_7 : i32
        %29 = arith.addi %c48_i32, %28 : i32
        %30 = arith.addi %29, %0 : i32
        %true_8 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%19#0) : (i32) -> ()
    }) : (i1) -> i32
    %c64_i32 = arith.constant 64 : i32
    %17 = arith.addi %c64_i32, %0 : i32
    %true = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

