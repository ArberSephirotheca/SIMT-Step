module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %7:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %8 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_3 = arith.constant 1 : i32
        %9 = arith.addi %8, %c1_i32_3 : i32
        %10 = arith.cmpi slt, %arg5, %9 : i32
        "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %true = arith.constant true
        %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.muli %arg5, %c4_i32 : i32
        %10 = arith.addi %c0_i32_3, %9 : i32
        %11 = arith.addi %10, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_4 = arith.constant 1 : i32
        %12 = arith.addi %arg5, %c1_i32_4 : i32
        "simt_step.break"(%8, %12) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%7#0) : (i32) -> ()
    }, {
      %true = arith.constant true
      %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %8 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%7) : (i32) -> ()
    }) : (i1) -> i32
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %3 = arith.addi %arg0, %c1_i32 : i32
    %4 = "simt_step.switch"(%2, %3) ({
    ^bb0(%arg4: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %7 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %8 = "simt_step.if"(%7) ({
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_5 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32_5 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_5 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.muli %arg6, %c4_i32 : i32
          %18 = arith.addi %c32_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_6 = arith.constant 1 : i32
          %20 = arith.addi %arg6, %c1_i32_6 : i32
          "simt_step.yield"(%16, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) : (i32) -> ()
      }, {
        %true_3 = arith.constant true
        %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %16 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    ^bb1(%9: i32):  // no predecessors
      %true = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %11 = arith.addi %c64_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      %true_2 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c80_i32 = arith.constant 80 : i32
      %14 = arith.addi %c80_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %6 = arith.select %5, %1, %4 : i32
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
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %10 = arith.addi %c12_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %12 = simt_step.lane_id
      %13 = arith.index_cast %12 : index to i32
      %14 = "simt_step.switch"(%11, %13) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %29 = arith.addi %c16_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %31 = simt_step.lane_id
        %32 = arith.index_cast %31 : index to i32
        %33 = "simt_step.switch"(%30, %32) ({
        ^bb0(%arg4: i32):
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          %true_13 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %44 = arith.addi %c96_i32, %0 : i32
          %true_14 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43) {fallthrough = true} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_13 : i32
          %43 = arith.addi %42, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %44 = arith.addi %c20_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_14 : i32
          "simt_step.condition"(%46, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %42 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg5, %c1_i32 : i32
          %true_13 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_14 : i32
          %45 = arith.addi %c112_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_15 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %36 = arith.addi %c128_i32, %0 : i32
        %true_8 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%38: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_13 : i32
          %43 = arith.addi %42, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %44 = arith.addi %c40_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_14 : i32
          "simt_step.condition"(%46, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %42 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg5, %c1_i32 : i32
          %true_13 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_14 : i32
          %45 = arith.addi %c144_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_15 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %40 = arith.addi %c160_i32, %0 : i32
        %true_12 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %15 = arith.addi %c176_i32, %0 : i32
      %true_0 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %18 = simt_step.lane_id
      %19 = arith.index_cast %18 : index to i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %true_1 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %21 = arith.addi %c192_i32, %0 : i32
      %true_2 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb3(%23: i32):  // no predecessors
      %c60_i32 = arith.constant 60 : i32
      %24 = arith.addi %c60_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = "simt_step.switch"(%25, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_11 : i32
          %42 = arith.addi %41, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %43 = arith.addi %c64_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_12 : i32
          "simt_step.condition"(%45, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %41 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %42 = arith.addi %arg5, %c1_i32 : i32
          %true_11 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %43 = arith.muli %arg5, %c4_i32_12 : i32
          %44 = arith.addi %c208_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_13 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %30 = arith.addi %c224_i32, %0 : i32
        %true_8 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %true_9 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %33 = arith.addi %c240_i32, %0 : i32
        %true_10 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %36 = arith.addi %c84_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = simt_step.subgroup_id
        %39 = arith.index_cast %38 : index to i32
        %40 = "simt_step.switch"(%37, %39) ({
        ^bb0(%arg4: i32):
          %41 = simt_step.subgroup_id
          %42 = arith.index_cast %41 : index to i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          %44 = arith.addi %0, %c4_i32_11 : i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          %46 = arith.addi %0, %c0_i32_12 : i32
          %true_13 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %47 = arith.addi %c256_i32, %0 : i32
          %true_14 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb3(%49: i32):  // no predecessors
          %50 = simt_step.subgroup_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %27 = arith.addi %c272_i32, %0 : i32
      %true_4 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

