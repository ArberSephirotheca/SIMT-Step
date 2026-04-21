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
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c12_i32 = arith.constant 12 : i32
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_4 : i32
      %19 = "simt_step.if"(%18) ({
        %c16_i32 = arith.constant 16 : i32
        %22 = arith.addi %c16_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_6 : i32
        %25 = "simt_step.if"(%24) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %28 = simt_step.subgroup_id
          %29 = arith.index_cast %28 : index to i32
          "simt_step.yield"(%29) : (i32) -> ()
        }) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %26 = arith.addi %c32_i32, %0 : i32
        %true_7 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %20 = arith.addi %c48_i32, %0 : i32
      %true_5 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) : (i32) -> ()
    }, {
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %17 = arith.muli %arg3, %c4_i32_6 : i32
        %18 = arith.addi %17, %0 : i32
        %c20_i32 = arith.constant 20 : i32
        %19 = arith.addi %c20_i32, %18 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_7 : i32
        "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %17 = arith.addi %arg2, %0 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg3, %c1_i32 : i32
        %true_6 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %19 = arith.muli %arg3, %c4_i32_7 : i32
        %20 = arith.addi %c64_i32, %19 : i32
        %21 = arith.addi %20, %0 : i32
        %true_8 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%17, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) : (i32) -> ()
    }) : (i1) -> i32
    %c80_i32 = arith.constant 80 : i32
    %9 = arith.addi %c80_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c40_i32 = arith.constant 40 : i32
    %11 = arith.addi %c40_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = "simt_step.switch"(%12, %c0_i32_1) ({
    ^bb0(%arg2: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_14 : i32
        %27 = arith.addi %26, %0 : i32
        %c44_i32 = arith.constant 44 : i32
        %28 = arith.addi %c44_i32, %27 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_15 : i32
        "simt_step.condition"(%30, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32 = arith.constant 64 : i32
        %26 = arith.addi %c64_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %28 = "simt_step.switch"(%27, %c1_i32) ({
        ^bb0(%arg5: i32):
          %c0_i32_18 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_18) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %true_19 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %36 = arith.addi %c96_i32, %0 : i32
          %true_20 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          %39 = simt_step.lane_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb3(%41: i32):  // no predecessors
          %c1_i32_21 = arith.constant 1 : i32
          %42 = arith.addi %0, %c1_i32_21 : i32
          %true_22 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %43 = arith.addi %c112_i32, %0 : i32
          %true_23 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %29 = arith.addi %arg3, %28 : i32
        %c1_i32_14 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32_14 : i32
        %true_15 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %c4_i32_16 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_16 : i32
        %32 = arith.addi %c128_i32, %31 : i32
        %33 = arith.addi %32, %0 : i32
        %true_17 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %17 = arith.addi %c144_i32, %0 : i32
      %true_7 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_14 : i32
        %27 = arith.addi %26, %0 : i32
        %c68_i32 = arith.constant 68 : i32
        %28 = arith.addi %c68_i32, %27 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_15 : i32
        "simt_step.condition"(%30, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %26 = simt_step.lane_id
        %27 = arith.index_cast %26 : index to i32
        %28 = arith.addi %arg3, %27 : i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32 : i32
        %true_14 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %c4_i32_15 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_15 : i32
        %31 = arith.addi %c160_i32, %30 : i32
        %32 = arith.addi %31, %0 : i32
        %true_16 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb3(%22: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_14 : i32
        %27 = arith.addi %26, %0 : i32
        %c88_i32 = arith.constant 88 : i32
        %28 = arith.addi %c88_i32, %27 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_15 : i32
        "simt_step.condition"(%30, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %26 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %27 = arith.addi %arg4, %c1_i32 : i32
        %true_14 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %c4_i32_15 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_15 : i32
        %29 = arith.addi %c176_i32, %28 : i32
        %30 = arith.addi %29, %0 : i32
        %true_16 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_12 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %24 = arith.addi %c192_i32, %0 : i32
      %true_13 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %c208_i32 = arith.constant 208 : i32
    %14 = arith.addi %c208_i32, %0 : i32
    %true_3 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

