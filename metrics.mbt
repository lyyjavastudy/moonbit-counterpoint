///|
pub(all) struct AnalysisSummary {
  total : Int
  errors : Int
  warnings : Int
  infos : Int
  structural : Int
  harmonic : Int
  score : Int
} derive(Debug, Eq, ToJson)

///|
pub fn summarize(analysis : Analysis) -> AnalysisSummary {
  let mut errors = 0
  let mut warnings = 0
  let mut infos = 0
  let mut structural = 0
  let mut harmonic = 0
  for finding in analysis.findings {
    match finding.severity {
      Error => errors += 1
      Warning => warnings += 1
      Info => infos += 1
    }
    if rule_is_structural(finding.rule) {
      structural += 1
    }
    if rule_is_harmonic(finding.rule) {
      harmonic += 1
    }
  }
  let total = errors + warnings + infos
  let score = 100 - errors * 25 - warnings * 5 - infos
  {
    total,
    errors,
    warnings,
    infos,
    structural,
    harmonic,
    score: if score < 0 {
      0
    } else {
      score
    },
  }
}

///|
pub fn AnalysisSummary::passed(self : AnalysisSummary) -> Bool {
  self.errors == 0
}

///|
pub fn AnalysisSummary::grade(self : AnalysisSummary) -> String {
  if self.errors > 0 {
    "fail"
  } else if self.warnings > 0 {
    "review"
  } else {
    "pass"
  }
}

///|
pub fn AnalysisSummary::severity_total(self : AnalysisSummary) -> Int {
  self.errors * 2 + self.warnings + self.infos
}

///|
pub fn finding_count(analysis : Analysis, rule : RuleKind) -> Int {
  let mut result = 0
  for finding in analysis.findings {
    if finding.rule == rule {
      result += 1
    }
  }
  result
}

///|
pub fn findings_for(analysis : Analysis, severity : Severity) -> Array[Finding] {
  let result : Array[Finding] = []
  for finding in analysis.findings {
    if finding.severity == severity {
      result.push(finding)
    }
  }
  result
}

///|
pub fn findings_for_rule(
  analysis : Analysis,
  rule : RuleKind,
) -> Array[Finding] {
  let result : Array[Finding] = []
  for finding in analysis.findings {
    if finding.rule == rule {
      result.push(finding)
    }
  }
  result
}

///|
pub fn highest_severity(analysis : Analysis) -> Severity? {
  let mut result : Severity? = None
  for finding in analysis.findings {
    match result {
      None => result = Some(finding.severity)
      Some(current) =>
        if severity_rank(finding.severity) > severity_rank(current) {
          result = Some(finding.severity)
        }
    }
  }
  result
}

///|
pub fn analysis_is_empty(analysis : Analysis) -> Bool {
  analysis.findings.length() == 0
}

///|
pub fn analysis_has_rule(analysis : Analysis, rule : RuleKind) -> Bool {
  finding_count(analysis, rule) > 0
}

///|
pub fn analysis_indices(analysis : Analysis) -> Array[Int] {
  let result : Array[Int] = []
  for finding in analysis.findings {
    result.push(finding.index)
  }
  result
}

///|
pub fn score_for(analysis : Analysis, profile : RuleProfileConfig) -> Int {
  let summary = summarize(analysis)
  let strictness = if profile.is_valid() {
    profile.max_consecutive_perfect
  } else {
    1
  }
  let raw = 100 - summary.errors * 20 - summary.warnings * strictness
  if raw < 0 {
    0
  } else {
    raw
  }
}

///|
pub fn compare_scores(
  left : Analysis,
  right : Analysis,
  profile : RuleProfileConfig,
) -> Int {
  score_for(left, profile) - score_for(right, profile)
}
