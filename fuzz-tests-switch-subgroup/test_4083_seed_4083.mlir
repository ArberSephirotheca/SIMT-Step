module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = simt_step.lane_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %c0_i32_0 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %10, %c1_i32 : i32
        %12 = arith.cmpi slt, %arg6, %11 : i32
        "simt_step.condition"(%12, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_5 = arith.constant 1 : i32
          %13 = arith.addi %12, %c1_i32_5 : i32
          %14 = arith.cmpi slt, %arg8, %13 : i32
          "simt_step.condition"(%14, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_5 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.muli %arg8, %c4_i32 : i32
          %14 = arith.addi %c0_i32_6, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_7 = arith.constant 1 : i32
          %16 = arith.addi %arg8, %c1_i32_7 : i32
          "simt_step.yield"(%12, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%10#0, %11) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%4#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %10, %c1_i32 : i32
        %12 = arith.cmpi slt, %arg6, %11 : i32
        "simt_step.condition"(%12, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c3_i32 = arith.constant 3 : i32
        %10 = "simt_step.switch"(%arg3, %c3_i32) ({
        ^bb0(%arg7: i32):
          %true_4 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_5 = arith.constant 4 : i32
          %17 = arith.muli %arg6, %c4_i32_5 : i32
          %18 = arith.addi %c16_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %true_6 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %22 = arith.muli %arg6, %c4_i32_7 : i32
          %23 = arith.addi %c32_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_3 = arith.constant true
        %11 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.muli %arg6, %c4_i32 : i32
        %13 = arith.addi %c48_i32, %12 : i32
        %14 = arith.addi %13, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%10, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%6#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%7: i32):  // no predecessors
      %true = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %9 = arith.addi %c64_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
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
      %c4_i32_2 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_2 : i32
      %13 = arith.addi %12, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %14 = arith.addi %c8_i32, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_3 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %19 = arith.muli %arg5, %c4_i32_7 : i32
        %20 = arith.addi %19, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %21 = arith.addi %c28_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_8 : i32
        "simt_step.condition"(%23, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c48_i32 = arith.constant 48 : i32
        %19 = arith.addi %c48_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_7 : i32
        %22 = "simt_step.if"(%21) ({
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) : (i32) -> ()
        }, {
          %c1_i32_13 = arith.constant 1 : i32
          %31 = arith.addi %0, %c1_i32_13 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %23 = arith.addi %c80_i32, %0 : i32
        %true_8 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %25 = arith.addi %arg4, %22 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %26 = arith.addi %arg5, %c1_i32_9 : i32
        %true_10 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %27 = arith.muli %arg5, %c4_i32_11 : i32
        %28 = arith.addi %c96_i32, %27 : i32
        %29 = arith.addi %28, %0 : i32
        %true_12 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %13 = arith.addi %arg2, %12#0 : i32
      %c1_i32_4 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32_4 : i32
      %true = arith.constant true
      %c112_i32 = arith.constant 112 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_5 : i32
      %16 = arith.addi %c112_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_6 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c52_i32 = arith.constant 52 : i32
    %6 = arith.addi %c52_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %8 = arith.addi %0, %c1_i32 : i32
    %9 = "simt_step.switch"(%7, %8) ({
    ^bb0(%arg2: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_10 : i32
        %24 = arith.addi %23, %0 : i32
        %c56_i32 = arith.constant 56 : i32
        %25 = arith.addi %c56_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_11 : i32
        "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c76_i32 = arith.constant 76 : i32
        %23 = arith.addi %c76_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %25 = "simt_step.switch"(%24, %0) ({
        ^bb0(%arg5: i32):
          %32 = simt_step.subgroup_id
          %33 = arith.index_cast %32 : index to i32
          %true_14 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %34 = arith.addi %c128_i32, %0 : i32
          %true_15 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %37 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          %true_16 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %39 = arith.addi %c144_i32, %0 : i32
          %true_17 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %26 = arith.addi %arg3, %25 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %27 = arith.addi %arg4, %c1_i32_10 : i32
        %true_11 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_12 : i32
        %29 = arith.addi %c160_i32, %28 : i32
        %30 = arith.addi %29, %0 : i32
        %true_13 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %13 = arith.addi %c176_i32, %0 : i32
      %true_4 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_10 : i32
        %24 = arith.addi %23, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %25 = arith.addi %c80_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_11 : i32
        "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %23 = arith.addi %arg3, %arg4 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %24 = arith.addi %arg4, %c1_i32_10 : i32
        %true_11 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_12 : i32
        %26 = arith.addi %c192_i32, %25 : i32
        %27 = arith.addi %26, %0 : i32
        %true_13 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%17: i32):  // no predecessors
      %c100_i32 = arith.constant 100 : i32
      %18 = arith.addi %c100_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_7 = arith.constant 4 : i32
      %20 = "simt_step.switch"(%19, %c4_i32_7) ({
      ^bb0(%arg3: i32):
        %c104_i32 = arith.constant 104 : i32
        %23 = arith.addi %c104_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_10 = arith.constant 1 : i32
        %25 = arith.addi %0, %c1_i32_10 : i32
        %26 = "simt_step.switch"(%24, %25) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          %true_17 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %33 = arith.addi %c208_i32, %0 : i32
          %true_18 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %37 = simt_step.subgroup_id
          %38 = arith.index_cast %37 : index to i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb3(%39: i32):  // no predecessors
          %c0_i32_19 = arith.constant 0 : i32
          %40 = arith.addi %0, %c0_i32_19 : i32
          %true_20 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %41 = arith.addi %c224_i32, %0 : i32
          %true_21 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %33 = arith.muli %arg5, %c4_i32_17 : i32
          %34 = arith.addi %33, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %35 = arith.addi %c108_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_18 : i32
          "simt_step.condition"(%37, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %33 = arith.addi %arg4, %arg5 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %34 = arith.addi %arg5, %c1_i32_17 : i32
          %true_18 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %35 = arith.muli %arg5, %c4_i32_19 : i32
          %36 = arith.addi %c240_i32, %35 : i32
          %37 = arith.addi %36, %0 : i32
          %true_20 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %29 = arith.addi %c256_i32, %0 : i32
        %true_14 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%31: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %33 = arith.muli %arg5, %c4_i32_17 : i32
          %34 = arith.addi %33, %0 : i32
          %c128_i32 = arith.constant 128 : i32
          %35 = arith.addi %c128_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_18 : i32
          "simt_step.condition"(%37, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %33 = arith.addi %arg4, %arg5 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %34 = arith.addi %arg5, %c1_i32_17 : i32
          %true_18 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %35 = arith.muli %arg5, %c4_i32_19 : i32
          %36 = arith.addi %c272_i32, %35 : i32
          %37 = arith.addi %36, %0 : i32
          %true_20 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %21 = arith.addi %c288_i32, %0 : i32
      %true_9 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %10 = simt_step.subgroup_id
    %11 = arith.index_cast %10 : index to i32
    return
  }
}

