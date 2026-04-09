"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "wave_any_kernel"}> ({
    %0 = "simt_step.group_thread_id"() : () -> i32 loc(#loc2)
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc(#loc2)
    %2 = "arith.cmpi"(%0, %1) <{predicate = 0 : i64}> : (i32, i32) -> i1 loc(#loc2)
    %3 = "simt_step.wave_any"(%2) {site_id = 70 : i64} : (i1) -> i1 loc(#loc2)
    "simt_step.if"(%3) ({
      "func.return"() : () -> () loc(#loc4)
    }, {
      "simt_step.yield"() : () -> () loc(#loc3)
    }) : (i1) -> () loc(#loc3)
    "func.return"() : () -> () loc(#loc5)
  }) {simt.num_threads = [32, 1, 1]} : () -> () loc(#loc1)
}) : () -> () loc(#loc)
#loc = loc(unknown)
#loc1 = loc("real_source_cuda_wave_any.cu":1:1)
#loc2 = loc("real_source_cuda_wave_any.cu":2:1)
#loc3 = loc("real_source_cuda_wave_any.cu":3:1)
#loc4 = loc("real_source_cuda_wave_any.cu":4:1)
#loc5 = loc("real_source_cuda_wave_any.cu":6:1)
