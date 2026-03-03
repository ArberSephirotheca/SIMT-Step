module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.subgroup_id
    %1 = arith.index_cast %0 : index to i32
    %c0_i32 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %3 = "simt_step.if"(%2) ({
      %c4_i32 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32) : (i32) -> ()
    }, {
      "simt_step.yield"(%arg0) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32_0, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %7 = arith.select %6, %1, %3 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %21 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %22 = arith.addi %21, %c1_i32 : i32
      %23 = arith.cmpi slt, %arg5, %22 : i32
      "simt_step.condition"(%23, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %21 = simt_step.subgroup_id
      %22 = arith.index_cast %21 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %23 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%22, %23) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_4 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_5 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
    %12 = arith.select %11, %7, %8#0 : i32
    %c2_i32 = arith.constant 2 : i32
    %13 = arith.remsi %arg3, %c2_i32 : i32
    %14 = simt_step.subgroup_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg4: i32):
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %23 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %23, %c1_i32 : i32
        %25 = arith.cmpi slt, %arg6, %24 : i32
        "simt_step.condition"(%25, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %arg2, %c0_i32_10 : i32
        %24 = "simt_step.if"(%23) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_6 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %18 = arith.addi %c32_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_7 = arith.constant 0 : i32
    %19 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
    %20 = arith.select %19, %12, %16 : i32
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
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %26 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %10 = arith.addi %c48_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %12:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_11 = arith.constant 4 : i32
      %25 = arith.muli %arg3, %c4_i32_11 : i32
      %26 = arith.addi %25, %0 : i32
      %c12_i32 = arith.constant 12 : i32
      %27 = arith.addi %c12_i32, %26 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %29 = arith.cmpi ne, %28, %c0_i32_12 : i32
      "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %25 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %26 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%25, %26) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_3 = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %13 = arith.addi %c64_i32, %0 : i32
    %true_4 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_5 = arith.constant 0 : i32
    %c0_i32_6 = arith.constant 0 : i32
    %15:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_11 = arith.constant 4 : i32
      %25 = arith.muli %arg3, %c4_i32_11 : i32
      %26 = arith.addi %25, %0 : i32
      %c32_i32 = arith.constant 32 : i32
      %27 = arith.addi %c32_i32, %26 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %29 = arith.cmpi ne, %28, %c0_i32_12 : i32
      "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_11 = arith.constant 0 : i32
      %25 = arith.addi %arg2, %c0_i32_11 : i32
      %c1_i32 = arith.constant 1 : i32
      %26 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.break"(%25, %26) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_7 = arith.constant true
    %c80_i32 = arith.constant 80 : i32
    %16 = arith.addi %c80_i32, %0 : i32
    %true_8 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c52_i32 = arith.constant 52 : i32
    %18 = arith.addi %c52_i32, %0 : i32
    %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
    %20 = simt_step.lane_id
    %21 = arith.index_cast %20 : index to i32
    %22 = "simt_step.switch"(%19, %21) ({
    ^bb0(%arg2: i32):
      %c56_i32 = arith.constant 56 : i32
      %25 = arith.addi %c56_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_11 : i32
      %28 = "simt_step.if"(%27) ({
        %c2_i32 = arith.constant 2 : i32
        %38 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    ^bb1(%29: i32):  // no predecessors
      %c0_i32_12 = arith.constant 0 : i32
      %c0_i32_13 = arith.constant 0 : i32
      %30:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_19 = arith.constant 4 : i32
        %38 = arith.muli %arg4, %c4_i32_19 : i32
        %39 = arith.addi %38, %0 : i32
        %c60_i32 = arith.constant 60 : i32
        %40 = arith.addi %c60_i32, %39 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_20 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_20 : i32
        "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_19 = arith.constant 0 : i32
        %c0_i32_20 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_19, %c0_i32_20) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %41 = arith.muli %arg6, %c4_i32_22 : i32
          %42 = arith.addi %41, %0 : i32
          %c80_i32_23 = arith.constant 80 : i32
          %43 = arith.addi %c80_i32_23, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_24 : i32
          "simt_step.condition"(%45, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %41 = arith.addi %arg5, %arg6 : i32
          %c1_i32_22 = arith.constant 1 : i32
          %42 = arith.addi %arg6, %c1_i32_22 : i32
          "simt_step.continue"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_21 = arith.constant true
        %39 = arith.addi %arg3, %38#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %40 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%39, %40) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_14 = arith.constant true
      "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%31: i32):  // no predecessors
      %c100_i32 = arith.constant 100 : i32
      %32 = arith.addi %c100_i32, %0 : i32
      %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_15 = arith.constant 0 : i32
      %34 = arith.cmpi ne, %33, %c0_i32_15 : i32
      %35 = "simt_step.if"(%34) ({
        %c104_i32 = arith.constant 104 : i32
        %38 = arith.addi %c104_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %40 = "simt_step.switch"(%39, %c2_i32) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %c2_i32_20 = arith.constant 2 : i32
          %42 = arith.addi %0, %c2_i32_20 : i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb2(%43: i32):  // no predecessors
          %c0_i32_21 = arith.constant 0 : i32
          %44 = arith.addi %0, %c0_i32_21 : i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        "simt_step.yield"(%40) : (i32) -> ()
      }, {
        %c0_i32_19 = arith.constant 0 : i32
        %c0_i32_20 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_19, %c0_i32_20) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %39 = arith.muli %arg4, %c4_i32_22 : i32
          %40 = arith.addi %39, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %41 = arith.addi %c108_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_23 : i32
          "simt_step.condition"(%43, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %39 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.continue"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_21 = arith.constant true
        "simt_step.yield"(%38#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
    ^bb3(%36: i32):  // no predecessors
      %c0_i32_16 = arith.constant 0 : i32
      %c0_i32_17 = arith.constant 0 : i32
      %37:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_19 = arith.constant 4 : i32
        %38 = arith.muli %arg4, %c4_i32_19 : i32
        %39 = arith.addi %38, %0 : i32
        %c128_i32 = arith.constant 128 : i32
        %40 = arith.addi %c128_i32, %39 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_20 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_20 : i32
        "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %38 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %39 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.break"(%38, %39) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_18 = arith.constant true
      "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_9 = arith.constant true
    %c96_i32 = arith.constant 96 : i32
    %23 = arith.addi %c96_i32, %0 : i32
    %true_10 = arith.constant true
    %24 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

