module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %1 = simt_step.lane_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32_3 : i32
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %14, %c1_i32 : i32
        %16 = arith.cmpi slt, %arg6, %15 : i32
        "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%c0_i32_3, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%6#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %8 = "simt_step.switch"(%arg3, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %15 = "simt_step.if"(%14) ({
          %c0_i32_5 = arith.constant 0 : i32
          %19 = arith.addi %arg0, %c0_i32_5 : i32
          "simt_step.yield"(%19) : (i32) -> ()
        }, {
          %c0_i32_5 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_5) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%15) {fallthrough = true} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %18 = "simt_step.if"(%17) ({
          %c0_i32_5 = arith.constant 0 : i32
          %19 = arith.addi %arg0, %c0_i32_5 : i32
          "simt_step.yield"(%19) : (i32) -> ()
        }, {
          %c4_i32_5 = arith.constant 4 : i32
          %19 = arith.addi %arg0, %c4_i32_5 : i32
          "simt_step.yield"(%19) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %9 = arith.addi %arg0, %c2_i32 : i32
      "simt_step.yield"(%8) {fallthrough = true} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
    ^bb3(%11: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %13 = "simt_step.if"(%12) ({
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32_5 : i32
          %c1_i32 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32 : i32
          %17 = arith.cmpi slt, %arg6, %16 : i32
          "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c0_i32_5 = arith.constant 0 : i32
          %15 = arith.addi %arg0, %c0_i32_5 : i32
          %c1_i32 = arith.constant 1 : i32
          %16 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.continue"(%15, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) : (i32) -> ()
      }, {
        %c2_i32_3 = arith.constant 2 : i32
        %14 = arith.remsi %arg3, %c2_i32_3 : i32
        %15 = "simt_step.switch"(%14, %arg0) ({
        ^bb0(%arg5: i32):
          %c4_i32_4 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_4) {fallthrough = false} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%17: i32):  // no predecessors
          %c2_i32_5 = arith.constant 2 : i32
          %18 = arith.addi %arg0, %c2_i32_5 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%15) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %c4_i32_0 = arith.constant 4 : i32
    %5 = arith.addi %0, %c4_i32_0 : i32
    %6 = simt_step.lane_id
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
      %15 = "simt_step.switch"(%14, %0) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c4_i32_2 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_2) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c16_i32 = arith.constant 16 : i32
      %17 = arith.addi %c16_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_1 = arith.constant 4 : i32
      %19 = arith.addi %0, %c4_i32_1 : i32
      %20 = "simt_step.switch"(%18, %19) ({
      ^bb0(%arg3: i32):
        %c20_i32 = arith.constant 20 : i32
        %23 = arith.addi %c20_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %25 = "simt_step.switch"(%24, %0) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = true} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c2_i32_4 = arith.constant 2 : i32
          %36 = arith.addi %0, %c2_i32_4 : i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          %c2_i32_5 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_5) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %27 = arith.addi %c24_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_2 = arith.constant 1 : i32
        %29 = "simt_step.switch"(%28, %c1_i32_2) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %c2_i32_4 = arith.constant 2 : i32
          %37 = arith.addi %0, %c2_i32_4 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %31 = arith.addi %c28_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_3 = arith.constant 4 : i32
        %33 = arith.addi %0, %c4_i32_3 : i32
        %34 = "simt_step.switch"(%32, %33) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %35 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %c1_i32_4 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_4) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %22 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

