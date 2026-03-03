module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = simt_step.lane_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %8 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %9 = "simt_step.if"(%8) ({
        %c0_i32_4 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %16 = "simt_step.if"(%15) ({
          %c1_i32_6 = arith.constant 1 : i32
          %17 = arith.addi %arg0, %c1_i32_6 : i32
          "simt_step.yield"(%17) : (i32) -> ()
        }, {
          %c0_i32_6 = arith.constant 0 : i32
          %17 = arith.addi %arg0, %c0_i32_6 : i32
          "simt_step.yield"(%17) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_5 = arith.constant 1 : i32
        "simt_step.yield"(%16) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32_6 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c0_i32_6 = arith.constant 0 : i32
          %16 = arith.addi %arg0, %c0_i32_6 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %17 = arith.addi %arg6, %c1_i32_7 : i32
          "simt_step.yield"(%16, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%15#0) : (i32) -> ()
      }) : (i1) -> i32
      %c2_i32_2 = arith.constant 2 : i32
      %10 = arith.addi %arg0, %c2_i32_2 : i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %13 = "simt_step.if"(%12) ({
        %c0_i32_4 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %16 = "simt_step.if"(%15) ({
          %c1_i32_5 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_5) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%16) : (i32) -> ()
      }, {
        %c1_i32_4 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_4) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %7 = arith.select %6, %arg0, %3 : i32
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
      %c12_i32 = arith.constant 12 : i32
      %11 = arith.addi %c12_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
      %14 = "simt_step.if"(%13) ({
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %16 = arith.muli %arg3, %c4_i32_5 : i32
          %17 = arith.addi %16, %0 : i32
          %c16_i32_6 = arith.constant 16 : i32
          %18 = arith.addi %c16_i32_6, %17 : i32
          %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %20 = arith.cmpi ne, %19, %c0_i32_7 : i32
          "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %16 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %arg3, %c1_i32 : i32
          "simt_step.yield"(%16, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_4 = arith.constant true
        "simt_step.yield"(%15#0) : (i32) -> ()
      }, {
        %c36_i32 = arith.constant 36 : i32
        %15 = arith.addi %c36_i32, %0 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %16, %c0_i32_2 : i32
        %18 = "simt_step.if"(%17) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c0_i32_3 = arith.constant 0 : i32
          %19 = arith.addi %0, %c0_i32_3 : i32
          "simt_step.yield"(%19) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) : (i32) -> ()
    }, {
      %c40_i32 = arith.constant 40 : i32
      %11 = arith.addi %c40_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %13 = simt_step.lane_id
      %14 = arith.index_cast %13 : index to i32
      %15 = "simt_step.switch"(%12, %14) ({
      ^bb0(%arg2: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %22 = arith.muli %arg4, %c4_i32_9 : i32
          %23 = arith.addi %22, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %24 = arith.addi %c44_i32, %23 : i32
          %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %26 = arith.cmpi ne, %25, %c0_i32_10 : i32
          "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %22 = arith.addi %arg3, %arg4 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %23 = arith.addi %arg4, %c1_i32_9 : i32
          "simt_step.yield"(%22, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_4 = arith.constant true
        "simt_step.yield"(%16#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %18 = arith.addi %0, %c0_i32_5 : i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb2(%19: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %22 = arith.muli %arg4, %c4_i32_9 : i32
          %23 = arith.addi %22, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %24 = arith.addi %c64_i32, %23 : i32
          %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %26 = arith.cmpi ne, %25, %c0_i32_10 : i32
          "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %22 = arith.addi %arg3, %arg4 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %23 = arith.addi %arg4, %c1_i32_9 : i32
          "simt_step.yield"(%22, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        "simt_step.yield"(%20#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%21: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      "simt_step.yield"(%15) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

