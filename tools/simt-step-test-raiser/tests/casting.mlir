func.func @main() attributes {simt.num_threads = array<i64: 1, 1, 1>} {

    %i32 = arith.constant 32 : i32
    %i64 = arith.constant 64 : i64
    %f32 = arith.constant 3.2 : f32
    %f64 = arith.constant 6.4 : f64
    
    %1 = arith.extui %i32 : i32 to i64
    %2 = arith.trunci %i64 : i64 to i32
    %3 = arith.extf %f32 : f32 to f64
    %4 = arith.truncf %f64 : f64 to f32


    func.return
}