module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %c3_i32_0 = arith.constant 3 : i32
    %3 = "simt_step.switch"(%2, %c3_i32_0) ({
    ^bb0(%arg4: i32):
      %c0_i32_2 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_2) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %7 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %8 = "simt_step.if"(%7) ({
        %c2_i32 = arith.constant 2 : i32
        %13 = arith.remsi %arg3, %c2_i32 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %14 = "simt_step.switch"(%13, %c0_i32_5) ({
        ^bb0(%arg5: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%15: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%16: i32):  // no predecessors
          %c2_i32_6 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_6) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%14) : (i32) -> ()
      }, {
        %c4_i32_5 = arith.constant 4 : i32
        %13 = "simt_step.switch"(%arg3, %c4_i32_5) ({
        ^bb0(%arg5: i32):
          %c1_i32 = arith.constant 1 : i32
          %14 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
        ^bb1(%15: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%13) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c3_i32_4 = arith.constant 3 : i32
      %10 = arith.remsi %arg3, %c3_i32_4 : i32
      %c4_i32 = arith.constant 4 : i32
      %11 = arith.addi %arg0, %c4_i32 : i32
      %12 = "simt_step.switch"(%10, %11) ({
      ^bb0(%arg5: i32):
        %c4_i32_5 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_5) {fallthrough = true} : (i32) -> ()
      ^bb1(%13: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32 : i32
          %22 = arith.cmpi slt, %arg7, %21 : i32
          "simt_step.condition"(%22, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_9 = arith.constant 3 : i32
          %20 = arith.addi %arg0, %c3_i32_9 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%15: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %16 = arith.remsi %arg3, %c2_i32 : i32
        %c3_i32_8 = arith.constant 3 : i32
        %17 = arith.addi %arg0, %c3_i32_8 : i32
        %18 = "simt_step.switch"(%16, %17) ({
        ^bb0(%arg6: i32):
          %c3_i32_9 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_9) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
      ^bb3(%19: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %14 = arith.cmpi slt, %arg3, %c2_i32 : i32
        "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %6 = simt_step.subgroup_id
    %7 = arith.index_cast %6 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %8 = arith.addi %c8_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = simt_step.lane_id
    %11 = arith.index_cast %10 : index to i32
    %12 = "simt_step.switch"(%9, %11) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %13 = arith.addi %c12_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_1 : i32
      %16 = "simt_step.if"(%15) ({
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %24 = arith.muli %arg4, %c4_i32_6 : i32
          %25 = arith.addi %24, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %26 = arith.addi %c16_i32, %25 : i32
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
          "simt_step.yield"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %24 = arith.muli %arg4, %c4_i32_6 : i32
          %25 = arith.addi %24, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %26 = arith.addi %c36_i32, %25 : i32
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
          "simt_step.continue"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %18 = arith.addi %c56_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %20 = "simt_step.switch"(%19, %c0_i32_2) ({
      ^bb0(%arg3: i32):
        %c60_i32 = arith.constant 60 : i32
        %23 = arith.addi %c60_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_4 : i32
        %26 = "simt_step.if"(%25) ({
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %28 = arith.addi %c64_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %30 = "simt_step.switch"(%29, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %34 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
      ^bb2(%31: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %33 = arith.muli %arg5, %c4_i32_7 : i32
          %34 = arith.addi %33, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %35 = arith.addi %c68_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_8 : i32
          "simt_step.condition"(%37, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %33 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %arg5, %c1_i32 : i32
          %true_7 = arith.constant true
          "simt_step.yield"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      %c4_i32_3 = arith.constant 4 : i32
      %22 = arith.addi %0, %c4_i32_3 : i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

