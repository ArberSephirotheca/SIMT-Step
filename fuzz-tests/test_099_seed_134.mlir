module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.addi %arg0, %c4_i32 : i32
    %c5_i32 = arith.constant 5 : i32
    %1 = arith.remsi %0, %c5_i32 : i32
    %c4_i32_0 = arith.constant 4 : i32
    %2 = arith.addi %1, %c4_i32_0 : i32
    return %2 : i32
  }
  func.func @main(%arg0: !simt_step.resource<Global, i32>, %arg1: !simt_step.resource<Global, i32>) attributes {simt.num_threads = [64, 1, 1], simt.subgroup_width = 32 : i64} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %1 = call @helper0(%0) : (i32) -> i32
    %c128_i32 = arith.constant 128 : i32
    %2 = arith.addi %c128_i32, %0 : i32
    "simt_step.buffer.store"(%arg0, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32, %0 : i32
    %4 = "simt_step.buffer.load"(%arg1, %3) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %4, %c0_i32_0 : i32
    %6 = "simt_step.if"(%5) ({
      %c0_i32_2 = arith.constant 0 : i32
      %10 = arith.addi %0, %c0_i32_2 : i32
      "simt_step.yield"(%10) : (i32) -> ()
    }, {
      %c64_i32 = arith.constant 64 : i32
      %10 = arith.addi %c64_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %12 = "simt_step.switch"(%11, %c1_i32) ({
      ^bb0(%arg2: i32):
        %c4_i32 = arith.constant 4 : i32
        %13 = arith.addi %0, %c4_i32 : i32
        %true_2 = arith.constant true
        %c0_i32_3 = arith.constant 0 : i32
        %14 = arith.addi %c0_i32_3, %0 : i32
        %true_4 = arith.constant true
        %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c64_i32_10 = arith.constant 64 : i32
          %25 = arith.muli %arg4, %c64_i32_10 : i32
          %26 = arith.addi %25, %0 : i32
          %c128_i32_11 = arith.constant 128 : i32
          %27 = arith.addi %c128_i32_11, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_12 : i32
          "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %25 = arith.addi %arg3, %arg4 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %26 = arith.addi %arg4, %c1_i32_10 : i32
          %true_11 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c64_i32_12 = arith.constant 64 : i32
          %27 = arith.muli %arg4, %c64_i32_12 : i32
          %28 = arith.addi %c256_i32, %27 : i32
          %29 = arith.addi %28, %0 : i32
          %true_13 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %18 = arith.addi %c512_i32, %0 : i32
        %true_8 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c448_i32 = arith.constant 448 : i32
        %21 = arith.addi %c448_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %23 = arith.addi %0, %c0_i32_9 : i32
        %24 = "simt_step.switch"(%22, %23) ({
        ^bb0(%arg3: i32):
          %25 = simt_step.lane_id
          %26 = arith.index_cast %25 : index to i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %true_10 = arith.constant true
          %c768_i32 = arith.constant 768 : i32
          %28 = arith.addi %c768_i32, %0 : i32
          %true_11 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          %true_13 = arith.constant true
          %c1024_i32 = arith.constant 1024 : i32
          %31 = arith.addi %c1024_i32, %0 : i32
          %true_14 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb3(%33: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) : (i32) -> ()
    }) : (i1) -> i32
    %c1280_i32 = arith.constant 1280 : i32
    %7 = arith.addi %c1280_i32, %0 : i32
    %true = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %9 = arith.addi %0, %c0_i32_1 : i32
    return
  }
}

