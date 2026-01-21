// Copyright (c) 2024.
// SPDX-License-Identifier: Apache-2.0

#pragma once

#include <cstdint>
#include <optional>
#include <string>
#include <vector>

#include <llvm/ADT/StringRef.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/Support/YAMLTraits.h>

namespace simt::runner {

struct InitEntry {
    int64_t index = 0;
    int64_t value = 0;
};

struct InitBuffer {
    std::string buffer;
    std::optional<int64_t> size;
    std::optional<int64_t> fill;
    std::vector<InitEntry> entries;
};

struct InitFile {
    std::vector<InitBuffer> buffers;
};
} // namespace simt::runner

LLVM_YAML_IS_SEQUENCE_VECTOR(simt::runner::InitEntry)
LLVM_YAML_IS_SEQUENCE_VECTOR(simt::runner::InitBuffer)

namespace llvm::yaml {

template <>
struct MappingTraits<simt::runner::InitEntry> {
    static void mapping(IO &io, simt::runner::InitEntry &entry) {
        io.mapRequired("index", entry.index);
        io.mapRequired("value", entry.value);
    }
};

template <>
struct MappingTraits<simt::runner::InitBuffer> {
    static void mapping(IO &io, simt::runner::InitBuffer &buffer) {
        io.mapRequired("buffer", buffer.buffer);
        io.mapOptional("size", buffer.size);
        io.mapOptional("fill", buffer.fill);
        io.mapOptional("entries", buffer.entries);
    }
};

template <>
struct MappingTraits<simt::runner::InitFile> {
    static void mapping(IO &io, simt::runner::InitFile &file) {
        io.mapOptional("buffers", file.buffers);
    }
};

} // namespace llvm::yaml

namespace simt::runner {

namespace detail {

inline bool parseInitYaml(llvm::StringRef yamlText, InitFile &out,
                          std::string &error) {
    llvm::yaml::Input yin(yamlText);
    yin >> out;
    if (auto err = yin.error()) {
        error = err.message();
        return false;
    }
    return true;
}

} // namespace detail

inline bool loadInitYamlFile(llvm::StringRef path, InitFile &out,
                             std::string &error) {
    auto fileOrErr = llvm::MemoryBuffer::getFile(path);
    if (!fileOrErr) {
        error = fileOrErr.getError().message();
        return false;
    }
    return detail::parseInitYaml(fileOrErr.get()->getBuffer(), out, error);
}

inline bool loadInitYamlBuffer(llvm::StringRef yamlText, InitFile &out,
                               std::string &error) {
    return detail::parseInitYaml(yamlText, out, error);
}

} // namespace simt::runner
