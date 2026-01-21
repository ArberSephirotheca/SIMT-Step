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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %4, %c0_i32_0 : i32
    %6 = "simt_step.if"(%5) ({
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %22 = arith.muli %arg3, %c64_i32 : i32
        %23 = arith.addi %22, %0 : i32
        %c64_i32_7 = arith.constant 64 : i32
        %24 = arith.addi %c64_i32_7, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_8 : i32
        "simt_step.condition"(%26, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %22 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c0_i32_8 = arith.constant 0 : i32
        %c64_i32 = arith.constant 64 : i32
        %24 = arith.muli %arg3, %c64_i32 : i32
        %25 = arith.addi %c0_i32_8, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_9 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%21#0) : (i32) -> ()
    }, {
      %21 = simt_step.subgroup_id
      %22 = arith.index_cast %21 : index to i32
      "simt_step.yield"(%22) : (i32) -> ()
    }) : (i1) -> i32
    %c256_i32 = arith.constant 256 : i32
    %7 = arith.addi %c256_i32, %0 : i32
    %true = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c384_i32 = arith.constant 384 : i32
    %9 = arith.addi %c384_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %10, %c0_i32_1 : i32
    %12 = "simt_step.if"(%11) ({
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %22 = arith.muli %arg3, %c64_i32 : i32
        %23 = arith.addi %22, %0 : i32
        %c448_i32 = arith.constant 448 : i32
        %24 = arith.addi %c448_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_7 : i32
        "simt_step.condition"(%26, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c768_i32 = arith.constant 768 : i32
        %22 = arith.addi %c768_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %24 = "simt_step.switch"(%23, %c0_i32_7) ({
        ^bb0(%arg4: i32):
          %c4_i32 = arith.constant 4 : i32
          %31 = arith.addi %0, %c4_i32 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          %33 = arith.addi %0, %c4_i32_11 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %c1_i32_12 = arith.constant 1 : i32
          %35 = arith.addi %0, %c1_i32_12 : i32
          %true_13 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %36 = arith.addi %c512_i32, %0 : i32
          %true_14 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb3(%38: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %39 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %25 = arith.addi %arg2, %24 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg3, %c1_i32 : i32
        %true_8 = arith.constant true
        %c768_i32_9 = arith.constant 768 : i32
        %c64_i32 = arith.constant 64 : i32
        %27 = arith.muli %arg3, %c64_i32 : i32
        %28 = arith.addi %c768_i32_9, %27 : i32
        %29 = arith.addi %28, %0 : i32
        %true_10 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%21#0) : (i32) -> ()
    }, {
      %c832_i32 = arith.constant 832 : i32
      %21 = arith.addi %c832_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_5 : i32
      %24 = "simt_step.if"(%23) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c896_i32 = arith.constant 896 : i32
        %27 = arith.addi %c896_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %29 = "simt_step.switch"(%28, %0) ({
        ^bb0(%arg2: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          %true_7 = arith.constant true
          %c1024_i32 = arith.constant 1024 : i32
          %31 = arith.addi %c1024_i32, %0 : i32
          %true_8 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%29) : (i32) -> ()
      }) : (i1) -> i32
      %c1280_i32 = arith.constant 1280 : i32
      %25 = arith.addi %c1280_i32, %0 : i32
      %true_6 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) : (i32) -> ()
    }) : (i1) -> i32
    %c1536_i32 = arith.constant 1536 : i32
    %13 = arith.addi %c1536_i32, %0 : i32
    %true_2 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c960_i32 = arith.constant 960 : i32
    %15 = arith.addi %c960_i32, %0 : i32
    %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %17 = arith.cmpi ne, %16, %c0_i32_3 : i32
    %18 = "simt_step.if"(%17) ({
      %c1024_i32 = arith.constant 1024 : i32
      %21 = arith.addi %c1024_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %23 = arith.addi %0, %c1_i32 : i32
      %24 = "simt_step.switch"(%22, %23) ({
      ^bb0(%arg2: i32):
        %c1088_i32 = arith.constant 1088 : i32
        %25 = arith.addi %c1088_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_5 : i32
        %28 = "simt_step.if"(%27) ({
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) : (i32) -> ()
        }, {
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) : (i32) -> ()
        }) : (i1) -> i32
        %c1792_i32 = arith.constant 1792 : i32
        %29 = arith.addi %c1792_i32, %0 : i32
        %true_6 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c1152_i32 = arith.constant 1152 : i32
        %32 = arith.addi %c1152_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_7 : i32
        %35 = "simt_step.if"(%34) ({
          %c1_i32_14 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_14) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c2048_i32 = arith.constant 2048 : i32
        %36 = arith.addi %c2048_i32, %0 : i32
        %true_8 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb2(%38: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c64_i32 = arith.constant 64 : i32
          %48 = arith.muli %arg4, %c64_i32 : i32
          %49 = arith.addi %48, %0 : i32
          %c1216_i32 = arith.constant 1216 : i32
          %50 = arith.addi %c1216_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_14 : i32
          "simt_step.condition"(%52, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %48 = arith.addi %arg3, %arg4 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %49 = arith.addi %arg4, %c1_i32_14 : i32
          %true_15 = arith.constant true
          %c2304_i32 = arith.constant 2304 : i32
          %c64_i32 = arith.constant 64 : i32
          %50 = arith.muli %arg4, %c64_i32 : i32
          %51 = arith.addi %c2304_i32, %50 : i32
          %52 = arith.addi %51, %0 : i32
          %true_16 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%40: i32):  // no predecessors
        %c1536_i32_11 = arith.constant 1536 : i32
        %41 = arith.addi %c1536_i32_11, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %43 = simt_step.subgroup_id
        %44 = arith.index_cast %43 : index to i32
        %45 = "simt_step.switch"(%42, %44) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %49 = simt_step.lane_id
          %50 = arith.index_cast %49 : index to i32
          %true_14 = arith.constant true
          %c2560_i32 = arith.constant 2560 : i32
          %51 = arith.addi %c2560_i32, %0 : i32
          %true_15 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c2816_i32 = arith.constant 2816 : i32
        %46 = arith.addi %c2816_i32, %0 : i32
        %true_13 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%24) : (i32) -> ()
    }, {
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %22 = arith.muli %arg3, %c64_i32 : i32
        %23 = arith.addi %22, %0 : i32
        %c1600_i32 = arith.constant 1600 : i32
        %24 = arith.addi %c1600_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_7 : i32
        "simt_step.condition"(%26, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c1920_i32 = arith.constant 1920 : i32
        %22 = arith.addi %c1920_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %24 = "simt_step.switch"(%23, %c3_i32) ({
        ^bb0(%arg4: i32):
          %31 = simt_step.lane_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c1_i32_9 = arith.constant 1 : i32
          %34 = arith.addi %0, %c1_i32_9 : i32
          %true_10 = arith.constant true
          %c3072_i32 = arith.constant 3072 : i32
          %35 = arith.addi %c3072_i32, %0 : i32
          %true_11 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %25 = arith.addi %arg2, %24 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c3328_i32 = arith.constant 3328 : i32
        %c64_i32 = arith.constant 64 : i32
        %27 = arith.muli %arg3, %c64_i32 : i32
        %28 = arith.addi %c3328_i32, %27 : i32
        %29 = arith.addi %28, %0 : i32
        %true_8 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%21#0) : (i32) -> ()
    }) : (i1) -> i32
    %c3584_i32 = arith.constant 3584 : i32
    %19 = arith.addi %c3584_i32, %0 : i32
    %true_4 = arith.constant true
    %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

