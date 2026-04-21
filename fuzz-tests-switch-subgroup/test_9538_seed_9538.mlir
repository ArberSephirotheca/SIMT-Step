module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %4 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %4, %c1_i32 : i32
      %6 = arith.cmpi slt, %arg5, %5 : i32
      "simt_step.condition"(%6, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.muli %arg5, %c4_i32 : i32
      %6 = arith.addi %c0_i32_4, %5 : i32
      %7 = arith.addi %6, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%4, %8) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %4 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %4, %c1_i32 : i32
      %6 = arith.cmpi slt, %arg5, %5 : i32
      "simt_step.condition"(%6, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %6 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %7 = arith.addi %6, %c1_i32_6 : i32
        %8 = arith.cmpi slt, %arg7, %7 : i32
        "simt_step.condition"(%8, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %6:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg8: i32, %arg9: i32):
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %9 = arith.addi %8, %c1_i32_9 : i32
          %10 = arith.cmpi slt, %arg9, %9 : i32
          "simt_step.condition"(%10, %arg8, %arg9) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg8: i32, %arg9: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.muli %arg9, %c4_i32 : i32
          %10 = arith.addi %c16_i32, %9 : i32
          %11 = arith.addi %10, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_9 = arith.constant 1 : i32
          %12 = arith.addi %arg9, %c1_i32_9 : i32
          "simt_step.yield"(%8, %12) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_8 = arith.constant 1 : i32
        %7 = arith.addi %arg7, %c1_i32_8 : i32
        "simt_step.break"(%6#0, %7) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%4#0, %5) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %3 = arith.select %2, %0#0, %1#0 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_2 : i32
      %12 = arith.addi %11, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %13 = arith.addi %c8_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_3 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %11 = arith.addi %arg2, %arg3 : i32
      %c1_i32_2 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32_2 : i32
      %true = arith.constant true
      %c32_i32 = arith.constant 32 : i32
      %c4_i32_3 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_3 : i32
      %14 = arith.addi %c32_i32, %13 : i32
      %15 = arith.addi %14, %0 : i32
      %true_4 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %6 = arith.addi %c28_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %12 = arith.addi %c32_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %14 = simt_step.lane_id
      %15 = arith.index_cast %14 : index to i32
      %16 = "simt_step.switch"(%13, %15) ({
      ^bb0(%arg3: i32):
        %c36_i32 = arith.constant 36 : i32
        %27 = arith.addi %c36_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %29 = simt_step.subgroup_id
        %30 = arith.index_cast %29 : index to i32
        %31 = "simt_step.switch"(%28, %30) ({
        ^bb0(%arg4: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %true_18 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %49 = arith.addi %c48_i32, %0 : i32
          %true_19 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_17) {fallthrough = false} : (i32) -> ()
        ^bb1(%51: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%52: i32):  // no predecessors
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          %true_20 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %55 = arith.addi %c64_i32, %0 : i32
          %true_21 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %33 = simt_step.lane_id
        %34 = arith.index_cast %33 : index to i32
        %true_11 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %35 = arith.addi %c80_i32, %0 : i32
        %true_12 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %38 = simt_step.lane_id
        %39 = arith.index_cast %38 : index to i32
        "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
      ^bb3(%40: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %41 = arith.addi %c40_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_13 : i32
        %44 = "simt_step.if"(%43) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %49 = simt_step.subgroup_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) : (i32) -> ()
        }) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %45 = arith.addi %c96_i32, %0 : i32
        %true_14 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_15 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %47 = arith.addi %c112_i32, %0 : i32
        %true_16 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %17 = arith.addi %c128_i32, %0 : i32
      %true_2 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_3 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %19 = arith.addi %c144_i32, %0 : i32
      %true_4 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_11 : i32
        %28 = arith.addi %27, %0 : i32
        %c44_i32 = arith.constant 44 : i32
        %29 = arith.addi %c44_i32, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_12 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %27 = arith.addi %arg3, %arg4 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %28 = arith.addi %arg4, %c1_i32_11 : i32
        %true_12 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_13 : i32
        %30 = arith.addi %c160_i32, %29 : i32
        %31 = arith.addi %30, %0 : i32
        %true_14 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %23 = arith.addi %c176_i32, %0 : i32
      %true_8 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%25: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %26:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_11 : i32
        %28 = arith.addi %27, %0 : i32
        %c64_i32 = arith.constant 64 : i32
        %29 = arith.addi %c64_i32, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_12 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %27 = arith.addi %arg3, %arg4 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %28 = arith.addi %arg4, %c1_i32_11 : i32
        %true_12 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_13 : i32
        %30 = arith.addi %c192_i32, %29 : i32
        %31 = arith.addi %30, %0 : i32
        %true_14 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

