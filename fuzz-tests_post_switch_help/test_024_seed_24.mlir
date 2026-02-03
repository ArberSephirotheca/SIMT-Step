module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %7 = arith.remsi %arg3, %c4_i32_2 : i32
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %7, %c1_i32 : i32
      %9 = arith.cmpi slt, %arg5, %8 : i32
      "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true_2 = arith.constant true
      %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %c64_i32 = arith.constant 64 : i32
      %8 = arith.muli %arg5, %c64_i32 : i32
      %9 = arith.addi %c0_i32_3, %8 : i32
      %10 = arith.addi %9, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%7, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c4_i32 = arith.constant 4 : i32
    %1 = arith.remsi %arg3, %c4_i32 : i32
    %c3_i32 = arith.constant 3 : i32
    %2 = "simt_step.switch"(%1, %c3_i32) ({
    ^bb0(%arg4: i32):
      %c2_i32 = arith.constant 2 : i32
      %7 = arith.remsi %arg3, %c2_i32 : i32
      %c3_i32_2 = arith.constant 3 : i32
      %8 = "simt_step.switch"(%7, %c3_i32_2) ({
      ^bb0(%arg5: i32):
        %c3_i32_7 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_7) {fallthrough = true} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c2_i32_8 = arith.constant 2 : i32
        %18 = arith.addi %arg0, %c2_i32_8 : i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%8) {fallthrough = true} : (i32) -> ()
    ^bb1(%9: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %11 = "simt_step.if"(%10) ({
        "simt_step.yield"(%arg0) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %arg0, %c1_i32 : i32
        "simt_step.yield"(%17) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %14 = "simt_step.if"(%13) ({
        %c2_i32_7 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_7) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
    ^bb3(%15: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %17 = arith.remsi %arg3, %c4_i32_7 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %17, %c1_i32 : i32
        %19 = arith.cmpi slt, %arg6, %18 : i32
        "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%c4_i32_7, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c256_i32 = arith.constant 256 : i32
    %4 = arith.addi %c256_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %6 = arith.select %5, %0#0, %2 : i32
    return
  }
  func.func @main(%arg0: !simt_step.resource<Global, i32>, %arg1: !simt_step.resource<Global, i32>) attributes {simt.num_threads = [64, 1, 1], simt.subgroup_width = 32 : i64} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %0 : i32
    %2 = "simt_step.buffer.load"(%arg1, %1) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c64_i32 = arith.constant 64 : i32
    %3 = arith.addi %c64_i32, %0 : i32
    %4 = "simt_step.buffer.load"(%arg1, %3) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %9 = arith.cmpi slt, %arg3, %c1_i32 : i32
        "simt_step.condition"(%9, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c3_i32 = arith.constant 3 : i32
        %9 = arith.remsi %0, %c3_i32 : i32
        %c4_i32 = arith.constant 4 : i32
        %10 = "simt_step.switch"(%9, %c4_i32) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %12 = arith.addi %arg4, %c2_i32 : i32
          "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
        ^bb1(%13: i32):  // no predecessors
          %c4_i32_7 = arith.constant 4 : i32
          %14 = arith.addi %13, %c4_i32_7 : i32
          "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
        ^bb2(%15: i32):  // no predecessors
          %c0_i32_8 = arith.constant 0 : i32
          %16 = arith.addi %15, %c0_i32_8 : i32
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb3(%17: i32):  // no predecessors
          %c2_i32_9 = arith.constant 2 : i32
          %18 = arith.addi %17, %c2_i32_9 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %11) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32_5 = arith.constant 64 : i32
      %8 = arith.muli %arg3, %c64_i32_5 : i32
      %9 = arith.addi %8, %0 : i32
      %c128_i32 = arith.constant 128 : i32
      %10 = arith.addi %c128_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_6 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %8 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c512_i32 = arith.constant 512 : i32
      %c64_i32_5 = arith.constant 64 : i32
      %10 = arith.muli %arg3, %c64_i32_5 : i32
      %11 = arith.addi %c512_i32, %10 : i32
      %12 = arith.addi %11, %0 : i32
      %true_6 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32_5 = arith.constant 64 : i32
      %8 = arith.muli %arg3, %c64_i32_5 : i32
      %9 = arith.addi %8, %0 : i32
      %c448_i32 = arith.constant 448 : i32
      %10 = arith.addi %c448_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_6 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %8 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c768_i32 = arith.constant 768 : i32
      %c64_i32_5 = arith.constant 64 : i32
      %10 = arith.muli %arg3, %c64_i32_5 : i32
      %11 = arith.addi %c768_i32, %10 : i32
      %12 = arith.addi %11, %0 : i32
      %true_6 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

