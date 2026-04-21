module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c3_i32 = arith.constant 3 : i32
      %2 = arith.remsi %arg3, %c3_i32 : i32
      %3 = simt_step.lane_id
      %4 = arith.index_cast %3 : index to i32
      %5 = "simt_step.switch"(%2, %4) ({
      ^bb0(%arg4: i32):
        %c0_i32_0 = arith.constant 0 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32 : i32
          %17 = arith.cmpi slt, %arg6, %16 : i32
          "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_4 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c0_i32_5 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.muli %arg6, %c4_i32 : i32
          %17 = arith.addi %c0_i32_5, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%15, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%9: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %10 = arith.remsi %arg3, %c2_i32 : i32
        %c3_i32_2 = arith.constant 3 : i32
        %11 = "simt_step.switch"(%10, %c3_i32_2) ({
        ^bb0(%arg5: i32):
          %true_4 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %16 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %true_5 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %19 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb2(%12: i32):  // no predecessors
        %true_3 = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %14 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %7 = arith.addi %c64_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %c4_i32 = arith.constant 4 : i32
      %2 = arith.remsi %arg3, %c4_i32 : i32
      %3 = simt_step.lane_id
      %4 = arith.index_cast %3 : index to i32
      %5 = "simt_step.switch"(%2, %4) ({
      ^bb0(%arg4: i32):
        %c0_i32_0 = arith.constant 0 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %6:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_3 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32_3 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32 : i32
          %21 = arith.cmpi slt, %arg6, %20 : i32
          "simt_step.condition"(%21, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_3 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_4 = arith.constant 4 : i32
          %20 = arith.muli %arg6, %c4_i32_4 : i32
          %21 = arith.addi %c80_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%19, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%6#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%7: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %8 = arith.remsi %arg3, %c2_i32 : i32
        %9 = simt_step.lane_id
        %10 = arith.index_cast %9 : index to i32
        %11 = "simt_step.switch"(%8, %10) ({
        ^bb0(%arg5: i32):
          %true_3 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %20 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          %true_4 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %23 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb2(%12: i32):  // no predecessors
        %true = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %14 = arith.addi %c128_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb3(%15: i32):  // no predecessors
        %c4_i32_2 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32_2 : i32
        %c3_i32 = arith.constant 3 : i32
        %17 = arith.addi %arg0, %c3_i32 : i32
        %18 = "simt_step.switch"(%16, %17) ({
        ^bb0(%arg5: i32):
          %true_3 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %20 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          %true_4 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %23 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          %true_5 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %26 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
        ^bb3(%27: i32):  // no predecessors
          %true_6 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %29 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%5) : (i32) -> ()
    }) : (i1) -> i32
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
      %13 = arith.muli %arg3, %c4_i32_5 : i32
      %14 = arith.addi %13, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %15 = arith.addi %c8_i32, %14 : i32
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
      %c208_i32 = arith.constant 208 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_6 : i32
      %16 = arith.addi %c208_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_7 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_5 : i32
      %14 = arith.addi %13, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %15 = arith.addi %c28_i32, %14 : i32
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
      %c224_i32 = arith.constant 224 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_6 : i32
      %16 = arith.addi %c224_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_7 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c48_i32 = arith.constant 48 : i32
    %7 = arith.addi %c48_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_4 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %8, %c0_i32_4 : i32
    %10 = "simt_step.if"(%9) ({
      "simt_step.yield"(%0) : (i32) -> ()
    }, {
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %14 = arith.muli %arg3, %c4_i32_7 : i32
        %15 = arith.addi %14, %0 : i32
        %c52_i32 = arith.constant 52 : i32
        %16 = arith.addi %c52_i32, %15 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %17, %c0_i32_8 : i32
        "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %14 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %16 = arith.muli %arg3, %c4_i32_8 : i32
        %17 = arith.addi %c240_i32, %16 : i32
        %18 = arith.addi %17, %0 : i32
        %true_9 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%14, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%13#0) : (i32) -> ()
    }) : (i1) -> i32
    %c256_i32 = arith.constant 256 : i32
    %11 = arith.addi %c256_i32, %0 : i32
    %true = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

