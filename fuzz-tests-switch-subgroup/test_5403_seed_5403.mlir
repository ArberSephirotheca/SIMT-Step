module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c3_i32 = arith.constant 3 : i32
      %2 = arith.remsi %arg3, %c3_i32 : i32
      %3 = simt_step.subgroup_id
      %4 = arith.index_cast %3 : index to i32
      %5 = "simt_step.switch"(%2, %4) ({
      ^bb0(%arg4: i32):
        %c0_i32_0 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
        %9 = "simt_step.if"(%8) ({
          %true_4 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c0_i32_5 = arith.constant 0 : i32
          %20 = arith.addi %c0_i32_5, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %20 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %c4_i32 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32 : i32
        %c3_i32_1 = arith.constant 3 : i32
        %12 = arith.addi %arg0, %c3_i32_1 : i32
        %13 = "simt_step.switch"(%11, %12) ({
        ^bb0(%arg5: i32):
          %true_4 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %20 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          %true_5 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %23 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          %true_6 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %26 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb3(%27: i32):  // no predecessors
          %true_7 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %29 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_2 = arith.constant true
        %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %15 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb2(%16: i32):  // no predecessors
        %true_3 = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %18 = arith.addi %c112_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c128_i32 = arith.constant 128 : i32
      %7 = arith.addi %c128_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32 : i32
        %5 = arith.cmpi slt, %arg5, %4 : i32
        "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %3:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32_4 : i32
          %7 = arith.cmpi slt, %arg7, %6 : i32
          "simt_step.condition"(%7, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg7, %c4_i32 : i32
          %7 = arith.addi %c144_i32, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_4 = arith.constant 1 : i32
          %9 = arith.addi %arg7, %c1_i32_4 : i32
          "simt_step.continue"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%3#0, %4) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
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
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %19 = arith.muli %arg5, %c4_i32_8 : i32
        %20 = arith.addi %19, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %21 = arith.addi %c28_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_9 : i32
        "simt_step.condition"(%23, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %19 = arith.addi %arg4, %arg5 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %20 = arith.addi %arg5, %c1_i32_8 : i32
        %true_9 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %21 = arith.muli %arg5, %c4_i32_10 : i32
        %22 = arith.addi %c160_i32, %21 : i32
        %23 = arith.addi %22, %0 : i32
        %true_11 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %13 = arith.addi %arg2, %12#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_6 : i32
      %16 = arith.addi %c176_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_7 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c48_i32 = arith.constant 48 : i32
    %6 = arith.addi %c48_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_2 : i32
    %9 = "simt_step.if"(%8) ({
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32) : (i32) -> ()
    }, {
      %c52_i32 = arith.constant 52 : i32
      %12 = arith.addi %c52_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %14 = simt_step.lane_id
      %15 = arith.index_cast %14 : index to i32
      %16 = "simt_step.switch"(%13, %15) ({
      ^bb0(%arg2: i32):
        %c56_i32 = arith.constant 56 : i32
        %17 = arith.addi %c56_i32, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_3 : i32
        %20 = "simt_step.if"(%19) ({
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %36 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %21 = arith.addi %c192_i32, %0 : i32
        %true_4 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_5 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %23 = arith.addi %c208_i32, %0 : i32
        %true_6 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %36 = arith.muli %arg4, %c4_i32_13 : i32
          %37 = arith.addi %36, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %38 = arith.addi %c60_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_14 : i32
          "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %36 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg4, %c1_i32 : i32
          %true_13 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_14 : i32
          %39 = arith.addi %c224_i32, %38 : i32
          %40 = arith.addi %39, %0 : i32
          %true_15 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %27 = arith.addi %c240_i32, %0 : i32
        %true_10 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%29: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %30 = arith.addi %c80_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_11 : i32
        %33 = "simt_step.if"(%32) ({
          %36 = simt_step.lane_id
          %37 = arith.index_cast %36 : index to i32
          "simt_step.yield"(%37) : (i32) -> ()
        }, {
          %c4_i32_13 = arith.constant 4 : i32
          %36 = arith.addi %0, %c4_i32_13 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %34 = arith.addi %c256_i32, %0 : i32
        %true_12 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) : (i32) -> ()
    }) : (i1) -> i32
    %c272_i32 = arith.constant 272 : i32
    %10 = arith.addi %c272_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

