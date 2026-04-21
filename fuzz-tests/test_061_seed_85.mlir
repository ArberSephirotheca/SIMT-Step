module {
  func.func @helper0(%arg0: i32) -> i32 {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.addi %arg0, %c4_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = arith.remsi %0, %c2_i32 : i32
    %c2_i32_0 = arith.constant 2 : i32
    %2 = arith.addi %1, %c2_i32_0 : i32
    return %2 : i32
  }
  func.func @main(%arg0: !simt_step.resource<Global, i32>, %arg1: !simt_step.resource<Global, i32>) attributes {simt.num_threads = [64, 1, 1], simt.subgroup_width = 32 : i64} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %1 = call @helper0(%0) : (i32) -> i32
    %c128_i32 = arith.constant 128 : i32
    %2 = arith.addi %c128_i32, %0 : i32
    "simt_step.buffer.store"(%arg0, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32, %0 : i32
    %4 = "simt_step.buffer.load"(%arg1, %3) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %4, %c0_i32_0 : i32
    %6 = "simt_step.if"(%5) ({
      "simt_step.yield"(%0) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %16 = arith.muli %arg3, %c64_i32 : i32
        %17 = arith.addi %16, %0 : i32
        %c64_i32_5 = arith.constant 64 : i32
        %18 = arith.addi %c64_i32_5, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
        "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c384_i32 = arith.constant 384 : i32
        %16 = arith.addi %c384_i32, %0 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %18 = simt_step.subgroup_id
        %19 = arith.index_cast %18 : index to i32
        %20 = "simt_step.switch"(%17, %19) ({
        ^bb0(%arg4: i32):
          %27 = simt_step.lane_id
          %28 = arith.index_cast %27 : index to i32
          %true_7 = arith.constant true
          %c0_i32_8 = arith.constant 0 : i32
          %29 = arith.addi %c0_i32_8, %0 : i32
          %true_9 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %32 = arith.addi %0, %c3_i32 : i32
          %true_10 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %33 = arith.addi %c256_i32, %0 : i32
          %true_11 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %36 = simt_step.lane_id
          %37 = arith.index_cast %36 : index to i32
          "simt_step.yield"(%37) {fallthrough = true} : (i32) -> ()
        ^bb3(%38: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %21 = arith.addi %arg2, %20 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %c64_i32 = arith.constant 64 : i32
        %23 = arith.muli %arg3, %c64_i32 : i32
        %24 = arith.addi %c512_i32, %23 : i32
        %25 = arith.addi %24, %0 : i32
        %true_6 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%15#0) : (i32) -> ()
    }) : (i1) -> i32
    %c768_i32 = arith.constant 768 : i32
    %7 = arith.addi %c768_i32, %0 : i32
    %true = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c448_i32 = arith.constant 448 : i32
    %9 = arith.addi %c448_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %10, %c0_i32_1 : i32
    %12 = "simt_step.if"(%11) ({
      %c512_i32 = arith.constant 512 : i32
      %15 = arith.addi %c512_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_3 : i32
      %18 = "simt_step.if"(%17) ({
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c64_i32 = arith.constant 64 : i32
          %22 = arith.muli %arg3, %c64_i32 : i32
          %23 = arith.addi %22, %0 : i32
          %c576_i32 = arith.constant 576 : i32
          %24 = arith.addi %c576_i32, %23 : i32
          %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %26 = arith.cmpi ne, %25, %c0_i32_7 : i32
          "simt_step.condition"(%26, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %22 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %arg3, %c1_i32 : i32
          %true_7 = arith.constant true
          %c1024_i32 = arith.constant 1024 : i32
          %c64_i32 = arith.constant 64 : i32
          %24 = arith.muli %arg3, %c64_i32 : i32
          %25 = arith.addi %c1024_i32, %24 : i32
          %26 = arith.addi %25, %0 : i32
          %true_8 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) : (i32) -> ()
      }) : (i1) -> i32
      %c1280_i32 = arith.constant 1280 : i32
      %19 = arith.addi %c1280_i32, %0 : i32
      %true_4 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %15 = arith.addi %0, %c2_i32 : i32
      "simt_step.yield"(%15) : (i32) -> ()
    }) : (i1) -> i32
    %c1536_i32 = arith.constant 1536 : i32
    %13 = arith.addi %c1536_i32, %0 : i32
    %true_2 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

