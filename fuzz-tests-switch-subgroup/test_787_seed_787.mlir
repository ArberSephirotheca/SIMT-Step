module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.addi %arg0, %c2_i32 : i32
    %1 = "simt_step.switch"(%arg3, %0) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %c0_i32_0 = arith.constant 0 : i32
      %2:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %6 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %6, %c1_i32 : i32
        %8 = arith.cmpi slt, %arg6, %7 : i32
        "simt_step.condition"(%8, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %9 = arith.addi %8, %c1_i32_4 : i32
          %10 = arith.cmpi slt, %arg8, %9 : i32
          "simt_step.condition"(%10, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_4 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.muli %arg8, %c4_i32 : i32
          %10 = arith.addi %c0_i32_4, %9 : i32
          %11 = arith.addi %10, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_5 = arith.constant 1 : i32
          %12 = arith.addi %arg8, %c1_i32_5 : i32
          "simt_step.yield"(%8, %12) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%6#0, %7) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%3: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %5 = "simt_step.if"(%4) ({
        %c2_i32_2 = arith.constant 2 : i32
        %6 = arith.remsi %arg3, %c2_i32_2 : i32
        %c4_i32 = arith.constant 4 : i32
        %7 = "simt_step.switch"(%6, %c4_i32) ({
        ^bb0(%arg5: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %9 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
        ^bb1(%10: i32):  // no predecessors
          %true_3 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %12 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%7) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %8 = arith.addi %7, %c1_i32 : i32
          %9 = arith.cmpi slt, %arg6, %8 : i32
          "simt_step.condition"(%9, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true = arith.constant true
          %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.muli %arg6, %c4_i32 : i32
          %9 = arith.addi %c48_i32, %8 : i32
          %10 = arith.addi %9, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %11 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%7, %11) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%6#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
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
      %10 = arith.addi %c8_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_2 : i32
      "simt_step.if"(%12) ({
        "simt_step.yield"() : () -> ()
      }, {
        %13 = simt_step.subgroup_id
        %14 = arith.index_cast %13 : index to i32
        %15 = "simt_step.switch"(%0, %14) ({
        ^bb0(%arg2: i32):
          %c2_i32 = arith.constant 2 : i32
          %16 = arith.addi %arg2, %c2_i32 : i32
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
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %10 = arith.addi %c16_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %12 = simt_step.subgroup_id
      %13 = arith.index_cast %12 : index to i32
      %14 = "simt_step.switch"(%11, %13) ({
      ^bb0(%arg3: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_12 : i32
          %37 = arith.addi %36, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %38 = arith.addi %c20_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_13 : i32
          "simt_step.condition"(%40, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %36 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg5, %c1_i32 : i32
          %true_12 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %38 = arith.muli %arg5, %c4_i32_13 : i32
          %39 = arith.addi %c64_i32, %38 : i32
          %40 = arith.addi %39, %0 : i32
          %true_14 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%18#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %20 = arith.addi %c40_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %22 = simt_step.lane_id
        %23 = arith.index_cast %22 : index to i32
        %24 = "simt_step.switch"(%21, %23) ({
        ^bb0(%arg4: i32):
          %true_12 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %36 = arith.addi %c80_i32, %0 : i32
          %true_13 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %39 = simt_step.subgroup_id
          %40 = arith.index_cast %39 : index to i32
          %true_14 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %41 = arith.addi %c96_i32, %0 : i32
          %true_15 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb2(%43: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%44: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %25 = arith.addi %c112_i32, %0 : i32
        %true_7 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
      ^bb2(%27: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %28 = arith.addi %c44_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_8 : i32
        %31 = "simt_step.if"(%30) ({
          %36 = simt_step.subgroup_id
          %37 = arith.index_cast %36 : index to i32
          "simt_step.yield"(%37) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %32 = arith.addi %c128_i32, %0 : i32
        %true_9 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_10 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %34 = arith.addi %c144_i32, %0 : i32
        %true_11 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %15 = arith.addi %c160_i32, %0 : i32
      %true_2 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c4_i32_3 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32_3) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c4_i32_1 = arith.constant 4 : i32
    %9 = arith.addi %0, %c4_i32_1 : i32
    return
  }
}

