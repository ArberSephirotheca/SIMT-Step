module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %3 = "simt_step.if"(%2) ({
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32 : i32
        %9 = arith.cmpi slt, %arg5, %8 : i32
        "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %7 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %8 = "simt_step.if"(%7) ({
          %true_5 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg5, %c4_i32 : i32
          %12 = arith.addi %c16_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }, {
          %true_5 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg5, %c4_i32 : i32
          %12 = arith.addi %c32_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %9 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%8, %9) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%6#0) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      %6 = arith.remsi %arg3, %c3_i32 : i32
      %7 = "simt_step.switch"(%6, %arg0) ({
      ^bb0(%arg4: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %9 = "simt_step.if"(%8) ({
          %true_8 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %18 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %18 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %true_3 = arith.constant true
        %11 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %12 = arith.addi %c80_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
      ^bb2(%13: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32 : i32
          %19 = arith.cmpi slt, %arg6, %18 : i32
          "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_8 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.muli %arg6, %c4_i32 : i32
          %19 = arith.addi %c96_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%17, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%15: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32 : i32
          %19 = arith.cmpi slt, %arg6, %18 : i32
          "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_8 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.muli %arg6, %c4_i32 : i32
          %19 = arith.addi %c112_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%17, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%7) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %0, %3 : i32
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
      %23 = arith.addi %c12_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %25 = arith.addi %0, %c3_i32 : i32
      %26 = "simt_step.switch"(%24, %25) ({
      ^bb0(%arg2: i32):
        %c16_i32 = arith.constant 16 : i32
        %29 = arith.addi %c16_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_7 : i32
        %32 = "simt_step.if"(%31) ({
          %c4_i32_17 = arith.constant 4 : i32
          %43 = arith.addi %0, %c4_i32_17 : i32
          "simt_step.yield"(%43) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %33 = arith.addi %c128_i32, %0 : i32
        %true_8 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_17 : i32
          %44 = arith.addi %43, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %45 = arith.addi %c20_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_18 : i32
          "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %43 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %arg4, %c1_i32 : i32
          %true_17 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_18 : i32
          %46 = arith.addi %c144_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_19 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %37 = arith.addi %c160_i32, %0 : i32
        %true_12 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_17 : i32
          %44 = arith.addi %43, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %45 = arith.addi %c40_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_18 : i32
          "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %43 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %arg4, %c1_i32 : i32
          %true_17 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_18 : i32
          %46 = arith.addi %c176_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_19 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %41 = arith.addi %c192_i32, %0 : i32
        %true_16 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %27 = arith.addi %c208_i32, %0 : i32
      %true_6 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) : (i32) -> ()
    }, {
      %c60_i32 = arith.constant 60 : i32
      %23 = arith.addi %c60_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_5 : i32
      %26 = "simt_step.if"(%25) ({
        %c64_i32 = arith.constant 64 : i32
        %29 = arith.addi %c64_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_7 = arith.constant 4 : i32
        %31 = arith.addi %0, %c4_i32_7 : i32
        %32 = "simt_step.switch"(%30, %31) ({
        ^bb0(%arg2: i32):
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%33) {fallthrough = true} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %35 = simt_step.lane_id
          %36 = arith.index_cast %35 : index to i32
          %true_8 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %37 = arith.addi %c224_i32, %0 : i32
          %true_9 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %30 = arith.muli %arg3, %c4_i32_9 : i32
          %31 = arith.addi %30, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %32 = arith.addi %c68_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_10 : i32
          "simt_step.condition"(%34, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %30 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg3, %c1_i32 : i32
          %true_9 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %32 = arith.muli %arg3, %c4_i32_10 : i32
          %33 = arith.addi %c240_i32, %32 : i32
          %34 = arith.addi %33, %0 : i32
          %true_11 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) : (i32) -> ()
      }) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %27 = arith.addi %c256_i32, %0 : i32
      %true_6 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) : (i32) -> ()
    }) : (i1) -> i32
    %c272_i32 = arith.constant 272 : i32
    %9 = arith.addi %c272_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c88_i32 = arith.constant 88 : i32
    %11 = arith.addi %c88_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
    %14 = "simt_step.if"(%13) ({
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32) : (i32) -> ()
    }, {
      %c92_i32 = arith.constant 92 : i32
      %23 = arith.addi %c92_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_5 : i32
      %26 = "simt_step.if"(%25) ({
        %c96_i32 = arith.constant 96 : i32
        %29 = arith.addi %c96_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_7 : i32
        %32 = "simt_step.if"(%31) ({
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %35 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }) : (i1) -> i32
        %c288_i32 = arith.constant 288 : i32
        %33 = arith.addi %c288_i32, %0 : i32
        %true_8 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %30 = arith.muli %arg3, %c4_i32_9 : i32
          %31 = arith.addi %30, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %32 = arith.addi %c100_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_10 : i32
          "simt_step.condition"(%34, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %30 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg3, %c1_i32 : i32
          %true_9 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %32 = arith.muli %arg3, %c4_i32_10 : i32
          %33 = arith.addi %c304_i32, %32 : i32
          %34 = arith.addi %33, %0 : i32
          %true_11 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) : (i32) -> ()
      }) : (i1) -> i32
      %c320_i32 = arith.constant 320 : i32
      %27 = arith.addi %c320_i32, %0 : i32
      %true_6 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) : (i32) -> ()
    }) : (i1) -> i32
    %c336_i32 = arith.constant 336 : i32
    %15 = arith.addi %c336_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c120_i32 = arith.constant 120 : i32
    %17 = arith.addi %c120_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %19 = arith.cmpi ne, %18, %c0_i32_3 : i32
    %20 = "simt_step.if"(%19) ({
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %24 = arith.muli %arg3, %c4_i32_7 : i32
        %25 = arith.addi %24, %0 : i32
        %c124_i32 = arith.constant 124 : i32
        %26 = arith.addi %c124_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_8 : i32
        "simt_step.condition"(%28, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %24 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %26 = arith.muli %arg3, %c4_i32_8 : i32
        %27 = arith.addi %c352_i32, %26 : i32
        %28 = arith.addi %27, %0 : i32
        %true_9 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32) : (i32) -> ()
    }) : (i1) -> i32
    %c368_i32 = arith.constant 368 : i32
    %21 = arith.addi %c368_i32, %0 : i32
    %true_4 = arith.constant true
    %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

