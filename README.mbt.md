# moonbit-counterpoint

`moonbit-counterpoint` is an explainable MoonBit rule engine for species
counterpoint. It targets music education, composition assistants, and future
music-analysis tooling that needs precise rule reports rather than opaque
scores.

The package checks one-to-five species shape, parallel fifths and octaves,
hidden perfect consonances, melodic range, large leaps, weak/strong beat
dissonance placement, cadence shape, and structured error reporting.

```mbt check
///|
test {
  let cantus = [
    Note::new(midi=60, onset=0, duration=2, label="C"),
    Note::new(midi=62, onset=2, duration=2, label="D"),
    Note::new(midi=64, onset=4, duration=2, label="E"),
    Note::new(midi=65, onset=6, duration=2, label="F"),
    Note::new(midi=67, onset=8, duration=2, label="G"),
  ]
  let counter = [
    Note::new(midi=67, onset=0, duration=2, label="G"),
    Note::new(midi=65, onset=2, duration=2, label="F"),
    Note::new(midi=72, onset=4, duration=2, label="C"),
    Note::new(midi=81, onset=6, duration=2, label="A"),
    Note::new(midi=79, onset=8, duration=2, label="G"),
  ]
  let analysis = analyze_counterpoint(cantus, counter)
  inspect(analysis.is_clean(), content="true")
}
```

## Use

```bash
moon test
moon run cmd/main
```

## Project Shape

- `types.mbt`: public domain model and finding types.
- `intervals.mbt`: interval, direction, and motion helpers.
- `melody.mbt`: melodic span, leap, and recovery checks.
- `harmony.mbt`: vertical intervals, dissonance, parallels, cadence checks.
- `species.mbt`: first-to-fifth species rhythm and suspension-shape checks.
- `engine.mbt`: public analysis facade and report formatting.
- `docs/rules.md`: rule interpretation and extension notes.

## Source Statement

This repository is original MoonBit source written for the MoonBit August
Hackathon project `moonbit-counterpoint`. It does not vendor existing MoonBit
music packages. Existing ecosystem packages such as MIDI and music IR libraries
are treated as future interoperability targets, not code sources.

## License

Apache-2.0.
