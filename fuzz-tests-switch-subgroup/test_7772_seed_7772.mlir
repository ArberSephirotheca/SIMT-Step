module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32 = arith.constant 0 : i32
      %3 = arith.addi %c0_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) {fallthrough = true} : (i32) -> ()
    ^bb1(%4: i32):  // no predecessors
      %true_0 = arith.constant true
      %5 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %6 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%5) {fallthrough = true} : (i32) -> ()
    ^bb2(%7: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %8 = arith.remsi %arg3, %c3_i32 : i32
      %9 = "simt_step.switch"(%8, %arg0) ({
      ^bb0(%arg5: i32):
        %true_1 = arith.constant true
        %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %11 = arith.addi %c32_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32 : i32
          %19 = arith.cmpi slt, %arg7, %18 : i32
          "simt_step.condition"(%19, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_5 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.muli %arg7, %c4_i32 : i32
          %19 = arith.addi %c48_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%17, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %16 = "simt_step.if"(%15) ({
          %true_5 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %18 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }, {
          %true_5 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %18 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c12_i32 = arith.constant 12 : i32
      %11 = arith.addi %c12_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
      %14 = "simt_step.if"(%13) ({
        %c16_i32 = arith.constant 16 : i32
        %17 = arith.addi %c16_i32, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_3 : i32
        %20 = "simt_step.if"(%19) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_5 = arith.constant 4 : i32
          %23 = arith.addi %0, %c4_i32_5 : i32
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %21 = arith.addi %c96_i32, %0 : i32
        %true_4 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %15 = arith.addi %c112_i32, %0 : i32
      %true_2 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) : (i32) -> ()
    }, {
      %c20_i32 = arith.constant 20 : i32
      %11 = arith.addi %c20_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %13 = "simt_step.switch"(%12, %c3_i32) ({
      ^bb0(%arg2: i32):
        %c24_i32 = arith.constant 24 : i32
        %14 = arith.addi %c24_i32, %0 : i32
        %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
        %16 = simt_step.lane_id
        %17 = arith.index_cast %16 : index to i32
        %18 = "simt_step.switch"(%15, %17) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          %38 = arith.addi %0, %c2_i32 : i32
          %true_11 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %39 = arith.addi %c128_i32, %0 : i32
          %true_12 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %true_13 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %42 = arith.addi %c144_i32, %0 : i32
          %true_14 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %c0_i32_15 = arith.constant 0 : i32
          %45 = arith.addi %0, %c0_i32_15 : i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb3(%46: i32):  // no predecessors
          %c2_i32_16 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_1 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %19 = arith.addi %c160_i32, %0 : i32
        %true_2 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %22 = arith.addi %c28_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_3 : i32
        %25 = "simt_step.if"(%24) ({
          %38 = simt_step.subgroup_id
          %39 = arith.index_cast %38 : index to i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          %38 = simt_step.lane_id
          %39 = arith.index_cast %38 : index to i32
          "simt_step.yield"(%39) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %26 = arith.addi %c176_i32, %0 : i32
        %true_4 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_5 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %28 = arith.addi %c192_i32, %0 : i32
        %true_6 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        %c32_i32 = arith.constant 32 : i32
        %31 = arith.addi %c32_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %33 = "simt_step.switch"(%32, %0) ({
        ^bb0(%arg3: i32):
          %38 = simt_step.lane_id
          %39 = arith.index_cast %38 : index to i32
          %true_11 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %40 = arith.addi %c208_i32, %0 : i32
          %true_12 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%43) {fallthrough = true} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %c3_i32_13 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb3(%45: i32):  // no predecessors
          %46 = simt_step.lane_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %34 = arith.addi %c224_i32, %0 : i32
        %true_8 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb3(%36: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_11 : i32
          %39 = arith.addi %38, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %40 = arith.addi %c36_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_12 : i32
          "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %38 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %39 = arith.addi %arg4, %c1_i32 : i32
          %true_11 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_12 : i32
          %41 = arith.addi %c240_i32, %40 : i32
          %42 = arith.addi %41, %0 : i32
          %true_13 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%13) : (i32) -> ()
    }) : (i1) -> i32
    %c256_i32 = arith.constant 256 : i32
    %9 = arith.addi %c256_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

