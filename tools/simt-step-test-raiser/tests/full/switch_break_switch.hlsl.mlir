module {
  func.func @main(%arg0: i32) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg1: i32, %arg2: i32):
      %c4_i32 = arith.constant 4 : i32
      %2 = arith.cmpi slt, %arg2, %c4_i32 : i32
      "simt_step.condition"(%2, %arg1, %arg2) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg1: i32, %arg2: i32):
      %false = arith.constant false
      %2:4 = "simt_step.switch"(%arg2, %arg1, %false, %false, %false) ({
      ^bb0(%arg3: i32, %arg4: i1, %arg5: i1, %arg6: i1):
        %false_1 = arith.constant false
        %true = arith.constant true
        %4 = arith.cmpi eq, %arg6, %false_1 : i1
        %5 = arith.cmpi eq, %arg4, %false_1 : i1
        %c0_i32_2 = arith.constant 0 : i32
        %6 = arith.cmpi eq, %arg2, %c0_i32_2 : i32
        %7 = arith.andi %5, %4 : i1
        %8 = arith.andi %7, %6 : i1
        %9 = arith.ori %arg5, %8 : i1
        %10 = arith.andi %9, %4 : i1
        %11:4 = "simt_step.if"(%10) ({
          %true_8 = arith.constant true
          %false_9 = arith.constant false
          %true_10 = arith.constant true
          %c1_i32_11 = arith.constant 1 : i32
          %34 = arith.addi %arg3, %c1_i32_11 : i32
          "simt_step.yield"(%34, %true_8, %false_9, %true_10) : (i32, i1, i1, i1) -> ()
        }, {
          "simt_step.yield"(%arg3, %arg4, %arg5, %arg6) : (i32, i1, i1, i1) -> ()
        }) : (i1) -> (i32, i1, i1, i1)
        "simt_step.yield"(%11#0, %11#1, %11#2, %11#3) : (i32, i1, i1, i1) -> ()
      ^bb1(%12: i32, %13: i1, %14: i1, %15: i1):  // no predecessors
        %false_3 = arith.constant false
        %true_4 = arith.constant true
        %16 = arith.cmpi eq, %15, %false_3 : i1
        %17 = arith.cmpi eq, %13, %false_3 : i1
        %c1_i32_5 = arith.constant 1 : i32
        %18 = arith.cmpi eq, %arg2, %c1_i32_5 : i32
        %19 = arith.andi %17, %16 : i1
        %20 = arith.andi %19, %18 : i1
        %21 = arith.ori %14, %20 : i1
        %22 = arith.andi %21, %16 : i1
        %23:4 = "simt_step.if"(%22) ({
          %true_8 = arith.constant true
          %false_9 = arith.constant false
          %true_10 = arith.constant true
          %c2_i32 = arith.constant 2 : i32
          %34 = arith.addi %12, %c2_i32 : i32
          "simt_step.yield"(%34, %true_8, %false_9, %true_10) : (i32, i1, i1, i1) -> ()
        }, {
          "simt_step.yield"(%12, %13, %14, %15) : (i32, i1, i1, i1) -> ()
        }) : (i1) -> (i32, i1, i1, i1)
        "simt_step.yield"(%23#0, %23#1, %23#2, %23#3) : (i32, i1, i1, i1) -> ()
      ^bb2(%24: i32, %25: i1, %26: i1, %27: i1):  // no predecessors
        %false_6 = arith.constant false
        %true_7 = arith.constant true
        %28 = arith.cmpi eq, %27, %false_6 : i1
        %29 = arith.cmpi eq, %25, %false_6 : i1
        %30 = arith.andi %29, %28 : i1
        %31 = arith.ori %26, %30 : i1
        %32 = arith.andi %31, %28 : i1
        %33:4 = "simt_step.if"(%32) ({
          %true_8 = arith.constant true
          %false_9 = arith.constant false
          %true_10 = arith.constant true
          %c4_i32 = arith.constant 4 : i32
          %34 = arith.addi %24, %c4_i32 : i32
          "simt_step.yield"(%34, %true_8, %false_9, %true_10) : (i32, i1, i1, i1) -> ()
        }, {
          "simt_step.yield"(%24, %25, %26, %27) : (i32, i1, i1, i1) -> ()
        }) : (i1) -> (i32, i1, i1, i1)
        "simt_step.yield"(%33#0, %33#1, %33#2, %33#3) : (i32, i1, i1, i1) -> ()
      }) {case_values = array<i64: 0, 1, 0>} : (i32, i32, i1, i1, i1) -> (i32, i1, i1, i1)
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.addi %arg2, %c1_i32 : i32
      "simt_step.yield"(%2#0, %3) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

