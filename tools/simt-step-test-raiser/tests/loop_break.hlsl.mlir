module {
  func.func @main(%arg0: i32) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%0, %c0_i32) ({
    ^bb0(%arg1: i32, %arg2: i32):
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.cmpi slt, %arg2, %c1_i32 : i32
      "simt_step.condition"(%2, %arg1, %arg2) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg1: i32, %arg2: i32):
      "simt_step.break"(%arg1, %arg2) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

