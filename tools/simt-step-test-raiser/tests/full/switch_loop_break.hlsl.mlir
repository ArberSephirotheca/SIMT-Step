module {
  func.func @main(%arg0: i32) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %false = arith.constant false
    %1:4 = "simt_step.switch"(%0, %c0_i32, %false, %false, %false) ({
    ^bb0(%arg1: i32, %arg2: i1, %arg3: i1, %arg4: i1):
      %false_0 = arith.constant false
      %true = arith.constant true
      %2 = arith.cmpi eq, %arg4, %false_0 : i1
      %3 = arith.cmpi eq, %arg2, %false_0 : i1
      %c0_i32_1 = arith.constant 0 : i32
      %4 = arith.cmpi eq, %0, %c0_i32_1 : i32
      %5 = arith.andi %3, %2 : i1
      %6 = arith.andi %5, %4 : i1
      %7 = arith.ori %arg3, %6 : i1
      %8 = arith.andi %7, %2 : i1
      %9:4 = "simt_step.if"(%8) ({
        %true_4 = arith.constant true
        %false_5 = arith.constant false
        %true_6 = arith.constant true
        %c0_i32_7 = arith.constant 0 : i32
        %20 = "simt_step.loop"(%arg1) ({
        ^bb0(%arg5: i32):
          %c3_i32 = arith.constant 3 : i32
          %21 = arith.cmpi slt, %c0_i32_7, %c3_i32 : i32
          "simt_step.condition"(%21, %arg5) : (i1, i32) -> ()
        }, {
        ^bb0(%arg5: i32):
          %21 = arith.addi %arg5, %c0_i32_7 : i32
          "simt_step.break"(%21) : (i32) -> ()
        }) : (i32) -> i32
        "simt_step.yield"(%20, %true_4, %false_5, %true_6) : (i32, i1, i1, i1) -> ()
      }, {
        "simt_step.yield"(%arg1, %arg2, %arg3, %arg4) : (i32, i1, i1, i1) -> ()
      }) : (i1) -> (i32, i1, i1, i1)
      "simt_step.yield"(%9#0, %9#1, %9#2, %9#3) : (i32, i1, i1, i1) -> ()
    ^bb1(%10: i32, %11: i1, %12: i1, %13: i1):  // no predecessors
      %false_2 = arith.constant false
      %true_3 = arith.constant true
      %14 = arith.cmpi eq, %13, %false_2 : i1
      %15 = arith.cmpi eq, %11, %false_2 : i1
      %16 = arith.andi %15, %14 : i1
      %17 = arith.ori %12, %16 : i1
      %18 = arith.andi %17, %14 : i1
      %19:4 = "simt_step.if"(%18) ({
        %true_4 = arith.constant true
        %false_5 = arith.constant false
        %true_6 = arith.constant true
        %c5_i32 = arith.constant 5 : i32
        %20 = arith.addi %10, %c5_i32 : i32
        "simt_step.yield"(%20, %true_4, %false_5, %true_6) : (i32, i1, i1, i1) -> ()
      }, {
        "simt_step.yield"(%10, %11, %12, %13) : (i32, i1, i1, i1) -> ()
      }) : (i1) -> (i32, i1, i1, i1)
      "simt_step.yield"(%19#0, %19#1, %19#2, %19#3) : (i32, i1, i1, i1) -> ()
    }) {case_values = array<i64: 0, 0>} : (i32, i32, i1, i1, i1) -> (i32, i1, i1, i1)
    return
  }
}

