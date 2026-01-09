module {
  func.func @main(%arg0: i32) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = "simt_step.switch"(%0, %c0_i32) ({
    ^bb0(%arg1: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %2 = "simt_step.loop"(%arg1) ({
      ^bb0(%arg2: i32):
        %c3_i32 = arith.constant 3 : i32
        %5 = arith.cmpi slt, %c0_i32_0, %c3_i32 : i32
        "simt_step.condition"(%5, %arg2) : (i1, i32) -> ()
      }, {
      ^bb0(%arg2: i32):
        %5 = arith.addi %arg2, %c0_i32_0 : i32
        "simt_step.break"(%5) : (i32) -> ()
      }) : (i32) -> i32
      "simt_step.yield"(%2) {fallthrough = false} : (i32) -> ()
    ^bb1(%3: i32):  // no predecessors
      %c5_i32 = arith.constant 5 : i32
      %4 = arith.addi %3, %c5_i32 : i32
      "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

