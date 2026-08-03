///|
fn add_span_finding(
  notes : Array[Note],
  options : AnalysisOptions,
  out : Array[Finding],
) -> Unit {
  if notes.length() == 0 {
    return
  }
  let mut lowest = notes[0].midi
  let mut highest = notes[0].midi
  for n in notes {
    if n.midi < lowest {
      lowest = n.midi
    }
    if n.midi > highest {
      highest = n.midi
    }
  }
  let span = highest - lowest
  if span > options.max_melody_span {
    out.push(
      Finding::warning(
        rule=MelodyRange,
        index=0,
        message="melodic span \{span} exceeds configured limit \{options.max_melody_span}",
      ),
    )
  }
}

///|
fn add_leap_findings(
  notes : Array[Note],
  options : AnalysisOptions,
  out : Array[Finding],
) -> Unit {
  if notes.length() < 2 {
    return
  }
  for i in 1..<notes.length() {
    let leap = absolute_melodic_interval(notes[i - 1], notes[i])
    if leap > options.max_leap {
      out.push(
        Finding::error(
          rule=LargeLeap,
          index=i,
          message="melodic leap \{leap} semitones is larger than \{options.max_leap}",
        ),
      )
    }
    if i + 1 < notes.length() && leap > 7 {
      let before = direction(notes[i - 1], notes[i])
      let after = direction(notes[i], notes[i + 1])
      let recovery = absolute_melodic_interval(notes[i], notes[i + 1])
      if before == after || after == Same || recovery > 4 {
        out.push(
          Finding::warning(
            rule=LeapRecovery,
            index=i + 1,
            message="large leap at \{i} should recover by small contrary motion",
          ),
        )
      }
    }
  }
}

///|
pub fn analyze_melody(
  notes : Array[Note],
  options : AnalysisOptions,
) -> Array[Finding] {
  let out : Array[Finding] = []
  add_span_finding(notes, options, out)
  add_leap_findings(notes, options, out)
  out
}
