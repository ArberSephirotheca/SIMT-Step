module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32 : i32
        %5 = arith.cmpi slt, %arg5, %4 : i32
        "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %4 = "simt_step.if"(%3) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_3 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c0_i32_3, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c16_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %5 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%4, %5) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %true = arith.constant true
        %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %5 = arith.addi %c32_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%4) : (i32) -> ()
      }, {
        %c4_i32 = arith.constant 4 : i32
        %4 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %5 = arith.addi %arg0, %c1_i32 : i32
        %6 = "simt_step.switch"(%4, %5) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %7 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
        ^bb1(%8: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%9: i32):  // no predecessors
          %c0_i32_1 = arith.constant 0 : i32
          %10 = arith.addi %arg0, %c0_i32_1 : i32
          "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
        ^bb3(%11: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%6) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      "simt_step.yield"() : () -> ()
    }, {
      %c8_i32 = arith.constant 8 : i32
      %24 = arith.addi %c8_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_4 : i32
      "simt_step.if"(%26) ({
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_12 : i32
        %34 = arith.addi %33, %0 : i32
        %c16_i32 = arith.constant 16 : i32
        %35 = arith.addi %c16_i32, %34 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_13 : i32
        "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %33 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %34 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        "simt_step.yield"(%33, %34) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %26:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_12 : i32
        %34 = arith.addi %33, %0 : i32
        %c36_i32 = arith.constant 36 : i32
        %35 = arith.addi %c36_i32, %34 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_13 : i32
        "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c56_i32 = arith.constant 56 : i32
        %33 = arith.addi %c56_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_12 : i32
        %36 = "simt_step.if"(%35) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32_14 = arith.constant 1 : i32
          %39 = arith.addi %0, %c1_i32_14 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }) : (i1) -> i32
        %37 = arith.addi %arg3, %36 : i32
        %c1_i32 = arith.constant 1 : i32
        %38 = arith.addi %arg4, %c1_i32 : i32
        %true_13 = arith.constant true
        "simt_step.break"(%37, %38) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %28:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_12 : i32
        %34 = arith.addi %33, %0 : i32
        %c60_i32 = arith.constant 60 : i32
        %35 = arith.addi %c60_i32, %34 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_13 : i32
        "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %33 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %34 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        "simt_step.yield"(%33, %34) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%29: i32):  // no predecessors
      %c80_i32 = arith.constant 80 : i32
      %30 = arith.addi %c80_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %32 = "simt_step.switch"(%31, %c0_i32_10) ({
      ^bb0(%arg3: i32):
        %c84_i32 = arith.constant 84 : i32
        %33 = arith.addi %c84_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %35 = arith.addi %0, %c3_i32 : i32
        %36 = "simt_step.switch"(%34, %35) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %38 = arith.addi %c88_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_12 : i32
        %41 = "simt_step.if"(%40) ({
          %c4_i32_13 = arith.constant 4 : i32
          %43 = arith.addi %0, %c4_i32_13 : i32
          "simt_step.yield"(%43) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_11 = arith.constant true
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %11 = arith.addi %c48_i32, %0 : i32
    %true_1 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c92_i32 = arith.constant 92 : i32
    %13 = arith.addi %c92_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %15 = arith.cmpi ne, %14, %c0_i32_2 : i32
    %16 = "simt_step.if"(%15) ({
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) : (i32) -> ()
    }, {
      %c96_i32 = arith.constant 96 : i32
      %24 = arith.addi %c96_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_4 : i32
      %27 = "simt_step.if"(%26) ({
        %c100_i32 = arith.constant 100 : i32
        %30 = arith.addi %c100_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_7 : i32
        %33 = "simt_step.if"(%32) ({
          %c0_i32_9 = arith.constant 0 : i32
          %36 = arith.addi %0, %c0_i32_9 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %c0_i32_9 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_9) : (i32) -> ()
        }) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %34 = arith.addi %c64_i32, %0 : i32
        %true_8 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) : (i32) -> ()
      }, {
        %c104_i32 = arith.constant 104 : i32
        %30 = arith.addi %c104_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_7 = arith.constant 4 : i32
        %32 = arith.addi %0, %c4_i32_7 : i32
        %33 = "simt_step.switch"(%31, %32) ({
        ^bb0(%arg2: i32):
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %37 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %34 = arith.addi %c80_i32, %0 : i32
        %true_9 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) : (i32) -> ()
      }) : (i1) -> i32
      %c96_i32_5 = arith.constant 96 : i32
      %28 = arith.addi %c96_i32_5, %0 : i32
      %true_6 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) : (i32) -> ()
    }) : (i1) -> i32
    %c112_i32 = arith.constant 112 : i32
    %17 = arith.addi %c112_i32, %0 : i32
    %true_3 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c108_i32 = arith.constant 108 : i32
    %19 = arith.addi %c108_i32, %0 : i32
    %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
    %21 = simt_step.subgroup_id
    %22 = arith.index_cast %21 : index to i32
    %23 = "simt_step.switch"(%20, %22) ({
    ^bb0(%arg2: i32):
      %c112_i32_4 = arith.constant 112 : i32
      %24 = arith.addi %c112_i32_4, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_5 : i32
      %27 = "simt_step.if"(%26) ({
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_10 : i32
          %44 = arith.addi %43, %0 : i32
          %c116_i32 = arith.constant 116 : i32
          %45 = arith.addi %c116_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_11 : i32
          "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %43 = arith.addi %arg3, %arg4 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %44 = arith.addi %arg4, %c1_i32_10 : i32
          %true_11 = arith.constant true
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%42#0) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_10 : i32
          %44 = arith.addi %43, %0 : i32
          %c136_i32 = arith.constant 136 : i32
          %45 = arith.addi %c136_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_11 : i32
          "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %43 = arith.addi %arg3, %arg4 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %44 = arith.addi %arg4, %c1_i32_10 : i32
          %true_11 = arith.constant true
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%42#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
    ^bb1(%28: i32):  // no predecessors
      %c156_i32 = arith.constant 156 : i32
      %29 = arith.addi %c156_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_6 : i32
      %32 = "simt_step.if"(%31) ({
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) : (i32) -> ()
      }, {
        %c160_i32 = arith.constant 160 : i32
        %42 = arith.addi %c160_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %44 = "simt_step.switch"(%43, %0) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %c3_i32_8 = arith.constant 3 : i32
          %46 = arith.addi %0, %c3_i32_8 : i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          %c3_i32_9 = arith.constant 3 : i32
          %48 = arith.addi %0, %c3_i32_9 : i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%44) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb2(%33: i32):  // no predecessors
      %c164_i32 = arith.constant 164 : i32
      %34 = arith.addi %c164_i32, %0 : i32
      %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %36 = "simt_step.switch"(%35, %c1_i32) ({
      ^bb0(%arg3: i32):
        %c168_i32 = arith.constant 168 : i32
        %42 = arith.addi %c168_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_8 : i32
        %45 = "simt_step.if"(%44) ({
          %c4_i32_12 = arith.constant 4 : i32
          %61 = arith.addi %0, %c4_i32_12 : i32
          "simt_step.yield"(%61) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb1(%46: i32):  // no predecessors
        %c172_i32 = arith.constant 172 : i32
        %47 = arith.addi %c172_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_9 : i32
        %50 = "simt_step.if"(%49) ({
          %c4_i32_12 = arith.constant 4 : i32
          %61 = arith.addi %0, %c4_i32_12 : i32
          "simt_step.yield"(%61) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
      ^bb2(%51: i32):  // no predecessors
        %c176_i32 = arith.constant 176 : i32
        %52 = arith.addi %c176_i32, %0 : i32
        %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %54 = arith.cmpi ne, %53, %c0_i32_10 : i32
        %55 = "simt_step.if"(%54) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_12 = arith.constant 0 : i32
          %61 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%61) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
      ^bb3(%56: i32):  // no predecessors
        %c180_i32 = arith.constant 180 : i32
        %57 = arith.addi %c180_i32, %0 : i32
        %58 = "simt_step.buffer.load"(%arg1, %57) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %59 = arith.cmpi ne, %58, %c0_i32_11 : i32
        %60 = "simt_step.if"(%59) ({
          %c3_i32_12 = arith.constant 3 : i32
          %61 = arith.addi %0, %c3_i32_12 : i32
          "simt_step.yield"(%61) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
    ^bb3(%37: i32):  // no predecessors
      %c184_i32 = arith.constant 184 : i32
      %38 = arith.addi %c184_i32, %0 : i32
      %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %40 = arith.addi %0, %c3_i32 : i32
      %41 = "simt_step.switch"(%39, %40) ({
      ^bb0(%arg3: i32):
        %c188_i32 = arith.constant 188 : i32
        %42 = arith.addi %c188_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %44 = "simt_step.switch"(%43, %c0_i32_8) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %c4_i32_9 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_9) {fallthrough = false} : (i32) -> ()
        ^bb2(%51: i32):  // no predecessors
          %c2_i32_10 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb3(%52: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          %53 = arith.addi %0, %c4_i32_11 : i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb1(%45: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
      ^bb2(%46: i32):  // no predecessors
        %c192_i32 = arith.constant 192 : i32
        %47 = arith.addi %c192_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %49 = "simt_step.switch"(%48, %0) ({
        ^bb0(%arg4: i32):
          %c2_i32_9 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_9) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

