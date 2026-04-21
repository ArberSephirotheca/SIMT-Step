module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.addi %arg0, %c4_i32 : i32
    %c4_i32_0 = arith.constant 4 : i32
    %1 = arith.remsi %0, %c4_i32_0 : i32
    %c2_i32 = arith.constant 2 : i32
    %2 = arith.addi %1, %c2_i32 : i32
    return %2 : i32
  }
  func.func @main(%arg0: !simt_step.resource<Global, i32>, %arg1: !simt_step.resource<Global, i32>) attributes {simt.num_threads = [64, 1, 1], simt.subgroup_width = 32 : i64} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %1 = call @helper0(%0) : (i32) -> i32
    %c128_i32 = arith.constant 128 : i32
    %2 = arith.addi %c128_i32, %0 : i32
    "simt_step.buffer.store"(%arg0, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c2_i32 = arith.constant 2 : i32
    %3 = arith.addi %0, %c2_i32 : i32
    %c0_i32 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32, %0 : i32
    %5 = "simt_step.buffer.load"(%arg1, %4) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %5, %c0_i32_0 : i32
    %7 = "simt_step.if"(%6) ({
      %c64_i32 = arith.constant 64 : i32
      %10 = arith.addi %c64_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_1 : i32
      %13 = "simt_step.if"(%12) ({
        %c128_i32_3 = arith.constant 128 : i32
        %16 = arith.addi %c128_i32_3, %0 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %18 = simt_step.lane_id
        %19 = arith.index_cast %18 : index to i32
        %20 = "simt_step.switch"(%17, %19) ({
        ^bb0(%arg2: i32):
          %c3_i32 = arith.constant 3 : i32
          %21 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %true_4 = arith.constant true
          %c0_i32_5 = arith.constant 0 : i32
          %23 = arith.addi %c0_i32_5, %0 : i32
          %true_6 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %26 = simt_step.lane_id
          %27 = arith.index_cast %26 : index to i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%20) : (i32) -> ()
      }, {
        %c192_i32 = arith.constant 192 : i32
        %16 = arith.addi %c192_i32, %0 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %18 = "simt_step.switch"(%17, %0) ({
        ^bb0(%arg2: i32):
          %true_3 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %19 = arith.addi %c256_i32, %0 : i32
          %true_4 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%22: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb3(%24: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) : (i32) -> ()
      }) : (i1) -> i32
      %c512_i32 = arith.constant 512 : i32
      %14 = arith.addi %c512_i32, %0 : i32
      %true_2 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) : (i32) -> ()
    }, {
      %c256_i32 = arith.constant 256 : i32
      %10 = arith.addi %c256_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %12 = simt_step.subgroup_id
      %13 = arith.index_cast %12 : index to i32
      %14 = "simt_step.switch"(%11, %13) ({
      ^bb0(%arg2: i32):
        %c320_i32 = arith.constant 320 : i32
        %15 = arith.addi %c320_i32, %0 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %17 = "simt_step.switch"(%16, %0) ({
        ^bb0(%arg3: i32):
          %28 = simt_step.lane_id
          %29 = arith.index_cast %28 : index to i32
          %true_3 = arith.constant true
          %c768_i32 = arith.constant 768 : i32
          %30 = arith.addi %c768_i32, %0 : i32
          %true_4 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%34: i32):  // no predecessors
          %35 = simt_step.subgroup_id
          %36 = arith.index_cast %35 : index to i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_1 = arith.constant true
        %c1024_i32 = arith.constant 1024 : i32
        %18 = arith.addi %c1024_i32, %0 : i32
        %true_2 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c384_i32 = arith.constant 384 : i32
        %22 = arith.addi %c384_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %24 = simt_step.subgroup_id
        %25 = arith.index_cast %24 : index to i32
        %26 = "simt_step.switch"(%23, %25) ({
        ^bb0(%arg3: i32):
          %28 = simt_step.lane_id
          %29 = arith.index_cast %28 : index to i32
          %true_3 = arith.constant true
          %c1280_i32 = arith.constant 1280 : i32
          %30 = arith.addi %c1280_i32, %0 : i32
          %true_4 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %34 = simt_step.lane_id
          %35 = arith.index_cast %34 : index to i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      ^bb3(%27: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%14) : (i32) -> ()
    }) : (i1) -> i32
    %c1536_i32 = arith.constant 1536 : i32
    %8 = arith.addi %c1536_i32, %0 : i32
    %true = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

