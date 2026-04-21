module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32 : i32
      %5 = "simt_step.if"(%4) ({
        %true_1 = arith.constant true
        %15 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %16 = arith.addi %c0_i32_2, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15) : (i32) -> ()
      }, {
        %15 = simt_step.lane_id
        %16 = arith.index_cast %15 : index to i32
        %17 = "simt_step.switch"(%arg3, %16) ({
        ^bb0(%arg5: i32):
          %true_2 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %21 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %true_3 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %24 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_1 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %19 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %7 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %8 = "simt_step.if"(%7) ({
        %c0_i32_1 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %16 = "simt_step.if"(%15) ({
          %true_2 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %18 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }, {
          %true_2 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %18 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%16) : (i32) -> ()
      }, {
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_3 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.muli %arg6, %c4_i32 : i32
          %18 = arith.addi %c96_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%16, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %10 = simt_step.subgroup_id
      %11 = arith.index_cast %10 : index to i32
      %12 = "simt_step.switch"(%arg3, %11) ({
      ^bb0(%arg5: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32 : i32
          %21 = arith.cmpi slt, %arg7, %20 : i32
          "simt_step.condition"(%21, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_4 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.muli %arg7, %c4_i32 : i32
          %21 = arith.addi %c112_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%19, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %true_3 = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %18 = arith.addi %c128_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c144_i32 = arith.constant 144 : i32
      %14 = arith.addi %c144_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
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
    %5 = simt_step.subgroup_id
    %6 = arith.index_cast %5 : index to i32
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %9 = arith.addi %c8_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %10, %c0_i32_0 : i32
    %12 = "simt_step.if"(%11) ({
      %c12_i32 = arith.constant 12 : i32
      %15 = arith.addi %c12_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %17 = simt_step.subgroup_id
      %18 = arith.index_cast %17 : index to i32
      %19 = "simt_step.switch"(%16, %18) ({
      ^bb0(%arg2: i32):
        %c16_i32 = arith.constant 16 : i32
        %20 = arith.addi %c16_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_1 = arith.constant 4 : i32
        %22 = "simt_step.switch"(%21, %c4_i32_1) ({
        ^bb0(%arg3: i32):
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          %true_8 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %35 = arith.addi %c160_i32, %0 : i32
          %true_9 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %38 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %40 = simt_step.subgroup_id
          %41 = arith.index_cast %40 : index to i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb3(%42: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_2 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %23 = arith.addi %c176_i32, %0 : i32
        %true_3 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_4 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %25 = arith.addi %c192_i32, %0 : i32
        %true_5 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %28 = simt_step.subgroup_id
        %29 = arith.index_cast %28 : index to i32
        %true_6 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %30 = arith.addi %c208_i32, %0 : i32
        %true_7 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%19) : (i32) -> ()
    }, {
      %c20_i32 = arith.constant 20 : i32
      %15 = arith.addi %c20_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_1 : i32
      %18 = "simt_step.if"(%17) ({
        %21 = simt_step.subgroup_id
        %22 = arith.index_cast %21 : index to i32
        "simt_step.yield"(%22) : (i32) -> ()
      }, {
        %c24_i32 = arith.constant 24 : i32
        %21 = arith.addi %c24_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %23 = "simt_step.switch"(%22, %c2_i32) ({
        ^bb0(%arg2: i32):
          %c0_i32_3 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_3) {fallthrough = true} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %c4_i32_4 = arith.constant 4 : i32
          %true_5 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %26 = arith.addi %c224_i32, %0 : i32
          %true_6 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_4) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) : (i32) -> ()
      }) : (i1) -> i32
      %c240_i32 = arith.constant 240 : i32
      %19 = arith.addi %c240_i32, %0 : i32
      %true_2 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) : (i32) -> ()
    }) : (i1) -> i32
    %c256_i32 = arith.constant 256 : i32
    %13 = arith.addi %c256_i32, %0 : i32
    %true = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

