module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.subgroup_id
    %1 = arith.index_cast %0 : index to i32
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %3 = simt_step.lane_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %11 = "simt_step.if"(%10) ({
        %c0_i32_7 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %20 = "simt_step.if"(%19) ({
          %c2_i32 = arith.constant 2 : i32
          %21 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%21) : (i32) -> ()
        }, {
          %c4_i32_8 = arith.constant 4 : i32
          %21 = arith.addi %arg0, %c4_i32_8 : i32
          "simt_step.yield"(%21) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%20) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32 : i32
          %22 = arith.cmpi slt, %arg6, %21 : i32
          "simt_step.condition"(%22, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%c4_i32_9, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) : (i32) -> ()
      }) : (i1) -> i32
      %c3_i32_2 = arith.constant 3 : i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c3_i32_3 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32_3) {fallthrough = false} : (i32) -> ()
    ^bb2(%13: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %15 = "simt_step.if"(%14) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32 : i32
          %22 = arith.cmpi slt, %arg6, %21 : i32
          "simt_step.condition"(%22, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c3_i32_9 = arith.constant 3 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%c3_i32_9, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb3(%16: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %19 = arith.remsi %arg3, %c4_i32_7 : i32
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %19, %c1_i32 : i32
        %21 = arith.cmpi slt, %arg6, %20 : i32
        "simt_step.condition"(%21, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c1_i32 = arith.constant 1 : i32
        %19 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%arg0, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c4_i32 = arith.constant 4 : i32
      %18 = arith.addi %arg0, %c4_i32 : i32
      "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %7 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %9 = arith.select %8, %1, %5 : i32
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
    %c4_i32_0 = arith.constant 4 : i32
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_1 : i32
    %8 = "simt_step.if"(%7) ({
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %22 = arith.muli %arg3, %c4_i32_11 : i32
        %23 = arith.addi %22, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %24 = arith.addi %c12_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_12 : i32
        "simt_step.condition"(%26, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %22 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.continue"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%21#0) : (i32) -> ()
    }, {
      %21 = simt_step.subgroup_id
      %22 = arith.index_cast %21 : index to i32
      "simt_step.yield"(%22) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_8 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_8 : i32
      %22 = arith.addi %21, %0 : i32
      %c32_i32_9 = arith.constant 32 : i32
      %23 = arith.addi %c32_i32_9, %22 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_10 : i32
      "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %21 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %22 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.continue"(%21, %22) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_4 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %12 = arith.addi %c32_i32, %0 : i32
    %true_5 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c52_i32 = arith.constant 52 : i32
    %14 = arith.addi %c52_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %16 = simt_step.lane_id
    %17 = arith.index_cast %16 : index to i32
    %18 = "simt_step.switch"(%15, %17) ({
    ^bb0(%arg2: i32):
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_13 = arith.constant 4 : i32
        %32 = arith.muli %arg4, %c4_i32_13 : i32
        %33 = arith.addi %32, %0 : i32
        %c56_i32 = arith.constant 56 : i32
        %34 = arith.addi %c56_i32, %33 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_14 : i32
        "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %32 = arith.addi %arg3, %0 : i32
        %c1_i32 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %23 = arith.addi %c76_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_11 : i32
      %26 = "simt_step.if"(%25) ({
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_16 : i32
          %34 = arith.addi %33, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %35 = arith.addi %c80_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_17 : i32
          "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %33 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        "simt_step.yield"(%32#0) : (i32) -> ()
      }, {
        %c100_i32 = arith.constant 100 : i32
        %32 = arith.addi %c100_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %34 = arith.addi %0, %c0_i32_13 : i32
        %35 = "simt_step.switch"(%33, %34) ({
        ^bb0(%arg3: i32):
          %c0_i32_15 = arith.constant 0 : i32
          %36 = arith.addi %0, %c0_i32_15 : i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%35) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c104_i32 = arith.constant 104 : i32
      %28 = arith.addi %c104_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %30 = arith.cmpi ne, %29, %c0_i32_12 : i32
      %31 = "simt_step.if"(%30) ({
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_16 : i32
          %34 = arith.addi %33, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %35 = arith.addi %c108_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_17 : i32
          "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %33 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.break"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        "simt_step.yield"(%32#0) : (i32) -> ()
      }, {
        %c128_i32 = arith.constant 128 : i32
        %32 = arith.addi %c128_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_13 : i32
        %35 = "simt_step.if"(%34) ({
          %c4_i32_14 = arith.constant 4 : i32
          %36 = arith.addi %0, %c4_i32_14 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %36 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%35) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_6 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %19 = arith.addi %c48_i32, %0 : i32
    %true_7 = arith.constant true
    %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

