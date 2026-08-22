# Production-scale counterpoint library plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox syntax for tracking.

**Goal:** Expand the usable MoonBit production implementation from 1,542 lines to at least 8,000 non-test, non-generated lines.

**Architecture:** Keep the root package as the public facade. Add focused modules for rhythm, melodic analysis, rule knowledge, candidate generation, recommendations, and interchange. Every module exposes deterministic pure functions and is exercised by the existing CLI or public analysis workflow.

**Tech Stack:** MoonBit stable, root MoonBit package, generated interface file, existing Note, Finding, Analysis, RuleProfileConfig, and SequenceReport types.

---

### Task 1: Add rhythm and meter domain model

**Files:** Create rhythm.mbt, modify workflow.mbt.

Add time signatures, beat strengths, grid construction, quantization, syncopation, duration histograms, and measure boundaries. Keep all operations integer-based and deterministic. Expose a rhythm summary that can be consumed by pair validation.

Validation: moon check --deny-warn, moon test --deny-warn.

### Task 2: Add melodic contour and statistical analysis

**Files:** Create contour.mbt, statistics.mbt.

Add contour symbols, turning-point extraction, step/leap classification, range distribution, interval histograms, repeated-note runs, cadence approach analysis, and pairwise melodic comparison. Expose stable summaries rather than raw implementation details.

Validation: check all targets and run the existing test suite.

### Task 3: Add explainable rule knowledge

**Files:** Create rule_catalog.mbt, recommendations.mbt.

Create a production rule catalog with categories, rationale, remediation, teaching level, and profile applicability. Add functions that map findings to remediation cards, group cards by topic, and produce deterministic next-step recommendations. The catalog is data used by the reporting API, not filler lines.

Validation: ensure every existing RuleKind has catalog entries and recommendation output.

### Task 4: Add candidate-note and phrase planning helpers

**Files:** Create candidates.mbt, phrase_planner.mbt.

Add bounded candidate pitch generation, consonance filtering, range filtering, motion filtering, cadence candidate selection, phrase segmentation, and deterministic ranking. These APIs support composition assistants without pretending to be a full automatic composer.

Validation: run the CLI benchmark and all MoonBit targets.

### Task 5: Add interchange and report builders

**Files:** Create interchange.mbt, report_sections.mbt.

Add line-oriented note import/export, stable tabular output, rule/profile manifests, report section builders, and round-trip-safe escaping. Keep the format dependency-free and explicit.

Validation: round-trip representative sequences and run format/check/test/info.

### Task 6: Integrate, measure, and release

**Files:** Modify workflow.mbt, reports.mbt, README.mbt.md, benchmarks/RESULTS.md, CHANGELOG.md, and generated interfaces.

Wire the new summaries into the public workflow and CLI benchmark, update documentation with transparent production/test counts, run all target checks and coverage, then commit and push.

Validation: production line count >= 8,000 excluding test files, _build, and generated interfaces; all tests pass; GitHub and Mooncakes remain synchronized.
