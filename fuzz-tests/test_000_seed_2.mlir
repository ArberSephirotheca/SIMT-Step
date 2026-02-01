module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %c3_i32 = arith.constant 3 : i32
    %1 = "simt_step.switch"(%0, %c3_i32) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32_4 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32_5 : i32
        %14 = arith.cmpi slt, %arg6, %13 : i32
        "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %12 = arith.addi %arg0, %c0_i32_4 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %13 = arith.addi %arg6, %c1_i32_5 : i32
        "simt_step.yield"(%12, %13) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%4#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %c2_i32_2 = arith.constant 2 : i32
      %7 = "simt_step.switch"(%6, %c2_i32_2) ({
      ^bb0(%arg5: i32):
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %c1_i32_4 = arith.constant 1 : i32
        %13 = arith.addi %arg0, %c1_i32_4 : i32
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb2(%8: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    ^bb3(%9: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %11 = "simt_step.if"(%10) ({
        %c1_i32_4 = arith.constant 1 : i32
        %12 = arith.addi %arg0, %c1_i32_4 : i32
        "simt_step.yield"(%12) : (i32) -> ()
      }, {
        "simt_step.yield"(%arg0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c128_i32 = arith.constant 128 : i32
    %5 = arith.addi %c128_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      %c192_i32 = arith.constant 192 : i32
      %18 = arith.addi %c192_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %20 = arith.addi %0, %c0_i32_3 : i32
      %21 = "simt_step.switch"(%19, %20) ({
      ^bb0(%arg3: i32):
        %c256_i32_6 = arith.constant 256 : i32
        %26 = arith.addi %c256_i32_6, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_7 : i32
        %29 = "simt_step.if"(%28) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c320_i32 = arith.constant 320 : i32
        %31 = arith.addi %c320_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %33 = "simt_step.switch"(%32, %0) ({
        ^bb0(%arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_9) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c384_i32 = arith.constant 384 : i32
      %23 = arith.addi %c384_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32 = arith.constant 4 : i32
      %25 = "simt_step.switch"(%24, %c4_i32) ({
      ^bb0(%arg3: i32):
        %c448_i32 = arith.constant 448 : i32
        %26 = arith.addi %c448_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_6 : i32
        %29 = "simt_step.if"(%28) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %40 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c512_i32 = arith.constant 512 : i32
        %31 = arith.addi %c512_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_7 : i32
        %34 = "simt_step.if"(%33) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c576_i32 = arith.constant 576 : i32
        %36 = arith.addi %c576_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_8 : i32
        %39 = "simt_step.if"(%38) ({
          %c0_i32_9 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_9) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c256_i32 = arith.constant 256 : i32
    %8 = arith.addi %c256_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c640_i32 = arith.constant 640 : i32
    %10 = arith.addi %c640_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %11, %c0_i32_1 : i32
    %13 = "simt_step.if"(%12) ({
      %c0_i32_3 = arith.constant 0 : i32
      %18 = arith.addi %0, %c0_i32_3 : i32
      "simt_step.yield"(%18) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c64_i32_5 = arith.constant 64 : i32
        %19 = arith.muli %arg3, %c64_i32_5 : i32
        %20 = arith.addi %19, %0 : i32
        %c704_i32 = arith.constant 704 : i32
        %21 = arith.addi %c704_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_6 : i32
        "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c1024_i32_5 = arith.constant 1024 : i32
        %19 = arith.addi %c1024_i32_5, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_6 : i32
        %22 = "simt_step.if"(%21) ({
          %31 = simt_step.lane_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %31 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        %c512_i32 = arith.constant 512 : i32
        %23 = arith.addi %c512_i32, %0 : i32
        %true_7 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %25 = arith.addi %arg2, %22 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg3, %c1_i32 : i32
        %true_8 = arith.constant true
        %c768_i32 = arith.constant 768 : i32
        %c64_i32_9 = arith.constant 64 : i32
        %27 = arith.muli %arg3, %c64_i32_9 : i32
        %28 = arith.addi %c768_i32, %27 : i32
        %29 = arith.addi %28, %0 : i32
        %true_10 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) : (i32) -> ()
    }) : (i1) -> i32
    %c1024_i32 = arith.constant 1024 : i32
    %14 = arith.addi %c1024_i32, %0 : i32
    %true_2 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %16 = simt_step.subgroup_id
    %17 = arith.index_cast %16 : index to i32
    return
  }
}

