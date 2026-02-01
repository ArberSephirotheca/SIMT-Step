module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %3 = arith.addi %c0_i32_0, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %2 = arith.remsi %arg3, %c2_i32 : i32
      %c2_i32_0 = arith.constant 2 : i32
      %3 = arith.addi %arg0, %c2_i32_0 : i32
      %4 = "simt_step.switch"(%2, %3) ({
      ^bb0(%arg4: i32):
        %c3_i32 = arith.constant 3 : i32
        %7 = arith.addi %arg0, %c3_i32 : i32
        "simt_step.yield"(%7) {fallthrough = true} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        %c3_i32_1 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_1) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %6 = arith.addi %c256_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%4) : (i32) -> ()
    }) : (i1) -> i32
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
      func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c448_i32 = arith.constant 448 : i32
      %8 = arith.addi %c448_i32, %0 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %9, %c0_i32_5 : i32
      %11 = "simt_step.if"(%10) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c64_i32_11 = arith.constant 64 : i32
          %21 = arith.muli %arg5, %c64_i32_11 : i32
          %22 = arith.addi %21, %0 : i32
          %c512_i32 = arith.constant 512 : i32
          %23 = arith.addi %c512_i32, %22 : i32
          %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %25 = arith.cmpi ne, %24, %c0_i32_12 : i32
          "simt_step.condition"(%25, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %21 = arith.addi %arg4, %arg5 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %22 = arith.addi %arg5, %c1_i32_11 : i32
          %true_12 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %c64_i32_13 = arith.constant 64 : i32
          %23 = arith.muli %arg5, %c64_i32_13 : i32
          %24 = arith.addi %c512_i32, %23 : i32
          %25 = arith.addi %24, %0 : i32
          %true_14 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) : (i32) -> ()
      }, {
        %c832_i32 = arith.constant 832 : i32
        %20 = arith.addi %c832_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_9 : i32
        %23 = "simt_step.if"(%22) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %26 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%26) : (i32) -> ()
        }) : (i1) -> i32
        %c768_i32 = arith.constant 768 : i32
        %24 = arith.addi %c768_i32, %0 : i32
        %true_10 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23) : (i32) -> ()
      }) : (i1) -> i32
      %c1024_i32 = arith.constant 1024 : i32
      %12 = arith.addi %c1024_i32, %0 : i32
      %true = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %14 = arith.addi %arg2, %11 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      %true_6 = arith.constant true
      %c1280_i32 = arith.constant 1280 : i32
      %c64_i32_7 = arith.constant 64 : i32
      %16 = arith.muli %arg3, %c64_i32_7 : i32
      %17 = arith.addi %c1280_i32, %16 : i32
      %18 = arith.addi %17, %0 : i32
      %true_8 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32_5 = arith.constant 64 : i32
      %8 = arith.muli %arg3, %c64_i32_5 : i32
      %9 = arith.addi %8, %0 : i32
      %c896_i32 = arith.constant 896 : i32
      %10 = arith.addi %c896_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_6 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c1216_i32 = arith.constant 1216 : i32
      %8 = arith.addi %c1216_i32, %0 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %9, %c0_i32_5 : i32
      %11 = "simt_step.if"(%10) ({
        %c1280_i32 = arith.constant 1280 : i32
        %20 = arith.addi %c1280_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %22 = simt_step.lane_id
        %23 = arith.index_cast %22 : index to i32
        %24 = "simt_step.switch"(%21, %23) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %c2_i32_11 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb3(%29: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c1536_i32 = arith.constant 1536 : i32
        %25 = arith.addi %c1536_i32, %0 : i32
        %true_10 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) : (i32) -> ()
      }, {
        %c1344_i32 = arith.constant 1344 : i32
        %20 = arith.addi %c1344_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_9 : i32
        %23 = "simt_step.if"(%22) ({
          %c0_i32_11 = arith.constant 0 : i32
          %26 = arith.addi %0, %c0_i32_11 : i32
          "simt_step.yield"(%26) : (i32) -> ()
        }, {
          %26 = simt_step.lane_id
          %27 = arith.index_cast %26 : index to i32
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        %c1792_i32 = arith.constant 1792 : i32
        %24 = arith.addi %c1792_i32, %0 : i32
        %true_10 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23) : (i32) -> ()
      }) : (i1) -> i32
      %c2048_i32 = arith.constant 2048 : i32
      %12 = arith.addi %c2048_i32, %0 : i32
      %true = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %14 = arith.addi %arg2, %11 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      %true_6 = arith.constant true
      %c2304_i32 = arith.constant 2304 : i32
      %c64_i32_7 = arith.constant 64 : i32
      %16 = arith.muli %arg3, %c64_i32_7 : i32
      %17 = arith.addi %c2304_i32, %16 : i32
      %18 = arith.addi %17, %0 : i32
      %true_8 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

