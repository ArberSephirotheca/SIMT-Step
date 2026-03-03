module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %c2_i32_0 = arith.constant 2 : i32
    %1 = "simt_step.switch"(%0, %c2_i32_0) ({
    ^bb0(%arg4: i32):
      %c4_i32 = arith.constant 4 : i32
      %4 = arith.remsi %arg3, %c4_i32 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %5 = "simt_step.switch"(%4, %c0_i32_1) ({
      ^bb0(%arg5: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32 : i32
          %21 = arith.cmpi slt, %arg7, %20 : i32
          "simt_step.condition"(%21, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c2_i32_10 = arith.constant 2 : i32
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%c2_i32_10, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%13: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %16 = "simt_step.if"(%15) ({
          %c2_i32_10 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_10) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32_9 = arith.constant 2 : i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      ^bb3(%17: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %18 = arith.addi %arg0, %c3_i32 : i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%5) {fallthrough = true} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %7 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %8 = "simt_step.if"(%7) ({
        %c3_i32 = arith.constant 3 : i32
        %12 = arith.remsi %arg3, %c3_i32 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %13 = "simt_step.switch"(%12, %c4_i32_6) ({
        ^bb0(%arg5: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          %c2_i32_7 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_7) {fallthrough = true} : (i32) -> ()
        ^bb2(%15: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb3(%16: i32):  // no predecessors
          %c3_i32_8 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%13) : (i32) -> ()
      }, {
        "simt_step.yield"(%arg0) : (i32) -> ()
      }) : (i1) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %9 = arith.addi %arg0, %c0_i32_3 : i32
      "simt_step.yield"(%8) {fallthrough = true} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32_6 : i32
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32 : i32
        %14 = arith.cmpi slt, %arg6, %13 : i32
        "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %14 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %15 = arith.addi %14, %c1_i32_10 : i32
          %16 = arith.cmpi slt, %arg8, %15 : i32
          "simt_step.condition"(%16, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c1_i32_9 = arith.constant 1 : i32
          %14 = arith.addi %arg8, %c1_i32_9 : i32
          "simt_step.continue"(%arg0, %14) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %13 = arith.addi %arg6, %c1_i32_8 : i32
        "simt_step.yield"(%12#0, %13) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c1_i32 = arith.constant 1 : i32
      %27 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
    ^bb1(%28: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_10) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c12_i32 = arith.constant 12 : i32
    %12 = arith.addi %c12_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.subgroup_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %28 = arith.addi %0, %c0_i32_10 : i32
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %17 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %19:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_10 = arith.constant 4 : i32
      %27 = arith.muli %arg3, %c4_i32_10 : i32
      %28 = arith.addi %27, %0 : i32
      %c16_i32_11 = arith.constant 16 : i32
      %29 = arith.addi %c16_i32_11, %28 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_12 : i32
      "simt_step.condition"(%31, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %27 = arith.addi %arg2, %0 : i32
      %c1_i32 = arith.constant 1 : i32
      %28 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%27, %28) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %20 = arith.addi %c48_i32, %0 : i32
    %true_6 = arith.constant true
    %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c36_i32 = arith.constant 36 : i32
    %22 = arith.addi %c36_i32, %0 : i32
    %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_7 = arith.constant 4 : i32
    %24 = "simt_step.switch"(%23, %c4_i32_7) ({
    ^bb0(%arg2: i32):
      %c40_i32 = arith.constant 40 : i32
      %27 = arith.addi %c40_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %29 = arith.cmpi ne, %28, %c0_i32_10 : i32
      %30 = "simt_step.if"(%29) ({
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) : (i32) -> ()
      }, {
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %44 = arith.muli %arg4, %c4_i32_20 : i32
          %45 = arith.addi %44, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %46 = arith.addi %c44_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_21 : i32
          "simt_step.condition"(%48, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %44 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_19 = arith.constant true
        "simt_step.yield"(%43#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    ^bb1(%31: i32):  // no predecessors
      %c0_i32_11 = arith.constant 0 : i32
      %c0_i32_12 = arith.constant 0 : i32
      %32:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_17 = arith.constant 4 : i32
        %43 = arith.muli %arg4, %c4_i32_17 : i32
        %44 = arith.addi %43, %0 : i32
        %c64_i32_18 = arith.constant 64 : i32
        %45 = arith.addi %c64_i32_18, %44 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_19 : i32
        "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %43 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %44 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%43, %44) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_13 = arith.constant true
      "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%33: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %34 = arith.addi %c84_i32, %0 : i32
      %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_14 = arith.constant 0 : i32
      %36 = arith.cmpi ne, %35, %c0_i32_14 : i32
      %37 = "simt_step.if"(%36) ({
        %c88_i32 = arith.constant 88 : i32
        %43 = arith.addi %c88_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_17 : i32
        %46 = "simt_step.if"(%45) ({
          %c2_i32 = arith.constant 2 : i32
          %47 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%46) : (i32) -> ()
      }, {
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %44 = arith.muli %arg4, %c4_i32_20 : i32
          %45 = arith.addi %44, %0 : i32
          %c92_i32 = arith.constant 92 : i32
          %46 = arith.addi %c92_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_21 : i32
          "simt_step.condition"(%48, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %44 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_19 = arith.constant true
        "simt_step.yield"(%43#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
    ^bb3(%38: i32):  // no predecessors
      %c112_i32 = arith.constant 112 : i32
      %39 = arith.addi %c112_i32, %0 : i32
      %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_15 = arith.constant 0 : i32
      %41 = arith.addi %0, %c0_i32_15 : i32
      %42 = "simt_step.switch"(%40, %41) ({
      ^bb0(%arg3: i32):
        %c0_i32_17 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_17) {fallthrough = true} : (i32) -> ()
      ^bb1(%43: i32):  // no predecessors
        %c116_i32 = arith.constant 116 : i32
        %44 = arith.addi %c116_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %46 = arith.cmpi ne, %45, %c0_i32_18 : i32
        %47 = "simt_step.if"(%46) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c0_i32_21 = arith.constant 0 : i32
          %57 = arith.addi %0, %c0_i32_21 : i32
          "simt_step.yield"(%57) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%47) {fallthrough = true} : (i32) -> ()
      ^bb2(%48: i32):  // no predecessors
        %c120_i32 = arith.constant 120 : i32
        %49 = arith.addi %c120_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %51 = arith.cmpi ne, %50, %c0_i32_19 : i32
        %52 = "simt_step.if"(%51) ({
          %c4_i32_21 = arith.constant 4 : i32
          %57 = arith.addi %0, %c4_i32_21 : i32
          "simt_step.yield"(%57) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%52) {fallthrough = true} : (i32) -> ()
      ^bb3(%53: i32):  // no predecessors
        %c124_i32 = arith.constant 124 : i32
        %54 = arith.addi %c124_i32, %0 : i32
        %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
        %56 = "simt_step.switch"(%55, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%57: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %58 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%58) {fallthrough = true} : (i32) -> ()
        ^bb2(%59: i32):  // no predecessors
          %c0_i32_21 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_20 = arith.constant true
        "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_16 = arith.constant true
      "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_8 = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %25 = arith.addi %c64_i32, %0 : i32
    %true_9 = arith.constant true
    %26 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

