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
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %10 = arith.muli %arg3, %c64_i32 : i32
        %11 = arith.addi %10, %0 : i32
        %c64_i32_3 = arith.constant 64 : i32
        %12 = arith.addi %c64_i32_3, %11 : i32
        %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %13, %c0_i32_4 : i32
        "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %10 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %arg3, %c1_i32 : i32
        %true_3 = arith.constant true
        %c0_i32_4 = arith.constant 0 : i32
        %c64_i32 = arith.constant 64 : i32
        %12 = arith.muli %arg3, %c64_i32 : i32
        %13 = arith.addi %c0_i32_4, %12 : i32
        %14 = arith.addi %13, %0 : i32
        %true_5 = arith.constant true
        %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%10, %11) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) : (i32) -> ()
    }, {
      %c384_i32 = arith.constant 384 : i32
      %9 = arith.addi %c384_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_1 : i32
      %12 = "simt_step.if"(%11) ({
        %c448_i32 = arith.constant 448 : i32
        %15 = arith.addi %c448_i32, %0 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %16, %c0_i32_3 : i32
        %18 = "simt_step.if"(%17) ({
          %c0_i32_5 = arith.constant 0 : i32
          %21 = arith.addi %0, %c0_i32_5 : i32
          "simt_step.yield"(%21) : (i32) -> ()
        }, {
          %21 = simt_step.lane_id
          %22 = arith.index_cast %21 : index to i32
          "simt_step.yield"(%22) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %19 = arith.addi %c256_i32, %0 : i32
        %true_4 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%18) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_3) : (i32) -> ()
      }) : (i1) -> i32
      %c512_i32 = arith.constant 512 : i32
      %13 = arith.addi %c512_i32, %0 : i32
      %true_2 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12) : (i32) -> ()
    }) : (i1) -> i32
    %c768_i32 = arith.constant 768 : i32
    %7 = arith.addi %c768_i32, %0 : i32
    %true = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

