module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.addi %arg0, %c3_i32 : i32
    %c3_i32_0 = arith.constant 3 : i32
    %1 = arith.remsi %0, %c3_i32_0 : i32
    %c0_i32 = arith.constant 0 : i32
    %2 = arith.addi %1, %c0_i32 : i32
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
      %10 = arith.addi %c64_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %12 = simt_step.lane_id
      %13 = arith.index_cast %12 : index to i32
      %14 = "simt_step.switch"(%11, %13) ({
      ^bb0(%arg2: i32):
        %c128_i32_3 = arith.constant 128 : i32
        %15 = arith.addi %c128_i32_3, %0 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %17 = "simt_step.switch"(%16, %0) ({
        ^bb0(%arg3: i32):
          %true_6 = arith.constant true
          %c0_i32_7 = arith.constant 0 : i32
          %23 = arith.addi %c0_i32_7, %0 : i32
          %true_8 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %26 = simt_step.lane_id
          %27 = arith.index_cast %26 : index to i32
          %true_9 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %28 = arith.addi %c256_i32, %0 : i32
          %true_10 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          %31 = simt_step.subgroup_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %18 = arith.addi %c512_i32, %0 : i32
        %true_5 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %21 = simt_step.subgroup_id
        %22 = arith.index_cast %21 : index to i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%14) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %11 = arith.muli %arg3, %c64_i32 : i32
        %12 = arith.addi %11, %0 : i32
        %c192_i32 = arith.constant 192 : i32
        %13 = arith.addi %c192_i32, %12 : i32
        %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %14, %c0_i32_5 : i32
        "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %11 = simt_step.subgroup_id
        %12 = arith.index_cast %11 : index to i32
        %13 = arith.addi %arg2, %12 : i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c768_i32 = arith.constant 768 : i32
        %c64_i32 = arith.constant 64 : i32
        %15 = arith.muli %arg3, %c64_i32 : i32
        %16 = arith.addi %c768_i32, %15 : i32
        %17 = arith.addi %16, %0 : i32
        %true_6 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%10#0) : (i32) -> ()
    }) : (i1) -> i32
    %c1024_i32 = arith.constant 1024 : i32
    %7 = arith.addi %c1024_i32, %0 : i32
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
      %c512_i32 = arith.constant 512 : i32
      %12 = arith.addi %c512_i32, %11 : i32
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
      %c1280_i32 = arith.constant 1280 : i32
      %c64_i32 = arith.constant 64 : i32
      %12 = arith.muli %arg3, %c64_i32 : i32
      %13 = arith.addi %c1280_i32, %12 : i32
      %14 = arith.addi %13, %0 : i32
      %true_4 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%10, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

