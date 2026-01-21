module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %0 = arith.addi %arg0, %c1_i32 : i32
    %c3_i32 = arith.constant 3 : i32
    %1 = arith.remsi %0, %c3_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %2 = arith.addi %1, %c2_i32 : i32
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
      %16 = simt_step.subgroup_id
      %17 = arith.index_cast %16 : index to i32
      "simt_step.yield"(%17) : (i32) -> ()
    }, {
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%c1_i32) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %7 = arith.addi %c0_i32_1, %0 : i32
    %true = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c64_i32 = arith.constant 64 : i32
    %9 = arith.addi %c64_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %10, %c0_i32_2 : i32
    %12 = "simt_step.if"(%11) ({
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c64_i32_8 = arith.constant 64 : i32
        %17 = arith.muli %arg3, %c64_i32_8 : i32
        %18 = arith.addi %17, %0 : i32
        %c128_i32_9 = arith.constant 128 : i32
        %19 = arith.addi %c128_i32_9, %18 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_10 : i32
        "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %17 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg3, %c1_i32 : i32
        %true_8 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %c64_i32_9 = arith.constant 64 : i32
        %19 = arith.muli %arg3, %c64_i32_9 : i32
        %20 = arith.addi %c256_i32, %19 : i32
        %21 = arith.addi %20, %0 : i32
        %true_10 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%17, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32) : (i32) -> ()
    }) : (i1) -> i32
    %c512_i32 = arith.constant 512 : i32
    %13 = arith.addi %c512_i32, %0 : i32
    %true_3 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %15:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32_6 = arith.constant 64 : i32
      %16 = arith.muli %arg3, %c64_i32_6 : i32
      %17 = arith.addi %16, %0 : i32
      %c448_i32 = arith.constant 448 : i32
      %18 = arith.addi %c448_i32, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_7 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %16 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg3, %c1_i32 : i32
      %true_6 = arith.constant true
      %c768_i32 = arith.constant 768 : i32
      %c64_i32_7 = arith.constant 64 : i32
      %18 = arith.muli %arg3, %c64_i32_7 : i32
      %19 = arith.addi %c768_i32, %18 : i32
      %20 = arith.addi %19, %0 : i32
      %true_8 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

