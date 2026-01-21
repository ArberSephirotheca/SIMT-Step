module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.addi %arg0, %c3_i32 : i32
    %c4_i32 = arith.constant 4 : i32
    %1 = arith.remsi %0, %c4_i32 : i32
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
      %12 = "simt_step.switch"(%11, %0) ({
      ^bb0(%arg2: i32):
        %c448_i32 = arith.constant 448 : i32
        %13 = arith.addi %c448_i32, %0 : i32
        %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %14, %c0_i32_2 : i32
        %16 = "simt_step.if"(%15) ({
          %29 = simt_step.subgroup_id
          %30 = arith.index_cast %29 : index to i32
          "simt_step.yield"(%30) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %17 = arith.addi %c256_i32, %0 : i32
        %true_3 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_4 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %19 = arith.addi %c512_i32, %0 : i32
        %true_5 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c4_i32 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32) {fallthrough = true} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c512_i32_6 = arith.constant 512 : i32
        %23 = arith.addi %c512_i32_6, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_7 : i32
        %26 = "simt_step.if"(%25) ({
          %c3_i32 = arith.constant 3 : i32
          %29 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%29) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c768_i32 = arith.constant 768 : i32
        %27 = arith.addi %c768_i32, %0 : i32
        %true_8 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) : (i32) -> ()
    }, {
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %11 = arith.muli %arg3, %c64_i32 : i32
        %12 = arith.addi %11, %0 : i32
        %c576_i32 = arith.constant 576 : i32
        %13 = arith.addi %c576_i32, %12 : i32
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
        %c1024_i32 = arith.constant 1024 : i32
        %c64_i32 = arith.constant 64 : i32
        %13 = arith.muli %arg3, %c64_i32 : i32
        %14 = arith.addi %c1024_i32, %13 : i32
        %15 = arith.addi %14, %0 : i32
        %true_5 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%11, %12) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%10#0) : (i32) -> ()
    }) : (i1) -> i32
    %c1280_i32 = arith.constant 1280 : i32
    %8 = arith.addi %c1280_i32, %0 : i32
    %true = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

