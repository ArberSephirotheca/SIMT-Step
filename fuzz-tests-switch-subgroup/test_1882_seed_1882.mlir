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
      %11 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %11, %c1_i32 : i32
      %13 = arith.cmpi slt, %arg5, %12 : i32
      "simt_step.condition"(%13, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true_5 = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %c4_i32 = arith.constant 4 : i32
      %12 = arith.muli %arg5, %c4_i32 : i32
      %13 = arith.addi %c16_i32, %12 : i32
      %14 = arith.addi %13, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%11, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
    %c2_i32 = arith.constant 2 : i32
    %5 = arith.remsi %arg3, %c2_i32 : i32
    %6 = "simt_step.switch"(%5, %arg0) ({
    ^bb0(%arg4: i32):
      %c2_i32_5 = arith.constant 2 : i32
      %11 = arith.remsi %arg3, %c2_i32_5 : i32
      %12 = "simt_step.switch"(%11, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32 : i32
          %24 = arith.cmpi slt, %arg7, %23 : i32
          "simt_step.condition"(%24, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_15 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %23 = arith.muli %arg7, %c4_i32 : i32
          %24 = arith.addi %c32_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%22, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32 : i32
          %24 = arith.cmpi slt, %arg7, %23 : i32
          "simt_step.condition"(%24, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_15 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %23 = arith.muli %arg7, %c4_i32 : i32
          %24 = arith.addi %c48_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%22, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32 : i32
          %24 = arith.cmpi slt, %arg7, %23 : i32
          "simt_step.condition"(%24, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_15 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %23 = arith.muli %arg7, %c4_i32 : i32
          %24 = arith.addi %c64_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%22, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      %c80_i32 = arith.constant 80 : i32
      %14 = arith.addi %c80_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %17 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %17, %c1_i32 : i32
        %19 = arith.cmpi slt, %arg6, %18 : i32
        "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32_11 : i32
          %21 = arith.cmpi slt, %arg8, %20 : i32
          "simt_step.condition"(%21, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_11 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.muli %arg8, %c4_i32 : i32
          %21 = arith.addi %c96_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_12 = arith.constant 1 : i32
          %23 = arith.addi %arg8, %c1_i32_12 : i32
          "simt_step.yield"(%19, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%17#0, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    %c112_i32 = arith.constant 112 : i32
    %8 = arith.addi %c112_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
    %10 = arith.select %9, %4, %6 : i32
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
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %25 = arith.muli %arg3, %c4_i32_7 : i32
        %26 = arith.addi %25, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %27 = arith.addi %c12_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_8 : i32
        "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %25 = simt_step.lane_id
        %26 = arith.index_cast %25 : index to i32
        %27 = arith.addi %arg2, %26 : i32
        %c1_i32 = arith.constant 1 : i32
        %28 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %29 = arith.muli %arg3, %c4_i32_8 : i32
        %30 = arith.addi %c128_i32, %29 : i32
        %31 = arith.addi %30, %0 : i32
        %true_9 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%24#0) : (i32) -> ()
    }, {
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %25 = arith.muli %arg3, %c4_i32_7 : i32
        %26 = arith.addi %25, %0 : i32
        %c32_i32 = arith.constant 32 : i32
        %27 = arith.addi %c32_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_8 : i32
        "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %25 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %27 = arith.muli %arg3, %c4_i32_8 : i32
        %28 = arith.addi %c144_i32, %27 : i32
        %29 = arith.addi %28, %0 : i32
        %true_9 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%24#0) : (i32) -> ()
    }) : (i1) -> i32
    %c160_i32 = arith.constant 160 : i32
    %9 = arith.addi %c160_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c52_i32 = arith.constant 52 : i32
    %11 = arith.addi %c52_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
    %14 = "simt_step.if"(%13) ({
      %c56_i32 = arith.constant 56 : i32
      %24 = arith.addi %c56_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %26 = arith.addi %0, %c1_i32 : i32
      %27 = "simt_step.switch"(%25, %26) ({
      ^bb0(%arg2: i32):
        %c3_i32 = arith.constant 3 : i32
        %28 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_15 : i32
          %46 = arith.addi %45, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %47 = arith.addi %c60_i32, %46 : i32
          %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %49 = arith.cmpi ne, %48, %c0_i32_16 : i32
          "simt_step.condition"(%49, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %45 = arith.addi %arg3, %arg4 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %46 = arith.addi %arg4, %c1_i32_15 : i32
          %true_16 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %47 = arith.muli %arg4, %c4_i32_17 : i32
          %48 = arith.addi %c176_i32, %47 : i32
          %49 = arith.addi %48, %0 : i32
          %true_18 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45, %46) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%31: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %32 = arith.addi %c80_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %34 = simt_step.subgroup_id
        %35 = arith.index_cast %34 : index to i32
        %36 = "simt_step.switch"(%33, %35) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %true_15 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %46 = arith.addi %c192_i32, %0 : i32
          %true_16 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          %true_17 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %49 = arith.addi %c208_i32, %0 : i32
          %true_18 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%51: i32):  // no predecessors
          %c1_i32_19 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %37 = arith.addi %c224_i32, %0 : i32
        %true_8 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_9 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %39 = arith.addi %c240_i32, %0 : i32
        %true_10 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb3(%41: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_15 : i32
          %46 = arith.addi %45, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %47 = arith.addi %c84_i32, %46 : i32
          %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %49 = arith.cmpi ne, %48, %c0_i32_16 : i32
          "simt_step.condition"(%49, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %45 = arith.addi %arg3, %arg4 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %46 = arith.addi %arg4, %c1_i32_15 : i32
          %true_16 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %47 = arith.muli %arg4, %c4_i32_17 : i32
          %48 = arith.addi %c256_i32, %47 : i32
          %49 = arith.addi %48, %0 : i32
          %true_18 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45, %46) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %43 = arith.addi %c272_i32, %0 : i32
        %true_14 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%27) : (i32) -> ()
    }, {
      %c104_i32 = arith.constant 104 : i32
      %24 = arith.addi %c104_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_5 : i32
      %27 = "simt_step.if"(%26) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %31 = arith.muli %arg3, %c4_i32_9 : i32
          %32 = arith.addi %31, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %33 = arith.addi %c108_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_10 : i32
          "simt_step.condition"(%35, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %31 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg3, %c1_i32 : i32
          %true_9 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %33 = arith.muli %arg3, %c4_i32_10 : i32
          %34 = arith.addi %c288_i32, %33 : i32
          %35 = arith.addi %34, %0 : i32
          %true_11 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %31 = arith.muli %arg3, %c4_i32_9 : i32
          %32 = arith.addi %31, %0 : i32
          %c128_i32 = arith.constant 128 : i32
          %33 = arith.addi %c128_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_10 : i32
          "simt_step.condition"(%35, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %31 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg3, %c1_i32 : i32
          %true_9 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %33 = arith.muli %arg3, %c4_i32_10 : i32
          %34 = arith.addi %c304_i32, %33 : i32
          %35 = arith.addi %34, %0 : i32
          %true_11 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) : (i32) -> ()
      }) : (i1) -> i32
      %c320_i32 = arith.constant 320 : i32
      %28 = arith.addi %c320_i32, %0 : i32
      %true_6 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) : (i32) -> ()
    }) : (i1) -> i32
    %c336_i32 = arith.constant 336 : i32
    %15 = arith.addi %c336_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c148_i32 = arith.constant 148 : i32
    %17 = arith.addi %c148_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %19 = simt_step.subgroup_id
    %20 = arith.index_cast %19 : index to i32
    %21 = "simt_step.switch"(%18, %20) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c152_i32 = arith.constant 152 : i32
      %25 = arith.addi %c152_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %27 = simt_step.lane_id
      %28 = arith.index_cast %27 : index to i32
      %29 = "simt_step.switch"(%26, %28) ({
      ^bb0(%arg3: i32):
        %c156_i32 = arith.constant 156 : i32
        %45 = arith.addi %c156_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_11 : i32
        %48 = "simt_step.if"(%47) ({
          %c0_i32_22 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_22) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c352_i32 = arith.constant 352 : i32
        %49 = arith.addi %c352_i32, %0 : i32
        %true_12 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_13 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %51 = arith.addi %c368_i32, %0 : i32
        %true_14 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      ^bb1(%53: i32):  // no predecessors
        %c160_i32_15 = arith.constant 160 : i32
        %54 = arith.addi %c160_i32_15, %0 : i32
        %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %56 = arith.cmpi ne, %55, %c0_i32_16 : i32
        %57 = "simt_step.if"(%56) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c384_i32 = arith.constant 384 : i32
        %58 = arith.addi %c384_i32, %0 : i32
        %true_17 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_18 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %60 = arith.addi %c400_i32, %0 : i32
        %true_19 = arith.constant true
        %61 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
      ^bb2(%62: i32):  // no predecessors
        %c164_i32 = arith.constant 164 : i32
        %63 = arith.addi %c164_i32, %0 : i32
        %64 = "simt_step.buffer.load"(%arg1, %63) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_20 = arith.constant 0 : i32
        %65 = arith.cmpi ne, %64, %c0_i32_20 : i32
        %66 = "simt_step.if"(%65) ({
          %69 = simt_step.subgroup_id
          %70 = arith.index_cast %69 : index to i32
          "simt_step.yield"(%70) : (i32) -> ()
        }, {
          %c1_i32_22 = arith.constant 1 : i32
          %69 = arith.addi %0, %c1_i32_22 : i32
          "simt_step.yield"(%69) : (i32) -> ()
        }) : (i1) -> i32
        %c416_i32 = arith.constant 416 : i32
        %67 = arith.addi %c416_i32, %0 : i32
        %true_21 = arith.constant true
        %68 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%66) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %c432_i32 = arith.constant 432 : i32
      %30 = arith.addi %c432_i32, %0 : i32
      %true_6 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb2(%32: i32):  // no predecessors
      %c168_i32 = arith.constant 168 : i32
      %33 = arith.addi %c168_i32, %0 : i32
      %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %35 = "simt_step.switch"(%34, %c1_i32) ({
      ^bb0(%arg3: i32):
        %c172_i32 = arith.constant 172 : i32
        %45 = arith.addi %c172_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_11 : i32
        %48 = "simt_step.if"(%47) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %62 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%62) : (i32) -> ()
        }) : (i1) -> i32
        %c448_i32 = arith.constant 448 : i32
        %49 = arith.addi %c448_i32, %0 : i32
        %true_12 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      ^bb1(%51: i32):  // no predecessors
        %52 = simt_step.subgroup_id
        %53 = arith.index_cast %52 : index to i32
        %true_13 = arith.constant true
        %c464_i32 = arith.constant 464 : i32
        %54 = arith.addi %c464_i32, %0 : i32
        %true_14 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53) {fallthrough = true} : (i32) -> ()
      ^bb2(%56: i32):  // no predecessors
        %c176_i32 = arith.constant 176 : i32
        %57 = arith.addi %c176_i32, %0 : i32
        %58 = "simt_step.buffer.load"(%arg1, %57) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_15 = arith.constant 1 : i32
        %59 = "simt_step.switch"(%58, %c1_i32_15) ({
        ^bb0(%arg4: i32):
          %62 = simt_step.lane_id
          %63 = arith.index_cast %62 : index to i32
          %true_18 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %64 = arith.addi %c480_i32, %0 : i32
          %true_19 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        ^bb1(%66: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        %c496_i32 = arith.constant 496 : i32
        %60 = arith.addi %c496_i32, %0 : i32
        %true_17 = arith.constant true
        %61 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
    ^bb3(%36: i32):  // no predecessors
      %c180_i32 = arith.constant 180 : i32
      %37 = arith.addi %c180_i32, %0 : i32
      %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %39 = arith.cmpi ne, %38, %c0_i32_7 : i32
      %40 = "simt_step.if"(%39) ({
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) : (i32) -> ()
      }, {
        %c0_i32_11 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_11) : (i32) -> ()
      }) : (i1) -> i32
      %c512_i32 = arith.constant 512 : i32
      %41 = arith.addi %c512_i32, %0 : i32
      %true_8 = arith.constant true
      %42 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_9 = arith.constant true
      %c528_i32 = arith.constant 528 : i32
      %43 = arith.addi %c528_i32, %0 : i32
      %true_10 = arith.constant true
      %44 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c544_i32 = arith.constant 544 : i32
    %22 = arith.addi %c544_i32, %0 : i32
    %true_4 = arith.constant true
    %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

