module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.subgroup_id
    %1 = arith.index_cast %0 : index to i32
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %3 = simt_step.lane_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %19 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %20 = arith.addi %19, %c1_i32_6 : i32
        %21 = arith.cmpi slt, %arg6, %20 : i32
        "simt_step.condition"(%21, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c3_i32_6 = arith.constant 3 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %19 = arith.addi %arg6, %c1_i32_7 : i32
        "simt_step.continue"(%c3_i32_6, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%10#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%12) {fallthrough = true} : (i32) -> ()
    ^bb2(%13: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %14 = arith.remsi %arg3, %c2_i32 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %15 = arith.addi %arg0, %c0_i32_3 : i32
      %16 = "simt_step.switch"(%14, %15) ({
      ^bb0(%arg5: i32):
        %c1_i32_6 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_6) {fallthrough = true} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32_12 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %25 = arith.addi %arg7, %c1_i32_12 : i32
          "simt_step.yield"(%c4_i32_11, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_9 = arith.constant 3 : i32
        "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c3_i32_10 = arith.constant 3 : i32
        %22 = arith.remsi %arg3, %c3_i32_10 : i32
        %c4_i32 = arith.constant 4 : i32
        %23 = arith.addi %arg0, %c4_i32 : i32
        %24 = "simt_step.switch"(%22, %23) ({
        ^bb0(%arg6: i32):
          %c1_i32_11 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %c2_i32_13 = arith.constant 2 : i32
          %27 = arith.addi %arg0, %c2_i32_13 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb3(%28: i32):  // no predecessors
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb3(%17: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %19 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %20 = arith.addi %19, %c1_i32_6 : i32
        %21 = arith.cmpi slt, %arg6, %20 : i32
        "simt_step.condition"(%21, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c2_i32_6 = arith.constant 2 : i32
        %19 = arith.addi %arg0, %c2_i32_6 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %20 = arith.addi %arg6, %c1_i32_7 : i32
        "simt_step.yield"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %7 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %9 = arith.select %8, %1, %5 : i32
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
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %23 = arith.addi %c12_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_5 : i32
      %26 = "simt_step.if"(%25) ({
        %c16_i32_11 = arith.constant 16 : i32
        %37 = arith.addi %c16_i32_11, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_12 : i32
        %40 = "simt_step.if"(%39) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%40) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %37 = arith.addi %c20_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_11 : i32
        %40 = "simt_step.if"(%39) ({
          %c4_i32_12 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_12) : (i32) -> ()
        }, {
          %c3_i32_12 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%40) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %28:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_11 : i32
        %38 = arith.addi %37, %0 : i32
        %c24_i32 = arith.constant 24 : i32
        %39 = arith.addi %c24_i32, %38 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_12 : i32
        "simt_step.condition"(%41, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %37 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %38 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.break"(%37, %38) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%29: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %30 = arith.addi %c44_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %32 = "simt_step.switch"(%31, %0) ({
      ^bb0(%arg3: i32):
        %c48_i32_11 = arith.constant 48 : i32
        %37 = arith.addi %c48_i32_11, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_12 : i32
        %40 = "simt_step.if"(%39) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%40) {fallthrough = true} : (i32) -> ()
      ^bb1(%41: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_19 : i32
          %47 = arith.addi %46, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %48 = arith.addi %c52_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_20 : i32
          "simt_step.condition"(%50, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %46 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        "simt_step.yield"(%42#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%43: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %44:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_19 : i32
          %47 = arith.addi %46, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %48 = arith.addi %c72_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_20 : i32
          "simt_step.condition"(%50, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %46 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.continue"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        "simt_step.yield"(%44#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%45: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb3(%33: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %34 = arith.addi %c92_i32, %0 : i32
      %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
      %36 = "simt_step.switch"(%35, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %43 = arith.muli %arg5, %c4_i32_19 : i32
          %44 = arith.addi %43, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %45 = arith.addi %c96_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_20 : i32
          "simt_step.condition"(%47, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %43 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %43 = arith.muli %arg5, %c4_i32_19 : i32
          %44 = arith.addi %43, %0 : i32
          %c116_i32 = arith.constant 116 : i32
          %45 = arith.addi %c116_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_20 : i32
          "simt_step.condition"(%47, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %43 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.continue"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %c3_i32_17 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_17) {fallthrough = false} : (i32) -> ()
      ^bb3(%41: i32):  // no predecessors
        %c0_i32_18 = arith.constant 0 : i32
        %42 = arith.addi %0, %c0_i32_18 : i32
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c136_i32 = arith.constant 136 : i32
    %12 = arith.addi %c136_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c3_i32 = arith.constant 3 : i32
    %14 = "simt_step.switch"(%13, %c3_i32) ({
    ^bb0(%arg2: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_9 : i32
        %30 = arith.addi %29, %0 : i32
        %c140_i32 = arith.constant 140 : i32
        %31 = arith.addi %c140_i32, %30 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_10 : i32
        "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %32 = arith.muli %arg6, %c4_i32_12 : i32
          %33 = arith.addi %32, %0 : i32
          %c160_i32 = arith.constant 160 : i32
          %34 = arith.addi %c160_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_13 : i32
          "simt_step.condition"(%36, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %32 = arith.addi %arg5, %arg6 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %33 = arith.addi %arg6, %c1_i32_12 : i32
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        %30 = arith.addi %arg3, %29#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c180_i32 = arith.constant 180 : i32
      %25 = arith.addi %c180_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_8 : i32
      %28 = "simt_step.if"(%27) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %30 = arith.muli %arg4, %c4_i32_12 : i32
          %31 = arith.addi %30, %0 : i32
          %c184_i32 = arith.constant 184 : i32
          %32 = arith.addi %c184_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_13 : i32
          "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %30 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.continue"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%29#0) : (i32) -> ()
      }, {
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %30 = arith.muli %arg4, %c4_i32_12 : i32
          %31 = arith.addi %30, %0 : i32
          %c204_i32 = arith.constant 204 : i32
          %32 = arith.addi %c204_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_13 : i32
          "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %30 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.continue"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%29#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %15 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c224_i32 = arith.constant 224 : i32
    %17 = arith.addi %c224_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %19 = arith.cmpi ne, %18, %c0_i32_3 : i32
    %20 = "simt_step.if"(%19) ({
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %24 = arith.muli %arg3, %c4_i32_8 : i32
        %25 = arith.addi %24, %0 : i32
        %c228_i32 = arith.constant 228 : i32
        %26 = arith.addi %c228_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_9 : i32
        "simt_step.condition"(%28, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %24 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.continue"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%23#0) : (i32) -> ()
    }, {
      %c248_i32 = arith.constant 248 : i32
      %23 = arith.addi %c248_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = "simt_step.switch"(%24, %0) ({
      ^bb0(%arg2: i32):
        %c252_i32 = arith.constant 252 : i32
        %26 = arith.addi %c252_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_6 : i32
        %29 = "simt_step.if"(%28) ({
          %c3_i32_14 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_14) : (i32) -> ()
        }, {
          %c4_i32_14 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_14) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %39 = arith.muli %arg4, %c4_i32_14 : i32
          %40 = arith.addi %39, %0 : i32
          %c256_i32 = arith.constant 256 : i32
          %41 = arith.addi %c256_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_15 : i32
          "simt_step.condition"(%43, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %39 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.break"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %33:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %39 = arith.muli %arg4, %c4_i32_14 : i32
          %40 = arith.addi %39, %0 : i32
          %c276_i32 = arith.constant 276 : i32
          %41 = arith.addi %c276_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_15 : i32
          "simt_step.condition"(%43, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %39 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.break"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%34: i32):  // no predecessors
        %c296_i32 = arith.constant 296 : i32
        %35 = arith.addi %c296_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_13 : i32
        %38 = "simt_step.if"(%37) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%25) : (i32) -> ()
    }) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %21 = arith.addi %c48_i32, %0 : i32
    %true_4 = arith.constant true
    %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

