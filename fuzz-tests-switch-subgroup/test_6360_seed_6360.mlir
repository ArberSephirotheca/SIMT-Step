module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %7 = "simt_step.switch"(%6, %arg0) ({
      ^bb0(%arg5: i32):
        %c2_i32_5 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32_5 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = "simt_step.switch"(%17, %c1_i32) ({
        ^bb0(%arg6: i32):
          %true_9 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %25 = arith.addi %c0_i32_10, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %true_11 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %28 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          %true_12 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %31 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %24 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %25 = arith.addi %24, %c1_i32_9 : i32
          %26 = arith.cmpi slt, %arg7, %25 : i32
          "simt_step.condition"(%26, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_9 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %25 = arith.muli %arg7, %c4_i32 : i32
          %26 = arith.addi %c48_i32, %25 : i32
          %27 = arith.addi %26, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_10 = arith.constant 1 : i32
          %28 = arith.addi %arg7, %c1_i32_10 : i32
          "simt_step.yield"(%24, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %23 = "simt_step.if"(%22) ({
          %true_9 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %25 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) : (i32) -> ()
        }, {
          %true_9 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %25 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_0 = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
      %c96_i32 = arith.constant 96 : i32
      %9 = arith.addi %c96_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%7) {fallthrough = true} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c0_i32 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %17 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %17, %c1_i32 : i32
        %19 = arith.cmpi slt, %arg6, %18 : i32
        "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c2_i32_5 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32_5 : i32
        %18 = "simt_step.switch"(%17, %arg0) ({
        ^bb0(%arg7: i32):
          %true_6 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32 = arith.constant 4 : i32
          %21 = arith.muli %arg6, %c4_i32 : i32
          %22 = arith.addi %c112_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %true_7 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %26 = arith.muli %arg6, %c4_i32_8 : i32
          %27 = arith.addi %c128_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          %true_9 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %31 = arith.muli %arg6, %c4_i32_10 : i32
          %32 = arith.addi %c144_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %19 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%18, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %14 = "simt_step.if"(%13) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32 : i32
          %20 = arith.cmpi slt, %arg6, %19 : i32
          "simt_step.condition"(%20, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_7 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %c4_i32 = arith.constant 4 : i32
          %19 = arith.muli %arg6, %c4_i32 : i32
          %20 = arith.addi %c160_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %22 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%18, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32 : i32
          %20 = arith.cmpi slt, %arg6, %19 : i32
          "simt_step.condition"(%20, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_7 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %c4_i32 = arith.constant 4 : i32
          %19 = arith.muli %arg6, %c4_i32 : i32
          %20 = arith.addi %c176_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %22 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%18, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
    ^bb3(%15: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %17 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %17, %c1_i32 : i32
        %19 = arith.cmpi slt, %arg6, %18 : i32
        "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true_5 = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %c4_i32 = arith.constant 4 : i32
        %18 = arith.muli %arg6, %c4_i32 : i32
        %19 = arith.addi %c192_i32, %18 : i32
        %20 = arith.addi %19, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%17, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c208_i32 = arith.constant 208 : i32
    %5 = arith.addi %c208_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %13 = arith.addi %c12_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_5 : i32
      %16 = "simt_step.if"(%15) ({
        %c16_i32 = arith.constant 16 : i32
        %19 = arith.addi %c16_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_7 : i32
        %22 = "simt_step.if"(%21) ({
          %25 = simt_step.subgroup_id
          %26 = arith.index_cast %25 : index to i32
          "simt_step.yield"(%26) : (i32) -> ()
        }, {
          %25 = simt_step.subgroup_id
          %26 = arith.index_cast %25 : index to i32
          "simt_step.yield"(%26) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %23 = arith.addi %c224_i32, %0 : i32
        %true_8 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %19 = arith.addi %c20_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_7 : i32
        %22 = "simt_step.if"(%21) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %23 = arith.addi %c240_i32, %0 : i32
        %true_8 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %17 = arith.addi %c256_i32, %0 : i32
      %true_6 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) : (i32) -> ()
    }, {
      %c24_i32 = arith.constant 24 : i32
      %13 = arith.addi %c24_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %15 = simt_step.lane_id
      %16 = arith.index_cast %15 : index to i32
      %17 = "simt_step.switch"(%14, %16) ({
      ^bb0(%arg2: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %31 = arith.muli %arg4, %c4_i32_15 : i32
          %32 = arith.addi %31, %0 : i32
          %c28_i32 = arith.constant 28 : i32
          %33 = arith.addi %c28_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_16 : i32
          "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %31 = arith.addi %arg3, %arg4 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %32 = arith.addi %arg4, %c1_i32_15 : i32
          %true_16 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_17 : i32
          %34 = arith.addi %c272_i32, %33 : i32
          %35 = arith.addi %34, %0 : i32
          %true_18 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%18#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %31 = arith.muli %arg4, %c4_i32_15 : i32
          %32 = arith.addi %31, %0 : i32
          %c48_i32 = arith.constant 48 : i32
          %33 = arith.addi %c48_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_16 : i32
          "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %31 = arith.addi %arg3, %arg4 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %32 = arith.addi %arg4, %c1_i32_15 : i32
          %true_16 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_17 : i32
          %34 = arith.addi %c288_i32, %33 : i32
          %35 = arith.addi %34, %0 : i32
          %true_18 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %21 = arith.addi %c304_i32, %0 : i32
        %true_10 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %0, %c1_i32 : i32
        %true_11 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %25 = arith.addi %c320_i32, %0 : i32
        %true_12 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb3(%27: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %28 = arith.addi %0, %c2_i32 : i32
        %true_13 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %29 = arith.addi %c336_i32, %0 : i32
        %true_14 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%17) : (i32) -> ()
    }) : (i1) -> i32
    %c352_i32 = arith.constant 352 : i32
    %9 = arith.addi %c352_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_5 : i32
      %14 = arith.addi %13, %0 : i32
      %c68_i32 = arith.constant 68 : i32
      %15 = arith.addi %c68_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_6 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %13 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c368_i32 = arith.constant 368 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_6 : i32
      %16 = arith.addi %c368_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_7 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %12:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_5 : i32
      %14 = arith.addi %13, %0 : i32
      %c88_i32 = arith.constant 88 : i32
      %15 = arith.addi %c88_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_6 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %13 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c384_i32 = arith.constant 384 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_6 : i32
      %16 = arith.addi %c384_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_7 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

