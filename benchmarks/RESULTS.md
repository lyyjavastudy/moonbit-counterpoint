# Benchmark record

This file records a reproducible local run from the repository root on
2026-08-24. The workload is the checked-in cmd/benchmark executable: two
1,000-note sequences are validated with the classroom profile.

## Environment

- MoonBit 0.1.20260824
- MoonBit compiler 0.10.10+f8a486b6f
- Host: Windows, PowerShell
- Command: moon run cmd/benchmark

## Measured output

    notes=1000
    findings=2246
    errors=1245
    warnings=1001
    score=0
    passed=false

This is a deterministic smoke benchmark rather than a cross-machine
performance claim. Re-run the command after changing the toolchain or host to
collect a comparable local measurement.
