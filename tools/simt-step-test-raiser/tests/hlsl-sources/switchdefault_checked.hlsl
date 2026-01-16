RWBuffer<int> gData : register(u0);

[numthreads(1, 1, 1)]
void main(uint tid : SV_DispatchThreadID) {
    uint a = 0;
    switch (8) {
        case 1:
            a = a + 5;
        case 2:
            a = a + 3;
            break;
        default:
            a = a + 1;
            break;
    }
    gData[0] = a;
}
