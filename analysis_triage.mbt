///|
pub(all) enum TriageBand {
  Critical
  Attention
  Healthy
} derive(Debug, Eq, ToJson)

///|
pub(all) struct TriageItem {
  rule : RuleKind
  count : Int
  errors : Int
  warnings : Int
  infos : Int
  priority : Int
  band : TriageBand
  action : String
} derive(Debug, Eq, ToJson)

///|
pub(all) struct AnalysisTriage {
  band : TriageBand
  items : Array[TriageItem]
  total_findings : Int
  repair_score : Int
} derive(Debug, Eq, ToJson)

///|
/// Convert raw findings into a stable repair queue for editors and teaching tools.
pub fn triage_analysis(analysis : Analysis) -> AnalysisTriage {
  let items : Array[TriageItem] = []
  for rule in triage_rules() {
    let findings = findings_for_rule(analysis, rule)
    if findings.length() > 0 {
      let mut errors = 0
      let mut warnings = 0
      let mut infos = 0
      for finding in findings {
        match finding.severity {
          Error => errors += 1
          Warning => warnings += 1
          Info => infos += 1
        }
      }
      let band = triage_band_for_counts(errors, warnings)
      items.push({
        rule,
        count: findings.length(),
        errors,
        warnings,
        infos,
        priority: errors * 100 + warnings * 10 + infos,
        band,
        action: rule_remedy(rule),
      })
    }
  }
  let mut total_findings = 0
  let mut repair_score = 0
  for item in items {
    total_findings += item.count
    repair_score += item.priority
  }
  { band: triage_band(analysis), items, total_findings, repair_score }
}

///|
fn triage_rules() -> Array[RuleKind] {
  [
    ParallelPerfect,
    HiddenPerfect,
    VoiceCrossing,
    DissonancePlacement,
    MelodyRange,
    LargeLeap,
    LeapRecovery,
    SpeciesRhythm,
    CadenceShape,
  ]
}

///|
fn triage_band_for_counts(errors : Int, warnings : Int) -> TriageBand {
  if errors > 0 {
    Critical
  } else if warnings > 0 {
    Attention
  } else {
    Healthy
  }
}

///|
pub fn triage_band(analysis : Analysis) -> TriageBand {
  let summary = summarize(analysis)
  triage_band_for_counts(summary.errors, summary.warnings)
}

///|
pub fn triage_band_name(band : TriageBand) -> String {
  match band {
    Critical => "critical"
    Attention => "attention"
    Healthy => "healthy"
  }
}

///|
pub fn triage_item_count(triage : AnalysisTriage) -> Int {
  triage.items.length()
}

///|
pub fn triage_rule_count(triage : AnalysisTriage, rule : RuleKind) -> Int {
  for item in triage.items {
    if item.rule == rule {
      return item.count
    }
  }
  0
}

///|
pub fn triage_item(triage : AnalysisTriage, index : Int) -> TriageItem? {
  if index < 0 || index >= triage.items.length() {
    None
  } else {
    Some(triage.items[index])
  }
}

///|
pub fn triage_is_actionable(triage : AnalysisTriage) -> Bool {
  triage.total_findings > 0 && triage.items.length() > 0
}

///|
pub fn triage_priority_for_rule(
  triage : AnalysisTriage,
  rule : RuleKind,
) -> Int {
  for item in triage.items {
    if item.rule == rule {
      return item.priority
    }
  }
  0
}

///|
pub fn triage_actions(triage : AnalysisTriage) -> Array[String] {
  let result : Array[String] = []
  for item in triage.items {
    result.push(item.action)
  }
  result
}

///|
pub fn triage_summary(triage : AnalysisTriage) -> String {
  "band=\{triage_band_name(triage.band)} findings=\{triage.total_findings} repair-score=\{triage.repair_score}"
}

///|
pub fn triage_markdown(triage : AnalysisTriage) -> String {
  let lines : Array[String] = [
    "## Repair priority",
    "",
    "- \{triage_summary(triage)}",
    "",
    "| Priority | Rule | Band | Findings | Action |",
    "| ---: | --- | --- | ---: | --- |",
  ]
  for item in triage.items {
    lines.push(
      "| \{item.priority} | \{rule_family(item.rule)} | \{triage_band_name(item.band)} | \{item.count} | \{item.action} |",
    )
  }
  lines.join("\n")
}

///|
pub fn triage_compare(left : AnalysisTriage, right : AnalysisTriage) -> Int {
  right.repair_score - left.repair_score
}

///|
pub fn triage_rule_order(triage : AnalysisTriage) -> Array[RuleKind] {
  let result : Array[RuleKind] = []
  for item in triage.items {
    result.push(item.rule)
  }
  result
}

///|
pub fn triage_item_summary(item : TriageItem) -> String {
  "rule=\{rule_family(item.rule)} band=\{triage_band_name(item.band)} count=\{item.count} errors=\{item.errors} warnings=\{item.warnings} priority=\{item.priority}"
}

///|
pub fn triage_csv(triage : AnalysisTriage) -> String {
  let lines : Array[String] = [
    "rule,band,count,errors,warnings,infos,priority,action",
  ]
  for item in triage.items {
    lines.push(
      "\{rule_family(item.rule)},\{triage_band_name(item.band)},\{item.count},\{item.errors},\{item.warnings},\{item.infos},\{item.priority},\{item.action}",
    )
  }
  lines.join("\n")
}
