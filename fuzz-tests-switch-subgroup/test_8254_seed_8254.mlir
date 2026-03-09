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
        %3 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %4 = "simt_step.if"(%3) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_5 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg7, %c4_i32 : i32
          %8 = arith.addi %c0_i32_5, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg7, %c4_i32 : i32
          %8 = arith.addi %c16_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_4 = arith.constant 1 : i32
        %5 = arith.addi %arg7, %c1_i32_4 : i32
        "simt_step.yield"(%4, %5) : (i32, i32) -> ()
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
    %c3_i32 = arith.constant 3 : i32
    %c2_i32 = arith.constant 2 : i32
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %19 = arith.muli %arg3, %c4_i32_5 : i32
        %20 = arith.addi %19, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %21 = arith.addi %c12_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_6 : i32
        "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %19 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c32_i32 = arith.constant 32 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %21 = arith.muli %arg3, %c4_i32_6 : i32
        %22 = arith.addi %c32_i32, %21 : i32
        %23 = arith.addi %22, %0 : i32
        %true_7 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %19 = arith.muli %arg3, %c4_i32_5 : i32
        %20 = arith.addi %19, %0 : i32
        %c32_i32 = arith.constant 32 : i32
        %21 = arith.addi %c32_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_6 : i32
        "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %19 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c48_i32 = arith.constant 48 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %21 = arith.muli %arg3, %c4_i32_6 : i32
        %22 = arith.addi %c48_i32, %21 : i32
        %23 = arith.addi %22, %0 : i32
        %true_7 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) : (i32) -> ()
    }) : (i1) -> i32
    %c64_i32 = arith.constant 64 : i32
    %9 = arith.addi %c64_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c52_i32 = arith.constant 52 : i32
    %11 = arith.addi %c52_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = simt_step.lane_id
    %14 = arith.index_cast %13 : index to i32
    %15 = "simt_step.switch"(%12, %14) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_17 = arith.constant 4 : i32
        %44 = arith.muli %arg4, %c4_i32_17 : i32
        %45 = arith.addi %44, %0 : i32
        %c56_i32 = arith.constant 56 : i32
        %46 = arith.addi %c56_i32, %45 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %48 = arith.cmpi ne, %47, %c0_i32_18 : i32
        "simt_step.condition"(%48, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %44 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %45 = arith.addi %arg4, %c1_i32 : i32
        %true_17 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_18 = arith.constant 4 : i32
        %46 = arith.muli %arg4, %c4_i32_18 : i32
        %47 = arith.addi %c80_i32, %46 : i32
        %48 = arith.addi %47, %0 : i32
        %true_19 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44, %45) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %20 = arith.addi %c76_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_5 : i32
      %23 = "simt_step.if"(%22) ({
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %44:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_19 : i32
          %46 = arith.addi %45, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %47 = arith.addi %c80_i32, %46 : i32
          %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %49 = arith.cmpi ne, %48, %c0_i32_20 : i32
          "simt_step.condition"(%49, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %45 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %46 = arith.addi %arg4, %c1_i32 : i32
          %true_19 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %47 = arith.muli %arg4, %c4_i32_20 : i32
          %48 = arith.addi %c96_i32, %47 : i32
          %49 = arith.addi %48, %0 : i32
          %true_21 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45, %46) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%44#0) : (i32) -> ()
      }, {
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %44:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_19 : i32
          %46 = arith.addi %45, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %47 = arith.addi %c100_i32, %46 : i32
          %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %49 = arith.cmpi ne, %48, %c0_i32_20 : i32
          "simt_step.condition"(%49, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %45 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %46 = arith.addi %arg4, %c1_i32 : i32
          %true_19 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %47 = arith.muli %arg4, %c4_i32_20 : i32
          %48 = arith.addi %c112_i32, %47 : i32
          %49 = arith.addi %48, %0 : i32
          %true_21 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45, %46) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%44#0) : (i32) -> ()
      }) : (i1) -> i32
      %c128_i32 = arith.constant 128 : i32
      %24 = arith.addi %c128_i32, %0 : i32
      %true_6 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_7 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %26 = arith.addi %c144_i32, %0 : i32
      %true_8 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c120_i32 = arith.constant 120 : i32
      %29 = arith.addi %c120_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_9 = arith.constant 4 : i32
      %31 = arith.addi %0, %c4_i32_9 : i32
      %32 = "simt_step.switch"(%30, %31) ({
      ^bb0(%arg3: i32):
        %c124_i32 = arith.constant 124 : i32
        %44 = arith.addi %c124_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %46 = arith.cmpi ne, %45, %c0_i32_17 : i32
        %47 = "simt_step.if"(%46) ({
          %60 = simt_step.lane_id
          %61 = arith.index_cast %60 : index to i32
          "simt_step.yield"(%61) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %48 = arith.addi %c160_i32, %0 : i32
        %true_18 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      ^bb1(%50: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        %51 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      ^bb2(%52: i32):  // no predecessors
        %c0_i32_19 = arith.constant 0 : i32
        %c0_i32_20 = arith.constant 0 : i32
        %53:2 = "simt_step.loop"(%c0_i32_19, %c0_i32_20) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_27 = arith.constant 4 : i32
          %60 = arith.muli %arg5, %c4_i32_27 : i32
          %61 = arith.addi %60, %0 : i32
          %c128_i32_28 = arith.constant 128 : i32
          %62 = arith.addi %c128_i32_28, %61 : i32
          %63 = "simt_step.buffer.load"(%arg1, %62) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_29 = arith.constant 0 : i32
          %64 = arith.cmpi ne, %63, %c0_i32_29 : i32
          "simt_step.condition"(%64, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %60 = arith.addi %arg4, %arg5 : i32
          %c1_i32_27 = arith.constant 1 : i32
          %61 = arith.addi %arg5, %c1_i32_27 : i32
          %true_28 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_29 = arith.constant 4 : i32
          %62 = arith.muli %arg5, %c4_i32_29 : i32
          %63 = arith.addi %c176_i32, %62 : i32
          %64 = arith.addi %63, %0 : i32
          %true_30 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_30) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%60, %61) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_21 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %54 = arith.addi %c192_i32, %0 : i32
        %true_22 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%56: i32):  // no predecessors
        %c0_i32_23 = arith.constant 0 : i32
        %c0_i32_24 = arith.constant 0 : i32
        %57:2 = "simt_step.loop"(%c0_i32_23, %c0_i32_24) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_27 = arith.constant 4 : i32
          %60 = arith.muli %arg5, %c4_i32_27 : i32
          %61 = arith.addi %60, %0 : i32
          %c148_i32 = arith.constant 148 : i32
          %62 = arith.addi %c148_i32, %61 : i32
          %63 = "simt_step.buffer.load"(%arg1, %62) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_28 = arith.constant 0 : i32
          %64 = arith.cmpi ne, %63, %c0_i32_28 : i32
          "simt_step.condition"(%64, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %60 = arith.addi %arg4, %arg5 : i32
          %c1_i32_27 = arith.constant 1 : i32
          %61 = arith.addi %arg5, %c1_i32_27 : i32
          %true_28 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_29 = arith.constant 4 : i32
          %62 = arith.muli %arg5, %c4_i32_29 : i32
          %63 = arith.addi %c208_i32, %62 : i32
          %64 = arith.addi %63, %0 : i32
          %true_30 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_30) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%60, %61) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_25 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %58 = arith.addi %c224_i32, %0 : i32
        %true_26 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%57#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %33 = arith.addi %c240_i32, %0 : i32
      %true_11 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb3(%35: i32):  // no predecessors
      %c168_i32 = arith.constant 168 : i32
      %36 = arith.addi %c168_i32, %0 : i32
      %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %38 = arith.addi %0, %c0_i32_12 : i32
      %39 = "simt_step.switch"(%37, %38) ({
      ^bb0(%arg3: i32):
        %c172_i32 = arith.constant 172 : i32
        %44 = arith.addi %c172_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %46 = simt_step.subgroup_id
        %47 = arith.index_cast %46 : index to i32
        %48 = "simt_step.switch"(%45, %47) ({
        ^bb0(%arg4: i32):
          %c2_i32_27 = arith.constant 2 : i32
          %true_28 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %68 = arith.addi %c256_i32, %0 : i32
          %true_29 = arith.constant true
          %69 = "simt_step.wave_count_bits"(%true_29) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %68, %69) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32_27) {fallthrough = false} : (i32) -> ()
        ^bb1(%70: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%71: i32):  // no predecessors
          %72 = simt_step.lane_id
          %73 = arith.index_cast %72 : index to i32
          "simt_step.yield"(%73) {fallthrough = false} : (i32) -> ()
        ^bb3(%74: i32):  // no predecessors
          %75 = simt_step.lane_id
          %76 = arith.index_cast %75 : index to i32
          "simt_step.yield"(%76) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %49 = arith.addi %c272_i32, %0 : i32
        %true_18 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_19 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %51 = arith.addi %c288_i32, %0 : i32
        %true_20 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) {fallthrough = true} : (i32) -> ()
      ^bb1(%53: i32):  // no predecessors
        %c0_i32_21 = arith.constant 0 : i32
        %c0_i32_22 = arith.constant 0 : i32
        %54:2 = "simt_step.loop"(%c0_i32_21, %c0_i32_22) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_27 = arith.constant 4 : i32
          %68 = arith.muli %arg5, %c4_i32_27 : i32
          %69 = arith.addi %68, %0 : i32
          %c176_i32 = arith.constant 176 : i32
          %70 = arith.addi %c176_i32, %69 : i32
          %71 = "simt_step.buffer.load"(%arg1, %70) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_28 = arith.constant 0 : i32
          %72 = arith.cmpi ne, %71, %c0_i32_28 : i32
          "simt_step.condition"(%72, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %68 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %69 = arith.addi %arg5, %c1_i32 : i32
          %true_27 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_28 = arith.constant 4 : i32
          %70 = arith.muli %arg5, %c4_i32_28 : i32
          %71 = arith.addi %c304_i32, %70 : i32
          %72 = arith.addi %71, %0 : i32
          %true_29 = arith.constant true
          %73 = "simt_step.wave_count_bits"(%true_29) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %72, %73) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%68, %69) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%54#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%55: i32):  // no predecessors
        %c196_i32 = arith.constant 196 : i32
        %56 = arith.addi %c196_i32, %0 : i32
        %57 = "simt_step.buffer.load"(%arg1, %56) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_23 = arith.constant 0 : i32
        %58 = arith.cmpi ne, %57, %c0_i32_23 : i32
        %59 = "simt_step.if"(%58) ({
          %c1_i32 = arith.constant 1 : i32
          %68 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%68) : (i32) -> ()
        }, {
          %68 = simt_step.subgroup_id
          %69 = arith.index_cast %68 : index to i32
          "simt_step.yield"(%69) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %60 = arith.addi %c320_i32, %0 : i32
        %true_24 = arith.constant true
        %61 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%59) {fallthrough = true} : (i32) -> ()
      ^bb3(%62: i32):  // no predecessors
        %c200_i32 = arith.constant 200 : i32
        %63 = arith.addi %c200_i32, %0 : i32
        %64 = "simt_step.buffer.load"(%arg1, %63) : (!simt_step.resource<Global, i32>, i32) -> i32
        %65 = "simt_step.switch"(%64, %0) ({
        ^bb0(%arg4: i32):
          %c0_i32_27 = arith.constant 0 : i32
          %68 = arith.addi %0, %c0_i32_27 : i32
          %true_28 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %69 = arith.addi %c336_i32, %0 : i32
          %true_29 = arith.constant true
          %70 = "simt_step.wave_count_bits"(%true_29) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
        ^bb1(%71: i32):  // no predecessors
          %72 = simt_step.subgroup_id
          %73 = arith.index_cast %72 : index to i32
          "simt_step.yield"(%73) {fallthrough = false} : (i32) -> ()
        ^bb2(%74: i32):  // no predecessors
          %c4_i32_30 = arith.constant 4 : i32
          %true_31 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %75 = arith.addi %c352_i32, %0 : i32
          %true_32 = arith.constant true
          %76 = "simt_step.wave_count_bits"(%true_32) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %75, %76) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_25 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %66 = arith.addi %c368_i32, %0 : i32
        %true_26 = arith.constant true
        %67 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_13 = arith.constant true
      %c384_i32 = arith.constant 384 : i32
      %40 = arith.addi %c384_i32, %0 : i32
      %true_14 = arith.constant true
      %41 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_15 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %42 = arith.addi %c400_i32, %0 : i32
      %true_16 = arith.constant true
      %43 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c416_i32 = arith.constant 416 : i32
    %16 = arith.addi %c416_i32, %0 : i32
    %true_2 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

