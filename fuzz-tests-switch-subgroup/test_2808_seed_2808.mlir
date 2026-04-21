module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %3 = arith.addi %c0_i32_0, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %2 = arith.remsi %arg3, %c2_i32 : i32
      %3 = simt_step.lane_id
      %4 = arith.index_cast %3 : index to i32
      %5 = "simt_step.switch"(%2, %4) ({
      ^bb0(%arg4: i32):
        %true = arith.constant true
        %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %7 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        %c0_i32_0 = arith.constant 0 : i32
        %9 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
        %10 = "simt_step.if"(%9) ({
          %true_1 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %12 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) : (i32) -> ()
        }, {
          %true_1 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %12 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%5) : (i32) -> ()
    }) : (i1) -> i32
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
    %5 = simt_step.lane_id
    %6 = arith.index_cast %5 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %7 = arith.addi %c8_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %8, %c0_i32_0 : i32
    %10 = "simt_step.if"(%9) ({
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %21 = arith.muli %arg3, %c4_i32_3 : i32
        %22 = arith.addi %21, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %23 = arith.addi %c12_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_4 : i32
        "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %21 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg3, %c1_i32 : i32
        %true_3 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %c4_i32_4 = arith.constant 4 : i32
        %23 = arith.muli %arg3, %c4_i32_4 : i32
        %24 = arith.addi %c64_i32, %23 : i32
        %25 = arith.addi %24, %0 : i32
        %true_5 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%20#0) : (i32) -> ()
    }, {
      %20 = simt_step.lane_id
      %21 = arith.index_cast %20 : index to i32
      "simt_step.yield"(%21) : (i32) -> ()
    }) : (i1) -> i32
    %c80_i32 = arith.constant 80 : i32
    %11 = arith.addi %c80_i32, %0 : i32
    %true = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %13 = simt_step.lane_id
    %14 = arith.index_cast %13 : index to i32
    %c32_i32 = arith.constant 32 : i32
    %15 = arith.addi %c32_i32, %0 : i32
    %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
    %17 = simt_step.subgroup_id
    %18 = arith.index_cast %17 : index to i32
    %19 = "simt_step.switch"(%16, %18) ({
    ^bb0(%arg2: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_5 : i32
        %28 = arith.addi %27, %0 : i32
        %c36_i32 = arith.constant 36 : i32
        %29 = arith.addi %c36_i32, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_6 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %34 = arith.muli %arg6, %c4_i32_11 : i32
          %35 = arith.addi %34, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %36 = arith.addi %c56_i32, %35 : i32
          %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %38 = arith.cmpi ne, %37, %c0_i32_12 : i32
          "simt_step.condition"(%38, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %34 = arith.addi %arg5, %arg6 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %35 = arith.addi %arg6, %c1_i32_11 : i32
          %true_12 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %36 = arith.muli %arg6, %c4_i32_13 : i32
          %37 = arith.addi %c96_i32, %36 : i32
          %38 = arith.addi %37, %0 : i32
          %true_14 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %28 = arith.addi %arg3, %27#0 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32_7 : i32
        %true_8 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_9 : i32
        %31 = arith.addi %c112_i32, %30 : i32
        %32 = arith.addi %31, %0 : i32
        %true_10 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_3 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %21 = arith.addi %c128_i32, %0 : i32
      %true_4 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %24 = arith.addi %c76_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %26 = "simt_step.switch"(%25, %c1_i32) ({
      ^bb0(%arg3: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %45 = arith.muli %arg5, %c4_i32_19 : i32
          %46 = arith.addi %45, %0 : i32
          %c80_i32_20 = arith.constant 80 : i32
          %47 = arith.addi %c80_i32_20, %46 : i32
          %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %49 = arith.cmpi ne, %48, %c0_i32_21 : i32
          "simt_step.condition"(%49, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %45 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %46 = arith.addi %arg5, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %47 = arith.muli %arg5, %c4_i32_21 : i32
          %48 = arith.addi %c144_i32, %47 : i32
          %49 = arith.addi %48, %0 : i32
          %true_22 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%45, %46) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %28 = arith.addi %c160_i32, %0 : i32
        %true_8 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c100_i32 = arith.constant 100 : i32
        %31 = arith.addi %c100_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_9 : i32
        %34 = "simt_step.if"(%33) ({
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) : (i32) -> ()
        }, {
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %35 = arith.addi %c176_i32, %0 : i32
        %true_10 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %45 = arith.muli %arg5, %c4_i32_19 : i32
          %46 = arith.addi %45, %0 : i32
          %c104_i32 = arith.constant 104 : i32
          %47 = arith.addi %c104_i32, %46 : i32
          %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %49 = arith.cmpi ne, %48, %c0_i32_20 : i32
          "simt_step.condition"(%49, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %45 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %46 = arith.addi %arg5, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %47 = arith.muli %arg5, %c4_i32_21 : i32
          %48 = arith.addi %c192_i32, %47 : i32
          %49 = arith.addi %48, %0 : i32
          %true_22 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45, %46) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %39 = arith.addi %c208_i32, %0 : i32
        %true_14 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%41: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %45 = arith.muli %arg5, %c4_i32_19 : i32
          %46 = arith.addi %45, %0 : i32
          %c124_i32 = arith.constant 124 : i32
          %47 = arith.addi %c124_i32, %46 : i32
          %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %49 = arith.cmpi ne, %48, %c0_i32_20 : i32
          "simt_step.condition"(%49, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %45 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %46 = arith.addi %arg5, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %47 = arith.muli %arg5, %c4_i32_21 : i32
          %48 = arith.addi %c224_i32, %47 : i32
          %49 = arith.addi %48, %0 : i32
          %true_22 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45, %46) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %43 = arith.addi %c240_i32, %0 : i32
        %true_18 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

