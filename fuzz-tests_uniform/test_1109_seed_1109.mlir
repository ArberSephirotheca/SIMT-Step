module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %12 = simt_step.subgroup_id
      %13 = arith.index_cast %12 : index to i32
      "simt_step.yield"(%13) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %15, %c1_i32 : i32
        %17 = arith.cmpi slt, %arg5, %16 : i32
        "simt_step.condition"(%17, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%c4_i32, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %13 = simt_step.subgroup_id
      %14 = arith.index_cast %13 : index to i32
      "simt_step.yield"(%12#0) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_0, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c2_i32 = arith.constant 2 : i32
    %4 = arith.remsi %arg3, %c2_i32 : i32
    %5 = simt_step.subgroup_id
    %6 = arith.index_cast %5 : index to i32
    %7 = "simt_step.switch"(%4, %6) ({
    ^bb0(%arg4: i32):
      %c2_i32_3 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32_3) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c2_i32_4 = arith.constant 2 : i32
      %13 = arith.remsi %arg3, %c2_i32_4 : i32
      %14 = "simt_step.switch"(%13, %arg0) ({
      ^bb0(%arg5: i32):
        %c3_i32 = arith.constant 3 : i32
        %19 = arith.addi %arg0, %c3_i32 : i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c4_i32 = arith.constant 4 : i32
        %21 = arith.addi %arg0, %c4_i32 : i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb2(%16: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
      %18 = "simt_step.if"(%17) ({
        "simt_step.yield"(%arg0) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %20 = "simt_step.if"(%19) ({
          %c0_i32_9 = arith.constant 0 : i32
          %22 = arith.addi %arg0, %c0_i32_9 : i32
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          %c0_i32_9 = arith.constant 0 : i32
          %22 = arith.addi %arg0, %c0_i32_9 : i32
          "simt_step.yield"(%22) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_8 = arith.constant 1 : i32
        %21 = arith.addi %arg0, %c1_i32_8 : i32
        "simt_step.yield"(%20) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32_6 = arith.constant 1 : i32
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %11 = arith.select %10, %1, %7 : i32
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
      %c4_i32_10 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_10 : i32
      %17 = arith.addi %16, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %18 = arith.addi %c8_i32, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_11 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %16 = simt_step.subgroup_id
      %17 = arith.index_cast %16 : index to i32
      %18 = arith.addi %arg2, %17 : i32
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%18, %19) : (i32, i32) -> ()
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
      %c4_i32_10 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_10 : i32
      %17 = arith.addi %16, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %18 = arith.addi %c28_i32, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_11 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_10 = arith.constant 4 : i32
      %16 = arith.addi %0, %c4_i32_10 : i32
      %17 = arith.addi %arg2, %16 : i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%17, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %9 = arith.addi %c48_i32, %0 : i32
    %true_6 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c48_i32_7 = arith.constant 48 : i32
    %11 = arith.addi %c48_i32_7, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = "simt_step.switch"(%12, %0) ({
    ^bb0(%arg2: i32):
      %c52_i32 = arith.constant 52 : i32
      %16 = arith.addi %c52_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_10 : i32
      %19 = "simt_step.if"(%18) ({
        %c4_i32_11 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_11) : (i32) -> ()
      }, {
        %c56_i32 = arith.constant 56 : i32
        %24 = arith.addi %c56_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_11 = arith.constant 4 : i32
        %26 = arith.addi %0, %c4_i32_11 : i32
        %27 = "simt_step.switch"(%25, %26) ({
        ^bb0(%arg3: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %28 = arith.addi %0, %c4_i32_13 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %30 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%27) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %21 = arith.addi %0, %c3_i32 : i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %23 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_8 = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %14 = arith.addi %c64_i32, %0 : i32
    %true_9 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

