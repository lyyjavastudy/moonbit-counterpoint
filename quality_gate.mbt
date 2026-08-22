///|
pub(all) enum GateStatus {
  Pass
  Review
  Fail
} derive(Debug, Eq, ToJson)

///|
pub(all) struct QualityGate {
  name : String
  status : GateStatus
  score : Int
  evidence : String
  action : String
} derive(Debug, Eq, ToJson)

///|
pub(all) struct QualityGateReport {
  status : GateStatus
  gates : Array[QualityGate]
  score : Int
} derive(Debug, Eq, ToJson)

///|
pub fn gate_status_name(status : GateStatus) -> String {
  match status {
    Pass => "pass"
    Review => "review"
    Fail => "fail"
  }
}

///|
pub fn gate_for_summary(summary : AnalysisSummary) -> QualityGate {
  let status = if summary.errors > 0 {
    Fail
  } else if summary.warnings > 0 {
    Review
  } else {
    Pass
  }
  {
    name: "analysis",
    status,
    score: summary.score,
    evidence: "\{summary.errors} errors, \{summary.warnings} warnings",
    action: if status == Pass {
      "continue composing"
    } else {
      "inspect the findings"
    },
  }
}

///|
pub fn gate_for_sequence(report : SequenceReport, name : String) -> QualityGate {
  let status = if report.is_valid() { Pass } else { Fail }
  {
    name,
    status,
    score: if report.is_valid() {
      100
    } else {
      0
    },
    evidence: "\{report.error_count()} sequence issues",
    action: if report.is_valid() {
      "keep the timeline"
    } else {
      "repair onset and duration data"
    },
  }
}

///|
pub fn gate_for_motion(summary : VoiceLeadingSummary) -> QualityGate {
  let status = if summary.rejected == 0 {
    Pass
  } else if summary.accepted > summary.rejected {
    Review
  } else {
    Fail
  }
  {
    name: "voice-leading",
    status,
    score: motion_acceptance_rate(summary),
    evidence: "\{summary.accepted}/\{summary.transitions} transitions accepted",
    action: if status == Pass {
      "retain the motion"
    } else {
      "try contrary or oblique motion"
    },
  }
}

///|
pub fn quality_gate_report(
  validation : PairValidation,
  motion : VoiceLeadingSummary,
) -> QualityGateReport {
  let gates = [
    gate_for_sequence(validation.cantus, "cantus"),
    gate_for_sequence(validation.counterpoint, "counterpoint"),
    gate_for_summary(validation.summary),
    gate_for_motion(motion),
  ]
  let mut total = 0
  let mut failed = 0
  let mut reviewed = 0
  for gate in gates {
    total += gate.score
    if gate.status == Fail {
      failed += 1
    }
    if gate.status == Review {
      reviewed += 1
    }
  }
  {
    status: if failed > 0 {
      Fail
    } else if reviewed > 0 {
      Review
    } else {
      Pass
    },
    gates,
    score: if gates.length() == 0 {
      0
    } else {
      total / gates.length()
    },
  }
}

///|
pub fn quality_gate_passed(report : QualityGateReport) -> Bool {
  report.status == Pass
}

///|
pub fn gate_count(report : QualityGateReport, status : GateStatus) -> Int {
  let mut result = 0
  for gate in report.gates {
    if gate.status == status {
      result += 1
    }
  }
  result
}

///|
pub fn quality_gate_markdown(report : QualityGateReport) -> String {
  let lines : Array[String] = [
    "## Quality gates",
    "",
    "- Overall: \{gate_status_name(report.status)}",
    "- Score: \{report.score}",
    "",
  ]
  for gate in report.gates {
    lines.push(
      "- \{gate.name}: \{gate_status_name(gate.status)} — \{gate.evidence}; \{gate.action}",
    )
  }
  lines.join("\n")
}

///|
pub fn quality_gate_actions(report : QualityGateReport) -> Array[String] {
  let result : Array[String] = []
  for gate in report.gates {
    if gate.status != Pass {
      result.push(gate.action)
    }
  }
  result
}

///|
pub fn quality_gate_score(report : QualityGateReport) -> Int {
  report.score
}
