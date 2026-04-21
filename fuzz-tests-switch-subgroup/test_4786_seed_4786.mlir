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
        %c0_i32_4 = arith.constant 0 : i32
        %3:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg8: i32, %arg9: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32_6 : i32
          %7 = arith.cmpi slt, %arg9, %6 : i32
          "simt_step.condition"(%7, %arg8, %arg9) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg8: i32, %arg9: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg9, %c4_i32 : i32
          %7 = arith.addi %c0_i32_6, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_7 = arith.constant 1 : i32
          %9 = arith.addi %arg9, %c1_i32_7 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_5 = arith.constant 1 : i32
        %4 = arith.addi %arg7, %c1_i32_5 : i32
        "simt_step.yield"(%3#0, %4) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%1#0, %2) : (i32, i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %6 = arith.muli %arg3, %c4_i32_2 : i32
      %7 = arith.addi %6, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %8 = arith.addi %c8_i32, %7 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %9, %c0_i32_3 : i32
      "simt_step.condition"(%10, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %6 = arith.addi %c28_i32, %0 : i32
      %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
      %8 = simt_step.lane_id
      %9 = arith.index_cast %8 : index to i32
      %10 = "simt_step.switch"(%7, %9) ({
      ^bb0(%arg4: i32):
        %c32_i32 = arith.constant 32 : i32
        %19 = arith.addi %c32_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_6 : i32
        %22 = "simt_step.if"(%21) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_18 = arith.constant 0 : i32
          %42 = arith.addi %0, %c0_i32_18 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %23 = arith.addi %c16_i32, %0 : i32
        %true_7 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_8 = arith.constant true
        %c32_i32_9 = arith.constant 32 : i32
        %25 = arith.addi %c32_i32_9, %0 : i32
        %true_10 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %28 = arith.addi %c36_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_11 : i32
        %31 = "simt_step.if"(%30) ({
          %c1_i32_18 = arith.constant 1 : i32
          %42 = arith.addi %0, %c1_i32_18 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          "simt_step.yield"(%43) : (i32) -> ()
        }) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %32 = arith.addi %c48_i32, %0 : i32
        %true_12 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
      ^bb2(%34: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %35 = arith.addi %c40_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_13 = arith.constant 1 : i32
        %37 = "simt_step.switch"(%36, %c1_i32_13) ({
        ^bb0(%arg5: i32):
          %true_18 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %42 = arith.addi %c64_i32, %0 : i32
          %true_19 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %38 = arith.addi %c80_i32, %0 : i32
        %true_15 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb3(%40: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %42 = arith.muli %arg6, %c4_i32_18 : i32
          %43 = arith.addi %42, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %44 = arith.addi %c44_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_19 : i32
          "simt_step.condition"(%46, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %42 = arith.addi %arg5, %arg6 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %43 = arith.addi %arg6, %c1_i32_18 : i32
          %true_19 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %44 = arith.muli %arg6, %c4_i32_20 : i32
          %45 = arith.addi %c96_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_21 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%41#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c112_i32 = arith.constant 112 : i32
      %11 = arith.addi %c112_i32, %0 : i32
      %true_2 = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %13 = arith.addi %arg2, %10 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true_3 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_4 : i32
      %16 = arith.addi %c128_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_5 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

