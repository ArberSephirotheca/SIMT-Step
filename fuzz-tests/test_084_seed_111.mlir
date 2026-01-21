module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.addi %arg0, %c3_i32 : i32
    %c5_i32 = arith.constant 5 : i32
    %1 = arith.remsi %0, %c5_i32 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %3:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32 = arith.constant 64 : i32
      %9 = arith.muli %arg3, %c64_i32 : i32
      %10 = arith.addi %9, %0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %11 = arith.addi %c0_i32_1, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_2 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %9 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c0_i32_1 = arith.constant 0 : i32
      %c64_i32 = arith.constant 64 : i32
      %11 = arith.muli %arg3, %c64_i32 : i32
      %12 = arith.addi %c0_i32_1, %11 : i32
      %13 = arith.addi %12, %0 : i32
      %true_2 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %4 = simt_step.subgroup_id
    %5 = arith.index_cast %4 : index to i32
    %c320_i32 = arith.constant 320 : i32
    %6 = arith.addi %c320_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %c384_i32 = arith.constant 384 : i32
      %9 = arith.addi %c384_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32 = arith.constant 4 : i32
      %11 = "simt_step.switch"(%10, %c4_i32) ({
      ^bb0(%arg3: i32):
        %c448_i32 = arith.constant 448 : i32
        %20 = arith.addi %c448_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_2 : i32
        %23 = "simt_step.if"(%22) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %33 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%33) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %24 = arith.addi %c256_i32, %0 : i32
        %true_3 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_4 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %26 = arith.addi %c512_i32, %0 : i32
        %true_5 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %29 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        %31 = simt_step.subgroup_id
        %32 = arith.index_cast %31 : index to i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %13 = simt_step.lane_id
      %14 = arith.index_cast %13 : index to i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %16 = simt_step.subgroup_id
      %17 = arith.index_cast %16 : index to i32
      %true = arith.constant true
      %c768_i32 = arith.constant 768 : i32
      %18 = arith.addi %c768_i32, %0 : i32
      %true_1 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

