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
      %c0_i32_2 = arith.constant 0 : i32
      %1:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_3 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32_3 : i32
        %5 = arith.cmpi slt, %arg7, %4 : i32
        "simt_step.condition"(%5, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %3 = simt_step.lane_id
        %4 = arith.index_cast %3 : index to i32
        %5 = "simt_step.switch"(%arg3, %4) ({
        ^bb0(%arg8: i32):
          %true = arith.constant true
          %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_4 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.muli %arg7, %c4_i32 : i32
          %9 = arith.addi %c0_i32_4, %8 : i32
          %10 = arith.addi %9, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
        ^bb1(%11: i32):  // no predecessors
          %true_5 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %13 = arith.muli %arg7, %c4_i32_6 : i32
          %14 = arith.addi %c16_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32_3 = arith.constant 1 : i32
        %6 = arith.addi %arg7, %c1_i32_3 : i32
        "simt_step.yield"(%5, %6) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%1#0, %2) : (i32, i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %21 = arith.muli %arg3, %c4_i32_6 : i32
        %22 = arith.addi %21, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %23 = arith.addi %c12_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_7 : i32
        "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c32_i32 = arith.constant 32 : i32
        %21 = arith.addi %c32_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_6 : i32
        %24 = "simt_step.if"(%23) ({
          %c1_i32_12 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_12) : (i32) -> ()
        }, {
          %33 = simt_step.subgroup_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        %c32_i32_7 = arith.constant 32 : i32
        %25 = arith.addi %c32_i32_7, %0 : i32
        %true_8 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %27 = arith.addi %arg2, %24 : i32
        %c1_i32 = arith.constant 1 : i32
        %28 = arith.addi %arg3, %c1_i32 : i32
        %true_9 = arith.constant true
        %c48_i32 = arith.constant 48 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %29 = arith.muli %arg3, %c4_i32_10 : i32
        %30 = arith.addi %c48_i32, %29 : i32
        %31 = arith.addi %30, %0 : i32
        %true_11 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%20#0) : (i32) -> ()
    }, {
      %c36_i32 = arith.constant 36 : i32
      %20 = arith.addi %c36_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_4 : i32
      %23 = "simt_step.if"(%22) ({
        %c40_i32 = arith.constant 40 : i32
        %26 = arith.addi %c40_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_6 : i32
        %29 = "simt_step.if"(%28) ({
          %32 = simt_step.lane_id
          %33 = arith.index_cast %32 : index to i32
          "simt_step.yield"(%33) : (i32) -> ()
        }, {
          %c0_i32_8 = arith.constant 0 : i32
          %32 = arith.addi %0, %c0_i32_8 : i32
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %30 = arith.addi %c64_i32, %0 : i32
        %true_7 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        %26 = arith.addi %0, %c0_i32_6 : i32
        "simt_step.yield"(%26) : (i32) -> ()
      }) : (i1) -> i32
      %c80_i32 = arith.constant 80 : i32
      %24 = arith.addi %c80_i32, %0 : i32
      %true_5 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) : (i32) -> ()
    }) : (i1) -> i32
    %c96_i32 = arith.constant 96 : i32
    %9 = arith.addi %c96_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c44_i32 = arith.constant 44 : i32
    %11 = arith.addi %c44_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
    %14 = "simt_step.if"(%13) ({
      %c48_i32 = arith.constant 48 : i32
      %20 = arith.addi %c48_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = simt_step.subgroup_id
      %23 = arith.index_cast %22 : index to i32
      %24 = "simt_step.switch"(%21, %23) ({
      ^bb0(%arg2: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_10 : i32
          %36 = arith.addi %35, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %37 = arith.addi %c52_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_11 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          %true_10 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_11 : i32
          %38 = arith.addi %c112_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_12 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %27 = arith.addi %c72_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_6 : i32
        %30 = "simt_step.if"(%29) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %31 = arith.addi %c128_i32, %0 : i32
        %true_7 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_8 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %33 = arith.addi %c144_i32, %0 : i32
        %true_9 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%24) : (i32) -> ()
    }, {
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %21 = arith.muli %arg3, %c4_i32_6 : i32
        %22 = arith.addi %21, %0 : i32
        %c76_i32 = arith.constant 76 : i32
        %23 = arith.addi %c76_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_7 : i32
        "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %21 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg3, %c1_i32 : i32
        %true_6 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %23 = arith.muli %arg3, %c4_i32_7 : i32
        %24 = arith.addi %c160_i32, %23 : i32
        %25 = arith.addi %24, %0 : i32
        %true_8 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%20#0) : (i32) -> ()
    }) : (i1) -> i32
    %c176_i32 = arith.constant 176 : i32
    %15 = arith.addi %c176_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c96_i32_3 = arith.constant 96 : i32
    %17 = arith.addi %c96_i32_3, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %19 = "simt_step.switch"(%18, %c2_i32) ({
    ^bb0(%arg2: i32):
      %c100_i32 = arith.constant 100 : i32
      %20 = arith.addi %c100_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = simt_step.lane_id
      %23 = arith.index_cast %22 : index to i32
      %24 = "simt_step.switch"(%21, %23) ({
      ^bb0(%arg3: i32):
        %c2_i32_16 = arith.constant 2 : i32
        %45 = arith.addi %0, %c2_i32_16 : i32
        %true_17 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %46 = arith.addi %c192_i32, %0 : i32
        %true_18 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb1(%48: i32):  // no predecessors
        %49 = simt_step.lane_id
        %50 = arith.index_cast %49 : index to i32
        "simt_step.yield"(%50) {fallthrough = true} : (i32) -> ()
      ^bb2(%51: i32):  // no predecessors
        %c0_i32_19 = arith.constant 0 : i32
        %c0_i32_20 = arith.constant 0 : i32
        %52:2 = "simt_step.loop"(%c0_i32_19, %c0_i32_20) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %61 = arith.muli %arg5, %c4_i32_23 : i32
          %62 = arith.addi %61, %0 : i32
          %c104_i32 = arith.constant 104 : i32
          %63 = arith.addi %c104_i32, %62 : i32
          %64 = "simt_step.buffer.load"(%arg1, %63) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %65 = arith.cmpi ne, %64, %c0_i32_24 : i32
          "simt_step.condition"(%65, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %61 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %62 = arith.addi %arg5, %c1_i32 : i32
          %true_23 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_24 = arith.constant 4 : i32
          %63 = arith.muli %arg5, %c4_i32_24 : i32
          %64 = arith.addi %c208_i32, %63 : i32
          %65 = arith.addi %64, %0 : i32
          %true_25 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%61, %62) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%52#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%53: i32):  // no predecessors
        %c124_i32 = arith.constant 124 : i32
        %54 = arith.addi %c124_i32, %0 : i32
        %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
        %56 = simt_step.lane_id
        %57 = arith.index_cast %56 : index to i32
        %58 = "simt_step.switch"(%55, %57) ({
        ^bb0(%arg4: i32):
          %61 = simt_step.subgroup_id
          %62 = arith.index_cast %61 : index to i32
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        ^bb1(%63: i32):  // no predecessors
          %64 = simt_step.lane_id
          %65 = arith.index_cast %64 : index to i32
          %true_23 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %66 = arith.addi %c224_i32, %0 : i32
          %true_24 = arith.constant true
          %67 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        ^bb2(%68: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %69 = arith.addi %0, %c3_i32 : i32
          %true_25 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %70 = arith.addi %c240_i32, %0 : i32
          %true_26 = arith.constant true
          %71 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %70, %71) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%69) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_21 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %59 = arith.addi %c256_i32, %0 : i32
        %true_22 = arith.constant true
        %60 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %25 = arith.addi %c272_i32, %0 : i32
      %true_5 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_6 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %27 = arith.addi %c288_i32, %0 : i32
      %true_7 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
    ^bb1(%29: i32):  // no predecessors
      %c128_i32 = arith.constant 128 : i32
      %30 = arith.addi %c128_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %32 = arith.cmpi ne, %31, %c0_i32_8 : i32
      %33 = "simt_step.if"(%32) ({
        %c132_i32 = arith.constant 132 : i32
        %45 = arith.addi %c132_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_16 : i32
        %48 = "simt_step.if"(%47) ({
          %c3_i32 = arith.constant 3 : i32
          %51 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%51) : (i32) -> ()
        }, {
          %c0_i32_18 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_18) : (i32) -> ()
        }) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %49 = arith.addi %c304_i32, %0 : i32
        %true_17 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) : (i32) -> ()
      }, {
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %45:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %46 = arith.muli %arg4, %c4_i32_18 : i32
          %47 = arith.addi %46, %0 : i32
          %c136_i32 = arith.constant 136 : i32
          %48 = arith.addi %c136_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_19 : i32
          "simt_step.condition"(%50, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %46 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg4, %c1_i32 : i32
          %true_18 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %48 = arith.muli %arg4, %c4_i32_19 : i32
          %49 = arith.addi %c320_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_20 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%45#0) : (i32) -> ()
      }) : (i1) -> i32
      %c336_i32 = arith.constant 336 : i32
      %34 = arith.addi %c336_i32, %0 : i32
      %true_9 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_10 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %36 = arith.addi %c352_i32, %0 : i32
      %true_11 = arith.constant true
      %37 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%33) {fallthrough = true} : (i32) -> ()
    ^bb2(%38: i32):  // no predecessors
      %39 = simt_step.subgroup_id
      %40 = arith.index_cast %39 : index to i32
      "simt_step.yield"(%40) {fallthrough = true} : (i32) -> ()
    ^bb3(%41: i32):  // no predecessors
      %c0_i32_12 = arith.constant 0 : i32
      %c0_i32_13 = arith.constant 0 : i32
      %42:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_16 = arith.constant 4 : i32
        %45 = arith.muli %arg4, %c4_i32_16 : i32
        %46 = arith.addi %45, %0 : i32
        %c156_i32 = arith.constant 156 : i32
        %47 = arith.addi %c156_i32, %46 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_17 : i32
        "simt_step.condition"(%49, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %45:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %52 = arith.muli %arg6, %c4_i32_21 : i32
          %53 = arith.addi %52, %0 : i32
          %c176_i32_22 = arith.constant 176 : i32
          %54 = arith.addi %c176_i32_22, %53 : i32
          %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %56 = arith.cmpi ne, %55, %c0_i32_23 : i32
          "simt_step.condition"(%56, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %52 = arith.addi %arg5, %arg6 : i32
          %c1_i32_21 = arith.constant 1 : i32
          %53 = arith.addi %arg6, %c1_i32_21 : i32
          %true_22 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %c4_i32_23 = arith.constant 4 : i32
          %54 = arith.muli %arg6, %c4_i32_23 : i32
          %55 = arith.addi %c368_i32, %54 : i32
          %56 = arith.addi %55, %0 : i32
          %true_24 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52, %53) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %46 = arith.addi %arg3, %45#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %47 = arith.addi %arg4, %c1_i32 : i32
        %true_18 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %c4_i32_19 = arith.constant 4 : i32
        %48 = arith.muli %arg4, %c4_i32_19 : i32
        %49 = arith.addi %c384_i32, %48 : i32
        %50 = arith.addi %49, %0 : i32
        %true_20 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46, %47) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_14 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %43 = arith.addi %c400_i32, %0 : i32
      %true_15 = arith.constant true
      %44 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%42#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

