module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.addi %arg0, %c3_i32 : i32
    %c3_i32_0 = arith.constant 3 : i32
    %1 = arith.remsi %0, %c3_i32_0 : i32
    %c4_i32 = arith.constant 4 : i32
    %2 = arith.addi %1, %c4_i32 : i32
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
      %c64_i32 = arith.constant 64 : i32
      %9 = arith.addi %c64_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %11 = "simt_step.switch"(%10, %c2_i32) ({
      ^bb0(%arg2: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c64_i32_7 = arith.constant 64 : i32
          %28 = arith.muli %arg4, %c64_i32_7 : i32
          %29 = arith.addi %28, %0 : i32
          %c128_i32_8 = arith.constant 128 : i32
          %30 = arith.addi %c128_i32_8, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_9 : i32
          "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %28 = arith.addi %arg3, %arg4 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %29 = arith.addi %arg4, %c1_i32_7 : i32
          %true_8 = arith.constant true
          %c0_i32_9 = arith.constant 0 : i32
          %c64_i32_10 = arith.constant 64 : i32
          %30 = arith.muli %arg4, %c64_i32_10 : i32
          %31 = arith.addi %c0_i32_9, %30 : i32
          %32 = arith.addi %31, %0 : i32
          %true_11 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_3 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %13 = arith.addi %c256_i32, %0 : i32
        %true_4 = arith.constant true
        %14 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c448_i32 = arith.constant 448 : i32
        %16 = arith.addi %c448_i32, %0 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %18 = simt_step.lane_id
        %19 = arith.index_cast %18 : index to i32
        %20 = "simt_step.switch"(%17, %19) ({
        ^bb0(%arg3: i32):
          %c2_i32_7 = arith.constant 2 : i32
          %28 = arith.addi %0, %c2_i32_7 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %30 = simt_step.subgroup_id
          %31 = arith.index_cast %30 : index to i32
          %true_8 = arith.constant true
          %c512_i32_9 = arith.constant 512 : i32
          %32 = arith.addi %c512_i32_9, %0 : i32
          %true_10 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %35 = simt_step.lane_id
          %36 = arith.index_cast %35 : index to i32
          %true_11 = arith.constant true
          %c768_i32 = arith.constant 768 : i32
          %37 = arith.addi %c768_i32, %0 : i32
          %true_12 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
        ^bb3(%39: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c512_i32 = arith.constant 512 : i32
        %22 = arith.addi %c512_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %0, %c1_i32 : i32
        %25 = "simt_step.switch"(%23, %24) ({
        ^bb0(%arg3: i32):
          %true_7 = arith.constant true
          %c1024_i32 = arith.constant 1024 : i32
          %28 = arith.addi %c1024_i32, %0 : i32
          %true_8 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          %c2_i32_9 = arith.constant 2 : i32
          %31 = arith.addi %0, %c2_i32_9 : i32
          %true_10 = arith.constant true
          %c1280_i32 = arith.constant 1280 : i32
          %32 = arith.addi %c1280_i32, %0 : i32
          %true_11 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb3(%26: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c64_i32_7 = arith.constant 64 : i32
          %28 = arith.muli %arg4, %c64_i32_7 : i32
          %29 = arith.addi %28, %0 : i32
          %c576_i32 = arith.constant 576 : i32
          %30 = arith.addi %c576_i32, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_8 : i32
          "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %28 = arith.addi %arg3, %arg4 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %29 = arith.addi %arg4, %c1_i32_7 : i32
          %true_8 = arith.constant true
          %c1536_i32 = arith.constant 1536 : i32
          %c64_i32_9 = arith.constant 64 : i32
          %30 = arith.muli %arg4, %c64_i32_9 : i32
          %31 = arith.addi %c1536_i32, %30 : i32
          %32 = arith.addi %31, %0 : i32
          %true_10 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%11) : (i32) -> ()
    }, {
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.addi %0, %c4_i32 : i32
      "simt_step.yield"(%9) : (i32) -> ()
    }) : (i1) -> i32
    %c1792_i32 = arith.constant 1792 : i32
    %7 = arith.addi %c1792_i32, %0 : i32
    %true = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

