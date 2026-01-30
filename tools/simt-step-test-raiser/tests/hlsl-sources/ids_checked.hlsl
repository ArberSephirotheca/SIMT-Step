RWBuffer<int> gData : register(u0);

[numthreads(64, 1, 1)]
void main(uint tid : SV_DispatchThreadID) {
    gData[tid * 64 + 0] = tid;
    gData[tid * 64 + 1] = WaveActiveCountBits(true);
    gData[tid * 64 + 2] = WaveGetLaneIndex();
}
