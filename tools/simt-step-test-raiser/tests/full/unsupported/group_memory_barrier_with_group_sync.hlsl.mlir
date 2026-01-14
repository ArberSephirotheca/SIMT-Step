module {
  func.func @main(%arg0: i32) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    simt_step.fence {scope = #simt_step.scope<Workgroup>, memsem = #simt_step.memsem<AcqRel>, memspace = #simt_step.memspace<Shared>}
    simt_step.barrier {scope = #simt_step.scope<Workgroup>, memsem = #simt_step.memsem<AcqRel>}
    return
  }
}

