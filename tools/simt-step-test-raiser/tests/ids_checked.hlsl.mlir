module {
  func.func @main(%arg0: i32, %arg1: !simt_step.resource<Global, i32>) attributes {simt.num_threads = array<i64: 64, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c64_i32 = arith.constant 64 : i32
    %1 = arith.muli %0, %c64_i32 : i32
    %c0_i32 = arith.constant 0 : i32
    %2 = arith.addi %1, %c0_i32 : i32
    "simt_step.buffer.store"(%arg1, %2, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c64_i32_0 = arith.constant 64 : i32
    %4 = arith.muli %0, %c64_i32_0 : i32
    %c1_i32 = arith.constant 1 : i32
    %5 = arith.addi %4, %c1_i32 : i32
    "simt_step.buffer.store"(%arg1, %5, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %6 = simt_step.lane_id
    %7 = arith.index_cast %6 : index to i32
    %c64_i32_1 = arith.constant 64 : i32
    %8 = arith.muli %0, %c64_i32_1 : i32
    %c2_i32 = arith.constant 2 : i32
    %9 = arith.addi %8, %c2_i32 : i32
    "simt_step.buffer.store"(%arg1, %9, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

