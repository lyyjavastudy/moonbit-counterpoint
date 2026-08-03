///|
fn expected_counter_duration(species : Species) -> Int {
  match species {
    First => 2
    Second => 1
    Third => 1
    Fourth => 2
    Fifth => 1
  }
}

///|
fn allowed_note_count(
  species : Species,
  cantus_count : Int,
  counter_count : Int,
) -> Bool {
  match species {
    First => counter_count == cantus_count
    Second => counter_count == cantus_count * 2
    Third => counter_count == cantus_count * 4
    Fourth => counter_count == cantus_count
    Fifth => counter_count >= cantus_count
  }
}

///|
pub fn analyze_species_shape(
  cantus : Array[Note],
  counter : Array[Note],
  options : AnalysisOptions,
) -> Array[Finding] {
  let out : Array[Finding] = []
  if !allowed_note_count(options.species, cantus.length(), counter.length()) {
    out.push(
      Finding::warning(
        rule=SpeciesRhythm,
        index=0,
        message="counterpoint event count does not match selected species",
      ),
    )
  }
  let expected = expected_counter_duration(options.species)
  if options.species != Fifth {
    for i, n in counter {
      if n.duration != expected {
        out.push(
          Finding::warning(
            rule=SpeciesRhythm,
            index=i,
            message="duration \{n.duration} differs from expected species duration \{expected}",
          ),
        )
      }
    }
  }
  if options.species == Fourth {
    for i, n in counter {
      if i > 0 && !n.tied_from_previous {
        out.push(
          Finding::warning(
            rule=SpeciesRhythm,
            index=i,
            message="fourth species expects suspension ties after the first note",
          ),
        )
      }
    }
  }
  out
}
