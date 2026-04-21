module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c4_i32 = arith.constant 4 : i32
    %2 = "simt_step.switch"(%arg3, %c4_i32) ({
    ^bb0(%arg4: i32):
      %true_3 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %14 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %true_4 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %17 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %4 = arith.select %3, %0, %2 : i32
    %c2_i32 = arith.constant 2 : i32
    %5 = arith.remsi %arg3, %c2_i32 : i32
    %6 = simt_step.subgroup_id
    %7 = arith.index_cast %6 : index to i32
    %8 = "simt_step.switch"(%5, %7) ({
    ^bb0(%arg4: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32_7 : i32
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %16, %c1_i32 : i32
        %18 = arith.cmpi slt, %arg6, %17 : i32
        "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %17 = "simt_step.if"(%16) ({
          %true_8 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %20 = arith.muli %arg6, %c4_i32_9 : i32
          %21 = arith.addi %c48_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %20 = arith.muli %arg6, %c4_i32_9 : i32
          %21 = arith.addi %c64_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%17, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32_7 : i32
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %16, %c1_i32 : i32
        %18 = arith.cmpi slt, %arg6, %17 : i32
        "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true_7 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %17 = arith.muli %arg6, %c4_i32_8 : i32
        %18 = arith.addi %c80_i32, %17 : i32
        %19 = arith.addi %18, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%16, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    %c96_i32 = arith.constant 96 : i32
    %10 = arith.addi %c96_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %12 = arith.select %11, %4, %8 : i32
    return
  }
  func.func @main(%arg0: !simt_step.resource<Global, i32>, %arg1: !simt_step.resource<Global, i32>) attributes {simt.num_threads = [4, 1, 1], simt.subgroup_width = 8 : i64} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %0 : i32
    %2 = "simt_step.buffer.load"(%arg1, %1) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32 = arith.constant 4 : i32
    %3 = arith.addi %c4_i32, %0 : i32
    %4 = "simt_step.buffer.load"(%arg1, %3) : (!simt_step.resource<Global, i32>, i32) -> i32
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.addi %0, %c0_i32_0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_3 : i32
      %12 = arith.addi %11, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %13 = arith.addi %c8_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_4 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %11 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c112_i32 = arith.constant 112 : i32
      %c4_i32_3 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_3 : i32
      %14 = arith.addi %c112_i32, %13 : i32
      %15 = arith.addi %14, %0 : i32
      %true_4 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %7 = arith.addi %c28_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %9 = arith.addi %0, %c2_i32 : i32
    %10 = "simt_step.switch"(%8, %9) ({
    ^bb0(%arg2: i32):
      %c32_i32 = arith.constant 32 : i32
      %11 = arith.addi %c32_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %13 = "simt_step.switch"(%12, %0) ({
      ^bb0(%arg3: i32):
        %c36_i32 = arith.constant 36 : i32
        %35 = arith.addi %c36_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %37 = simt_step.lane_id
        %38 = arith.index_cast %37 : index to i32
        %39 = "simt_step.switch"(%36, %38) ({
        ^bb0(%arg4: i32):
          %c0_i32_22 = arith.constant 0 : i32
          %58 = arith.addi %0, %c0_i32_22 : i32
          "simt_step.yield"(%58) {fallthrough = true} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %c4_i32_23 = arith.constant 4 : i32
          %true_24 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %60 = arith.addi %c128_i32, %0 : i32
          %true_25 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_23) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %40 = arith.addi %c144_i32, %0 : i32
        %true_13 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %58 = arith.muli %arg5, %c4_i32_22 : i32
          %59 = arith.addi %58, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %60 = arith.addi %c40_i32, %59 : i32
          %61 = "simt_step.buffer.load"(%arg1, %60) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %62 = arith.cmpi ne, %61, %c0_i32_23 : i32
          "simt_step.condition"(%62, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %58 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %59 = arith.addi %arg5, %c1_i32 : i32
          %true_22 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_23 = arith.constant 4 : i32
          %60 = arith.muli %arg5, %c4_i32_23 : i32
          %61 = arith.addi %c160_i32, %60 : i32
          %62 = arith.addi %61, %0 : i32
          %true_24 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%58, %59) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %44 = arith.addi %c176_i32, %0 : i32
        %true_17 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%46: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %47 = arith.addi %c60_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_18 : i32
        %50 = "simt_step.if"(%49) ({
          %c2_i32_22 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_22) : (i32) -> ()
        }, {
          %c4_i32_22 = arith.constant 4 : i32
          %58 = arith.addi %0, %c4_i32_22 : i32
          "simt_step.yield"(%58) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %51 = arith.addi %c192_i32, %0 : i32
        %true_19 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
      ^bb3(%53: i32):  // no predecessors
        %54 = simt_step.lane_id
        %55 = arith.index_cast %54 : index to i32
        %true_20 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %56 = arith.addi %c208_i32, %0 : i32
        %true_21 = arith.constant true
        %57 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %14 = arith.addi %c224_i32, %0 : i32
      %true_3 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %17 = arith.addi %c64_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = simt_step.subgroup_id
      %20 = arith.index_cast %19 : index to i32
      %21 = "simt_step.switch"(%18, %20) ({
      ^bb0(%arg3: i32):
        %c68_i32 = arith.constant 68 : i32
        %35 = arith.addi %c68_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_12 : i32
        %38 = "simt_step.if"(%37) ({
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }, {
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %39 = arith.addi %c240_i32, %0 : i32
        %true_13 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
      ^bb1(%41: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) {fallthrough = true} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_20 : i32
          %49 = arith.addi %48, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %50 = arith.addi %c72_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_21 : i32
          "simt_step.condition"(%52, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %48 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %49 = arith.addi %arg5, %c1_i32 : i32
          %true_20 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_21 : i32
          %51 = arith.addi %c256_i32, %50 : i32
          %52 = arith.addi %51, %0 : i32
          %true_22 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%44: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %45:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_20 : i32
          %49 = arith.addi %48, %0 : i32
          %c92_i32 = arith.constant 92 : i32
          %50 = arith.addi %c92_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_21 : i32
          "simt_step.condition"(%52, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %48 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %49 = arith.addi %arg5, %c1_i32 : i32
          %true_20 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_21 : i32
          %51 = arith.addi %c272_i32, %50 : i32
          %52 = arith.addi %51, %0 : i32
          %true_22 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %46 = arith.addi %c288_i32, %0 : i32
        %true_19 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %22 = arith.addi %c304_i32, %0 : i32
      %true_5 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_6 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %24 = arith.addi %c320_i32, %0 : i32
      %true_7 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %27:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_12 : i32
        %36 = arith.addi %35, %0 : i32
        %c112_i32 = arith.constant 112 : i32
        %37 = arith.addi %c112_i32, %36 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_13 : i32
        "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c132_i32 = arith.constant 132 : i32
        %35 = arith.addi %c132_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %37 = arith.addi %0, %c3_i32 : i32
        %38 = "simt_step.switch"(%36, %37) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %c0_i32_15 = arith.constant 0 : i32
          %46 = arith.addi %0, %c0_i32_15 : i32
          %true_16 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %47 = arith.addi %c336_i32, %0 : i32
          %true_17 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %39 = arith.addi %arg3, %38 : i32
        %c1_i32 = arith.constant 1 : i32
        %40 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %41 = arith.muli %arg4, %c4_i32_13 : i32
        %42 = arith.addi %c352_i32, %41 : i32
        %43 = arith.addi %42, %0 : i32
        %true_14 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39, %40) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%28: i32):  // no predecessors
      %c136_i32 = arith.constant 136 : i32
      %29 = arith.addi %c136_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_10 : i32
      %32 = "simt_step.if"(%31) ({
        %c140_i32 = arith.constant 140 : i32
        %35 = arith.addi %c140_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_12 : i32
        %38 = "simt_step.if"(%37) ({
          %41 = simt_step.lane_id
          %42 = arith.index_cast %41 : index to i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          %41 = simt_step.subgroup_id
          %42 = arith.index_cast %41 : index to i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        %c368_i32 = arith.constant 368 : i32
        %39 = arith.addi %c368_i32, %0 : i32
        %true_13 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %36 = arith.muli %arg4, %c4_i32_14 : i32
          %37 = arith.addi %36, %0 : i32
          %c144_i32 = arith.constant 144 : i32
          %38 = arith.addi %c144_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_15 : i32
          "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %36 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg4, %c1_i32 : i32
          %true_14 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_15 : i32
          %39 = arith.addi %c384_i32, %38 : i32
          %40 = arith.addi %39, %0 : i32
          %true_16 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%35#0) : (i32) -> ()
      }) : (i1) -> i32
      %c400_i32 = arith.constant 400 : i32
      %33 = arith.addi %c400_i32, %0 : i32
      %true_11 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

