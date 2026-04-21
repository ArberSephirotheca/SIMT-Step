module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %0 = arith.addi %arg0, %c1_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = arith.remsi %0, %c2_i32 : i32
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
    %3 = simt_step.lane_id
    %4 = arith.index_cast %3 : index to i32
    %c0_i32 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c3_i32 = arith.constant 3 : i32
    %7 = arith.addi %0, %c3_i32 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32 = arith.constant 64 : i32
        %29 = arith.muli %arg4, %c64_i32 : i32
        %30 = arith.addi %29, %0 : i32
        %c64_i32_7 = arith.constant 64 : i32
        %31 = arith.addi %c64_i32_7, %30 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_8 : i32
        "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %29 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32 : i32
        %true_7 = arith.constant true
        %c0_i32_8 = arith.constant 0 : i32
        %c64_i32 = arith.constant 64 : i32
        %31 = arith.muli %arg4, %c64_i32 : i32
        %32 = arith.addi %c0_i32_8, %31 : i32
        %33 = arith.addi %32, %0 : i32
        %true_9 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %10 = arith.addi %c256_i32, %0 : i32
      %true_2 = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c384_i32 = arith.constant 384 : i32
      %13 = arith.addi %c384_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32 = arith.constant 4 : i32
      %15 = arith.addi %0, %c4_i32 : i32
      %16 = "simt_step.switch"(%14, %15) ({
      ^bb0(%arg3: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c64_i32 = arith.constant 64 : i32
          %47 = arith.muli %arg5, %c64_i32 : i32
          %48 = arith.addi %47, %0 : i32
          %c448_i32 = arith.constant 448 : i32
          %49 = arith.addi %c448_i32, %48 : i32
          %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %51 = arith.cmpi ne, %50, %c0_i32_16 : i32
          "simt_step.condition"(%51, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %47 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %48 = arith.addi %arg5, %c1_i32 : i32
          %true_16 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %c64_i32 = arith.constant 64 : i32
          %49 = arith.muli %arg5, %c64_i32 : i32
          %50 = arith.addi %c512_i32, %49 : i32
          %51 = arith.addi %50, %0 : i32
          %true_17 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47, %48) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        %c768_i32 = arith.constant 768 : i32
        %30 = arith.addi %c768_i32, %0 : i32
        %true_10 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c768_i32_11 = arith.constant 768 : i32
        %33 = arith.addi %c768_i32_11, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_12 : i32
        %36 = "simt_step.if"(%35) ({
          %47 = simt_step.subgroup_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          %47 = simt_step.subgroup_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) : (i32) -> ()
        }) : (i1) -> i32
        %c1024_i32 = arith.constant 1024 : i32
        %37 = arith.addi %c1024_i32, %0 : i32
        %true_13 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_14 = arith.constant true
        %c1280_i32 = arith.constant 1280 : i32
        %39 = arith.addi %c1280_i32, %0 : i32
        %true_15 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb2(%41: i32):  // no predecessors
        %c832_i32 = arith.constant 832 : i32
        %42 = arith.addi %c832_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %44 = simt_step.lane_id
        %45 = arith.index_cast %44 : index to i32
        %46 = "simt_step.switch"(%43, %45) ({
        ^bb0(%arg4: i32):
          %c3_i32_16 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_16) {fallthrough = false} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          %true_17 = arith.constant true
          %c1536_i32 = arith.constant 1536 : i32
          %50 = arith.addi %c1536_i32, %0 : i32
          %true_18 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        ^bb2(%52: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb2(%17: i32):  // no predecessors
      %c896_i32 = arith.constant 896 : i32
      %18 = arith.addi %c896_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_3 : i32
      %21 = "simt_step.if"(%20) ({
        %29 = simt_step.subgroup_id
        %30 = arith.index_cast %29 : index to i32
        "simt_step.yield"(%30) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c64_i32 = arith.constant 64 : i32
          %30 = arith.muli %arg4, %c64_i32 : i32
          %31 = arith.addi %30, %0 : i32
          %c960_i32 = arith.constant 960 : i32
          %32 = arith.addi %c960_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_9 : i32
          "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %30 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          %c1792_i32 = arith.constant 1792 : i32
          %c64_i32 = arith.constant 64 : i32
          %32 = arith.muli %arg4, %c64_i32 : i32
          %33 = arith.addi %c1792_i32, %32 : i32
          %34 = arith.addi %33, %0 : i32
          %true_10 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) : (i32) -> ()
      }) : (i1) -> i32
      %c2048_i32 = arith.constant 2048 : i32
      %22 = arith.addi %c2048_i32, %0 : i32
      %true_4 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb3(%24: i32):  // no predecessors
      %25 = simt_step.subgroup_id
      %26 = arith.index_cast %25 : index to i32
      %true_5 = arith.constant true
      %c2304_i32 = arith.constant 2304 : i32
      %27 = arith.addi %c2304_i32, %0 : i32
      %true_6 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

