# CUDA PDE Mini-App — 2D Fisher / Diffusion Solver

[![CUDA](https://img.shields.io/badge/CUDA-C%2B%2B-76B900?logo=nvidia&logoColor=white)](https://developer.nvidia.com/cuda-zone)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A **realistic scientific mini-application**: implicit-style time stepping for a **2D nonlinear reaction–diffusion (Fisher-type) equation** on the GPU. Combines stencil operators, boundary handling, and linear-algebra kernels (CG-oriented) — the full stack employers expect beyond toy kernels.

---

## Skills demonstrated

| Area | Implementation |
|------|----------------|
| Multi-file CUDA project | `main`, `operators`, `linalg`, `data`, `stats` |
| Device parameter structs | `__device__` params + `cudaMemcpyToSymbol` |
| Interior + boundary stencils | East/west/north/south + interior |
| 2D domain discretization | `nx × ny` fields |
| BLAS-1 style device kernels | axpy-like ops, copy, etc. |
| Solver scaffolding | Persistent device fields for CG temps |
| OpenMP on host | Optional host-side parallel checks |
| cuBLAS linkage | Project links `-lcublas` for dense ops where used |

**Resume bullets:**
- Developed a multi-module **CUDA PDE mini-app** with nonlinear stencil operators and device-side linear algebra.
- Structured GPU code with clear separation of **data layout, operators, and solvers**.
- Used **device constant/symbol parameters** to avoid re-passing mesh metadata every kernel call.

---

## Build & run

```bash
make ARCH=sm_80
./bin/pde_miniapp 128 128 50 0.01
# args: nx ny nt total_time
```

---

## Architecture

```
main.cu
  ├─ data.*        field storage (host/device views)
  ├─ operators.*   diffusion + reaction stencils (GPU)
  ├─ linalg.*      vector kernels / CG support
  └─ stats.*       timing & counters
```

---

## Attribution

Core numerical mini-app from CSCS–USI Summer School CUDA curriculum (Ben Cumming et al.); reorganized as a portfolio repository by Innocent Kisoka.
