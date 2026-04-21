module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %3 = arith.addi %c0_i32_0, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c2_i32 = arith.constant 2 : i32
        %4 = arith.remsi %arg3, %c2_i32 : i32
        %5 = simt_step.subgroup_id
        %6 = arith.index_cast %5 : index to i32
        %7 = "simt_step.switch"(%4, %6) ({
        ^bb0(%arg4: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %9 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
        ^bb1(%10: i32):  // no predecessors
          %true_1 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %12 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%7) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %4 = arith.remsi %arg3, %c2_i32 : i32
        %5 = simt_step.subgroup_id
        %6 = arith.index_cast %5 : index to i32
        %7 = "simt_step.switch"(%4, %6) ({
        ^bb0(%arg4: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %9 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
        ^bb1(%10: i32):  // no predecessors
          %true_1 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %12 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%7) : (i32) -> ()
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %8 = arith.muli %arg3, %c4_i32_6 : i32
      %9 = arith.addi %8, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %10 = arith.addi %c8_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_7 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %8 = arith.addi %arg2, %arg3 : i32
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
      "simt_step.yield"(%8, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %8 = arith.muli %arg3, %c4_i32_6 : i32
      %9 = arith.addi %8, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %10 = arith.addi %c28_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_7 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %8 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c96_i32 = arith.constant 96 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %10 = arith.muli %arg3, %c4_i32_6 : i32
      %11 = arith.addi %c96_i32, %10 : i32
      %12 = arith.addi %11, %0 : i32
      %true_7 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %8 = arith.muli %arg3, %c4_i32_6 : i32
      %9 = arith.addi %8, %0 : i32
      %c48_i32 = arith.constant 48 : i32
      %10 = arith.addi %c48_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_7 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %15 = arith.muli %arg5, %c4_i32_10 : i32
        %16 = arith.addi %15, %0 : i32
        %c68_i32 = arith.constant 68 : i32
        %17 = arith.addi %c68_i32, %16 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_11 : i32
        "simt_step.condition"(%19, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %22 = arith.muli %arg7, %c4_i32_16 : i32
          %23 = arith.addi %22, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %24 = arith.addi %c88_i32, %23 : i32
          %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %26 = arith.cmpi ne, %25, %c0_i32_17 : i32
          "simt_step.condition"(%26, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %22 = arith.addi %arg6, %arg7 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %23 = arith.addi %arg7, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %24 = arith.muli %arg7, %c4_i32_18 : i32
          %25 = arith.addi %c112_i32, %24 : i32
          %26 = arith.addi %25, %0 : i32
          %true_19 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %16 = arith.addi %arg4, %15#0 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %17 = arith.addi %arg5, %c1_i32_12 : i32
        %true_13 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %18 = arith.muli %arg5, %c4_i32_14 : i32
        %19 = arith.addi %c128_i32, %18 : i32
        %20 = arith.addi %19, %0 : i32
        %true_15 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %9 = arith.addi %arg2, %8#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_8 : i32
      %12 = arith.addi %c144_i32, %11 : i32
      %13 = arith.addi %12, %0 : i32
      %true_9 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

