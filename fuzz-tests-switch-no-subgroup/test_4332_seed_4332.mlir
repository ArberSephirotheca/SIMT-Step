module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
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
      %3 = arith.addi %arg0, %c0_i32_2 : i32
      %4 = "simt_step.switch"(%arg3, %3) ({
      ^bb0(%arg6: i32):
        %c3_i32 = arith.constant 3 : i32
        %6 = arith.remsi %arg3, %c3_i32 : i32
        %7 = "simt_step.switch"(%6, %arg0) ({
        ^bb0(%arg7: i32):
          %c3_i32_3 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_3) {fallthrough = false} : (i32) -> ()
        ^bb1(%9: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%10: i32):  // no predecessors
          %c0_i32_4 = arith.constant 0 : i32
          %11 = arith.addi %arg0, %c0_i32_4 : i32
          "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%4, %5) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %19 = arith.muli %arg3, %c4_i32_5 : i32
      %20 = arith.addi %19, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %21 = arith.addi %c8_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_6 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c16_i32 = arith.constant 16 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_6 : i32
      %22 = arith.addi %c16_i32, %21 : i32
      %23 = arith.addi %22, %0 : i32
      %true_7 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %6 = arith.addi %c28_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c32_i32_5 = arith.constant 32 : i32
      %21 = arith.addi %c32_i32_5, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_6 : i32
      %24 = "simt_step.if"(%23) ({
        %c2_i32 = arith.constant 2 : i32
        %32 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%32) : (i32) -> ()
      }, {
        %c0_i32_10 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_10) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %26:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %32 = arith.muli %arg4, %c4_i32_10 : i32
        %33 = arith.addi %32, %0 : i32
        %c36_i32 = arith.constant 36 : i32
        %34 = arith.addi %c36_i32, %33 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_11 : i32
        "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %32 = arith.addi %arg3, %arg4 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32_10 : i32
        %true_11 = arith.constant true
        "simt_step.continue"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%27: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %28 = arith.addi %c56_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %30 = arith.cmpi ne, %29, %c0_i32_9 : i32
      %31 = "simt_step.if"(%30) ({
        %c60_i32 = arith.constant 60 : i32
        %32 = arith.addi %c60_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_10 : i32
        %35 = "simt_step.if"(%34) ({
          %c4_i32_11 = arith.constant 4 : i32
          %36 = arith.addi %0, %c4_i32_11 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %36 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%35) : (i32) -> ()
      }, {
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_12 : i32
          %34 = arith.addi %33, %0 : i32
          %c64_i32_13 = arith.constant 64 : i32
          %35 = arith.addi %c64_i32_13, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_14 : i32
          "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %33 = arith.addi %arg3, %arg4 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %34 = arith.addi %arg4, %c1_i32_12 : i32
          %true_13 = arith.constant true
          "simt_step.break"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c84_i32 = arith.constant 84 : i32
    %13 = arith.addi %c84_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %15 = arith.cmpi ne, %14, %c0_i32_3 : i32
    %16 = "simt_step.if"(%15) ({
      %c88_i32 = arith.constant 88 : i32
      %19 = arith.addi %c88_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = simt_step.subgroup_id
      %22 = arith.index_cast %21 : index to i32
      %23 = "simt_step.switch"(%20, %22) ({
      ^bb0(%arg2: i32):
        %c2_i32 = arith.constant 2 : i32
        %24 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %26 = arith.addi %c92_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %28 = "simt_step.switch"(%27, %0) ({
        ^bb0(%arg3: i32):
          %c2_i32_7 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %32 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %c0_i32_8 = arith.constant 0 : i32
          %34 = arith.addi %0, %c0_i32_8 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb3(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
      ^bb2(%29: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %31 = arith.muli %arg4, %c4_i32_7 : i32
          %32 = arith.addi %31, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %33 = arith.addi %c96_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_8 : i32
          "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %31 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg4, %c1_i32 : i32
          %true_7 = arith.constant true
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%23) : (i32) -> ()
    }, {
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %20 = arith.muli %arg3, %c4_i32_7 : i32
        %21 = arith.addi %20, %0 : i32
        %c116_i32 = arith.constant 116 : i32
        %22 = arith.addi %c116_i32, %21 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_8 : i32
        "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %20 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c48_i32 = arith.constant 48 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %22 = arith.muli %arg3, %c4_i32_8 : i32
        %23 = arith.addi %c48_i32, %22 : i32
        %24 = arith.addi %23, %0 : i32
        %true_9 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%19#0) : (i32) -> ()
    }) : (i1) -> i32
    %c64_i32 = arith.constant 64 : i32
    %17 = arith.addi %c64_i32, %0 : i32
    %true_4 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

