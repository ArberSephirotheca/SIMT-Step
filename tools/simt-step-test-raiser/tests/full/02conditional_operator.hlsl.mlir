module {
  func.func @main(%arg0: i32) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %1 = arith.cmpi eq, %0, %c0_i32_0 : i32
    %2:2 = "simt_step.if"(%1) ({
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.addi %c0_i32, %c1_i32 : i32
      "simt_step.yield"(%3, %3) : (i32, i32) -> ()
    }, {
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.subi %c0_i32, %c1_i32 : i32
      "simt_step.yield"(%3, %c0_i32) : (i32, i32) -> ()
    }) : (i1) -> (i32, i32)
    return
  }
}

