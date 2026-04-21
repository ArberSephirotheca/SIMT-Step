module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %3 = arith.addi %c0_i32_0, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c3_i32 = arith.constant 3 : i32
        %4 = arith.remsi %arg3, %c3_i32 : i32
        %5 = simt_step.lane_id
        %6 = arith.index_cast %5 : index to i32
        %7 = "simt_step.switch"(%4, %6) ({
        ^bb0(%arg4: i32):
          %true_1 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %11 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
        ^bb1(%12: i32):  // no predecessors
          %true_2 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %14 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        ^bb2(%15: i32):  // no predecessors
          %true_3 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %17 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb3(%18: i32):  // no predecessors
          %true_4 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %20 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %9 = arith.addi %c80_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%7) : (i32) -> ()
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
          %c96_i32 = arith.constant 96 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg5, %c4_i32 : i32
          %7 = arith.addi %c96_i32, %6 : i32
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %5 = simt_step.lane_id
    %6 = arith.index_cast %5 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %7 = arith.addi %c8_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c3_i32 = arith.constant 3 : i32
    %9 = "simt_step.switch"(%8, %c3_i32) ({
    ^bb0(%arg2: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_7 : i32
        %30 = arith.addi %29, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %31 = arith.addi %c12_i32, %30 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_8 : i32
        "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %29 = arith.addi %arg3, %arg4 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32_7 : i32
        %true_8 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_9 : i32
        %32 = arith.addi %c112_i32, %31 : i32
        %33 = arith.addi %32, %0 : i32
        %true_10 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%10#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %12 = simt_step.lane_id
      %13 = arith.index_cast %12 : index to i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb2(%14: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %15 = arith.addi %c32_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %17 = "simt_step.switch"(%16, %c1_i32) ({
      ^bb0(%arg3: i32):
        %c36_i32 = arith.constant 36 : i32
        %29 = arith.addi %c36_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_7 : i32
        %32 = "simt_step.if"(%31) ({
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) : (i32) -> ()
        }, {
          %45 = simt_step.subgroup_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) : (i32) -> ()
        }) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %33 = arith.addi %c128_i32, %0 : i32
        %true_8 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %36 = arith.addi %c40_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %38 = "simt_step.switch"(%37, %c2_i32) ({
        ^bb0(%arg4: i32):
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          %true_12 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %47 = arith.addi %c144_i32, %0 : i32
          %true_13 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %39 = arith.addi %c160_i32, %0 : i32
        %true_10 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb2(%41: i32):  // no predecessors
        %42 = simt_step.lane_id
        %43 = arith.index_cast %42 : index to i32
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb3(%44: i32):  // no predecessors
        %c3_i32_11 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_11) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %18 = arith.addi %c176_i32, %0 : i32
      %true_2 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_3 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %20 = arith.addi %c192_i32, %0 : i32
      %true_4 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb3(%22: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %23 = arith.addi %c44_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_5 : i32
      %26 = "simt_step.if"(%25) ({
        %c48_i32 = arith.constant 48 : i32
        %29 = arith.addi %c48_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %31 = "simt_step.switch"(%30, %0) ({
        ^bb0(%arg3: i32):
          %32 = simt_step.lane_id
          %33 = arith.index_cast %32 : index to i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c1_i32_7 = arith.constant 1 : i32
          %true_8 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %35 = arith.addi %c208_i32, %0 : i32
          %true_9 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_7) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%31) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %30 = arith.muli %arg4, %c4_i32_9 : i32
          %31 = arith.addi %30, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %32 = arith.addi %c52_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_10 : i32
          "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %30 = arith.addi %arg3, %arg4 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %31 = arith.addi %arg4, %c1_i32_9 : i32
          %true_10 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %32 = arith.muli %arg4, %c4_i32_11 : i32
          %33 = arith.addi %c224_i32, %32 : i32
          %34 = arith.addi %33, %0 : i32
          %true_12 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) : (i32) -> ()
      }) : (i1) -> i32
      %c240_i32 = arith.constant 240 : i32
      %27 = arith.addi %c240_i32, %0 : i32
      %true_6 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

