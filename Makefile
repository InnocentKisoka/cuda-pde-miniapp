ARCH ?= sm_70
NVCC ?= nvcc
NVCCFLAGS = -std=c++17 -O3 -arch=$(ARCH) -Iinclude -lineinfo
LDFLAGS = -lcublas -Xcompiler -fopenmp

BIN = bin/pde_miniapp
SRCS = src/main.cu src/data.cu src/linalg.cu src/operators.cu src/stats.cu

.PHONY: all clean run-demo

all: bin
	$(NVCC) $(NVCCFLAGS) $(SRCS) -o $(BIN) $(LDFLAGS)

bin:
	mkdir -p bin

clean:
	rm -rf bin

run-demo: all
	$(BIN) 64 64 20 0.01
