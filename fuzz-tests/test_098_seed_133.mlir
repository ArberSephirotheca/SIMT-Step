module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.addi %arg0, %c4_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = arith.remsi %0, %c2_i32 : i32
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
    %5 = simt_step.subgroup_id
    %6 = arith.index_cast %5 : index to i32
    %7 = "simt_step.switch"(%4, %6) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32 = arith.constant 64 : i32
        %15 = arith.muli %arg4, %c64_i32 : i32
        %16 = arith.addi %15, %0 : i32
        %c64_i32_3 = arith.constant 64 : i32
        %17 = arith.addi %c64_i32_3, %16 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_4 : i32
        "simt_step.condition"(%19, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %15 = arith.addi %arg3, %0 : i32
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %arg4, %c1_i32 : i32
        %true_3 = arith.constant true
        %c0_i32_4 = arith.constant 0 : i32
        %c64_i32 = arith.constant 64 : i32
        %17 = arith.muli %arg4, %c64_i32 : i32
        %18 = arith.addi %c0_i32_4, %17 : i32
        %19 = arith.addi %18, %0 : i32
        %true_5 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %13 = arith.addi %c256_i32, %0 : i32
      %true_2 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c384_i32 = arith.constant 384 : i32
    %8 = arith.addi %c384_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = "simt_step.switch"(%9, %0) ({
    ^bb0(%arg2: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32 = arith.constant 64 : i32
        %16 = arith.muli %arg4, %c64_i32 : i32
        %17 = arith.addi %16, %0 : i32
        %c448_i32 = arith.constant 448 : i32
        %18 = arith.addi %c448_i32, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_5 : i32
        "simt_step.condition"(%20, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %16 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %arg4, %c1_i32 : i32
        %true_5 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %c64_i32 = arith.constant 64 : i32
        %18 = arith.muli %arg4, %c64_i32 : i32
        %19 = arith.addi %c512_i32, %18 : i32
        %20 = arith.addi %19, %0 : i32
        %true_6 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true = arith.constant true
      %c768_i32 = arith.constant 768 : i32
      %12 = arith.addi %c768_i32, %0 : i32
      %true_2 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32 = arith.constant 64 : i32
        %16 = arith.muli %arg4, %c64_i32 : i32
        %17 = arith.addi %16, %0 : i32
        %c768_i32_5 = arith.constant 768 : i32
        %18 = arith.addi %c768_i32_5, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
        "simt_step.condition"(%20, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %16 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %arg4, %c1_i32 : i32
        %true_5 = arith.constant true
        %c1024_i32 = arith.constant 1024 : i32
        %c64_i32 = arith.constant 64 : i32
        %18 = arith.muli %arg4, %c64_i32 : i32
        %19 = arith.addi %c1024_i32, %18 : i32
        %20 = arith.addi %19, %0 : i32
        %true_6 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

