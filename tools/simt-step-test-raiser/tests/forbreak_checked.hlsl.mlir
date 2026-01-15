module {
  func.func @main(%arg0: i32, %arg1: !simt_step.resource<Global, i32>) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c10_i32 = arith.constant 10 : i32
      %2 = arith.cmpi slt, %arg3, %c10_i32 : i32
      "simt_step.condition"(%2, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %2 = arith.addi %arg2, %arg3 : i32
      %c20_i32 = arith.constant 20 : i32
      %3 = arith.cmpi slt, %2, %c20_i32 : i32
      %4:2 = "simt_step.if"(%3) ({
        "simt_step.break"(%2, %arg3) : (i32, i32) -> ()
      }, {
        "simt_step.yield"(%2, %arg3) : (i32, i32) -> ()
      }) : (i1) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %4#1, %c1_i32 : i32
      "simt_step.yield"(%4#0, %5) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_1 = arith.constant 0 : i32
    "simt_step.buffer.store"(%arg1, %c0_i32_1, %1#0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

