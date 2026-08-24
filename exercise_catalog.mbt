///|
pub(all) struct ExerciseSpec {
  id : String
  rule : RuleKind
  species : Species
  title : String
  objective : String
  prompt : String
  target : String
  level : String
  notes : Int
} derive(Debug, Eq, ToJson)

///|
/// The curriculum is intentionally small and curated: each item names a distinct musical task.
pub fn exercise_catalog() -> Array[ExerciseSpec] {
  [
    {
      id: "first-parallel-fifths",
      rule: ParallelPerfect,
      species: First,
      title: "Separate consecutive fifths",
      objective: "Recognize two adjacent perfect fifths in first species.",
      prompt: "Keep the first sonority and rewrite only the second counterpoint pitch.",
      target: "Preserve the contour while replacing the second perfect interval with a consonant third.",
      level: "foundation",
      notes: 5,
    },
    {
      id: "second-parallel-octaves",
      rule: ParallelPerfect,
      species: Second,
      title: "Audit repeated octaves at strong beats",
      objective: "Distinguish a permitted consonance from a parallel octave.",
      prompt: "Compare the aligned strong beats and identify the smallest edit that breaks the parallel motion.",
      target: "Leave weak-beat passing material intact and remove the repeated strong-beat octave.",
      level: "intermediate",
      notes: 8,
    },
    {
      id: "fifth-contrary-motion",
      rule: ParallelPerfect,
      species: Fifth,
      title: "Design contrary motion into a perfect interval",
      objective: "Use motion labels to repair a perfect-interval transition.",
      prompt: "Generate two candidate pitches and select the one with contrary motion and a stable range.",
      target: "Produce one ranked candidate that avoids consecutive perfect intervals.",
      level: "advanced",
      notes: 10,
    },
    {
      id: "hidden-cadence-approach",
      rule: HiddenPerfect,
      species: First,
      title: "Soften a hidden octave",
      objective: "Locate similar motion into a final perfect sonority.",
      prompt: "Keep the final note fixed and change the penultimate upper note by step.",
      target: "Approach the final octave without a large upper-voice leap.",
      level: "intermediate",
      notes: 6,
    },
    {
      id: "hidden-fifth-step",
      rule: HiddenPerfect,
      species: Second,
      title: "Approach a fifth by step",
      objective: "Compare a leap approach with a stepwise approach to a fifth.",
      prompt: "Render both reports and identify which upper-voice transition removes the warning.",
      target: "Retain the rhythmic pattern while making the approach stepwise.",
      level: "intermediate",
      notes: 8,
    },
    {
      id: "hidden-profile-review",
      rule: HiddenPerfect,
      species: Fifth,
      title: "Review hidden intervals by profile",
      objective: "Explain why a profile may allow or reject a hidden perfect interval.",
      prompt: "Run the same phrase through classroom and strict profiles.",
      target: "Report the profile-dependent difference without changing the source phrase.",
      level: "advanced",
      notes: 12,
    },
    {
      id: "crossing-register",
      rule: VoiceCrossing,
      species: First,
      title: "Restore registral order",
      objective: "Find the first point where the counterpoint crosses the cantus.",
      prompt: "Use the finding index to edit the crossing event rather than the entire phrase.",
      target: "Keep every aligned pair in the intended lower-to-upper order.",
      level: "foundation",
      notes: 5,
    },
    {
      id: "crossing-neighbor",
      rule: VoiceCrossing,
      species: Second,
      title: "Repair a weak-beat crossing",
      objective: "Repair a crossing caused by a passing note.",
      prompt: "Move the passing note by one scale step and compare the contour summary.",
      target: "Remove the crossing while preserving the weak-beat direction.",
      level: "intermediate",
      notes: 9,
    },
    {
      id: "crossing-range-candidate",
      rule: VoiceCrossing,
      species: Fifth,
      title: "Rank register-safe candidates",
      objective: "Use candidate generation to keep a dense phrase inside its voice range.",
      prompt: "Filter candidates by range before scoring their harmonic motion.",
      target: "Return a best candidate that is registrally ordered and consonant.",
      level: "advanced",
      notes: 14,
    },
    {
      id: "weak-beat-dissonance",
      rule: DissonancePlacement,
      species: Second,
      title: "Place a passing dissonance",
      objective: "Tell a prepared weak-beat dissonance from an unsupported clash.",
      prompt: "Inspect the beat strength and neighboring intervals around the dissonant event.",
      target: "Keep the passing dissonance on a weak beat with stepwise preparation and resolution.",
      level: "intermediate",
      notes: 8,
    },
    {
      id: "suspension-resolution",
      rule: DissonancePlacement,
      species: Fourth,
      title: "Resolve a suspension",
      objective: "Trace a tied suspension from preparation through resolution.",
      prompt: "Mark the tied event and edit only its resolution direction.",
      target: "Produce a suspension that resolves by step into a consonance.",
      level: "advanced",
      notes: 10,
    },
    {
      id: "dissonance-profile",
      rule: DissonancePlacement,
      species: Fifth,
      title: "Compare dissonance policy",
      objective: "Measure how profile policy changes weak-beat dissonance handling.",
      prompt: "Run both classroom and strict configurations over the same phrase.",
      target: "Explain the changed severity and preserve the same note data.",
      level: "advanced",
      notes: 12,
    },
    {
      id: "range-foundation",
      rule: MelodyRange,
      species: First,
      title: "Keep a singable span",
      objective: "Measure the range of a short first-species line.",
      prompt: "Find the outlying pitch and move it toward the phrase center.",
      target: "Meet the configured span without changing the cadence note.",
      level: "foundation",
      notes: 5,
    },
    {
      id: "range-contour",
      rule: MelodyRange,
      species: Second,
      title: "Constrain a decorated line",
      objective: "Balance range and passing motion in a second-species phrase.",
      prompt: "Compare pitch statistics before and after a local range edit.",
      target: "Reduce the span while retaining the passing-note contour.",
      level: "intermediate",
      notes: 9,
    },
    {
      id: "range-voice-profile",
      rule: MelodyRange,
      species: Fifth,
      title: "Fit a line to a voice profile",
      objective: "Use a voice assessment to detect a phrase outside its register.",
      prompt: "Evaluate the phrase against the selected voice range and inspect its score.",
      target: "Return a register-safe phrase with the same harmonic outline.",
      level: "advanced",
      notes: 14,
    },
    {
      id: "leap-size",
      rule: LargeLeap,
      species: First,
      title: "Reduce an unsupported leap",
      objective: "Identify a melodic leap that exceeds the analysis profile.",
      prompt: "Replace the leap with a consonant stepwise bridge and rerun the analyzer.",
      target: "Remove the large-leap finding without introducing a crossing.",
      level: "foundation",
      notes: 6,
    },
    {
      id: "leap-phrase-point",
      rule: LargeLeap,
      species: Second,
      title: "Place a leap at a phrase point",
      objective: "Distinguish a structural leap from an accidental interior leap.",
      prompt: "Use turning points and beat strength to choose the better location.",
      target: "Keep one intentional leap at a structural point and smooth the interior motion.",
      level: "intermediate",
      notes: 10,
    },
    {
      id: "leap-candidate-filter",
      rule: LargeLeap,
      species: Fifth,
      title: "Filter large-leap candidates",
      objective: "Combine candidate generation with a maximum leap policy.",
      prompt: "Generate a bounded candidate set and reject pitches exceeding the profile limit.",
      target: "Select the highest-scoring candidate that satisfies the leap bound.",
      level: "advanced",
      notes: 14,
    },
    {
      id: "recovery-step",
      rule: LeapRecovery,
      species: First,
      title: "Recover after an upward leap",
      objective: "Detect whether the following event reverses a large leap by step.",
      prompt: "Change the immediate successor while leaving the leap itself unchanged.",
      target: "Create a clear descending step after the upward leap.",
      level: "foundation",
      notes: 6,
    },
    {
      id: "recovery-direction",
      rule: LeapRecovery,
      species: Second,
      title: "Repair a same-direction recovery",
      objective: "Compare same-direction and contrary-direction recovery choices.",
      prompt: "Use contour steps to choose the candidate that restores balance.",
      target: "Make the recovery direction explicit without breaking the species rhythm.",
      level: "intermediate",
      notes: 9,
    },
    {
      id: "recovery-cadence",
      rule: LeapRecovery,
      species: Fifth,
      title: "Recover before a cadence",
      objective: "Plan recovery while preserving the final cadence shape.",
      prompt: "Rank recovery candidates by contour, range, and cadence distance.",
      target: "Improve melodic balance without altering the final sonority.",
      level: "advanced",
      notes: 15,
    },
    {
      id: "species-count",
      rule: SpeciesRhythm,
      species: Second,
      title: "Match second-species density",
      objective: "Validate the expected two-to-one event relationship.",
      prompt: "Inspect the species finding and add or remove only one counterpoint event.",
      target: "Match the cantus event count while retaining ordered onsets.",
      level: "foundation",
      notes: 8,
    },
    {
      id: "species-suspension",
      rule: SpeciesRhythm,
      species: Fourth,
      title: "Mark suspension ties",
      objective: "Use tie metadata to distinguish a suspension from a new attack.",
      prompt: "Add the missing tie to each non-initial suspension event.",
      target: "Pass the fourth-species tie check with no duration changes.",
      level: "intermediate",
      notes: 10,
    },
    {
      id: "species-mixed",
      rule: SpeciesRhythm,
      species: Fifth,
      title: "Audit mixed-species density",
      objective: "Review a flexible fifth-species phrase with varied durations.",
      prompt: "Use the rhythm summary to locate gaps, overlaps, and syncopations.",
      target: "Keep intentional variation while eliminating accidental timeline errors.",
      level: "advanced",
      notes: 16,
    },
    {
      id: "cadence-final",
      rule: CadenceShape,
      species: First,
      title: "Validate the final sonority",
      objective: "Check the final aligned interval and its approach.",
      prompt: "Inspect only the last two events and compare the cadence finding.",
      target: "End on a valid sonority with a controlled approach.",
      level: "intermediate",
      notes: 6,
    },
    {
      id: "cadence-report",
      rule: CadenceShape,
      species: Second,
      title: "Explain a cadence in a report",
      objective: "Turn the cadence finding into a concise report section.",
      prompt: "Export the analysis and identify the final approach in Markdown and CSV.",
      target: "Produce matching machine-readable and human-readable cadence evidence.",
      level: "advanced",
      notes: 10,
    },
    {
      id: "cadence-planner",
      rule: CadenceShape,
      species: Fifth,
      title: "Plan a cadence candidate",
      objective: "Use phrase planning to select a legal final approach.",
      prompt: "Generate cadence candidates and rank them against the active profile.",
      target: "Return a cadence plan whose final interval and approach both pass validation.",
      level: "advanced",
      notes: 15,
    },
  ]
}

///|
pub fn exercise_count() -> Int {
  exercise_catalog().length()
}

///|
pub fn exercises_for_rule(rule : RuleKind) -> Array[ExerciseSpec] {
  let result : Array[ExerciseSpec] = []
  for item in exercise_catalog() {
    if item.rule == rule {
      result.push(item)
    }
  }
  result
}

///|
pub fn exercises_for_species(species : Species) -> Array[ExerciseSpec] {
  let result : Array[ExerciseSpec] = []
  for item in exercise_catalog() {
    if item.species == species {
      result.push(item)
    }
  }
  result
}

///|
pub fn exercises_for_level(level : String) -> Array[ExerciseSpec] {
  let result : Array[ExerciseSpec] = []
  for item in exercise_catalog() {
    if item.level == level {
      result.push(item)
    }
  }
  result
}

///|
pub fn exercise(id : String) -> ExerciseSpec? {
  for item in exercise_catalog() {
    if item.id == id {
      return Some(item)
    }
  }
  None
}

///|
pub fn next_exercise(
  rule : RuleKind,
  completed : Array[String],
) -> ExerciseSpec? {
  for item in exercises_for_rule(rule) {
    let mut found = false
    for id in completed {
      if id == item.id {
        found = true
      }
    }
    if !found {
      return Some(item)
    }
  }
  None
}

///|
pub fn exercise_prompt(item : ExerciseSpec) -> String {
  "\{item.title}: \{item.prompt}"
}

///|
pub fn exercise_objective(item : ExerciseSpec) -> String {
  item.objective
}

///|
pub fn exercise_target(item : ExerciseSpec) -> String {
  item.target
}

///|
pub fn exercise_minutes(item : ExerciseSpec) -> Int {
  5 + item.notes / 2
}

///|
pub fn exercise_summary(item : ExerciseSpec) -> String {
  "\{item.id} / \{item.level} / \{item.notes} notes / \{rule_family(item.rule)}"
}

///|
pub fn exercise_catalog_markdown(rule : RuleKind) -> String {
  let lines : Array[String] = ["## Exercises for \{rule_family(rule)}", ""]
  for item in exercises_for_rule(rule) {
    lines.push("- \{item.id}: \{item.title} (\{item.level})")
  }
  lines.join("\n")
}
