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
        %true = arith.constant true
        %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %5 = arith.muli %arg5, %c4_i32 : i32
        %6 = arith.addi %c0_i32_2, %5 : i32
        %7 = arith.addi %6, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%4) : (i32) -> ()
      }, {
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
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg7, %c4_i32 : i32
          %7 = arith.addi %c16_i32, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_4 = arith.constant 1 : i32
          %9 = arith.addi %arg7, %c1_i32_4 : i32
          "simt_step.continue"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) : (i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c8_i32 = arith.constant 8 : i32
      %9 = arith.addi %c8_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_6 : i32
      "simt_step.if"(%11) ({
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_6 : i32
      %10 = arith.addi %9, %0 : i32
      %c12_i32 = arith.constant 12 : i32
      %11 = arith.addi %c12_i32, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_7 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c32_i32 = arith.constant 32 : i32
      %9 = arith.addi %c32_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %11 = simt_step.subgroup_id
      %12 = arith.index_cast %11 : index to i32
      %13 = "simt_step.switch"(%10, %12) ({
      ^bb0(%arg4: i32):
        %c36_i32 = arith.constant 36 : i32
        %22 = arith.addi %c36_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %24 = "simt_step.switch"(%23, %c3_i32) ({
        ^bb0(%arg5: i32):
          %true_14 = arith.constant true
          %c32_i32_15 = arith.constant 32 : i32
          %34 = arith.addi %c32_i32_15, %0 : i32
          %true_16 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %37 = simt_step.subgroup_id
          %38 = arith.index_cast %37 : index to i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %40 = simt_step.lane_id
          %41 = arith.index_cast %40 : index to i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb3(%42: i32):  // no predecessors
          %c4_i32_17 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c48_i32 = arith.constant 48 : i32
        %25 = arith.addi %c48_i32, %0 : i32
        %true_11 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %28 = arith.addi %c40_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_12 : i32
        %31 = "simt_step.if"(%30) ({
          %c1_i32_14 = arith.constant 1 : i32
          %34 = arith.addi %0, %c1_i32_14 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }, {
          %34 = simt_step.lane_id
          %35 = arith.index_cast %34 : index to i32
          "simt_step.yield"(%35) : (i32) -> ()
        }) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %32 = arith.addi %c64_i32, %0 : i32
        %true_13 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %14 = arith.addi %c80_i32, %0 : i32
      %true_6 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %16 = arith.addi %arg2, %13 : i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg3, %c1_i32 : i32
      %true_7 = arith.constant true
      %c96_i32 = arith.constant 96 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_8 : i32
      %19 = arith.addi %c96_i32, %18 : i32
      %20 = arith.addi %19, %0 : i32
      %true_9 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_6 : i32
      %10 = arith.addi %9, %0 : i32
      %c44_i32 = arith.constant 44 : i32
      %11 = arith.addi %c44_i32, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_7 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32 = arith.constant 64 : i32
      %9 = arith.addi %c64_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %11 = simt_step.subgroup_id
      %12 = arith.index_cast %11 : index to i32
      %13 = "simt_step.switch"(%10, %12) ({
      ^bb0(%arg4: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %25 = arith.muli %arg6, %c4_i32_14 : i32
          %26 = arith.addi %25, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %27 = arith.addi %c68_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_15 : i32
          "simt_step.condition"(%29, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %25 = arith.addi %arg5, %arg6 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %26 = arith.addi %arg6, %c1_i32_14 : i32
          %true_15 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %27 = arith.muli %arg6, %c4_i32_16 : i32
          %28 = arith.addi %c112_i32, %27 : i32
          %29 = arith.addi %28, %0 : i32
          %true_17 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %25 = arith.muli %arg6, %c4_i32_14 : i32
          %26 = arith.addi %25, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %27 = arith.addi %c88_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_15 : i32
          "simt_step.condition"(%29, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %25 = arith.addi %arg5, %arg6 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %26 = arith.addi %arg6, %c1_i32_14 : i32
          %true_15 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %27 = arith.muli %arg6, %c4_i32_16 : i32
          %28 = arith.addi %c128_i32, %27 : i32
          %29 = arith.addi %28, %0 : i32
          %true_17 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %23 = arith.addi %c144_i32, %0 : i32
        %true_13 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %14 = arith.addi %arg2, %13 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_6 : i32
      %17 = arith.addi %c160_i32, %16 : i32
      %18 = arith.addi %17, %0 : i32
      %true_7 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c4_i32_5 = arith.constant 4 : i32
    %8 = arith.addi %0, %c4_i32_5 : i32
    return
  }
}

