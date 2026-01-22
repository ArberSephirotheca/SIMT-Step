module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %0 = arith.addi %arg0, %c1_i32 : i32
    %c4_i32 = arith.constant 4 : i32
    %1 = arith.remsi %0, %c4_i32 : i32
    %c1_i32_0 = arith.constant 1 : i32
    %2 = arith.addi %1, %c1_i32_0 : i32
    return %2 : i32
  }
  func.func @main(%arg0: !simt_step.resource<Global, i32>, %arg1: !simt_step.resource<Global, i32>) attributes {simt.num_threads = [64, 1, 1], simt.subgroup_width = 32 : i64} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %1 = call @helper0(%0) : (i32) -> i32
    %c128_i32 = arith.constant 128 : i32
    %2 = arith.addi %c128_i32, %0 : i32
    "simt_step.buffer.store"(%arg0, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %3:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32 = arith.constant 64 : i32
      %8 = arith.muli %arg3, %c64_i32 : i32
      %9 = arith.addi %8, %0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %10 = arith.addi %c0_i32_1, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_2 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %8 = arith.addi %arg2, %arg3 : i32
      %c1_i32_1 = arith.constant 1 : i32
      %9 = arith.addi %arg3, %c1_i32_1 : i32
      %true = arith.constant true
      %c0_i32_2 = arith.constant 0 : i32
      %c64_i32 = arith.constant 64 : i32
      %10 = arith.muli %arg3, %c64_i32 : i32
      %11 = arith.addi %c0_i32_2, %10 : i32
      %12 = arith.addi %11, %0 : i32
      %true_3 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c320_i32 = arith.constant 320 : i32
    %4 = arith.addi %c320_i32, %0 : i32
    %5 = "simt_step.buffer.load"(%arg1, %4) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %6 = arith.addi %0, %c1_i32 : i32
    %7 = "simt_step.switch"(%5, %6) ({
    ^bb0(%arg2: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32 = arith.constant 64 : i32
        %19 = arith.muli %arg4, %c64_i32 : i32
        %20 = arith.addi %19, %0 : i32
        %c384_i32 = arith.constant 384 : i32
        %21 = arith.addi %c384_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_6 : i32
        "simt_step.condition"(%23, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %19 = arith.addi %arg3, %arg4 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %20 = arith.addi %arg4, %c1_i32_6 : i32
        %true_7 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %c64_i32 = arith.constant 64 : i32
        %21 = arith.muli %arg4, %c64_i32 : i32
        %22 = arith.addi %c256_i32, %21 : i32
        %23 = arith.addi %22, %0 : i32
        %true_8 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%9: i32):  // no predecessors
      %c704_i32 = arith.constant 704 : i32
      %10 = arith.addi %c704_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %12 = simt_step.subgroup_id
      %13 = arith.index_cast %12 : index to i32
      %14 = "simt_step.switch"(%11, %13) ({
      ^bb0(%arg3: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c64_i32 = arith.constant 64 : i32
          %24 = arith.muli %arg5, %c64_i32 : i32
          %25 = arith.addi %24, %0 : i32
          %c768_i32 = arith.constant 768 : i32
          %26 = arith.addi %c768_i32, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_12 : i32
          "simt_step.condition"(%28, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %24 = arith.addi %arg4, %arg5 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %25 = arith.addi %arg5, %c1_i32_12 : i32
          %true_13 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %c64_i32 = arith.constant 64 : i32
          %26 = arith.muli %arg5, %c64_i32 : i32
          %27 = arith.addi %c512_i32, %26 : i32
          %28 = arith.addi %27, %0 : i32
          %true_14 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c64_i32 = arith.constant 64 : i32
          %24 = arith.muli %arg5, %c64_i32 : i32
          %25 = arith.addi %24, %0 : i32
          %c1088_i32 = arith.constant 1088 : i32
          %26 = arith.addi %c1088_i32, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_12 : i32
          "simt_step.condition"(%28, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %24 = arith.addi %arg4, %arg5 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %25 = arith.addi %arg5, %c1_i32_12 : i32
          %true_13 = arith.constant true
          %c768_i32 = arith.constant 768 : i32
          %c64_i32 = arith.constant 64 : i32
          %26 = arith.muli %arg5, %c64_i32 : i32
          %27 = arith.addi %c768_i32, %26 : i32
          %28 = arith.addi %27, %0 : i32
          %true_14 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        %c1024_i32 = arith.constant 1024 : i32
        %22 = arith.addi %c1024_i32, %0 : i32
        %true_11 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c1280_i32 = arith.constant 1280 : i32
      %15 = arith.addi %c1280_i32, %0 : i32
      %true_3 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
    ^bb2(%17: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32 = arith.constant 64 : i32
        %19 = arith.muli %arg4, %c64_i32 : i32
        %20 = arith.addi %19, %0 : i32
        %c1408_i32 = arith.constant 1408 : i32
        %21 = arith.addi %c1408_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_6 : i32
        "simt_step.condition"(%23, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c1728_i32 = arith.constant 1728 : i32
        %19 = arith.addi %c1728_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %21 = "simt_step.switch"(%20, %0) ({
        ^bb0(%arg5: i32):
          %c1_i32_9 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_9) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %c0_i32_10 = arith.constant 0 : i32
          %29 = arith.addi %0, %c0_i32_10 : i32
          %true_11 = arith.constant true
          %c1536_i32 = arith.constant 1536 : i32
          %30 = arith.addi %c1536_i32, %0 : i32
          %true_12 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %22 = arith.addi %arg3, %21 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %23 = arith.addi %arg4, %c1_i32_6 : i32
        %true_7 = arith.constant true
        %c1792_i32 = arith.constant 1792 : i32
        %c64_i32 = arith.constant 64 : i32
        %24 = arith.muli %arg4, %c64_i32 : i32
        %25 = arith.addi %c1792_i32, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_8 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

