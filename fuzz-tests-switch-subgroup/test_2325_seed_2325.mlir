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
        %true = arith.constant true
        %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %4 = arith.muli %arg5, %c4_i32 : i32
        %5 = arith.addi %c0_i32_2, %4 : i32
        %6 = arith.addi %5, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %6, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.continue"(%3, %7) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c3_i32 = arith.constant 3 : i32
        %4 = arith.remsi %arg3, %c3_i32 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %5 = arith.addi %arg0, %c0_i32_1 : i32
        %6 = "simt_step.switch"(%4, %5) ({
        ^bb0(%arg4: i32):
          %true = arith.constant true
          %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %8 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
        ^bb1(%9: i32):  // no predecessors
          %true_2 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %11 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
        ^bb2(%12: i32):  // no predecessors
          %true_3 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %14 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%6) : (i32) -> ()
      }, {
        %c0_i32_1 = arith.constant 0 : i32
        %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %5 = "simt_step.if"(%4) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %7 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %7 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%5) : (i32) -> ()
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
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %14 = arith.cmpi slt, %arg3, %c2_i32 : i32
        "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c4_i32_1 = arith.constant 4 : i32
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_2 : i32
    %9 = "simt_step.if"(%8) ({
      %c12_i32 = arith.constant 12 : i32
      %13 = arith.addi %c12_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_5 : i32
      %16 = "simt_step.if"(%15) ({
        %c16_i32 = arith.constant 16 : i32
        %19 = arith.addi %c16_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_7 : i32
        %22 = "simt_step.if"(%21) ({
          %25 = simt_step.subgroup_id
          %26 = arith.index_cast %25 : index to i32
          "simt_step.yield"(%26) : (i32) -> ()
        }, {
          %c4_i32_9 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_9) : (i32) -> ()
        }) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %23 = arith.addi %c96_i32, %0 : i32
        %true_8 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %20 = arith.muli %arg3, %c4_i32_9 : i32
          %21 = arith.addi %20, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %22 = arith.addi %c20_i32, %21 : i32
          %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %24 = arith.cmpi ne, %23, %c0_i32_10 : i32
          "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %20 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg3, %c1_i32 : i32
          %true_9 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %22 = arith.muli %arg3, %c4_i32_10 : i32
          %23 = arith.addi %c112_i32, %22 : i32
          %24 = arith.addi %23, %0 : i32
          %true_11 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) : (i32) -> ()
      }) : (i1) -> i32
      %c128_i32 = arith.constant 128 : i32
      %17 = arith.addi %c128_i32, %0 : i32
      %true_6 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) : (i32) -> ()
    }, {
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%13) : (i32) -> ()
    }) : (i1) -> i32
    %c144_i32 = arith.constant 144 : i32
    %10 = arith.addi %c144_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %12:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_5 : i32
      %14 = arith.addi %13, %0 : i32
      %c40_i32 = arith.constant 40 : i32
      %15 = arith.addi %c40_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_6 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c60_i32 = arith.constant 60 : i32
      %13 = arith.addi %c60_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_5 : i32
      %16 = "simt_step.if"(%15) ({
        %c64_i32 = arith.constant 64 : i32
        %25 = arith.addi %c64_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_10 : i32
        %28 = "simt_step.if"(%27) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %29 = arith.addi %c160_i32, %0 : i32
        %true_11 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) : (i32) -> ()
      }, {
        %c68_i32 = arith.constant 68 : i32
        %25 = arith.addi %c68_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_10 : i32
        %28 = "simt_step.if"(%27) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %31 = simt_step.subgroup_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %29 = arith.addi %c176_i32, %0 : i32
        %true_11 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) : (i32) -> ()
      }) : (i1) -> i32
      %c192_i32 = arith.constant 192 : i32
      %17 = arith.addi %c192_i32, %0 : i32
      %true_6 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %19 = arith.addi %arg2, %16 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      %true_7 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_8 : i32
      %22 = arith.addi %c208_i32, %21 : i32
      %23 = arith.addi %22, %0 : i32
      %true_9 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

