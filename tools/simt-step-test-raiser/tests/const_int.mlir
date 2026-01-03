func.func @main() attributes {simt.num_threads = array<i64: 1, 2, 3>} {
    %1 = arith.constant 42 : i32
    %2 = arith.constant 1 : i1
    %3 = arith.constant 64 : i64
    func.return
}