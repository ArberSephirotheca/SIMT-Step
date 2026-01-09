module {
  func.func @main(%arg0: i32) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %1 = arith.addi %c0_i32, %c1_i32 : i32
    %c1_i32_0 = arith.constant 1 : i32
    %2 = arith.subi %1, %c1_i32_0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %3 = arith.subi %c0_i32_1, %2 : i32
    %c-1_i32 = arith.constant -1 : i32
    %4 = arith.xori %2, %c-1_i32 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %5 = arith.cmpi eq, %2, %c0_i32_2 : i32
    %false = arith.constant false
    %6 = arith.cmpi eq, %5, %false : i1
    return
  }
}

