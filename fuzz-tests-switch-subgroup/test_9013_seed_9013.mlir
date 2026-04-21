module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %3 = "simt_step.if"(%2) ({
      %true_4 = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %11 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) : (i32) -> ()
    }, {
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %11, %c1_i32 : i32
        %13 = arith.cmpi slt, %arg5, %12 : i32
        "simt_step.condition"(%13, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %true_6 = arith.constant true
        %11 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.muli %arg5, %c4_i32 : i32
        %13 = arith.addi %c32_i32, %12 : i32
        %14 = arith.addi %13, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.break"(%11, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%10#0) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %0, %3 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %7 = "simt_step.if"(%6) ({
      %true_4 = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %11 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) : (i32) -> ()
    }, {
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %11, %c1_i32 : i32
        %13 = arith.cmpi slt, %arg5, %12 : i32
        "simt_step.condition"(%13, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %12 = "simt_step.switch"(%11, %c0_i32_6) ({
        ^bb0(%arg6: i32):
          %true_9 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %19 = arith.muli %arg5, %c4_i32_10 : i32
          %20 = arith.addi %c64_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %true_11 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %24 = arith.muli %arg5, %c4_i32_12 : i32
          %25 = arith.addi %c80_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          %true_13 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %29 = arith.muli %arg5, %c4_i32_14 : i32
          %30 = arith.addi %c96_i32, %29 : i32
          %31 = arith.addi %30, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb3(%32: i32):  // no predecessors
          %true_15 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_16 : i32
          %35 = arith.addi %c112_i32, %34 : i32
          %36 = arith.addi %35, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %14 = arith.muli %arg5, %c4_i32_8 : i32
        %15 = arith.addi %c128_i32, %14 : i32
        %16 = arith.addi %15, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%12, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%10#0) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %9 = arith.select %8, %5, %7 : i32
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
      %c0_i32_1 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_1 : i32
      %18 = "simt_step.if"(%17) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c16_i32 = arith.constant 16 : i32
        %21 = arith.addi %c16_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_3 : i32
        %24 = "simt_step.if"(%23) ({
          %27 = simt_step.subgroup_id
          %28 = arith.index_cast %27 : index to i32
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %27 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %25 = arith.addi %c144_i32, %0 : i32
        %true_4 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      %c160_i32 = arith.constant 160 : i32
      %19 = arith.addi %c160_i32, %0 : i32
      %true_2 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) : (i32) -> ()
    }, {
      %c20_i32 = arith.constant 20 : i32
      %15 = arith.addi %c20_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_1 = arith.constant 4 : i32
      %17 = arith.addi %0, %c4_i32_1 : i32
      %18 = "simt_step.switch"(%16, %17) ({
      ^bb0(%arg2: i32):
        %c24_i32 = arith.constant 24 : i32
        %19 = arith.addi %c24_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %21 = simt_step.lane_id
        %22 = arith.index_cast %21 : index to i32
        %23 = "simt_step.switch"(%20, %22) ({
        ^bb0(%arg3: i32):
          %30 = simt_step.subgroup_id
          %31 = arith.index_cast %30 : index to i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c1_i32_6 = arith.constant 1 : i32
          %true_7 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %33 = arith.addi %c176_i32, %0 : i32
          %true_8 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_6) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %true_2 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %25 = arith.addi %c192_i32, %0 : i32
        %true_3 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb2(%27: i32):  // no predecessors
        %true_4 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %28 = arith.addi %c208_i32, %0 : i32
        %true_5 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%18) : (i32) -> ()
    }) : (i1) -> i32
    %c224_i32 = arith.constant 224 : i32
    %9 = arith.addi %c224_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c28_i32 = arith.constant 28 : i32
    %11 = arith.addi %c28_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %13 = arith.addi %0, %c1_i32 : i32
    %14 = "simt_step.switch"(%12, %13) ({
    ^bb0(%arg2: i32):
      %true_1 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %15 = arith.addi %c240_i32, %0 : i32
      %true_2 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %18 = simt_step.lane_id
      %19 = arith.index_cast %18 : index to i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %21 = arith.addi %0, %c3_i32 : i32
      %true_3 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %22 = arith.addi %c256_i32, %0 : i32
      %true_4 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

