module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %0 = arith.addi %arg0, %c1_i32 : i32
    %c3_i32 = arith.constant 3 : i32
    %1 = arith.remsi %0, %c3_i32 : i32
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
      %7 = arith.muli %arg3, %c64_i32 : i32
      %8 = arith.addi %7, %0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %9 = arith.addi %c0_i32_1, %8 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_2 : i32
      "simt_step.condition"(%11, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %7 = simt_step.subgroup_id
      %8 = arith.index_cast %7 : index to i32
      %9 = arith.addi %arg2, %8 : i32
      %c1_i32_1 = arith.constant 1 : i32
      %10 = arith.addi %arg3, %c1_i32_1 : i32
      %true = arith.constant true
      %c0_i32_2 = arith.constant 0 : i32
      %c64_i32 = arith.constant 64 : i32
      %11 = arith.muli %arg3, %c64_i32 : i32
      %12 = arith.addi %c0_i32_2, %11 : i32
      %13 = arith.addi %12, %0 : i32
      %true_3 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c320_i32 = arith.constant 320 : i32
    %4 = arith.addi %c320_i32, %0 : i32
    %5 = "simt_step.buffer.load"(%arg1, %4) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %6 = "simt_step.switch"(%5, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c384_i32 = arith.constant 384 : i32
      %7 = arith.addi %c384_i32, %0 : i32
      %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %9 = arith.cmpi ne, %8, %c0_i32_1 : i32
      %10 = "simt_step.if"(%9) ({
        %c448_i32 = arith.constant 448 : i32
        %27 = arith.addi %c448_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_8 : i32
        %30 = "simt_step.if"(%29) ({
          %33 = simt_step.subgroup_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) : (i32) -> ()
        }, {
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %31 = arith.addi %c256_i32, %0 : i32
        %true_9 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c64_i32 = arith.constant 64 : i32
          %28 = arith.muli %arg4, %c64_i32 : i32
          %29 = arith.addi %28, %0 : i32
          %c512_i32 = arith.constant 512 : i32
          %30 = arith.addi %c512_i32, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_10 : i32
          "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %28 = arith.addi %arg3, %arg4 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %29 = arith.addi %arg4, %c1_i32_10 : i32
          %true_11 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %c64_i32 = arith.constant 64 : i32
          %30 = arith.muli %arg4, %c64_i32 : i32
          %31 = arith.addi %c512_i32, %30 : i32
          %32 = arith.addi %31, %0 : i32
          %true_12 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%27#0) : (i32) -> ()
      }) : (i1) -> i32
      %c768_i32 = arith.constant 768 : i32
      %11 = arith.addi %c768_i32, %0 : i32
      %true = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_2 = arith.constant true
      %c1024_i32 = arith.constant 1024 : i32
      %13 = arith.addi %c1024_i32, %0 : i32
      %true_3 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %16 = simt_step.subgroup_id
      %17 = arith.index_cast %16 : index to i32
      %true_4 = arith.constant true
      %c1280_i32 = arith.constant 1280 : i32
      %18 = arith.addi %c1280_i32, %0 : i32
      %true_5 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %c832_i32 = arith.constant 832 : i32
      %21 = arith.addi %c832_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_6 : i32
      %24 = "simt_step.if"(%23) ({
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c64_i32 = arith.constant 64 : i32
          %28 = arith.muli %arg4, %c64_i32 : i32
          %29 = arith.addi %28, %0 : i32
          %c896_i32 = arith.constant 896 : i32
          %30 = arith.addi %c896_i32, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_10 : i32
          "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %28 = arith.addi %arg3, %arg4 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %29 = arith.addi %arg4, %c1_i32_10 : i32
          %true_11 = arith.constant true
          %c1536_i32 = arith.constant 1536 : i32
          %c64_i32 = arith.constant 64 : i32
          %30 = arith.muli %arg4, %c64_i32 : i32
          %31 = arith.addi %c1536_i32, %30 : i32
          %32 = arith.addi %31, %0 : i32
          %true_12 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%27#0) : (i32) -> ()
      }, {
        %27 = simt_step.lane_id
        %28 = arith.index_cast %27 : index to i32
        "simt_step.yield"(%28) : (i32) -> ()
      }) : (i1) -> i32
      %c1792_i32 = arith.constant 1792 : i32
      %25 = arith.addi %c1792_i32, %0 : i32
      %true_7 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

