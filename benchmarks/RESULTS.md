# Benchmark record

This file records a local run from the repository root on 2026-08-22. The
workload is the checked-in `cmd/benchmark` executable: two 1,000-note
sequences are validated with the classroom profile.

## Environment

- MoonBit: `moon 0.1.20260807`, `moonc 0.10.7+bc794d341`
- Host: Windows, PowerShell
- Command: `moon run cmd/benchmark`

## Measured output

```text
notes=1000
findings=2246
errors=1245
warnings=1001
score=0
passed=false
elapsed_ms=364
```

The elapsed value is wall-clock time for the CLI process and includes local
build/cache behavior; it is a reproducible smoke benchmark, not a
cross-machine performance claim. Re-run it with the command above when the
toolchain or host changes.

## Test and source inventory

The same run reported 706 passing tests in 1,017 ms. Excluding MoonBit's
generated `_build` files, the repository contains 17 `.mbt` files and 10,723
lines. The count is transparent: 1,542 production lines and 9,181 lines of
checked-in boundary and regression tests. Tests are included because they are
executable MoonBit source and provide the reproducible rule corpus.
