module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.addi %arg0, %c2_i32 : i32
    %c5_i32 = arith.constant 5 : i32
    %1 = arith.remsi %0, %c5_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %2 = arith.addi %1, %c1_i32 : i32
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
    %5 = "simt_step.switch"(%4, %0) ({
    ^bb0(%arg2: i32):
      %c64_i32 = arith.constant 64 : i32
      %7 = arith.addi %c64_i32, %0 : i32
      %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %9 = arith.cmpi ne, %8, %c0_i32_2 : i32
      %10 = "simt_step.if"(%9) ({
        %c128_i32_5 = arith.constant 128 : i32
        %19 = arith.addi %c128_i32_5, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_6 : i32
        %22 = "simt_step.if"(%21) ({
          %25 = simt_step.lane_id
          %26 = arith.index_cast %25 : index to i32
          "simt_step.yield"(%26) : (i32) -> ()
        }, {
          %25 = simt_step.lane_id
          %26 = arith.index_cast %25 : index to i32
          "simt_step.yield"(%26) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %23 = arith.addi %c0_i32_7, %0 : i32
        %true_8 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) : (i32) -> ()
      }, {
        %c192_i32 = arith.constant 192 : i32
        %19 = arith.addi %c192_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %21 = simt_step.lane_id
        %22 = arith.index_cast %21 : index to i32
        %23 = "simt_step.switch"(%20, %22) ({
        ^bb0(%arg3: i32):
          %24 = simt_step.subgroup_id
          %25 = arith.index_cast %24 : index to i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %27 = simt_step.lane_id
          %28 = arith.index_cast %27 : index to i32
          %true_5 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %29 = arith.addi %c256_i32, %0 : i32
          %true_6 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) : (i32) -> ()
      }) : (i1) -> i32
      %c512_i32 = arith.constant 512 : i32
      %11 = arith.addi %c512_i32, %0 : i32
      %true = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
    ^bb2(%14: i32):  // no predecessors
      %15 = simt_step.subgroup_id
      %16 = arith.index_cast %15 : index to i32
      %true_3 = arith.constant true
      %c768_i32 = arith.constant 768 : i32
      %17 = arith.addi %c768_i32, %0 : i32
      %true_4 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32 = arith.constant 64 : i32
      %7 = arith.muli %arg3, %c64_i32 : i32
      %8 = arith.addi %7, %0 : i32
      %c256_i32 = arith.constant 256 : i32
      %9 = arith.addi %c256_i32, %8 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_2 : i32
      "simt_step.condition"(%11, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %7 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c1024_i32 = arith.constant 1024 : i32
      %c64_i32 = arith.constant 64 : i32
      %9 = arith.muli %arg3, %c64_i32 : i32
      %10 = arith.addi %c1024_i32, %9 : i32
      %11 = arith.addi %10, %0 : i32
      %true_2 = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%7, %8) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

