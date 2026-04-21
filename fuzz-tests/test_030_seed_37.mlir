module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.addi %arg0, %c4_i32 : i32
    %c3_i32 = arith.constant 3 : i32
    %1 = arith.remsi %0, %c3_i32 : i32
    %c3_i32_0 = arith.constant 3 : i32
    %2 = arith.addi %1, %c3_i32_0 : i32
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
      %c64_i32 = arith.constant 64 : i32
      %13 = arith.addi %c64_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_3 : i32
      %16 = "simt_step.if"(%15) ({
        %19 = simt_step.subgroup_id
        %20 = arith.index_cast %19 : index to i32
        "simt_step.yield"(%20) : (i32) -> ()
      }, {
        %c128_i32_5 = arith.constant 128 : i32
        %19 = arith.addi %c128_i32_5, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_6 : i32
        %22 = "simt_step.if"(%21) ({
          %25 = simt_step.subgroup_id
          %26 = arith.index_cast %25 : index to i32
          "simt_step.yield"(%26) : (i32) -> ()
        }, {
          %25 = simt_step.lane_id
          %26 = arith.index_cast %25 : index to i32
          "simt_step.yield"(%26) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %23 = arith.addi %c0_i32_7, %0 : i32
        %true_8 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %17 = arith.addi %c256_i32, %0 : i32
      %true_4 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %14 = arith.muli %arg3, %c64_i32 : i32
        %15 = arith.addi %14, %0 : i32
        %c192_i32 = arith.constant 192 : i32
        %16 = arith.addi %c192_i32, %15 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %17, %c0_i32_5 : i32
        "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %14 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %c64_i32 = arith.constant 64 : i32
        %16 = arith.muli %arg3, %c64_i32 : i32
        %17 = arith.addi %c512_i32, %16 : i32
        %18 = arith.addi %17, %0 : i32
        %true_6 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%14, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%13#0) : (i32) -> ()
    }) : (i1) -> i32
    %c768_i32 = arith.constant 768 : i32
    %7 = arith.addi %c768_i32, %0 : i32
    %true = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %9:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32 = arith.constant 64 : i32
      %13 = arith.muli %arg3, %c64_i32 : i32
      %14 = arith.addi %13, %0 : i32
      %c512_i32 = arith.constant 512 : i32
      %15 = arith.addi %c512_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_3 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %13 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true_3 = arith.constant true
      %c1024_i32 = arith.constant 1024 : i32
      %c64_i32 = arith.constant 64 : i32
      %15 = arith.muli %arg3, %c64_i32 : i32
      %16 = arith.addi %c1024_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_4 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c832_i32 = arith.constant 832 : i32
    %10 = arith.addi %c832_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32 = arith.constant 4 : i32
    %12 = "simt_step.switch"(%11, %c4_i32) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32 = arith.constant 64 : i32
        %35 = arith.muli %arg4, %c64_i32 : i32
        %36 = arith.addi %35, %0 : i32
        %c896_i32 = arith.constant 896 : i32
        %37 = arith.addi %c896_i32, %36 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_12 : i32
        "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c64_i32_18 = arith.constant 64 : i32
          %42 = arith.muli %arg6, %c64_i32_18 : i32
          %43 = arith.addi %42, %0 : i32
          %c1216_i32 = arith.constant 1216 : i32
          %44 = arith.addi %c1216_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_19 : i32
          "simt_step.condition"(%46, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %42 = arith.addi %arg5, %arg6 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %43 = arith.addi %arg6, %c1_i32_18 : i32
          %true_19 = arith.constant true
          %c1280_i32 = arith.constant 1280 : i32
          %c64_i32_20 = arith.constant 64 : i32
          %44 = arith.muli %arg6, %c64_i32_20 : i32
          %45 = arith.addi %c1280_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_21 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %36 = arith.addi %arg3, %35#0 : i32
        %c1_i32_14 = arith.constant 1 : i32
        %37 = arith.addi %arg4, %c1_i32_14 : i32
        %true_15 = arith.constant true
        %c1536_i32_16 = arith.constant 1536 : i32
        %c64_i32 = arith.constant 64 : i32
        %38 = arith.muli %arg4, %c64_i32 : i32
        %39 = arith.addi %c1536_i32_16, %38 : i32
        %40 = arith.addi %39, %0 : i32
        %true_17 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%36, %37) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%13#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c1536_i32 = arith.constant 1536 : i32
      %15 = arith.addi %c1536_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_5 : i32
      %18 = "simt_step.if"(%17) ({
        %c2_i32 = arith.constant 2 : i32
        %35 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%35) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c1792_i32 = arith.constant 1792 : i32
      %19 = arith.addi %c1792_i32, %0 : i32
      %true_6 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_7 = arith.constant true
      %c2048_i32 = arith.constant 2048 : i32
      %21 = arith.addi %c2048_i32, %0 : i32
      %true_8 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %c1600_i32 = arith.constant 1600 : i32
      %24 = arith.addi %c1600_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = simt_step.lane_id
      %27 = arith.index_cast %26 : index to i32
      %28 = "simt_step.switch"(%25, %27) ({
      ^bb0(%arg3: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c64_i32 = arith.constant 64 : i32
          %42 = arith.muli %arg5, %c64_i32 : i32
          %43 = arith.addi %42, %0 : i32
          %c1664_i32 = arith.constant 1664 : i32
          %44 = arith.addi %c1664_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_16 : i32
          "simt_step.condition"(%46, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %42 = arith.addi %arg4, %arg5 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %43 = arith.addi %arg5, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c2304_i32 = arith.constant 2304 : i32
          %c64_i32 = arith.constant 64 : i32
          %44 = arith.muli %arg5, %c64_i32 : i32
          %45 = arith.addi %c2304_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_18 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c1984_i32 = arith.constant 1984 : i32
        %37 = arith.addi %c1984_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = "simt_step.switch"(%38, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %true_16 = arith.constant true
          %c2560_i32 = arith.constant 2560 : i32
          %43 = arith.addi %c2560_i32, %0 : i32
          %true_17 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          %46 = simt_step.lane_id
          %47 = arith.index_cast %46 : index to i32
          %true_18 = arith.constant true
          %c2816_i32 = arith.constant 2816 : i32
          %48 = arith.addi %c2816_i32, %0 : i32
          %true_19 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c3072_i32 = arith.constant 3072 : i32
        %40 = arith.addi %c3072_i32, %0 : i32
        %true_15 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
    ^bb3(%29: i32):  // no predecessors
      %c2048_i32_9 = arith.constant 2048 : i32
      %30 = arith.addi %c2048_i32_9, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %32 = "simt_step.switch"(%31, %c1_i32) ({
      ^bb0(%arg3: i32):
        %c2112_i32 = arith.constant 2112 : i32
        %35 = arith.addi %c2112_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_12 : i32
        %38 = "simt_step.if"(%37) ({
          %60 = simt_step.subgroup_id
          %61 = arith.index_cast %60 : index to i32
          "simt_step.yield"(%61) : (i32) -> ()
        }, {
          %c1_i32_20 = arith.constant 1 : i32
          %60 = arith.addi %0, %c1_i32_20 : i32
          "simt_step.yield"(%60) : (i32) -> ()
        }) : (i1) -> i32
        %c3328_i32 = arith.constant 3328 : i32
        %39 = arith.addi %c3328_i32, %0 : i32
        %true_13 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_14 = arith.constant true
        %c3584_i32 = arith.constant 3584 : i32
        %41 = arith.addi %c3584_i32, %0 : i32
        %true_15 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb1(%43: i32):  // no predecessors
        %44 = simt_step.lane_id
        %45 = arith.index_cast %44 : index to i32
        %true_16 = arith.constant true
        %c3840_i32 = arith.constant 3840 : i32
        %46 = arith.addi %c3840_i32, %0 : i32
        %true_17 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb2(%48: i32):  // no predecessors
        %c2176_i32 = arith.constant 2176 : i32
        %49 = arith.addi %c2176_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %51 = arith.addi %0, %c3_i32 : i32
        %52 = "simt_step.switch"(%50, %51) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %true_20 = arith.constant true
          %c4096_i32 = arith.constant 4096 : i32
          %60 = arith.addi %c4096_i32, %0 : i32
          %true_21 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%62: i32):  // no predecessors
          %63 = simt_step.lane_id
          %64 = arith.index_cast %63 : index to i32
          "simt_step.yield"(%64) {fallthrough = true} : (i32) -> ()
        ^bb2(%65: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      ^bb3(%53: i32):  // no predecessors
        %c2240_i32 = arith.constant 2240 : i32
        %54 = arith.addi %c2240_i32, %0 : i32
        %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %56 = arith.cmpi ne, %55, %c0_i32_18 : i32
        %57 = "simt_step.if"(%56) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_20 = arith.constant 0 : i32
          %60 = arith.addi %0, %c0_i32_20 : i32
          "simt_step.yield"(%60) : (i32) -> ()
        }) : (i1) -> i32
        %c4352_i32 = arith.constant 4352 : i32
        %58 = arith.addi %c4352_i32, %0 : i32
        %true_19 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      %c4608_i32 = arith.constant 4608 : i32
      %33 = arith.addi %c4608_i32, %0 : i32
      %true_11 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

