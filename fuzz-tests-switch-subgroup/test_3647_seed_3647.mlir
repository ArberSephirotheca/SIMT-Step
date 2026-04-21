module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
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
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%3#0, %4) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c0_i32_1 = arith.constant 0 : i32
        %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %5 = "simt_step.if"(%4) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %7 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %7 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%5) : (i32) -> ()
      }, {
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32 : i32
          %7 = arith.cmpi slt, %arg5, %6 : i32
          "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg5, %c4_i32 : i32
          %7 = arith.addi %c48_i32, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %9 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      "simt_step.yield"() : () -> ()
    }, {
      %c8_i32 = arith.constant 8 : i32
      %11 = arith.addi %c8_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
      "simt_step.if"(%13) ({
        "simt_step.yield"() : () -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %14 = arith.remsi %0, %c2_i32 : i32
        %15 = "simt_step.switch"(%14, %0) ({
        ^bb0(%arg2: i32):
          %c0_i32_2 = arith.constant 0 : i32
          %16 = arith.addi %arg2, %c0_i32_2 : i32
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %c2_i32_3 = arith.constant 2 : i32
          %18 = arith.addi %17, %c2_i32_3 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.lane_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_12 : i32
        %32 = arith.addi %31, %0 : i32
        %c16_i32 = arith.constant 16 : i32
        %33 = arith.addi %c16_i32, %32 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_13 : i32
        "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %38 = arith.muli %arg6, %c4_i32_17 : i32
          %39 = arith.addi %38, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %40 = arith.addi %c36_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_18 : i32
          "simt_step.condition"(%42, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %38 = arith.addi %arg5, %arg6 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %39 = arith.addi %arg6, %c1_i32_17 : i32
          %true_18 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %40 = arith.muli %arg6, %c4_i32_19 : i32
          %41 = arith.addi %c64_i32, %40 : i32
          %42 = arith.addi %41, %0 : i32
          %true_20 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %32 = arith.addi %arg3, %31#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32 : i32
        %true_14 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_15 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_15 : i32
        %35 = arith.addi %c80_i32, %34 : i32
        %36 = arith.addi %35, %0 : i32
        %true_16 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true = arith.constant true
      %c96_i32 = arith.constant 96 : i32
      %12 = arith.addi %c96_i32, %0 : i32
      %true_3 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_12 : i32
        %32 = arith.addi %31, %0 : i32
        %c56_i32 = arith.constant 56 : i32
        %33 = arith.addi %c56_i32, %32 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_13 : i32
        "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %31 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %32 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_13 : i32
        %34 = arith.addi %c112_i32, %33 : i32
        %35 = arith.addi %34, %0 : i32
        %true_14 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%31, %32) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%15#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%16: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %17 = arith.addi %c76_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_6 : i32
      %20 = "simt_step.if"(%19) ({
        %c80_i32 = arith.constant 80 : i32
        %31 = arith.addi %c80_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %33 = arith.addi %0, %c2_i32 : i32
        %34 = "simt_step.switch"(%32, %33) ({
        ^bb0(%arg3: i32):
          %35 = simt_step.lane_id
          %36 = arith.index_cast %35 : index to i32
          "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          %38 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%40: i32):  // no predecessors
          %41 = simt_step.subgroup_id
          %42 = arith.index_cast %41 : index to i32
          %true_13 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %43 = arith.addi %c128_i32, %0 : i32
          %true_14 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        %c84_i32 = arith.constant 84 : i32
        %31 = arith.addi %c84_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %33 = "simt_step.switch"(%32, %0) ({
        ^bb0(%arg3: i32):
          %34 = simt_step.subgroup_id
          %35 = arith.index_cast %34 : index to i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %37 = simt_step.lane_id
          %38 = arith.index_cast %37 : index to i32
          %true_12 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %39 = arith.addi %c144_i32, %0 : i32
          %true_13 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          %true_14 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %44 = arith.addi %c160_i32, %0 : i32
          %true_15 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%33) : (i32) -> ()
      }) : (i1) -> i32
      %c176_i32 = arith.constant 176 : i32
      %21 = arith.addi %c176_i32, %0 : i32
      %true_7 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_8 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %23 = arith.addi %c192_i32, %0 : i32
      %true_9 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
    ^bb3(%25: i32):  // no predecessors
      %c88_i32 = arith.constant 88 : i32
      %26 = arith.addi %c88_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %28 = "simt_step.switch"(%27, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_18 : i32
          %42 = arith.addi %41, %0 : i32
          %c92_i32 = arith.constant 92 : i32
          %43 = arith.addi %c92_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_19 : i32
          "simt_step.condition"(%45, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %41 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %42 = arith.addi %arg5, %c1_i32 : i32
          %true_18 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %43 = arith.muli %arg5, %c4_i32_19 : i32
          %44 = arith.addi %c208_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_20 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %32 = arith.addi %c224_i32, %0 : i32
        %true_15 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c112_i32 = arith.constant 112 : i32
        %35 = arith.addi %c112_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_16 : i32
        %38 = "simt_step.if"(%37) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_18 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_18) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %39 = arith.addi %c240_i32, %0 : i32
        %true_17 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %29 = arith.addi %c256_i32, %0 : i32
      %true_11 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

