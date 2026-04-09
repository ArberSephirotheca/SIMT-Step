#include "simt-step/Dialect/SimtStep/SimtStepDialect.h"

#include <mlir/IR/Dialect.h>
#include <mlir/IR/DialectImplementation.h>
#include <mlir/IR/DialectRegistry.h>

#include "SimtStepEnums.cpp.inc"
#include "SimtStepTypes.cpp.inc"

#include <llvm/ADT/TypeSwitch.h>
#include <mlir/IR/Builders.h>

#define GET_TYPEDEF_CLASSES
#include "SimtStepTypes.cpp.inc"
#undef GET_TYPEDEF_CLASSES

using namespace mlir;

namespace simt::dialect {

void registerSimtStepDialect(DialectRegistry &registry) {
  registry.insert<::simt::dialect::SimtStepDialect>();
}

void SimtStepDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "SimtStepOps.cpp.inc"
#undef GET_OP_LIST
      >();

  addTypes<
#define GET_TYPEDEF_LIST
#include "SimtStepTypes.cpp.inc"
#undef GET_TYPEDEF_LIST
      >();
}

} // namespace simt::dialect

#include "SimtStepDialect.cpp.inc"

namespace simt::dialect {

mlir::LogicalResult
MaskType::verify(::llvm::function_ref<::mlir::InFlightDiagnostic()> emitError,
                 uint64_t width) {
  if (width == 0)
    return emitError() << "mask width must be positive";
  return mlir::success();
}

mlir::LogicalResult ResourceType::verify(
    ::llvm::function_ref<::mlir::InFlightDiagnostic()> emitError,
    simt::dialect::MemorySpace memorySpace, mlir::Type elementType) {
  if (!elementType)
    return emitError() << "resource element type must be non-null";
  switch (memorySpace) {
  case simt::dialect::MemorySpace::Generic:
  case simt::dialect::MemorySpace::Global:
  case simt::dialect::MemorySpace::Shared:
  case simt::dialect::MemorySpace::Private:
    return mlir::success();
  }
  return emitError() << "invalid memory space for resource";
}

mlir::LogicalResult WmmaFragmentType::verify(
    ::llvm::function_ref<::mlir::InFlightDiagnostic()> emitError,
    simt::dialect::WmmaRole role, uint64_t m, uint64_t n, uint64_t k,
    mlir::Type elementType, simt::dialect::WmmaLayout layout) {
  if (!elementType)
    return emitError() << "wmma fragment element type must be non-null";
  if (m != 16 || n != 16 || k != 16)
    return emitError() << "only m16n16k16 fragments are currently supported";

  switch (role) {
  case simt::dialect::WmmaRole::MatrixA:
    if (!mlir::isa<mlir::Float16Type>(elementType))
      return emitError() << "matrix_a fragments must use f16 elements";
    if (layout != simt::dialect::WmmaLayout::ColMajor)
      return emitError() << "matrix_a fragments must use col_major layout";
    return mlir::success();
  case simt::dialect::WmmaRole::MatrixB:
    if (!mlir::isa<mlir::Float16Type>(elementType))
      return emitError() << "matrix_b fragments must use f16 elements";
    if (layout != simt::dialect::WmmaLayout::RowMajor)
      return emitError() << "matrix_b fragments must use row_major layout";
    return mlir::success();
  case simt::dialect::WmmaRole::Accumulator:
    if (!mlir::isa<mlir::Float32Type>(elementType))
      return emitError() << "accumulator fragments must use f32 elements";
    if (layout != simt::dialect::WmmaLayout::None)
      return emitError() << "accumulator fragments must use none layout";
    return mlir::success();
  }

  return emitError() << "invalid WMMA fragment role";
}

} // namespace simt::dialect
