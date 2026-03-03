module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%c1_i32) : (i32) -> ()
    }, {
      "simt_step.yield"(%arg0) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_0, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %17 = arith.remsi %arg3, %c4_i32_7 : i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %17, %c1_i32 : i32
      %19 = arith.cmpi slt, %arg5, %18 : i32
      "simt_step.condition"(%19, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %17 = simt_step.subgroup_id
      %18 = arith.index_cast %17 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%18, %19) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_3 = arith.constant true
    %5 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
    %8 = arith.select %7, %1, %4#0 : i32
    %c4_i32 = arith.constant 4 : i32
    %9 = arith.remsi %arg3, %c4_i32 : i32
    %10 = simt_step.subgroup_id
    %11 = arith.index_cast %10 : index to i32
    %12 = "simt_step.switch"(%9, %11) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      %17 = arith.remsi %arg3, %c3_i32 : i32
      %c2_i32 = arith.constant 2 : i32
      %18 = arith.addi %arg0, %c2_i32 : i32
      %19 = "simt_step.switch"(%17, %18) ({
      ^bb0(%arg5: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %arg2, %c0_i32_11 : i32
        %30 = "simt_step.if"(%29) ({
          %c2_i32_17 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_17) : (i32) -> ()
        }, {
          %c4_i32_17 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_17) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %31 = arith.addi %arg0, %c0_i32_12 : i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c4_i32_13 = arith.constant 4 : i32
        %33 = "simt_step.switch"(%arg3, %c4_i32_13) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c0_i32_17 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c3_i32_14 = arith.constant 3 : i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb2(%34: i32):  // no predecessors
        %c2_i32_15 = arith.constant 2 : i32
        %35 = arith.remsi %arg3, %c2_i32_15 : i32
        %36 = "simt_step.switch"(%35, %arg0) ({
        ^bb0(%arg6: i32):
          %c2_i32_17 = arith.constant 2 : i32
          %40 = arith.addi %arg0, %c2_i32_17 : i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %c0_i32_18 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c4_i32_16 = arith.constant 4 : i32
        %37 = arith.addi %arg0, %c4_i32_16 : i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb3(%38: i32):  // no predecessors
        %39 = "simt_step.switch"(%arg3, %arg0) ({
        ^bb0(%arg6: i32):
          %c0_i32_17 = arith.constant 0 : i32
          %40 = arith.addi %arg0, %c0_i32_17 : i32
          "simt_step.yield"(%40) {fallthrough = true} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %c4_i32_18 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c3_i32_7 = arith.constant 3 : i32
      %22 = arith.remsi %arg3, %c3_i32_7 : i32
      %23 = "simt_step.switch"(%22, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %38 = arith.remsi %arg3, %c4_i32_19 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %39 = arith.addi %38, %c1_i32_20 : i32
          %40 = arith.cmpi slt, %arg7, %39 : i32
          "simt_step.condition"(%40, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %38 = arith.addi %arg7, %c1_i32_20 : i32
          "simt_step.yield"(%c4_i32_19, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_13 = arith.constant 3 : i32
        %30 = arith.addi %arg0, %c3_i32_13 : i32
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %38 = arith.remsi %arg3, %c4_i32_19 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %39 = arith.addi %38, %c1_i32_20 : i32
          %40 = arith.cmpi slt, %arg7, %39 : i32
          "simt_step.condition"(%40, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_19 = arith.constant 1 : i32
          %38 = arith.addi %arg0, %c1_i32_19 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %39 = arith.addi %arg7, %c1_i32_20 : i32
          "simt_step.continue"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c4_i32_16 = arith.constant 4 : i32
        %34 = arith.remsi %arg3, %c4_i32_16 : i32
        %35 = "simt_step.switch"(%34, %arg0) ({
        ^bb0(%arg6: i32):
          %c4_i32_19 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_19) {fallthrough = true} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c1_i32_20 = arith.constant 1 : i32
          %39 = arith.addi %arg0, %c1_i32_20 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %c1_i32_21 = arith.constant 1 : i32
          %41 = arith.addi %arg0, %c1_i32_21 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb3(%42: i32):  // no predecessors
          %c3_i32_22 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb3(%36: i32):  // no predecessors
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %38 = arith.remsi %arg3, %c4_i32_19 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %39 = arith.addi %38, %c1_i32_20 : i32
          %40 = arith.cmpi slt, %arg7, %39 : i32
          "simt_step.condition"(%40, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_19 = arith.constant 1 : i32
          %38 = arith.addi %arg7, %c1_i32_19 : i32
          "simt_step.yield"(%arg0, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %29 = arith.remsi %arg3, %c4_i32_11 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %30 = arith.addi %29, %c1_i32_12 : i32
        %31 = arith.cmpi slt, %arg6, %30 : i32
        "simt_step.condition"(%31, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %29 = arith.remsi %arg3, %c4_i32_11 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %30 = arith.addi %arg0, %c4_i32_12 : i32
        %31 = "simt_step.switch"(%29, %30) ({
        ^bb0(%arg7: i32):
          %c0_i32_15 = arith.constant 0 : i32
          %34 = arith.addi %arg0, %c0_i32_15 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c4_i32_16 = arith.constant 4 : i32
          %36 = arith.addi %arg0, %c4_i32_16 : i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%38: i32):  // no predecessors
          %c0_i32_17 = arith.constant 0 : i32
          %39 = arith.addi %arg0, %c0_i32_17 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %c3_i32_13 = arith.constant 3 : i32
        %32 = arith.addi %arg0, %c3_i32_13 : i32
        %c1_i32_14 = arith.constant 1 : i32
        %33 = arith.addi %arg6, %c1_i32_14 : i32
        "simt_step.break"(%31, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%26: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %arg2, %c0_i32_10 : i32
      %28 = "simt_step.if"(%27) ({
        %c0_i32_11 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %arg2, %c0_i32_11 : i32
        %30 = "simt_step.if"(%29) ({
          %c4_i32_12 = arith.constant 4 : i32
          %31 = arith.addi %arg0, %c4_i32_12 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %c4_i32_12 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) : (i32) -> ()
      }, {
        %c0_i32_11 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %arg2, %c0_i32_11 : i32
        %30 = "simt_step.if"(%29) ({
          %c0_i32_13 = arith.constant 0 : i32
          %32 = arith.addi %arg0, %c0_i32_13 : i32
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %c3_i32_13 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_12 = arith.constant 4 : i32
        %31 = arith.addi %arg0, %c4_i32_12 : i32
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_5 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %14 = arith.addi %c32_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_6 = arith.constant 0 : i32
    %15 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
    %16 = arith.select %15, %8, %12 : i32
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
      %c4_i32_7 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_7 : i32
      %12 = arith.addi %11, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %13 = arith.addi %c8_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_8 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %14 = arith.muli %arg5, %c4_i32_10 : i32
        %15 = arith.addi %14, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %16 = arith.addi %c28_i32, %15 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %17, %c0_i32_11 : i32
        "simt_step.condition"(%18, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %17 = arith.muli %arg7, %c4_i32_14 : i32
          %18 = arith.addi %17, %0 : i32
          %c48_i32_15 = arith.constant 48 : i32
          %19 = arith.addi %c48_i32_15, %18 : i32
          %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %21 = arith.cmpi ne, %20, %c0_i32_16 : i32
          "simt_step.condition"(%21, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %17 = arith.addi %arg6, %arg7 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %18 = arith.addi %arg7, %c1_i32_14 : i32
          "simt_step.yield"(%17, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        %15 = arith.addi %arg4, %14#0 : i32
        %c1_i32_13 = arith.constant 1 : i32
        %16 = arith.addi %arg5, %c1_i32_13 : i32
        "simt_step.yield"(%15, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_9 = arith.constant true
      %12 = arith.addi %arg2, %11#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.break"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %6 = arith.addi %c48_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_7 : i32
      %12 = arith.addi %11, %0 : i32
      %c68_i32 = arith.constant 68 : i32
      %13 = arith.addi %c68_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_8 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %11 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %9 = arith.addi %c64_i32, %0 : i32
    %true_6 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

