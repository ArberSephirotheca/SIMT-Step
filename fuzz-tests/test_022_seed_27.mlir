module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.addi %arg0, %c4_i32 : i32
    %c5_i32 = arith.constant 5 : i32
    %1 = arith.remsi %0, %c5_i32 : i32
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
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %3:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32 = arith.constant 64 : i32
      %11 = arith.muli %arg3, %c64_i32 : i32
      %12 = arith.addi %11, %0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %13 = arith.addi %c0_i32_2, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_3 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c64_i32_7 = arith.constant 64 : i32
        %18 = arith.muli %arg5, %c64_i32_7 : i32
        %19 = arith.addi %18, %0 : i32
        %c320_i32 = arith.constant 320 : i32
        %20 = arith.addi %c320_i32, %19 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_8 : i32
        "simt_step.condition"(%22, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %18 = arith.addi %arg4, %arg5 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %19 = arith.addi %arg5, %c1_i32_7 : i32
        %true_8 = arith.constant true
        %c0_i32_9 = arith.constant 0 : i32
        %c64_i32_10 = arith.constant 64 : i32
        %20 = arith.muli %arg5, %c64_i32_10 : i32
        %21 = arith.addi %c0_i32_9, %20 : i32
        %22 = arith.addi %21, %0 : i32
        %true_11 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%18, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %12 = arith.addi %arg2, %11#0 : i32
      %c1_i32_4 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32_4 : i32
      %true_5 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %c64_i32 = arith.constant 64 : i32
      %14 = arith.muli %arg3, %c64_i32 : i32
      %15 = arith.addi %c256_i32, %14 : i32
      %16 = arith.addi %15, %0 : i32
      %true_6 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c1_i32 = arith.constant 1 : i32
    %4 = arith.addi %0, %c1_i32 : i32
    %c640_i32 = arith.constant 640 : i32
    %5 = arith.addi %c640_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_1 : i32
    %8 = "simt_step.if"(%7) ({
      %c704_i32 = arith.constant 704 : i32
      %11 = arith.addi %c704_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32_2 = arith.constant 1 : i32
      %13 = "simt_step.switch"(%12, %c1_i32_2) ({
      ^bb0(%arg2: i32):
        %c768_i32 = arith.constant 768 : i32
        %14 = arith.addi %c768_i32, %0 : i32
        %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %15, %c0_i32_3 : i32
        %17 = "simt_step.if"(%16) ({
          %c4_i32 = arith.constant 4 : i32
          %29 = arith.addi %0, %c4_i32 : i32
          "simt_step.yield"(%29) : (i32) -> ()
        }, {
          %29 = simt_step.lane_id
          %30 = arith.index_cast %29 : index to i32
          "simt_step.yield"(%30) : (i32) -> ()
        }) : (i1) -> i32
        %c512_i32 = arith.constant 512 : i32
        %18 = arith.addi %c512_i32, %0 : i32
        %true_4 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c64_i32 = arith.constant 64 : i32
          %29 = arith.muli %arg4, %c64_i32 : i32
          %30 = arith.addi %29, %0 : i32
          %c832_i32 = arith.constant 832 : i32
          %31 = arith.addi %c832_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_11 : i32
          "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %29 = arith.addi %arg3, %arg4 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %30 = arith.addi %arg4, %c1_i32_11 : i32
          %true_12 = arith.constant true
          %c768_i32_13 = arith.constant 768 : i32
          %c64_i32 = arith.constant 64 : i32
          %31 = arith.muli %arg4, %c64_i32 : i32
          %32 = arith.addi %c768_i32_13, %31 : i32
          %33 = arith.addi %32, %0 : i32
          %true_14 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        %c1024_i32 = arith.constant 1024 : i32
        %22 = arith.addi %c1024_i32, %0 : i32
        %true_8 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        %25 = simt_step.lane_id
        %26 = arith.index_cast %25 : index to i32
        %true_9 = arith.constant true
        %c1280_i32 = arith.constant 1280 : i32
        %27 = arith.addi %c1280_i32, %0 : i32
        %true_10 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%13) : (i32) -> ()
    }, {
      %c1152_i32 = arith.constant 1152 : i32
      %11 = arith.addi %c1152_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_2 : i32
      %14 = "simt_step.if"(%13) ({
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c64_i32 = arith.constant 64 : i32
          %18 = arith.muli %arg3, %c64_i32 : i32
          %19 = arith.addi %18, %0 : i32
          %c1216_i32 = arith.constant 1216 : i32
          %20 = arith.addi %c1216_i32, %19 : i32
          %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %22 = arith.cmpi ne, %21, %c0_i32_6 : i32
          "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %18 = arith.addi %arg2, %arg3 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %19 = arith.addi %arg3, %c1_i32_6 : i32
          %true_7 = arith.constant true
          %c1536_i32 = arith.constant 1536 : i32
          %c64_i32 = arith.constant 64 : i32
          %20 = arith.muli %arg3, %c64_i32 : i32
          %21 = arith.addi %c1536_i32, %20 : i32
          %22 = arith.addi %21, %0 : i32
          %true_8 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) : (i32) -> ()
      }, {
        %c1536_i32 = arith.constant 1536 : i32
        %17 = arith.addi %c1536_i32, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_4 : i32
        %20 = "simt_step.if"(%19) ({
          %c1_i32_6 = arith.constant 1 : i32
          %23 = arith.addi %0, %c1_i32_6 : i32
          "simt_step.yield"(%23) : (i32) -> ()
        }, {
          %c0_i32_6 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_6) : (i32) -> ()
        }) : (i1) -> i32
        %c1792_i32 = arith.constant 1792 : i32
        %21 = arith.addi %c1792_i32, %0 : i32
        %true_5 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) : (i32) -> ()
      }) : (i1) -> i32
      %c2048_i32 = arith.constant 2048 : i32
      %15 = arith.addi %c2048_i32, %0 : i32
      %true_3 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) : (i32) -> ()
    }) : (i1) -> i32
    %c2304_i32 = arith.constant 2304 : i32
    %9 = arith.addi %c2304_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

