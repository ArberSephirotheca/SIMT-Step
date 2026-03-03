module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %9 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %10 = "simt_step.if"(%9) ({
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %15 = arith.addi %14, %c1_i32 : i32
          %16 = arith.cmpi slt, %arg6, %15 : i32
          "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32 = arith.constant 1 : i32
          %14 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%arg0, %14) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_6 = arith.constant 3 : i32
        "simt_step.yield"(%13#0) : (i32) -> ()
      }, {
        %c3_i32_4 = arith.constant 3 : i32
        %13 = arith.remsi %arg3, %c3_i32_4 : i32
        %c4_i32 = arith.constant 4 : i32
        %14 = arith.addi %arg0, %c4_i32 : i32
        %15 = "simt_step.switch"(%13, %14) ({
        ^bb0(%arg5: i32):
          %c0_i32_6 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_6) {fallthrough = true} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          %c2_i32_7 = arith.constant 2 : i32
          %17 = arith.addi %arg0, %c2_i32_7 : i32
          "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
        ^bb2(%18: i32):  // no predecessors
          %c3_i32_8 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %c3_i32_5 = arith.constant 3 : i32
        "simt_step.yield"(%15) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb2(%11: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %13 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %13, %c1_i32 : i32
        %15 = arith.cmpi slt, %arg6, %14 : i32
        "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32_7 : i32
          %17 = arith.cmpi slt, %arg8, %16 : i32
          "simt_step.condition"(%17, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c1_i32_7 = arith.constant 1 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %15 = arith.addi %arg8, %c1_i32_8 : i32
          "simt_step.yield"(%c1_i32_7, %15) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32_6 = arith.constant 2 : i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.break"(%13#0, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %7 = arith.select %6, %arg0, %3 : i32
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
    %7 = "simt_step.switch"(%6, %c0_i32_0) ({
    ^bb0(%arg2: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_11 : i32
        %29 = arith.addi %28, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %30 = arith.addi %c12_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_12 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %28 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%23#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c32_i32_9 = arith.constant 32 : i32
      %25 = arith.addi %c32_i32_9, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %27 = "simt_step.switch"(%26, %c3_i32) ({
      ^bb0(%arg3: i32):
        %c36_i32 = arith.constant 36 : i32
        %28 = arith.addi %c36_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_11 : i32
        %31 = "simt_step.if"(%30) ({
          %c4_i32_18 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_18) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %33:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_18 : i32
          %37 = arith.addi %36, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %38 = arith.addi %c40_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_19 : i32
          "simt_step.condition"(%40, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %36 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%34: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_18 : i32
          %37 = arith.addi %36, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %38 = arith.addi %c60_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_19 : i32
          "simt_step.condition"(%40, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %36 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.continue"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c80_i32 = arith.constant 80 : i32
    %10 = arith.addi %c80_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %11, %c0_i32_2 : i32
    %13 = "simt_step.if"(%12) ({
      %23 = simt_step.lane_id
      %24 = arith.index_cast %23 : index to i32
      "simt_step.yield"(%24) : (i32) -> ()
    }, {
      %c84_i32 = arith.constant 84 : i32
      %23 = arith.addi %c84_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_6 : i32
      %26 = "simt_step.if"(%25) ({
        %c88_i32 = arith.constant 88 : i32
        %27 = arith.addi %c88_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_7 = arith.constant 4 : i32
        %29 = arith.addi %0, %c4_i32_7 : i32
        %30 = "simt_step.switch"(%28, %29) ({
        ^bb0(%arg2: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %32 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        "simt_step.yield"(%30) : (i32) -> ()
      }, {
        %c92_i32 = arith.constant 92 : i32
        %27 = arith.addi %c92_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_7 : i32
        %30 = "simt_step.if"(%29) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%26) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %14 = arith.addi %c32_i32, %0 : i32
    %true_3 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c96_i32 = arith.constant 96 : i32
    %16 = arith.addi %c96_i32, %0 : i32
    %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
    %18 = simt_step.subgroup_id
    %19 = arith.index_cast %18 : index to i32
    %20 = "simt_step.switch"(%17, %19) ({
    ^bb0(%arg2: i32):
      %c100_i32 = arith.constant 100 : i32
      %23 = arith.addi %c100_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %25 = arith.addi %0, %c1_i32 : i32
      %26 = "simt_step.switch"(%24, %25) ({
      ^bb0(%arg3: i32):
        %c104_i32 = arith.constant 104 : i32
        %36 = arith.addi %c104_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_15 : i32
        %39 = "simt_step.if"(%38) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c4_i32_20 = arith.constant 4 : i32
          %48 = arith.addi %0, %c4_i32_20 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c108_i32 = arith.constant 108 : i32
        %41 = arith.addi %c108_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_16 : i32
        %44 = "simt_step.if"(%43) ({
          %c3_i32 = arith.constant 3 : i32
          %48 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          %c4_i32_20 = arith.constant 4 : i32
          %48 = arith.addi %0, %c4_i32_20 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb2(%45: i32):  // no predecessors
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %46:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_20 : i32
          %49 = arith.addi %48, %0 : i32
          %c112_i32 = arith.constant 112 : i32
          %50 = arith.addi %c112_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_21 : i32
          "simt_step.condition"(%52, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %48 = arith.addi %arg4, %arg5 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %49 = arith.addi %arg5, %c1_i32_20 : i32
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_19 = arith.constant true
        "simt_step.yield"(%46#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%47: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %28:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_15 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_15 : i32
        %37 = arith.addi %36, %0 : i32
        %c132_i32 = arith.constant 132 : i32
        %38 = arith.addi %c132_i32, %37 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_16 : i32
        "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %36 = arith.addi %arg3, %arg4 : i32
        %c1_i32_15 = arith.constant 1 : i32
        %37 = arith.addi %arg4, %c1_i32_15 : i32
        "simt_step.continue"(%36, %37) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_9 = arith.constant true
      "simt_step.yield"(%28#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%29: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %30:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_15 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_15 : i32
        %37 = arith.addi %36, %0 : i32
        %c152_i32 = arith.constant 152 : i32
        %38 = arith.addi %c152_i32, %37 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_16 : i32
        "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %36 = arith.addi %arg3, %arg4 : i32
        %c1_i32_15 = arith.constant 1 : i32
        %37 = arith.addi %arg4, %c1_i32_15 : i32
        "simt_step.yield"(%36, %37) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_12 = arith.constant true
      "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%31: i32):  // no predecessors
      %c172_i32 = arith.constant 172 : i32
      %32 = arith.addi %c172_i32, %0 : i32
      %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_13 = arith.constant 0 : i32
      %34 = arith.addi %0, %c0_i32_13 : i32
      %35 = "simt_step.switch"(%33, %34) ({
      ^bb0(%arg3: i32):
        %c176_i32 = arith.constant 176 : i32
        %36 = arith.addi %c176_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_15 : i32
        %39 = "simt_step.if"(%38) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c1_i32_16 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_16) {fallthrough = false} : (i32) -> ()
      ^bb2(%41: i32):  // no predecessors
        %c180_i32 = arith.constant 180 : i32
        %42 = arith.addi %c180_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_17 : i32
        %45 = "simt_step.if"(%44) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb3(%46: i32):  // no predecessors
        %c184_i32 = arith.constant 184 : i32
        %47 = arith.addi %c184_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_18 = arith.constant 4 : i32
        %49 = "simt_step.switch"(%48, %c4_i32_18) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %c2_i32_20 = arith.constant 2 : i32
          %51 = arith.addi %0, %c2_i32_20 : i32
          "simt_step.yield"(%51) {fallthrough = true} : (i32) -> ()
        ^bb2(%52: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%53: i32):  // no predecessors
          %c4_i32_21 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_14 = arith.constant true
      "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_4 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %21 = arith.addi %c48_i32, %0 : i32
    %true_5 = arith.constant true
    %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

