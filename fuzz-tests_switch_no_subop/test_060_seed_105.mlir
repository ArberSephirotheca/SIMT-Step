module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %7 = arith.remsi %arg3, %c4_i32 : i32
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
    %c2_i32 = arith.constant 2 : i32
    %1 = arith.remsi %arg3, %c2_i32 : i32
    %2 = "simt_step.switch"(%1, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %7:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %14, %c1_i32 : i32
        %16 = arith.cmpi slt, %arg6, %15 : i32
        "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%arg0, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%7#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %14, %c1_i32 : i32
        %16 = arith.cmpi slt, %arg6, %15 : i32
        "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c1_i32 = arith.constant 1 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32_8 : i32
        "simt_step.yield"(%c1_i32, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %11 = arith.addi %arg0, %c0_i32_6 : i32
      %12 = "simt_step.switch"(%arg3, %11) ({
      ^bb0(%arg5: i32):
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb1(%14: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_8) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c2_i32_7 = arith.constant 2 : i32
      %13 = arith.addi %arg0, %c2_i32_7 : i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32_3 = arith.constant 64 : i32
      %11 = arith.muli %arg3, %c64_i32_3 : i32
      %12 = arith.addi %11, %0 : i32
      %c128_i32 = arith.constant 128 : i32
      %13 = arith.addi %c128_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_4 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %11 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32 : i32
      %true_3 = arith.constant true
      %c512_i32 = arith.constant 512 : i32
      %c64_i32_4 = arith.constant 64 : i32
      %13 = arith.muli %arg3, %c64_i32_4 : i32
      %14 = arith.addi %c512_i32, %13 : i32
      %15 = arith.addi %14, %0 : i32
      %true_5 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c448_i32 = arith.constant 448 : i32
    %6 = arith.addi %c448_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %c512_i32 = arith.constant 512 : i32
      %11 = arith.addi %c512_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_3 : i32
      %14 = "simt_step.if"(%13) ({
        %c4_i32 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32) : (i32) -> ()
      }, {
        %c576_i32 = arith.constant 576 : i32
        %19 = arith.addi %c576_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %21 = "simt_step.switch"(%20, %0) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          %22 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %c1_i32_7 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %25 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb3(%26: i32):  // no predecessors
          %c1_i32_8 = arith.constant 1 : i32
          %27 = arith.addi %0, %c1_i32_8 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%21) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32_6 = arith.constant 64 : i32
        %19 = arith.muli %arg4, %c64_i32_6 : i32
        %20 = arith.addi %19, %0 : i32
        %c640_i32 = arith.constant 640 : i32
        %21 = arith.addi %c640_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_7 : i32
        "simt_step.condition"(%23, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %19 = arith.addi %arg3, %arg4 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %20 = arith.addi %arg4, %c1_i32_6 : i32
        %true_7 = arith.constant true
        "simt_step.yield"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%17: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c768_i32 = arith.constant 768 : i32
    %9 = arith.addi %c768_i32, %0 : i32
    %true_2 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

