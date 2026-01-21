"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "main"}> ({
  ^bb0(%arg0: i32):
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.cmpi"(%0, %1) <{predicate = 0 : i64}> : (i32, i32) -> i1
    %3 = "simt_step.wave_all"(%2) : (i1) -> i1
    %4 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %5 = "arith.cmpi"(%0, %4) <{predicate = 1 : i64}> : (i32, i32) -> i1
    %6 = "simt_step.wave_any"(%5) : (i1) -> i1
    %7 = "simt_step.lane_id"() : () -> index
    %8 = "arith.index_cast"(%7) : (index) -> i32
    %9 = "simt_step.if"(%3) ({
      "simt_step.yield"(%6) : (i1) -> ()
    }, {
      %14 = "arith.constant"() <{value = false}> : () -> i1
      "simt_step.yield"(%14) : (i1) -> ()
    }) : (i1) -> i1
    %10 = "simt_step.if"(%9) ({
      %12 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %13 = "arith.cmpi"(%8, %12) <{predicate = 0 : i64}> : (i32, i32) -> i1
      "simt_step.yield"(%13) : (i1) -> ()
    }, {
      %11 = "arith.constant"() <{value = false}> : () -> i1
      "simt_step.yield"(%11) : (i1) -> ()
    }) : (i1) -> i1
    "simt_step.if"(%10) ({
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    func.return
  }) {simt.num_threads = array<i64: 1, 1, 1>} : () -> ()
}) : () -> ()

