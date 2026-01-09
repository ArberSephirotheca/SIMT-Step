module {
  func.func @main(%arg0: vector<3xi32>) attributes {simt.num_threads = array<i64: 4, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> vector<3xi32>
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg1: i32, %arg2: i32):
      %c4_i32 = arith.constant 4 : i32
      %2 = arith.cmpi slt, %arg2, %c4_i32 : i32
      "simt_step.condition"(%2, %arg1, %arg2) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg1: i32, %arg2: i32):
      %2 = vector.extract %0[0] : i32 from vector<3xi32>
      %c3_i32 = arith.constant 3 : i32
      %3 = arith.cmpi eq, %2, %c3_i32 : i32
      %4:2 = "simt_step.if"(%3) ({
        "simt_step.break"(%arg1, %arg2) : (i32, i32) -> ()
      }, {
        "simt_step.yield"(%arg1, %arg2) : (i32, i32) -> ()
      }) : (i1) -> (i32, i32)
      %5 = arith.addi %4#0, %4#1 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %4#1, %c1_i32 : i32
      "simt_step.yield"(%5, %6) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

