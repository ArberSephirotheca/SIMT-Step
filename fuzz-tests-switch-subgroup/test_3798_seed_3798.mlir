module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %7 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %7, %c1_i32 : i32
      %9 = arith.cmpi slt, %arg5, %8 : i32
      "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.muli %arg5, %c4_i32 : i32
      %9 = arith.addi %c0_i32_7, %8 : i32
      %10 = arith.addi %9, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%7, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %7 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %7, %c1_i32 : i32
      %9 = arith.cmpi slt, %arg5, %8 : i32
      "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.muli %arg5, %c4_i32 : i32
      %9 = arith.addi %c16_i32, %8 : i32
      %10 = arith.addi %9, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%7, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %3 = arith.select %2, %0#0, %1#0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %4:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %7 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %7, %c1_i32 : i32
      %9 = arith.cmpi slt, %arg5, %8 : i32
      "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_7 = arith.constant 0 : i32
      %7 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
      %8 = "simt_step.if"(%7) ({
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %12 = arith.addi %11, %c1_i32_10 : i32
          %13 = arith.cmpi slt, %arg7, %12 : i32
          "simt_step.condition"(%13, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.muli %arg7, %c4_i32 : i32
          %13 = arith.addi %c32_i32, %12 : i32
          %14 = arith.addi %13, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_10 = arith.constant 1 : i32
          %15 = arith.addi %arg7, %c1_i32_10 : i32
          "simt_step.yield"(%11, %15) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%10#0) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %10 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %11 = "simt_step.if"(%10) ({
          %true = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.muli %arg5, %c4_i32 : i32
          %14 = arith.addi %c48_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) : (i32) -> ()
        }, {
          %true = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.muli %arg5, %c4_i32 : i32
          %14 = arith.addi %c64_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%11) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%8, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_6 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
    %6 = arith.select %5, %3, %4#0 : i32
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
    %5 = simt_step.subgroup_id
    %6 = arith.index_cast %5 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %7 = arith.addi %c8_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %9 = simt_step.lane_id
    %10 = arith.index_cast %9 : index to i32
    %11 = "simt_step.switch"(%8, %10) ({
    ^bb0(%arg2: i32):
      %14 = simt_step.subgroup_id
      %15 = arith.index_cast %14 : index to i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_7 : i32
        %32 = arith.addi %31, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %33 = arith.addi %c12_i32, %32 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_8 : i32
        "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %31 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %32 = arith.addi %arg4, %c1_i32 : i32
        %true_7 = arith.constant true
        %c80_i32_8 = arith.constant 80 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_9 : i32
        %34 = arith.addi %c80_i32_8, %33 : i32
        %35 = arith.addi %34, %0 : i32
        %true_10 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31, %32) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%17#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %19 = arith.addi %c32_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = "simt_step.switch"(%20, %0) ({
      ^bb0(%arg3: i32):
        %c36_i32 = arith.constant 36 : i32
        %31 = arith.addi %c36_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %33 = simt_step.lane_id
        %34 = arith.index_cast %33 : index to i32
        %35 = "simt_step.switch"(%32, %34) ({
        ^bb0(%arg4: i32):
          %44 = simt_step.lane_id
          %45 = arith.index_cast %44 : index to i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %c0_i32_15 = arith.constant 0 : i32
          %47 = arith.addi %0, %c0_i32_15 : i32
          %true_16 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %48 = arith.addi %c96_i32, %0 : i32
          %true_17 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%51: i32):  // no predecessors
          %52 = simt_step.lane_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %36 = arith.addi %c112_i32, %0 : i32
        %true_8 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_15 : i32
          %45 = arith.addi %44, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %46 = arith.addi %c40_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_16 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32 : i32
          %true_15 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_16 : i32
          %47 = arith.addi %c128_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_17 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %40 = arith.addi %c144_i32, %0 : i32
        %true_12 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_15 : i32
          %45 = arith.addi %44, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %46 = arith.addi %c60_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_16 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32 : i32
          %true_15 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_16 : i32
          %47 = arith.addi %c160_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_17 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %22 = arith.addi %c176_i32, %0 : i32
      %true_4 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb3(%24: i32):  // no predecessors
      %c80_i32 = arith.constant 80 : i32
      %25 = arith.addi %c80_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_5 : i32
      %28 = "simt_step.if"(%27) ({
        %c84_i32 = arith.constant 84 : i32
        %31 = arith.addi %c84_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_7 = arith.constant 4 : i32
        %33 = "simt_step.switch"(%32, %c4_i32_7) ({
        ^bb0(%arg3: i32):
          %34 = simt_step.lane_id
          %35 = arith.index_cast %34 : index to i32
          %true_8 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %36 = arith.addi %c192_i32, %0 : i32
          %true_9 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c4_i32_10 = arith.constant 4 : i32
          %true_11 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %39 = arith.addi %c208_i32, %0 : i32
          %true_12 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          %c4_i32_13 = arith.constant 4 : i32
          %true_14 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %42 = arith.addi %c224_i32, %0 : i32
          %true_15 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb3(%44: i32):  // no predecessors
          %c0_i32_16 = arith.constant 0 : i32
          %45 = arith.addi %0, %c0_i32_16 : i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%33) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %32 = arith.muli %arg4, %c4_i32_9 : i32
          %33 = arith.addi %32, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %34 = arith.addi %c88_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_10 : i32
          "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %32 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %34 = arith.muli %arg4, %c4_i32_10 : i32
          %35 = arith.addi %c240_i32, %34 : i32
          %36 = arith.addi %35, %0 : i32
          %true_11 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%31#0) : (i32) -> ()
      }) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %29 = arith.addi %c256_i32, %0 : i32
      %true_6 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c272_i32 = arith.constant 272 : i32
    %12 = arith.addi %c272_i32, %0 : i32
    %true_0 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

