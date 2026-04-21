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
      %8 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %8, %c1_i32 : i32
      %10 = arith.cmpi slt, %arg5, %9 : i32
      "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true_4 = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.muli %arg5, %c4_i32 : i32
      %10 = arith.addi %c16_i32, %9 : i32
      %11 = arith.addi %10, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%8, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
    %5 = "simt_step.switch"(%arg3, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %8 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %9 = "simt_step.if"(%8) ({
        %true_6 = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %14 = arith.addi %c32_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) : (i32) -> ()
      }, {
        %true_6 = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %14 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %true_5 = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %12 = arith.addi %c64_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %7 = arith.select %6, %4, %5 : i32
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
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_9 : i32
        %31 = arith.addi %30, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %32 = arith.addi %c12_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_10 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %30 = arith.addi %arg3, %arg4 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32_9 : i32
        %true_10 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %32 = arith.muli %arg4, %c4_i32_11 : i32
        %33 = arith.addi %c80_i32, %32 : i32
        %34 = arith.addi %33, %0 : i32
        %true_12 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      %14 = simt_step.subgroup_id
      %15 = arith.index_cast %14 : index to i32
      %true_3 = arith.constant true
      %c96_i32 = arith.constant 96 : i32
      %16 = arith.addi %c96_i32, %0 : i32
      %true_4 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %0, %c1_i32 : i32
      %true_5 = arith.constant true
      %c112_i32 = arith.constant 112 : i32
      %20 = arith.addi %c112_i32, %0 : i32
      %true_6 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb3(%22: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %23 = arith.addi %c32_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = simt_step.lane_id
      %26 = arith.index_cast %25 : index to i32
      %27 = "simt_step.switch"(%24, %26) ({
      ^bb0(%arg3: i32):
        %c36_i32 = arith.constant 36 : i32
        %30 = arith.addi %c36_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %32 = arith.addi %0, %c0_i32_9 : i32
        %33 = "simt_step.switch"(%31, %32) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          %true_20 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %59 = arith.addi %c128_i32, %0 : i32
          %true_21 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%61: i32):  // no predecessors
          %62 = simt_step.lane_id
          %63 = arith.index_cast %62 : index to i32
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %34 = arith.addi %c144_i32, %0 : i32
        %true_11 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %36 = arith.addi %c160_i32, %0 : i32
        %true_13 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = true} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %39 = arith.addi %c40_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_14 : i32
        %42 = "simt_step.if"(%41) ({
          %c2_i32 = arith.constant 2 : i32
          %59 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%59) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %59 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%59) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %43 = arith.addi %c176_i32, %0 : i32
        %true_15 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) {fallthrough = true} : (i32) -> ()
      ^bb2(%45: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %46 = arith.addi %c44_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %48 = arith.cmpi ne, %47, %c0_i32_16 : i32
        %49 = "simt_step.if"(%48) ({
          %c0_i32_20 = arith.constant 0 : i32
          %59 = arith.addi %0, %c0_i32_20 : i32
          "simt_step.yield"(%59) : (i32) -> ()
        }, {
          %59 = simt_step.lane_id
          %60 = arith.index_cast %59 : index to i32
          "simt_step.yield"(%60) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %50 = arith.addi %c192_i32, %0 : i32
        %true_17 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      ^bb3(%52: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %53 = arith.addi %c48_i32, %0 : i32
        %54 = "simt_step.buffer.load"(%arg1, %53) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %55 = arith.cmpi ne, %54, %c0_i32_18 : i32
        %56 = "simt_step.if"(%55) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %57 = arith.addi %c208_i32, %0 : i32
        %true_19 = arith.constant true
        %58 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %28 = arith.addi %c224_i32, %0 : i32
      %true_8 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c240_i32 = arith.constant 240 : i32
    %10 = arith.addi %c240_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

