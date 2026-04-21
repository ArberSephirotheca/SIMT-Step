module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %4 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %4, %c1_i32 : i32
      %6 = arith.cmpi slt, %arg5, %5 : i32
      "simt_step.condition"(%6, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.muli %arg5, %c4_i32 : i32
      %6 = arith.addi %c0_i32_2, %5 : i32
      %7 = arith.addi %6, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%4, %8) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %1 = "simt_step.switch"(%arg3, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %5 = "simt_step.if"(%4) ({
        %true = arith.constant true
        %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %11 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%10) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %10 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %11 = "simt_step.if"(%10) ({
          %true = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %13 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) : (i32) -> ()
        }, {
          %true = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %13 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%11) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %7 = arith.remsi %arg3, %c2_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %arg0, %c1_i32 : i32
      %9 = "simt_step.switch"(%7, %8) ({
      ^bb0(%arg5: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %15 = arith.addi %14, %c1_i32_6 : i32
          %16 = arith.cmpi slt, %arg7, %15 : i32
          "simt_step.condition"(%16, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %15 = arith.muli %arg7, %c4_i32 : i32
          %16 = arith.addi %c64_i32, %15 : i32
          %17 = arith.addi %16, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_6 = arith.constant 1 : i32
          %18 = arith.addi %arg7, %c1_i32_6 : i32
          "simt_step.yield"(%14, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %12 = arith.remsi %arg3, %c3_i32 : i32
        %c3_i32_5 = arith.constant 3 : i32
        %13 = "simt_step.switch"(%12, %c3_i32_5) ({
        ^bb0(%arg6: i32):
          %true = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %15 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          %true_6 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %18 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
        ^bb2(%19: i32):  // no predecessors
          %true_7 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %21 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %3 = arith.select %2, %0#0, %1 : i32
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
    %c4_i32_0 = arith.constant 4 : i32
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %8 = arith.addi %c12_i32, %0 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %10 = simt_step.subgroup_id
      %11 = arith.index_cast %10 : index to i32
      %12 = "simt_step.switch"(%9, %11) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %21 = arith.addi %c16_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_2 : i32
        %24 = "simt_step.if"(%23) ({
          %45 = simt_step.subgroup_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) : (i32) -> ()
        }, {
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) : (i32) -> ()
        }) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %25 = arith.addi %c128_i32, %0 : i32
        %true_3 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_4 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %27 = arith.addi %c144_i32, %0 : i32
        %true_5 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %30 = arith.addi %c20_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_6 : i32
        %33 = "simt_step.if"(%32) ({
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %34 = arith.addi %c160_i32, %0 : i32
        %true_7 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        %37 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb3(%38: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %39 = arith.addi %c24_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_8 : i32
        %42 = "simt_step.if"(%41) ({
          %c1_i32_10 = arith.constant 1 : i32
          %45 = arith.addi %0, %c1_i32_10 : i32
          "simt_step.yield"(%45) : (i32) -> ()
        }, {
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %43 = arith.addi %c176_i32, %0 : i32
        %true_9 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %14 = arith.addi %c28_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %16 = simt_step.lane_id
      %17 = arith.index_cast %16 : index to i32
      %18 = "simt_step.switch"(%15, %17) ({
      ^bb0(%arg3: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %37 = arith.muli %arg5, %c4_i32_10 : i32
          %38 = arith.addi %37, %0 : i32
          %c32_i32 = arith.constant 32 : i32
          %39 = arith.addi %c32_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_11 : i32
          "simt_step.condition"(%41, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %37 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg5, %c1_i32 : i32
          %true_10 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_11 : i32
          %40 = arith.addi %c192_i32, %39 : i32
          %41 = arith.addi %40, %0 : i32
          %true_12 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %23 = simt_step.lane_id
        %24 = arith.index_cast %23 : index to i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb2(%25: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %37 = arith.muli %arg5, %c4_i32_10 : i32
          %38 = arith.addi %37, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %39 = arith.addi %c52_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_11 : i32
          "simt_step.condition"(%41, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %37 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg5, %c1_i32 : i32
          %true_10 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_11 : i32
          %40 = arith.addi %c208_i32, %39 : i32
          %41 = arith.addi %40, %0 : i32
          %true_12 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_6 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %27 = arith.addi %c224_i32, %0 : i32
        %true_7 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%29: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %30 = arith.addi %c72_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = simt_step.lane_id
        %33 = arith.index_cast %32 : index to i32
        %34 = "simt_step.switch"(%31, %33) ({
        ^bb0(%arg4: i32):
          %true_10 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %37 = arith.addi %c240_i32, %0 : i32
          %true_11 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %40 = simt_step.subgroup_id
          %41 = arith.index_cast %40 : index to i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %35 = arith.addi %c256_i32, %0 : i32
        %true_9 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %19 = arith.addi %c272_i32, %0 : i32
      %true_1 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

