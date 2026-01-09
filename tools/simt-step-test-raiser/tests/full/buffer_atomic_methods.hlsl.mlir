module {
  func.func @main(%arg0: i32, %arg1: !simt_step.resource<Global, i32>) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c2_i32 = arith.constant 2 : i32
    %1 = "simt_step.buffer.atomic_exchange"(%arg1, %0, %c2_i32) : (!simt_step.resource<Global, i32>, i32, i32) -> i32
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.addi %0, %c3_i32 : i32
    %3 = "simt_step.buffer.atomic_compare_exchange"(%arg1, %0, %0, %2) : (!simt_step.resource<Global, i32>, i32, i32, i32) -> i32
    %4 = "simt_step.buffer.atomic_min"(%arg1, %0, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> i32
    %5 = "simt_step.buffer.atomic_max"(%arg1, %0, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> i32
    %6 = "simt_step.buffer.atomic_and"(%arg1, %0, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> i32
    %7 = "simt_step.buffer.atomic_or"(%arg1, %0, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> i32
    %8 = "simt_step.buffer.atomic_xor"(%arg1, %0, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> i32
    return
  }
}

