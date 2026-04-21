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
        %c0_i32_3 = arith.constant 0 : i32
        %3 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %4 = "simt_step.if"(%3) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_5 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg7, %c4_i32 : i32
          %8 = arith.addi %c0_i32_5, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg7, %c4_i32 : i32
          %8 = arith.addi %c16_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_4 = arith.constant 1 : i32
        %5 = arith.addi %arg7, %c1_i32_4 : i32
        "simt_step.break"(%4, %5) : (i32, i32) -> ()
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
      %c12_i32 = arith.constant 12 : i32
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_1 : i32
      %19 = "simt_step.if"(%18) ({
        %c16_i32 = arith.constant 16 : i32
        %22 = arith.addi %c16_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %24 = "simt_step.switch"(%23, %0) ({
        ^bb0(%arg2: i32):
          %c3_i32 = arith.constant 3 : i32
          %true_6 = arith.constant true
          %c32_i32 = arith.constant 32 : i32
          %27 = arith.addi %c32_i32, %0 : i32
          %true_7 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_3 = arith.constant true
        %c48_i32_4 = arith.constant 48 : i32
        %25 = arith.addi %c48_i32_4, %0 : i32
        %true_5 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %22 = arith.addi %c20_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %24 = "simt_step.switch"(%23, %0) ({
        ^bb0(%arg2: i32):
          %25 = simt_step.subgroup_id
          %26 = arith.index_cast %25 : index to i32
          "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %28 = simt_step.subgroup_id
          %29 = arith.index_cast %28 : index to i32
          %true_3 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %30 = arith.addi %c64_i32, %0 : i32
          %true_4 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          %true_5 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %33 = arith.addi %c80_i32, %0 : i32
          %true_6 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%35: i32):  // no predecessors
          %36 = simt_step.lane_id
          %37 = arith.index_cast %36 : index to i32
          %true_7 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %38 = arith.addi %c96_i32, %0 : i32
          %true_8 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %20 = arith.addi %c112_i32, %0 : i32
      %true_2 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) : (i32) -> ()
    }, {
      %c24_i32 = arith.constant 24 : i32
      %16 = arith.addi %c24_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_1 : i32
      %19 = "simt_step.if"(%18) ({
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %23 = arith.muli %arg3, %c4_i32_5 : i32
          %24 = arith.addi %23, %0 : i32
          %c28_i32 = arith.constant 28 : i32
          %25 = arith.addi %c28_i32, %24 : i32
          %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %27 = arith.cmpi ne, %26, %c0_i32_6 : i32
          "simt_step.condition"(%27, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %23 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %arg3, %c1_i32 : i32
          %true_5 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %25 = arith.muli %arg3, %c4_i32_6 : i32
          %26 = arith.addi %c128_i32, %25 : i32
          %27 = arith.addi %26, %0 : i32
          %true_7 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%22#0) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      %c144_i32 = arith.constant 144 : i32
      %20 = arith.addi %c144_i32, %0 : i32
      %true_2 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) : (i32) -> ()
    }) : (i1) -> i32
    %c160_i32 = arith.constant 160 : i32
    %9 = arith.addi %c160_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c48_i32 = arith.constant 48 : i32
    %11 = arith.addi %c48_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = simt_step.subgroup_id
    %14 = arith.index_cast %13 : index to i32
    %15 = "simt_step.switch"(%12, %14) ({
    ^bb0(%arg2: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_5 : i32
        %23 = arith.addi %22, %0 : i32
        %c52_i32 = arith.constant 52 : i32
        %24 = arith.addi %c52_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c72_i32 = arith.constant 72 : i32
        %22 = arith.addi %c72_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_5 : i32
        %25 = "simt_step.if"(%24) ({
          %c4_i32_10 = arith.constant 4 : i32
          %34 = arith.addi %0, %c4_i32_10 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }, {
          %34 = simt_step.subgroup_id
          %35 = arith.index_cast %34 : index to i32
          "simt_step.yield"(%35) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %26 = arith.addi %c176_i32, %0 : i32
        %true_6 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %28 = arith.addi %arg3, %25 : i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32 : i32
        %true_7 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_8 : i32
        %31 = arith.addi %c192_i32, %30 : i32
        %32 = arith.addi %31, %0 : i32
        %true_9 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %18 = simt_step.lane_id
      %19 = arith.index_cast %18 : index to i32
      %true_3 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %20 = arith.addi %c208_i32, %0 : i32
      %true_4 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

