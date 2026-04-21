module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %1 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %1, %c1_i32 : i32
      %3 = arith.cmpi slt, %arg5, %2 : i32
      "simt_step.condition"(%3, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %1 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %2 = "simt_step.if"(%1) ({
        %true = arith.constant true
        %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %5 = arith.muli %arg5, %c4_i32 : i32
        %6 = arith.addi %c0_i32_2, %5 : i32
        %7 = arith.addi %6, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%4) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %4:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32_4 : i32
          %7 = arith.cmpi slt, %arg7, %6 : i32
          "simt_step.condition"(%7, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg7, %c4_i32 : i32
          %7 = arith.addi %c16_i32, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_4 = arith.constant 1 : i32
          %9 = arith.addi %arg7, %c1_i32_4 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%2, %3) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
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
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_1 : i32
      %19 = "simt_step.if"(%18) ({
        %c3_i32 = arith.constant 3 : i32
        %36 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%36) : (i32) -> ()
      }, {
        %c16_i32 = arith.constant 16 : i32
        %36 = arith.addi %c16_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_9 : i32
        %39 = "simt_step.if"(%38) ({
          %c2_i32 = arith.constant 2 : i32
          %42 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          %c0_i32_12 = arith.constant 0 : i32
          %42 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        %c32_i32_10 = arith.constant 32 : i32
        %40 = arith.addi %c32_i32_10, %0 : i32
        %true_11 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) : (i32) -> ()
      }) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %20 = arith.addi %c48_i32, %0 : i32
      %true_2 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_3 = arith.constant true
      %c64_i32 = arith.constant 64 : i32
      %22 = arith.addi %c64_i32, %0 : i32
      %true_4 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %25 = simt_step.lane_id
      %26 = arith.index_cast %25 : index to i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %28 = arith.addi %c20_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %30 = "simt_step.switch"(%29, %c1_i32) ({
      ^bb0(%arg3: i32):
        %c24_i32 = arith.constant 24 : i32
        %36 = arith.addi %c24_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = simt_step.lane_id
        %39 = arith.index_cast %38 : index to i32
        %40 = "simt_step.switch"(%37, %39) ({
        ^bb0(%arg4: i32):
          %55 = simt_step.lane_id
          %56 = arith.index_cast %55 : index to i32
          %true_15 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %57 = arith.addi %c80_i32, %0 : i32
          %true_16 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %c0_i32_17 = arith.constant 0 : i32
          %60 = arith.addi %0, %c0_i32_17 : i32
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %41 = arith.addi %c96_i32, %0 : i32
        %true_10 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb1(%43: i32):  // no predecessors
        %44 = simt_step.lane_id
        %45 = arith.index_cast %44 : index to i32
        %true_11 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %46 = arith.addi %c112_i32, %0 : i32
        %true_12 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb2(%48: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %49 = arith.addi %c28_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %51 = arith.cmpi ne, %50, %c0_i32_13 : i32
        %52 = "simt_step.if"(%51) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %55 = simt_step.subgroup_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) : (i32) -> ()
        }) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %53 = arith.addi %c128_i32, %0 : i32
        %true_14 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %31 = arith.addi %c144_i32, %0 : i32
      %true_6 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    ^bb3(%33: i32):  // no predecessors
      %true_7 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %34 = arith.addi %c160_i32, %0 : i32
      %true_8 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c32_i32 = arith.constant 32 : i32
    %10 = arith.addi %c32_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %11, %c0_i32_0 : i32
    %13 = "simt_step.if"(%12) ({
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %17 = arith.muli %arg3, %c4_i32_3 : i32
        %18 = arith.addi %17, %0 : i32
        %c36_i32 = arith.constant 36 : i32
        %19 = arith.addi %c36_i32, %18 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_4 : i32
        "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %17 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg3, %c1_i32 : i32
        %true_3 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %c4_i32_4 = arith.constant 4 : i32
        %19 = arith.muli %arg3, %c4_i32_4 : i32
        %20 = arith.addi %c176_i32, %19 : i32
        %21 = arith.addi %20, %0 : i32
        %true_5 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%17, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) : (i32) -> ()
    }, {
      %c56_i32 = arith.constant 56 : i32
      %16 = arith.addi %c56_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = simt_step.subgroup_id
      %19 = arith.index_cast %18 : index to i32
      %20 = "simt_step.switch"(%17, %19) ({
      ^bb0(%arg2: i32):
        %c60_i32 = arith.constant 60 : i32
        %21 = arith.addi %c60_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_1 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_1 : i32
        %24 = "simt_step.if"(%23) ({
          %39 = simt_step.subgroup_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %25 = arith.addi %c192_i32, %0 : i32
        %true_2 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %28 = arith.addi %c64_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_3 : i32
        %31 = "simt_step.if"(%30) ({
          %c4_i32_7 = arith.constant 4 : i32
          %39 = arith.addi %0, %c4_i32_7 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          %c4_i32_7 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_7) : (i32) -> ()
        }) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %32 = arith.addi %c208_i32, %0 : i32
        %true_4 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_5 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %34 = arith.addi %c224_i32, %0 : i32
        %true_6 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %37 = simt_step.lane_id
        %38 = arith.index_cast %37 : index to i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) : (i32) -> ()
    }) : (i1) -> i32
    %c240_i32 = arith.constant 240 : i32
    %14 = arith.addi %c240_i32, %0 : i32
    %true = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

