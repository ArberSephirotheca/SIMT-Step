module {
  func.func @main(%arg0: i32) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %true = arith.constant true
    %1:3 = "simt_step.loop"(%c0_i32, %c0_i32_0, %true) ({
    ^bb0(%arg1: i32, %arg2: i32, %arg3: i1):
      %2:3 = "simt_step.if"(%arg3) ({
        %true_1 = arith.constant true
        "simt_step.yield"(%true_1, %arg1, %arg2) : (i1, i32, i32) -> ()
      }, {
        %c5_i32 = arith.constant 5 : i32
        %3 = arith.cmpi slt, %arg1, %c5_i32 : i32
        "simt_step.yield"(%3, %arg1, %arg2) : (i1, i32, i32) -> ()
      }) : (i1) -> (i1, i32, i32)
      %false = arith.constant false
      "simt_step.condition"(%2#0, %2#1, %2#2, %false) : (i1, i32, i32, i1) -> ()
    }, {
    ^bb0(%arg1: i32, %arg2: i32, %arg3: i1):
      %false = arith.constant false
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.cmpi eq, %arg1, %c1_i32 : i32
      %3:2 = "simt_step.if"(%2) ({
        %c1_i32_2 = arith.constant 1 : i32
        %8 = arith.addi %arg1, %c1_i32_2 : i32
        "simt_step.continue"(%8, %arg2, %false) : (i32, i32, i1) -> ()
      }, {
        "simt_step.yield"(%arg1, %arg2) : (i32, i32) -> ()
      }) : (i1) -> (i32, i32)
      %c3_i32 = arith.constant 3 : i32
      %4 = arith.cmpi eq, %3#0, %c3_i32 : i32
      %5:2 = "simt_step.if"(%4) ({
        "simt_step.break"(%3#0, %3#1, %false) : (i32, i32, i1) -> ()
      }, {
        "simt_step.yield"(%3#0, %3#1) : (i32, i32) -> ()
      }) : (i1) -> (i32, i32)
      %6 = arith.addi %5#1, %5#0 : i32
      %c1_i32_1 = arith.constant 1 : i32
      %7 = arith.addi %5#0, %c1_i32_1 : i32
      "simt_step.yield"(%7, %6, %false) : (i32, i32, i1) -> ()
    }) : (i32, i32, i1) -> (i32, i32, i1)
    return
  }
}

