metal-apple-ice: main.m shader.metallib
	clang++ -fmodules -framework CoreGraphics main.m -o $@

shader.metallib: shader.metal
	xcrun metal shader.metal -o $@

clean:
	rm -f metal-apple-ice shader.metallib

.PHONY: clean
