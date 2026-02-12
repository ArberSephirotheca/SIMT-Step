set(LLVM_TARGET_DEFINITIONS
    ${PROJECT_SOURCE_DIR}/include/simt-step/Dialect/SimtStep/SimtStep.td)

set(_simt_tablegen_include_dirs
    ${MLIR_MAIN_INCLUDE_DIR}
    ${MLIR_INCLUDE_DIRS}
    ${LLVM_MAIN_INCLUDE_DIR}
    ${LLVM_INCLUDE_DIRS}
    ${PROJECT_SOURCE_DIR}/include)
list(FILTER _simt_tablegen_include_dirs EXCLUDE REGEX "^$")
list(REMOVE_DUPLICATES _simt_tablegen_include_dirs)

set(MLIR_TABLEGEN_INCLUDE_DIRECTORIES ${_simt_tablegen_include_dirs})

set(_simt_tablegen_includes)
foreach(inc_dir IN LISTS _simt_tablegen_include_dirs)
    list(APPEND _simt_tablegen_includes -I${inc_dir})
endforeach()

mlir_tablegen(SimtStepDialect.h.inc -gen-dialect-decls -dialect=simt_step
    ${_simt_tablegen_includes})
mlir_tablegen(SimtStepDialect.cpp.inc -gen-dialect-defs -dialect=simt_step
    ${_simt_tablegen_includes})
mlir_tablegen(SimtStepOps.h.inc -gen-op-decls
    ${_simt_tablegen_includes})
mlir_tablegen(SimtStepOps.cpp.inc -gen-op-defs
    ${_simt_tablegen_includes})
mlir_tablegen(SimtStepEnums.h.inc -gen-enum-decls
    ${_simt_tablegen_includes})
mlir_tablegen(SimtStepEnums.cpp.inc -gen-enum-defs
    ${_simt_tablegen_includes})
mlir_tablegen(SimtStepTypes.h.inc -gen-typedef-decls
    ${_simt_tablegen_includes})
mlir_tablegen(SimtStepTypes.cpp.inc -gen-typedef-defs
    ${_simt_tablegen_includes})

add_public_tablegen_target(SimtStepDialectIncGen)

set(SIMT_STEP_DIALECT_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/SimtStepDialect.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/SimtStepOps.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/NormalizeLoopTerminators.cpp)

foreach(src ${SIMT_STEP_DIALECT_SOURCES})
  target_sources(simt-step PRIVATE ${src})
endforeach()

target_include_directories(simt-step
    PUBLIC
        ${CMAKE_CURRENT_BINARY_DIR}
)

add_dependencies(simt-step SimtStepDialectIncGen)
