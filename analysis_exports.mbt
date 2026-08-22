///|
pub(all) struct AnalysisExport {
  title : String
  profile : String
  summary : AnalysisSummary
  findings : Array[String]
  recommendations : Array[String]
  fingerprint : String
} derive(Debug, Eq, ToJson)

///|
pub fn make_analysis_export(
  title : String,
  profile : RuleProfileConfig,
  analysis : Analysis,
) -> AnalysisExport {
  let finding_lines : Array[String] = []
  for finding in analysis.findings {
    finding_lines.push(format_finding(finding))
  }
  let recommendation_lines : Array[String] = []
  for recommendation in recommendations(analysis) {
    recommendation_lines.push(recommendation_markdown(recommendation))
  }
  {
    title,
    profile: profile.label(),
    summary: summarize(analysis),
    findings: finding_lines,
    recommendations: recommendation_lines,
    fingerprint: analysis_fingerprint(analysis),
  }
}

///|
pub fn analysis_fingerprint(analysis : Analysis) -> String {
  let parts : Array[String] = []
  for finding in analysis.findings {
    parts.push(
      "\{rule_text(finding.rule)}:\{severity_text(finding.severity)}:\{finding.index}",
    )
  }
  parts.join("|")
}

///|
pub fn export_line_count(value : AnalysisExport) -> Int {
  5 + value.findings.length() + value.recommendations.length()
}

///|
pub fn export_csv(value : AnalysisExport) -> String {
  let lines : Array[String] = ["title,profile,total,errors,warnings,score"]
  lines.push(
    "\{value.title},\{value.profile},\{value.summary.total},\{value.summary.errors},\{value.summary.warnings},\{value.summary.score}",
  )
  for finding in value.findings {
    lines.push("finding,\{finding}")
  }
  lines.join("\n")
}

///|
pub fn export_markdown(value : AnalysisExport) -> String {
  let lines : Array[String] = [
    "# \{value.title}",
    "",
    "- Profile: \{value.profile}",
    "- Grade: \{value.summary.grade()}",
    "- Score: \{value.summary.score}",
    "",
    "## Findings",
    "",
  ]
  for finding in value.findings {
    lines.push("- \{finding}")
  }
  lines.push("")
  lines.push("## Recommendations")
  lines.push("")
  for recommendation in value.recommendations {
    lines.push(recommendation)
  }
  lines.join("\n")
}

///|
pub fn export_has_fingerprint(
  value : AnalysisExport,
  fingerprint : String,
) -> Bool {
  value.fingerprint == fingerprint
}

///|
pub fn export_grade(value : AnalysisExport) -> String {
  value.summary.grade()
}

///|
pub fn export_score(value : AnalysisExport) -> Int {
  value.summary.score
}

///|
pub fn export_findings_for(
  value : AnalysisExport,
  rule : RuleKind,
) -> Array[String] {
  let result : Array[String] = []
  let name = rule_text(rule)
  for finding in value.findings {
    if finding.contains(name) {
      result.push(finding)
    }
  }
  result
}

///|
pub fn export_is_clean(value : AnalysisExport) -> Bool {
  value.summary.errors == 0
}

///|
pub fn export_profile(value : AnalysisExport) -> String {
  value.profile
}

///|
pub fn export_summary_line(value : AnalysisExport) -> String {
  "\{export_grade(value)} / \{export_score(value)}"
}

///|
pub fn export_recommendation_count(value : AnalysisExport) -> Int {
  value.recommendations.length()
}

///|
pub fn export_findings_count(value : AnalysisExport) -> Int {
  value.findings.length()
}

///|
pub fn export_to_sections(value : AnalysisExport) -> Array[ReportSection] {
  [
    ReportSection::new(
      id="export-summary",
      title="Export summary",
      body=export_summary_line(value),
      priority=0,
    ),
    ReportSection::new(
      id="export-findings",
      title="Export findings",
      body=value.findings.join("\n"),
      priority=10,
    ),
    ReportSection::new(
      id="export-next-steps",
      title="Export next steps",
      body=value.recommendations.join("\n"),
      priority=20,
    ),
  ]
}
