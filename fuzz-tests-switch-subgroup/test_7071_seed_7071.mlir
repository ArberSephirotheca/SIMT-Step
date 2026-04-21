module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c3_i32_0 = arith.constant 3 : i32
      %4 = arith.remsi %arg3, %c3_i32_0 : i32
      %5 = "simt_step.switch"(%4, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_7 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %26 = arith.muli %arg7, %c4_i32 : i32
          %27 = arith.addi %c0_i32_8, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%25, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %true_4 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %22 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_7 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %26 = arith.muli %arg7, %c4_i32 : i32
          %27 = arith.addi %c32_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.break"(%25, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c0_i32 = arith.constant 0 : i32
      %7 = arith.cmpi ne, %arg2, %c0_i32 : i32
      %8 = "simt_step.if"(%7) ({
        %c4_i32 = arith.constant 4 : i32
        %19 = arith.remsi %arg3, %c4_i32 : i32
        %c2_i32_2 = arith.constant 2 : i32
        %20 = "simt_step.switch"(%19, %c2_i32_2) ({
        ^bb0(%arg5: i32):
          %true_3 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %22 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %true_4 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %25 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %true_5 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %28 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb3(%29: i32):  // no predecessors
          %true_6 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %31 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%20) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32 : i32
          %22 = arith.cmpi slt, %arg6, %21 : i32
          "simt_step.condition"(%22, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_4 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32 = arith.constant 4 : i32
          %21 = arith.muli %arg6, %c4_i32 : i32
          %22 = arith.addi %c112_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%20, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %10 = arith.remsi %arg3, %c2_i32 : i32
      %11 = simt_step.subgroup_id
      %12 = arith.index_cast %11 : index to i32
      %13 = "simt_step.switch"(%10, %12) ({
      ^bb0(%arg5: i32):
        %true_2 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %20 = arith.addi %c128_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %23 = "simt_step.if"(%22) ({
          %true_5 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %28 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) : (i32) -> ()
        }, {
          %true_5 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %28 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        %true_4 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %26 = arith.addi %c176_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c192_i32 = arith.constant 192 : i32
      %15 = arith.addi %c192_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb3(%16: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %18 = "simt_step.if"(%17) ({
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32 : i32
          %22 = arith.cmpi slt, %arg6, %21 : i32
          "simt_step.condition"(%22, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_4 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %c4_i32 = arith.constant 4 : i32
          %21 = arith.muli %arg6, %c4_i32 : i32
          %22 = arith.addi %c208_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.break"(%20, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %20 = "simt_step.if"(%19) ({
          %true_3 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %22 = arith.addi %c224_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) : (i32) -> ()
        }, {
          %true_3 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %22 = arith.addi %c240_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%20) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
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
      %c4_i32_6 = arith.constant 4 : i32
      %8 = arith.muli %arg3, %c4_i32_6 : i32
      %9 = arith.addi %8, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %10 = arith.addi %c8_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_7 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %15 = arith.muli %arg5, %c4_i32_10 : i32
        %16 = arith.addi %15, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %17 = arith.addi %c28_i32, %16 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_11 : i32
        "simt_step.condition"(%19, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %15 = arith.addi %arg4, %arg5 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %16 = arith.addi %arg5, %c1_i32_10 : i32
        %true_11 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %17 = arith.muli %arg5, %c4_i32_12 : i32
        %18 = arith.addi %c256_i32, %17 : i32
        %19 = arith.addi %18, %0 : i32
        %true_13 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %9 = arith.addi %arg2, %8#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_8 : i32
      %12 = arith.addi %c272_i32, %11 : i32
      %13 = arith.addi %12, %0 : i32
      %true_9 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%9, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %8 = arith.muli %arg3, %c4_i32_6 : i32
      %9 = arith.addi %8, %0 : i32
      %c48_i32 = arith.constant 48 : i32
      %10 = arith.addi %c48_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_7 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %8 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %10 = arith.muli %arg3, %c4_i32_6 : i32
      %11 = arith.addi %c288_i32, %10 : i32
      %12 = arith.addi %11, %0 : i32
      %true_7 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %8 = arith.muli %arg3, %c4_i32_6 : i32
      %9 = arith.addi %8, %0 : i32
      %c68_i32 = arith.constant 68 : i32
      %10 = arith.addi %c68_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_7 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %15 = arith.muli %arg5, %c4_i32_10 : i32
        %16 = arith.addi %15, %0 : i32
        %c88_i32 = arith.constant 88 : i32
        %17 = arith.addi %c88_i32, %16 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_11 : i32
        "simt_step.condition"(%19, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c108_i32 = arith.constant 108 : i32
        %15 = arith.addi %c108_i32, %0 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %17 = "simt_step.switch"(%16, %0) ({
        ^bb0(%arg6: i32):
          %c2_i32 = arith.constant 2 : i32
          %24 = arith.addi %0, %c2_i32 : i32
          %true_14 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %25 = arith.addi %c304_i32, %0 : i32
          %true_15 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %c0_i32_16 = arith.constant 0 : i32
          %28 = arith.addi %0, %c0_i32_16 : i32
          %true_17 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %29 = arith.addi %c320_i32, %0 : i32
          %true_18 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %c1_i32_19 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_19) {fallthrough = false} : (i32) -> ()
        ^bb3(%32: i32):  // no predecessors
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          %true_20 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %35 = arith.addi %c336_i32, %0 : i32
          %true_21 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %18 = arith.addi %arg4, %17 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %19 = arith.addi %arg5, %c1_i32_10 : i32
        %true_11 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %20 = arith.muli %arg5, %c4_i32_12 : i32
        %21 = arith.addi %c352_i32, %20 : i32
        %22 = arith.addi %21, %0 : i32
        %true_13 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%18, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %9 = arith.addi %arg2, %8#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c368_i32 = arith.constant 368 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_8 : i32
      %12 = arith.addi %c368_i32, %11 : i32
      %13 = arith.addi %12, %0 : i32
      %true_9 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%9, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

