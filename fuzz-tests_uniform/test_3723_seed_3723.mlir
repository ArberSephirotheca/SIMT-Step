module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
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
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %7:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %11 = arith.addi %10, %c1_i32_6 : i32
          %12 = arith.cmpi slt, %arg7, %11 : i32
          "simt_step.condition"(%12, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_6 = arith.constant 1 : i32
          %10 = arith.addi %arg7, %c1_i32_6 : i32
          "simt_step.yield"(%arg0, %10) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %8 = simt_step.subgroup_id
        %9 = arith.index_cast %8 : index to i32
        "simt_step.yield"(%7#0) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %7 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %8 = "simt_step.if"(%7) ({
          %c1_i32_6 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_6) : (i32) -> ()
        }, {
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        "simt_step.yield"(%8) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %arg0, %c1_i32 : i32
      %c1_i32_3 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32_3 : i32
      "simt_step.yield"(%4, %6) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c4_i32_10 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_10 : i32
      %18 = arith.addi %17, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %19 = arith.addi %c8_i32, %18 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_11 : i32
      "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %17 = simt_step.lane_id
      %18 = arith.index_cast %17 : index to i32
      %19 = arith.addi %arg2, %18 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_10 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_10 : i32
      %18 = arith.addi %17, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %19 = arith.addi %c28_i32, %18 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_11 : i32
      "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_13 = arith.constant 4 : i32
        %20 = arith.muli %arg5, %c4_i32_13 : i32
        %21 = arith.addi %20, %0 : i32
        %c48_i32_14 = arith.constant 48 : i32
        %22 = arith.addi %c48_i32_14, %21 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_15 : i32
        "simt_step.condition"(%24, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c68_i32 = arith.constant 68 : i32
        %20 = arith.addi %c68_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %22 = simt_step.lane_id
        %23 = arith.index_cast %22 : index to i32
        %24 = "simt_step.switch"(%21, %23) ({
        ^bb0(%arg6: i32):
          %c1_i32_15 = arith.constant 1 : i32
          %27 = arith.addi %0, %c1_i32_15 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %c1_i32_16 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_16) {fallthrough = true} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          %c0_i32_17 = arith.constant 0 : i32
          %30 = arith.addi %0, %c0_i32_17 : i32
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb3(%31: i32):  // no predecessors
          %c0_i32_18 = arith.constant 0 : i32
          %32 = arith.addi %0, %c0_i32_18 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %25 = arith.addi %arg4, %24 : i32
        %c1_i32_14 = arith.constant 1 : i32
        %26 = arith.addi %arg5, %c1_i32_14 : i32
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_12 = arith.constant true
      %18 = arith.addi %arg2, %17#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%18, %19) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %9 = arith.addi %c32_i32, %0 : i32
    %true_6 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c72_i32 = arith.constant 72 : i32
    %11 = arith.addi %c72_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_7 = arith.constant 4 : i32
    %13 = arith.addi %0, %c4_i32_7 : i32
    %14 = "simt_step.switch"(%12, %13) ({
    ^bb0(%arg2: i32):
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_16 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_16 : i32
        %29 = arith.addi %28, %0 : i32
        %c76_i32 = arith.constant 76 : i32
        %30 = arith.addi %c76_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_17 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %31 = arith.muli %arg6, %c4_i32_19 : i32
          %32 = arith.addi %31, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %33 = arith.addi %c96_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_20 : i32
          "simt_step.condition"(%35, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %31 = arith.addi %arg5, %arg6 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %32 = arith.addi %arg6, %c1_i32_19 : i32
          "simt_step.continue"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        %29 = arith.addi %arg3, %28#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_12 = arith.constant true
      "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c116_i32 = arith.constant 116 : i32
      %19 = arith.addi %c116_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_13 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_13 : i32
      %22 = "simt_step.if"(%21) ({
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %29 = arith.muli %arg4, %c4_i32_19 : i32
          %30 = arith.addi %29, %0 : i32
          %c120_i32 = arith.constant 120 : i32
          %31 = arith.addi %c120_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_20 : i32
          "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %29 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        "simt_step.yield"(%28#0) : (i32) -> ()
      }, {
        %c140_i32 = arith.constant 140 : i32
        %28 = arith.addi %c140_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %30 = "simt_step.switch"(%29, %c1_i32) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          %31 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %c0_i32_17 = arith.constant 0 : i32
          %34 = arith.addi %0, %c0_i32_17 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb3(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %c144_i32 = arith.constant 144 : i32
      %24 = arith.addi %c144_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_14 = arith.constant 0 : i32
      %26 = arith.addi %0, %c0_i32_14 : i32
      %27 = "simt_step.switch"(%25, %26) ({
      ^bb0(%arg3: i32):
        %c148_i32 = arith.constant 148 : i32
        %28 = arith.addi %c148_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %30 = "simt_step.switch"(%29, %c0_i32_16) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          %39 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c3_i32_19 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_19) {fallthrough = false} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %33 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb3(%34: i32):  // no predecessors
        %c152_i32 = arith.constant 152 : i32
        %35 = arith.addi %c152_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_18 : i32
        %38 = "simt_step.if"(%37) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_15 = arith.constant true
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_8 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %15 = arith.addi %c48_i32, %0 : i32
    %true_9 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

