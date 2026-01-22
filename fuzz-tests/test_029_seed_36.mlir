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
    %c0_i32_0 = arith.constant 0 : i32
    %3:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32 = arith.constant 64 : i32
      %12 = arith.muli %arg3, %c64_i32 : i32
      %13 = arith.addi %12, %0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %14 = arith.addi %c0_i32_2, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_3 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %12 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32 : i32
      %true_2 = arith.constant true
      %c0_i32_3 = arith.constant 0 : i32
      %c64_i32 = arith.constant 64 : i32
      %14 = arith.muli %arg3, %c64_i32 : i32
      %15 = arith.addi %c0_i32_3, %14 : i32
      %16 = arith.addi %15, %0 : i32
      %true_4 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c320_i32 = arith.constant 320 : i32
    %4 = arith.addi %c320_i32, %0 : i32
    %5 = "simt_step.buffer.load"(%arg1, %4) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %5, %c0_i32_1 : i32
    %7 = "simt_step.if"(%6) ({
      %c384_i32 = arith.constant 384 : i32
      %12 = arith.addi %c384_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %0, %c1_i32 : i32
      %15 = "simt_step.switch"(%13, %14) ({
      ^bb0(%arg2: i32):
        %16 = simt_step.lane_id
        %17 = arith.index_cast %16 : index to i32
        "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c64_i32 = arith.constant 64 : i32
          %25 = arith.muli %arg4, %c64_i32 : i32
          %26 = arith.addi %25, %0 : i32
          %c448_i32 = arith.constant 448 : i32
          %27 = arith.addi %c448_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_8 : i32
          "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %25 = arith.addi %arg3, %arg4 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %26 = arith.addi %arg4, %c1_i32_8 : i32
          %true_9 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c64_i32 = arith.constant 64 : i32
          %27 = arith.muli %arg4, %c64_i32 : i32
          %28 = arith.addi %c256_i32, %27 : i32
          %29 = arith.addi %28, %0 : i32
          %true_10 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_4 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %20 = arith.addi %c512_i32, %0 : i32
        %true_5 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c64_i32 = arith.constant 64 : i32
          %25 = arith.muli %arg4, %c64_i32 : i32
          %26 = arith.addi %25, %0 : i32
          %c768_i32 = arith.constant 768 : i32
          %27 = arith.addi %c768_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_8 : i32
          "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %25 = arith.addi %arg3, %arg4 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %26 = arith.addi %arg4, %c1_i32_8 : i32
          %true_9 = arith.constant true
          %c768_i32 = arith.constant 768 : i32
          %c64_i32 = arith.constant 64 : i32
          %27 = arith.muli %arg4, %c64_i32 : i32
          %28 = arith.addi %c768_i32, %27 : i32
          %29 = arith.addi %28, %0 : i32
          %true_10 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%15) : (i32) -> ()
    }, {
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %13 = arith.muli %arg3, %c64_i32 : i32
        %14 = arith.addi %13, %0 : i32
        %c1088_i32 = arith.constant 1088 : i32
        %15 = arith.addi %c1088_i32, %14 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %16, %c0_i32_4 : i32
        "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %13 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg3, %c1_i32 : i32
        %true_4 = arith.constant true
        %c1024_i32 = arith.constant 1024 : i32
        %c64_i32 = arith.constant 64 : i32
        %15 = arith.muli %arg3, %c64_i32 : i32
        %16 = arith.addi %c1024_i32, %15 : i32
        %17 = arith.addi %16, %0 : i32
        %true_5 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) : (i32) -> ()
    }) : (i1) -> i32
    %c1280_i32 = arith.constant 1280 : i32
    %8 = arith.addi %c1280_i32, %0 : i32
    %true = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %10 = simt_step.subgroup_id
    %11 = arith.index_cast %10 : index to i32
    return
  }
}

