#import <Metal/Metal.h>

bool CompileForDevice(id<MTLDevice> device) {
  printf("\nDevice: %s\n", [device.name UTF8String]);

  NSError *error = nil;
  NSURL *url = [NSURL fileURLWithPath:@"shader.metallib"];
  id<MTLLibrary> library = [device newLibraryWithURL:url error:&error];
  if (library == nil) {
    NSLog(@"Failed to load the library.");
    return false;
  }

  id<MTLFunction> computeFunction = [library newFunctionWithName:@"compute_main"];
  if (computeFunction == nil) {
    NSLog(@"Failed to find the compute function.");
    return false;
  }

  id<MTLComputePipelineState> pipeline =
    [device newComputePipelineStateWithFunction:computeFunction error:&error];
  if (pipeline == nil) {
    NSLog(@"Failed to created pipeline state object, error %@.", error);
    return false;
  }

  printf("Compute pipeline created successfully.\n");

  return true;
}

int main(int argc, const char *argv[]) {
  @autoreleasepool {
    NSArray<id<MTLDevice>>* devices = MTLCopyAllDevices();
    for (id<MTLDevice> device in devices) {
      if (!CompileForDevice(device)) {
        return 1;
      }
    }
  }
  return 0;
}
