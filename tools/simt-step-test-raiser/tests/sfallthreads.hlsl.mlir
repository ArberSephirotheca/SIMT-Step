module {
  func.func @main(%arg0: i32, %arg1: !simt_step.resource<Global, i32>) attributes {simt.num_threads = array<i64: 63, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %c3_i32 = arith.constant 3 : i32
    %1 = arith.remsi %0, %c3_i32 : i32
    %2:1 = "simt_step.switch"(%1, %c0_i32) ({
    ^bb0(%arg3: i32):
      %c5_i32 = arith.constant 5 : i32
      %3 = arith.addi %arg3, %c5_i32 : i32
      "simt_step.yield"(%3) {fallthrough = false} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %true = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg1, %0, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c3_i32_0 = arith.constant 3 : i32
      %7 = arith.addi %5, %c3_i32_0 : i32
      "simt_step.yield"(%7) {fallthrough = true} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %9, %c1_i32 : i32
      "simt_step.yield"(%10) {fallthrough = false} : ( i32) -> ()
    }) {case_values = array<i64: 1, 2>, default_index = 1 : i64} : (i32,  i32) -> ( i32)
    return
  }
}

