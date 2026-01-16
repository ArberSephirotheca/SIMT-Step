module {
  func.func @main(%arg0: !simt_step.resource<Global, i32>) attributes {simt.num_threads = [8, 1, 1], simt.subgroup_width = 4 : i64} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %true = arith.cmpi eq, %0, %0 : i32
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %0, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}