module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %c2_i32_0 = arith.constant 2 : i32
      %2 = arith.remsi %arg3, %c2_i32_0 : i32
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.addi %arg0, %c1_i32 : i32
      %4 = "simt_step.switch"(%2, %3) ({
      ^bb0(%arg5: i32):
        %c0_i32 = arith.constant 0 : i32
        %10 = arith.cmpi ne, %arg2, %c0_i32 : i32
        %11 = "simt_step.if"(%10) ({
          %true_4 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c0_i32_5 = arith.constant 0 : i32
          %19 = arith.addi %c0_i32_5, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %19 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %14 = "simt_step.if"(%13) ({
          %true_4 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %19 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %19 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      ^bb2(%15: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %17 = "simt_step.if"(%16) ({
          %true_4 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %19 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %19 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c96_i32 = arith.constant 96 : i32
      %6 = arith.addi %c96_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%4) {fallthrough = true} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c2_i32_1 = arith.constant 2 : i32
      %8 = arith.addi %arg0, %c2_i32_1 : i32
      %9 = "simt_step.switch"(%arg3, %8) ({
      ^bb0(%arg5: i32):
        %c2_i32_2 = arith.constant 2 : i32
        %10 = arith.remsi %arg3, %c2_i32_2 : i32
        %11 = simt_step.lane_id
        %12 = arith.index_cast %11 : index to i32
        %13 = "simt_step.switch"(%10, %12) ({
        ^bb0(%arg6: i32):
          %true_3 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %18 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %true_4 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %21 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
      ^bb1(%14: i32):  // no predecessors
        %c0_i32 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32 : i32
        %16 = "simt_step.if"(%15) ({
          %true_3 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %18 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }, {
          %true_3 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %18 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
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
      %c0_i32_3 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_3 : i32
      %19 = "simt_step.if"(%18) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c16_i32 = arith.constant 16 : i32
        %22 = arith.addi %c16_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_5 : i32
        %25 = "simt_step.if"(%24) ({
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) : (i32) -> ()
        }, {
          %28 = simt_step.lane_id
          %29 = arith.index_cast %28 : index to i32
          "simt_step.yield"(%29) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %26 = arith.addi %c176_i32, %0 : i32
        %true_6 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) : (i32) -> ()
      }) : (i1) -> i32
      %c192_i32 = arith.constant 192 : i32
      %20 = arith.addi %c192_i32, %0 : i32
      %true_4 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) : (i32) -> ()
    }, {
      %c20_i32 = arith.constant 20 : i32
      %16 = arith.addi %c20_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_3 : i32
      %19 = "simt_step.if"(%18) ({
        %c24_i32 = arith.constant 24 : i32
        %22 = arith.addi %c24_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_5 : i32
        %25 = "simt_step.if"(%24) ({
          %28 = simt_step.subgroup_id
          %29 = arith.index_cast %28 : index to i32
          "simt_step.yield"(%29) : (i32) -> ()
        }, {
          %28 = simt_step.subgroup_id
          %29 = arith.index_cast %28 : index to i32
          "simt_step.yield"(%29) : (i32) -> ()
        }) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %26 = arith.addi %c208_i32, %0 : i32
        %true_6 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) : (i32) -> ()
      }, {
        %c28_i32 = arith.constant 28 : i32
        %22 = arith.addi %c28_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %24 = simt_step.subgroup_id
        %25 = arith.index_cast %24 : index to i32
        %26 = "simt_step.switch"(%23, %25) ({
        ^bb0(%arg2: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c0_i32_7 = arith.constant 0 : i32
          %30 = arith.addi %0, %c0_i32_7 : i32
          %true_8 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %31 = arith.addi %c224_i32, %0 : i32
          %true_9 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %27 = arith.addi %c240_i32, %0 : i32
        %true_6 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) : (i32) -> ()
      }) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %20 = arith.addi %c256_i32, %0 : i32
      %true_4 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) : (i32) -> ()
    }) : (i1) -> i32
    %c272_i32 = arith.constant 272 : i32
    %9 = arith.addi %c272_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = "simt_step.switch"(%12, %0) ({
    ^bb0(%arg2: i32):
      %16 = simt_step.subgroup_id
      %17 = arith.index_cast %16 : index to i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %19 = arith.addi %c36_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_3 : i32
      %22 = "simt_step.if"(%21) ({
        %40 = simt_step.subgroup_id
        %41 = arith.index_cast %40 : index to i32
        "simt_step.yield"(%41) : (i32) -> ()
      }, {
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %41 = arith.muli %arg4, %c4_i32_14 : i32
          %42 = arith.addi %41, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %43 = arith.addi %c40_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_15 : i32
          "simt_step.condition"(%45, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %41 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %42 = arith.addi %arg4, %c1_i32 : i32
          %true_14 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_15 : i32
          %44 = arith.addi %c288_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_16 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%40#0) : (i32) -> ()
      }) : (i1) -> i32
      %c304_i32 = arith.constant 304 : i32
      %23 = arith.addi %c304_i32, %0 : i32
      %true_4 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c60_i32 = arith.constant 60 : i32
      %26 = arith.addi %c60_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %28 = "simt_step.switch"(%27, %c0_i32_5) ({
      ^bb0(%arg3: i32):
        %40 = simt_step.subgroup_id
        %41 = arith.index_cast %40 : index to i32
        %true_12 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %42 = arith.addi %c320_i32, %0 : i32
        %true_13 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = true} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        %45 = simt_step.lane_id
        %46 = arith.index_cast %45 : index to i32
        "simt_step.yield"(%46) {fallthrough = true} : (i32) -> ()
      ^bb2(%47: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %48 = arith.addi %c64_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %50 = simt_step.subgroup_id
        %51 = arith.index_cast %50 : index to i32
        %52 = "simt_step.switch"(%49, %51) ({
        ^bb0(%arg4: i32):
          %57 = simt_step.subgroup_id
          %58 = arith.index_cast %57 : index to i32
          %true_14 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %59 = arith.addi %c336_i32, %0 : i32
          %true_15 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%58) {fallthrough = true} : (i32) -> ()
        ^bb1(%61: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %62 = arith.addi %0, %c3_i32 : i32
          %true_16 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %63 = arith.addi %c352_i32, %0 : i32
          %true_17 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        ^bb2(%65: i32):  // no predecessors
          %66 = simt_step.lane_id
          %67 = arith.index_cast %66 : index to i32
          "simt_step.yield"(%67) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      ^bb3(%53: i32):  // no predecessors
        %c68_i32 = arith.constant 68 : i32
        %54 = arith.addi %c68_i32, %0 : i32
        %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
        %56 = "simt_step.switch"(%55, %0) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          %true_14 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %57 = arith.addi %c368_i32, %0 : i32
          %true_15 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %c3_i32_16 = arith.constant 3 : i32
          %60 = arith.addi %0, %c3_i32_16 : i32
          %true_17 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %61 = arith.addi %c384_i32, %0 : i32
          %true_18 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        ^bb2(%63: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%64: i32):  // no predecessors
          %c0_i32_19 = arith.constant 0 : i32
          %65 = arith.addi %0, %c0_i32_19 : i32
          %true_20 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %66 = arith.addi %c400_i32, %0 : i32
          %true_21 = arith.constant true
          %67 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %29 = arith.addi %c416_i32, %0 : i32
      %true_7 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    ^bb3(%31: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %32 = arith.addi %c72_i32, %0 : i32
      %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %34 = arith.cmpi ne, %33, %c0_i32_8 : i32
      %35 = "simt_step.if"(%34) ({
        %40 = simt_step.lane_id
        %41 = arith.index_cast %40 : index to i32
        "simt_step.yield"(%41) : (i32) -> ()
      }, {
        %c76_i32 = arith.constant 76 : i32
        %40 = arith.addi %c76_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %42 = simt_step.subgroup_id
        %43 = arith.index_cast %42 : index to i32
        %44 = "simt_step.switch"(%41, %43) ({
        ^bb0(%arg3: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %47 = arith.addi %0, %c4_i32_14 : i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %true_15 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %49 = arith.addi %c432_i32, %0 : i32
          %true_16 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%51: i32):  // no predecessors
          %52 = simt_step.subgroup_id
          %53 = arith.index_cast %52 : index to i32
          %true_17 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %54 = arith.addi %c448_i32, %0 : i32
          %true_18 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        ^bb3(%56: i32):  // no predecessors
          %57 = simt_step.subgroup_id
          %58 = arith.index_cast %57 : index to i32
          %true_19 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %59 = arith.addi %c464_i32, %0 : i32
          %true_20 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %45 = arith.addi %c480_i32, %0 : i32
        %true_13 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) : (i32) -> ()
      }) : (i1) -> i32
      %c496_i32 = arith.constant 496 : i32
      %36 = arith.addi %c496_i32, %0 : i32
      %true_9 = arith.constant true
      %37 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_10 = arith.constant true
      %c512_i32 = arith.constant 512 : i32
      %38 = arith.addi %c512_i32, %0 : i32
      %true_11 = arith.constant true
      %39 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c528_i32 = arith.constant 528 : i32
    %14 = arith.addi %c528_i32, %0 : i32
    %true_2 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

