///|
fn rule_text(rule : RuleKind) -> String {
  match rule {
    ParallelPerfect => "ParallelPerfect"
    HiddenPerfect => "HiddenPerfect"
    VoiceCrossing => "VoiceCrossing"
    DissonancePlacement => "DissonancePlacement"
    MelodyRange => "MelodyRange"
    LargeLeap => "LargeLeap"
    LeapRecovery => "LeapRecovery"
    SpeciesRhythm => "SpeciesRhythm"
    CadenceShape => "CadenceShape"
  }
}

///|
fn severity_text(severity : Severity) -> String {
  match severity {
    Error => "Error"
    Warning => "Warning"
    Info => "Info"
  }
}

///|
fn issue_index(issue : SequenceIssue) -> Int {
  match issue {
    EmptySequence => -1
    NegativePitch(index~) => index
    InvalidDuration(index~) => index
    NonMonotonicOnset(index~) => index
    Overlap(index~) => index
    DuplicateOnset(index~) => index
    ExcessiveGap(index~) => index
  }
}

///|
fn csv_escape(value : String) -> String {
  if value.contains(",") || value.contains("\"") || value.contains("\n") {
    "\"\{value}\""
  } else {
    value
  }
}

///|
pub fn finding_csv(finding : Finding) -> String {
  "\{csv_escape(rule_text(finding.rule))},\{csv_escape(severity_text(finding.severity))},\{finding.index},\{csv_escape(finding.message)}"
}

///|
pub fn analysis_csv(analysis : Analysis) -> String {
  let lines : Array[String] = ["rule,severity,index,message"]
  for finding in analysis.findings {
    lines.push(finding_csv(finding))
  }
  lines.join("\n")
}

///|
pub fn summary_csv(summary : AnalysisSummary) -> String {
  "total,errors,warnings,infos,structural,harmonic,score\n\{summary.total},\{summary.errors},\{summary.warnings},\{summary.infos},\{summary.structural},\{summary.harmonic},\{summary.score}"
}

///|
pub fn analysis_markdown(analysis : Analysis) -> String {
  let summary = summarize(analysis)
  let lines : Array[String] = [
    "## Counterpoint analysis",
    "",
    "| Metric | Value |",
    "| --- | ---: |",
    "| Grade | \{summary.grade()} |",
    "| Score | \{summary.score} |",
    "| Errors | \{summary.errors} |",
    "| Warnings | \{summary.warnings} |",
    "| Infos | \{summary.infos} |",
    "",
    "| Index | Severity | Rule | Message |",
    "| ---: | --- | --- | --- |",
  ]
  for finding in analysis.findings {
    lines.push(
      "| \{finding.index} | \{severity_text(finding.severity)} | \{rule_text(finding.rule)} | \{finding.message} |",
    )
  }
  lines.join("\n")
}

///|
pub fn sequence_markdown(report : SequenceReport) -> String {
  let lines : Array[String] = [
    "## Sequence validation",
    "",
    "- Notes: \{report.note_count}",
    "- Duration: \{report.duration}",
    "- Valid: \{report.is_valid()}",
    "- Issues: \{report.error_count()}",
  ]
  for issue in report.issues {
    lines.push("- issue at \{issue_index(issue)}")
  }
  lines.join("\n")
}

///|
pub fn analysis_title(analysis : Analysis) -> String {
  let summary = summarize(analysis)
  "counterpoint \{summary.grade()} (\{summary.score}/100)"
}

///|
pub fn report_line_count(analysis : Analysis) -> Int {
  if analysis.findings.length() == 0 {
    1
  } else {
    analysis.findings.length() + 1
  }
}

///|
pub fn compact_report(analysis : Analysis) -> String {
  let summary = summarize(analysis)
  "\{summary.grade()}:\{summary.score} e=\{summary.errors} w=\{summary.warnings}"
}
