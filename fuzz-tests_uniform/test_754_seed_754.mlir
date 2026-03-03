module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
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
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32_5 : i32
        %9 = arith.cmpi slt, %arg7, %8 : i32
        "simt_step.condition"(%9, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c3_i32 = arith.constant 3 : i32
        %7 = arith.remsi %arg3, %c3_i32 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %8 = arith.addi %arg0, %c1_i32_5 : i32
        %9 = "simt_step.switch"(%7, %8) ({
        ^bb0(%arg8: i32):
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%11: i32):  // no predecessors
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%12: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          %13 = arith.addi %arg0, %c2_i32_8 : i32
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32_6 = arith.constant 1 : i32
        %10 = arith.addi %arg7, %c1_i32_6 : i32
        "simt_step.continue"(%9, %10) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%5#0, %6) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %c2_i32, %0#0 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_14 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_14 : i32
      %20 = arith.addi %19, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %21 = arith.addi %c8_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_15 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_15 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_14 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_14 : i32
      %20 = arith.addi %19, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %21 = arith.addi %c28_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_15 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_15 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.break"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_6 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %9 = arith.addi %c32_i32, %0 : i32
    %true_7 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_8 = arith.constant 0 : i32
    %c0_i32_9 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_14 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_14 : i32
      %20 = arith.addi %19, %0 : i32
      %c48_i32_15 = arith.constant 48 : i32
      %21 = arith.addi %c48_i32_15, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_16 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_16 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_10 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %12 = arith.addi %c48_i32, %0 : i32
    %true_11 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c68_i32 = arith.constant 68 : i32
    %14 = arith.addi %c68_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %16 = "simt_step.switch"(%15, %c2_i32) ({
    ^bb0(%arg2: i32):
      %c72_i32 = arith.constant 72 : i32
      %19 = arith.addi %c72_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_14 = arith.constant 0 : i32
      %21 = "simt_step.switch"(%20, %c0_i32_14) ({
      ^bb0(%arg3: i32):
        %c76_i32 = arith.constant 76 : i32
        %34 = arith.addi %c76_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_22 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_22 : i32
        %37 = "simt_step.if"(%36) ({
          %c4_i32_28 = arith.constant 4 : i32
          %46 = arith.addi %0, %c4_i32_28 : i32
          "simt_step.yield"(%46) : (i32) -> ()
        }, {
          %c2_i32_28 = arith.constant 2 : i32
          %46 = arith.addi %0, %c2_i32_28 : i32
          "simt_step.yield"(%46) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c0_i32_23 = arith.constant 0 : i32
        %c0_i32_24 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_23, %c0_i32_24) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_28 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_28 : i32
          %47 = arith.addi %46, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %48 = arith.addi %c80_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_29 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_29 : i32
          "simt_step.condition"(%50, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %46 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_25 = arith.constant true
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %c4_i32_26 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_26) {fallthrough = true} : (i32) -> ()
      ^bb3(%41: i32):  // no predecessors
        %c100_i32 = arith.constant 100 : i32
        %42 = arith.addi %c100_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_27 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_27 : i32
        %45 = "simt_step.if"(%44) ({
          %c2_i32_28 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_28) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %46 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%46) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_15 = arith.constant true
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c104_i32 = arith.constant 104 : i32
      %23 = arith.addi %c104_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_16 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_16 : i32
      %26 = "simt_step.if"(%25) ({
        %c0_i32_22 = arith.constant 0 : i32
        %c0_i32_23 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_22, %c0_i32_23) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_25 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_25 : i32
          %36 = arith.addi %35, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %37 = arith.addi %c108_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_26 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_26 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.break"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_24 = arith.constant true
        "simt_step.yield"(%34#0) : (i32) -> ()
      }, {
        %c128_i32 = arith.constant 128 : i32
        %34 = arith.addi %c128_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %36 = arith.addi %0, %c3_i32 : i32
        %37 = "simt_step.switch"(%35, %36) ({
        ^bb0(%arg3: i32):
          %c0_i32_23 = arith.constant 0 : i32
          %38 = arith.addi %0, %c0_i32_23 : i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %c2_i32_24 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_24) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_22 = arith.constant true
        "simt_step.yield"(%37) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c0_i32_17 = arith.constant 0 : i32
      %c0_i32_18 = arith.constant 0 : i32
      %28:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_22 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_22 : i32
        %35 = arith.addi %34, %0 : i32
        %c132_i32 = arith.constant 132 : i32
        %36 = arith.addi %c132_i32, %35 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_23 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_23 : i32
        "simt_step.condition"(%38, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c152_i32 = arith.constant 152 : i32
        %34 = arith.addi %c152_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_22 = arith.constant 0 : i32
        %36 = arith.addi %0, %c0_i32_22 : i32
        %37 = "simt_step.switch"(%35, %36) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c1_i32_24 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_24) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_23 = arith.constant true
        %38 = arith.addi %arg3, %37 : i32
        %c1_i32 = arith.constant 1 : i32
        %39 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.continue"(%38, %39) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_19 = arith.constant true
      "simt_step.yield"(%28#0) {fallthrough = true} : (i32) -> ()
    ^bb3(%29: i32):  // no predecessors
      %c156_i32 = arith.constant 156 : i32
      %30 = arith.addi %c156_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32_20 = arith.constant 2 : i32
      %32 = arith.addi %0, %c2_i32_20 : i32
      %33 = "simt_step.switch"(%31, %32) ({
      ^bb0(%arg3: i32):
        %c0_i32_22 = arith.constant 0 : i32
        %c0_i32_23 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_22, %c0_i32_23) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_28 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_28 : i32
          %49 = arith.addi %48, %0 : i32
          %c160_i32 = arith.constant 160 : i32
          %50 = arith.addi %c160_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_29 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_29 : i32
          "simt_step.condition"(%52, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %48 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %49 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_24 = arith.constant true
        "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c180_i32 = arith.constant 180 : i32
        %36 = arith.addi %c180_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = "simt_step.switch"(%37, %0) ({
        ^bb0(%arg4: i32):
          %c2_i32_28 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_28) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_25 = arith.constant true
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c184_i32 = arith.constant 184 : i32
        %40 = arith.addi %c184_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %42 = "simt_step.switch"(%41, %0) ({
        ^bb0(%arg4: i32):
          %c0_i32_28 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_28) {fallthrough = true} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%50: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_26 = arith.constant true
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      ^bb3(%43: i32):  // no predecessors
        %c188_i32 = arith.constant 188 : i32
        %44 = arith.addi %c188_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_27 = arith.constant 0 : i32
        %46 = arith.cmpi ne, %45, %c0_i32_27 : i32
        %47 = "simt_step.if"(%46) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c0_i32_28 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_28) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_21 = arith.constant true
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_12 = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %17 = arith.addi %c64_i32, %0 : i32
    %true_13 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

