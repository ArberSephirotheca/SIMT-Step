#include <d3d12.h>
#include <dxcapi.h>
#include <dxgi1_6.h>
#include <windows.h>
#include <wrl.h>

#include <cstring>
#include <iostream>

#pragma comment(lib, "d3d12.lib")
#pragma comment(lib, "dxgi.lib")
#pragma comment(lib, "dxguid.lib")
#pragma comment(lib, "dxcompiler.lib")

#ifndef DEVICE_NUM
#define DEVICE_NUM 0
#endif

using Microsoft::WRL::ComPtr;

static inline void HR(HRESULT hr) {
  if (FAILED(hr)) {
    std::cerr << "HRESULT 0x" << std::hex << hr << std::dec << "\n";
    std::abort();
  }
}

int wmain(int argc, wchar_t **argv) {

#define _DEBUG
#if defined(_DEBUG)
  {
    ComPtr<ID3D12Debug> dbg;
    if (SUCCEEDED(D3D12GetDebugInterface(IID_PPV_ARGS(&dbg))))
      dbg->EnableDebugLayer();
  }
#endif

  // Factory + pick HW adapter
  ComPtr<IDXGIFactory7> factory;
  HR(CreateDXGIFactory2(0, IID_PPV_ARGS(&factory)));
  ComPtr<IDXGIAdapter1> adapter;
  int adapters_left = DEVICE_NUM;
  for (UINT i = 0;; ++i) {
    ComPtr<IDXGIAdapter1> a;
    if (factory->EnumAdapters1(i, &a) == DXGI_ERROR_NOT_FOUND)
      break;
    DXGI_ADAPTER_DESC1 desc;
    a->GetDesc1(&desc);
    if (desc.Flags & DXGI_ADAPTER_FLAG_SOFTWARE)
      continue;
    if (SUCCEEDED(D3D12CreateDevice(a.Get(), D3D_FEATURE_LEVEL_12_0,
                                    __uuidof(ID3D12Device), nullptr))) {
      if (adapters_left <= 0){
        adapter = a;
        break;
      } else {
        adapters_left--;
      }
    }
  }
  if (!adapter) {
    std::cerr << "No hardware adapter.\n";
    return 1;
  }

  DXGI_ADAPTER_DESC1 adesc{};
  adapter->GetDesc1(&adesc);
  std::wcout << L"Adapter: " << adesc.Description << L" (Vendor=0x" << std::hex
             << adesc.VendorId << L" Device=0x" << adesc.DeviceId << L")"
             << ((adesc.Flags & DXGI_ADAPTER_FLAG_SOFTWARE) ? L" [SOFTWARE]"
                                                            : L"")
             << std::endl
             << std::dec;

  ComPtr<ID3D12Device> dev;
  HR(D3D12CreateDevice(adapter.Get(), D3D_FEATURE_LEVEL_12_0,
                       IID_PPV_ARGS(&dev)));

  // Queue/allocator/list/fence
  ComPtr<ID3D12CommandQueue> q;
  {
    D3D12_COMMAND_QUEUE_DESC dsc{};
    dsc.Type = D3D12_COMMAND_LIST_TYPE_COMPUTE;
    HR(dev->CreateCommandQueue(&dsc, IID_PPV_ARGS(&q)));
  }
  ComPtr<ID3D12CommandAllocator> ca;
  HR(dev->CreateCommandAllocator(D3D12_COMMAND_LIST_TYPE_COMPUTE,
                                 IID_PPV_ARGS(&ca)));
  ComPtr<ID3D12GraphicsCommandList> cl;
  HR(dev->CreateCommandList(0, D3D12_COMMAND_LIST_TYPE_COMPUTE, ca.Get(),
                            nullptr, IID_PPV_ARGS(&cl)));
  ComPtr<ID3D12Fence> fence;
  HR(dev->CreateFence(0, D3D12_FENCE_FLAG_NONE, IID_PPV_ARGS(&fence)));
  HANDLE fenceEvent = CreateEvent(nullptr, FALSE, FALSE, nullptr);
  UINT64 fval = 0;
  auto flush = [&] {
    HR(q->Signal(fence.Get(), ++fval));
    if (fence->GetCompletedValue() < fval) {
      HR(fence->SetEventOnCompletion(fval, fenceEvent));
      WaitForSingleObject(fenceEvent, INFINITE);
    }
  };

  // Shader compile (DXC)
  ComPtr<IDxcUtils> utils;
  ComPtr<IDxcCompiler3> comp;
  HR(DxcCreateInstance(CLSID_DxcUtils, IID_PPV_ARGS(&utils)));
  HR(DxcCreateInstance(CLSID_DxcCompiler, IID_PPV_ARGS(&comp)));
  ComPtr<IDxcIncludeHandler> includeHandler;
  HR(utils->CreateDefaultIncludeHandler(&includeHandler));
  ComPtr<IDxcBlobEncoding> src;
  // HR(utils->CreateBlob(shaderData, strlen(shaderData), DXC_CP_UTF8, &src));
  HR(utils->LoadFile(FNAME, nullptr, &src));
  DxcBuffer sbuf{src->GetBufferPointer(), src->GetBufferSize(), DXC_CP_ACP};
  const wchar_t *args[] = {
      L"-E", L"main", L"-T", L"cs_6_6", L"-O3", L"-Qstrip_reflect"};
  ComPtr<IDxcResult> cres;
  HR(comp->Compile(&sbuf, args, _countof(args), includeHandler.Get(),
                   IID_PPV_ARGS(&cres)));
  {
    ComPtr<IDxcBlobUtf8> errs;
    cres->GetOutput(DXC_OUT_ERRORS, IID_PPV_ARGS(&errs), nullptr);
    if (errs && errs->GetStringLength() > 0)
      std::cerr << "DXC:\n" << errs->GetStringPointer() << std::endl;
  }
  HRESULT status;
  HR(cres->GetStatus(&status));
  if (FAILED(status)) {
    std::cerr << "Shader compile failed.\n";
    return 1;
  }
  ComPtr<IDxcBlob> dxil;
  HR(cres->GetOutput(DXC_OUT_OBJECT, IID_PPV_ARGS(&dxil), nullptr));

  // Root signature: param0=UAV table (u0)
  D3D12_DESCRIPTOR_RANGE1 ranges[1] = {};
  if (inbuf.size()){
    ranges[0].RangeType = D3D12_DESCRIPTOR_RANGE_TYPE_UAV;
    ranges[0].NumDescriptors = inbuf.size(); // Change this
    ranges[0].BaseShaderRegister = 0;
  }

  D3D12_ROOT_PARAMETER1 rp[1] = {};
  if (inbuf.size()) {
    rp[0].ParameterType = D3D12_ROOT_PARAMETER_TYPE_DESCRIPTOR_TABLE;
    rp[0].DescriptorTable.NumDescriptorRanges = 1;
    rp[0].DescriptorTable.pDescriptorRanges = &ranges[0];
  }

  D3D12_VERSIONED_ROOT_SIGNATURE_DESC rsd{};
  rsd.Version = D3D_ROOT_SIGNATURE_VERSION_1_1;
  rsd.Desc_1_1.NumParameters = _countof(rp);
  rsd.Desc_1_1.pParameters = rp;
  rsd.Desc_1_1.Flags =
      D3D12_ROOT_SIGNATURE_FLAG_DENY_VERTEX_SHADER_ROOT_ACCESS |
      D3D12_ROOT_SIGNATURE_FLAG_DENY_PIXEL_SHADER_ROOT_ACCESS;

  ComPtr<ID3DBlob> rsBlob, rsErr;
  HR(D3D12SerializeVersionedRootSignature(&rsd, &rsBlob, &rsErr));
  ComPtr<ID3D12RootSignature> rs;
  HR(dev->CreateRootSignature(0, rsBlob->GetBufferPointer(),
                              rsBlob->GetBufferSize(), IID_PPV_ARGS(&rs)));

  // PSO
  D3D12_COMPUTE_PIPELINE_STATE_DESC pso{};
  pso.pRootSignature = rs.Get();
  pso.CS = {dxil->GetBufferPointer(), dxil->GetBufferSize()};
  ComPtr<ID3D12PipelineState> PSO;
  HR(dev->CreateComputePipelineState(&pso, IID_PPV_ARGS(&PSO)));

  // Helper to create buffers
  auto makeBuf = [&](UINT64 bytes, D3D12_HEAP_TYPE heap,
                     D3D12_RESOURCE_STATES state, D3D12_RESOURCE_FLAGS flags,
                     ComPtr<ID3D12Resource> &out) {
    D3D12_HEAP_PROPERTIES hp{};
    hp.Type = heap;
    D3D12_RESOURCE_DESC d{};
    d.Dimension = D3D12_RESOURCE_DIMENSION_BUFFER;
    d.Width = bytes;
    d.Height = 1;
    d.DepthOrArraySize = 1;
    d.MipLevels = 1;
    d.SampleDesc = {1, 0};
    d.Layout = D3D12_TEXTURE_LAYOUT_ROW_MAJOR;
    d.Flags = flags;
    HR(dev->CreateCommittedResource(&hp, D3D12_HEAP_FLAG_NONE, &d, state,
                                    nullptr, IID_PPV_ARGS(&out)));
  };

  // GPU buffers
  std::vector<ComPtr<ID3D12Resource>> bufDev(inbuf.size());
  std::vector<ComPtr<ID3D12Resource>> bufReadback(inbuf.size());
  std::vector<ComPtr<ID3D12Resource>> bufUpload(inbuf.size());
  int max_size = 0;
  int i = 0;
  for (auto buf : inbuf){
    makeBuf(sizeof(int) * buf.size(), D3D12_HEAP_TYPE_DEFAULT,
            D3D12_RESOURCE_STATE_UNORDERED_ACCESS,
            D3D12_RESOURCE_FLAG_ALLOW_UNORDERED_ACCESS, bufDev[i]);
    makeBuf(sizeof(int) * buf.size(), D3D12_HEAP_TYPE_READBACK,
          D3D12_RESOURCE_STATE_COPY_DEST, D3D12_RESOURCE_FLAG_NONE, bufReadback[i]);
    makeBuf(sizeof(int) * buf.size(),
          D3D12_HEAP_TYPE_UPLOAD, D3D12_RESOURCE_STATE_GENERIC_READ,
          D3D12_RESOURCE_FLAG_NONE, bufUpload[i]);
    i++;
  }

  // Descriptor heap: UAV(C)
  D3D12_DESCRIPTOR_HEAP_DESC hd{};
  ComPtr<ID3D12DescriptorHeap> heap;
  D3D12_CPU_DESCRIPTOR_HANDLE cpu;
  D3D12_GPU_DESCRIPTOR_HANDLE gpu;
  UINT handleInc;
  if (inbuf.size()){
    hd.Type = D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV;
    hd.NumDescriptors = inbuf.size();
    hd.Flags = D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE;
    HR(dev->CreateDescriptorHeap(&hd, IID_PPV_ARGS(&heap)));
    handleInc = dev->GetDescriptorHandleIncrementSize(
        D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV);
    cpu = heap->GetCPUDescriptorHandleForHeapStart();
    gpu = heap->GetGPUDescriptorHandleForHeapStart();
  }

  auto makeSRV = [&](ID3D12Resource *r, UINT numElems) {
    D3D12_SHADER_RESOURCE_VIEW_DESC s{};
    s.ViewDimension = D3D12_SRV_DIMENSION_BUFFER;
    s.Shader4ComponentMapping = D3D12_DEFAULT_SHADER_4_COMPONENT_MAPPING;
    s.Format = DXGI_FORMAT_UNKNOWN;
    s.Buffer.FirstElement = 0;
    s.Buffer.NumElements = numElems;
    s.Buffer.StructureByteStride = sizeof(int);
    dev->CreateShaderResourceView(r, &s, cpu);
    cpu.ptr += handleInc;
  };
  auto makeUAV = [&](ID3D12Resource *r, UINT numElems) {
    D3D12_UNORDERED_ACCESS_VIEW_DESC u{};
    u.ViewDimension = D3D12_UAV_DIMENSION_BUFFER;
    u.Format = DXGI_FORMAT_UNKNOWN;
    u.Buffer.FirstElement = 0;
    u.Buffer.NumElements = numElems;
    u.Buffer.StructureByteStride = sizeof(int);
    dev->CreateUnorderedAccessView(r, nullptr, &u, cpu);
    cpu.ptr += handleInc;
  };

  for (int i = 0; i < bufDev.size(); i++){
    makeUAV(bufDev[i].Get(), (UINT)inbuf[i].size());
  }

  // Helper: barrier
  auto barrier = [&](ID3D12Resource *r, D3D12_RESOURCE_STATES before,
                     D3D12_RESOURCE_STATES after) {
    D3D12_RESOURCE_BARRIER b{};
    b.Type = D3D12_RESOURCE_BARRIER_TYPE_TRANSITION;
    b.Transition = {r, D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES, before, after};
    cl->ResourceBarrier(1, &b);
  };

  // Upload C
  for (int i = 0; i < bufDev.size(); i++){
    void *p = nullptr;
    D3D12_RANGE r{0, 0};
    HR(bufUpload[i]->Map(0, &r, &p));
    std::memcpy(p, inbuf[i].data(), sizeof(int) * inbuf[i].size());
    bufUpload[i]->Unmap(0, nullptr);
    cl->CopyResource(bufDev[i].Get(), bufUpload[i].Get());
  }
  for (int i = 0; i < bufDev.size(); i++) {
    barrier(bufDev[i].Get(), D3D12_RESOURCE_STATE_COPY_DEST,
            D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE);
  }



  // Bind pipeline & root
  cl->SetPipelineState(PSO.Get());
  cl->SetComputeRootSignature(rs.Get());

  // Root param 0: UAV table at heap[0] (u0)
  if (inbuf.size()){
    ID3D12DescriptorHeap *heaps[] = {heap.Get()};
    cl->SetDescriptorHeaps(1, heaps);
    cl->SetComputeRootDescriptorTable(0, gpu);
  }

  cl->Dispatch(1, 1, 1);

  // Now prep result copy (not part of measured region)
  for (int i = 0; i < bufDev.size(); i++) {
    barrier(bufDev[i].Get(), D3D12_RESOURCE_STATE_UNORDERED_ACCESS,
            D3D12_RESOURCE_STATE_COPY_SOURCE);
  }
  for (int i = 0; i < bufDev.size(); i++) {
      cl->CopyResource(bufReadback[i].Get(), bufDev[i].Get());
  }


  // Submit + wait
  HR(cl->Close());
  ID3D12CommandList *lists[] = {cl.Get()};
  q->ExecuteCommandLists(1, lists);
  flush();

  // Readback -> host C
  int last = 0;
  for (int i = 0; i < bufDev.size(); i++){
    void *p = nullptr;
    D3D12_RANGE r{0, sizeof(int) * (inbuf[i].size())};
    last += inbuf[i].size();
    HR(bufReadback[i]->Map(0, &r, &p));
    std::memcpy(inbuf[i].data(), p, r.End);
    bufReadback[i]->Unmap(0, nullptr);
  }

  int err_code = 0;
  for (int bufindex = 0; bufindex < inbuf.size(); bufindex++){
    for (int i = 0; i < inbuf[bufindex].size(); i++){
      if (expected[bufindex][i] != inbuf[bufindex][i]){
        err_code = 1;
        std::cerr << "buf" << bufindex << "[" << i << "]: expected="
                  << expected[bufindex][i] << " actual=" << inbuf[bufindex][i]
                  << "\n";
      }
    }
  }

  CloseHandle(fenceEvent);
  return err_code;
}