module {
  func.func @main(%arg0: i32, %arg1: !simt_step.resource<Global, i32>) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %1 = "simt_step.switch"(%c1_i32, %c0_i32) ({
    ^bb0(%arg2: i32):
      %c5_i32 = arith.constant 5 : i32
      %2 = arith.addi %arg2, %c5_i32 : i32
      "simt_step.yield"(%2) {fallthrough = false} : (i32) -> ()
    ^bb1(%3: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %4 = arith.addi %3, %c3_i32 : i32
      "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
    ^bb2(%5: i32):  // no predecessors
      %c1_i32_1 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32_1 : i32
      "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    "simt_step.buffer.store"(%arg1, %c0_i32_0, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

