module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %8, %c1_i32 : i32
      %10 = arith.cmpi slt, %arg5, %9 : i32
      "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32 = arith.constant 3 : i32
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%c3_i32, %8) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %3:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %8, %c1_i32 : i32
      %10 = arith.cmpi slt, %arg5, %9 : i32
      "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32_8 : i32
        %14 = arith.cmpi slt, %arg7, %13 : i32
        "simt_step.condition"(%14, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32 : i32
        %13 = "simt_step.switch"(%12, %arg0) ({
        ^bb0(%arg8: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = true} : (i32) -> ()
        ^bb1(%15: i32):  // no predecessors
          %c1_i32_9 = arith.constant 1 : i32
          %16 = arith.addi %arg0, %c1_i32_9 : i32
          "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
        ^bb2(%17: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb3(%18: i32):  // no predecessors
          %c4_i32_10 = arith.constant 4 : i32
          %19 = arith.addi %arg0, %c4_i32_10 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32_8 = arith.constant 1 : i32
        %14 = arith.addi %arg7, %c1_i32_8 : i32
        "simt_step.break"(%13, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %9 = simt_step.subgroup_id
      %10 = arith.index_cast %9 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%8#0, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_4 = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %5 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_5 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
    %7 = arith.select %6, %0#0, %3#0 : i32
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
      %c12_i32 = arith.constant 12 : i32
      %23 = arith.addi %c12_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_5 : i32
      %26 = "simt_step.if"(%25) ({
        %c16_i32 = arith.constant 16 : i32
        %38 = arith.addi %c16_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %40 = "simt_step.switch"(%39, %0) ({
        ^bb0(%arg3: i32):
          %c0_i32_12 = arith.constant 0 : i32
          %41 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%40) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %28 = arith.addi %c20_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %30 = arith.cmpi ne, %29, %c0_i32_6 : i32
      %31 = "simt_step.if"(%30) ({
        %c24_i32 = arith.constant 24 : i32
        %38 = arith.addi %c24_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_11 : i32
        %41 = "simt_step.if"(%40) ({
          %c4_i32_12 = arith.constant 4 : i32
          %42 = arith.addi %0, %c4_i32_12 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) : (i32) -> ()
      }, {
        %c0_i32_11 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_11) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
    ^bb2(%32: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %33 = arith.addi %c28_i32, %0 : i32
      %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
      %35 = "simt_step.switch"(%34, %0) ({
      ^bb0(%arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %38 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c32_i32_11 = arith.constant 32 : i32
        %40 = arith.addi %c32_i32_11, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_12 : i32
        %43 = "simt_step.if"(%42) ({
          %c4_i32_16 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_16) : (i32) -> ()
        }, {
          %c0_i32_16 = arith.constant 0 : i32
          %53 = arith.addi %0, %c0_i32_16 : i32
          "simt_step.yield"(%53) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %45 = arith.addi %c36_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %47 = arith.addi %0, %c2_i32 : i32
        %48 = "simt_step.switch"(%46, %47) ({
        ^bb0(%arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %53 = arith.addi %0, %c4_i32_16 : i32
          "simt_step.yield"(%53) {fallthrough = true} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %c2_i32_17 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      ^bb3(%49: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %50 = arith.addi %c40_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_14 = arith.constant 1 : i32
        %52 = "simt_step.switch"(%51, %c1_i32_14) ({
        ^bb0(%arg4: i32):
          %c1_i32_16 = arith.constant 1 : i32
          %53 = arith.addi %0, %c1_i32_16 : i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %c4_i32_17 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_17) {fallthrough = true} : (i32) -> ()
        ^bb2(%55: i32):  // no predecessors
          %c4_i32_18 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_18) {fallthrough = true} : (i32) -> ()
        ^bb3(%56: i32):  // no predecessors
          %c1_i32_19 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
    ^bb3(%36: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %37:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %38 = arith.muli %arg4, %c4_i32_11 : i32
        %39 = arith.addi %38, %0 : i32
        %c44_i32 = arith.constant 44 : i32
        %40 = arith.addi %c44_i32, %39 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_12 : i32
        "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32_11 = arith.constant 64 : i32
        %38 = arith.addi %c64_i32_11, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_12 : i32
        %41 = "simt_step.if"(%40) ({
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) : (i32) -> ()
        }, {
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        %42 = arith.addi %arg3, %41 : i32
        %c1_i32 = arith.constant 1 : i32
        %43 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%42, %43) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %10 = arith.addi %c32_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c68_i32 = arith.constant 68 : i32
    %12 = arith.addi %c68_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_1 : i32
    %15 = "simt_step.if"(%14) ({
      "simt_step.yield"(%0) : (i32) -> ()
    }, {
      %23 = simt_step.subgroup_id
      %24 = arith.index_cast %23 : index to i32
      "simt_step.yield"(%24) : (i32) -> ()
    }) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %16 = arith.addi %c48_i32, %0 : i32
    %true_2 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c72_i32 = arith.constant 72 : i32
    %18 = arith.addi %c72_i32, %0 : i32
    %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
    %20 = "simt_step.switch"(%19, %0) ({
    ^bb0(%arg2: i32):
      %c76_i32 = arith.constant 76 : i32
      %23 = arith.addi %c76_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_5 : i32
      %26 = "simt_step.if"(%25) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c80_i32 = arith.constant 80 : i32
        %29 = arith.addi %c80_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %31 = arith.addi %0, %c0_i32_9 : i32
        %32 = "simt_step.switch"(%30, %31) ({
        ^bb0(%arg3: i32):
          %c0_i32_11 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_11) {fallthrough = true} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %28:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_9 : i32
        %30 = arith.addi %29, %0 : i32
        %c84_i32 = arith.constant 84 : i32
        %31 = arith.addi %c84_i32, %30 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_10 : i32
        "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %32 = arith.muli %arg6, %c4_i32_12 : i32
          %33 = arith.addi %32, %0 : i32
          %c104_i32 = arith.constant 104 : i32
          %34 = arith.addi %c104_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_13 : i32
          "simt_step.condition"(%36, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %32 = arith.addi %arg5, %arg6 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %33 = arith.addi %arg6, %c1_i32_12 : i32
          "simt_step.break"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        %30 = arith.addi %arg3, %29#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %21 = arith.addi %c64_i32, %0 : i32
    %true_4 = arith.constant true
    %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

