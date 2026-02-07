module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %1 = "simt_step.switch"(%0, %c1_i32) ({
    ^bb0(%arg4: i32):
      %c2_i32 = arith.constant 2 : i32
      %4 = arith.remsi %arg3, %c2_i32 : i32
      %c4_i32 = arith.constant 4 : i32
      %5 = "simt_step.switch"(%4, %c4_i32) ({
      ^bb0(%arg5: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %14 = arith.addi %arg0, %c4_i32_5 : i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c2_i32_6 = arith.constant 2 : i32
        %16 = arith.addi %arg0, %c2_i32_6 : i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%5) {fallthrough = true} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %7 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %8 = "simt_step.if"(%7) ({
        "simt_step.yield"(%arg0) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %14 = arith.addi %arg0, %c0_i32_5 : i32
        "simt_step.yield"(%14) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32_5 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %15 = arith.addi %14, %c1_i32_6 : i32
        %16 = arith.cmpi slt, %arg6, %15 : i32
        "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c1_i32_5 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32_5 : i32
        "simt_step.yield"(%arg0, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%11: i32):  // no predecessors
      %c3_i32_3 = arith.constant 3 : i32
      %12 = arith.remsi %arg3, %c3_i32_3 : i32
      %13 = "simt_step.switch"(%12, %arg0) ({
      ^bb0(%arg5: i32):
        %c4_i32_5 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_5) {fallthrough = false} : (i32) -> ()
      ^bb1(%14: i32):  // no predecessors
        %c4_i32_6 = arith.constant 4 : i32
        %15 = arith.addi %arg0, %c4_i32_6 : i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb2(%16: i32):  // no predecessors
        %c1_i32_7 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_7) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %c1_i32_4 = arith.constant 1 : i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      "simt_step.yield"() : () -> ()
    }, {
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.cmpi slt, %arg3, %c1_i32 : i32
        "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c3_i32 = arith.constant 3 : i32
        %12 = arith.remsi %0, %c3_i32 : i32
        %c3_i32_4 = arith.constant 3 : i32
        %13 = "simt_step.switch"(%12, %c3_i32_4) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %15 = arith.addi %arg4, %c2_i32 : i32
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          %c0_i32_5 = arith.constant 0 : i32
          %17 = arith.addi %16, %c0_i32_5 : i32
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb2(%18: i32):  // no predecessors
          %c1_i32_6 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32_6 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c128_i32 = arith.constant 128 : i32
    %6 = arith.addi %c128_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c192_i32 = arith.constant 192 : i32
      %12 = arith.addi %c192_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_2 : i32
      %15 = "simt_step.if"(%14) ({
        %c3_i32 = arith.constant 3 : i32
        %21 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%21) : (i32) -> ()
      }, {
        %c256_i32_5 = arith.constant 256 : i32
        %21 = arith.addi %c256_i32_5, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %23 = "simt_step.switch"(%22, %0) ({
        ^bb0(%arg3: i32):
          %c0_i32_7 = arith.constant 0 : i32
          %24 = arith.addi %0, %c0_i32_7 : i32
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %26 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%23) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb2(%16: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_3) {fallthrough = false} : (i32) -> ()
    ^bb3(%17: i32):  // no predecessors
      %c320_i32 = arith.constant 320 : i32
      %18 = arith.addi %c320_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg3: i32):
        %c384_i32 = arith.constant 384 : i32
        %21 = arith.addi %c384_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_5 : i32
        %24 = "simt_step.if"(%23) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c448_i32 = arith.constant 448 : i32
        %26 = arith.addi %c448_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_6 : i32
        %29 = "simt_step.if"(%28) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %39 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        %c512_i32 = arith.constant 512 : i32
        %31 = arith.addi %c512_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32 = arith.constant 4 : i32
        %33 = arith.addi %0, %c4_i32 : i32
        %34 = "simt_step.switch"(%32, %33) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
      ^bb3(%35: i32):  // no predecessors
        %c576_i32 = arith.constant 576 : i32
        %36 = arith.addi %c576_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = "simt_step.switch"(%37, %0) ({
        ^bb0(%arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %39 = arith.addi %0, %c4_i32_9 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %41 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c256_i32 = arith.constant 256 : i32
    %9 = arith.addi %c256_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

