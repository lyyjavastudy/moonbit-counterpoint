///|
pub(all) struct PairValidation {
  cantus : SequenceReport
  counterpoint : SequenceReport
  analysis : Analysis
  summary : AnalysisSummary
  profile : String
} derive(Debug, Eq, ToJson)

///|
pub fn analyze_with_profile(
  cantus : Array[Note],
  counter : Array[Note],
  profile : RuleProfileConfig,
) -> Analysis {
  let options = {
    species: First,
    strict_cadence: profile.require_cadence,
    max_melody_span: profile.max_span,
    max_leap: profile.max_leap,
  }
  analyze_counterpoint(cantus, counter, options~)
}

///|
pub fn validate_pair(
  cantus : Array[Note],
  counter : Array[Note],
  profile : RuleProfileConfig,
) -> PairValidation {
  let analysis = analyze_with_profile(cantus, counter, profile)
  {
    cantus: sequence_report(cantus),
    counterpoint: sequence_report(counter),
    analysis,
    summary: summarize(analysis),
    profile: profile.label(),
  }
}

///|
pub fn PairValidation::passed(self : PairValidation) -> Bool {
  self.cantus.is_valid() &&
  self.counterpoint.is_valid() &&
  self.summary.passed()
}

///|
pub fn PairValidation::quality_score(self : PairValidation) -> Int {
  score_for(self.analysis, profile_config(Classroom))
}

///|
pub fn PairValidation::markdown(self : PairValidation) -> String {
  let lines : Array[String] = [
    "# Pair validation",
    "",
    "- Profile: \{self.profile}",
    "- Passed: \{self.passed()}",
    "- Score: \{self.quality_score()}",
    "",
    sequence_markdown(self.cantus),
    "",
    sequence_markdown(self.counterpoint),
    "",
    analysis_markdown(self.analysis),
  ]
  lines.join("\n")
}

///|
pub fn compare_profiles(
  cantus : Array[Note],
  counter : Array[Note],
) -> Array[AnalysisSummary] {
  let result : Array[AnalysisSummary] = []
  for profile in [Classroom, Strict, Renaissance] {
    result.push(
      summarize(analyze_with_profile(cantus, counter, profile_config(profile))),
    )
  }
  result
}

///|
pub fn profile_labels() -> Array[String] {
  ["classroom", "strict", "renaissance", "custom"]
}

///|
pub fn valid_profiles() -> Array[RuleProfileConfig] {
  [
    RuleProfileConfig::classroom(),
    RuleProfileConfig::strict(),
    RuleProfileConfig::renaissance(),
  ]
}
