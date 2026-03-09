module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32 = arith.constant 3 : i32
      %5 = arith.remsi %arg3, %c3_i32 : i32
      %6 = simt_step.lane_id
      %7 = arith.index_cast %6 : index to i32
      %8 = "simt_step.switch"(%5, %7) ({
      ^bb0(%arg6: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32_4 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %15 = arith.addi %arg0, %c1_i32_5 : i32
        %16 = "simt_step.switch"(%14, %15) ({
        ^bb0(%arg7: i32):
          %true_13 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_14 : i32
          %35 = arith.addi %c16_i32, %34 : i32
          %36 = arith.addi %35, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %true_15 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_16 : i32
          %40 = arith.addi %c32_i32, %39 : i32
          %41 = arith.addi %40, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %41, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %true_17 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_18 : i32
          %45 = arith.addi %c48_i32, %44 : i32
          %46 = arith.addi %45, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %46, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          %true_19 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_20 : i32
          %50 = arith.addi %c64_i32, %49 : i32
          %51 = arith.addi %50, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %51, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %18 = arith.muli %arg5, %c4_i32_7 : i32
        %19 = arith.addi %c80_i32, %18 : i32
        %20 = arith.addi %19, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %true_8 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %23 = arith.muli %arg5, %c4_i32_9 : i32
        %24 = arith.addi %c96_i32, %23 : i32
        %25 = arith.addi %24, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %c3_i32_10 = arith.constant 3 : i32
        %27 = arith.remsi %arg3, %c3_i32_10 : i32
        %28 = "simt_step.switch"(%27, %arg0) ({
        ^bb0(%arg7: i32):
          %true_13 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_14 : i32
          %35 = arith.addi %c112_i32, %34 : i32
          %36 = arith.addi %35, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %true_15 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_16 : i32
          %40 = arith.addi %c128_i32, %39 : i32
          %41 = arith.addi %40, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %41, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %true_17 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_18 : i32
          %45 = arith.addi %c144_i32, %44 : i32
          %46 = arith.addi %45, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %46, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          %true_19 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_20 : i32
          %50 = arith.addi %c160_i32, %49 : i32
          %51 = arith.addi %50, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %51, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %30 = arith.muli %arg5, %c4_i32_12 : i32
        %31 = arith.addi %c176_i32, %30 : i32
        %32 = arith.addi %31, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %32, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %9 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c192_i32 = arith.constant 192 : i32
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.muli %arg5, %c4_i32 : i32
      %11 = arith.addi %c192_i32, %10 : i32
      %12 = arith.addi %11, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%8, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %10 = arith.addi %c12_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_0 : i32
      %13 = "simt_step.if"(%12) ({
        %c16_i32 = arith.constant 16 : i32
        %22 = arith.addi %c16_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %24 = simt_step.lane_id
        %25 = arith.index_cast %24 : index to i32
        %26 = "simt_step.switch"(%23, %25) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          %true_7 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %27 = arith.addi %c208_i32, %0 : i32
          %true_8 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          %30 = arith.addi %0, %c0_i32_9 : i32
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%26) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %22 = arith.addi %c20_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_7 : i32
        %25 = "simt_step.if"(%24) ({
          %28 = simt_step.lane_id
          %29 = arith.index_cast %28 : index to i32
          "simt_step.yield"(%29) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %26 = arith.addi %c224_i32, %0 : i32
        %true_8 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) : (i32) -> ()
      }) : (i1) -> i32
      %c240_i32 = arith.constant 240 : i32
      %14 = arith.addi %c240_i32, %0 : i32
      %true = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_7 : i32
        %23 = arith.addi %22, %0 : i32
        %c24_i32 = arith.constant 24 : i32
        %24 = arith.addi %c24_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_8 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %22 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg4, %c1_i32 : i32
        %true_7 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_8 : i32
        %25 = arith.addi %c256_i32, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_9 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_3 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %18 = arith.addi %c272_i32, %0 : i32
      %true_4 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_7 : i32
        %23 = arith.addi %22, %0 : i32
        %c44_i32 = arith.constant 44 : i32
        %24 = arith.addi %c44_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_8 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %22 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg4, %c1_i32 : i32
        %true_7 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_8 : i32
        %25 = arith.addi %c288_i32, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_9 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

