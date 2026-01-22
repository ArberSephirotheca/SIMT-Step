module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.addi %arg0, %c2_i32 : i32
    %c5_i32 = arith.constant 5 : i32
    %1 = arith.remsi %0, %c5_i32 : i32
    %c2_i32_0 = arith.constant 2 : i32
    %2 = arith.addi %1, %c2_i32_0 : i32
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
      %11 = arith.muli %arg3, %c64_i32 : i32
      %12 = arith.addi %11, %0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %13 = arith.addi %c0_i32_4, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_5 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %11 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32 : i32
      %true_4 = arith.constant true
      %c0_i32_5 = arith.constant 0 : i32
      %c64_i32 = arith.constant 64 : i32
      %13 = arith.muli %arg3, %c64_i32 : i32
      %14 = arith.addi %c0_i32_5, %13 : i32
      %15 = arith.addi %14, %0 : i32
      %true_6 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32 = arith.constant 64 : i32
      %11 = arith.muli %arg3, %c64_i32 : i32
      %12 = arith.addi %11, %0 : i32
      %c320_i32 = arith.constant 320 : i32
      %13 = arith.addi %c320_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_4 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %11 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32 : i32
      %true_4 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %c64_i32 = arith.constant 64 : i32
      %13 = arith.muli %arg3, %c64_i32 : i32
      %14 = arith.addi %c256_i32, %13 : i32
      %15 = arith.addi %14, %0 : i32
      %true_5 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c640_i32 = arith.constant 640 : i32
    %5 = arith.addi %c640_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_3 : i32
    %8 = "simt_step.if"(%7) ({
      %c704_i32 = arith.constant 704 : i32
      %11 = arith.addi %c704_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %13 = simt_step.subgroup_id
      %14 = arith.index_cast %13 : index to i32
      %15 = "simt_step.switch"(%12, %14) ({
      ^bb0(%arg2: i32):
        %c768_i32 = arith.constant 768 : i32
        %16 = arith.addi %c768_i32, %0 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %17, %c0_i32_4 : i32
        %19 = "simt_step.if"(%18) ({
          %26 = simt_step.subgroup_id
          %27 = arith.index_cast %26 : index to i32
          "simt_step.yield"(%27) : (i32) -> ()
        }, {
          %26 = simt_step.subgroup_id
          %27 = arith.index_cast %26 : index to i32
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        %c512_i32 = arith.constant 512 : i32
        %20 = arith.addi %c512_i32, %0 : i32
        %true_5 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c64_i32 = arith.constant 64 : i32
          %26 = arith.muli %arg4, %c64_i32 : i32
          %27 = arith.addi %26, %0 : i32
          %c832_i32 = arith.constant 832 : i32
          %28 = arith.addi %c832_i32, %27 : i32
          %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %30 = arith.cmpi ne, %29, %c0_i32_10 : i32
          "simt_step.condition"(%30, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %26 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg4, %c1_i32 : i32
          %true_10 = arith.constant true
          %c768_i32_11 = arith.constant 768 : i32
          %c64_i32 = arith.constant 64 : i32
          %28 = arith.muli %arg4, %c64_i32 : i32
          %29 = arith.addi %c768_i32_11, %28 : i32
          %30 = arith.addi %29, %0 : i32
          %true_12 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        %c1024_i32 = arith.constant 1024 : i32
        %24 = arith.addi %c1024_i32, %0 : i32
        %true_9 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%15) : (i32) -> ()
    }, {
      %11 = simt_step.lane_id
      %12 = arith.index_cast %11 : index to i32
      "simt_step.yield"(%12) : (i32) -> ()
    }) : (i1) -> i32
    %c1280_i32 = arith.constant 1280 : i32
    %9 = arith.addi %c1280_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

