module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %8, %c1_i32 : i32
      %10 = arith.cmpi slt, %arg5, %9 : i32
      "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.muli %arg5, %c4_i32 : i32
      %10 = arith.addi %c0_i32_6, %9 : i32
      %11 = arith.addi %10, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%8, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %8, %c1_i32 : i32
      %10 = arith.cmpi slt, %arg5, %9 : i32
      "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.muli %arg5, %c4_i32 : i32
      %10 = arith.addi %c16_i32, %9 : i32
      %11 = arith.addi %10, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%8, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %3 = arith.select %2, %0#0, %1#0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
    %5 = "simt_step.if"(%4) ({
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %arg0, %c1_i32 : i32
      %9 = "simt_step.switch"(%arg3, %8) ({
      ^bb0(%arg4: i32):
        %true = arith.constant true
        %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %11 = arith.addi %c32_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %14 = "simt_step.if"(%13) ({
          %true_7 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %16 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %16 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%9) : (i32) -> ()
    }, {
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %10 = arith.addi %9, %c1_i32 : i32
        %11 = arith.cmpi slt, %arg5, %10 : i32
        "simt_step.condition"(%11, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c3_i32 = arith.constant 3 : i32
        %9 = arith.remsi %arg3, %c3_i32 : i32
        %10 = "simt_step.switch"(%9, %arg0) ({
        ^bb0(%arg6: i32):
          %true = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.muli %arg5, %c4_i32 : i32
          %14 = arith.addi %c80_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          %true_8 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %18 = arith.muli %arg5, %c4_i32_9 : i32
          %19 = arith.addi %c96_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %true_10 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %23 = arith.muli %arg5, %c4_i32_11 : i32
          %24 = arith.addi %c112_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
        ^bb3(%26: i32):  // no predecessors
          %true_12 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %28 = arith.muli %arg5, %c4_i32_13 : i32
          %29 = arith.addi %c128_i32, %28 : i32
          %30 = arith.addi %29, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%10, %11) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%8#0) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_5 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
    %7 = arith.select %6, %3, %5 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_4 : i32
      %10 = arith.addi %9, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %11 = arith.addi %c8_i32, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_5 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %9 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_4 : i32
      %12 = arith.addi %c144_i32, %11 : i32
      %13 = arith.addi %12, %0 : i32
      %true_5 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_4 : i32
      %10 = arith.addi %9, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %11 = arith.addi %c28_i32, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_5 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c48_i32 = arith.constant 48 : i32
      %9 = arith.addi %c48_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %11 = simt_step.subgroup_id
      %12 = arith.index_cast %11 : index to i32
      %13 = "simt_step.switch"(%10, %12) ({
      ^bb0(%arg4: i32):
        %c52_i32 = arith.constant 52 : i32
        %20 = arith.addi %c52_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_6 : i32
        %23 = "simt_step.if"(%22) ({
          %43 = simt_step.lane_id
          %44 = arith.index_cast %43 : index to i32
          "simt_step.yield"(%44) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %24 = arith.addi %c160_i32, %0 : i32
        %true_7 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %27 = arith.addi %c56_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %29 = simt_step.subgroup_id
        %30 = arith.index_cast %29 : index to i32
        %31 = "simt_step.switch"(%28, %30) ({
        ^bb0(%arg5: i32):
          %c2_i32 = arith.constant 2 : i32
          %43 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %c0_i32_14 = arith.constant 0 : i32
          %true_15 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %45 = arith.addi %c176_i32, %0 : i32
          %true_16 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_14) {fallthrough = false} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%48: i32):  // no predecessors
          %49 = simt_step.lane_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %32 = arith.addi %c192_i32, %0 : i32
        %true_9 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb2(%34: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %35 = arith.addi %c60_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_10 : i32
        %38 = "simt_step.if"(%37) ({
          %c4_i32_14 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_14) : (i32) -> ()
        }, {
          %43 = simt_step.lane_id
          %44 = arith.index_cast %43 : index to i32
          "simt_step.yield"(%44) : (i32) -> ()
        }) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %39 = arith.addi %c208_i32, %0 : i32
        %true_11 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %41 = arith.addi %c224_i32, %0 : i32
        %true_13 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %14 = arith.addi %arg2, %13 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_4 : i32
      %17 = arith.addi %c240_i32, %16 : i32
      %18 = arith.addi %17, %0 : i32
      %true_5 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

