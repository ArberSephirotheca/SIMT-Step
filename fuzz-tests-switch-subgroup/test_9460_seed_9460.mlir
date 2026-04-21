module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %9, %c1_i32 : i32
      %11 = arith.cmpi slt, %arg5, %10 : i32
      "simt_step.condition"(%11, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true_2 = arith.constant true
      %9 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.muli %arg5, %c4_i32 : i32
      %11 = arith.addi %c0_i32_3, %10 : i32
      %12 = arith.addi %11, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%9, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c2_i32 = arith.constant 2 : i32
    %1 = arith.remsi %arg3, %c2_i32 : i32
    %2 = simt_step.lane_id
    %3 = arith.index_cast %2 : index to i32
    %4 = "simt_step.switch"(%1, %3) ({
    ^bb0(%arg4: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32 : i32
        %14 = arith.cmpi slt, %arg6, %13 : i32
        "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %15 = arith.addi %14, %c1_i32_8 : i32
          %16 = arith.cmpi slt, %arg8, %15 : i32
          "simt_step.condition"(%16, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_8 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %15 = arith.muli %arg8, %c4_i32 : i32
          %16 = arith.addi %c16_i32, %15 : i32
          %17 = arith.addi %16, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_9 = arith.constant 1 : i32
          %18 = arith.addi %arg8, %c1_i32_9 : i32
          "simt_step.yield"(%14, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%12#0, %13) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32 : i32
        %14 = arith.cmpi slt, %arg6, %13 : i32
        "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true_6 = arith.constant true
        %12 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %c4_i32 = arith.constant 4 : i32
        %13 = arith.muli %arg6, %c4_i32 : i32
        %14 = arith.addi %c32_i32, %13 : i32
        %15 = arith.addi %14, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%12, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %6 = arith.addi %c48_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %8 = arith.select %7, %0#0, %4 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.cmpi slt, %arg3, %c1_i32 : i32
        "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %16 = "simt_step.switch"(%0, %c1_i32) ({
        ^bb0(%arg4: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %18 = arith.addi %arg4, %c4_i32_5 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %20 = arith.addi %19, %c3_i32 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_4 = arith.constant 1 : i32
        %17 = arith.addi %arg3, %c1_i32_4 : i32
        "simt_step.yield"(%arg2, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %6 = simt_step.lane_id
    %7 = arith.index_cast %6 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %8 = arith.addi %c8_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = simt_step.lane_id
    %11 = arith.index_cast %10 : index to i32
    %12 = "simt_step.switch"(%9, %11) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %15 = arith.addi %c12_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %17 = simt_step.lane_id
      %18 = arith.index_cast %17 : index to i32
      %19 = "simt_step.switch"(%16, %18) ({
      ^bb0(%arg3: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_14 : i32
          %40 = arith.addi %39, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %41 = arith.addi %c16_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_15 : i32
          "simt_step.condition"(%43, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %39 = arith.addi %arg4, %arg5 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %40 = arith.addi %arg5, %c1_i32_14 : i32
          %true_15 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_16 : i32
          %42 = arith.addi %c64_i32, %41 : i32
          %43 = arith.addi %42, %0 : i32
          %true_17 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %31 = arith.addi %c80_i32, %0 : i32
        %true_13 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %34 = arith.addi %c36_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = simt_step.lane_id
        %37 = arith.index_cast %36 : index to i32
        %38 = "simt_step.switch"(%35, %37) ({
        ^bb0(%arg4: i32):
          %c0_i32_14 = arith.constant 0 : i32
          %true_15 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %39 = arith.addi %c96_i32, %0 : i32
          %true_16 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_14) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %true_17 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %45 = arith.addi %c112_i32, %0 : i32
          %true_18 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %20 = arith.addi %c128_i32, %0 : i32
      %true_3 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_10 : i32
        %31 = arith.addi %30, %0 : i32
        %c40_i32 = arith.constant 40 : i32
        %32 = arith.addi %c40_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_11 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c2_i32 = arith.constant 2 : i32
        %30 = arith.addi %0, %c2_i32 : i32
        %31 = arith.addi %arg3, %30 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %32 = arith.addi %arg4, %c1_i32_10 : i32
        %true_11 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_12 : i32
        %34 = arith.addi %c144_i32, %33 : i32
        %35 = arith.addi %34, %0 : i32
        %true_13 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31, %32) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %24 = arith.addi %c160_i32, %0 : i32
      %true_7 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %27 = arith.addi %0, %c1_i32 : i32
      %true_8 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %28 = arith.addi %c176_i32, %0 : i32
      %true_9 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c192_i32 = arith.constant 192 : i32
    %13 = arith.addi %c192_i32, %0 : i32
    %true_1 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

