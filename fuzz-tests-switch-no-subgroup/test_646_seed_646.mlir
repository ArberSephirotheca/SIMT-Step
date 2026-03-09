module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %3 = "simt_step.if"(%2) ({
      %true_2 = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %7 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) : (i32) -> ()
    }, {
      %c4_i32 = arith.constant 4 : i32
      %6 = arith.remsi %arg3, %c4_i32 : i32
      %7 = simt_step.subgroup_id
      %8 = arith.index_cast %7 : index to i32
      %9 = "simt_step.switch"(%6, %8) ({
      ^bb0(%arg4: i32):
        %c2_i32 = arith.constant 2 : i32
        %10 = arith.remsi %arg3, %c2_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %11 = "simt_step.switch"(%10, %c1_i32) ({
        ^bb0(%arg5: i32):
          %c0_i32_5 = arith.constant 0 : i32
          %19 = arith.addi %arg0, %c0_i32_5 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %c4_i32_6 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_6) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
      ^bb2(%13: i32):  // no predecessors
        %c2_i32_2 = arith.constant 2 : i32
        %14 = arith.remsi %arg3, %c2_i32_2 : i32
        %15 = "simt_step.switch"(%14, %arg0) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        "simt_step.yield"(%15) {fallthrough = true} : (i32) -> ()
      ^bb3(%16: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %18 = "simt_step.if"(%17) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c1_i32_5 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_5) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%9) : (i32) -> ()
    }) : (i1) -> i32
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_8 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_8 : i32
      %10 = arith.addi %9, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %11 = arith.addi %c8_i32, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_9 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %9 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c32_i32 = arith.constant 32 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_8 : i32
      %12 = arith.addi %c32_i32, %11 : i32
      %13 = arith.addi %12, %0 : i32
      %true_9 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_8 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_8 : i32
      %10 = arith.addi %9, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %11 = arith.addi %c28_i32, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_9 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %9 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c48_i32 = arith.constant 48 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_8 : i32
      %12 = arith.addi %c48_i32, %11 : i32
      %13 = arith.addi %12, %0 : i32
      %true_9 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%9, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_8 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_8 : i32
      %10 = arith.addi %9, %0 : i32
      %c48_i32 = arith.constant 48 : i32
      %11 = arith.addi %c48_i32, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_9 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %9 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c64_i32 = arith.constant 64 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_8 : i32
      %12 = arith.addi %c64_i32, %11 : i32
      %13 = arith.addi %12, %0 : i32
      %true_9 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%9, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_6 = arith.constant 0 : i32
    %c0_i32_7 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_8 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_8 : i32
      %10 = arith.addi %9, %0 : i32
      %c68_i32 = arith.constant 68 : i32
      %11 = arith.addi %c68_i32, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_9 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c88_i32 = arith.constant 88 : i32
      %9 = arith.addi %c88_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_8 : i32
      %12 = "simt_step.if"(%11) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %21 = simt_step.subgroup_id
        %22 = arith.index_cast %21 : index to i32
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      %c80_i32 = arith.constant 80 : i32
      %13 = arith.addi %c80_i32, %0 : i32
      %true = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %15 = arith.addi %arg2, %12 : i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %arg3, %c1_i32 : i32
      %true_9 = arith.constant true
      %c96_i32 = arith.constant 96 : i32
      %c4_i32_10 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_10 : i32
      %18 = arith.addi %c96_i32, %17 : i32
      %19 = arith.addi %18, %0 : i32
      %true_11 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15, %16) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

