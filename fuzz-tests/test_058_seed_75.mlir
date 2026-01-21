module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.addi %arg0, %c4_i32 : i32
    %c4_i32_0 = arith.constant 4 : i32
    %1 = arith.remsi %0, %c4_i32_0 : i32
    %c4_i32_1 = arith.constant 4 : i32
    %2 = arith.addi %1, %c4_i32_1 : i32
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
    %5 = simt_step.lane_id
    %6 = arith.index_cast %5 : index to i32
    %7 = "simt_step.switch"(%4, %6) ({
    ^bb0(%arg2: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32 = arith.constant 64 : i32
        %26 = arith.muli %arg4, %c64_i32 : i32
        %27 = arith.addi %26, %0 : i32
        %c64_i32_12 = arith.constant 64 : i32
        %28 = arith.addi %c64_i32_12, %27 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_13 : i32
        "simt_step.condition"(%30, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c64_i32_16 = arith.constant 64 : i32
          %33 = arith.muli %arg6, %c64_i32_16 : i32
          %34 = arith.addi %33, %0 : i32
          %c384_i32 = arith.constant 384 : i32
          %35 = arith.addi %c384_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_17 : i32
          "simt_step.condition"(%37, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %33 = arith.addi %arg5, %arg6 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %34 = arith.addi %arg6, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c0_i32_18 = arith.constant 0 : i32
          %c64_i32_19 = arith.constant 64 : i32
          %35 = arith.muli %arg6, %c64_i32_19 : i32
          %36 = arith.addi %c0_i32_18, %35 : i32
          %37 = arith.addi %36, %0 : i32
          %true_20 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %27 = arith.addi %arg3, %26#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %28 = arith.addi %arg4, %c1_i32 : i32
        %true_14 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %c64_i32 = arith.constant 64 : i32
        %29 = arith.muli %arg4, %c64_i32 : i32
        %30 = arith.addi %c256_i32, %29 : i32
        %31 = arith.addi %30, %0 : i32
        %true_15 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%9: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.addi %0, %c4_i32 : i32
      %true = arith.constant true
      %c512_i32 = arith.constant 512 : i32
      %11 = arith.addi %c512_i32, %0 : i32
      %true_2 = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb2(%13: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32 = arith.constant 64 : i32
        %26 = arith.muli %arg4, %c64_i32 : i32
        %27 = arith.addi %26, %0 : i32
        %c704_i32 = arith.constant 704 : i32
        %28 = arith.addi %c704_i32, %27 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_12 : i32
        "simt_step.condition"(%30, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %0, %c1_i32 : i32
        %27 = arith.addi %arg3, %26 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %28 = arith.addi %arg4, %c1_i32_12 : i32
        %true_13 = arith.constant true
        %c768_i32 = arith.constant 768 : i32
        %c64_i32 = arith.constant 64 : i32
        %29 = arith.muli %arg4, %c64_i32 : i32
        %30 = arith.addi %c768_i32, %29 : i32
        %31 = arith.addi %30, %0 : i32
        %true_14 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      %c1024_i32 = arith.constant 1024 : i32
      %15 = arith.addi %c1024_i32, %0 : i32
      %true_6 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%17: i32):  // no predecessors
      %c1024_i32_7 = arith.constant 1024 : i32
      %18 = arith.addi %c1024_i32_7, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_8 : i32
      %21 = "simt_step.if"(%20) ({
        %26 = simt_step.subgroup_id
        %27 = arith.index_cast %26 : index to i32
        "simt_step.yield"(%27) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c1280_i32 = arith.constant 1280 : i32
      %22 = arith.addi %c1280_i32, %0 : i32
      %true_9 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_10 = arith.constant true
      %c1536_i32 = arith.constant 1536 : i32
      %24 = arith.addi %c1536_i32, %0 : i32
      %true_11 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

