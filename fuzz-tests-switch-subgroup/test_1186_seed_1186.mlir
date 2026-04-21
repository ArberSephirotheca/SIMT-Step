module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32 = arith.constant 0 : i32
      %5 = arith.addi %c0_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      %7 = arith.remsi %arg3, %c4_i32 : i32
      %c4_i32_0 = arith.constant 4 : i32
      %8 = arith.addi %arg0, %c4_i32_0 : i32
      %9 = "simt_step.switch"(%7, %8) ({
      ^bb0(%arg5: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %24 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32 = arith.constant 1 : i32
          %25 = arith.addi %24, %c1_i32 : i32
          %26 = arith.cmpi slt, %arg7, %25 : i32
          "simt_step.condition"(%26, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_7 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %25 = arith.muli %arg7, %c4_i32_8 : i32
          %26 = arith.addi %c16_i32, %25 : i32
          %27 = arith.addi %26, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%24, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %16 = arith.remsi %arg3, %c2_i32 : i32
        %c3_i32_3 = arith.constant 3 : i32
        %17 = arith.addi %arg0, %c3_i32_3 : i32
        %18 = "simt_step.switch"(%16, %17) ({
        ^bb0(%arg6: i32):
          %true_7 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %25 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %true_8 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %28 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          %true_9 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %31 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb2(%19: i32):  // no predecessors
        %true_4 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %21 = arith.addi %c80_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
      ^bb3(%22: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %24 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32 = arith.constant 1 : i32
          %25 = arith.addi %24, %c1_i32 : i32
          %26 = arith.cmpi slt, %arg7, %25 : i32
          "simt_step.condition"(%26, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_7 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %25 = arith.muli %arg7, %c4_i32_8 : i32
          %26 = arith.addi %c96_i32, %25 : i32
          %27 = arith.addi %26, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%24, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%9) {fallthrough = true} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %11 = simt_step.subgroup_id
      %12 = arith.index_cast %11 : index to i32
      %13 = "simt_step.switch"(%arg3, %12) ({
      ^bb0(%arg5: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32_5 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32 : i32
          %19 = arith.cmpi slt, %arg7, %18 : i32
          "simt_step.condition"(%19, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_5 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %18 = arith.muli %arg7, %c4_i32_6 : i32
          %19 = arith.addi %c112_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%17, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32_5 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32 : i32
          %19 = arith.cmpi slt, %arg7, %18 : i32
          "simt_step.condition"(%19, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_5 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %18 = arith.muli %arg7, %c4_i32_6 : i32
          %19 = arith.addi %c128_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%17, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
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
      %c4_i32_5 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_5 : i32
      %15 = arith.addi %14, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %16 = arith.addi %c8_i32, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_6 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %14 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_6 : i32
      %17 = arith.addi %c144_i32, %16 : i32
      %18 = arith.addi %17, %0 : i32
      %true_7 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_5 : i32
      %15 = arith.addi %14, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %16 = arith.addi %c28_i32, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_6 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %14 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_6 : i32
      %17 = arith.addi %c160_i32, %16 : i32
      %18 = arith.addi %17, %0 : i32
      %true_7 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c48_i32 = arith.constant 48 : i32
    %7 = arith.addi %c48_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %9 = simt_step.lane_id
    %10 = arith.index_cast %9 : index to i32
    %11 = "simt_step.switch"(%8, %10) ({
    ^bb0(%arg2: i32):
      %c52_i32 = arith.constant 52 : i32
      %14 = arith.addi %c52_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %16 = simt_step.lane_id
      %17 = arith.index_cast %16 : index to i32
      %18 = "simt_step.switch"(%15, %17) ({
      ^bb0(%arg3: i32):
        %c56_i32 = arith.constant 56 : i32
        %27 = arith.addi %c56_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_9 : i32
        %30 = "simt_step.if"(%29) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %31 = arith.addi %c176_i32, %0 : i32
        %true_10 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %33 = arith.addi %c192_i32, %0 : i32
        %true_12 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_20 : i32
          %49 = arith.addi %48, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %50 = arith.addi %c60_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_21 : i32
          "simt_step.condition"(%52, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %48 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %49 = arith.addi %arg5, %c1_i32 : i32
          %true_20 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_21 : i32
          %51 = arith.addi %c208_i32, %50 : i32
          %52 = arith.addi %51, %0 : i32
          %true_22 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %38 = arith.addi %0, %c0_i32_15 : i32
        "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
      ^bb3(%39: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %40 = arith.addi %c80_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_16 : i32
        %43 = "simt_step.if"(%42) ({
          %c2_i32 = arith.constant 2 : i32
          %48 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %44 = arith.addi %c224_i32, %0 : i32
        %true_17 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_18 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %46 = arith.addi %c240_i32, %0 : i32
        %true_19 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %19 = arith.addi %c256_i32, %0 : i32
      %true_6 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_7 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %21 = arith.addi %c272_i32, %0 : i32
      %true_8 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %24 = arith.addi %c84_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = "simt_step.switch"(%25, %0) ({
      ^bb0(%arg3: i32):
        %c88_i32 = arith.constant 88 : i32
        %27 = arith.addi %c88_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %29 = arith.addi %0, %c0_i32_9 : i32
        %30 = "simt_step.switch"(%28, %29) ({
        ^bb0(%arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %44 = arith.addi %0, %c4_i32_16 : i32
          %true_17 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %45 = arith.addi %c288_i32, %0 : i32
          %true_18 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = true} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %31 = arith.addi %c304_i32, %0 : i32
        %true_11 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %33 = arith.addi %c320_i32, %0 : i32
        %true_13 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %36 = arith.addi %c92_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %38 = arith.addi %0, %c2_i32 : i32
        %39 = "simt_step.switch"(%37, %38) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %c4_i32_16 = arith.constant 4 : i32
          %45 = arith.addi %0, %c4_i32_16 : i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb2(%46: i32):  // no predecessors
          %47 = simt_step.subgroup_id
          %48 = arith.index_cast %47 : index to i32
          %true_17 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %49 = arith.addi %c336_i32, %0 : i32
          %true_18 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48) {fallthrough = true} : (i32) -> ()
        ^bb3(%51: i32):  // no predecessors
          %52 = simt_step.subgroup_id
          %53 = arith.index_cast %52 : index to i32
          %true_19 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %54 = arith.addi %c352_i32, %0 : i32
          %true_20 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        %41 = arith.addi %0, %c1_i32 : i32
        %true_14 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %42 = arith.addi %c368_i32, %0 : i32
        %true_15 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c384_i32 = arith.constant 384 : i32
    %12 = arith.addi %c384_i32, %0 : i32
    %true_4 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

