module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %arg0, %c0_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %true = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %11 = arith.addi %c0_i32_5, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %true_6 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %14 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %true_7 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %17 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb3(%18: i32):  // no predecessors
      %true_8 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %20 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %3:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %10, %c1_i32 : i32
      %12 = arith.cmpi slt, %arg5, %11 : i32
      "simt_step.condition"(%12, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %c4_i32 = arith.constant 4 : i32
      %11 = arith.muli %arg5, %c4_i32 : i32
      %12 = arith.addi %c64_i32, %11 : i32
      %13 = arith.addi %12, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%10, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %5 = arith.select %4, %2, %3#0 : i32
    %c3_i32_3 = arith.constant 3 : i32
    %6 = arith.remsi %arg3, %c3_i32_3 : i32
    %7 = "simt_step.switch"(%6, %arg0) ({
    ^bb0(%arg4: i32):
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg0, %c1_i32 : i32
      %12 = "simt_step.switch"(%10, %11) ({
      ^bb0(%arg5: i32):
        %true = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %25 = arith.addi %c80_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %28 = "simt_step.if"(%27) ({
          %true_9 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %37 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %true_9 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %37 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb2(%29: i32):  // no predecessors
        %true_8 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %31 = arith.addi %c128_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb3(%32: i32):  // no predecessors
        %33 = simt_step.lane_id
        %34 = arith.index_cast %33 : index to i32
        %35 = "simt_step.switch"(%arg3, %34) ({
        ^bb0(%arg6: i32):
          %true_9 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %37 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %true_10 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %40 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %40, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
      %15 = "simt_step.if"(%14) ({
        %c0_i32_7 = arith.constant 0 : i32
        %24 = "simt_step.switch"(%arg3, %c0_i32_7) ({
        ^bb0(%arg5: i32):
          %true_8 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %28 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %true_9 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %31 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %26 = arith.addi %c208_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) : (i32) -> ()
      }, {
        %true = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %25 = arith.addi %c224_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%15) {fallthrough = true} : (i32) -> ()
    ^bb2(%16: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %17 = arith.remsi %arg3, %c2_i32 : i32
      %18 = simt_step.subgroup_id
      %19 = arith.index_cast %18 : index to i32
      %20 = "simt_step.switch"(%17, %19) ({
      ^bb0(%arg5: i32):
        %true = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %25 = arith.addi %c240_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c3_i32_7 = arith.constant 3 : i32
        %27 = arith.remsi %arg3, %c3_i32_7 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %28 = "simt_step.switch"(%27, %c1_i32_8) ({
        ^bb0(%arg6: i32):
          %true_10 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %33 = arith.addi %c256_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %true_11 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c272_i32 = arith.constant 272 : i32
          %36 = arith.addi %c272_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          %true_12 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c288_i32 = arith.constant 288 : i32
          %39 = arith.addi %c288_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %39, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb3(%40: i32):  // no predecessors
          %true_13 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c304_i32 = arith.constant 304 : i32
          %42 = arith.addi %c304_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %42, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb2(%29: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %31 = "simt_step.if"(%30) ({
          %true_10 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c320_i32 = arith.constant 320 : i32
          %33 = arith.addi %c320_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %true_10 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c336_i32 = arith.constant 336 : i32
          %33 = arith.addi %c336_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb3(%21: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
      %23 = "simt_step.if"(%22) ({
        %c0_i32_7 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %25 = "simt_step.if"(%24) ({
          %true = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c352_i32 = arith.constant 352 : i32
          %27 = arith.addi %c352_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) : (i32) -> ()
        }, {
          %true = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c368_i32 = arith.constant 368 : i32
          %27 = arith.addi %c368_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32_10 : i32
          %27 = arith.cmpi slt, %arg6, %26 : i32
          "simt_step.condition"(%27, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %26 = arith.muli %arg6, %c4_i32_9 : i32
          %27 = arith.addi %c384_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_10 = arith.constant 1 : i32
          %29 = arith.addi %arg6, %c1_i32_10 : i32
          "simt_step.yield"(%25, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %c0_i32_4 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
    %9 = arith.select %8, %5, %7 : i32
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
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_6 : i32
      %14 = arith.addi %13, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %15 = arith.addi %c8_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_7 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %13 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_6 : i32
      %16 = arith.addi %c400_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_7 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_6 : i32
      %14 = arith.addi %13, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %15 = arith.addi %c28_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_7 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %13 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_6 : i32
      %16 = arith.addi %c416_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_7 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_6 : i32
      %14 = arith.addi %13, %0 : i32
      %c48_i32 = arith.constant 48 : i32
      %15 = arith.addi %c48_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_7 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %13 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c432_i32 = arith.constant 432 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_6 : i32
      %16 = arith.addi %c432_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_7 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c68_i32 = arith.constant 68 : i32
    %8 = arith.addi %c68_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = simt_step.subgroup_id
    %11 = arith.index_cast %10 : index to i32
    %12 = "simt_step.switch"(%9, %11) ({
    ^bb0(%arg2: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_12 : i32
        %25 = arith.addi %24, %0 : i32
        %c72_i32 = arith.constant 72 : i32
        %26 = arith.addi %c72_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_13 : i32
        "simt_step.condition"(%28, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %24 = simt_step.subgroup_id
        %25 = arith.index_cast %24 : index to i32
        %26 = arith.addi %arg3, %25 : i32
        %c1_i32 = arith.constant 1 : i32
        %27 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_13 : i32
        %29 = arith.addi %c448_i32, %28 : i32
        %30 = arith.addi %29, %0 : i32
        %true_14 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %15 = arith.addi %c92_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_8 = arith.constant 4 : i32
      %17 = "simt_step.switch"(%16, %c4_i32_8) ({
      ^bb0(%arg3: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %30 = arith.muli %arg5, %c4_i32_16 : i32
          %31 = arith.addi %30, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %32 = arith.addi %c96_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_17 : i32
          "simt_step.condition"(%34, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %30 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg5, %c1_i32 : i32
          %true_16 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %32 = arith.muli %arg5, %c4_i32_17 : i32
          %33 = arith.addi %c464_i32, %32 : i32
          %34 = arith.addi %33, %0 : i32
          %true_18 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %25 = arith.addi %c480_i32, %0 : i32
        %true_15 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %28 = simt_step.subgroup_id
        %29 = arith.index_cast %28 : index to i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c496_i32 = arith.constant 496 : i32
      %18 = arith.addi %c496_i32, %0 : i32
      %true_9 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %21 = arith.addi %0, %c2_i32 : i32
      %true_10 = arith.constant true
      %c512_i32 = arith.constant 512 : i32
      %22 = arith.addi %c512_i32, %0 : i32
      %true_11 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

