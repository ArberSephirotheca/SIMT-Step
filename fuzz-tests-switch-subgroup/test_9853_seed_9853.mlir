module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.subgroup_id
    %1 = arith.index_cast %0 : index to i32
    %2 = "simt_step.switch"(%arg3, %1) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      %3 = arith.remsi %arg3, %c3_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %4 = arith.addi %arg0, %c1_i32 : i32
      %5 = "simt_step.switch"(%3, %4) ({
      ^bb0(%arg5: i32):
        %c0_i32 = arith.constant 0 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %11:2 = "simt_step.loop"(%c0_i32, %c0_i32_1) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32_6 : i32
          %18 = arith.cmpi slt, %arg7, %17 : i32
          "simt_step.condition"(%18, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.muli %arg7, %c4_i32 : i32
          %18 = arith.addi %c0_i32_6, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_7 = arith.constant 1 : i32
          %20 = arith.addi %arg7, %c1_i32_7 : i32
          "simt_step.yield"(%16, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%11#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32_6 : i32
          %18 = arith.cmpi slt, %arg7, %17 : i32
          "simt_step.condition"(%18, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.muli %arg7, %c4_i32 : i32
          %18 = arith.addi %c16_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_6 = arith.constant 1 : i32
          %20 = arith.addi %arg7, %c1_i32_6 : i32
          "simt_step.yield"(%16, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32_6 : i32
          %18 = arith.cmpi slt, %arg7, %17 : i32
          "simt_step.condition"(%18, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.muli %arg7, %c4_i32 : i32
          %18 = arith.addi %c32_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_6 = arith.constant 1 : i32
          %20 = arith.addi %arg7, %c1_i32_6 : i32
          "simt_step.yield"(%16, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c3_i32_0 = arith.constant 3 : i32
      %7 = arith.remsi %arg3, %c3_i32_0 : i32
      %8 = simt_step.lane_id
      %9 = arith.index_cast %8 : index to i32
      %10 = "simt_step.switch"(%7, %9) ({
      ^bb0(%arg5: i32):
        %c0_i32 = arith.constant 0 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %11:2 = "simt_step.loop"(%c0_i32, %c0_i32_1) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32_4 : i32
          %19 = arith.cmpi slt, %arg7, %18 : i32
          "simt_step.condition"(%19, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_4 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.muli %arg7, %c4_i32 : i32
          %19 = arith.addi %c48_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_5 = arith.constant 1 : i32
          %21 = arith.addi %arg7, %c1_i32_5 : i32
          "simt_step.continue"(%17, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %true = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %14 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb2(%15: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32_4 : i32
          %19 = arith.cmpi slt, %arg7, %18 : i32
          "simt_step.condition"(%19, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_4 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.muli %arg7, %c4_i32 : i32
          %19 = arith.addi %c80_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_5 = arith.constant 1 : i32
          %21 = arith.addi %arg7, %c1_i32_5 : i32
          "simt_step.yield"(%17, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
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
      %15 = arith.addi %c12_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %17 = simt_step.subgroup_id
      %18 = arith.index_cast %17 : index to i32
      %19 = "simt_step.switch"(%16, %18) ({
      ^bb0(%arg2: i32):
        %22 = simt_step.subgroup_id
        %23 = arith.index_cast %22 : index to i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %28 = arith.muli %arg4, %c4_i32_9 : i32
          %29 = arith.addi %28, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %30 = arith.addi %c16_i32, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_10 : i32
          "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %28 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %30 = arith.muli %arg4, %c4_i32_10 : i32
          %31 = arith.addi %c96_i32, %30 : i32
          %32 = arith.addi %31, %0 : i32
          %true_11 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %26 = arith.addi %c112_i32, %0 : i32
        %true_8 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %20 = arith.addi %c128_i32, %0 : i32
      %true_4 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) : (i32) -> ()
    }, {
      %c36_i32 = arith.constant 36 : i32
      %15 = arith.addi %c36_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_3 : i32
      %18 = "simt_step.if"(%17) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %22 = arith.muli %arg3, %c4_i32_7 : i32
          %23 = arith.addi %22, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %24 = arith.addi %c40_i32, %23 : i32
          %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %26 = arith.cmpi ne, %25, %c0_i32_8 : i32
          "simt_step.condition"(%26, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %22 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %arg3, %c1_i32 : i32
          %true_7 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %24 = arith.muli %arg3, %c4_i32_8 : i32
          %25 = arith.addi %c144_i32, %24 : i32
          %26 = arith.addi %25, %0 : i32
          %true_9 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) : (i32) -> ()
      }, {
        %c60_i32 = arith.constant 60 : i32
        %21 = arith.addi %c60_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_5 : i32
        %24 = "simt_step.if"(%23) ({
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%27) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %25 = arith.addi %c160_i32, %0 : i32
        %true_6 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      %c176_i32 = arith.constant 176 : i32
      %19 = arith.addi %c176_i32, %0 : i32
      %true_4 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) : (i32) -> ()
    }) : (i1) -> i32
    %c192_i32 = arith.constant 192 : i32
    %9 = arith.addi %c192_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c64_i32 = arith.constant 64 : i32
    %11 = arith.addi %c64_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c3_i32 = arith.constant 3 : i32
    %13 = "simt_step.switch"(%12, %c3_i32) ({
    ^bb0(%arg2: i32):
      %c68_i32 = arith.constant 68 : i32
      %15 = arith.addi %c68_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_3 : i32
      %18 = "simt_step.if"(%17) ({
        %c0_i32_12 = arith.constant 0 : i32
        %36 = arith.addi %0, %c0_i32_12 : i32
        "simt_step.yield"(%36) : (i32) -> ()
      }, {
        %c72_i32 = arith.constant 72 : i32
        %36 = arith.addi %c72_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = "simt_step.switch"(%37, %0) ({
        ^bb0(%arg3: i32):
          %c1_i32_12 = arith.constant 1 : i32
          %39 = arith.addi %0, %c1_i32_12 : i32
          %true_13 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %40 = arith.addi %c208_i32, %0 : i32
          %true_14 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c3_i32_15 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_15) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%38) : (i32) -> ()
      }) : (i1) -> i32
      %c224_i32 = arith.constant 224 : i32
      %19 = arith.addi %c224_i32, %0 : i32
      %true_4 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %21 = arith.addi %c240_i32, %0 : i32
      %true_6 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %24 = arith.addi %c76_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %26 = arith.addi %0, %c1_i32 : i32
      %27 = "simt_step.switch"(%25, %26) ({
      ^bb0(%arg3: i32):
        %c80_i32 = arith.constant 80 : i32
        %36 = arith.addi %c80_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = simt_step.lane_id
        %39 = arith.index_cast %38 : index to i32
        %40 = "simt_step.switch"(%37, %39) ({
        ^bb0(%arg4: i32):
          %58 = simt_step.lane_id
          %59 = arith.index_cast %58 : index to i32
          "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
        ^bb1(%60: i32):  // no predecessors
          %61 = simt_step.lane_id
          %62 = arith.index_cast %61 : index to i32
          %true_19 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %63 = arith.addi %c256_i32, %0 : i32
          %true_20 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        ^bb2(%65: i32):  // no predecessors
          %c4_i32_21 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_21) {fallthrough = false} : (i32) -> ()
        ^bb3(%66: i32):  // no predecessors
          %c0_i32_22 = arith.constant 0 : i32
          %67 = arith.addi %0, %c0_i32_22 : i32
          "simt_step.yield"(%67) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb1(%41: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %42 = arith.addi %c84_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_12 : i32
        %45 = "simt_step.if"(%44) ({
          %c0_i32_19 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_19) : (i32) -> ()
        }, {
          %c3_i32_19 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_19) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %46 = arith.addi %c272_i32, %0 : i32
        %true_13 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_14 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %48 = arith.addi %c288_i32, %0 : i32
        %true_15 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb2(%50: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %51 = arith.addi %c88_i32, %0 : i32
        %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %53 = arith.cmpi ne, %52, %c0_i32_16 : i32
        %54 = "simt_step.if"(%53) ({
          %58 = simt_step.subgroup_id
          %59 = arith.index_cast %58 : index to i32
          "simt_step.yield"(%59) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %55 = arith.addi %c304_i32, %0 : i32
        %true_17 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
      ^bb3(%57: i32):  // no predecessors
        %c3_i32_18 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_18) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %29 = arith.addi %c92_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32_7 = arith.constant 1 : i32
      %31 = "simt_step.switch"(%30, %c1_i32_7) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c1_i32_12 = arith.constant 1 : i32
        %true_13 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %37 = arith.addi %c320_i32, %0 : i32
        %true_14 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c1_i32_12) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      %c336_i32 = arith.constant 336 : i32
      %32 = arith.addi %c336_i32, %0 : i32
      %true_9 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_10 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %34 = arith.addi %c352_i32, %0 : i32
      %true_11 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %14:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_3 : i32
      %16 = arith.addi %15, %0 : i32
      %c96_i32 = arith.constant 96 : i32
      %17 = arith.addi %c96_i32, %16 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_4 : i32
      "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %15 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %arg3, %c1_i32 : i32
      %true_3 = arith.constant true
      %c368_i32 = arith.constant 368 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_4 : i32
      %18 = arith.addi %c368_i32, %17 : i32
      %19 = arith.addi %18, %0 : i32
      %true_5 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15, %16) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

