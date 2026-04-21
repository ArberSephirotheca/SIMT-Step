module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32_5 : i32
        %9 = arith.cmpi slt, %arg7, %8 : i32
        "simt_step.condition"(%9, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %7:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg8: i32, %arg9: i32):
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %10 = arith.addi %9, %c1_i32_8 : i32
          %11 = arith.cmpi slt, %arg9, %10 : i32
          "simt_step.condition"(%11, %arg8, %arg9) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg8: i32, %arg9: i32):
          %true_8 = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg9, %c4_i32 : i32
          %11 = arith.addi %c16_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_9 = arith.constant 1 : i32
          %13 = arith.addi %arg9, %c1_i32_9 : i32
          "simt_step.break"(%9, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_7 = arith.constant 1 : i32
        %8 = arith.addi %arg7, %c1_i32_7 : i32
        "simt_step.yield"(%7#0, %8) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%5#0, %6) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_7 : i32
      %20 = arith.addi %19, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %21 = arith.addi %c8_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_8 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      %true_7 = arith.constant true
      %c32_i32 = arith.constant 32 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_8 : i32
      %22 = arith.addi %c32_i32, %21 : i32
      %23 = arith.addi %22, %0 : i32
      %true_9 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %6 = arith.addi %c28_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c3_i32 = arith.constant 3 : i32
    %8 = arith.addi %0, %c3_i32 : i32
    %9 = "simt_step.switch"(%7, %8) ({
    ^bb0(%arg2: i32):
      %c3_i32_7 = arith.constant 3 : i32
      %19 = arith.addi %0, %c3_i32_7 : i32
      %true_8 = arith.constant true
      %c48_i32 = arith.constant 48 : i32
      %20 = arith.addi %c48_i32, %0 : i32
      %true_9 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %10 = arith.addi %c64_i32, %0 : i32
    %true_2 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %12:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_7 : i32
      %20 = arith.addi %19, %0 : i32
      %c32_i32 = arith.constant 32 : i32
      %21 = arith.addi %c32_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_8 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      %true_7 = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_8 : i32
      %22 = arith.addi %c80_i32, %21 : i32
      %23 = arith.addi %22, %0 : i32
      %true_9 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c52_i32 = arith.constant 52 : i32
    %13 = arith.addi %c52_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_5 = arith.constant 0 : i32
    %15 = arith.cmpi ne, %14, %c0_i32_5 : i32
    %16 = "simt_step.if"(%15) ({
      %c56_i32 = arith.constant 56 : i32
      %19 = arith.addi %c56_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_7 : i32
      %22 = "simt_step.if"(%21) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c60_i32 = arith.constant 60 : i32
        %25 = arith.addi %c60_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_9 = arith.constant 4 : i32
        %27 = "simt_step.switch"(%26, %c4_i32_9) ({
        ^bb0(%arg2: i32):
          %true_12 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %30 = arith.addi %c96_i32, %0 : i32
          %true_13 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %true_14 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %33 = arith.addi %c112_i32, %0 : i32
          %true_15 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %true_16 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %36 = arith.addi %c128_i32, %0 : i32
          %true_17 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%38: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %28 = arith.addi %c144_i32, %0 : i32
        %true_11 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) : (i32) -> ()
      }) : (i1) -> i32
      %c160_i32 = arith.constant 160 : i32
      %23 = arith.addi %c160_i32, %0 : i32
      %true_8 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) : (i32) -> ()
    }, {
      %c64_i32_7 = arith.constant 64 : i32
      %19 = arith.addi %c64_i32_7, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_8 : i32
      %22 = "simt_step.if"(%21) ({
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %26 = arith.muli %arg3, %c4_i32_12 : i32
          %27 = arith.addi %26, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %28 = arith.addi %c68_i32, %27 : i32
          %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %30 = arith.cmpi ne, %29, %c0_i32_13 : i32
          "simt_step.condition"(%30, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %26 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg3, %c1_i32 : i32
          %true_12 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %28 = arith.muli %arg3, %c4_i32_13 : i32
          %29 = arith.addi %c176_i32, %28 : i32
          %30 = arith.addi %29, %0 : i32
          %true_14 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) : (i32) -> ()
      }, {
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %26 = arith.muli %arg3, %c4_i32_12 : i32
          %27 = arith.addi %26, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %28 = arith.addi %c88_i32, %27 : i32
          %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %30 = arith.cmpi ne, %29, %c0_i32_13 : i32
          "simt_step.condition"(%30, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %26 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg3, %c1_i32 : i32
          %true_12 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %28 = arith.muli %arg3, %c4_i32_13 : i32
          %29 = arith.addi %c192_i32, %28 : i32
          %30 = arith.addi %29, %0 : i32
          %true_14 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) : (i32) -> ()
      }) : (i1) -> i32
      %c208_i32 = arith.constant 208 : i32
      %23 = arith.addi %c208_i32, %0 : i32
      %true_9 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) : (i32) -> ()
    }) : (i1) -> i32
    %c224_i32 = arith.constant 224 : i32
    %17 = arith.addi %c224_i32, %0 : i32
    %true_6 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

