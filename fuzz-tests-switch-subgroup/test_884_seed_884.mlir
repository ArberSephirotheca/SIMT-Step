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
      %c0_i32_4 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.muli %arg5, %c4_i32 : i32
      %6 = arith.addi %c0_i32_4, %5 : i32
      %7 = arith.addi %6, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%4, %8) : (i32, i32) -> ()
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
        %c0_i32_6 = arith.constant 0 : i32
        %7:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %9 = arith.addi %8, %c1_i32_7 : i32
          %10 = arith.cmpi slt, %arg7, %9 : i32
          "simt_step.condition"(%10, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.muli %arg7, %c4_i32 : i32
          %10 = arith.addi %c16_i32, %9 : i32
          %11 = arith.addi %10, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_7 = arith.constant 1 : i32
          %12 = arith.addi %arg7, %c1_i32_7 : i32
          "simt_step.continue"(%8, %12) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%7#0) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %7 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %8 = "simt_step.if"(%7) ({
          %true = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg5, %c4_i32 : i32
          %11 = arith.addi %c32_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%9) : (i32) -> ()
        }, {
          %true = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg5, %c4_i32 : i32
          %11 = arith.addi %c48_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%9) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%8) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%5, %6) : (i32, i32) -> ()
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %17 = simt_step.lane_id
      %18 = arith.index_cast %17 : index to i32
      %true_3 = arith.constant true
      %c64_i32 = arith.constant 64 : i32
      %19 = arith.addi %c64_i32, %0 : i32
      %true_4 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %22 = arith.addi %c12_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_5 : i32
      %25 = "simt_step.if"(%24) ({
        %c16_i32 = arith.constant 16 : i32
        %41 = arith.addi %c16_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %43 = arith.addi %0, %c3_i32 : i32
        %44 = "simt_step.switch"(%42, %43) ({
        ^bb0(%arg3: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %45 = arith.addi %0, %c4_i32_15 : i32
          %true_16 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %46 = arith.addi %c80_i32, %0 : i32
          %true_17 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%44) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %41 = arith.addi %c20_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_15 : i32
        %44 = "simt_step.if"(%43) ({
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %45 = arith.addi %c96_i32, %0 : i32
        %true_16 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) : (i32) -> ()
      }) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %26 = arith.addi %c112_i32, %0 : i32
      %true_6 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_7 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %28 = arith.addi %c128_i32, %0 : i32
      %true_8 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb2(%30: i32):  // no predecessors
      %c24_i32 = arith.constant 24 : i32
      %31 = arith.addi %c24_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %33 = arith.cmpi ne, %32, %c0_i32_9 : i32
      %34 = "simt_step.if"(%33) ({
        %c28_i32 = arith.constant 28 : i32
        %41 = arith.addi %c28_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_15 : i32
        %44 = "simt_step.if"(%43) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_17 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_17) : (i32) -> ()
        }) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %45 = arith.addi %c144_i32, %0 : i32
        %true_16 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) : (i32) -> ()
      }, {
        %c0_i32_15 = arith.constant 0 : i32
        %41 = arith.addi %0, %c0_i32_15 : i32
        "simt_step.yield"(%41) : (i32) -> ()
      }) : (i1) -> i32
      %c160_i32 = arith.constant 160 : i32
      %35 = arith.addi %c160_i32, %0 : i32
      %true_10 = arith.constant true
      %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    ^bb3(%37: i32):  // no predecessors
      %c0_i32_11 = arith.constant 0 : i32
      %c0_i32_12 = arith.constant 0 : i32
      %38:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_15 = arith.constant 4 : i32
        %41 = arith.muli %arg4, %c4_i32_15 : i32
        %42 = arith.addi %41, %0 : i32
        %c32_i32 = arith.constant 32 : i32
        %43 = arith.addi %c32_i32, %42 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_16 : i32
        "simt_step.condition"(%45, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %48 = arith.muli %arg6, %c4_i32_20 : i32
          %49 = arith.addi %48, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %50 = arith.addi %c52_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_21 : i32
          "simt_step.condition"(%52, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %48 = arith.addi %arg5, %arg6 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %49 = arith.addi %arg6, %c1_i32_20 : i32
          %true_21 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %50 = arith.muli %arg6, %c4_i32_22 : i32
          %51 = arith.addi %c176_i32, %50 : i32
          %52 = arith.addi %51, %0 : i32
          %true_23 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %42 = arith.addi %arg3, %41#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %43 = arith.addi %arg4, %c1_i32 : i32
        %true_17 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %c4_i32_18 = arith.constant 4 : i32
        %44 = arith.muli %arg4, %c4_i32_18 : i32
        %45 = arith.addi %c192_i32, %44 : i32
        %46 = arith.addi %45, %0 : i32
        %true_19 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42, %43) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_13 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %39 = arith.addi %c208_i32, %0 : i32
      %true_14 = arith.constant true
      %40 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%38#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %10:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_3 : i32
      %18 = arith.addi %17, %0 : i32
      %c72_i32 = arith.constant 72 : i32
      %19 = arith.addi %c72_i32, %18 : i32
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
      %c224_i32 = arith.constant 224 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_4 : i32
      %20 = arith.addi %c224_i32, %19 : i32
      %21 = arith.addi %20, %0 : i32
      %true_5 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c92_i32 = arith.constant 92 : i32
    %11 = arith.addi %c92_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_2 : i32
    %14 = "simt_step.if"(%13) ({
      %c96_i32 = arith.constant 96 : i32
      %17 = arith.addi %c96_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_3 : i32
      %20 = "simt_step.if"(%19) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c100_i32 = arith.constant 100 : i32
        %23 = arith.addi %c100_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %25 = simt_step.lane_id
        %26 = arith.index_cast %25 : index to i32
        %27 = "simt_step.switch"(%24, %26) ({
        ^bb0(%arg2: i32):
          %30 = simt_step.lane_id
          %31 = arith.index_cast %30 : index to i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %33 = arith.addi %0, %c2_i32 : i32
          %true_7 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %34 = arith.addi %c240_i32, %0 : i32
          %true_8 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %28 = arith.addi %c256_i32, %0 : i32
        %true_6 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) : (i32) -> ()
      }) : (i1) -> i32
      %c272_i32 = arith.constant 272 : i32
      %21 = arith.addi %c272_i32, %0 : i32
      %true_4 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) : (i32) -> ()
    }, {
      %c104_i32 = arith.constant 104 : i32
      %17 = arith.addi %c104_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_3 : i32
      %20 = "simt_step.if"(%19) ({
        %c108_i32 = arith.constant 108 : i32
        %23 = arith.addi %c108_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_5 : i32
        %26 = "simt_step.if"(%25) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c288_i32 = arith.constant 288 : i32
        %27 = arith.addi %c288_i32, %0 : i32
        %true_6 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %23 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%23) : (i32) -> ()
      }) : (i1) -> i32
      %c304_i32 = arith.constant 304 : i32
      %21 = arith.addi %c304_i32, %0 : i32
      %true_4 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) : (i32) -> ()
    }) : (i1) -> i32
    %c320_i32 = arith.constant 320 : i32
    %15 = arith.addi %c320_i32, %0 : i32
    %true = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

