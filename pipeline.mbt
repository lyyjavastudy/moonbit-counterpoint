///|
pub(all) struct PipelineInput {
  cantus : Array[Note]
  counterpoint : Array[Note]
  meter : Meter
  profile : RuleProfileConfig
} derive(Debug, Eq, ToJson)

///|
pub(all) struct PipelineOutput {
  validation : PairValidation
  rhythm : RhythmSummary
  contour : ContourSummary
  harmony : HarmonySummary
  motion : VoiceLeadingSummary
  report : ReportDocument
  recommendations : Array[Recommendation]
} derive(Debug, Eq, ToJson)

///|
pub fn PipelineInput::new(
  cantus~ : Array[Note],
  counterpoint~ : Array[Note],
  meter~ : Meter,
  profile~ : RuleProfileConfig,
) -> PipelineInput {
  { cantus, counterpoint, meter, profile }
}

///|
pub fn run_pipeline(input : PipelineInput) -> PipelineOutput {
  let validation = validate_pair(
    input.cantus,
    input.counterpoint,
    input.profile,
  )
  let analysis = validation.analysis
  {
    validation,
    rhythm: summarize_rhythm(input.meter, input.counterpoint),
    contour: contour_summary(input.counterpoint),
    harmony: harmony_summary(input.cantus, input.counterpoint),
    motion: summarize_voice_leading(
      input.cantus,
      input.counterpoint,
      MotionConstraint::classroom(),
    ),
    report: report_document(
      "Counterpoint pipeline",
      analysis,
      input.meter,
      input.cantus,
      input.counterpoint,
    ),
    recommendations: recommendations(analysis),
  }
}

///|
pub fn pipeline_passed(output : PipelineOutput) -> Bool {
  output.validation.passed() &&
  output.rhythm.notes > 0 &&
  output.motion.rejected == 0
}

///|
pub fn pipeline_score(output : PipelineOutput) -> Int {
  let base = output.validation.quality_score()
  let motion_penalty = output.motion.rejected * 5
  let tension_penalty = output.harmony.dissonant * 2
  cap_quality(base - motion_penalty - tension_penalty)
}

///|
pub fn pipeline_grade(output : PipelineOutput) -> String {
  let score = pipeline_score(output)
  if score >= 90 {
    "excellent"
  } else if score >= 75 {
    "good"
  } else if score >= 60 {
    "review"
  } else {
    "revise"
  }
}

///|
pub fn pipeline_summary(output : PipelineOutput) -> String {
  "grade=\{pipeline_grade(output)} score=\{pipeline_score(output)} notes=\{output.rhythm.notes} findings=\{output.validation.summary.total}"
}

///|
pub fn pipeline_markdown(output : PipelineOutput) -> String {
  let lines : Array[String] = [
    "# Counterpoint pipeline",
    "",
    "- Grade: \{pipeline_grade(output)}",
    "- Score: \{pipeline_score(output)}",
    "- Notes: \{output.rhythm.notes}",
    "- Findings: \{output.validation.summary.total}",
    "",
    render_document(output.report),
    "",
    recommendations_markdown(output.validation.analysis),
  ]
  lines.join("\n")
}

///|
pub fn pipeline_has_rule(output : PipelineOutput, rule : RuleKind) -> Bool {
  analysis_has_rule(output.validation.analysis, rule)
}

///|
pub fn pipeline_rule_count(output : PipelineOutput, rule : RuleKind) -> Int {
  finding_count(output.validation.analysis, rule)
}

///|
pub fn pipeline_recommendation_count(output : PipelineOutput) -> Int {
  output.recommendations.length()
}

///|
pub fn pipeline_report_section_count(output : PipelineOutput) -> Int {
  report_section_count(output.report)
}

///|
pub fn pipeline_is_explainable(output : PipelineOutput) -> Bool {
  pipeline_report_section_count(output) >= 5 &&
  pipeline_recommendation_count(output) == output.validation.summary.total
}

///|
pub fn pipeline_profile(output : PipelineOutput) -> String {
  output.validation.profile
}

///|
pub fn pipeline_quality_flags(output : PipelineOutput) -> Array[String] {
  let result : Array[String] = []
  if output.validation.cantus.issues.length() > 0 {
    result.push("cantus-timeline")
  }
  if output.validation.counterpoint.issues.length() > 0 {
    result.push("counterpoint-timeline")
  }
  if output.harmony.crossings > 0 {
    result.push("voice-crossing")
  }
  if output.harmony.dissonant > 0 {
    result.push("dissonance")
  }
  if output.motion.rejected > 0 {
    result.push("motion")
  }
  if output.rhythm.syncopations > 0 {
    result.push("syncopation")
  }
  result
}

///|
pub fn pipeline_has_quality_flag(
  output : PipelineOutput,
  flag : String,
) -> Bool {
  for value in pipeline_quality_flags(output) {
    if value == flag {
      return true
    }
  }
  false
}

///|
pub fn pipeline_manifest(output : PipelineOutput) -> Array[String] {
  let flags = pipeline_quality_flags(output).join(",")
  [
    "profile=\{pipeline_profile(output)}",
    "grade=\{pipeline_grade(output)}",
    "score=\{pipeline_score(output)}",
    "explainable=\{pipeline_is_explainable(output)}",
    "flags=\{flags}",
  ]
}

///|
pub fn pipeline_manifest_text(output : PipelineOutput) -> String {
  pipeline_manifest(output).join("\n")
}

///|
pub fn pipeline_compare(left : PipelineOutput, right : PipelineOutput) -> Int {
  pipeline_score(left) - pipeline_score(right)
}

///|
pub fn pipeline_with_profile(
  input : PipelineInput,
  profile : RuleProfileConfig,
) -> PipelineOutput {
  run_pipeline({ ..input, profile, })
}

///|
pub fn pipeline_profiles(input : PipelineInput) -> Array[PipelineOutput] {
  let result : Array[PipelineOutput] = []
  for profile in valid_profiles() {
    result.push(pipeline_with_profile(input, profile))
  }
  result
}

///|
pub fn best_pipeline(input : PipelineInput) -> PipelineOutput {
  let outputs = pipeline_profiles(input)
  let mut best = outputs[0]
  for output in outputs {
    if pipeline_score(output) > pipeline_score(best) {
      best = output
    }
  }
  best
}
