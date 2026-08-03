///|
fn cantus_simple() -> Array[Note] {
  [
    Note::new(midi=60, onset=0, duration=2, label="C"),
    Note::new(midi=62, onset=2, duration=2, label="D"),
    Note::new(midi=64, onset=4, duration=2, label="E"),
    Note::new(midi=65, onset=6, duration=2, label="F"),
    Note::new(midi=67, onset=8, duration=2, label="G"),
  ]
}

///|
test "clean first species outline has no errors" {
  let counter = [
    Note::new(midi=67, onset=0, duration=2, label="G"),
    Note::new(midi=65, onset=2, duration=2, label="F"),
    Note::new(midi=72, onset=4, duration=2, label="C"),
    Note::new(midi=81, onset=6, duration=2, label="A"),
    Note::new(midi=79, onset=8, duration=2, label="G"),
  ]
  let analysis = analyze_counterpoint(cantus_simple(), counter)
  inspect(analysis.is_clean(), content="true")
}

///|
test "parallel fifths are reported as errors" {
  let counter = [
    Note::new(midi=67, onset=0, duration=2),
    Note::new(midi=69, onset=2, duration=2),
    Note::new(midi=71, onset=4, duration=2),
    Note::new(midi=72, onset=6, duration=2),
    Note::new(midi=74, onset=8, duration=2),
  ]
  let analysis = analyze_counterpoint(cantus_simple(), counter)
  debug_inspect(analysis.findings[0].rule, content="ParallelPerfect")
  inspect(analysis.is_clean(), content="false")
}

///|
test "second species allows passing dissonance on weak beats" {
  let counter = [
    Note::new(midi=67, onset=0, duration=1),
    Note::new(midi=66, onset=1, duration=1),
    Note::new(midi=69, onset=2, duration=1),
    Note::new(midi=71, onset=3, duration=1),
    Note::new(midi=72, onset=4, duration=1),
    Note::new(midi=74, onset=5, duration=1),
    Note::new(midi=74, onset=6, duration=1),
    Note::new(midi=76, onset=7, duration=1),
    Note::new(midi=79, onset=8, duration=1),
    Note::new(midi=81, onset=9, duration=1),
  ]
  let options = AnalysisOptions::default(species=Second)
  let analysis = analyze_counterpoint(cantus_simple(), counter, options~)
  let text = format_analysis(analysis)
  inspect(text.contains("DissonancePlacement"), content="false")
}

///|
test "large leap recovery is explainable" {
  let counter = [
    Note::new(midi=67, onset=0, duration=2),
    Note::new(midi=81, onset=2, duration=2),
    Note::new(midi=84, onset=4, duration=2),
    Note::new(midi=83, onset=6, duration=2),
    Note::new(midi=79, onset=8, duration=2),
  ]
  let analysis = analyze_counterpoint(cantus_simple(), counter)
  let report = format_analysis(analysis)
  inspect(report.contains("LargeLeap"), content="true")
  inspect(report.contains("LeapRecovery"), content="true")
}

///|
test "fourth species warns when suspension ties are absent" {
  let options = AnalysisOptions::default(species=Fourth)
  let counter = [
    Note::new(midi=67, onset=0, duration=2),
    Note::new(midi=69, onset=2, duration=2),
    Note::new(midi=72, onset=4, duration=2),
    Note::new(midi=74, onset=6, duration=2),
    Note::new(midi=79, onset=8, duration=2),
  ]
  let analysis = analyze_counterpoint(cantus_simple(), counter, options~)
  inspect(format_analysis(analysis).contains("fourth species"), content="true")
}
