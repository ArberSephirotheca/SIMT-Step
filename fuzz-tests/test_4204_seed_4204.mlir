module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.addi %arg0, %c0_i32_0 : i32
    %4 = "simt_step.switch"(%2, %3) ({
    ^bb0(%arg4: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %7 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %8 = "simt_step.if"(%7) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32 : i32
          %19 = arith.cmpi slt, %arg6, %18 : i32
          "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32 = arith.constant 1 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %17 = arith.addi %arg6, %c1_i32_7 : i32
          "simt_step.yield"(%c1_i32, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%16#0) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %arg0, %c1_i32 : i32
        "simt_step.yield"(%16) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    ^bb1(%9: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %11 = "simt_step.if"(%10) ({
        %c0_i32_5 = arith.constant 0 : i32
        %16 = arith.addi %arg0, %c0_i32_5 : i32
        "simt_step.yield"(%16) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32 : i32
          %19 = arith.cmpi slt, %arg6, %18 : i32
          "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c0_i32_7 = arith.constant 0 : i32
          %17 = arith.addi %arg0, %c0_i32_7 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%17, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%16#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %14 = "simt_step.if"(%13) ({
        %c0_i32_5 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %17 = "simt_step.if"(%16) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%17) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32 : i32
          %19 = arith.cmpi slt, %arg6, %18 : i32
          "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c0_i32_7 = arith.constant 0 : i32
          %17 = arith.addi %arg0, %c0_i32_7 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%17, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%16#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
    ^bb3(%15: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %6 = arith.select %5, %0, %4 : i32
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
      %c12_i32 = arith.constant 12 : i32
      %17 = arith.addi %c12_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = "simt_step.switch"(%18, %0) ({
      ^bb0(%arg2: i32):
        %c16_i32 = arith.constant 16 : i32
        %20 = arith.addi %c16_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %22 = "simt_step.switch"(%21, %0) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %32 = arith.muli %arg4, %c4_i32_8 : i32
          %33 = arith.addi %32, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %34 = arith.addi %c20_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_9 : i32
          "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %32 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %arg4, %c1_i32 : i32
          %true_8 = arith.constant true
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%25: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %32 = arith.muli %arg4, %c4_i32_8 : i32
          %33 = arith.addi %32, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %34 = arith.addi %c40_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_9 : i32
          "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %32 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %arg4, %c1_i32 : i32
          %true_8 = arith.constant true
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%27: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %28 = arith.addi %c60_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_7 : i32
        %31 = "simt_step.if"(%30) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %32 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%19) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %18 = arith.muli %arg3, %c4_i32_5 : i32
        %19 = arith.addi %18, %0 : i32
        %c64_i32 = arith.constant 64 : i32
        %20 = arith.addi %c64_i32, %19 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_6 : i32
        "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %25 = arith.muli %arg5, %c4_i32_10 : i32
          %26 = arith.addi %25, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %27 = arith.addi %c84_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_11 : i32
          "simt_step.condition"(%29, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %25 = arith.addi %arg4, %arg5 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %26 = arith.addi %arg5, %c1_i32_10 : i32
          %true_11 = arith.constant true
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %27 = arith.muli %arg5, %c4_i32_12 : i32
          %28 = arith.addi %c16_i32, %27 : i32
          %29 = arith.addi %28, %0 : i32
          %true_13 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %19 = arith.addi %arg2, %18#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c32_i32 = arith.constant 32 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %21 = arith.muli %arg3, %c4_i32_8 : i32
        %22 = arith.addi %c32_i32, %21 : i32
        %23 = arith.addi %22, %0 : i32
        %true_9 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%17#0) : (i32) -> ()
    }) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %9 = arith.addi %c48_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c104_i32 = arith.constant 104 : i32
    %11 = arith.addi %c104_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
    %14 = "simt_step.if"(%13) ({
      %17 = simt_step.subgroup_id
      %18 = arith.index_cast %17 : index to i32
      "simt_step.yield"(%18) : (i32) -> ()
    }, {
      %c108_i32 = arith.constant 108 : i32
      %17 = arith.addi %c108_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_3 : i32
      %20 = "simt_step.if"(%19) ({
        %c112_i32 = arith.constant 112 : i32
        %23 = arith.addi %c112_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %25 = "simt_step.switch"(%24, %c0_i32_5) ({
        ^bb0(%arg2: i32):
          %c0_i32_6 = arith.constant 0 : i32
          %26 = arith.addi %0, %c0_i32_6 : i32
          "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%25) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %24 = arith.muli %arg3, %c4_i32_7 : i32
          %25 = arith.addi %24, %0 : i32
          %c116_i32 = arith.constant 116 : i32
          %26 = arith.addi %c116_i32, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_8 : i32
          "simt_step.condition"(%28, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %24 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %25 = arith.addi %arg3, %c1_i32 : i32
          %true_7 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %26 = arith.muli %arg3, %c4_i32_8 : i32
          %27 = arith.addi %c64_i32, %26 : i32
          %28 = arith.addi %27, %0 : i32
          %true_9 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) : (i32) -> ()
      }) : (i1) -> i32
      %c80_i32 = arith.constant 80 : i32
      %21 = arith.addi %c80_i32, %0 : i32
      %true_4 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) : (i32) -> ()
    }) : (i1) -> i32
    %c96_i32 = arith.constant 96 : i32
    %15 = arith.addi %c96_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

