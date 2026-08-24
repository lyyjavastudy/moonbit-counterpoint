///|
pub(all) enum RepairKind {
  StepUp
  StepDown
  ReduceLeap
  MoveIntoRange
  PreserveCadence
} derive(Debug, Eq, ToJson)

///|
pub(all) struct RepairSuggestion {
  index : Int
  kind : RepairKind
  replacement_midi : Int
  score : Int
  rationale : String
} derive(Debug, Eq, ToJson)

///|
/// Produce bounded single-event edits that can be reviewed before applying them.
pub fn repair_suggestions(
  finding : Finding,
  notes : Array[Note],
  max_leap : Int,
  low : Int,
  high : Int,
) -> Array[RepairSuggestion] {
  let result : Array[RepairSuggestion] = []
  if finding.index < 0 || finding.index >= notes.length() || low > high {
    return result
  }
  let current = notes[finding.index]
  let previous = if finding.index > 0 {
    Some(notes[finding.index - 1])
  } else {
    None
  }
  let next = if finding.index + 1 < notes.length() {
    Some(notes[finding.index + 1])
  } else {
    None
  }
  let proposals = repair_proposals(
    finding.rule,
    current,
    previous,
    next,
    max_leap,
  )
  for proposal in proposals {
    if proposal.0 >= low &&
      proposal.0 <= high &&
      proposal.0 != current.midi &&
      !contains_replacement(result, proposal.0) {
      result.push({
        index: finding.index,
        kind: proposal.1,
        replacement_midi: proposal.0,
        score: repair_score(current.midi, proposal.0, previous, next),
        rationale: repair_rationale(finding.rule, proposal.1),
      })
    }
  }
  sort_repairs(result)
  result
}

///|
fn repair_proposals(
  rule : RuleKind,
  current : Note,
  previous : Note?,
  next : Note?,
  max_leap : Int,
) -> Array[(Int, RepairKind)] {
  let result : Array[(Int, RepairKind)] = []
  match rule {
    LargeLeap | LeapRecovery =>
      match previous {
        Some(note) => {
          let direction = if current.midi >= note.midi { 1 } else { -1 }
          let step = if max_leap < 2 { max_leap } else { 2 }
          result.push((note.midi + direction * step, ReduceLeap))
          result.push((note.midi + direction, StepUp))
          result.push((note.midi - direction, StepDown))
        }
        None => {
          result.push((current.midi - 1, StepDown))
          result.push((current.midi + 1, StepUp))
        }
      }
    MelodyRange => {
      result.push((current.midi - 1, MoveIntoRange))
      result.push((current.midi + 1, MoveIntoRange))
    }
    CadenceShape =>
      match next {
        Some(note) => {
          result.push((note.midi - 1, PreserveCadence))
          result.push((note.midi + 1, PreserveCadence))
        }
        None => {
          result.push((current.midi - 1, PreserveCadence))
          result.push((current.midi + 1, PreserveCadence))
        }
      }
    _ => {
      result.push((current.midi - 1, StepDown))
      result.push((current.midi + 1, StepUp))
      result.push((current.midi - 2, StepDown))
      result.push((current.midi + 2, StepUp))
    }
  }
  result
}

///|
fn contains_replacement(
  suggestions : Array[RepairSuggestion],
  midi : Int,
) -> Bool {
  for suggestion in suggestions {
    if suggestion.replacement_midi == midi {
      return true
    }
  }
  false
}

///|
fn abs_value(value : Int) -> Int {
  if value < 0 {
    -value
  } else {
    value
  }
}

///|
fn repair_score(
  current : Int,
  replacement : Int,
  previous : Note?,
  next : Note?,
) -> Int {
  let edit_cost = abs_value(current - replacement)
  let previous_cost = match previous {
    Some(note) => abs_value(replacement - note.midi)
    None => 0
  }
  let next_cost = match next {
    Some(note) => abs_value(replacement - note.midi)
    None => 0
  }
  let raw = 100 - edit_cost * 3 - previous_cost - next_cost
  if raw < 0 {
    0
  } else {
    raw
  }
}

///|
fn repair_rationale(rule : RuleKind, kind : RepairKind) -> String {
  let action = repair_kind_name(kind)
  match rule {
    LargeLeap =>
      "\{action} keeps the melodic transition inside the configured leap policy."
    LeapRecovery => "\{action} creates a local response to the preceding leap."
    MelodyRange => "\{action} moves the event toward the permitted register."
    CadenceShape =>
      "\{action} preserves the final approach while changing one event."
    _ => "\{action} is a minimal local edit for the reported rule."
  }
}

///|
pub fn repair_kind_name(kind : RepairKind) -> String {
  match kind {
    StepUp => "step-up"
    StepDown => "step-down"
    ReduceLeap => "reduce-leap"
    MoveIntoRange => "move-into-range"
    PreserveCadence => "preserve-cadence"
  }
}

///|
fn sort_repairs(suggestions : Array[RepairSuggestion]) -> Unit {
  for i in 0..<suggestions.length() {
    for j in (i + 1)..<suggestions.length() {
      if suggestions[j].score > suggestions[i].score {
        let value = suggestions[i]
        suggestions[i] = suggestions[j]
        suggestions[j] = value
      }
    }
  }
}

///|
pub fn repair_suggestion_count(suggestions : Array[RepairSuggestion]) -> Int {
  suggestions.length()
}

///|
pub fn repair_suggestion_all_in_range(
  suggestions : Array[RepairSuggestion],
  low : Int,
  high : Int,
) -> Bool {
  for suggestion in suggestions {
    if suggestion.replacement_midi < low || suggestion.replacement_midi > high {
      return false
    }
  }
  true
}

///|
pub fn apply_repair_suggestion(
  notes : Array[Note],
  suggestion : RepairSuggestion,
) -> Array[Note] {
  let result = notes.copy()
  if suggestion.index >= 0 && suggestion.index < result.length() {
    let old = result[suggestion.index]
    result[suggestion.index] = {
      ..old,
      midi: suggestion.replacement_midi,
      label: pitch_label(suggestion.replacement_midi),
    }
  }
  result
}

///|
pub fn repair_suggestion_summary(suggestion : RepairSuggestion) -> String {
  "index=\{suggestion.index} kind=\{repair_kind_name(suggestion.kind)} midi=\{suggestion.replacement_midi} score=\{suggestion.score}"
}

///|
pub fn repair_suggestion_markdown(
  suggestions : Array[RepairSuggestion],
) -> String {
  let lines : Array[String] = [
    "## Repair suggestions", "", "| Index | Kind | Pitch | Score | Rationale |",
    "| ---: | --- | ---: | ---: | --- |",
  ]
  for suggestion in suggestions {
    lines.push(
      "| \{suggestion.index} | \{repair_kind_name(suggestion.kind)} | \{suggestion.replacement_midi} | \{suggestion.score} | \{suggestion.rationale} |",
    )
  }
  lines.join("\n")
}

///|
pub fn best_repair_suggestion(
  suggestions : Array[RepairSuggestion],
) -> RepairSuggestion? {
  if suggestions.length() == 0 {
    None
  } else {
    Some(suggestions[0])
  }
}

///|
pub fn repair_suggestion_average_score(
  suggestions : Array[RepairSuggestion],
) -> Int {
  if suggestions.length() == 0 {
    0
  } else {
    let mut total = 0
    for suggestion in suggestions {
      total += suggestion.score
    }
    total / suggestions.length()
  }
}

///|
pub fn repair_suggestion_kinds(
  suggestions : Array[RepairSuggestion],
) -> Array[String] {
  let result : Array[String] = []
  for suggestion in suggestions {
    let name = repair_kind_name(suggestion.kind)
    let mut seen = false
    for existing in result {
      if existing == name {
        seen = true
      }
    }
    if !seen {
      result.push(name)
    }
  }
  result
}

///|
pub fn repair_suggestion_for_index(
  suggestions : Array[RepairSuggestion],
  index : Int,
) -> Array[RepairSuggestion] {
  let result : Array[RepairSuggestion] = []
  for suggestion in suggestions {
    if suggestion.index == index {
      result.push(suggestion)
    }
  }
  result
}
