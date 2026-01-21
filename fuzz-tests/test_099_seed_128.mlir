module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.addi %arg0, %c3_i32 : i32
    %c4_i32 = arith.constant 4 : i32
    %1 = arith.remsi %0, %c4_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %2 = arith.addi %1, %c2_i32 : i32
    return %2 : i32
  }
  func.func @main(%arg0: !simt_step.resource<Global, i32>, %arg1: !simt_step.resource<Global, i32>) attributes {simt.num_threads = [64, 1, 1], simt.subgroup_width = 32 : i64} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %1 = call @helper0(%0) : (i32) -> i32
    %c128_i32 = arith.constant 128 : i32
    %2 = arith.addi %c128_i32, %0 : i32
    "simt_step.buffer.store"(%arg0, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c3_i32 = arith.constant 3 : i32
    %c0_i32 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32, %0 : i32
    %4 = "simt_step.buffer.load"(%arg1, %3) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %4, %c0_i32_0 : i32
    %6 = "simt_step.if"(%5) ({
      %c64_i32 = arith.constant 64 : i32
      %11 = arith.addi %c64_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %13 = "simt_step.switch"(%12, %0) ({
      ^bb0(%arg2: i32):
        %c128_i32_1 = arith.constant 128 : i32
        %14 = arith.addi %c128_i32_1, %0 : i32
        %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %15, %c0_i32_2 : i32
        %17 = "simt_step.if"(%16) ({
          %37 = simt_step.subgroup_id
          %38 = arith.index_cast %37 : index to i32
          "simt_step.yield"(%38) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %18 = arith.addi %c0_i32_3, %0 : i32
        %true_4 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c192_i32 = arith.constant 192 : i32
        %21 = arith.addi %c192_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %23 = "simt_step.switch"(%22, %c0_i32_5) ({
        ^bb0(%arg3: i32):
          %37 = simt_step.subgroup_id
          %38 = arith.index_cast %37 : index to i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %40 = simt_step.lane_id
          %41 = arith.index_cast %40 : index to i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %43 = simt_step.lane_id
          %44 = arith.index_cast %43 : index to i32
          %true_10 = arith.constant true
          %c256_i32_11 = arith.constant 256 : i32
          %45 = arith.addi %c256_i32_11, %0 : i32
          %true_12 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        %25 = simt_step.subgroup_id
        %26 = arith.index_cast %25 : index to i32
        %true_6 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %27 = arith.addi %c512_i32, %0 : i32
        %true_7 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      ^bb3(%29: i32):  // no predecessors
        %c256_i32 = arith.constant 256 : i32
        %30 = arith.addi %c256_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = simt_step.subgroup_id
        %33 = arith.index_cast %32 : index to i32
        %34 = "simt_step.switch"(%31, %33) ({
        ^bb0(%arg3: i32):
          %37 = simt_step.lane_id
          %38 = arith.index_cast %37 : index to i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %true_10 = arith.constant true
          %c768_i32 = arith.constant 768 : i32
          %40 = arith.addi %c768_i32, %0 : i32
          %true_11 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %c3_i32_12 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb3(%43: i32):  // no predecessors
          %44 = simt_step.subgroup_id
          %45 = arith.index_cast %44 : index to i32
          %true_13 = arith.constant true
          %c1024_i32 = arith.constant 1024 : i32
          %46 = arith.addi %c1024_i32, %0 : i32
          %true_14 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c1280_i32 = arith.constant 1280 : i32
        %35 = arith.addi %c1280_i32, %0 : i32
        %true_9 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%13) : (i32) -> ()
    }, {
      %c320_i32 = arith.constant 320 : i32
      %11 = arith.addi %c320_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %13 = "simt_step.switch"(%12, %c2_i32) ({
      ^bb0(%arg2: i32):
        %true_1 = arith.constant true
        %c1536_i32 = arith.constant 1536 : i32
        %14 = arith.addi %c1536_i32, %0 : i32
        %true_2 = arith.constant true
        %15 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c64_i32 = arith.constant 64 : i32
          %18 = arith.muli %arg4, %c64_i32 : i32
          %19 = arith.addi %18, %0 : i32
          %c384_i32 = arith.constant 384 : i32
          %20 = arith.addi %c384_i32, %19 : i32
          %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_5 = arith.constant 0 : i32
          %22 = arith.cmpi ne, %21, %c0_i32_5 : i32
          "simt_step.condition"(%22, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %18 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %arg4, %c1_i32 : i32
          %true_5 = arith.constant true
          %c1792_i32 = arith.constant 1792 : i32
          %c64_i32 = arith.constant 64 : i32
          %20 = arith.muli %arg4, %c64_i32 : i32
          %21 = arith.addi %c1792_i32, %20 : i32
          %22 = arith.addi %21, %0 : i32
          %true_6 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%13) : (i32) -> ()
    }) : (i1) -> i32
    %c2048_i32 = arith.constant 2048 : i32
    %7 = arith.addi %c2048_i32, %0 : i32
    %true = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %9 = simt_step.lane_id
    %10 = arith.index_cast %9 : index to i32
    return
  }
}

