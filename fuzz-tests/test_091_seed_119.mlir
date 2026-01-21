module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.addi %arg0, %c4_i32 : i32
    %c4_i32_0 = arith.constant 4 : i32
    %1 = arith.remsi %0, %c4_i32_0 : i32
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.addi %1, %c3_i32 : i32
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
      %11 = "simt_step.switch"(%10, %0) ({
      ^bb0(%arg2: i32):
        %12 = simt_step.lane_id
        %13 = arith.index_cast %12 : index to i32
        %true_1 = arith.constant true
        %c0_i32_2 = arith.constant 0 : i32
        %14 = arith.addi %c0_i32_2, %0 : i32
        %true_3 = arith.constant true
        %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c128_i32_4 = arith.constant 128 : i32
        %17 = arith.addi %c128_i32_4, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_5 : i32
        %20 = "simt_step.if"(%19) ({
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) : (i32) -> ()
        }, {
          %31 = simt_step.subgroup_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %21 = arith.addi %c256_i32, %0 : i32
        %true_6 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %24 = arith.addi %0, %c3_i32 : i32
        %true_7 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %25 = arith.addi %c512_i32, %0 : i32
        %true_8 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb3(%27: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c64_i32_13 = arith.constant 64 : i32
          %31 = arith.muli %arg4, %c64_i32_13 : i32
          %32 = arith.addi %31, %0 : i32
          %c192_i32 = arith.constant 192 : i32
          %33 = arith.addi %c192_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_14 : i32
          "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %31 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg4, %c1_i32 : i32
          %true_13 = arith.constant true
          %c768_i32 = arith.constant 768 : i32
          %c64_i32_14 = arith.constant 64 : i32
          %33 = arith.muli %arg4, %c64_i32_14 : i32
          %34 = arith.addi %c768_i32, %33 : i32
          %35 = arith.addi %34, %0 : i32
          %true_15 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        %c1024_i32 = arith.constant 1024 : i32
        %29 = arith.addi %c1024_i32, %0 : i32
        %true_12 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%11) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %9 = arith.addi %0, %c0_i32_1 : i32
      "simt_step.yield"(%9) : (i32) -> ()
    }) : (i1) -> i32
    %c1280_i32 = arith.constant 1280 : i32
    %7 = arith.addi %c1280_i32, %0 : i32
    %true = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

