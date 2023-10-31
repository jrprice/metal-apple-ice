# Reproducer for an internal compiler error in the Apple Metal driver

See `shader.metal` for the MSL code.

## Reproduced on:

```
 macOS: Sonoma 14.7
 Model Name: MacBook Pro
 GPU: Apple M1
```

Does not reproduce on Intel or AMD GPUs.

## Building and Running

```bash
make
./metal-apple-ice
```

On a machine with an Apple GPU it produces:
```
Device: Apple M1 Pro
2024-09-26 16:51:39.320 metal-apple-ice[92543:6437085] Failed to created pipeline state object, error Error Domain=AGXMetalG13X Code=3 "Compiler encountered an internal error" UserInfo={NSLocalizedDescription=Compiler encountered an internal error}.
```
