module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %c4_i32 = arith.constant 4 : i32
    %1 = arith.addi %arg0, %c4_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      %11 = arith.addi %arg0, %c3_i32 : i32
      "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c2_i32_3 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32_3) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %6 = "simt_step.if"(%5) ({
      %c0_i32_3 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %12 = "simt_step.if"(%11) ({
        %c3_i32 = arith.constant 3 : i32
        %15 = arith.remsi %arg3, %c3_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %arg0, %c1_i32 : i32
        %17 = "simt_step.switch"(%15, %16) ({
        ^bb0(%arg4: i32):
          %c3_i32_5 = arith.constant 3 : i32
          %19 = arith.addi %arg0, %c3_i32_5 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %c3_i32_6 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_6) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %c3_i32_7 = arith.constant 3 : i32
          %22 = arith.addi %arg0, %c3_i32_7 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32_4 = arith.constant 1 : i32
        %18 = arith.addi %arg0, %c1_i32_4 : i32
        "simt_step.yield"(%17) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %16 = "simt_step.if"(%15) ({
          %c0_i32_6 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_6) : (i32) -> ()
        }, {
          %17 = simt_step.subgroup_id
          %18 = arith.index_cast %17 : index to i32
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32_5 = arith.constant 2 : i32
        "simt_step.yield"(%16) : (i32) -> ()
      }) : (i1) -> i32
      %13 = simt_step.subgroup_id
      %14 = arith.index_cast %13 : index to i32
      "simt_step.yield"(%12) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32_6 : i32
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32 : i32
        %14 = arith.cmpi slt, %arg5, %13 : i32
        "simt_step.condition"(%14, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c2_i32_6 = arith.constant 2 : i32
        %12 = arith.remsi %arg3, %c2_i32_6 : i32
        %13 = simt_step.subgroup_id
        %14 = arith.index_cast %13 : index to i32
        %15 = "simt_step.switch"(%12, %14) ({
        ^bb0(%arg6: i32):
          %c2_i32_7 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %c1_i32_8 = arith.constant 1 : i32
          %20 = arith.addi %arg0, %c1_i32_8 : i32
          "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          %22 = arith.addi %arg0, %c0_i32_9 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %16 = simt_step.subgroup_id
        %17 = arith.index_cast %16 : index to i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.break"(%15, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c0_i32_5 = arith.constant 0 : i32
      "simt_step.yield"(%11#0) : (i32) -> ()
    }) : (i1) -> i32
    %true_1 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %10 = arith.select %9, %2, %6 : i32
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
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %15 = arith.muli %arg3, %c4_i32_8 : i32
        %16 = arith.addi %15, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %17 = arith.addi %c12_i32, %16 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_9 : i32
        "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c32_i32_8 = arith.constant 32 : i32
        %15 = arith.addi %c32_i32_8, %0 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %16, %c0_i32_9 : i32
        %18 = "simt_step.if"(%17) ({
          %21 = simt_step.subgroup_id
          %22 = arith.index_cast %21 : index to i32
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %19 = arith.addi %arg2, %18 : i32
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%14#0) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      %14 = arith.addi %0, %c3_i32 : i32
      "simt_step.yield"(%14) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %9 = arith.addi %c32_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_5 : i32
      %15 = arith.addi %14, %0 : i32
      %c36_i32 = arith.constant 36 : i32
      %16 = arith.addi %c36_i32, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_6 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c56_i32 = arith.constant 56 : i32
      %14 = arith.addi %c56_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_5 : i32
      %17 = "simt_step.if"(%16) ({
        %c60_i32 = arith.constant 60 : i32
        %20 = arith.addi %c60_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_6 : i32
        %23 = "simt_step.if"(%22) ({
          %c0_i32_7 = arith.constant 0 : i32
          %24 = arith.addi %0, %c0_i32_7 : i32
          "simt_step.yield"(%24) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %24 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%24) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) : (i32) -> ()
      }, {
        %c64_i32 = arith.constant 64 : i32
        %20 = arith.addi %c64_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_6 : i32
        %23 = "simt_step.if"(%22) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %24 = simt_step.lane_id
          %25 = arith.index_cast %24 : index to i32
          "simt_step.yield"(%25) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) : (i32) -> ()
      }) : (i1) -> i32
      %18 = arith.addi %arg2, %17 : i32
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%18, %19) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_3 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %12 = arith.addi %c48_i32, %0 : i32
    %true_4 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

