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
      %c0_i32_2 = arith.constant 0 : i32
      %6 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %7 = "simt_step.if"(%6) ({
        %c2_i32 = arith.constant 2 : i32
        %8 = arith.remsi %arg3, %c2_i32 : i32
        %9 = "simt_step.switch"(%8, %arg0) ({
        ^bb0(%arg4: i32):
          %true_4 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %13 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          %true_5 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %16 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_3 = arith.constant true
        %10 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %11 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%9) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.addi %9, %c1_i32 : i32
          %11 = arith.cmpi slt, %arg5, %10 : i32
          "simt_step.condition"(%11, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %true_5 = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg5, %c4_i32 : i32
          %11 = arith.addi %c64_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.break"(%9, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%8#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%7) : (i32) -> ()
    }, {
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32 : i32
        %9 = arith.cmpi slt, %arg5, %8 : i32
        "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %7:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %10 = arith.addi %9, %c1_i32_6 : i32
          %11 = arith.cmpi slt, %arg7, %10 : i32
          "simt_step.condition"(%11, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_6 = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg7, %c4_i32 : i32
          %11 = arith.addi %c80_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_7 = arith.constant 1 : i32
          %13 = arith.addi %arg7, %c1_i32_7 : i32
          "simt_step.yield"(%9, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %8 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%7#0, %8) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%6#0) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %0, %3 : i32
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
      %c0_i32_1 = arith.constant 0 : i32
      %16 = arith.addi %0, %c0_i32_1 : i32
      "simt_step.yield"(%16) : (i32) -> ()
    }, {
      %c12_i32 = arith.constant 12 : i32
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_1 : i32
      %19 = "simt_step.if"(%18) ({
        %c16_i32 = arith.constant 16 : i32
        %22 = arith.addi %c16_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %24 = "simt_step.switch"(%23, %0) ({
        ^bb0(%arg2: i32):
          %c3_i32 = arith.constant 3 : i32
          %27 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %29 = simt_step.lane_id
          %30 = arith.index_cast %29 : index to i32
          %true_5 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %31 = arith.addi %c96_i32, %0 : i32
          %true_6 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %34 = simt_step.subgroup_id
          %35 = arith.index_cast %34 : index to i32
          %true_7 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %36 = arith.addi %c112_i32, %0 : i32
          %true_8 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_3 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %25 = arith.addi %c128_i32, %0 : i32
        %true_4 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      %c144_i32 = arith.constant 144 : i32
      %20 = arith.addi %c144_i32, %0 : i32
      %true_2 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) : (i32) -> ()
    }) : (i1) -> i32
    %c160_i32 = arith.constant 160 : i32
    %9 = arith.addi %c160_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c20_i32 = arith.constant 20 : i32
    %11 = arith.addi %c20_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = simt_step.lane_id
    %14 = arith.index_cast %13 : index to i32
    %15 = "simt_step.switch"(%12, %14) ({
    ^bb0(%arg2: i32):
      %16 = simt_step.subgroup_id
      %17 = arith.index_cast %16 : index to i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c24_i32 = arith.constant 24 : i32
      %19 = arith.addi %c24_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_1 : i32
      %22 = "simt_step.if"(%21) ({
        %c28_i32 = arith.constant 28 : i32
        %34 = arith.addi %c28_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_7 : i32
        %37 = "simt_step.if"(%36) ({
          %c2_i32 = arith.constant 2 : i32
          %40 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }, {
          %40 = simt_step.lane_id
          %41 = arith.index_cast %40 : index to i32
          "simt_step.yield"(%41) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %38 = arith.addi %c176_i32, %0 : i32
        %true_8 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_9 : i32
          %36 = arith.addi %35, %0 : i32
          %c32_i32 = arith.constant 32 : i32
          %37 = arith.addi %c32_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_10 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_10 : i32
          %38 = arith.addi %c192_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_11 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) : (i32) -> ()
      }) : (i1) -> i32
      %c208_i32 = arith.constant 208 : i32
      %23 = arith.addi %c208_i32, %0 : i32
      %true_2 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c52_i32 = arith.constant 52 : i32
      %26 = arith.addi %c52_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_3 : i32
      %29 = "simt_step.if"(%28) ({
        %c56_i32 = arith.constant 56 : i32
        %34 = arith.addi %c56_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_7 = arith.constant 4 : i32
        %36 = "simt_step.switch"(%35, %c4_i32_7) ({
        ^bb0(%arg3: i32):
          %39 = simt_step.lane_id
          %40 = arith.index_cast %39 : index to i32
          %true_10 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %41 = arith.addi %c224_i32, %0 : i32
          %true_11 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %37 = arith.addi %c240_i32, %0 : i32
        %true_9 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) : (i32) -> ()
      }, {
        %34 = simt_step.lane_id
        %35 = arith.index_cast %34 : index to i32
        "simt_step.yield"(%35) : (i32) -> ()
      }) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %30 = arith.addi %c256_i32, %0 : i32
      %true_4 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %32 = arith.addi %c272_i32, %0 : i32
      %true_6 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

