///|
fn main {
  let cantus = [
    @counterpoint.Note::new(midi=60, onset=0, duration=2, label="C"),
    @counterpoint.Note::new(midi=62, onset=2, duration=2, label="D"),
    @counterpoint.Note::new(midi=64, onset=4, duration=2, label="E"),
    @counterpoint.Note::new(midi=65, onset=6, duration=2, label="F"),
    @counterpoint.Note::new(midi=67, onset=8, duration=2, label="G"),
  ]
  let counter = [
    @counterpoint.Note::new(midi=67, onset=0, duration=2, label="G"),
    @counterpoint.Note::new(midi=65, onset=2, duration=2, label="F"),
    @counterpoint.Note::new(midi=72, onset=4, duration=2, label="C"),
    @counterpoint.Note::new(midi=81, onset=6, duration=2, label="A"),
    @counterpoint.Note::new(midi=79, onset=8, duration=2, label="G"),
  ]
  let analysis = @counterpoint.analyze_counterpoint(cantus, counter)
  println(@counterpoint.format_analysis(analysis))
}
