# moonbit-counterpoint

An explainable counterpoint analysis toolkit for MoonBit. It turns species
counterpoint rules into typed findings that can be shown to a learner,
consumed by a composition assistant, or exported by a command-line workflow.

## Project positioning

The library focuses on the analysis layer between a note sequence and a music
editor. It does not attempt to replace MIDI playback or notation rendering.
Its boundary is deliberately small: represent notes, validate timelines,
analyze counterpoint, summarize findings, and produce machine-readable or
human-readable reports.

## Core capabilities

- First through fifth species rhythm-shape checks.
- Parallel and hidden perfect consonance checks.
- Voice crossing and dissonance placement diagnostics.
- Melodic span, leap, recovery, cadence, and suspension guidance.
- Classroom, strict, Renaissance, and custom rule profiles.
- Timeline validation for empty, overlapping, duplicate, non-monotonic, and
  excessively gapped input.
- Pitch-class, register, voice-range, histogram, and transposition helpers.
- Stable summaries with pass/review/fail grades and deterministic scores.
- CSV and Markdown reports suitable for CLI output or editor integrations.
- End-to-end pipeline output with quality gates, scorecards, practice plans,
  profile comparison, history tracking, and batch variant reports.
- Dependency-free interchange helpers for note rows, TSV, manifests, and
  stable sequence fingerprints.

## Quick start

Install MoonBit stable, clone the repository, and run:

```bash
moon check --target all
moon test --target all
moon run cmd/main
```

Minimal library usage:

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
  let result = validate_pair(cantus, counter, RuleProfileConfig::classroom())
  inspect(result.passed(), content="true")
}
```

## CLI

The example executable in cmd/main analyzes a small first-species exercise
and prints the structured findings. It is intentionally dependency-free so it
can serve as a smoke test for a fresh MoonBit installation.

The library APIs can be composed into an application-specific CLI:

- analyze_counterpoint returns the full typed report.
- summarize returns counts, score, grade, and rule-family totals.
- analysis_csv and analysis_markdown export reports.
- sequence_report validates note timing before analysis.
- validate_pair combines input validation, analysis, and profile metadata.

## Architecture

| Module | Responsibility |
| --- | --- |
| types.mbt | Public note, rule, finding, species, and option types |
| intervals.mbt | Melodic/harmonic interval and motion primitives |
| melody.mbt | Range, leap, and recovery diagnostics |
| harmony.mbt | Vertical sonority, parallels, hidden perfects, and cadence |
| species.mbt | Species rhythm and suspension-shape rules |
| profiles.mbt | Reusable rule policy presets and classification helpers |
| timeline.mbt | Sequence validation and note-time utilities |
| pitch.mbt / voices.mbt | Pitch classes, registers, voice ranges, and alignment |
| metrics.mbt / reports.mbt | Scores, summaries, CSV, and Markdown output |
| workflow.mbt | End-to-end pair validation facade |
| rhythm.mbt / contour.mbt / statistics.mbt | Meter, contour, distribution, and motion statistics |
| candidates.mbt / phrase_planner.mbt | Bounded candidate generation and phrase planning |
| phrase_windows.mbt / candidate_evidence.mbt | Local phrase partitioning and explainable candidate constraints |
| analysis_triage.mbt / repair_suggestions.mbt | Repair prioritization and bounded single-event edits |
| harmony_tools.mbt / voice_leading.mbt | Sonority profiles and motion constraints |
| rule_catalog.mbt / exercise_catalog.mbt / teaching.mbt | Explainable rule and practice content |
| pipeline.mbt / quality_gate.mbt / scorecards.mbt | Production analysis orchestration and quality gates |
| interchange.mbt / report_sections.mbt / analysis_exports.mbt | Interchange and composable report artifacts |

All public domain types are owned by the root package. The implementation is
pure and deterministic, which keeps it suitable for teaching tools, snapshot
tests, and future MIDI/MusicXML adapters.

## Benchmarks

The repository includes a reproducible benchmark record in
benchmarks/RESULTS.md. It reports the measured MoonBit commands and a
1,000-note analysis workload. Re-run the commands from the repository root
when comparing toolchain versions.

## Testing

The test suite contains rule examples, report checks, production API checks, and a boundary
matrix. It exercises malformed timelines, extreme registers, zero and varied
durations, duplicate onsets, transposition, scaling, pitch histograms, and
voice-range calculations.

```bash
moon fmt --check
moon check --target all
moon test --target all
moon coverage report -f summary
moon coverage analyze
```

## CI

GitHub Actions runs on Ubuntu, macOS, and Windows. It installs the current
MoonBit stable toolchain, enforces the supported compiler floor, checks all
targets, runs all tests, verifies formatting and generated interfaces, and
publishes only through an explicit manual workflow.

## License

Apache-2.0. See LICENSE.
