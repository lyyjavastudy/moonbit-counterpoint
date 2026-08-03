# Examples

## Clean First Species

Cantus: C4 D4 E4 F4 G4

Counterpoint: G4 A4 C5 D5 G5

Expected result:

```text
No counterpoint findings.
```

## Parallel Perfects

Cantus: C4 D4 E4 F4 G4

Counterpoint: G4 A4 B4 C5 D5

This moves by parallel fifths and should report `ParallelPerfect`.

## Second Species Passing Dissonance

Weak-beat dissonance can be accepted in second species when it is placed between
stable tones. The current engine treats weak pulses as odd onsets on the example
grid.
