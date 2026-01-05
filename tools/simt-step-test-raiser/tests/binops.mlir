func.func @main() attributes {simt.num_threads = array<i64: 1, 2, 3>} {
    %1 = arith.constant 1.1 : f64
    %2 = arith.constant 2.2 : f64
    %31 = arith.addf %1, %2 : f64
    %32 = arith.subf %1, %2 : f64
    %33 = arith.mulf %1, %2 : f64
    %34 = arith.divf %1, %2 : f64
    %35 = arith.remf %1, %2 : f64

    %4 = arith.constant 1 : i32
    %5 = arith.constant 2 : i32
    %61 = arith.subi %4, %5 : i32
    %62 = arith.muli %4, %5 : i32
    %63 = arith.divsi %4, %5 : i32
    %65 = arith.divui %4, %5 : i32
    %64 = arith.addi %4, %5 : i32
    %66 = arith.andi %4, %5 : i32
    %67 = arith.ori %4, %5 : i32
    %68 = arith.xori %4, %5 : i32
    %69 = arith.remsi %4, %5 : i32
    %610 = arith.remui %4, %5 : i32

    %7 = arith.addi %68, %61 : i32
    func.return
}