///|
fn make_sequence(size : Int, offset : Int) -> Array[@counterpoint.Note] {
  let result : Array[@counterpoint.Note] = []
  for i in 0..<size {
    result.push(
      @counterpoint.Note::new(midi=48 + (i + offset) % 24, onset=i, duration=1),
    )
  }
  result
}

///|
fn main {
  let cantus = make_sequence(1000, 0)
  let counter = make_sequence(1000, 7)
  let report = @counterpoint.validate_pair(
    cantus,
    counter,
    @counterpoint.RuleProfileConfig::classroom(),
  )
  let summary = report.summary
  println("notes=1000")
  println("findings=\{summary.total}")
  println("errors=\{summary.errors}")
  println("warnings=\{summary.warnings}")
  println("score=\{summary.score}")
  println("passed=\{report.passed()}")
}
