func.func @main() attributes {simt.num_threads = array<i64: 1, 1, 1>} {

    %1 = arith.constant 1 : i32
    %2 = arith.constant 2 : i32

    %ia = arith.cmpi eq, %1, %2 : i32
    %ib = arith.cmpi ne, %1, %2 : i32
    %ic = arith.cmpi ult, %1, %2 : i32
    %id = arith.cmpi slt, %1, %2 : i32
    %ie = arith.cmpi ugt, %1, %2 : i32
    %if = arith.cmpi sgt, %1, %2 : i32
    %ig = arith.cmpi ule, %1, %2 : i32
    %ih = arith.cmpi sle, %1, %2 : i32
    %ij = arith.cmpi uge, %1, %2 : i32
    %ik = arith.cmpi sge, %1, %2 : i32
    %il = arith.select %ik, %1, %2 : i32


    %3 = arith.constant 1.1 : f32
    %4 = arith.constant 2.2 : f32
    %fa = arith.cmpf oeq, %3, %4 : f32
    %fb = arith.cmpf ueq, %3, %4 : f32
    %fc = arith.cmpf one, %3, %4 : f32
    %fd = arith.cmpf une, %3, %4 : f32
    %fe = arith.cmpf olt, %3, %4 : f32
    %ff = arith.cmpf ult, %3, %4 : f32
    %fg = arith.cmpf ole, %3, %4 : f32
    %fh = arith.cmpf ule, %3, %4 : f32
    %fi = arith.cmpf ogt, %3, %4 : f32
    %fj = arith.cmpf ugt, %3, %4 : f32
    %fk = arith.cmpf oge, %3, %4 : f32
    %fl = arith.cmpf uge, %3, %4 : f32
    %fo = arith.select %fl, %3, %4 : f32

    func.return
}