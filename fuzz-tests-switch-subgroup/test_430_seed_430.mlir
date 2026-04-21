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
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %6 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %7 = arith.addi %6, %c1_i32_6 : i32
        %8 = arith.cmpi slt, %arg7, %7 : i32
        "simt_step.condition"(%8, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %true = arith.constant true
        %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.muli %arg7, %c4_i32 : i32
        %8 = arith.addi %c0_i32_6, %7 : i32
        %9 = arith.addi %8, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_7 = arith.constant 1 : i32
        %10 = arith.addi %arg7, %c1_i32_7 : i32
        "simt_step.yield"(%6, %10) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%4#0, %5) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %4 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %4, %c1_i32 : i32
      %6 = arith.cmpi slt, %arg5, %5 : i32
      "simt_step.condition"(%6, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %5 = "simt_step.if"(%4) ({
        %c0_i32_5 = arith.constant 0 : i32
        %7 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %8 = "simt_step.if"(%7) ({
          %true = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg5, %c4_i32 : i32
          %11 = arith.addi %c16_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%9) : (i32) -> ()
        }, {
          %true = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg5, %c4_i32 : i32
          %11 = arith.addi %c32_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%9) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%8) : (i32) -> ()
      }, {
        %true = arith.constant true
        %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %c4_i32 = arith.constant 4 : i32
        %8 = arith.muli %arg5, %c4_i32 : i32
        %9 = arith.addi %c48_i32, %8 : i32
        %10 = arith.addi %9, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%7) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%5, %6) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %3 = arith.select %2, %0#0, %1#0 : i32
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
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %18 = arith.cmpi slt, %arg3, %c2_i32 : i32
        "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %17 = arith.addi %c12_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = "simt_step.switch"(%18, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %56 = arith.muli %arg5, %c4_i32_19 : i32
          %57 = arith.addi %56, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %58 = arith.addi %c16_i32, %57 : i32
          %59 = "simt_step.buffer.load"(%arg1, %58) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %60 = arith.cmpi ne, %59, %c0_i32_20 : i32
          "simt_step.condition"(%60, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %56 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %57 = arith.addi %arg5, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %58 = arith.muli %arg5, %c4_i32_21 : i32
          %59 = arith.addi %c64_i32, %58 : i32
          %60 = arith.addi %59, %0 : i32
          %true_22 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%56, %57) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %39 = arith.addi %c36_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_10 : i32
        %42 = "simt_step.if"(%41) ({
          %56 = simt_step.subgroup_id
          %57 = arith.index_cast %56 : index to i32
          "simt_step.yield"(%57) : (i32) -> ()
        }, {
          %56 = simt_step.subgroup_id
          %57 = arith.index_cast %56 : index to i32
          "simt_step.yield"(%57) : (i32) -> ()
        }) : (i1) -> i32
        %c80_i32_11 = arith.constant 80 : i32
        %43 = arith.addi %c80_i32_11, %0 : i32
        %true_12 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_13 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %45 = arith.addi %c96_i32, %0 : i32
        %true_14 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      ^bb2(%47: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %48 = arith.addi %c40_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %50 = arith.cmpi ne, %49, %c0_i32_15 : i32
        %51 = "simt_step.if"(%50) ({
          %56 = simt_step.subgroup_id
          %57 = arith.index_cast %56 : index to i32
          "simt_step.yield"(%57) : (i32) -> ()
        }, {
          %c0_i32_19 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_19) : (i32) -> ()
        }) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %52 = arith.addi %c112_i32, %0 : i32
        %true_16 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_17 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %54 = arith.addi %c128_i32, %0 : i32
        %true_18 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %21 = arith.addi %c44_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %23 = "simt_step.switch"(%22, %0) ({
      ^bb0(%arg3: i32):
        %c48_i32 = arith.constant 48 : i32
        %37 = arith.addi %c48_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = "simt_step.switch"(%38, %0) ({
        ^bb0(%arg4: i32):
          %60 = simt_step.subgroup_id
          %61 = arith.index_cast %60 : index to i32
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        ^bb1(%62: i32):  // no predecessors
          %true_18 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %63 = arith.addi %c144_i32, %0 : i32
          %true_19 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%65: i32):  // no predecessors
          %66 = simt_step.lane_id
          %67 = arith.index_cast %66 : index to i32
          %true_20 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %68 = arith.addi %c160_i32, %0 : i32
          %true_21 = arith.constant true
          %69 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %68, %69) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%67) {fallthrough = false} : (i32) -> ()
        ^bb3(%70: i32):  // no predecessors
          %71 = simt_step.subgroup_id
          %72 = arith.index_cast %71 : index to i32
          %true_22 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %73 = arith.addi %c176_i32, %0 : i32
          %true_23 = arith.constant true
          %74 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %73, %74) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%72) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %40 = arith.addi %c192_i32, %0 : i32
        %true_9 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %60 = arith.muli %arg5, %c4_i32_18 : i32
          %61 = arith.addi %60, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %62 = arith.addi %c52_i32, %61 : i32
          %63 = "simt_step.buffer.load"(%arg1, %62) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %64 = arith.cmpi ne, %63, %c0_i32_19 : i32
          "simt_step.condition"(%64, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %60 = arith.addi %arg4, %arg5 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %61 = arith.addi %arg5, %c1_i32_18 : i32
          %true_19 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %62 = arith.muli %arg5, %c4_i32_20 : i32
          %63 = arith.addi %c208_i32, %62 : i32
          %64 = arith.addi %63, %0 : i32
          %true_21 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%60, %61) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %45 = arith.addi %c72_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %47 = "simt_step.switch"(%46, %0) ({
        ^bb0(%arg4: i32):
          %c1_i32_18 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_18) {fallthrough = false} : (i32) -> ()
        ^bb1(%60: i32):  // no predecessors
          %c4_i32_19 = arith.constant 4 : i32
          %true_20 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %61 = arith.addi %c224_i32, %0 : i32
          %true_21 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_19) {fallthrough = false} : (i32) -> ()
        ^bb2(%63: i32):  // no predecessors
          %64 = simt_step.lane_id
          %65 = arith.index_cast %64 : index to i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %48 = arith.addi %c240_i32, %0 : i32
        %true_13 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = true} : (i32) -> ()
      ^bb3(%50: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %51 = arith.addi %c76_i32, %0 : i32
        %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
        %53 = simt_step.lane_id
        %54 = arith.index_cast %53 : index to i32
        %55 = "simt_step.switch"(%52, %54) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = true} : (i32) -> ()
        ^bb1(%60: i32):  // no predecessors
          %61 = simt_step.lane_id
          %62 = arith.index_cast %61 : index to i32
          %true_18 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %63 = arith.addi %c256_i32, %0 : i32
          %true_19 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %56 = arith.addi %c272_i32, %0 : i32
        %true_15 = arith.constant true
        %57 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_16 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %58 = arith.addi %c288_i32, %0 : i32
        %true_17 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c80_i32 = arith.constant 80 : i32
      %25 = arith.addi %c80_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_2 : i32
      %28 = "simt_step.if"(%27) ({
        %c84_i32 = arith.constant 84 : i32
        %37 = arith.addi %c84_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = simt_step.lane_id
        %40 = arith.index_cast %39 : index to i32
        %41 = "simt_step.switch"(%38, %40) ({
        ^bb0(%arg3: i32):
          %c1_i32_8 = arith.constant 1 : i32
          %42 = arith.addi %0, %c1_i32_8 : i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %true_9 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %44 = arith.addi %c304_i32, %0 : i32
          %true_10 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%46: i32):  // no predecessors
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          %true_11 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %49 = arith.addi %c320_i32, %0 : i32
          %true_12 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        ^bb3(%51: i32):  // no predecessors
          %52 = simt_step.lane_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%41) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_10 : i32
          %39 = arith.addi %38, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %40 = arith.addi %c88_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_11 : i32
          "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %38 = arith.addi %arg3, %arg4 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %39 = arith.addi %arg4, %c1_i32_10 : i32
          %true_11 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_12 : i32
          %41 = arith.addi %c336_i32, %40 : i32
          %42 = arith.addi %41, %0 : i32
          %true_13 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) : (i32) -> ()
      }) : (i1) -> i32
      %c352_i32 = arith.constant 352 : i32
      %29 = arith.addi %c352_i32, %0 : i32
      %true_3 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_4 = arith.constant true
      %c368_i32 = arith.constant 368 : i32
      %31 = arith.addi %c368_i32, %0 : i32
      %true_5 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    ^bb3(%33: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %34 = arith.addi %0, %c1_i32 : i32
      %true_6 = arith.constant true
      %c384_i32 = arith.constant 384 : i32
      %35 = arith.addi %c384_i32, %0 : i32
      %true_7 = arith.constant true
      %36 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c108_i32 = arith.constant 108 : i32
    %11 = arith.addi %c108_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
    %14 = "simt_step.if"(%13) ({
      %c112_i32 = arith.constant 112 : i32
      %17 = arith.addi %c112_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = "simt_step.switch"(%18, %0) ({
      ^bb0(%arg2: i32):
        %22 = simt_step.lane_id
        %23 = arith.index_cast %22 : index to i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %25 = simt_step.subgroup_id
        %26 = arith.index_cast %25 : index to i32
        %true_4 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %27 = arith.addi %c400_i32, %0 : i32
        %true_5 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %20 = arith.addi %c416_i32, %0 : i32
      %true_3 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) : (i32) -> ()
    }, {
      %c116_i32 = arith.constant 116 : i32
      %17 = arith.addi %c116_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = simt_step.subgroup_id
      %20 = arith.index_cast %19 : index to i32
      %21 = "simt_step.switch"(%18, %20) ({
      ^bb0(%arg2: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %24 = arith.addi %0, %c4_i32_4 : i32
        %true_5 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %25 = arith.addi %c432_i32, %0 : i32
        %true_6 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_9 : i32
          %36 = arith.addi %35, %0 : i32
          %c120_i32 = arith.constant 120 : i32
          %37 = arith.addi %c120_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_10 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_10 : i32
          %38 = arith.addi %c448_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_11 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%28#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%29: i32):  // no predecessors
        %c140_i32 = arith.constant 140 : i32
        %30 = arith.addi %c140_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = simt_step.lane_id
        %33 = arith.index_cast %32 : index to i32
        %34 = "simt_step.switch"(%31, %33) ({
        ^bb0(%arg3: i32):
          %35 = simt_step.lane_id
          %36 = arith.index_cast %35 : index to i32
          %true_9 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %37 = arith.addi %c464_i32, %0 : i32
          %true_10 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %40 = simt_step.subgroup_id
          %41 = arith.index_cast %40 : index to i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c480_i32 = arith.constant 480 : i32
      %22 = arith.addi %c480_i32, %0 : i32
      %true_3 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) : (i32) -> ()
    }) : (i1) -> i32
    %c496_i32 = arith.constant 496 : i32
    %15 = arith.addi %c496_i32, %0 : i32
    %true = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

