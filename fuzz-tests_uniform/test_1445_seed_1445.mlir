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
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_5 = arith.constant 1 : i32
          %12 = arith.addi %11, %c1_i32_5 : i32
          %13 = arith.cmpi slt, %arg7, %12 : i32
          "simt_step.condition"(%13, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c2_i32 = arith.constant 2 : i32
          %11 = arith.addi %arg0, %c2_i32 : i32
          %c1_i32_5 = arith.constant 1 : i32
          %12 = arith.addi %arg7, %c1_i32_5 : i32
          "simt_step.yield"(%11, %12) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %9 = simt_step.subgroup_id
        %10 = arith.index_cast %9 : index to i32
        "simt_step.yield"(%8#0) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_5 = arith.constant 1 : i32
          %11 = arith.addi %10, %c1_i32_5 : i32
          %12 = arith.cmpi slt, %arg7, %11 : i32
          "simt_step.condition"(%12, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_5 = arith.constant 1 : i32
          %10 = arith.addi %arg7, %c1_i32_5 : i32
          "simt_step.continue"(%arg0, %10) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32 = arith.constant 2 : i32
        %9 = arith.addi %arg0, %c2_i32 : i32
        "simt_step.yield"(%8#0) : (i32) -> ()
      }) : (i1) -> i32
      %5 = simt_step.lane_id
      %6 = arith.index_cast %5 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%4, %7) : (i32, i32) -> ()
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
    %c3_i32 = arith.constant 3 : i32
    %5 = simt_step.subgroup_id
    %6 = arith.index_cast %5 : index to i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %10 = arith.muli %arg3, %c4_i32_3 : i32
      %11 = arith.addi %10, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %12 = arith.addi %c8_i32, %11 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_4 : i32
      "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %10 = arith.addi %c28_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_3 : i32
      %13 = "simt_step.if"(%12) ({
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %17 = arith.muli %arg5, %c4_i32_7 : i32
          %18 = arith.addi %17, %0 : i32
          %c32_i32 = arith.constant 32 : i32
          %19 = arith.addi %c32_i32, %18 : i32
          %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %21 = arith.cmpi ne, %20, %c0_i32_8 : i32
          "simt_step.condition"(%21, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %17 = arith.addi %arg4, %arg5 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %18 = arith.addi %arg5, %c1_i32_7 : i32
          "simt_step.yield"(%17, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_6 = arith.constant true
        "simt_step.yield"(%16#0) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %17 = arith.muli %arg5, %c4_i32_7 : i32
          %18 = arith.addi %17, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %19 = arith.addi %c52_i32, %18 : i32
          %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %21 = arith.cmpi ne, %20, %c0_i32_8 : i32
          "simt_step.condition"(%21, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %17 = arith.addi %arg4, %arg5 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %18 = arith.addi %arg5, %c1_i32_7 : i32
          "simt_step.yield"(%17, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_6 = arith.constant true
        "simt_step.yield"(%16#0) : (i32) -> ()
      }) : (i1) -> i32
      %14 = arith.addi %arg2, %13 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

