module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.addi %arg0, %c2_i32 : i32
    %c4_i32 = arith.constant 4 : i32
    %1 = arith.remsi %0, %c4_i32 : i32
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
    %c4_i32 = arith.constant 4 : i32
    %c0_i32 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32, %0 : i32
    %4 = "simt_step.buffer.load"(%arg1, %3) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %4, %c0_i32_0 : i32
    %6 = "simt_step.if"(%5) ({
      %c64_i32 = arith.constant 64 : i32
      %9 = arith.addi %c64_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_1 : i32
      %12 = "simt_step.if"(%11) ({
        %c3_i32 = arith.constant 3 : i32
        %15 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%15) : (i32) -> ()
      }, {
        %c128_i32_3 = arith.constant 128 : i32
        %15 = arith.addi %c128_i32_3, %0 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_4 = arith.constant 4 : i32
        %17 = arith.addi %0, %c4_i32_4 : i32
        %18 = "simt_step.switch"(%16, %17) ({
        ^bb0(%arg2: i32):
          %19 = simt_step.lane_id
          %20 = arith.index_cast %19 : index to i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          %true_5 = arith.constant true
          %c0_i32_6 = arith.constant 0 : i32
          %22 = arith.addi %c0_i32_6, %0 : i32
          %true_7 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb3(%25: i32):  // no predecessors
          %c4_i32_9 = arith.constant 4 : i32
          %26 = arith.addi %0, %c4_i32_9 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) : (i32) -> ()
      }) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %13 = arith.addi %c256_i32, %0 : i32
      %true_2 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %10 = arith.muli %arg3, %c64_i32 : i32
        %11 = arith.addi %10, %0 : i32
        %c192_i32 = arith.constant 192 : i32
        %12 = arith.addi %c192_i32, %11 : i32
        %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %13, %c0_i32_3 : i32
        "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c64_i32_7 = arith.constant 64 : i32
          %17 = arith.muli %arg5, %c64_i32_7 : i32
          %18 = arith.addi %17, %0 : i32
          %c512_i32 = arith.constant 512 : i32
          %19 = arith.addi %c512_i32, %18 : i32
          %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %21 = arith.cmpi ne, %20, %c0_i32_8 : i32
          "simt_step.condition"(%21, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %17 = arith.addi %arg4, %arg5 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %18 = arith.addi %arg5, %c1_i32_7 : i32
          %true_8 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %c64_i32_9 = arith.constant 64 : i32
          %19 = arith.muli %arg5, %c64_i32_9 : i32
          %20 = arith.addi %c512_i32, %19 : i32
          %21 = arith.addi %20, %0 : i32
          %true_10 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %11 = arith.addi %arg2, %10#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c768_i32 = arith.constant 768 : i32
        %c64_i32 = arith.constant 64 : i32
        %13 = arith.muli %arg3, %c64_i32 : i32
        %14 = arith.addi %c768_i32, %13 : i32
        %15 = arith.addi %14, %0 : i32
        %true_6 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%11, %12) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) : (i32) -> ()
    }) : (i1) -> i32
    %c1024_i32 = arith.constant 1024 : i32
    %7 = arith.addi %c1024_i32, %0 : i32
    %true = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

