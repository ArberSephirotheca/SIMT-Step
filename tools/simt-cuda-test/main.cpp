#include <cuda.h>
#include <nvrtc.h>

#include <algorithm>
#include <cmath>
#include <cctype>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <filesystem>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <limits>
#include <optional>
#include <sstream>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <utility>
#include <vector>

#include "simt-step/Runner/InitYaml.h"

namespace {

struct Dim3 {
    std::uint32_t x = 1;
    std::uint32_t y = 1;
    std::uint32_t z = 1;
};

enum class ScalarType {
    I32,
    U32,
    F32,
};

struct ScalarValue {
    ScalarType type = ScalarType::I32;
    int32_t i32 = 0;
    uint32_t u32 = 0;
    float f32 = 0.0f;
};

struct BufferDef {
    std::string name;
    ScalarType type = ScalarType::I32;
    std::size_t size = 0;
    bool hasFill = false;
    ScalarValue fill;
    std::optional<std::size_t> fillSize;
    std::unordered_map<std::size_t, ScalarValue> inits;
};

enum class BindingKind {
    Buffer,
    Const,
};

struct Binding {
    BindingKind kind = BindingKind::Buffer;
    std::string bufferName;
    ScalarType type = ScalarType::I32;
    ScalarValue value;
};

struct ExpectEntry {
    std::string buffer;
    std::size_t index = 0;
    ScalarValue expected;
    std::optional<float> absTol;
    std::optional<float> relTol;
    int line = 0;
};

struct ExpectRangeEntry {
    std::string buffer;
    std::size_t start = 0;
    std::size_t end = 0;
    ScalarValue expected;
    std::optional<float> absTol;
    std::optional<float> relTol;
    int line = 0;
};

struct ExpectBufferEntry {
    std::string actual;
    std::string expected;
    std::optional<float> absTol;
    std::optional<float> relTol;
    int line = 0;
};

struct Script {
    std::unordered_map<std::string, BufferDef> buffers;
    bool hasKernel = false;
    std::string kernelName = "simt_kernel";
    std::string kernelSource;
    std::unordered_map<unsigned, Binding> bindings;
    bool hasLaunch = false;
    Dim3 grid;
    Dim3 block;
    std::vector<ExpectEntry> expects;
    std::vector<ExpectRangeEntry> expectRanges;
    std::vector<ExpectBufferEntry> expectBuffers;
};

struct BufferRuntime {
    BufferDef def;
    CUdeviceptr device = 0;
    std::vector<int32_t> i32;
    std::vector<uint32_t> u32;
    std::vector<float> f32;
};

struct Options {
    std::string scriptPath;
    std::string batchDir;
    bool batchRecursive = false;
    std::string reportPath;
    std::string initYamlPath;
    bool initYamlAuto = false;
    std::string cudaIncludePath;
    int deviceIndex = 0;
    std::string arch;
    bool dumpPtx = false;
};

static void checkCuda(CUresult result, const char *what);

struct CudaSession {
    CUdevice device = 0;
    CUcontext context = nullptr;

    CudaSession() = default;
    CudaSession(const CudaSession &) = delete;
    CudaSession &operator=(const CudaSession &) = delete;

    CudaSession(CudaSession &&other) noexcept : device(other.device), context(other.context) {
        other.device = 0;
        other.context = nullptr;
    }

    CudaSession &operator=(CudaSession &&other) noexcept {
        if (this == &other)
            return *this;
        if (context)
            cuCtxDestroy(context);
        device = other.device;
        context = other.context;
        other.device = 0;
        other.context = nullptr;
        return *this;
    }

    ~CudaSession() {
        if (context)
            cuCtxDestroy(context);
    }
};

static CudaSession createCudaSession(const Options &options) {
    checkCuda(cuInit(0), "cuInit");
    CudaSession session;
    checkCuda(cuDeviceGet(&session.device, options.deviceIndex), "cuDeviceGet");
    checkCuda(cuCtxCreate(&session.context, nullptr, 0, session.device), "cuCtxCreate");
    return session;
}

static std::string trim(const std::string &value) {
    std::size_t start = 0;
    while (start < value.size() && std::isspace(static_cast<unsigned char>(value[start])))
        ++start;
    std::size_t end = value.size();
    while (end > start && std::isspace(static_cast<unsigned char>(value[end - 1])))
        --end;
    return value.substr(start, end - start);
}

static bool isCommentLine(const std::string &line) {
    for (char ch : line) {
        if (!std::isspace(static_cast<unsigned char>(ch)))
            return ch == '#';
    }
    return false;
}

static std::vector<std::string> splitTokens(const std::string &line) {
    std::vector<std::string> tokens;
    std::istringstream stream(line);
    std::string tok;
    while (stream >> tok)
        tokens.push_back(tok);
    return tokens;
}

[[noreturn]] static void failLine(int line, const std::string &message) {
    throw std::runtime_error("error: line " + std::to_string(line) + ": " + message);
}

[[noreturn]] static void failError(const std::string &message) {
    throw std::runtime_error("error: " + message);
}

static ScalarType parseType(const std::string &token, int line) {
    if (token == "i32")
        return ScalarType::I32;
    if (token == "u32")
        return ScalarType::U32;
    if (token == "f32")
        return ScalarType::F32;
    failLine(line, "unknown type '" + token + "'");
    return ScalarType::I32;
}

static std::uint64_t parseUnsigned(const std::string &token, int line) {
    try {
        std::size_t idx = 0;
        unsigned long long value = std::stoull(token, &idx, 0);
        if (idx != token.size())
            failLine(line, "invalid integer '" + token + "'");
        return static_cast<std::uint64_t>(value);
    } catch (const std::exception &) {
        failLine(line, "invalid integer '" + token + "'");
    }
    return 0;
}

static long long parseSigned(const std::string &token, int line) {
    try {
        std::size_t idx = 0;
        long long value = std::stoll(token, &idx, 0);
        if (idx != token.size())
            failLine(line, "invalid integer '" + token + "'");
        return value;
    } catch (const std::exception &) {
        failLine(line, "invalid integer '" + token + "'");
    }
    return 0;
}

static float parseFloat(const std::string &token, int line) {
    try {
        std::size_t idx = 0;
        double value = std::stod(token, &idx);
        if (idx != token.size())
            failLine(line, "invalid float '" + token + "'");
        return static_cast<float>(value);
    } catch (const std::exception &) {
        failLine(line, "invalid float '" + token + "'");
    }
    return 0.0f;
}

static ScalarValue parseValue(const std::string &token, ScalarType type, int line) {
    ScalarValue value;
    value.type = type;
    switch (type) {
        case ScalarType::I32: {
            long long parsed = parseSigned(token, line);
            if (parsed < std::numeric_limits<int32_t>::min() ||
                parsed > std::numeric_limits<int32_t>::max()) {
                failLine(line, "i32 out of range: " + token);
            }
            value.i32 = static_cast<int32_t>(parsed);
            break;
        }
        case ScalarType::U32: {
            unsigned long long parsed = parseUnsigned(token, line);
            if (parsed > std::numeric_limits<uint32_t>::max())
                failLine(line, "u32 out of range: " + token);
            value.u32 = static_cast<uint32_t>(parsed);
            break;
        }
        case ScalarType::F32:
            value.f32 = parseFloat(token, line);
            break;
    }
    return value;
}

static std::string scalarToString(const ScalarValue &value) {
    std::ostringstream os;
    switch (value.type) {
        case ScalarType::I32:
            os << value.i32;
            break;
        case ScalarType::U32:
            os << value.u32;
            break;
        case ScalarType::F32:
            os << std::setprecision(9) << value.f32;
            break;
    }
    return os.str();
}

static ScalarValue castInitValue(ScalarType type, int64_t value,
                                 const std::string &bufferName) {
    ScalarValue out;
    out.type = type;
    switch (type) {
        case ScalarType::I32:
            if (value < std::numeric_limits<int32_t>::min() ||
                value > std::numeric_limits<int32_t>::max()) {
                failError("init-yaml buffer '" + bufferName + "': i32 out of range");
            }
            out.i32 = static_cast<int32_t>(value);
            break;
        case ScalarType::U32:
            if (value < 0 || value > std::numeric_limits<uint32_t>::max()) {
                failError("init-yaml buffer '" + bufferName + "': u32 out of range");
            }
            out.u32 = static_cast<uint32_t>(value);
            break;
        case ScalarType::F32:
            out.f32 = static_cast<float>(value);
            break;
    }
    return out;
}

static std::string getEnvVar(const char *name) {
    if (const char *value = std::getenv(name)) {
        if (*value)
            return std::string(value);
    }
    return {};
}

static std::vector<std::filesystem::path> getCudaIncludeCandidates() {
    std::vector<std::filesystem::path> candidates;
    if (auto cudaHome = getEnvVar("CUDA_HOME"); !cudaHome.empty()) {
        candidates.emplace_back(std::filesystem::path(cudaHome) / "include");
        candidates.emplace_back(std::filesystem::path(cudaHome) / "targets" / "x86_64-linux" / "include");
        candidates.emplace_back(std::filesystem::path(cudaHome) / "targets" / "sbsa-linux" / "include");
    }
    if (auto cudaPath = getEnvVar("CUDA_PATH"); !cudaPath.empty()) {
        candidates.emplace_back(std::filesystem::path(cudaPath) / "include");
        candidates.emplace_back(std::filesystem::path(cudaPath) / "targets" / "x86_64-linux" / "include");
        candidates.emplace_back(std::filesystem::path(cudaPath) / "targets" / "sbsa-linux" / "include");
    }
    candidates.emplace_back("/usr/local/cuda/include");
    candidates.emplace_back("/usr/local/cuda/targets/x86_64-linux/include");
    candidates.emplace_back("/usr/local/cuda/targets/sbsa-linux/include");
    return candidates;
}

static std::string detectCudaIncludePath() {
    for (const auto &path : getCudaIncludeCandidates()) {
        if (std::filesystem::exists(path / "cuda_runtime.h")) {
            return path.string();
        }
    }
    return {};
}

static void checkCuda(CUresult result, const char *what) {
    if (result == CUDA_SUCCESS)
        return;
    const char *name = nullptr;
    const char *desc = nullptr;
    cuGetErrorName(result, &name);
    cuGetErrorString(result, &desc);
    std::ostringstream message;
    message << "CUDA error: " << what;
    if (name)
        message << " (" << name << ")";
    if (desc)
        message << ": " << desc;
    throw std::runtime_error(message.str());
}

static void checkNvrtc(nvrtcResult result, const char *what, nvrtcProgram program) {
    if (result == NVRTC_SUCCESS)
        return;
    std::ostringstream message;
    message << "NVRTC error: " << what << ": " << nvrtcGetErrorString(result);
    size_t logSize = 0;
    if (nvrtcGetProgramLogSize(program, &logSize) == NVRTC_SUCCESS && logSize > 1) {
        std::string log(logSize, '\0');
        if (nvrtcGetProgramLog(program, log.data()) == NVRTC_SUCCESS) {
            message << "\n" << log;
        }
    }
    throw std::runtime_error(message.str());
}

template <typename Fn>
class ScopeExit final {
  public:
    explicit ScopeExit(Fn fn) : fn_(std::move(fn)) {}
    ScopeExit(const ScopeExit &) = delete;
    ScopeExit &operator=(const ScopeExit &) = delete;
    ScopeExit(ScopeExit &&other) noexcept : fn_(std::move(other.fn_)), active_(other.active_) {
        other.active_ = false;
    }
    ScopeExit &operator=(ScopeExit &&other) noexcept {
        if (this == &other)
            return *this;
        if (active_)
            fn_();
        fn_ = std::move(other.fn_);
        active_ = other.active_;
        other.active_ = false;
        return *this;
    }
    ~ScopeExit() {
        if (active_)
            fn_();
    }

    void cancel() { active_ = false; }

  private:
    Fn fn_;
    bool active_ = true;
};

template <typename Fn>
static ScopeExit<Fn> makeScopeExit(Fn fn) {
    return ScopeExit<Fn>(std::move(fn));
}

static void parseScript(const std::string &path, Script &script) {
    std::ifstream file(path);
    if (!file.is_open()) {
        throw std::runtime_error("error: failed to open script '" + path + "'");
    }

    std::string line;
    int lineNumber = 0;
    bool inKernel = false;
    while (std::getline(file, line)) {
        ++lineNumber;
        if (inKernel) {
            std::string trimmed = trim(line);
            if (trimmed == "ENDKERNEL") {
                inKernel = false;
                continue;
            }
            script.kernelSource.append(line);
            script.kernelSource.push_back('\n');
            continue;
        }

        if (isCommentLine(line))
            continue;
        std::string trimmed = trim(line);
        if (trimmed.empty())
            continue;

        std::vector<std::string> tokens = splitTokens(trimmed);
        const std::string &cmd = tokens[0];

        if (cmd == "BUFFER") {
            if (tokens.size() != 6 || tokens[2] != "TYPE" || tokens[4] != "SIZE")
                failLine(lineNumber, "BUFFER syntax: BUFFER <name> TYPE <type> SIZE <n>");
            const std::string &name = tokens[1];
            if (script.buffers.count(name))
                failLine(lineNumber, "BUFFER already defined: " + name);
            BufferDef def;
            def.name = name;
            def.type = parseType(tokens[3], lineNumber);
            def.size = parseUnsigned(tokens[5], lineNumber);
            if (def.size == 0)
                failLine(lineNumber, "BUFFER size must be > 0");
            script.buffers[name] = def;
            continue;
        }

        if (cmd == "FILL") {
            if (tokens.size() != 3)
                failLine(lineNumber, "FILL syntax: FILL <name> <value>");
            auto it = script.buffers.find(tokens[1]);
            if (it == script.buffers.end())
                failLine(lineNumber, "unknown buffer: " + tokens[1]);
            BufferDef &def = it->second;
            if (def.hasFill)
                failLine(lineNumber, "FILL already set for buffer: " + def.name);
            def.fill = parseValue(tokens[2], def.type, lineNumber);
            def.hasFill = true;
            def.fillSize = def.size;
            continue;
        }

        if (cmd == "INIT") {
            if (tokens.size() != 4)
                failLine(lineNumber, "INIT syntax: INIT <name> <index> <value>");
            auto it = script.buffers.find(tokens[1]);
            if (it == script.buffers.end())
                failLine(lineNumber, "unknown buffer: " + tokens[1]);
            BufferDef &def = it->second;
            std::size_t index = parseUnsigned(tokens[2], lineNumber);
            if (index >= def.size)
                failLine(lineNumber, "INIT index out of range");
            if (def.inits.count(index))
                failLine(lineNumber, "INIT already set for buffer index");
            def.inits[index] = parseValue(tokens[3], def.type, lineNumber);
            continue;
        }

        if (cmd == "KERNEL") {
            if (script.hasKernel)
                failLine(lineNumber, "KERNEL already defined");
            if (tokens.size() != 1 && tokens.size() != 2)
                failLine(lineNumber, "KERNEL syntax: KERNEL [<name>]");
            if (tokens.size() == 2)
                script.kernelName = tokens[1];
            script.hasKernel = true;
            inKernel = true;
            continue;
        }

        if (cmd == "BIND") {
            if (tokens.size() >= 2 && tokens[1] == "CONST") {
                if (tokens.size() != 7 || tokens[3] != "TYPE" || tokens[5] != "ARG")
                    failLine(lineNumber,
                             "BIND CONST syntax: BIND CONST <value> TYPE <type> ARG <n>");
                Binding binding;
                binding.kind = BindingKind::Const;
                binding.type = parseType(tokens[4], lineNumber);
                binding.value = parseValue(tokens[2], binding.type, lineNumber);
                unsigned argIndex = static_cast<unsigned>(parseUnsigned(tokens[6], lineNumber));
                if (script.bindings.count(argIndex))
                    failLine(lineNumber, "duplicate BIND ARG index");
                script.bindings[argIndex] = binding;
            } else {
                if (tokens.size() != 4 || tokens[2] != "ARG")
                    failLine(lineNumber, "BIND syntax: BIND <name> ARG <n>");
                const std::string &name = tokens[1];
                if (!script.buffers.count(name))
                    failLine(lineNumber, "unknown buffer: " + name);
                Binding binding;
                binding.kind = BindingKind::Buffer;
                binding.bufferName = name;
                binding.type = script.buffers.at(name).type;
                unsigned argIndex = static_cast<unsigned>(parseUnsigned(tokens[3], lineNumber));
                if (script.bindings.count(argIndex))
                    failLine(lineNumber, "duplicate BIND ARG index");
                script.bindings[argIndex] = binding;
            }
            continue;
        }

        if (cmd == "LAUNCH") {
            if (script.hasLaunch)
                failLine(lineNumber, "LAUNCH already set");
            if (tokens.size() != 9 || tokens[1] != "GRID" || tokens[5] != "BLOCK") {
                failLine(lineNumber,
                         "LAUNCH syntax: LAUNCH GRID <x> <y> <z> BLOCK <x> <y> <z>");
            }
            script.grid.x = static_cast<std::uint32_t>(parseUnsigned(tokens[2], lineNumber));
            script.grid.y = static_cast<std::uint32_t>(parseUnsigned(tokens[3], lineNumber));
            script.grid.z = static_cast<std::uint32_t>(parseUnsigned(tokens[4], lineNumber));
            script.block.x = static_cast<std::uint32_t>(parseUnsigned(tokens[6], lineNumber));
            script.block.y = static_cast<std::uint32_t>(parseUnsigned(tokens[7], lineNumber));
            script.block.z = static_cast<std::uint32_t>(parseUnsigned(tokens[8], lineNumber));
            if (script.grid.x == 0 || script.grid.y == 0 || script.grid.z == 0 ||
                script.block.x == 0 || script.block.y == 0 || script.block.z == 0) {
                failLine(lineNumber, "LAUNCH dimensions must be > 0");
            }
            script.hasLaunch = true;
            continue;
        }

        if (cmd == "EXPECT") {
            if (tokens.size() < 4)
                failLine(lineNumber, "EXPECT syntax: EXPECT <name> <index> <value> ...");
            const std::string &bufferName = tokens[1];
            auto it = script.buffers.find(bufferName);
            if (it == script.buffers.end())
                failLine(lineNumber, "unknown buffer: " + bufferName);
            ExpectEntry entry;
            entry.buffer = bufferName;
            entry.index = parseUnsigned(tokens[2], lineNumber);
            if (entry.index >= it->second.size)
                failLine(lineNumber, "EXPECT index out of range");
            entry.expected = parseValue(tokens[3], it->second.type, lineNumber);
            entry.line = lineNumber;
            for (std::size_t i = 4; i < tokens.size();) {
                if (tokens[i] == "ABS_TOL") {
                    if (i + 1 >= tokens.size())
                        failLine(lineNumber, "ABS_TOL missing value");
                    entry.absTol = parseFloat(tokens[i + 1], lineNumber);
                    i += 2;
                    continue;
                }
                if (tokens[i] == "REL_TOL") {
                    if (i + 1 >= tokens.size())
                        failLine(lineNumber, "REL_TOL missing value");
                    entry.relTol = parseFloat(tokens[i + 1], lineNumber);
                    i += 2;
                    continue;
                }
                failLine(lineNumber, "unknown EXPECT modifier: " + tokens[i]);
            }
            script.expects.push_back(entry);
            continue;
        }

        if (cmd == "EXPECT_RANGE") {
            if (tokens.size() < 5)
                failLine(lineNumber,
                         "EXPECT_RANGE syntax: EXPECT_RANGE <name> <start> <end> <value> ...");
            const std::string &bufferName = tokens[1];
            auto it = script.buffers.find(bufferName);
            if (it == script.buffers.end())
                failLine(lineNumber, "unknown buffer: " + bufferName);
            ExpectRangeEntry entry;
            entry.buffer = bufferName;
            entry.start = parseUnsigned(tokens[2], lineNumber);
            entry.end = parseUnsigned(tokens[3], lineNumber);
            if (entry.start > entry.end)
                failLine(lineNumber, "EXPECT_RANGE start > end");
            if (entry.end >= it->second.size)
                failLine(lineNumber, "EXPECT_RANGE end out of range");
            entry.expected = parseValue(tokens[4], it->second.type, lineNumber);
            entry.line = lineNumber;
            for (std::size_t i = 5; i < tokens.size();) {
                if (tokens[i] == "ABS_TOL") {
                    if (i + 1 >= tokens.size())
                        failLine(lineNumber, "ABS_TOL missing value");
                    entry.absTol = parseFloat(tokens[i + 1], lineNumber);
                    i += 2;
                    continue;
                }
                if (tokens[i] == "REL_TOL") {
                    if (i + 1 >= tokens.size())
                        failLine(lineNumber, "REL_TOL missing value");
                    entry.relTol = parseFloat(tokens[i + 1], lineNumber);
                    i += 2;
                    continue;
                }
                failLine(lineNumber, "unknown EXPECT_RANGE modifier: " + tokens[i]);
            }
            script.expectRanges.push_back(entry);
            continue;
        }

        if (cmd == "EXPECT_BUFFER") {
            if (tokens.size() < 3)
                failLine(lineNumber,
                         "EXPECT_BUFFER syntax: EXPECT_BUFFER <actual> <expected> ...");
            const std::string &actualName = tokens[1];
            const std::string &expectedName = tokens[2];
            if (!script.buffers.count(actualName))
                failLine(lineNumber, "unknown buffer: " + actualName);
            if (!script.buffers.count(expectedName))
                failLine(lineNumber, "unknown buffer: " + expectedName);
            ExpectBufferEntry entry;
            entry.actual = actualName;
            entry.expected = expectedName;
            entry.line = lineNumber;
            for (std::size_t i = 3; i < tokens.size();) {
                if (tokens[i] == "ABS_TOL") {
                    if (i + 1 >= tokens.size())
                        failLine(lineNumber, "ABS_TOL missing value");
                    entry.absTol = parseFloat(tokens[i + 1], lineNumber);
                    i += 2;
                    continue;
                }
                if (tokens[i] == "REL_TOL") {
                    if (i + 1 >= tokens.size())
                        failLine(lineNumber, "REL_TOL missing value");
                    entry.relTol = parseFloat(tokens[i + 1], lineNumber);
                    i += 2;
                    continue;
                }
                failLine(lineNumber, "unknown EXPECT_BUFFER modifier: " + tokens[i]);
            }
            script.expectBuffers.push_back(entry);
            continue;
        }

        failLine(lineNumber, "unknown command: " + cmd);
    }

    if (inKernel)
        failLine(lineNumber, "missing ENDKERNEL");
    if (!script.hasKernel)
        failLine(lineNumber, "missing KERNEL block");
    if (script.kernelSource.empty())
        failLine(lineNumber, "empty kernel source");
    if (!script.hasLaunch)
        failLine(lineNumber, "missing LAUNCH command");
    if (!script.bindings.empty()) {
        unsigned maxArg = 0;
        for (const auto &entry : script.bindings)
            maxArg = std::max(maxArg, entry.first);
        for (unsigned i = 0; i <= maxArg; ++i) {
            if (!script.bindings.count(i))
                failLine(lineNumber, "missing BIND for ARG " + std::to_string(i));
        }
    }
}

static void applyInitYaml(Script &script, const std::string &path) {
    simt::runner::InitFile init;
    std::string error;
    if (!simt::runner::loadInitYamlFile(path, init, error)) {
        failError("failed to parse init YAML '" + path + "': " + error);
    }
    for (const auto &buffer : init.buffers) {
        auto it = script.buffers.find(buffer.buffer);
        if (it == script.buffers.end()) {
            failError("init-yaml buffer not found: " + buffer.buffer);
        }
        BufferDef &def = it->second;
        if (buffer.fill) {
            if (!buffer.size) {
                failError("init-yaml buffer '" + buffer.buffer + "': fill requires size");
            }
            if (*buffer.size < 0) {
                failError("init-yaml buffer '" + buffer.buffer + "': size must be >= 0");
            }
            if (static_cast<std::uint64_t>(*buffer.size) > def.size) {
                failError("init-yaml buffer '" + buffer.buffer + "': size exceeds buffer");
            }
            def.hasFill = true;
            def.fill = castInitValue(def.type, *buffer.fill, buffer.buffer);
            def.fillSize = static_cast<std::size_t>(*buffer.size);
        }
        for (const auto &entry : buffer.entries) {
            if (entry.index < 0) {
                failError("init-yaml buffer '" + buffer.buffer + "': index must be >= 0");
            }
            std::size_t index = static_cast<std::size_t>(entry.index);
            if (index >= def.size) {
                failError("init-yaml buffer '" + buffer.buffer + "': index out of range");
            }
            def.inits[index] = castInitValue(def.type, entry.value, buffer.buffer);
        }
    }
}

static void applyFill(BufferRuntime &runtime) {
    std::size_t fillCount = 0;
    if (runtime.def.hasFill) {
        fillCount = runtime.def.fillSize.value_or(runtime.def.size);
    }
    switch (runtime.def.type) {
        case ScalarType::I32:
            runtime.i32.assign(runtime.def.size, 0);
            if (runtime.def.hasFill && fillCount > 0) {
                std::fill_n(runtime.i32.begin(), fillCount, runtime.def.fill.i32);
            }
            break;
        case ScalarType::U32:
            runtime.u32.assign(runtime.def.size, 0u);
            if (runtime.def.hasFill && fillCount > 0) {
                std::fill_n(runtime.u32.begin(), fillCount, runtime.def.fill.u32);
            }
            break;
        case ScalarType::F32:
            runtime.f32.assign(runtime.def.size, 0.0f);
            if (runtime.def.hasFill && fillCount > 0) {
                std::fill_n(runtime.f32.begin(), fillCount, runtime.def.fill.f32);
            }
            break;
    }
}

static void applyInits(BufferRuntime &runtime) {
    for (const auto &entry : runtime.def.inits) {
        std::size_t index = entry.first;
        const ScalarValue &value = entry.second;
        switch (runtime.def.type) {
            case ScalarType::I32:
                runtime.i32[index] = value.i32;
                break;
            case ScalarType::U32:
                runtime.u32[index] = value.u32;
                break;
            case ScalarType::F32:
                runtime.f32[index] = value.f32;
                break;
        }
    }
}

static void copyHostToDevice(const BufferRuntime &runtime) {
    std::size_t bytes = 0;
    const void *data = nullptr;
    switch (runtime.def.type) {
        case ScalarType::I32:
            bytes = runtime.i32.size() * sizeof(int32_t);
            data = runtime.i32.data();
            break;
        case ScalarType::U32:
            bytes = runtime.u32.size() * sizeof(uint32_t);
            data = runtime.u32.data();
            break;
        case ScalarType::F32:
            bytes = runtime.f32.size() * sizeof(float);
            data = runtime.f32.data();
            break;
    }
    checkCuda(cuMemcpyHtoD(runtime.device, data, bytes), "cuMemcpyHtoD");
}

static void copyDeviceToHost(BufferRuntime &runtime) {
    std::size_t bytes = 0;
    void *data = nullptr;
    switch (runtime.def.type) {
        case ScalarType::I32:
            bytes = runtime.i32.size() * sizeof(int32_t);
            data = runtime.i32.data();
            break;
        case ScalarType::U32:
            bytes = runtime.u32.size() * sizeof(uint32_t);
            data = runtime.u32.data();
            break;
        case ScalarType::F32:
            bytes = runtime.f32.size() * sizeof(float);
            data = runtime.f32.data();
            break;
    }
    checkCuda(cuMemcpyDtoH(data, runtime.device, bytes), "cuMemcpyDtoH");
}

static bool checkFloat(float actual, float expected, float absTol, float relTol) {
    double diff = std::abs(static_cast<double>(actual) - static_cast<double>(expected));
    double tol = absTol;
    tol = std::max(tol, relTol * std::abs(static_cast<double>(expected)));
    return diff <= tol;
}

static void verifyExpect(const BufferRuntime &runtime, const ExpectEntry &expect) {
    bool ok = false;
    ScalarValue actual;
    actual.type = runtime.def.type;
    switch (runtime.def.type) {
        case ScalarType::I32:
            ok = (runtime.i32[expect.index] == expect.expected.i32);
            actual.i32 = runtime.i32[expect.index];
            if (expect.absTol || expect.relTol)
                failLine(expect.line, "tolerances are not allowed for integer EXPECT");
            break;
        case ScalarType::U32:
            ok = (runtime.u32[expect.index] == expect.expected.u32);
            actual.u32 = runtime.u32[expect.index];
            if (expect.absTol || expect.relTol)
                failLine(expect.line, "tolerances are not allowed for integer EXPECT");
            break;
        case ScalarType::F32: {
            float absTol = expect.absTol.value_or(0.0f);
            float relTol = expect.relTol.value_or(0.0f);
            ok = checkFloat(runtime.f32[expect.index], expect.expected.f32, absTol, relTol);
            actual.f32 = runtime.f32[expect.index];
            break;
        }
    }
    if (!ok) {
        std::ostringstream message;
        message << "EXPECT failed: buffer=" << runtime.def.name
                << " index=" << expect.index
                << " expected=" << scalarToString(expect.expected)
                << " actual=" << scalarToString(actual);
        failLine(expect.line, message.str());
    }
}

static void verifyExpectRange(const BufferRuntime &runtime, const ExpectRangeEntry &expect) {
    if (runtime.def.type != ScalarType::F32 && (expect.absTol || expect.relTol))
        failLine(expect.line, "tolerances are not allowed for integer EXPECT_RANGE");
    if (runtime.def.type == ScalarType::F32) {
        if ((expect.absTol && *expect.absTol < 0.0f) || (expect.relTol && *expect.relTol < 0.0f))
            failLine(expect.line, "invalid float tolerance");
    }

    float absTol = expect.absTol.value_or(0.0f);
    float relTol = expect.relTol.value_or(0.0f);

    for (std::size_t i = expect.start; i <= expect.end; ++i) {
        bool ok = false;
        switch (runtime.def.type) {
            case ScalarType::I32:
                ok = (runtime.i32[i] == expect.expected.i32);
                break;
            case ScalarType::U32:
                ok = (runtime.u32[i] == expect.expected.u32);
                break;
            case ScalarType::F32:
                ok = checkFloat(runtime.f32[i], expect.expected.f32, absTol, relTol);
                break;
        }
        if (!ok) {
            ScalarValue actual;
            actual.type = runtime.def.type;
            switch (runtime.def.type) {
                case ScalarType::I32:
                    actual.i32 = runtime.i32[i];
                    break;
                case ScalarType::U32:
                    actual.u32 = runtime.u32[i];
                    break;
                case ScalarType::F32:
                    actual.f32 = runtime.f32[i];
                    break;
            }
            std::ostringstream message;
            message << "EXPECT_RANGE failed: buffer=" << runtime.def.name
                    << " index=" << i
                    << " expected=" << scalarToString(expect.expected)
                    << " actual=" << scalarToString(actual);
            failLine(expect.line, message.str());
        }
    }
}

static void verifyExpectBuffer(const BufferRuntime &actual,
                               const BufferRuntime &expected,
                               const ExpectBufferEntry &expect) {
    if (actual.def.type != expected.def.type) {
        failLine(expect.line, "EXPECT_BUFFER type mismatch between buffers");
    }
    if (actual.def.size != expected.def.size) {
        failLine(expect.line, "EXPECT_BUFFER size mismatch between buffers");
    }
    if (actual.def.type != ScalarType::F32 && (expect.absTol || expect.relTol))
        failLine(expect.line, "tolerances are not allowed for integer EXPECT_BUFFER");
    if (actual.def.type == ScalarType::F32) {
        if ((expect.absTol && *expect.absTol < 0.0f) || (expect.relTol && *expect.relTol < 0.0f))
            failLine(expect.line, "invalid float tolerance");
    }

    float absTol = expect.absTol.value_or(0.0f);
    float relTol = expect.relTol.value_or(0.0f);
    for (std::size_t i = 0; i < actual.def.size; ++i) {
        bool ok = false;
        ScalarValue actualVal;
        ScalarValue expectedVal;
        actualVal.type = actual.def.type;
        expectedVal.type = expected.def.type;
        switch (actual.def.type) {
            case ScalarType::I32:
                actualVal.i32 = actual.i32[i];
                expectedVal.i32 = expected.i32[i];
                ok = (actualVal.i32 == expectedVal.i32);
                break;
            case ScalarType::U32:
                actualVal.u32 = actual.u32[i];
                expectedVal.u32 = expected.u32[i];
                ok = (actualVal.u32 == expectedVal.u32);
                break;
            case ScalarType::F32:
                actualVal.f32 = actual.f32[i];
                expectedVal.f32 = expected.f32[i];
                ok = checkFloat(actualVal.f32, expectedVal.f32, absTol, relTol);
                break;
        }
        if (!ok) {
            std::ostringstream message;
            message << "EXPECT_BUFFER failed: actual=" << actual.def.name
                    << " expected=" << expected.def.name
                    << " index=" << i
                    << " expected=" << scalarToString(expectedVal)
                    << " actual=" << scalarToString(actualVal);
            failLine(expect.line, message.str());
        }
    }
}

static void runScript(const Script &script, const Options &options,
                      const CudaSession &session) {
    checkCuda(cuCtxSetCurrent(session.context), "cuCtxSetCurrent");

    nvrtcProgram program = nullptr;
    auto destroyProgram = makeScopeExit([&]() {
        if (program)
            nvrtcDestroyProgram(&program);
    });
    checkNvrtc(nvrtcCreateProgram(&program,
                                  script.kernelSource.c_str(),
                                  "script.cu",
                                  0,
                                  nullptr,
                                  nullptr),
               "nvrtcCreateProgram", program);

    std::vector<std::string> optStorage;
    optStorage.push_back("--std=c++17");
    if (!options.arch.empty())
        optStorage.push_back("--gpu-architecture=" + options.arch);
    if (!options.cudaIncludePath.empty())
        optStorage.push_back("--include-path=" + options.cudaIncludePath);

    std::vector<const char *> optPtrs;
    optPtrs.reserve(optStorage.size());
    for (const auto &opt : optStorage)
        optPtrs.push_back(opt.c_str());

    nvrtcResult compileResult = nvrtcCompileProgram(program,
                                                    static_cast<int>(optPtrs.size()),
                                                    optPtrs.data());
    if (compileResult != NVRTC_SUCCESS)
        checkNvrtc(compileResult, "nvrtcCompileProgram", program);

    size_t ptxSize = 0;
    checkNvrtc(nvrtcGetPTXSize(program, &ptxSize), "nvrtcGetPTXSize", program);
    std::string ptx(ptxSize, '\0');
    checkNvrtc(nvrtcGetPTX(program, ptx.data()), "nvrtcGetPTX", program);
    checkNvrtc(nvrtcDestroyProgram(&program), "nvrtcDestroyProgram", program);
    program = nullptr;
    destroyProgram.cancel();

    if (options.dumpPtx)
        std::cout << ptx << "\n";

    CUmodule module = nullptr;
    checkCuda(cuModuleLoadDataEx(&module, ptx.data(), 0, nullptr, nullptr), "cuModuleLoadDataEx");
    auto unloadModule = makeScopeExit([&]() {
        if (module)
            cuModuleUnload(module);
    });

    CUfunction kernel = nullptr;
    checkCuda(cuModuleGetFunction(&kernel, module, script.kernelName.c_str()), "cuModuleGetFunction");

    std::unordered_map<std::string, BufferRuntime> runtimes;
    auto freeBuffers = makeScopeExit([&]() {
        for (auto &entry : runtimes) {
            if (entry.second.device)
                cuMemFree(entry.second.device);
        }
    });
    for (const auto &entry : script.buffers) {
        BufferRuntime runtime;
        runtime.def = entry.second;
        applyFill(runtime);
        applyInits(runtime);
        std::size_t bytes = 0;
        switch (runtime.def.type) {
            case ScalarType::I32:
                bytes = runtime.i32.size() * sizeof(int32_t);
                break;
            case ScalarType::U32:
                bytes = runtime.u32.size() * sizeof(uint32_t);
                break;
            case ScalarType::F32:
                bytes = runtime.f32.size() * sizeof(float);
                break;
        }
        checkCuda(cuMemAlloc(&runtime.device, bytes), "cuMemAlloc");
        copyHostToDevice(runtime);
        runtimes[entry.first] = std::move(runtime);
    }

    std::vector<std::vector<std::uint8_t>> argStorage;
    std::vector<void *> argPtrs;
    if (!script.bindings.empty()) {
        unsigned maxArg = 0;
        for (const auto &entry : script.bindings)
            maxArg = std::max(maxArg, entry.first);
        argStorage.reserve(maxArg + 1);
        argPtrs.reserve(maxArg + 1);

        for (unsigned i = 0; i <= maxArg; ++i) {
            const Binding &binding = script.bindings.at(i);
            if (binding.kind == BindingKind::Buffer) {
                const auto &runtime = runtimes.at(binding.bufferName);
                CUdeviceptr ptr = runtime.device;
                std::vector<std::uint8_t> data(sizeof(CUdeviceptr));
                std::memcpy(data.data(), &ptr, sizeof(CUdeviceptr));
                argStorage.push_back(std::move(data));
            } else {
                std::vector<std::uint8_t> data;
                switch (binding.type) {
                    case ScalarType::I32: {
                        int32_t value = binding.value.i32;
                        data.resize(sizeof(value));
                        std::memcpy(data.data(), &value, sizeof(value));
                        break;
                    }
                    case ScalarType::U32: {
                        uint32_t value = binding.value.u32;
                        data.resize(sizeof(value));
                        std::memcpy(data.data(), &value, sizeof(value));
                        break;
                    }
                    case ScalarType::F32: {
                        float value = binding.value.f32;
                        data.resize(sizeof(value));
                        std::memcpy(data.data(), &value, sizeof(value));
                        break;
                    }
                }
                argStorage.push_back(std::move(data));
            }
            argPtrs.push_back(argStorage.back().data());
        }
    }

    checkCuda(cuLaunchKernel(kernel,
                             script.grid.x,
                             script.grid.y,
                             script.grid.z,
                             script.block.x,
                             script.block.y,
                             script.block.z,
                             0,
                             nullptr,
                             argPtrs.empty() ? nullptr : argPtrs.data(),
                             nullptr),
              "cuLaunchKernel");
    checkCuda(cuCtxSynchronize(), "cuCtxSynchronize");

    for (auto &entry : runtimes)
        copyDeviceToHost(entry.second);

    for (const auto &expect : script.expects) {
        const auto &runtime = runtimes.at(expect.buffer);
        verifyExpect(runtime, expect);
    }

    for (const auto &expect : script.expectRanges) {
        const auto &runtime = runtimes.at(expect.buffer);
        verifyExpectRange(runtime, expect);
    }

	    for (const auto &expect : script.expectBuffers) {
	        const auto &actual = runtimes.at(expect.actual);
	        const auto &expected = runtimes.at(expect.expected);
	        verifyExpectBuffer(actual, expected, expect);
	    }
}

static const char kUsage[] =
    "usage: simt-cuda-test <script.cuda> [--device N] [--arch sm_80] [--dump-ptx]\n"
    "                       [--init-yaml <file>] [--cuda-include <dir>]\n"
    "       simt-cuda-test --batch <dir> [--recursive] [--report <file>]\n"
    "                       [--device N] [--arch sm_80] [--init-yaml <file>]\n"
    "                       [--init-yaml-auto] [--cuda-include <dir>]\n";

[[noreturn]] static void failUsage(const std::string &message) {
    throw std::runtime_error("error: " + message + "\n" + kUsage);
}

static Options parseOptions(int argc, char **argv) {
    Options options;
    for (int i = 1; i < argc; ++i) {
        std::string arg = argv[i];
        if (arg == "--device") {
            if (i + 1 >= argc)
                failUsage("--device requires a value");
            try {
                options.deviceIndex = std::stoi(argv[++i]);
            } catch (const std::exception &) {
                failUsage("invalid --device value");
            }
            if (options.deviceIndex < 0)
                failUsage("--device must be >= 0");
            continue;
        }
        if (arg == "--arch") {
            if (i + 1 >= argc)
                failUsage("--arch requires a value");
            options.arch = argv[++i];
            continue;
        }
        if (arg == "--dump-ptx") {
            options.dumpPtx = true;
            continue;
        }
        if (arg == "--batch") {
            if (i + 1 >= argc)
                failUsage("--batch requires a directory");
            options.batchDir = argv[++i];
            continue;
        }
        if (arg == "--recursive") {
            options.batchRecursive = true;
            continue;
        }
        if (arg == "--report") {
            if (i + 1 >= argc)
                failUsage("--report requires a file path");
            options.reportPath = argv[++i];
            continue;
        }
        if (arg == "--init-yaml") {
            if (i + 1 >= argc)
                failUsage("--init-yaml requires a file path");
            options.initYamlPath = argv[++i];
            continue;
        }
        if (arg == "--init-yaml-auto") {
            options.initYamlAuto = true;
            continue;
        }
        if (arg == "--cuda-include") {
            if (i + 1 >= argc)
                failUsage("--cuda-include requires a path");
            options.cudaIncludePath = argv[++i];
            continue;
        }
        if (!arg.empty() && arg[0] == '-')
            failUsage("unknown option '" + arg + "'");
        if (!options.scriptPath.empty())
            failUsage("multiple script paths provided");
        options.scriptPath = arg;
    }

    if (!options.batchDir.empty() && !options.scriptPath.empty())
        failUsage("cannot combine --batch with a script path");
    if (options.batchDir.empty() && options.scriptPath.empty())
        failUsage("missing script path or --batch");
    if (!options.batchDir.empty() && options.dumpPtx)
        failUsage("--dump-ptx is only supported for single scripts");
    if (!options.batchDir.empty() && options.initYamlPath.empty() && !options.initYamlAuto)
        options.initYamlAuto = true;
    if (options.cudaIncludePath.empty())
        options.cudaIncludePath = detectCudaIncludePath();
    if (options.cudaIncludePath.empty())
        failUsage("could not locate CUDA include path; pass --cuda-include");

    return options;
}

static std::string escapeCsv(const std::string &text) {
    std::string out;
    out.reserve(text.size() + 2);
    out.push_back('"');
    for (char ch : text) {
        if (ch == '"')
            out.append("\"\"");
        else
            out.push_back(ch);
    }
    out.push_back('"');
    return out;
}

static std::string selectInitYamlPath(const std::filesystem::path &scriptPath,
                                      const Options &options) {
    if (!options.initYamlPath.empty())
        return options.initYamlPath;
    if (options.initYamlAuto) {
        std::filesystem::path yamlPath = scriptPath;
        yamlPath.replace_extension(".yaml");
        if (std::filesystem::exists(yamlPath))
            return yamlPath.string();
    }
    return "";
}

static bool runSingle(const std::string &scriptPath, const Options &options,
                      const CudaSession &session, std::string &error) {
    try {
        Script script;
        parseScript(scriptPath, script);
        std::string initYaml = selectInitYamlPath(scriptPath, options);
        if (!initYaml.empty())
            applyInitYaml(script, initYaml);
        runScript(script, options, session);
        return true;
    } catch (const std::exception &ex) {
        error = ex.what();
        return false;
    }
}

static std::vector<std::filesystem::path>
collectBatchScripts(const Options &options) {
    std::filesystem::path root(options.batchDir);
    if (!std::filesystem::exists(root)) {
        failError("batch directory does not exist: " + options.batchDir);
    }
    if (!std::filesystem::is_directory(root)) {
        failError("batch path is not a directory: " + options.batchDir);
    }

    std::vector<std::filesystem::path> scripts;
    if (options.batchRecursive) {
        for (const auto &entry :
             std::filesystem::recursive_directory_iterator(root)) {
            if (!entry.is_regular_file())
                continue;
            if (entry.path().extension() == ".cuda")
                scripts.push_back(entry.path());
        }
    } else {
        for (const auto &entry : std::filesystem::directory_iterator(root)) {
            if (!entry.is_regular_file())
                continue;
            if (entry.path().extension() == ".cuda")
                scripts.push_back(entry.path());
        }
    }

    std::sort(scripts.begin(), scripts.end());
    if (scripts.empty())
        failError("no .cuda scripts found in " + options.batchDir);
    return scripts;
}

static int runBatch(const Options &options) {
    CudaSession session = createCudaSession(options);
    std::vector<std::filesystem::path> scripts = collectBatchScripts(options);
    std::ofstream report;
    if (!options.reportPath.empty()) {
        report.open(options.reportPath, std::ios::out | std::ios::trunc);
        if (!report.is_open())
            failError("failed to open report file: " + options.reportPath);
        report << "status,file,error\n";
    }

    std::size_t pass = 0;
    std::size_t fail = 0;
    for (const auto &scriptPath : scripts) {
        std::string error;
        bool ok = runSingle(scriptPath.string(), options, session, error);
        if (ok) {
            ++pass;
            std::cout << "PASS " << scriptPath.string() << "\n";
        } else {
            ++fail;
            std::cout << "FAIL " << scriptPath.string() << "\n";
            std::cout << "  " << error << "\n";
        }
        if (report.is_open()) {
            report << (ok ? "pass" : "fail") << ","
                   << escapeCsv(scriptPath.string()) << ","
                   << escapeCsv(error) << "\n";
        }
    }

    std::cout << "summary: pass=" << pass << " fail=" << fail << "\n";
    return fail == 0 ? 0 : 1;
}

} // namespace

int main(int argc, char **argv) {
    try {
        Options options = parseOptions(argc, argv);
        if (!options.batchDir.empty())
            return runBatch(options);
        CudaSession session = createCudaSession(options);
        std::string error;
        if (!runSingle(options.scriptPath, options, session, error)) {
            std::cerr << error << "\n";
            return 1;
        }
        return 0;
    } catch (const std::exception &ex) {
        std::cerr << ex.what() << "\n";
        return 1;
    }
}
