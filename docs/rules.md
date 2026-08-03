# Counterpoint Rules

This project implements a conservative, explainable rule core for species
counterpoint. The rules are intentionally small and inspectable so teachers can
adjust them for classroom traditions.

## Pitch And Time Model

- `Note.midi` stores chromatic pitch as an integer.
- `Note.onset` and `Note.duration` use a small integer pulse grid.
- In the default examples, one cantus note lasts two pulses.
- The counterpoint voice is expected above the cantus for the current public API.

## Species Coverage

- First species: one counterpoint note against one cantus note.
- Second species: two counterpoint notes against one cantus note; weak-beat
  passing dissonance is allowed.
- Third species: four counterpoint notes against one cantus note; event-count
  validation is already modeled.
- Fourth species: tied suspensions are represented by `tied_from_previous`.
- Fifth species: mixed durations are allowed and checked by the shared vertical
  and melodic rule layers.

## Current Rule Set

- Parallel perfect consonances: flags parallel fifths and octaves.
- Hidden perfect consonances: warns on similar motion into a perfect consonance.
- Voice crossing: reports counterpoint notes at or below the cantus.
- Dissonance placement: disallows accented dissonance and all first-species
  dissonance.
- Melody range: warns when a configured span is exceeded.
- Large leap: reports leaps beyond the configured limit.
- Leap recovery: warns when a large leap is not followed by small contrary
  motion.
- Species rhythm: checks expected event counts and durations.
- Cadence shape: warns when the final aligned sonority is not perfect.

## Extension Plan

- Add lower-counterpoint mode and crossed-voice allowances.
- Add modal cadence profiles.
- Add prepared/resolved suspension classification for fourth species.
- Add import adapters for MIDI/MusicXML libraries such as existing MoonBit music
  packages.
- Add a rule profile layer for Fux-style, classroom, and composition-assistant
  modes.
