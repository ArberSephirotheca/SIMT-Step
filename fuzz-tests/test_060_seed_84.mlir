module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.addi %arg0, %c3_i32 : i32
    %c4_i32 = arith.constant 4 : i32
    %1 = arith.remsi %0, %c4_i32 : i32
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
    %3 = simt_step.lane_id
    %4 = arith.index_cast %3 : index to i32
    %5 = simt_step.lane_id
    %6 = arith.index_cast %5 : index to i32
    %c0_i32 = arith.constant 0 : i32
    %7 = arith.addi %c0_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %9 = simt_step.lane_id
    %10 = arith.index_cast %9 : index to i32
    %11 = "simt_step.switch"(%8, %10) ({
    ^bb0(%arg2: i32):
      %12 = simt_step.lane_id
      %13 = arith.index_cast %12 : index to i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %15 = arith.addi %c64_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_0 : i32
      %18 = "simt_step.if"(%17) ({
        %c128_i32_5 = arith.constant 128 : i32
        %31 = arith.addi %c128_i32_5, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_6 : i32
        %34 = "simt_step.if"(%33) ({
          %37 = simt_step.subgroup_id
          %38 = arith.index_cast %37 : index to i32
          "simt_step.yield"(%38) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %35 = arith.addi %c0_i32_7, %0 : i32
        %true_8 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        %c192_i32 = arith.constant 192 : i32
        %31 = arith.addi %c192_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_5 : i32
        %34 = "simt_step.if"(%33) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32_6 = arith.constant 256 : i32
        %35 = arith.addi %c256_i32_6, %0 : i32
        %true_7 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) : (i32) -> ()
      }) : (i1) -> i32
      %c512_i32 = arith.constant 512 : i32
      %19 = arith.addi %c512_i32, %0 : i32
      %true = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_1 = arith.constant true
      %c768_i32 = arith.constant 768 : i32
      %21 = arith.addi %c768_i32, %0 : i32
      %true_2 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %c256_i32 = arith.constant 256 : i32
      %24 = arith.addi %c256_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = simt_step.lane_id
      %27 = arith.index_cast %26 : index to i32
      %28 = "simt_step.switch"(%25, %27) ({
      ^bb0(%arg3: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c64_i32_13 = arith.constant 64 : i32
          %39 = arith.muli %arg5, %c64_i32_13 : i32
          %40 = arith.addi %39, %0 : i32
          %c320_i32 = arith.constant 320 : i32
          %41 = arith.addi %c320_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_14 : i32
          "simt_step.condition"(%43, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %39 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %arg5, %c1_i32 : i32
          %true_13 = arith.constant true
          %c1024_i32 = arith.constant 1024 : i32
          %c64_i32_14 = arith.constant 64 : i32
          %41 = arith.muli %arg5, %c64_i32_14 : i32
          %42 = arith.addi %c1024_i32, %41 : i32
          %43 = arith.addi %42, %0 : i32
          %true_15 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %33:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c64_i32_13 = arith.constant 64 : i32
          %39 = arith.muli %arg5, %c64_i32_13 : i32
          %40 = arith.addi %39, %0 : i32
          %c640_i32 = arith.constant 640 : i32
          %41 = arith.addi %c640_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_14 : i32
          "simt_step.condition"(%43, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %39 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %arg5, %c1_i32 : i32
          %true_13 = arith.constant true
          %c1280_i32 = arith.constant 1280 : i32
          %c64_i32_14 = arith.constant 64 : i32
          %41 = arith.muli %arg5, %c64_i32_14 : i32
          %42 = arith.addi %c1280_i32, %41 : i32
          %43 = arith.addi %42, %0 : i32
          %true_15 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        %c1536_i32 = arith.constant 1536 : i32
        %34 = arith.addi %c1536_i32, %0 : i32
        %true_10 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %true_11 = arith.constant true
        %c1792_i32 = arith.constant 1792 : i32
        %37 = arith.addi %c1792_i32, %0 : i32
        %true_12 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c2048_i32 = arith.constant 2048 : i32
      %29 = arith.addi %c2048_i32, %0 : i32
      %true_4 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

