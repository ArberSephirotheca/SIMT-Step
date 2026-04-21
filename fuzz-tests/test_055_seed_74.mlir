module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.addi %arg0, %c3_i32 : i32
    %c4_i32 = arith.constant 4 : i32
    %1 = arith.remsi %0, %c4_i32 : i32
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
    %5 = "simt_step.switch"(%4, %0) ({
    ^bb0(%arg2: i32):
      %c64_i32 = arith.constant 64 : i32
      %7 = arith.addi %c64_i32, %0 : i32
      %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %9 = arith.cmpi ne, %8, %c0_i32_2 : i32
      %10 = "simt_step.if"(%9) ({
        %c128_i32_9 = arith.constant 128 : i32
        %30 = arith.addi %c128_i32_9, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = "simt_step.switch"(%31, %0) ({
        ^bb0(%arg3: i32):
          %33 = simt_step.subgroup_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %36 = simt_step.subgroup_id
          %37 = arith.index_cast %36 : index to i32
          %true_10 = arith.constant true
          %c0_i32_11 = arith.constant 0 : i32
          %38 = arith.addi %c0_i32_11, %0 : i32
          %true_12 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }, {
        %c192_i32 = arith.constant 192 : i32
        %30 = arith.addi %c192_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_9 : i32
        %33 = "simt_step.if"(%32) ({
          %36 = simt_step.subgroup_id
          %37 = arith.index_cast %36 : index to i32
          "simt_step.yield"(%37) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32_10 = arith.constant 256 : i32
        %34 = arith.addi %c256_i32_10, %0 : i32
        %true_11 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) : (i32) -> ()
      }) : (i1) -> i32
      %c512_i32 = arith.constant 512 : i32
      %11 = arith.addi %c512_i32, %0 : i32
      %true = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      %c256_i32 = arith.constant 256 : i32
      %14 = arith.addi %c256_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_3 : i32
      %17 = "simt_step.if"(%16) ({
        %c320_i32 = arith.constant 320 : i32
        %30 = arith.addi %c320_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_9 : i32
        %33 = "simt_step.if"(%32) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %36 = simt_step.subgroup_id
          %37 = arith.index_cast %36 : index to i32
          "simt_step.yield"(%37) : (i32) -> ()
        }) : (i1) -> i32
        %c768_i32 = arith.constant 768 : i32
        %34 = arith.addi %c768_i32, %0 : i32
        %true_10 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) : (i32) -> ()
      }, {
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c64_i32_11 = arith.constant 64 : i32
          %31 = arith.muli %arg4, %c64_i32_11 : i32
          %32 = arith.addi %31, %0 : i32
          %c384_i32 = arith.constant 384 : i32
          %33 = arith.addi %c384_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_12 : i32
          "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %31 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg4, %c1_i32 : i32
          %true_11 = arith.constant true
          %c1024_i32 = arith.constant 1024 : i32
          %c64_i32_12 = arith.constant 64 : i32
          %33 = arith.muli %arg4, %c64_i32_12 : i32
          %34 = arith.addi %c1024_i32, %33 : i32
          %35 = arith.addi %34, %0 : i32
          %true_13 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) : (i32) -> ()
      }) : (i1) -> i32
      %c1280_i32 = arith.constant 1280 : i32
      %18 = arith.addi %c1280_i32, %0 : i32
      %true_4 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c1536_i32 = arith.constant 1536 : i32
      %20 = arith.addi %c1536_i32, %0 : i32
      %true_6 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c704_i32 = arith.constant 704 : i32
      %23 = arith.addi %c704_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = simt_step.subgroup_id
      %26 = arith.index_cast %25 : index to i32
      %27 = "simt_step.switch"(%24, %26) ({
      ^bb0(%arg3: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c64_i32_19 = arith.constant 64 : i32
          %44 = arith.muli %arg5, %c64_i32_19 : i32
          %45 = arith.addi %44, %0 : i32
          %c768_i32 = arith.constant 768 : i32
          %46 = arith.addi %c768_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_20 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c1792_i32 = arith.constant 1792 : i32
          %c64_i32_21 = arith.constant 64 : i32
          %46 = arith.muli %arg5, %c64_i32_21 : i32
          %47 = arith.addi %c1792_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_22 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        %c2048_i32 = arith.constant 2048 : i32
        %31 = arith.addi %c2048_i32, %0 : i32
        %true_12 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c1088_i32 = arith.constant 1088 : i32
        %34 = arith.addi %c1088_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = "simt_step.switch"(%35, %0) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %44 = arith.addi %0, %c2_i32 : i32
          %true_19 = arith.constant true
          %c2304_i32 = arith.constant 2304 : i32
          %45 = arith.addi %c2304_i32, %0 : i32
          %true_20 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = true} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %true_21 = arith.constant true
          %c2560_i32 = arith.constant 2560 : i32
          %48 = arith.addi %c2560_i32, %0 : i32
          %true_22 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32) {fallthrough = true} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%51: i32):  // no predecessors
          %52 = simt_step.lane_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c2816_i32 = arith.constant 2816 : i32
        %37 = arith.addi %c2816_i32, %0 : i32
        %true_14 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
      ^bb3(%40: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c64_i32_19 = arith.constant 64 : i32
          %44 = arith.muli %arg5, %c64_i32_19 : i32
          %45 = arith.addi %44, %0 : i32
          %c1152_i32 = arith.constant 1152 : i32
          %46 = arith.addi %c1152_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_20 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c3072_i32 = arith.constant 3072 : i32
          %c64_i32_21 = arith.constant 64 : i32
          %46 = arith.muli %arg5, %c64_i32_21 : i32
          %47 = arith.addi %c3072_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_22 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        %c3328_i32 = arith.constant 3328 : i32
        %42 = arith.addi %c3328_i32, %0 : i32
        %true_18 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %c3584_i32 = arith.constant 3584 : i32
      %28 = arith.addi %c3584_i32, %0 : i32
      %true_8 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32 = arith.constant 64 : i32
      %7 = arith.muli %arg3, %c64_i32 : i32
      %8 = arith.addi %7, %0 : i32
      %c1472_i32 = arith.constant 1472 : i32
      %9 = arith.addi %c1472_i32, %8 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_2 : i32
      "simt_step.condition"(%11, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %7 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c3840_i32 = arith.constant 3840 : i32
      %c64_i32 = arith.constant 64 : i32
      %9 = arith.muli %arg3, %c64_i32 : i32
      %10 = arith.addi %c3840_i32, %9 : i32
      %11 = arith.addi %10, %0 : i32
      %true_2 = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%7, %8) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

