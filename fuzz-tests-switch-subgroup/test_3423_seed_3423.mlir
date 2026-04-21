module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32 : i32
      %3 = "simt_step.if"(%2) ({
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %9:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %11 = arith.addi %10, %c1_i32 : i32
          %12 = arith.cmpi slt, %arg6, %11 : i32
          "simt_step.condition"(%12, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_4 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c0_i32_5 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg6, %c4_i32 : i32
          %12 = arith.addi %c0_i32_5, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %14 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.continue"(%10, %14) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%9#0) : (i32) -> ()
      }, {
        %true_2 = arith.constant true
        %9 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %10 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%9) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) {fallthrough = false} : (i32) -> ()
    ^bb1(%4: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %10 = arith.addi %9, %c1_i32 : i32
        %11 = arith.cmpi slt, %arg6, %10 : i32
        "simt_step.condition"(%11, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %9:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %12 = arith.addi %11, %c1_i32_4 : i32
          %13 = arith.cmpi slt, %arg8, %12 : i32
          "simt_step.condition"(%13, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_4 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.muli %arg8, %c4_i32 : i32
          %13 = arith.addi %c32_i32, %12 : i32
          %14 = arith.addi %13, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_5 = arith.constant 1 : i32
          %15 = arith.addi %arg8, %c1_i32_5 : i32
          "simt_step.yield"(%11, %15) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %10 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%9#0, %10) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%5#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%6: i32):  // no predecessors
      %true = arith.constant true
      %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %8 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
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
      %c4_i32_4 = arith.constant 4 : i32
      %7 = arith.muli %arg3, %c4_i32_4 : i32
      %8 = arith.addi %7, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %9 = arith.addi %c8_i32, %8 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_5 : i32
      "simt_step.condition"(%11, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %7:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %14 = arith.muli %arg5, %c4_i32_8 : i32
        %15 = arith.addi %14, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %16 = arith.addi %c28_i32, %15 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %17, %c0_i32_9 : i32
        "simt_step.condition"(%18, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %14 = arith.addi %arg4, %arg5 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %15 = arith.addi %arg5, %c1_i32_8 : i32
        %true_9 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %16 = arith.muli %arg5, %c4_i32_10 : i32
        %17 = arith.addi %c64_i32, %16 : i32
        %18 = arith.addi %17, %0 : i32
        %true_11 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%14, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %8 = arith.addi %arg2, %7#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %10 = arith.muli %arg3, %c4_i32_6 : i32
      %11 = arith.addi %c80_i32, %10 : i32
      %12 = arith.addi %11, %0 : i32
      %true_7 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%8, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %7 = arith.muli %arg3, %c4_i32_4 : i32
      %8 = arith.addi %7, %0 : i32
      %c48_i32 = arith.constant 48 : i32
      %9 = arith.addi %c48_i32, %8 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_5 : i32
      "simt_step.condition"(%11, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c68_i32 = arith.constant 68 : i32
      %7 = arith.addi %c68_i32, %0 : i32
      %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
      %9 = simt_step.lane_id
      %10 = arith.index_cast %9 : index to i32
      %11 = "simt_step.switch"(%8, %10) ({
      ^bb0(%arg4: i32):
        %c1_i32_8 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_8) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %21 = arith.addi %c72_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_9 : i32
        %24 = "simt_step.if"(%23) ({
          %c0_i32_19 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_19) : (i32) -> ()
        }, {
          %35 = simt_step.subgroup_id
          %36 = arith.index_cast %35 : index to i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %25 = arith.addi %c96_i32, %0 : i32
        %true_10 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb2(%27: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %35 = arith.muli %arg6, %c4_i32_19 : i32
          %36 = arith.addi %35, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %37 = arith.addi %c76_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_20 : i32
          "simt_step.condition"(%39, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %35 = arith.addi %arg5, %arg6 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %36 = arith.addi %arg6, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %37 = arith.muli %arg6, %c4_i32_21 : i32
          %38 = arith.addi %c112_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_22 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %29 = arith.addi %c128_i32, %0 : i32
        %true_14 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%31: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %35 = arith.muli %arg6, %c4_i32_19 : i32
          %36 = arith.addi %35, %0 : i32
          %c96_i32_20 = arith.constant 96 : i32
          %37 = arith.addi %c96_i32_20, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_21 : i32
          "simt_step.condition"(%39, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %35 = arith.addi %arg5, %arg6 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %36 = arith.addi %arg6, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %37 = arith.muli %arg6, %c4_i32_21 : i32
          %38 = arith.addi %c144_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_22 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %33 = arith.addi %c160_i32, %0 : i32
        %true_18 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %12 = arith.addi %c176_i32, %0 : i32
      %true_4 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %14 = arith.addi %arg2, %11 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_6 : i32
      %17 = arith.addi %c192_i32, %16 : i32
      %18 = arith.addi %17, %0 : i32
      %true_7 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

