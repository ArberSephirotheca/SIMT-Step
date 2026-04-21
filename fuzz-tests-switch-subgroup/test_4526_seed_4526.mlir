module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.lane_id
    %1 = arith.index_cast %0 : index to i32
    %2 = "simt_step.switch"(%arg3, %1) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %c0_i32_0 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %11, %c1_i32 : i32
        %13 = arith.cmpi slt, %arg6, %12 : i32
        "simt_step.condition"(%13, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_3 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32_3 : i32
          %15 = arith.cmpi slt, %arg8, %14 : i32
          "simt_step.condition"(%15, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_3 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c0_i32_4 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.muli %arg8, %c4_i32 : i32
          %15 = arith.addi %c0_i32_4, %14 : i32
          %16 = arith.addi %15, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_5 = arith.constant 1 : i32
          %17 = arith.addi %arg8, %c1_i32_5 : i32
          "simt_step.yield"(%13, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%11#0, %12) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%5#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %7 = arith.remsi %arg3, %c2_i32 : i32
      %8 = simt_step.lane_id
      %9 = arith.index_cast %8 : index to i32
      %10 = "simt_step.switch"(%7, %9) ({
      ^bb0(%arg5: i32):
        %c3_i32 = arith.constant 3 : i32
        %11 = arith.remsi %arg3, %c3_i32 : i32
        %12 = "simt_step.switch"(%11, %arg0) ({
        ^bb0(%arg6: i32):
          %true_4 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %19 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %true_5 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %22 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb2(%23: i32):  // no predecessors
          %true_6 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %25 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb3(%26: i32):  // no predecessors
          %true_7 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %28 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb1(%13: i32):  // no predecessors
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32 : i32
          %20 = arith.cmpi slt, %arg7, %19 : i32
          "simt_step.condition"(%20, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_4 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32 = arith.constant 4 : i32
          %19 = arith.muli %arg7, %c4_i32 : i32
          %20 = arith.addi %c80_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %22 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.break"(%18, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%15: i32):  // no predecessors
        %true_3 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %17 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c112_i32 = arith.constant 112 : i32
    %4 = arith.addi %c112_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c4_i32_3 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_3 : i32
      %15 = arith.addi %14, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %16 = arith.addi %c8_i32, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_4 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %14 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      %true_3 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_4 : i32
      %17 = arith.addi %c128_i32, %16 : i32
      %18 = arith.addi %17, %0 : i32
      %true_5 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %6 = simt_step.subgroup_id
    %7 = arith.index_cast %6 : index to i32
    %c28_i32 = arith.constant 28 : i32
    %8 = arith.addi %c28_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %9, %c0_i32_2 : i32
    %11 = "simt_step.if"(%10) ({
      "simt_step.yield"(%0) : (i32) -> ()
    }, {
      %c32_i32 = arith.constant 32 : i32
      %14 = arith.addi %c32_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %16 = simt_step.subgroup_id
      %17 = arith.index_cast %16 : index to i32
      %18 = "simt_step.switch"(%15, %17) ({
      ^bb0(%arg2: i32):
        %c36_i32 = arith.constant 36 : i32
        %19 = arith.addi %c36_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_3 : i32
        %22 = "simt_step.if"(%21) ({
          %c3_i32 = arith.constant 3 : i32
          %35 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %23 = arith.addi %c144_i32, %0 : i32
        %true_4 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_15 : i32
          %36 = arith.addi %35, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %37 = arith.addi %c40_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_16 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          %true_15 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_16 : i32
          %38 = arith.addi %c160_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_17 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %27 = arith.addi %c176_i32, %0 : i32
        %true_8 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%29: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_15 : i32
          %36 = arith.addi %35, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %37 = arith.addi %c60_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_16 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          %true_15 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_16 : i32
          %38 = arith.addi %c192_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_17 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%31: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_15 : i32
          %36 = arith.addi %35, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %37 = arith.addi %c80_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_16 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          %true_15 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_16 : i32
          %38 = arith.addi %c208_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_17 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %33 = arith.addi %c224_i32, %0 : i32
        %true_14 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%18) : (i32) -> ()
    }) : (i1) -> i32
    %c240_i32 = arith.constant 240 : i32
    %12 = arith.addi %c240_i32, %0 : i32
    %true = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

