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
        "simt_step.yield"(%3#0, %4) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      %2 = arith.remsi %arg3, %c3_i32 : i32
      %3 = "simt_step.switch"(%2, %arg0) ({
      ^bb0(%arg4: i32):
        %c0_i32_0 = arith.constant 0 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %4:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32 : i32
          %17 = arith.cmpi slt, %arg6, %16 : i32
          "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32 = arith.constant 1 : i32
          %15 = arith.addi %arg0, %c1_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %16 = arith.addi %arg6, %c1_i32_6 : i32
          "simt_step.yield"(%15, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%5: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %6 = arith.remsi %arg3, %c2_i32 : i32
        %c3_i32_2 = arith.constant 3 : i32
        %7 = "simt_step.switch"(%6, %c3_i32_2) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%15: i32):  // no predecessors
          %c0_i32_6 = arith.constant 0 : i32
          %16 = arith.addi %arg0, %c0_i32_6 : i32
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb2(%17: i32):  // no predecessors
          %c3_i32_7 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_7) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%7) {fallthrough = true} : (i32) -> ()
      ^bb2(%8: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %9 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %10 = "simt_step.if"(%9) ({
          %c4_i32 = arith.constant 4 : i32
          %15 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %c3_i32_6 = arith.constant 3 : i32
          %15 = arith.addi %arg0, %c3_i32_6 : i32
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
      ^bb3(%11: i32):  // no predecessors
        %c3_i32_4 = arith.constant 3 : i32
        %12 = arith.remsi %arg3, %c3_i32_4 : i32
        %c3_i32_5 = arith.constant 3 : i32
        %13 = arith.addi %arg0, %c3_i32_5 : i32
        %14 = "simt_step.switch"(%12, %13) ({
        ^bb0(%arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %15 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
        ^bb2(%17: i32):  // no predecessors
          %c2_i32_6 = arith.constant 2 : i32
          %18 = arith.addi %arg0, %c2_i32_6 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %15 = arith.addi %c12_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %17 = "simt_step.switch"(%16, %c3_i32) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %22 = arith.addi %c16_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_5 : i32
        %25 = "simt_step.if"(%24) ({
          %c4_i32_7 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_7) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %27 = arith.addi %0, %c0_i32_6 : i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %19 = arith.addi %c20_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_4 = arith.constant 4 : i32
      %21 = "simt_step.switch"(%20, %c4_i32_4) ({
      ^bb0(%arg3: i32):
        %c24_i32 = arith.constant 24 : i32
        %22 = arith.addi %c24_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_5 : i32
        %25 = "simt_step.if"(%24) ({
          %c2_i32 = arith.constant 2 : i32
          %36 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %c3_i32_8 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_8) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_6) {fallthrough = true} : (i32) -> ()
      ^bb2(%27: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %28 = arith.addi %c28_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %30 = "simt_step.switch"(%29, %0) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
      ^bb3(%31: i32):  // no predecessors
        %c32_i32 = arith.constant 32 : i32
        %32 = arith.addi %c32_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_7 : i32
        %35 = "simt_step.if"(%34) ({
          %c4_i32_8 = arith.constant 4 : i32
          %36 = arith.addi %0, %c4_i32_8 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_3 : i32
      %16 = arith.addi %15, %0 : i32
      %c36_i32 = arith.constant 36 : i32
      %17 = arith.addi %c36_i32, %16 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_4 : i32
      "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c56_i32 = arith.constant 56 : i32
      %15 = arith.addi %c56_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %17 = simt_step.subgroup_id
      %18 = arith.index_cast %17 : index to i32
      %19 = "simt_step.switch"(%16, %18) ({
      ^bb0(%arg4: i32):
        %c60_i32 = arith.constant 60 : i32
        %26 = arith.addi %c60_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %28 = arith.addi %0, %c2_i32 : i32
        %29 = "simt_step.switch"(%27, %28) ({
        ^bb0(%arg5: i32):
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %36 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb3(%38: i32):  // no predecessors
          %c3_i32_9 = arith.constant 3 : i32
          %39 = arith.addi %0, %c3_i32_9 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %31 = arith.addi %c64_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_6 : i32
        %34 = "simt_step.if"(%33) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %20 = arith.addi %arg2, %19 : i32
      %c1_i32 = arith.constant 1 : i32
      %21 = arith.addi %arg3, %c1_i32 : i32
      %true_3 = arith.constant true
      %c16_i32 = arith.constant 16 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %22 = arith.muli %arg3, %c4_i32_4 : i32
      %23 = arith.addi %c16_i32, %22 : i32
      %24 = arith.addi %23, %0 : i32
      %true_5 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%20, %21) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c68_i32 = arith.constant 68 : i32
    %9 = arith.addi %c68_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %10, %c0_i32_2 : i32
    %12 = "simt_step.if"(%11) ({
      %15 = simt_step.subgroup_id
      %16 = arith.index_cast %15 : index to i32
      "simt_step.yield"(%16) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %16 = arith.muli %arg3, %c4_i32_5 : i32
        %17 = arith.addi %16, %0 : i32
        %c72_i32 = arith.constant 72 : i32
        %18 = arith.addi %c72_i32, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
        "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %16 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c32_i32 = arith.constant 32 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %18 = arith.muli %arg3, %c4_i32_6 : i32
        %19 = arith.addi %c32_i32, %18 : i32
        %20 = arith.addi %19, %0 : i32
        %true_7 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%15#0) : (i32) -> ()
    }) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %13 = arith.addi %c48_i32, %0 : i32
    %true = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

