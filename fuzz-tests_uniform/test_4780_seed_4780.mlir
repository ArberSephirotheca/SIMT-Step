module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = "simt_step.switch"(%arg3, %c2_i32) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%3: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_2 = arith.constant 4 : i32
        %5 = arith.remsi %arg3, %c4_i32_2 : i32
        %c1_i32 = arith.constant 1 : i32
        %6 = arith.addi %5, %c1_i32 : i32
        %7 = arith.cmpi slt, %arg6, %6 : i32
        "simt_step.condition"(%7, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %5 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %6 = "simt_step.if"(%5) ({
          %c0_i32_4 = arith.constant 0 : i32
          %9 = arith.addi %arg0, %c0_i32_4 : i32
          "simt_step.yield"(%9) : (i32) -> ()
        }, {
          %c2_i32_4 = arith.constant 2 : i32
          %9 = arith.addi %arg0, %c2_i32_4 : i32
          "simt_step.yield"(%9) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %arg0, %c1_i32 : i32
        %c1_i32_3 = arith.constant 1 : i32
        %8 = arith.addi %arg6, %c1_i32_3 : i32
        "simt_step.yield"(%6, %8) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c4_i32 = arith.constant 4 : i32
      "simt_step.yield"(%4#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32, %arg0 : i32
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
    %c4_i32_0 = arith.constant 4 : i32
    %5 = arith.addi %0, %c4_i32_0 : i32
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %13 = arith.addi %c12_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_2 : i32
      %16 = "simt_step.if"(%15) ({
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %19 = arith.muli %arg4, %c4_i32_6 : i32
          %20 = arith.addi %19, %0 : i32
          %c16_i32_7 = arith.constant 16 : i32
          %21 = arith.addi %c16_i32_7, %20 : i32
          %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %23 = arith.cmpi ne, %22, %c0_i32_8 : i32
          "simt_step.condition"(%23, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %19 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.continue"(%19, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_5 = arith.constant true
        "simt_step.yield"(%18#0) : (i32) -> ()
      }, {
        %c36_i32 = arith.constant 36 : i32
        %18 = arith.addi %c36_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_3 : i32
        %21 = "simt_step.if"(%20) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%21) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %11 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

