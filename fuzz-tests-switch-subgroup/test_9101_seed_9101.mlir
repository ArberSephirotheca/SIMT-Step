module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
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
      %c0_i32_3 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %6 = arith.muli %arg5, %c4_i32 : i32
      %7 = arith.addi %c0_i32_3, %6 : i32
      %8 = arith.addi %7, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%5, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_1 = arith.constant 0 : i32
    %1 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %2 = "simt_step.if"(%1) ({
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %6 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %6, %c1_i32 : i32
        %8 = arith.cmpi slt, %arg5, %7 : i32
        "simt_step.condition"(%8, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %6 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %7 = "simt_step.if"(%6) ({
          %true = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg5, %c4_i32 : i32
          %11 = arith.addi %c16_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%9) : (i32) -> ()
        }, {
          %true = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg5, %c4_i32 : i32
          %11 = arith.addi %c32_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%9) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %8 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%7, %8) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%5#0) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %5 = arith.remsi %arg3, %c2_i32 : i32
      %6 = simt_step.lane_id
      %7 = arith.index_cast %6 : index to i32
      %8 = "simt_step.switch"(%5, %7) ({
      ^bb0(%arg4: i32):
        %true = arith.constant true
        %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %10 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%9) {fallthrough = true} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %12 = simt_step.subgroup_id
        %13 = arith.index_cast %12 : index to i32
        %14 = "simt_step.switch"(%arg3, %13) ({
        ^bb0(%arg5: i32):
          %true_3 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %16 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %true_4 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %19 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%8) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0#0, %2 : i32
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
      %16 = simt_step.lane_id
      %17 = arith.index_cast %16 : index to i32
      "simt_step.yield"(%17) : (i32) -> ()
    }, {
      %16 = simt_step.subgroup_id
      %17 = arith.index_cast %16 : index to i32
      "simt_step.yield"(%17) : (i32) -> ()
    }) : (i1) -> i32
    %c96_i32 = arith.constant 96 : i32
    %9 = arith.addi %c96_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c12_i32 = arith.constant 12 : i32
    %11 = arith.addi %c12_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = "simt_step.switch"(%12, %0) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %16 = arith.addi %c16_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = simt_step.subgroup_id
      %19 = arith.index_cast %18 : index to i32
      %20 = "simt_step.switch"(%17, %19) ({
      ^bb0(%arg3: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_15 : i32
          %51 = arith.addi %50, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %52 = arith.addi %c20_i32, %51 : i32
          %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %54 = arith.cmpi ne, %53, %c0_i32_16 : i32
          "simt_step.condition"(%54, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %50 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %51 = arith.addi %arg5, %c1_i32 : i32
          %true_15 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %52 = arith.muli %arg5, %c4_i32_16 : i32
          %53 = arith.addi %c112_i32, %52 : i32
          %54 = arith.addi %53, %0 : i32
          %true_17 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50, %51) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %30 = arith.addi %c128_i32, %0 : i32
        %true_8 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %33 = arith.addi %c40_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %35 = "simt_step.switch"(%34, %c2_i32) ({
        ^bb0(%arg4: i32):
          %true_15 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %50 = arith.addi %c144_i32, %0 : i32
          %true_16 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%52: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%53: i32):  // no predecessors
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %37 = arith.addi %c44_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_9 : i32
        %40 = "simt_step.if"(%39) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %41 = arith.addi %c160_i32, %0 : i32
        %true_10 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %43 = arith.addi %c176_i32, %0 : i32
        %true_12 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb3(%45: i32):  // no predecessors
        %46 = simt_step.subgroup_id
        %47 = arith.index_cast %46 : index to i32
        %true_13 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %48 = arith.addi %c192_i32, %0 : i32
        %true_14 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %22 = simt_step.subgroup_id
      %23 = arith.index_cast %22 : index to i32
      %true_3 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %24 = arith.addi %c208_i32, %0 : i32
      %true_4 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %27 = simt_step.subgroup_id
      %28 = arith.index_cast %27 : index to i32
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c224_i32 = arith.constant 224 : i32
    %14 = arith.addi %c224_i32, %0 : i32
    %true_2 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

