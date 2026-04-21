module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %1 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %1, %c1_i32 : i32
      %3 = arith.cmpi slt, %arg5, %2 : i32
      "simt_step.condition"(%3, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %1 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %2 = "simt_step.if"(%1) ({
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %4:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
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
          %c0_i32_4 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg7, %c4_i32 : i32
          %7 = arith.addi %c0_i32_4, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_5 = arith.constant 1 : i32
          %9 = arith.addi %arg7, %c1_i32_5 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %4 = arith.remsi %arg3, %c2_i32 : i32
        %c3_i32 = arith.constant 3 : i32
        %5 = "simt_step.switch"(%4, %c3_i32) ({
        ^bb0(%arg6: i32):
          %true_2 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_3 = arith.constant 4 : i32
          %11 = arith.muli %arg5, %c4_i32_3 : i32
          %12 = arith.addi %c16_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          %true_4 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_5 = arith.constant 4 : i32
          %16 = arith.muli %arg5, %c4_i32_5 : i32
          %17 = arith.addi %c32_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb2(%19: i32):  // no predecessors
          %true_6 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %21 = arith.muli %arg5, %c4_i32_7 : i32
          %22 = arith.addi %c48_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.muli %arg5, %c4_i32 : i32
        %8 = arith.addi %c64_i32, %7 : i32
        %9 = arith.addi %8, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%5) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%2, %3) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
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
    %5 = arith.addi %0, %c1_i32 : i32
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.lane_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %17 = arith.addi %c12_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_1 : i32
      %20 = "simt_step.if"(%19) ({
        %c0_i32_10 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_10) : (i32) -> ()
      }, {
        %c0_i32_10 = arith.constant 0 : i32
        %30 = arith.addi %0, %c0_i32_10 : i32
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      %c80_i32 = arith.constant 80 : i32
      %21 = arith.addi %c80_i32, %0 : i32
      %true_2 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_10 : i32
        %31 = arith.addi %30, %0 : i32
        %c16_i32 = arith.constant 16 : i32
        %32 = arith.addi %c16_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_11 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %37 = arith.muli %arg6, %c4_i32_16 : i32
          %38 = arith.addi %37, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %39 = arith.addi %c36_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_17 : i32
          "simt_step.condition"(%41, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %37 = arith.addi %arg5, %arg6 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %38 = arith.addi %arg6, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %39 = arith.muli %arg6, %c4_i32_18 : i32
          %40 = arith.addi %c96_i32, %39 : i32
          %41 = arith.addi %40, %0 : i32
          %true_19 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %31 = arith.addi %arg3, %30#0 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %32 = arith.addi %arg4, %c1_i32_12 : i32
        %true_13 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_14 : i32
        %34 = arith.addi %c112_i32, %33 : i32
        %35 = arith.addi %34, %0 : i32
        %true_15 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31, %32) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %25 = arith.addi %c128_i32, %0 : i32
      %true_6 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %true_8 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %28 = arith.addi %c144_i32, %0 : i32
      %true_9 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%c0_i32_7) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %c56_i32 = arith.constant 56 : i32
    %11 = arith.addi %c56_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_0 : i32
    %14 = "simt_step.if"(%13) ({
      %17 = simt_step.lane_id
      %18 = arith.index_cast %17 : index to i32
      "simt_step.yield"(%18) : (i32) -> ()
    }, {
      %c60_i32 = arith.constant 60 : i32
      %17 = arith.addi %c60_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = simt_step.subgroup_id
      %20 = arith.index_cast %19 : index to i32
      %21 = "simt_step.switch"(%18, %20) ({
      ^bb0(%arg2: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %30 = arith.muli %arg4, %c4_i32_7 : i32
          %31 = arith.addi %30, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %32 = arith.addi %c64_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_8 : i32
          "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %30 = arith.addi %arg3, %arg4 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %31 = arith.addi %arg4, %c1_i32_7 : i32
          %true_8 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %32 = arith.muli %arg4, %c4_i32_9 : i32
          %33 = arith.addi %c160_i32, %32 : i32
          %34 = arith.addi %33, %0 : i32
          %true_10 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_5 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %25 = arith.addi %c176_i32, %0 : i32
        %true_6 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %28 = simt_step.subgroup_id
        %29 = arith.index_cast %28 : index to i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %22 = arith.addi %c192_i32, %0 : i32
      %true_2 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) : (i32) -> ()
    }) : (i1) -> i32
    %c208_i32 = arith.constant 208 : i32
    %15 = arith.addi %c208_i32, %0 : i32
    %true = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

