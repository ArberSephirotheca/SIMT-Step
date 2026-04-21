module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = simt_step.lane_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32 : i32
      %5 = "simt_step.if"(%4) ({
        %c0_i32_1 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %15 = "simt_step.if"(%14) ({
          %true_2 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c0_i32_3 = arith.constant 0 : i32
          %17 = arith.addi %c0_i32_3, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }, {
          %true_2 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %17 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%15) : (i32) -> ()
      }, {
        %true_1 = arith.constant true
        %14 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %15 = arith.addi %c32_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%14) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%5) {fallthrough = true} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %true = arith.constant true
      %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %8 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%7) {fallthrough = true} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c2_i32_0 = arith.constant 2 : i32
      %10 = arith.remsi %arg3, %c2_i32_0 : i32
      %11 = simt_step.subgroup_id
      %12 = arith.index_cast %11 : index to i32
      %13 = "simt_step.switch"(%10, %12) ({
      ^bb0(%arg5: i32):
        %c2_i32_1 = arith.constant 2 : i32
        %14 = arith.remsi %arg3, %c2_i32_1 : i32
        %15 = "simt_step.switch"(%14, %arg0) ({
        ^bb0(%arg6: i32):
          %true_5 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %21 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %true_6 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %24 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_2 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %17 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15) {fallthrough = true} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32 : i32
          %22 = arith.cmpi slt, %arg7, %21 : i32
          "simt_step.condition"(%22, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_5 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32 = arith.constant 4 : i32
          %21 = arith.muli %arg7, %c4_i32 : i32
          %22 = arith.addi %c112_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.continue"(%20, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
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
    %5 = simt_step.lane_id
    %6 = arith.index_cast %5 : index to i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %8 = arith.muli %arg3, %c4_i32_2 : i32
      %9 = arith.addi %8, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %10 = arith.addi %c8_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_3 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %8 = arith.addi %c28_i32, %0 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %9, %c0_i32_2 : i32
      %11 = "simt_step.if"(%10) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %21 = arith.muli %arg5, %c4_i32_8 : i32
          %22 = arith.addi %21, %0 : i32
          %c32_i32 = arith.constant 32 : i32
          %23 = arith.addi %c32_i32, %22 : i32
          %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %25 = arith.cmpi ne, %24, %c0_i32_9 : i32
          "simt_step.condition"(%25, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %21 = arith.addi %arg4, %arg5 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %22 = arith.addi %arg5, %c1_i32_8 : i32
          %true_9 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %23 = arith.muli %arg5, %c4_i32_10 : i32
          %24 = arith.addi %c128_i32, %23 : i32
          %25 = arith.addi %24, %0 : i32
          %true_11 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%21, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) : (i32) -> ()
      }, {
        %c52_i32 = arith.constant 52 : i32
        %20 = arith.addi %c52_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_6 : i32
        %23 = "simt_step.if"(%22) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %26 = simt_step.lane_id
          %27 = arith.index_cast %26 : index to i32
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %24 = arith.addi %c144_i32, %0 : i32
        %true_7 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23) : (i32) -> ()
      }) : (i1) -> i32
      %c160_i32 = arith.constant 160 : i32
      %12 = arith.addi %c160_i32, %0 : i32
      %true = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %14 = arith.addi %arg2, %11 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      %true_3 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_4 : i32
      %17 = arith.addi %c176_i32, %16 : i32
      %18 = arith.addi %17, %0 : i32
      %true_5 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

