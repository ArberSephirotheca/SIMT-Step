module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.addi %arg0, %c4_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = arith.remsi %0, %c2_i32 : i32
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
      %10 = arith.muli %arg3, %c64_i32 : i32
      %11 = arith.addi %10, %0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %12 = arith.addi %c0_i32_2, %11 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_3 : i32
      "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %10 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg3, %c1_i32 : i32
      %true_2 = arith.constant true
      %c0_i32_3 = arith.constant 0 : i32
      %c64_i32 = arith.constant 64 : i32
      %12 = arith.muli %arg3, %c64_i32 : i32
      %13 = arith.addi %c0_i32_3, %12 : i32
      %14 = arith.addi %13, %0 : i32
      %true_4 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c320_i32 = arith.constant 320 : i32
    %4 = arith.addi %c320_i32, %0 : i32
    %5 = "simt_step.buffer.load"(%arg1, %4) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %5, %c0_i32_1 : i32
    %7 = "simt_step.if"(%6) ({
      %c384_i32 = arith.constant 384 : i32
      %10 = arith.addi %c384_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_2 : i32
      %13 = "simt_step.if"(%12) ({
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c64_i32 = arith.constant 64 : i32
          %17 = arith.muli %arg3, %c64_i32 : i32
          %18 = arith.addi %17, %0 : i32
          %c448_i32 = arith.constant 448 : i32
          %19 = arith.addi %c448_i32, %18 : i32
          %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %21 = arith.cmpi ne, %20, %c0_i32_6 : i32
          "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %17 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %arg3, %c1_i32 : i32
          %true_6 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c64_i32 = arith.constant 64 : i32
          %19 = arith.muli %arg3, %c64_i32 : i32
          %20 = arith.addi %c256_i32, %19 : i32
          %21 = arith.addi %20, %0 : i32
          %true_7 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%17, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%16#0) : (i32) -> ()
      }, {
        %c768_i32_4 = arith.constant 768 : i32
        %16 = arith.addi %c768_i32_4, %0 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %17, %c0_i32_5 : i32
        %19 = "simt_step.if"(%18) ({
          %c2_i32 = arith.constant 2 : i32
          %22 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          %22 = simt_step.lane_id
          %23 = arith.index_cast %22 : index to i32
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        %c512_i32 = arith.constant 512 : i32
        %20 = arith.addi %c512_i32, %0 : i32
        %true_6 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) : (i32) -> ()
      }) : (i1) -> i32
      %c768_i32 = arith.constant 768 : i32
      %14 = arith.addi %c768_i32, %0 : i32
      %true_3 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) : (i32) -> ()
    }, {
      "simt_step.yield"(%0) : (i32) -> ()
    }) : (i1) -> i32
    %c1024_i32 = arith.constant 1024 : i32
    %8 = arith.addi %c1024_i32, %0 : i32
    %true = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

