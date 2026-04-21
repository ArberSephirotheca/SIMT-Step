module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %6 = arith.muli %arg5, %c4_i32 : i32
      %7 = arith.addi %c0_i32_3, %6 : i32
      %8 = arith.addi %7, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%5, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_1 = arith.constant 0 : i32
    %1 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %2 = "simt_step.if"(%1) ({
      %c0_i32_3 = arith.constant 0 : i32
      %5 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %6 = "simt_step.if"(%5) ({
        %c3_i32 = arith.constant 3 : i32
        %7 = "simt_step.switch"(%arg3, %c3_i32) ({
        ^bb0(%arg4: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %9 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
        ^bb1(%10: i32):  // no predecessors
          %true_4 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %12 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%7) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %7:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %9 = arith.addi %8, %c1_i32 : i32
          %10 = arith.cmpi slt, %arg5, %9 : i32
          "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.muli %arg5, %c4_i32 : i32
          %10 = arith.addi %c48_i32, %9 : i32
          %11 = arith.addi %10, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %12 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%8, %12) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%7#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%6) : (i32) -> ()
    }, {
      %true = arith.constant true
      %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %6 = arith.addi %c64_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%5) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0#0, %2 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c8_i32 = arith.constant 8 : i32
      %19 = arith.addi %c8_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_4 : i32
      "simt_step.if"(%21) ({
        "simt_step.yield"() : () -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %22 = arith.remsi %0, %c2_i32 : i32
        %23 = "simt_step.switch"(%22, %0) ({
        ^bb0(%arg2: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %24 = arith.addi %arg2, %c4_i32_5 : i32
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %c4_i32_6 = arith.constant 4 : i32
          %26 = arith.addi %25, %c4_i32_6 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          %c4_i32_7 = arith.constant 4 : i32
          %28 = arith.addi %27, %c4_i32_7 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %19 = arith.addi %c16_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = "simt_step.switch"(%20, %0) ({
      ^bb0(%arg3: i32):
        %true_14 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %45 = arith.addi %c80_i32, %0 : i32
        %true_15 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%47: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %48 = arith.addi %c20_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %50 = simt_step.subgroup_id
        %51 = arith.index_cast %50 : index to i32
        %52 = "simt_step.switch"(%49, %51) ({
        ^bb0(%arg4: i32):
          %70 = simt_step.lane_id
          %71 = arith.index_cast %70 : index to i32
          "simt_step.yield"(%71) {fallthrough = false} : (i32) -> ()
        ^bb1(%72: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%73: i32):  // no predecessors
          %true_22 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %74 = arith.addi %c96_i32, %0 : i32
          %true_23 = arith.constant true
          %75 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %74, %75) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      ^bb2(%53: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %54 = arith.addi %c24_i32, %0 : i32
        %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
        %56 = simt_step.lane_id
        %57 = arith.index_cast %56 : index to i32
        %58 = "simt_step.switch"(%55, %57) ({
        ^bb0(%arg4: i32):
          %true_22 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %70 = arith.addi %c112_i32, %0 : i32
          %true_23 = arith.constant true
          %71 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %70, %71) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%72: i32):  // no predecessors
          %c0_i32_24 = arith.constant 0 : i32
          %true_25 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %73 = arith.addi %c128_i32, %0 : i32
          %true_26 = arith.constant true
          %74 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %73, %74) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_24) {fallthrough = true} : (i32) -> ()
        ^bb2(%75: i32):  // no predecessors
          %76 = simt_step.subgroup_id
          %77 = arith.index_cast %76 : index to i32
          "simt_step.yield"(%77) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %59 = arith.addi %c144_i32, %0 : i32
        %true_17 = arith.constant true
        %60 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
      ^bb3(%61: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %62 = arith.addi %c28_i32, %0 : i32
        %63 = "simt_step.buffer.load"(%arg1, %62) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %64 = arith.cmpi ne, %63, %c0_i32_18 : i32
        %65 = "simt_step.if"(%64) ({
          %70 = simt_step.subgroup_id
          %71 = arith.index_cast %70 : index to i32
          "simt_step.yield"(%71) : (i32) -> ()
        }, {
          %70 = simt_step.subgroup_id
          %71 = arith.index_cast %70 : index to i32
          "simt_step.yield"(%71) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %66 = arith.addi %c160_i32, %0 : i32
        %true_19 = arith.constant true
        %67 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_20 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %68 = arith.addi %c176_i32, %0 : i32
        %true_21 = arith.constant true
        %69 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %68, %69) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %22 = arith.addi %c192_i32, %0 : i32
      %true_5 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %25 = arith.addi %c32_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_6 : i32
      %28 = "simt_step.if"(%27) ({
        %c0_i32_14 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_14) : (i32) -> ()
      }, {
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %45:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %46 = arith.muli %arg4, %c4_i32_16 : i32
          %47 = arith.addi %46, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %48 = arith.addi %c36_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_17 : i32
          "simt_step.condition"(%50, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %46 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg4, %c1_i32 : i32
          %true_16 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %48 = arith.muli %arg4, %c4_i32_17 : i32
          %49 = arith.addi %c208_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_18 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%45#0) : (i32) -> ()
      }) : (i1) -> i32
      %c224_i32 = arith.constant 224 : i32
      %29 = arith.addi %c224_i32, %0 : i32
      %true_7 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_8 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %31 = arith.addi %c240_i32, %0 : i32
      %true_9 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    ^bb2(%33: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %34 = arith.addi %c56_i32, %0 : i32
      %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %36 = arith.cmpi ne, %35, %c0_i32_10 : i32
      %37 = "simt_step.if"(%36) ({
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %45:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %46 = arith.muli %arg4, %c4_i32_16 : i32
          %47 = arith.addi %46, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %48 = arith.addi %c60_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_17 : i32
          "simt_step.condition"(%50, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %46 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg4, %c1_i32 : i32
          %true_16 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %48 = arith.muli %arg4, %c4_i32_17 : i32
          %49 = arith.addi %c256_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_18 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%45#0) : (i32) -> ()
      }, {
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %45:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %46 = arith.muli %arg4, %c4_i32_16 : i32
          %47 = arith.addi %46, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %48 = arith.addi %c80_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_17 : i32
          "simt_step.condition"(%50, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %46 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg4, %c1_i32 : i32
          %true_16 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %48 = arith.muli %arg4, %c4_i32_17 : i32
          %49 = arith.addi %c272_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_18 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%45#0) : (i32) -> ()
      }) : (i1) -> i32
      %c288_i32 = arith.constant 288 : i32
      %38 = arith.addi %c288_i32, %0 : i32
      %true_11 = arith.constant true
      %39 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
    ^bb3(%40: i32):  // no predecessors
      %41 = simt_step.lane_id
      %42 = arith.index_cast %41 : index to i32
      %true_12 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %43 = arith.addi %c304_i32, %0 : i32
      %true_13 = arith.constant true
      %44 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c320_i32 = arith.constant 320 : i32
    %9 = arith.addi %c320_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %11 = simt_step.subgroup_id
    %12 = arith.index_cast %11 : index to i32
    %c100_i32 = arith.constant 100 : i32
    %13 = arith.addi %c100_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %15 = arith.cmpi ne, %14, %c0_i32_2 : i32
    %16 = "simt_step.if"(%15) ({
      %c104_i32 = arith.constant 104 : i32
      %19 = arith.addi %c104_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_4 : i32
      %22 = "simt_step.if"(%21) ({
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%25) : (i32) -> ()
      }, {
        %c108_i32 = arith.constant 108 : i32
        %25 = arith.addi %c108_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_6 : i32
        %28 = "simt_step.if"(%27) ({
          %31 = simt_step.subgroup_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c336_i32 = arith.constant 336 : i32
        %29 = arith.addi %c336_i32, %0 : i32
        %true_7 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) : (i32) -> ()
      }) : (i1) -> i32
      %c352_i32 = arith.constant 352 : i32
      %23 = arith.addi %c352_i32, %0 : i32
      %true_5 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) : (i32) -> ()
    }, {
      "simt_step.yield"(%0) : (i32) -> ()
    }) : (i1) -> i32
    %c368_i32 = arith.constant 368 : i32
    %17 = arith.addi %c368_i32, %0 : i32
    %true_3 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

