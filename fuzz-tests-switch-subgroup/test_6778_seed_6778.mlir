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
        %c2_i32 = arith.constant 2 : i32
        %3 = arith.remsi %arg3, %c2_i32 : i32
        %c2_i32_2 = arith.constant 2 : i32
        %4 = arith.addi %arg0, %c2_i32_2 : i32
        %5 = "simt_step.switch"(%3, %4) ({
        ^bb0(%arg6: i32):
          %true = arith.constant true
          %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_3 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.muli %arg5, %c4_i32 : i32
          %9 = arith.addi %c0_i32_3, %8 : i32
          %10 = arith.addi %9, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
        ^bb1(%11: i32):  // no predecessors
          %true_4 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_5 = arith.constant 4 : i32
          %13 = arith.muli %arg5, %c4_i32_5 : i32
          %14 = arith.addi %c16_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %6 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%5, %6) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
    }, {
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %3 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) : (i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c8_i32 = arith.constant 8 : i32
      %10 = arith.addi %c8_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_5 : i32
      "simt_step.if"(%12) ({
        "simt_step.yield"() : () -> ()
      }, {
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %6 = simt_step.subgroup_id
    %7 = arith.index_cast %6 : index to i32
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %10 = arith.muli %arg3, %c4_i32_5 : i32
      %11 = arith.addi %10, %0 : i32
      %c12_i32 = arith.constant 12 : i32
      %12 = arith.addi %c12_i32, %11 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_6 : i32
      "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %10 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c48_i32 = arith.constant 48 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_5 : i32
      %13 = arith.addi %c48_i32, %12 : i32
      %14 = arith.addi %13, %0 : i32
      %true_6 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %9:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %10 = arith.muli %arg3, %c4_i32_5 : i32
      %11 = arith.addi %10, %0 : i32
      %c32_i32 = arith.constant 32 : i32
      %12 = arith.addi %c32_i32, %11 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_6 : i32
      "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %10 = arith.addi %0, %c0_i32_5 : i32
      %11 = arith.addi %arg2, %10 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c64_i32 = arith.constant 64 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_6 : i32
      %14 = arith.addi %c64_i32, %13 : i32
      %15 = arith.addi %14, %0 : i32
      %true_7 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

