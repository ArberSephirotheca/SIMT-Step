module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.addi %arg0, %c3_i32 : i32
    %c5_i32 = arith.constant 5 : i32
    %1 = arith.remsi %0, %c5_i32 : i32
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
    %c2_i32 = arith.constant 2 : i32
    %5 = arith.addi %0, %c2_i32 : i32
    %6 = "simt_step.switch"(%4, %5) ({
    ^bb0(%arg2: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %7:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32 = arith.constant 64 : i32
        %25 = arith.muli %arg4, %c64_i32 : i32
        %26 = arith.addi %25, %0 : i32
        %c64_i32_13 = arith.constant 64 : i32
        %27 = arith.addi %c64_i32_13, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_14 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c64_i32_17 = arith.constant 64 : i32
          %32 = arith.muli %arg6, %c64_i32_17 : i32
          %33 = arith.addi %32, %0 : i32
          %c384_i32 = arith.constant 384 : i32
          %34 = arith.addi %c384_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_18 : i32
          "simt_step.condition"(%36, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %32 = arith.addi %arg5, %arg6 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %33 = arith.addi %arg6, %c1_i32_17 : i32
          %true_18 = arith.constant true
          %c0_i32_19 = arith.constant 0 : i32
          %c64_i32_20 = arith.constant 64 : i32
          %34 = arith.muli %arg6, %c64_i32_20 : i32
          %35 = arith.addi %c0_i32_19, %34 : i32
          %36 = arith.addi %35, %0 : i32
          %true_21 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %26 = arith.addi %arg3, %25#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %27 = arith.addi %arg4, %c1_i32 : i32
        %true_15 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %c64_i32 = arith.constant 64 : i32
        %28 = arith.muli %arg4, %c64_i32 : i32
        %29 = arith.addi %c256_i32, %28 : i32
        %30 = arith.addi %29, %0 : i32
        %true_16 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%7#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32 = arith.constant 64 : i32
        %25 = arith.muli %arg4, %c64_i32 : i32
        %26 = arith.addi %25, %0 : i32
        %c704_i32 = arith.constant 704 : i32
        %27 = arith.addi %c704_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_13 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %25 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg4, %c1_i32 : i32
        %true_13 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %c64_i32 = arith.constant 64 : i32
        %27 = arith.muli %arg4, %c64_i32 : i32
        %28 = arith.addi %c512_i32, %27 : i32
        %29 = arith.addi %28, %0 : i32
        %true_14 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true = arith.constant true
      %c768_i32 = arith.constant 768 : i32
      %10 = arith.addi %c768_i32, %0 : i32
      %true_4 = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32 = arith.constant 64 : i32
        %25 = arith.muli %arg4, %c64_i32 : i32
        %26 = arith.addi %25, %0 : i32
        %c1024_i32 = arith.constant 1024 : i32
        %27 = arith.addi %c1024_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_13 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %25 = simt_step.lane_id
        %26 = arith.index_cast %25 : index to i32
        %27 = arith.addi %arg3, %26 : i32
        %c1_i32 = arith.constant 1 : i32
        %28 = arith.addi %arg4, %c1_i32 : i32
        %true_13 = arith.constant true
        %c1024_i32 = arith.constant 1024 : i32
        %c64_i32 = arith.constant 64 : i32
        %29 = arith.muli %arg4, %c64_i32 : i32
        %30 = arith.addi %c1024_i32, %29 : i32
        %31 = arith.addi %30, %0 : i32
        %true_14 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      %c1280_i32 = arith.constant 1280 : i32
      %14 = arith.addi %c1280_i32, %0 : i32
      %true_8 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%16: i32):  // no predecessors
      %c1344_i32 = arith.constant 1344 : i32
      %17 = arith.addi %c1344_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_9 : i32
      %20 = "simt_step.if"(%19) ({
        %c1408_i32 = arith.constant 1408 : i32
        %25 = arith.addi %c1408_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_13 : i32
        %28 = "simt_step.if"(%27) ({
          %31 = simt_step.lane_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c1536_i32 = arith.constant 1536 : i32
        %29 = arith.addi %c1536_i32, %0 : i32
        %true_14 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) : (i32) -> ()
      }, {
        %c1472_i32 = arith.constant 1472 : i32
        %25 = arith.addi %c1472_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_13 : i32
        %28 = "simt_step.if"(%27) ({
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) : (i32) -> ()
        }, {
          %31 = simt_step.lane_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        %c1792_i32 = arith.constant 1792 : i32
        %29 = arith.addi %c1792_i32, %0 : i32
        %true_14 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) : (i32) -> ()
      }) : (i1) -> i32
      %c2048_i32 = arith.constant 2048 : i32
      %21 = arith.addi %c2048_i32, %0 : i32
      %true_10 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_11 = arith.constant true
      %c2304_i32 = arith.constant 2304 : i32
      %23 = arith.addi %c2304_i32, %0 : i32
      %true_12 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

