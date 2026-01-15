RWBuffer<int> gData : register(u0);

int helper(int a){
  return a + 1;
}

[numthreads(1, 1, 1)]
void main(uint tid : SV_DispatchThreadID) {
  gData[0] = helper(1);
}
