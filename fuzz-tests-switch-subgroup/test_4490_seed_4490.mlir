module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %true = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %7 = arith.addi %c0_i32_1, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
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
      "simt_step.yield"(%6#0) : (i32) -> ()
    }) : (i1) -> i32
    %c2_i32 = arith.constant 2 : i32
    %2 = arith.remsi %arg3, %c2_i32 : i32
    %3 = "simt_step.switch"(%2, %arg0) ({
    ^bb0(%arg4: i32):
      %c4_i32 = arith.constant 4 : i32
      %6 = arith.remsi %arg3, %c4_i32 : i32
      %7 = "simt_step.switch"(%6, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %11 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %12 = "simt_step.if"(%11) ({
          %true = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %24 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }, {
          %true = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %24 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb1(%13: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %15 = "simt_step.if"(%14) ({
          %true = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %24 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }, {
          %true = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %24 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb2(%16: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %17 = arith.remsi %arg3, %c3_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg0, %c1_i32 : i32
        %19 = "simt_step.switch"(%17, %18) ({
        ^bb0(%arg6: i32):
          %true = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %24 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_5 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %27 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %true_6 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %30 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
        ^bb3(%31: i32):  // no predecessors
          %true_7 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %33 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb3(%20: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %22 = "simt_step.if"(%21) ({
          %true = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %24 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }, {
          %true = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %24 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %9 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %10 = "simt_step.if"(%9) ({
        %c2_i32_2 = arith.constant 2 : i32
        %11 = arith.remsi %arg3, %c2_i32_2 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %12 = "simt_step.switch"(%11, %c0_i32_3) ({
        ^bb0(%arg5: i32):
          %true = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %14 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        ^bb1(%15: i32):  // no predecessors
          %true_4 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %17 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb2(%18: i32):  // no predecessors
          %true_5 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %20 = arith.addi %c224_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%12) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %11 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %12 = "simt_step.if"(%11) ({
          %true = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %14 = arith.addi %c240_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) : (i32) -> ()
        }, {
          %true = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %14 = arith.addi %c256_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%12) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %5 = arith.select %4, %1, %3 : i32
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
      %8 = arith.addi %c8_i32, %0 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %9, %c0_i32_5 : i32
      "simt_step.if"(%10) ({
        "simt_step.yield"() : () -> ()
      }, {
        %c4_i32_6 = arith.constant 4 : i32
        %11 = arith.remsi %0, %c4_i32_6 : i32
        %12 = simt_step.subgroup_id
        %13 = arith.index_cast %12 : index to i32
        %14 = "simt_step.switch"(%11, %13) ({
        ^bb0(%arg2: i32):
          %c1_i32 = arith.constant 1 : i32
          %15 = arith.addi %arg2, %c1_i32 : i32
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %17 = arith.addi %16, %c2_i32 : i32
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb2(%18: i32):  // no predecessors
          %c0_i32_7 = arith.constant 0 : i32
          %19 = arith.addi %18, %c0_i32_7 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb3(%20: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          %21 = arith.addi %20, %c4_i32_8 : i32
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c4_i32_5 = arith.constant 4 : i32
      %8 = arith.muli %arg3, %c4_i32_5 : i32
      %9 = arith.addi %8, %0 : i32
      %c12_i32 = arith.constant 12 : i32
      %10 = arith.addi %c12_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_6 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %8 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %10 = arith.muli %arg3, %c4_i32_5 : i32
      %11 = arith.addi %c272_i32, %10 : i32
      %12 = arith.addi %11, %0 : i32
      %true_6 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %8 = arith.muli %arg3, %c4_i32_5 : i32
      %9 = arith.addi %8, %0 : i32
      %c32_i32 = arith.constant 32 : i32
      %10 = arith.addi %c32_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_6 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %8 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %10 = arith.muli %arg3, %c4_i32_5 : i32
      %11 = arith.addi %c288_i32, %10 : i32
      %12 = arith.addi %11, %0 : i32
      %true_6 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

