func.func @main() attributes {simt.num_threads = array<i64: 1, 2, 3>} {
    %1 = arith.constant 1.1 : f32
    %3 = arith.constant 2.2 : f64
    func.return
}