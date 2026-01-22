module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.addi %arg0, %c3_i32 : i32
    %c4_i32 = arith.constant 4 : i32
    %1 = arith.remsi %0, %c4_i32 : i32
    %c3_i32_0 = arith.constant 3 : i32
    %2 = arith.addi %1, %c3_i32_0 : i32
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
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %11 = arith.muli %arg3, %c64_i32 : i32
        %12 = arith.addi %11, %0 : i32
        %c64_i32_5 = arith.constant 64 : i32
        %13 = arith.addi %c64_i32_5, %12 : i32
        %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %14, %c0_i32_6 : i32
        "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c384_i32 = arith.constant 384 : i32
        %11 = arith.addi %c384_i32, %0 : i32
        %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %12, %c0_i32_5 : i32
        %14 = "simt_step.if"(%13) ({
          %23 = simt_step.lane_id
          %24 = arith.index_cast %23 : index to i32
          "simt_step.yield"(%24) : (i32) -> ()
        }, {
          %23 = simt_step.subgroup_id
          %24 = arith.index_cast %23 : index to i32
          "simt_step.yield"(%24) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %15 = arith.addi %c0_i32_6, %0 : i32
        %true_7 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %17 = arith.addi %arg2, %14 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg3, %c1_i32 : i32
        %true_8 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %c64_i32 = arith.constant 64 : i32
        %19 = arith.muli %arg3, %c64_i32 : i32
        %20 = arith.addi %c256_i32, %19 : i32
        %21 = arith.addi %20, %0 : i32
        %true_9 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%10#0) : (i32) -> ()
    }, {
      %c448_i32 = arith.constant 448 : i32
      %10 = arith.addi %c448_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %12 = "simt_step.switch"(%11, %0) ({
      ^bb0(%arg2: i32):
        %c512_i32 = arith.constant 512 : i32
        %13 = arith.addi %c512_i32, %0 : i32
        %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %15 = arith.addi %0, %c3_i32 : i32
        %16 = "simt_step.switch"(%14, %15) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          %true_14 = arith.constant true
          %c512_i32_15 = arith.constant 512 : i32
          %43 = arith.addi %c512_i32_15, %0 : i32
          %true_16 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_13) {fallthrough = true} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) {fallthrough = true} : (i32) -> ()
        ^bb3(%48: i32):  // no predecessors
          %c3_i32_17 = arith.constant 3 : i32
          %49 = arith.addi %0, %c3_i32_17 : i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_3 = arith.constant true
        %c768_i32 = arith.constant 768 : i32
        %17 = arith.addi %c768_i32, %0 : i32
        %true_4 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c576_i32 = arith.constant 576 : i32
        %20 = arith.addi %c576_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_5 : i32
        %23 = "simt_step.if"(%22) ({
          %c3_i32_13 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_13) : (i32) -> ()
        }, {
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          "simt_step.yield"(%43) : (i32) -> ()
        }) : (i1) -> i32
        %c1024_i32 = arith.constant 1024 : i32
        %24 = arith.addi %c1024_i32, %0 : i32
        %true_6 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %c640_i32 = arith.constant 640 : i32
        %27 = arith.addi %c640_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_7 : i32
        %30 = "simt_step.if"(%29) ({
          %c0_i32_13 = arith.constant 0 : i32
          %42 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          %c0_i32_13 = arith.constant 0 : i32
          %42 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        %c1280_i32 = arith.constant 1280 : i32
        %31 = arith.addi %c1280_i32, %0 : i32
        %true_8 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb3(%33: i32):  // no predecessors
        %c704_i32 = arith.constant 704 : i32
        %34 = arith.addi %c704_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_9 : i32
        %37 = "simt_step.if"(%36) ({
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          "simt_step.yield"(%43) : (i32) -> ()
        }, {
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          "simt_step.yield"(%43) : (i32) -> ()
        }) : (i1) -> i32
        %c1536_i32 = arith.constant 1536 : i32
        %38 = arith.addi %c1536_i32, %0 : i32
        %true_10 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c1792_i32 = arith.constant 1792 : i32
        %40 = arith.addi %c1792_i32, %0 : i32
        %true_12 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) : (i32) -> ()
    }) : (i1) -> i32
    %c2048_i32 = arith.constant 2048 : i32
    %7 = arith.addi %c2048_i32, %0 : i32
    %true = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %9:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32 = arith.constant 64 : i32
      %10 = arith.muli %arg3, %c64_i32 : i32
      %11 = arith.addi %10, %0 : i32
      %c768_i32 = arith.constant 768 : i32
      %12 = arith.addi %c768_i32, %11 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_3 : i32
      "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %10 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg3, %c1_i32 : i32
      %true_3 = arith.constant true
      %c2304_i32 = arith.constant 2304 : i32
      %c64_i32 = arith.constant 64 : i32
      %12 = arith.muli %arg3, %c64_i32 : i32
      %13 = arith.addi %c2304_i32, %12 : i32
      %14 = arith.addi %13, %0 : i32
      %true_4 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

