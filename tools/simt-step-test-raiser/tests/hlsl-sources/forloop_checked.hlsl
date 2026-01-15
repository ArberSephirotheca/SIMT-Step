RWBuffer<int> gData : register(u0);

[numthreads(1, 1, 1)]
void main(uint tid : SV_DispatchThreadID) {
    uint a = 0;
    for (uint i = 0; i < 10; i = i + 1){
        a = a + i;
    }
    gData[0] = a;
}
