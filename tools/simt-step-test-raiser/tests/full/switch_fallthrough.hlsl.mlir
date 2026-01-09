module {
  func.func @main(%arg0: i32) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c10_i32 = arith.constant 10 : i32
    %1 = "simt_step.switch"(%0, %c10_i32) ({
    ^bb0(%arg1: i32):
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %arg1, %c1_i32 : i32
      "simt_step.yield"(%2) {fallthrough = true} : (i32) -> ()
    ^bb1(%3: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %4 = arith.addi %3, %c2_i32 : i32
      "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
    ^bb2(%5: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      %6 = arith.addi %5, %c4_i32 : i32
      "simt_step.yield"(%6) {fallthrough = true} : (i32) -> ()
    ^bb3(%7: i32):  // no predecessors
      %c8_i32 = arith.constant 8 : i32
      %8 = arith.addi %7, %c8_i32 : i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

