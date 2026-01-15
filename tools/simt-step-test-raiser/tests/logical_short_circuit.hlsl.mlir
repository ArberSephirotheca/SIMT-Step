module {
  func.func @main(%arg0: i32) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %1 = arith.cmpi eq, %0, %c0_i32_0 : i32
    %2:2 = "simt_step.if"(%1) ({
      %c1_i32 = arith.constant 1 : i32
      %c1_i32_2 = arith.constant 1 : i32
      %5 = arith.cmpi eq, %c1_i32, %c1_i32_2 : i32
      "simt_step.yield"(%5, %c1_i32) : (i1, i32) -> ()
    }, {
      %false = arith.constant false
      "simt_step.yield"(%false, %c0_i32) : (i1, i32) -> ()
    }) : (i1) -> (i1, i32)
    %c0_i32_1 = arith.constant 0 : i32
    %3 = arith.cmpi eq, %0, %c0_i32_1 : i32
    %4:2 = "simt_step.if"(%3) ({
      %true = arith.constant true
      "simt_step.yield"(%true, %2#1) : (i1, i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %c2_i32_2 = arith.constant 2 : i32
      %5 = arith.cmpi eq, %c2_i32, %c2_i32_2 : i32
      "simt_step.yield"(%5, %c2_i32) : (i1, i32) -> ()
    }) : (i1) -> (i1, i32)
    return
  }
}

