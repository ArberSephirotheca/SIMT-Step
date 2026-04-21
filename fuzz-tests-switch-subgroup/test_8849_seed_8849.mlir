module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c2_i32 = arith.constant 2 : i32
    %2 = arith.remsi %arg3, %c2_i32 : i32
    %3 = simt_step.lane_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %8 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %9 = "simt_step.if"(%8) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32 : i32
          %21 = arith.cmpi slt, %arg6, %20 : i32
          "simt_step.condition"(%21, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_8 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.muli %arg6, %c4_i32 : i32
          %21 = arith.addi %c16_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%19, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%18#0) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %19 = "simt_step.if"(%18) ({
          %true_7 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %21 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %21 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %18 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %19 = arith.addi %18, %c1_i32 : i32
        %20 = arith.cmpi slt, %arg6, %19 : i32
        "simt_step.condition"(%20, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c3_i32_6 = arith.constant 3 : i32
        %18 = arith.remsi %arg3, %c3_i32_6 : i32
        %19 = simt_step.subgroup_id
        %20 = arith.index_cast %19 : index to i32
        %21 = "simt_step.switch"(%18, %20) ({
        ^bb0(%arg7: i32):
          %true_7 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %24 = arith.muli %arg6, %c4_i32 : i32
          %25 = arith.addi %c64_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %true_8 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %29 = arith.muli %arg6, %c4_i32_9 : i32
          %30 = arith.addi %c80_i32, %29 : i32
          %31 = arith.addi %30, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          %true_10 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %34 = arith.muli %arg6, %c4_i32_11 : i32
          %35 = arith.addi %c96_i32, %34 : i32
          %36 = arith.addi %35, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      %c2_i32_4 = arith.constant 2 : i32
      %13 = arith.remsi %arg3, %c2_i32_4 : i32
      %c3_i32 = arith.constant 3 : i32
      %14 = arith.addi %arg0, %c3_i32 : i32
      %15 = "simt_step.switch"(%13, %14) ({
      ^bb0(%arg5: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %19 = "simt_step.if"(%18) ({
          %true_9 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %23 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          %true_9 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %23 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32 : i32
          %24 = arith.cmpi slt, %arg7, %23 : i32
          "simt_step.condition"(%24, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_9 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32 = arith.constant 4 : i32
          %23 = arith.muli %arg7, %c4_i32 : i32
          %24 = arith.addi %c144_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%22, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      %c160_i32 = arith.constant 160 : i32
      %17 = arith.addi %c160_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %7 = arith.select %6, %0, %5 : i32
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
    %c1_i32 = arith.constant 1 : i32
    %c4_i32_0 = arith.constant 4 : i32
    %5 = arith.addi %0, %c4_i32_0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_3 : i32
      %13 = arith.addi %12, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %14 = arith.addi %c8_i32, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_4 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %12 = simt_step.lane_id
      %13 = arith.index_cast %12 : index to i32
      %14 = arith.addi %arg2, %13 : i32
      %c1_i32_3 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32_3 : i32
      %true = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_4 : i32
      %17 = arith.addi %c176_i32, %16 : i32
      %18 = arith.addi %17, %0 : i32
      %true_5 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %7 = arith.addi %c28_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %9 = simt_step.lane_id
    %10 = arith.index_cast %9 : index to i32
    %11 = "simt_step.switch"(%8, %10) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %21 = arith.muli %arg4, %c4_i32_12 : i32
        %22 = arith.addi %21, %0 : i32
        %c32_i32 = arith.constant 32 : i32
        %23 = arith.addi %c32_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_13 : i32
        "simt_step.condition"(%25, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %28 = arith.muli %arg6, %c4_i32_18 : i32
          %29 = arith.addi %28, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %30 = arith.addi %c52_i32, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_19 : i32
          "simt_step.condition"(%32, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %28 = arith.addi %arg5, %arg6 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %29 = arith.addi %arg6, %c1_i32_18 : i32
          %true_19 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %30 = arith.muli %arg6, %c4_i32_20 : i32
          %31 = arith.addi %c192_i32, %30 : i32
          %32 = arith.addi %31, %0 : i32
          %true_21 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %22 = arith.addi %arg3, %21#0 : i32
        %c1_i32_14 = arith.constant 1 : i32
        %23 = arith.addi %arg4, %c1_i32_14 : i32
        %true_15 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %c4_i32_16 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_16 : i32
        %25 = arith.addi %c208_i32, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_17 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %13 = arith.addi %c224_i32, %0 : i32
      %true_5 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %21 = arith.muli %arg4, %c4_i32_12 : i32
        %22 = arith.addi %21, %0 : i32
        %c72_i32 = arith.constant 72 : i32
        %23 = arith.addi %c72_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_13 : i32
        "simt_step.condition"(%25, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %28 = arith.muli %arg6, %c4_i32_18 : i32
          %29 = arith.addi %28, %0 : i32
          %c92_i32 = arith.constant 92 : i32
          %30 = arith.addi %c92_i32, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_19 : i32
          "simt_step.condition"(%32, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %28 = arith.addi %arg5, %arg6 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %29 = arith.addi %arg6, %c1_i32_18 : i32
          %true_19 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %30 = arith.muli %arg6, %c4_i32_20 : i32
          %31 = arith.addi %c240_i32, %30 : i32
          %32 = arith.addi %31, %0 : i32
          %true_21 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %22 = arith.addi %arg3, %21#0 : i32
        %c1_i32_14 = arith.constant 1 : i32
        %23 = arith.addi %arg4, %c1_i32_14 : i32
        %true_15 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %c4_i32_16 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_16 : i32
        %25 = arith.addi %c256_i32, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_17 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %17 = arith.addi %c272_i32, %0 : i32
      %true_9 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%19: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %21 = arith.muli %arg4, %c4_i32_12 : i32
        %22 = arith.addi %21, %0 : i32
        %c112_i32 = arith.constant 112 : i32
        %23 = arith.addi %c112_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_13 : i32
        "simt_step.condition"(%25, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c132_i32 = arith.constant 132 : i32
        %21 = arith.addi %c132_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_12 = arith.constant 4 : i32
        %23 = "simt_step.switch"(%22, %c4_i32_12) ({
        ^bb0(%arg5: i32):
          %c1_i32_17 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_17) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %32 = simt_step.subgroup_id
          %33 = arith.index_cast %32 : index to i32
          %true_18 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %34 = arith.addi %c288_i32, %0 : i32
          %true_19 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %24 = arith.addi %arg3, %23 : i32
        %c1_i32_13 = arith.constant 1 : i32
        %25 = arith.addi %arg4, %c1_i32_13 : i32
        %true_14 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %c4_i32_15 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_15 : i32
        %27 = arith.addi %c304_i32, %26 : i32
        %28 = arith.addi %27, %0 : i32
        %true_16 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

