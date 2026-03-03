module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c2_i32 = arith.constant 2 : i32
      %4 = arith.remsi %arg3, %c2_i32 : i32
      %5 = simt_step.subgroup_id
      %6 = arith.index_cast %5 : index to i32
      %7 = "simt_step.switch"(%4, %6) ({
      ^bb0(%arg4: i32):
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.remsi %arg3, %c4_i32 : i32
        %c2_i32_1 = arith.constant 2 : i32
        %11 = "simt_step.switch"(%10, %c2_i32_1) ({
        ^bb0(%arg5: i32):
          %c0_i32_3 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_3) {fallthrough = true} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb2(%15: i32):  // no predecessors
          %c2_i32_4 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_4) {fallthrough = false} : (i32) -> ()
        ^bb3(%16: i32):  // no predecessors
          %c2_i32_5 = arith.constant 2 : i32
          %17 = arith.addi %arg0, %c2_i32_5 : i32
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %13 = arith.addi %arg0, %c0_i32_2 : i32
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %8 = simt_step.lane_id
      %9 = arith.index_cast %8 : index to i32
      "simt_step.yield"(%7) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_1) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_0, %arg0 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_5 : i32
      %16 = arith.addi %15, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %17 = arith.addi %c8_i32, %16 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_6 : i32
      "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %15 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%15, %16) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c28_i32 = arith.constant 28 : i32
    %8 = arith.addi %c28_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = simt_step.subgroup_id
    %11 = arith.index_cast %10 : index to i32
    %12 = "simt_step.switch"(%9, %11) ({
    ^bb0(%arg2: i32):
      %c32_i32_5 = arith.constant 32 : i32
      %15 = arith.addi %c32_i32_5, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_6 = arith.constant 4 : i32
      %17 = "simt_step.switch"(%16, %c4_i32_6) ({
      ^bb0(%arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %19 = arith.addi %c36_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_8 : i32
      %22 = "simt_step.if"(%21) ({
        %c40_i32 = arith.constant 40 : i32
        %30 = arith.addi %c40_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_13 : i32
        %33 = "simt_step.if"(%32) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_14 = arith.constant 0 : i32
          %34 = arith.addi %0, %c0_i32_14 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%33) : (i32) -> ()
      }, {
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %31 = arith.muli %arg4, %c4_i32_16 : i32
          %32 = arith.addi %31, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %33 = arith.addi %c44_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_17 : i32
          "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %31 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.continue"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        "simt_step.yield"(%30#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %24 = arith.addi %c64_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_9 : i32
      %27 = "simt_step.if"(%26) ({
        %c68_i32 = arith.constant 68 : i32
        %30 = arith.addi %c68_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_13 : i32
        %33 = "simt_step.if"(%32) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%33) : (i32) -> ()
      }, {
        %c0_i32_13 = arith.constant 0 : i32
        %30 = arith.addi %0, %c0_i32_13 : i32
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb3(%28: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %29:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_13 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_13 : i32
        %31 = arith.addi %30, %0 : i32
        %c72_i32 = arith.constant 72 : i32
        %32 = arith.addi %c72_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_14 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %30 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_12 = arith.constant true
      "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %13 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

