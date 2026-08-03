///|
pub(all) enum Species {
  First
  Second
  Third
  Fourth
  Fifth
} derive(Debug, Eq, ToJson)

///|
pub(all) enum Severity {
  Error
  Warning
  Info
} derive(Debug, Eq, ToJson)

///|
pub(all) enum RuleKind {
  ParallelPerfect
  HiddenPerfect
  VoiceCrossing
  DissonancePlacement
  MelodyRange
  LargeLeap
  LeapRecovery
  SpeciesRhythm
  CadenceShape
} derive(Debug, Eq, ToJson)

///|
pub(all) enum MotionKind {
  Parallel
  Similar
  Contrary
  Oblique
  Static
} derive(Debug, Eq, ToJson)

///|
pub(all) enum Direction {
  Up
  Down
  Same
} derive(Debug, Eq, ToJson)

///|
pub(all) struct Note {
  midi : Int
  onset : Int
  duration : Int
  tied_from_previous : Bool
  label : String
} derive(Debug, Eq, ToJson)

///|
pub fn Note::new(
  midi~ : Int,
  onset~ : Int,
  duration~ : Int,
  tied_from_previous? : Bool = false,
  label? : String = "",
) -> Note {
  { midi, onset, duration, tied_from_previous, label }
}

///|
pub(all) struct Finding {
  rule : RuleKind
  severity : Severity
  index : Int
  message : String
} derive(Debug, Eq, ToJson)

///|
pub fn Finding::error(
  rule~ : RuleKind,
  index~ : Int,
  message~ : String,
) -> Finding {
  { rule, severity: Error, index, message }
}

///|
pub fn Finding::warning(
  rule~ : RuleKind,
  index~ : Int,
  message~ : String,
) -> Finding {
  { rule, severity: Warning, index, message }
}

///|
pub(all) struct AnalysisOptions {
  species : Species
  strict_cadence : Bool
  max_melody_span : Int
  max_leap : Int
} derive(Debug, Eq, ToJson)

///|
pub fn AnalysisOptions::default(species~ : Species) -> AnalysisOptions {
  { species, strict_cadence: true, max_melody_span: 16, max_leap: 12 }
}
