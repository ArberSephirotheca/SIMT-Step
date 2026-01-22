module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.addi %arg0, %c2_i32 : i32
    %c5_i32 = arith.constant 5 : i32
    %1 = arith.remsi %0, %c5_i32 : i32
    %c2_i32_0 = arith.constant 2 : i32
    %2 = arith.addi %1, %c2_i32_0 : i32
    return %2 : i32
  }
  func.func @main(%arg0: !simt_step.resource<Global, i32>, %arg1: !simt_step.resource<Global, i32>) attributes {simt.num_threads = [64, 1, 1], simt.subgroup_width = 32 : i64} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %1 = call @helper0(%0) : (i32) -> i32
    %c128_i32 = arith.constant 128 : i32
    %2 = arith.addi %c128_i32, %0 : i32
    "simt_step.buffer.store"(%arg0, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c2_i32 = arith.constant 2 : i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %3:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32 = arith.constant 64 : i32
      %7 = arith.muli %arg3, %c64_i32 : i32
      %8 = arith.addi %7, %0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %9 = arith.addi %c0_i32_1, %8 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_2 : i32
      "simt_step.condition"(%11, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %7 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c0_i32_1 = arith.constant 0 : i32
      %c64_i32 = arith.constant 64 : i32
      %9 = arith.muli %arg3, %c64_i32 : i32
      %10 = arith.addi %c0_i32_1, %9 : i32
      %11 = arith.addi %10, %0 : i32
      %true_2 = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%7, %8) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c320_i32 = arith.constant 320 : i32
    %4 = arith.addi %c320_i32, %0 : i32
    %5 = "simt_step.buffer.load"(%arg1, %4) : (!simt_step.resource<Global, i32>, i32) -> i32
    %6 = "simt_step.switch"(%5, %0) ({
    ^bb0(%arg2: i32):
      %c384_i32 = arith.constant 384 : i32
      %7 = arith.addi %c384_i32, %0 : i32
      %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
      %9 = "simt_step.switch"(%8, %0) ({
      ^bb0(%arg3: i32):
        %true_2 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %22 = arith.addi %c256_i32, %0 : i32
        %true_3 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c448_i32 = arith.constant 448 : i32
        %25 = arith.addi %c448_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_4 : i32
        %28 = "simt_step.if"(%27) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          %c2_i32_12 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        %c512_i32 = arith.constant 512 : i32
        %29 = arith.addi %c512_i32, %0 : i32
        %true_5 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
      ^bb2(%31: i32):  // no predecessors
        %c512_i32_6 = arith.constant 512 : i32
        %32 = arith.addi %c512_i32_6, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %34 = simt_step.lane_id
        %35 = arith.index_cast %34 : index to i32
        %36 = "simt_step.switch"(%33, %35) ({
        ^bb0(%arg4: i32):
          %43 = simt_step.subgroup_id
          %44 = arith.index_cast %43 : index to i32
          %true_12 = arith.constant true
          %c768_i32 = arith.constant 768 : i32
          %45 = arith.addi %c768_i32, %0 : i32
          %true_13 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = true} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %c2_i32_14 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c1024_i32 = arith.constant 1024 : i32
        %37 = arith.addi %c1024_i32, %0 : i32
        %true_8 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb3(%39: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %40 = arith.addi %0, %c0_i32_9 : i32
        %true_10 = arith.constant true
        %c1280_i32 = arith.constant 1280 : i32
        %41 = arith.addi %c1280_i32, %0 : i32
        %true_11 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c576_i32 = arith.constant 576 : i32
      %11 = arith.addi %c576_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %13 = simt_step.subgroup_id
      %14 = arith.index_cast %13 : index to i32
      %15 = "simt_step.switch"(%12, %14) ({
      ^bb0(%arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %0, %c1_i32 : i32
        %true_2 = arith.constant true
        %c1536_i32 = arith.constant 1536 : i32
        %23 = arith.addi %c1536_i32, %0 : i32
        %true_3 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c640_i32 = arith.constant 640 : i32
        %26 = arith.addi %c640_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %28 = "simt_step.switch"(%27, %0) ({
        ^bb0(%arg4: i32):
          %29 = simt_step.subgroup_id
          %30 = arith.index_cast %29 : index to i32
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %c2_i32_4 = arith.constant 2 : i32
          %32 = arith.addi %0, %c2_i32_4 : i32
          %true_5 = arith.constant true
          %c1792_i32 = arith.constant 1792 : i32
          %33 = arith.addi %c1792_i32, %0 : i32
          %true_6 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %36 = simt_step.subgroup_id
          %37 = arith.index_cast %36 : index to i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb2(%16: i32):  // no predecessors
      %c704_i32 = arith.constant 704 : i32
      %17 = arith.addi %c704_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = "simt_step.switch"(%18, %0) ({
      ^bb0(%arg3: i32):
        %22 = simt_step.subgroup_id
        %23 = arith.index_cast %22 : index to i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %25 = arith.addi %0, %c3_i32 : i32
        %true_2 = arith.constant true
        %c2048_i32 = arith.constant 2048 : i32
        %26 = arith.addi %c2048_i32, %0 : i32
        %true_3 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c2304_i32 = arith.constant 2304 : i32
      %20 = arith.addi %c2304_i32, %0 : i32
      %true_1 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

