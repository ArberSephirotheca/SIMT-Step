module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.addi %arg0, %c3_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = arith.remsi %0, %c2_i32 : i32
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
      %9 = arith.addi %c64_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %0, %c1_i32 : i32
      %12 = "simt_step.switch"(%10, %11) ({
      ^bb0(%arg2: i32):
        %c128_i32_1 = arith.constant 128 : i32
        %13 = arith.addi %c128_i32_1, %0 : i32
        %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %14, %c0_i32_2 : i32
        %16 = "simt_step.if"(%15) ({
          %23 = simt_step.lane_id
          %24 = arith.index_cast %23 : index to i32
          "simt_step.yield"(%24) : (i32) -> ()
        }, {
          %23 = simt_step.lane_id
          %24 = arith.index_cast %23 : index to i32
          "simt_step.yield"(%24) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %17 = arith.addi %c0_i32_3, %0 : i32
        %true_4 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_5 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %19 = arith.addi %c256_i32, %0 : i32
        %true_6 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c4_i32 = arith.constant 4 : i32
        %22 = arith.addi %0, %c4_i32 : i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) : (i32) -> ()
    }, {
      %c192_i32 = arith.constant 192 : i32
      %9 = arith.addi %c192_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %11 = simt_step.lane_id
      %12 = arith.index_cast %11 : index to i32
      %13 = "simt_step.switch"(%10, %12) ({
      ^bb0(%arg2: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c64_i32 = arith.constant 64 : i32
          %33 = arith.muli %arg4, %c64_i32 : i32
          %34 = arith.addi %33, %0 : i32
          %c256_i32 = arith.constant 256 : i32
          %35 = arith.addi %c256_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_11 : i32
          "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %33 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %arg4, %c1_i32 : i32
          %true_11 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %c64_i32 = arith.constant 64 : i32
          %35 = arith.muli %arg4, %c64_i32 : i32
          %36 = arith.addi %c512_i32, %35 : i32
          %37 = arith.addi %36, %0 : i32
          %true_12 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_3 = arith.constant true
        %c768_i32 = arith.constant 768 : i32
        %15 = arith.addi %c768_i32, %0 : i32
        %true_4 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c576_i32 = arith.constant 576 : i32
        %18 = arith.addi %c576_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_5 : i32
        %21 = "simt_step.if"(%20) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_11 = arith.constant 0 : i32
          %33 = arith.addi %0, %c0_i32_11 : i32
          "simt_step.yield"(%33) : (i32) -> ()
        }) : (i1) -> i32
        %c1024_i32 = arith.constant 1024 : i32
        %22 = arith.addi %c1024_i32, %0 : i32
        %true_6 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        %c640_i32 = arith.constant 640 : i32
        %25 = arith.addi %c640_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_7 : i32
        %28 = "simt_step.if"(%27) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c1280_i32 = arith.constant 1280 : i32
        %29 = arith.addi %c1280_i32, %0 : i32
        %true_8 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_9 = arith.constant true
        %c1536_i32 = arith.constant 1536 : i32
        %31 = arith.addi %c1536_i32, %0 : i32
        %true_10 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%13) : (i32) -> ()
    }) : (i1) -> i32
    %c1792_i32 = arith.constant 1792 : i32
    %7 = arith.addi %c1792_i32, %0 : i32
    %true = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c3_i32 = arith.constant 3 : i32
    return
  }
}

