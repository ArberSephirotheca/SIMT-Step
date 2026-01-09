module {
  func.func @main(%arg0: i32) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg1: i32, %arg2: i32):
      %c4_i32 = arith.constant 4 : i32
      %2 = arith.cmpi slt, %arg2, %c4_i32 : i32
      "simt_step.condition"(%2, %arg1, %arg2) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg1: i32, %arg2: i32):
      %2 = "simt_step.switch"(%arg2, %arg1) ({
      ^bb0(%arg3: i32):
        %c1_i32_1 = arith.constant 1 : i32
        %4 = arith.addi %arg3, %c1_i32_1 : i32
        "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
      ^bb1(%5: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %6 = arith.addi %5, %c2_i32 : i32
        "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
      ^bb2(%7: i32):  // no predecessors
        %c4_i32 = arith.constant 4 : i32
        %8 = arith.addi %7, %c4_i32 : i32
        "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.addi %arg2, %c1_i32 : i32
      "simt_step.yield"(%2, %3) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

