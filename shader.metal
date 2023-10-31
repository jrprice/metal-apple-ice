#include <metal_stdlib>

kernel void compute_main(const constant uint& input  [[buffer(0)]],
                               device   uint& output [[buffer(1)]]) {
  uint a = metal::reverse_bits(0);
  output = metal::select(input, a, (a > (4294967295u / a)));
  return;
}
