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
      %c0_i32_2 = arith.constant 0 : i32
      %1:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_3 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32_3 : i32
        %5 = arith.cmpi slt, %arg7, %4 : i32
        "simt_step.condition"(%5, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %3:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg8: i32, %arg9: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32_6 : i32
          %7 = arith.cmpi slt, %arg9, %6 : i32
          "simt_step.condition"(%7, %arg8, %arg9) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg8: i32, %arg9: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg9, %c4_i32 : i32
          %7 = arith.addi %c0_i32_6, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_7 = arith.constant 1 : i32
          %9 = arith.addi %arg9, %c1_i32_7 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_5 = arith.constant 1 : i32
        %4 = arith.addi %arg7, %c1_i32_5 : i32
        "simt_step.yield"(%3#0, %4) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%1#0, %2) : (i32, i32) -> ()
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
    %c3_i32 = arith.constant 3 : i32
    %7 = arith.addi %0, %c3_i32 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %13 = arith.addi %c12_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %15 = simt_step.lane_id
      %16 = arith.index_cast %15 : index to i32
      %17 = "simt_step.switch"(%14, %16) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %24 = arith.addi %c16_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
        %27 = "simt_step.if"(%26) ({
          %38 = simt_step.subgroup_id
          %39 = arith.index_cast %38 : index to i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          %38 = simt_step.subgroup_id
          %39 = arith.index_cast %38 : index to i32
          "simt_step.yield"(%39) : (i32) -> ()
        }) : (i1) -> i32
        %c16_i32_7 = arith.constant 16 : i32
        %28 = arith.addi %c16_i32_7, %0 : i32
        %true_8 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %31 = arith.addi %c20_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %33 = simt_step.subgroup_id
        %34 = arith.index_cast %33 : index to i32
        %35 = "simt_step.switch"(%32, %34) ({
        ^bb0(%arg4: i32):
          %38 = simt_step.subgroup_id
          %39 = arith.index_cast %38 : index to i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %41 = simt_step.subgroup_id
          %42 = arith.index_cast %41 : index to i32
          %true_11 = arith.constant true
          %c32_i32 = arith.constant 32 : i32
          %43 = arith.addi %c32_i32, %0 : i32
          %true_12 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c48_i32 = arith.constant 48 : i32
        %36 = arith.addi %c48_i32, %0 : i32
        %true_10 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c64_i32 = arith.constant 64 : i32
      %18 = arith.addi %c64_i32, %0 : i32
      %true_1 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_6 : i32
        %25 = arith.addi %24, %0 : i32
        %c24_i32 = arith.constant 24 : i32
        %26 = arith.addi %c24_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_7 : i32
        "simt_step.condition"(%28, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %24 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %arg4, %c1_i32 : i32
        %true_6 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_7 : i32
        %27 = arith.addi %c80_i32, %26 : i32
        %28 = arith.addi %27, %0 : i32
        %true_8 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_6 : i32
        %25 = arith.addi %24, %0 : i32
        %c44_i32 = arith.constant 44 : i32
        %26 = arith.addi %c44_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_7 : i32
        "simt_step.condition"(%28, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32_6 = arith.constant 64 : i32
        %24 = arith.addi %c64_i32_6, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_7 : i32
        %27 = "simt_step.if"(%26) ({
          %36 = simt_step.subgroup_id
          %37 = arith.index_cast %36 : index to i32
          "simt_step.yield"(%37) : (i32) -> ()
        }, {
          %c1_i32_12 = arith.constant 1 : i32
          %36 = arith.addi %0, %c1_i32_12 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %28 = arith.addi %c96_i32, %0 : i32
        %true_8 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %30 = arith.addi %arg3, %27 : i32
        %c1_i32 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32 : i32
        %true_9 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %32 = arith.muli %arg4, %c4_i32_10 : i32
        %33 = arith.addi %c112_i32, %32 : i32
        %34 = arith.addi %33, %0 : i32
        %true_11 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %c68_i32 = arith.constant 68 : i32
    %9 = arith.addi %c68_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_0 = arith.constant 4 : i32
    %11 = arith.addi %0, %c4_i32_0 : i32
    %12 = "simt_step.switch"(%10, %11) ({
    ^bb0(%arg2: i32):
      %c72_i32 = arith.constant 72 : i32
      %13 = arith.addi %c72_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %15 = simt_step.subgroup_id
      %16 = arith.index_cast %15 : index to i32
      %17 = "simt_step.switch"(%14, %16) ({
      ^bb0(%arg3: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %40 = arith.muli %arg5, %c4_i32_17 : i32
          %41 = arith.addi %40, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %42 = arith.addi %c76_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_18 : i32
          "simt_step.condition"(%44, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %40 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %arg5, %c1_i32 : i32
          %true_17 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_18 : i32
          %43 = arith.addi %c128_i32, %42 : i32
          %44 = arith.addi %43, %0 : i32
          %true_19 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %32 = arith.addi %c144_i32, %0 : i32
        %true_11 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %35 = arith.addi %0, %c0_i32_12 : i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %40 = arith.muli %arg5, %c4_i32_17 : i32
          %41 = arith.addi %40, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %42 = arith.addi %c96_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_18 : i32
          "simt_step.condition"(%44, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %40 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %arg5, %c1_i32 : i32
          %true_17 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_18 : i32
          %43 = arith.addi %c160_i32, %42 : i32
          %44 = arith.addi %43, %0 : i32
          %true_19 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%38: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %40 = arith.muli %arg5, %c4_i32_17 : i32
          %41 = arith.addi %40, %0 : i32
          %c116_i32 = arith.constant 116 : i32
          %42 = arith.addi %c116_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_18 : i32
          "simt_step.condition"(%44, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %40 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %arg5, %c1_i32 : i32
          %true_17 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_18 : i32
          %43 = arith.addi %c176_i32, %42 : i32
          %44 = arith.addi %43, %0 : i32
          %true_19 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c136_i32 = arith.constant 136 : i32
      %19 = arith.addi %c136_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_1 : i32
      %22 = "simt_step.if"(%21) ({
        %c140_i32 = arith.constant 140 : i32
        %31 = arith.addi %c140_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_8 : i32
        %34 = "simt_step.if"(%33) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %35 = arith.addi %c192_i32, %0 : i32
        %true_9 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        %c4_i32_8 = arith.constant 4 : i32
        %31 = arith.addi %0, %c4_i32_8 : i32
        "simt_step.yield"(%31) : (i32) -> ()
      }) : (i1) -> i32
      %c208_i32 = arith.constant 208 : i32
      %23 = arith.addi %c208_i32, %0 : i32
      %true = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_2 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %25 = arith.addi %c224_i32, %0 : i32
      %true_3 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %28:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_8 : i32
        %32 = arith.addi %31, %0 : i32
        %c144_i32 = arith.constant 144 : i32
        %33 = arith.addi %c144_i32, %32 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_9 : i32
        "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %31 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %32 = arith.addi %arg4, %c1_i32 : i32
        %true_8 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_9 : i32
        %34 = arith.addi %c240_i32, %33 : i32
        %35 = arith.addi %34, %0 : i32
        %true_10 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31, %32) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %29 = arith.addi %c256_i32, %0 : i32
      %true_7 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

