module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32 = arith.constant 0 : i32
      %5 = arith.addi %c0_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c4_i32_0 = arith.constant 4 : i32
      %7 = arith.remsi %arg3, %c4_i32_0 : i32
      %8 = simt_step.subgroup_id
      %9 = arith.index_cast %8 : index to i32
      %10 = "simt_step.switch"(%7, %9) ({
      ^bb0(%arg5: i32):
        %true_4 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %22 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %34 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %34, %c1_i32 : i32
          %36 = arith.cmpi slt, %arg7, %35 : i32
          "simt_step.condition"(%36, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_9 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %35 = arith.muli %arg7, %c4_i32_10 : i32
          %36 = arith.addi %c32_i32, %35 : i32
          %37 = arith.addi %36, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%34, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%25: i32):  // no predecessors
        %true_7 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %27 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      ^bb3(%28: i32):  // no predecessors
        %29 = simt_step.subgroup_id
        %30 = arith.index_cast %29 : index to i32
        %31 = "simt_step.switch"(%arg3, %30) ({
        ^bb0(%arg6: i32):
          %true_9 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %35 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %true_10 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %38 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %33 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %12 = arith.addi %c112_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb2(%13: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %15 = "simt_step.if"(%14) ({
        %c2_i32 = arith.constant 2 : i32
        %21 = arith.remsi %arg3, %c2_i32 : i32
        %22 = simt_step.subgroup_id
        %23 = arith.index_cast %22 : index to i32
        %24 = "simt_step.switch"(%21, %23) ({
        ^bb0(%arg5: i32):
          %true_4 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %26 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %true_5 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %29 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%24) : (i32) -> ()
      }, {
        %true_4 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %22 = arith.addi %c160_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb3(%16: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %17 = arith.remsi %arg3, %c3_i32 : i32
      %18 = "simt_step.switch"(%17, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %22 = "simt_step.if"(%21) ({
          %true_9 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %32 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %true_9 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %32 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %25 = "simt_step.if"(%24) ({
          %true_9 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %32 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %true_9 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %32 = arith.addi %c224_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %31 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %31, %c1_i32 : i32
          %33 = arith.cmpi slt, %arg7, %32 : i32
          "simt_step.condition"(%33, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_9 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %32 = arith.muli %arg7, %c4_i32_10 : i32
          %33 = arith.addi %c240_i32, %32 : i32
          %34 = arith.addi %33, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%31, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%28: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %30 = "simt_step.if"(%29) ({
          %true_9 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %32 = arith.addi %c256_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %true_9 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c272_i32 = arith.constant 272 : i32
          %32 = arith.addi %c272_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c288_i32 = arith.constant 288 : i32
      %20 = arith.addi %c288_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c3_i32 = arith.constant 3 : i32
      %14 = arith.addi %0, %c3_i32 : i32
      "simt_step.yield"(%14) : (i32) -> ()
    }, {
      %14 = simt_step.lane_id
      %15 = arith.index_cast %14 : index to i32
      "simt_step.yield"(%15) : (i32) -> ()
    }) : (i1) -> i32
    %c304_i32 = arith.constant 304 : i32
    %9 = arith.addi %c304_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c12_i32 = arith.constant 12 : i32
    %11 = arith.addi %c12_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = "simt_step.switch"(%12, %c0_i32_1) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %14 = arith.addi %c16_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %0, %c1_i32 : i32
      %17 = "simt_step.switch"(%15, %16) ({
      ^bb0(%arg3: i32):
        %true_8 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %32 = arith.addi %c320_i32, %0 : i32
        %true_9 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %35 = simt_step.subgroup_id
        %36 = arith.index_cast %35 : index to i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c336_i32 = arith.constant 336 : i32
      %18 = arith.addi %c336_i32, %0 : i32
      %true_3 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %21 = simt_step.subgroup_id
      %22 = arith.index_cast %21 : index to i32
      %true_4 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %23 = arith.addi %c352_i32, %0 : i32
      %true_5 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %26 = arith.addi %c20_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_6 : i32
      %29 = "simt_step.if"(%28) ({
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_10 : i32
          %34 = arith.addi %33, %0 : i32
          %c24_i32 = arith.constant 24 : i32
          %35 = arith.addi %c24_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_11 : i32
          "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %33 = arith.addi %arg3, %arg4 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %34 = arith.addi %arg4, %c1_i32_10 : i32
          %true_11 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_12 : i32
          %36 = arith.addi %c368_i32, %35 : i32
          %37 = arith.addi %36, %0 : i32
          %true_13 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c384_i32 = arith.constant 384 : i32
      %30 = arith.addi %c384_i32, %0 : i32
      %true_7 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

