module {
  func.func @main(
      %arg0: !simt_step.resource<Global, f16>,
      %arg1: !simt_step.resource<Global, f16>,
      %arg2: !simt_step.resource<Global, f32>)
      attributes {simt.num_threads = [32, 1, 1], simt.subgroup_width = 32 : i64} {
    %base = arith.constant 0 : i32
    %stride = arith.constant 16 : i32
    %zero = arith.constant 0.0 : f32

    %acc = "simt_step.wmma_fill"(%zero)
        : (f32) -> !simt_step.wmma_fragment<Accumulator, 16 x 16 x 16, f32, None>
    %a = "simt_step.wmma_load_matrix"(%arg0, %base, %stride)
        : (!simt_step.resource<Global, f16>, i32, i32)
        -> !simt_step.wmma_fragment<MatrixA, 16 x 16 x 16, f16, ColMajor>
    %b = "simt_step.wmma_load_matrix"(%arg1, %base, %stride)
        : (!simt_step.resource<Global, f16>, i32, i32)
        -> !simt_step.wmma_fragment<MatrixB, 16 x 16 x 16, f16, RowMajor>
    %res = "simt_step.wmma_mma"(%a, %b, %acc)
        : (!simt_step.wmma_fragment<MatrixA, 16 x 16 x 16, f16, ColMajor>,
           !simt_step.wmma_fragment<MatrixB, 16 x 16 x 16, f16, RowMajor>,
           !simt_step.wmma_fragment<Accumulator, 16 x 16 x 16, f32, None>)
        -> !simt_step.wmma_fragment<Accumulator, 16 x 16 x 16, f32, None>
    "simt_step.wmma_store_matrix"(%arg2, %base, %stride, %res)
        {layout = 1 : i32}
        : (!simt_step.resource<Global, f32>, i32, i32,
           !simt_step.wmma_fragment<Accumulator, 16 x 16 x 16, f32, None>) -> ()
    return
  }
}
