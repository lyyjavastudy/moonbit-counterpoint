///|
fn simultaneous(a : Note, b : Note) -> Bool {
  a.onset == b.onset
}

///|
fn min_int(a : Int, b : Int) -> Int {
  if a < b {
    a
  } else {
    b
  }
}

///|
fn add_vertical_findings(
  cantus : Array[Note],
  counter : Array[Note],
  options : AnalysisOptions,
  out : Array[Finding],
) -> Unit {
  let n = min_int(cantus.length(), counter.length())
  for i in 0..<n {
    if simultaneous(cantus[i], counter[i]) {
      let interval = harmonic_interval(cantus[i], counter[i])
      if counter[i].midi <= cantus[i].midi {
        out.push(
          Finding::error(
            rule=VoiceCrossing,
            index=i,
            message="counterpoint should stay above cantus at aligned event \{i}",
          ),
        )
      }
      if is_dissonance(interval) {
        let accented = counter[i].onset % 2 == 0
        if options.species == First || accented {
          out.push(
            Finding::error(
              rule=DissonancePlacement,
              index=i,
              message="dissonance \{interval_class(interval)} is not allowed on this beat",
            ),
          )
        }
      }
    }
  }
}

///|
fn add_motion_findings(
  cantus : Array[Note],
  counter : Array[Note],
  out : Array[Finding],
) -> Unit {
  let n = min_int(cantus.length(), counter.length())
  if n < 2 {
    return
  }
  for i in 1..<n {
    let old_interval = harmonic_interval(cantus[i - 1], counter[i - 1])
    let new_interval = harmonic_interval(cantus[i], counter[i])
    let m = motion(cantus[i - 1], cantus[i], counter[i - 1], counter[i])
    if is_perfect_consonance(old_interval) &&
      is_perfect_consonance(new_interval) &&
      m == Parallel {
      out.push(
        Finding::error(
          rule=ParallelPerfect,
          index=i,
          message="parallel perfect consonance into interval class \{interval_class(new_interval)}",
        ),
      )
    }
    if is_perfect_consonance(new_interval) && m == Similar {
      out.push(
        Finding::warning(
          rule=HiddenPerfect,
          index=i,
          message="similar motion into perfect consonance should be reviewed",
        ),
      )
    }
  }
}

///|
fn add_cadence_finding(
  cantus : Array[Note],
  counter : Array[Note],
  out : Array[Finding],
) -> Unit {
  let n = min_int(cantus.length(), counter.length())
  if n < 2 {
    return
  }
  let final_interval = interval_class(
    harmonic_interval(cantus[n - 1], counter[n - 1]),
  )
  if final_interval != 0 && final_interval != 7 {
    out.push(
      Finding::warning(
        rule=CadenceShape,
        index=n - 1,
        message="final sonority is expected to be octave/unison or fifth",
      ),
    )
  }
}

///|
pub fn analyze_harmony(
  cantus : Array[Note],
  counter : Array[Note],
  options : AnalysisOptions,
) -> Array[Finding] {
  let out : Array[Finding] = []
  add_vertical_findings(cantus, counter, options, out)
  add_motion_findings(cantus, counter, out)
  if options.strict_cadence {
    add_cadence_finding(cantus, counter, out)
  }
  out
}
