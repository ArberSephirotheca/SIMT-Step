module {
  func.func @main(%arg0: i32) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = "simt_step.switch"(%0, %c0_i32) ({
    ^bb0(%arg1: i32):
      "simt_step.yield"(%arg1) {fallthrough = true} : (i32) -> ()
    ^bb1(%2: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
    ^bb2(%3: i32):  // no predecessors
      %c5_i32 = arith.constant 5 : i32
      "simt_step.yield"(%c5_i32) {fallthrough = true} : (i32) -> ()
    ^bb3(%4: i32):  // no predecessors
      %c7_i32 = arith.constant 7 : i32
      "simt_step.yield"(%c7_i32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

