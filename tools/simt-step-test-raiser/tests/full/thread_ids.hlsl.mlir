"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xi32>, vector<3xi32>, i32, vector<3xi32>) -> (), sym_name = "main"}> ({
  ^bb0(%arg0: vector<3xi32>, %arg1: vector<3xi32>, %arg2: i32, %arg3: vector<3xi32>):
    %0 = "simt_step.group_thread_id"() : () -> vector<3xi32>
    %1 = "simt_step.group_id"() : () -> vector<3xi32>
    %2 = "simt_step.group_index"() : () -> i32
    %3 = "simt_step.dispatch_thread_id"() : () -> vector<3xi32>
    %4 = "vector.extract"(%0) <{static_position = array<i64: 0>}> : (vector<3xi32>) -> i32
    %5 = "vector.extract"(%1) <{static_position = array<i64: 1>}> : (vector<3xi32>) -> i32
    %6 = "arith.addi"(%4, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %7 = "arith.addi"(%6, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %8 = "vector.extract"(%3) <{static_position = array<i64: 2>}> : (vector<3xi32>) -> i32
    %9 = "arith.addi"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %10 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %11 = "arith.cmpi"(%9, %10) <{predicate = 0 : i64}> : (i32, i32) -> i1
    "simt_step.if"(%11) ({
      "func.return"() : () -> ()
    }, {
    }) : (i1) -> ()
  }) {simt.num_threads = array<i64: 2, 3, 4>} : () -> ()
}) : () -> ()

