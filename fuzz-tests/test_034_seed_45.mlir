module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.addi %arg0, %c4_i32 : i32
    %c4_i32_0 = arith.constant 4 : i32
    %1 = arith.remsi %0, %c4_i32_0 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %4, %c0_i32_0 : i32
    %6 = "simt_step.if"(%5) ({
      %17 = simt_step.subgroup_id
      %18 = arith.index_cast %17 : index to i32
      "simt_step.yield"(%18) : (i32) -> ()
    }, {
      %c64_i32 = arith.constant 64 : i32
      %17 = arith.addi %c64_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = simt_step.subgroup_id
      %20 = arith.index_cast %19 : index to i32
      %21 = "simt_step.switch"(%18, %20) ({
      ^bb0(%arg2: i32):
        %c1_i32 = arith.constant 1 : i32
        %true_3 = arith.constant true
        %c0_i32_4 = arith.constant 0 : i32
        %22 = arith.addi %c0_i32_4, %0 : i32
        %true_5 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c64_i32_11 = arith.constant 64 : i32
          %29 = arith.muli %arg4, %c64_i32_11 : i32
          %30 = arith.addi %29, %0 : i32
          %c128_i32_12 = arith.constant 128 : i32
          %31 = arith.addi %c128_i32_12, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_13 : i32
          "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %29 = arith.addi %arg3, %arg4 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %30 = arith.addi %arg4, %c1_i32_11 : i32
          %true_12 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c64_i32_13 = arith.constant 64 : i32
          %31 = arith.muli %arg4, %c64_i32_13 : i32
          %32 = arith.addi %c256_i32, %31 : i32
          %33 = arith.addi %32, %0 : i32
          %true_14 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %c1_i32_8 = arith.constant 1 : i32
        %true_9 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %27 = arith.addi %c512_i32, %0 : i32
        %true_10 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c1_i32_8) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) : (i32) -> ()
    }) : (i1) -> i32
    %c768_i32 = arith.constant 768 : i32
    %7 = arith.addi %c768_i32, %0 : i32
    %true = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %9 = simt_step.lane_id
    %10 = arith.index_cast %9 : index to i32
    %c448_i32 = arith.constant 448 : i32
    %11 = arith.addi %c448_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
    %14 = "simt_step.if"(%13) ({
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %18 = arith.muli %arg3, %c64_i32 : i32
        %19 = arith.addi %18, %0 : i32
        %c512_i32 = arith.constant 512 : i32
        %20 = arith.addi %c512_i32, %19 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_5 : i32
        "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %18 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %19 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c1024_i32 = arith.constant 1024 : i32
        %c64_i32 = arith.constant 64 : i32
        %20 = arith.muli %arg3, %c64_i32 : i32
        %21 = arith.addi %c1024_i32, %20 : i32
        %22 = arith.addi %21, %0 : i32
        %true_6 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%18, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%17#0) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %18 = arith.muli %arg3, %c64_i32 : i32
        %19 = arith.addi %18, %0 : i32
        %c832_i32 = arith.constant 832 : i32
        %20 = arith.addi %c832_i32, %19 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_5 : i32
        "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c1152_i32 = arith.constant 1152 : i32
        %18 = arith.addi %c1152_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %20 = simt_step.subgroup_id
        %21 = arith.index_cast %20 : index to i32
        %22 = "simt_step.switch"(%19, %21) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          %29 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          %true_7 = arith.constant true
          %c1280_i32 = arith.constant 1280 : i32
          %31 = arith.addi %c1280_i32, %0 : i32
          %true_8 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %23 = arith.addi %arg2, %22 : i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c1536_i32 = arith.constant 1536 : i32
        %c64_i32 = arith.constant 64 : i32
        %25 = arith.muli %arg3, %c64_i32 : i32
        %26 = arith.addi %c1536_i32, %25 : i32
        %27 = arith.addi %26, %0 : i32
        %true_6 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%17#0) : (i32) -> ()
    }) : (i1) -> i32
    %c1792_i32 = arith.constant 1792 : i32
    %15 = arith.addi %c1792_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

