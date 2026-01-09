module {
  func.func @main(%arg0: i32, %arg1: !simt_step.resource<Global, i32>) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c1_i32 = arith.constant 1 : i32
    %1 = "simt_step.buffer.atomic_add"(%arg1, %0, %c1_i32) : (!simt_step.resource<Global, i32>, i32, i32) -> i32
    return
  }
}

