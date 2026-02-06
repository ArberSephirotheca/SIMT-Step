func.func @main(%outmem: !simt_step.resource<Global, i32>) attributes {simt.num_threads = array<i64: 8, 1, 1>} {

    %c0 = arith.constant 0 : i32
    %c1 = arith.constant 1 : i32
    %tid = "simt_step.dispatch_thread_id"() : () -> i32

    %1 = "simt_step.loop"(%c0) ({
    ^bb0(%arg1: i32):
      %c3_i32 = arith.constant 2 : i32
      %2 = arith.cmpi slt, %arg1, %c3_i32 : i32
      "simt_step.condition"(%2, %arg1) : (i1, i32) -> ()
    }, {
    ^bb0(%arg1outer: i32):
        %1 = "simt_step.loop"(%c0) ({
        ^bb0(%arg1inner: i32):
            %2 = arith.cmpi slt, %arg1inner, %tid : i32
            "simt_step.condition"(%2, %arg1inner) : (i1, i32) -> ()
        }, {
        ^bb0(%arg1inner: i32):
            %true = arith.constant true
            %nthreads = "simt_step.wave_count_bits"(%true) : (i1) -> i32
            "simt_step.buffer.store"(%outmem, %tid, %nthreads) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
            %3 = arith.addi %arg1inner, %c1 : i32
            "simt_step.yield"(%3) : (i32) -> ()
        }) : (i32) -> (i32)
      %3 = arith.addi %arg1outer, %c1 : i32
      "simt_step.yield"(%3) : (i32) -> ()
    }) : (i32) -> (i32)

    func.return
}