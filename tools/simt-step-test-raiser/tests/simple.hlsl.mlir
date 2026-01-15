module {
  func.func @main(%arg0: i32) attributes {simt.num_threads = array<i64: 8, 4, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c42_i32 = arith.constant 42 : i32
    %c13_i32 = arith.constant 13 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = arith.muli %c13_i32, %c2_i32 : i32
    %2 = arith.addi %c42_i32, %1 : i32
    %3 = arith.subi %2, %0 : i32
    return
  }
}

