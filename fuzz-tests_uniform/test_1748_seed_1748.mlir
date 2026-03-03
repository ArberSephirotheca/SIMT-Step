module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %8, %c1_i32 : i32
      %10 = arith.cmpi slt, %arg5, %9 : i32
      "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32_8 : i32
        %14 = arith.cmpi slt, %arg7, %13 : i32
        "simt_step.condition"(%14, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c3_i32 = arith.constant 3 : i32
        %12 = arith.addi %arg0, %c3_i32 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %13 = arith.addi %arg7, %c1_i32_8 : i32
        "simt_step.break"(%12, %13) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %9 = simt_step.subgroup_id
      %10 = arith.index_cast %9 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%8#0, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %3:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %8, %c1_i32 : i32
      %10 = arith.cmpi slt, %arg5, %9 : i32
      "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32_8 : i32
        %14 = arith.cmpi slt, %arg7, %13 : i32
        "simt_step.condition"(%14, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %13 = "simt_step.if"(%12) ({
          %17 = simt_step.lane_id
          %18 = arith.index_cast %17 : index to i32
          "simt_step.yield"(%18) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %14 = simt_step.subgroup_id
        %15 = arith.index_cast %14 : index to i32
        %c1_i32_9 = arith.constant 1 : i32
        %16 = arith.addi %arg7, %c1_i32_9 : i32
        "simt_step.yield"(%13, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %9 = simt_step.lane_id
      %10 = arith.index_cast %9 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%8#0, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_4 = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %5 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_5 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
    %7 = arith.select %6, %0#0, %3#0 : i32
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
      %c4_i32_9 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_9 : i32
      %18 = arith.addi %17, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %19 = arith.addi %c8_i32, %18 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_10 : i32
      "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %17 = arith.addi %arg2, %0 : i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%17, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %6 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_9 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_9 : i32
      %18 = arith.addi %17, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %19 = arith.addi %c28_i32, %18 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_10 : i32
      "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c48_i32_9 = arith.constant 48 : i32
      %17 = arith.addi %c48_i32_9, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_10 : i32
      %20 = "simt_step.if"(%19) ({
        %23 = simt_step.subgroup_id
        %24 = arith.index_cast %23 : index to i32
        "simt_step.yield"(%24) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %21 = arith.addi %arg2, %20 : i32
      %c1_i32 = arith.constant 1 : i32
      %22 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%21, %22) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %9 = arith.addi %c48_i32, %0 : i32
    %true_6 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c52_i32 = arith.constant 52 : i32
    %11 = arith.addi %c52_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c3_i32 = arith.constant 3 : i32
    %13 = arith.addi %0, %c3_i32 : i32
    %14 = "simt_step.switch"(%12, %13) ({
    ^bb0(%arg2: i32):
      %c56_i32 = arith.constant 56 : i32
      %17 = arith.addi %c56_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_9 : i32
      %20 = "simt_step.if"(%19) ({
        %c60_i32 = arith.constant 60 : i32
        %35 = arith.addi %c60_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %37 = "simt_step.switch"(%36, %0) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c4_i32_15 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%37) : (i32) -> ()
      }, {
        %c64_i32_14 = arith.constant 64 : i32
        %35 = arith.addi %c64_i32_14, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_15 : i32
        %38 = "simt_step.if"(%37) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32_16 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_16) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %22 = arith.addi %c68_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %24 = "simt_step.switch"(%23, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c72_i32 = arith.constant 72 : i32
        %35 = arith.addi %c72_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_14 : i32
        %38 = "simt_step.if"(%37) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %46 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%46) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_19 : i32
          %47 = arith.addi %46, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %48 = arith.addi %c76_i32, %47 : i32
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
        %true_17 = arith.constant true
        "simt_step.yield"(%40#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%41: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb3(%42: i32):  // no predecessors
        %c96_i32 = arith.constant 96 : i32
        %43 = arith.addi %c96_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = "simt_step.switch"(%44, %0) ({
        ^bb0(%arg4: i32):
          %c0_i32_19 = arith.constant 0 : i32
          %46 = arith.addi %0, %c0_i32_19 : i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %c3_i32_20 = arith.constant 3 : i32
          %48 = arith.addi %0, %c3_i32_20 : i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_18 = arith.constant true
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c100_i32 = arith.constant 100 : i32
      %26 = arith.addi %c100_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %28 = arith.addi %0, %c0_i32_11 : i32
      %29 = "simt_step.switch"(%27, %28) ({
      ^bb0(%arg3: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %45 = arith.muli %arg5, %c4_i32_20 : i32
          %46 = arith.addi %45, %0 : i32
          %c104_i32 = arith.constant 104 : i32
          %47 = arith.addi %c104_i32, %46 : i32
          %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %49 = arith.cmpi ne, %48, %c0_i32_21 : i32
          "simt_step.condition"(%49, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %45 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %46 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.continue"(%45, %46) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c124_i32 = arith.constant 124 : i32
        %37 = arith.addi %c124_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_17 : i32
        %40 = "simt_step.if"(%39) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%40) {fallthrough = true} : (i32) -> ()
      ^bb2(%41: i32):  // no predecessors
        %c128_i32 = arith.constant 128 : i32
        %42 = arith.addi %c128_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_18 = arith.constant 2 : i32
        %44 = "simt_step.switch"(%43, %c2_i32_18) ({
        ^bb0(%arg4: i32):
          %c2_i32_20 = arith.constant 2 : i32
          %45 = arith.addi %0, %c2_i32_20 : i32
          "simt_step.yield"(%45) {fallthrough = true} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %c2_i32_21 = arith.constant 2 : i32
          %47 = arith.addi %0, %c2_i32_21 : i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_12 = arith.constant true
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb3(%30: i32):  // no predecessors
      %c132_i32 = arith.constant 132 : i32
      %31 = arith.addi %c132_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_13 = arith.constant 0 : i32
      %33 = arith.cmpi ne, %32, %c0_i32_13 : i32
      %34 = "simt_step.if"(%33) ({
        %c136_i32 = arith.constant 136 : i32
        %35 = arith.addi %c136_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_14 : i32
        %38 = "simt_step.if"(%37) ({
          %c0_i32_15 = arith.constant 0 : i32
          %39 = arith.addi %0, %c0_i32_15 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          %c3_i32_15 = arith.constant 3 : i32
          %39 = arith.addi %0, %c3_i32_15 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_7 = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %15 = arith.addi %c64_i32, %0 : i32
    %true_8 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

