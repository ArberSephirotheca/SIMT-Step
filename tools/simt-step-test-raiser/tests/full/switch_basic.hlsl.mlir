module {
  func.func @main(%arg0: i32) attributes {simt.num_threads = array<i64: 1, 1, 1>} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %false = arith.constant false
    %1:4 = "simt_step.switch"(%0, %c0_i32, %false, %false, %false) ({
    ^bb0(%arg1: i32, %arg2: i1, %arg3: i1, %arg4: i1):
      %false_0 = arith.constant false
      %true = arith.constant true
      %2 = arith.cmpi eq, %arg4, %false_0 : i1
      %3 = arith.cmpi eq, %arg2, %false_0 : i1
      %c0_i32_1 = arith.constant 0 : i32
      %4 = arith.cmpi eq, %0, %c0_i32_1 : i32
      %5 = arith.andi %3, %2 : i1
      %6 = arith.andi %5, %4 : i1
      %7 = arith.ori %arg3, %6 : i1
      %8 = arith.andi %7, %2 : i1
      %9:4 = "simt_step.if"(%8) ({
        %true_8 = arith.constant true
        %false_9 = arith.constant false
        %true_10 = arith.constant true
        %44 = arith.ori %arg2, %6 : i1
        "simt_step.yield"(%arg1, %44, %true, %arg4) : (i32, i1, i1, i1) -> ()
      }, {
        "simt_step.yield"(%arg1, %arg2, %arg3, %arg4) : (i32, i1, i1, i1) -> ()
      }) : (i1) -> (i32, i1, i1, i1)
      "simt_step.yield"(%9#0, %9#1, %9#2, %9#3) : (i32, i1, i1, i1) -> ()
    ^bb1(%10: i32, %11: i1, %12: i1, %13: i1):  // no predecessors
      %false_2 = arith.constant false
      %true_3 = arith.constant true
      %14 = arith.cmpi eq, %13, %false_2 : i1
      %15 = arith.cmpi eq, %11, %false_2 : i1
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.cmpi eq, %0, %c1_i32 : i32
      %17 = arith.andi %15, %14 : i1
      %18 = arith.andi %17, %16 : i1
      %19 = arith.ori %12, %18 : i1
      %20 = arith.andi %19, %14 : i1
      %21:4 = "simt_step.if"(%20) ({
        %true_8 = arith.constant true
        %false_9 = arith.constant false
        %true_10 = arith.constant true
        %c2_i32_11 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_11, %true_8, %false_9, %true_10) : (i32, i1, i1, i1) -> ()
      }, {
        "simt_step.yield"(%10, %11, %12, %13) : (i32, i1, i1, i1) -> ()
      }) : (i1) -> (i32, i1, i1, i1)
      "simt_step.yield"(%21#0, %21#1, %21#2, %21#3) : (i32, i1, i1, i1) -> ()
    ^bb2(%22: i32, %23: i1, %24: i1, %25: i1):  // no predecessors
      %false_4 = arith.constant false
      %true_5 = arith.constant true
      %26 = arith.cmpi eq, %25, %false_4 : i1
      %27 = arith.cmpi eq, %23, %false_4 : i1
      %c2_i32 = arith.constant 2 : i32
      %28 = arith.cmpi eq, %0, %c2_i32 : i32
      %29 = arith.andi %27, %26 : i1
      %30 = arith.andi %29, %28 : i1
      %31 = arith.ori %24, %30 : i1
      %32 = arith.andi %31, %26 : i1
      %33:4 = "simt_step.if"(%32) ({
        %true_8 = arith.constant true
        %false_9 = arith.constant false
        %true_10 = arith.constant true
        %c5_i32 = arith.constant 5 : i32
        %44 = arith.ori %23, %30 : i1
        "simt_step.yield"(%c5_i32, %44, %true_5, %25) : (i32, i1, i1, i1) -> ()
      }, {
        "simt_step.yield"(%22, %23, %24, %25) : (i32, i1, i1, i1) -> ()
      }) : (i1) -> (i32, i1, i1, i1)
      "simt_step.yield"(%33#0, %33#1, %33#2, %33#3) : (i32, i1, i1, i1) -> ()
    ^bb3(%34: i32, %35: i1, %36: i1, %37: i1):  // no predecessors
      %false_6 = arith.constant false
      %true_7 = arith.constant true
      %38 = arith.cmpi eq, %37, %false_6 : i1
      %39 = arith.cmpi eq, %35, %false_6 : i1
      %40 = arith.andi %39, %38 : i1
      %41 = arith.ori %36, %40 : i1
      %42 = arith.andi %41, %38 : i1
      %43:4 = "simt_step.if"(%42) ({
        %true_8 = arith.constant true
        %false_9 = arith.constant false
        %true_10 = arith.constant true
        %c7_i32 = arith.constant 7 : i32
        "simt_step.yield"(%c7_i32, %true_8, %false_9, %true_10) : (i32, i1, i1, i1) -> ()
      }, {
        "simt_step.yield"(%34, %35, %36, %37) : (i32, i1, i1, i1) -> ()
      }) : (i1) -> (i32, i1, i1, i1)
      "simt_step.yield"(%43#0, %43#1, %43#2, %43#3) : (i32, i1, i1, i1) -> ()
    }) {case_values = array<i64: 0, 1, 2, 0>} : (i32, i32, i1, i1, i1) -> (i32, i1, i1, i1)
    return
  }
}

