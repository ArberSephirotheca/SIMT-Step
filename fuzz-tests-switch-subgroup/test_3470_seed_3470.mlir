module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32 : i32
        %5 = arith.cmpi slt, %arg5, %4 : i32
        "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %3:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
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
          %c0_i32_4 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg7, %c4_i32 : i32
          %7 = arith.addi %c0_i32_4, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_5 = arith.constant 1 : i32
          %9 = arith.addi %arg7, %c1_i32_5 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.break"(%3#0, %4) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32 : i32
        %5 = arith.cmpi slt, %arg5, %4 : i32
        "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %true = arith.constant true
        %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %c4_i32 = arith.constant 4 : i32
        %4 = arith.muli %arg5, %c4_i32 : i32
        %5 = arith.addi %c16_i32, %4 : i32
        %6 = arith.addi %5, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %6, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%3, %7) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_5 : i32
      %19 = arith.addi %18, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %20 = arith.addi %c8_i32, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_6 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %25 = arith.muli %arg5, %c4_i32_10 : i32
        %26 = arith.addi %25, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %27 = arith.addi %c28_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_11 : i32
        "simt_step.condition"(%29, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %32 = arith.muli %arg7, %c4_i32_16 : i32
          %33 = arith.addi %32, %0 : i32
          %c48_i32_17 = arith.constant 48 : i32
          %34 = arith.addi %c48_i32_17, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_18 : i32
          "simt_step.condition"(%36, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %32 = arith.addi %arg6, %arg7 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %33 = arith.addi %arg7, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %34 = arith.muli %arg7, %c4_i32_18 : i32
          %35 = arith.addi %c32_i32, %34 : i32
          %36 = arith.addi %35, %0 : i32
          %true_19 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %26 = arith.addi %arg4, %25#0 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %27 = arith.addi %arg5, %c1_i32_12 : i32
        %true_13 = arith.constant true
        %c48_i32 = arith.constant 48 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %28 = arith.muli %arg5, %c4_i32_14 : i32
        %29 = arith.addi %c48_i32, %28 : i32
        %30 = arith.addi %29, %0 : i32
        %true_15 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %19 = arith.addi %arg2, %18#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      %true_7 = arith.constant true
      %c64_i32 = arith.constant 64 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_8 : i32
      %22 = arith.addi %c64_i32, %21 : i32
      %23 = arith.addi %22, %0 : i32
      %true_9 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c68_i32 = arith.constant 68 : i32
    %6 = arith.addi %c68_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_2 : i32
    %9 = "simt_step.if"(%8) ({
      %c72_i32 = arith.constant 72 : i32
      %18 = arith.addi %c72_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_5 = arith.constant 4 : i32
      %20 = arith.addi %0, %c4_i32_5 : i32
      %21 = "simt_step.switch"(%19, %20) ({
      ^bb0(%arg2: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %36 = arith.muli %arg4, %c4_i32_17 : i32
          %37 = arith.addi %36, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %38 = arith.addi %c76_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_18 : i32
          "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %36 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg4, %c1_i32 : i32
          %true_17 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_18 : i32
          %39 = arith.addi %c80_i32, %38 : i32
          %40 = arith.addi %39, %0 : i32
          %true_19 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %23 = arith.addi %c96_i32, %0 : i32
        %true_9 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c96_i32_10 = arith.constant 96 : i32
        %26 = arith.addi %c96_i32_10, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_11 : i32
        %29 = "simt_step.if"(%28) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %36 = simt_step.subgroup_id
          %37 = arith.index_cast %36 : index to i32
          "simt_step.yield"(%37) : (i32) -> ()
        }) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %30 = arith.addi %c112_i32, %0 : i32
        %true_12 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_13 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %32 = arith.addi %c128_i32, %0 : i32
        %true_14 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
      ^bb2(%34: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %36 = arith.muli %arg4, %c4_i32_17 : i32
          %37 = arith.addi %36, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %38 = arith.addi %c100_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_18 : i32
          "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %36 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg4, %c1_i32 : i32
          %true_17 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_18 : i32
          %39 = arith.addi %c144_i32, %38 : i32
          %40 = arith.addi %39, %0 : i32
          %true_19 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) : (i32) -> ()
    }, {
      %c120_i32 = arith.constant 120 : i32
      %18 = arith.addi %c120_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg2: i32):
        %c124_i32 = arith.constant 124 : i32
        %21 = arith.addi %c124_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %23 = "simt_step.switch"(%22, %0) ({
        ^bb0(%arg3: i32):
          %true_17 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %41 = arith.addi %c160_i32, %0 : i32
          %true_18 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %44 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          %true_19 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %48 = arith.addi %c176_i32, %0 : i32
          %true_20 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb3(%50: i32):  // no predecessors
          %c0_i32_21 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %24 = arith.addi %c192_i32, %0 : i32
        %true_6 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %41 = arith.muli %arg4, %c4_i32_17 : i32
          %42 = arith.addi %41, %0 : i32
          %c128_i32 = arith.constant 128 : i32
          %43 = arith.addi %c128_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_18 : i32
          "simt_step.condition"(%45, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %41 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %42 = arith.addi %arg4, %c1_i32 : i32
          %true_17 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_18 : i32
          %44 = arith.addi %c208_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_19 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c148_i32 = arith.constant 148 : i32
        %29 = arith.addi %c148_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_9 : i32
        %32 = "simt_step.if"(%31) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %41 = simt_step.lane_id
          %42 = arith.index_cast %41 : index to i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %33 = arith.addi %c224_i32, %0 : i32
        %true_10 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %35 = arith.addi %c240_i32, %0 : i32
        %true_12 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb3(%37: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %41 = arith.muli %arg4, %c4_i32_17 : i32
          %42 = arith.addi %41, %0 : i32
          %c152_i32 = arith.constant 152 : i32
          %43 = arith.addi %c152_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_18 : i32
          "simt_step.condition"(%45, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %41 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %42 = arith.addi %arg4, %c1_i32 : i32
          %true_17 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_18 : i32
          %44 = arith.addi %c256_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_19 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %39 = arith.addi %c272_i32, %0 : i32
        %true_16 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) : (i32) -> ()
    }) : (i1) -> i32
    %c288_i32 = arith.constant 288 : i32
    %10 = arith.addi %c288_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c172_i32 = arith.constant 172 : i32
    %12 = arith.addi %c172_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_3 : i32
    %15 = "simt_step.if"(%14) ({
      %c176_i32 = arith.constant 176 : i32
      %18 = arith.addi %c176_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %20 = arith.addi %0, %c3_i32 : i32
      %21 = "simt_step.switch"(%19, %20) ({
      ^bb0(%arg2: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %23 = simt_step.subgroup_id
        %24 = arith.index_cast %23 : index to i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb2(%25: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_11 : i32
          %36 = arith.addi %35, %0 : i32
          %c180_i32 = arith.constant 180 : i32
          %37 = arith.addi %c180_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_12 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32_11 : i32
          %true_12 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_13 : i32
          %38 = arith.addi %c304_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_14 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%27: i32):  // no predecessors
        %c200_i32 = arith.constant 200 : i32
        %28 = arith.addi %c200_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %30 = "simt_step.switch"(%29, %c1_i32) ({
        ^bb0(%arg3: i32):
          %35 = simt_step.subgroup_id
          %36 = arith.index_cast %35 : index to i32
          %true_11 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %37 = arith.addi %c320_i32, %0 : i32
          %true_12 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %31 = arith.addi %c336_i32, %0 : i32
        %true_8 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_9 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %33 = arith.addi %c352_i32, %0 : i32
        %true_10 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) : (i32) -> ()
    }, {
      %18 = simt_step.lane_id
      %19 = arith.index_cast %18 : index to i32
      "simt_step.yield"(%19) : (i32) -> ()
    }) : (i1) -> i32
    %c368_i32 = arith.constant 368 : i32
    %16 = arith.addi %c368_i32, %0 : i32
    %true_4 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

