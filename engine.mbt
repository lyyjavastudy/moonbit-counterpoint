///|
pub(all) struct Analysis {
  species : Species
  findings : Array[Finding]
} derive(Debug, Eq, ToJson)

///|
pub fn Analysis::is_clean(self : Analysis) -> Bool {
  for finding in self.findings {
    if finding.severity == Error {
      return false
    }
  }
  true
}

///|
fn severity_name(severity : Severity) -> String {
  match severity {
    Error => "Error"
    Warning => "Warning"
    Info => "Info"
  }
}

///|
fn rule_name(rule : RuleKind) -> String {
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
pub fn analyze_counterpoint(
  cantus : Array[Note],
  counter : Array[Note],
  options? : AnalysisOptions = AnalysisOptions::default(species=First),
) -> Analysis {
  let findings : Array[Finding] = []
  for f in analyze_species_shape(cantus, counter, options) {
    findings.push(f)
  }
  for f in analyze_melody(counter, options) {
    findings.push(f)
  }
  for f in analyze_harmony(cantus, counter, options) {
    findings.push(f)
  }
  { species: options.species, findings }
}

///|
pub fn format_finding(finding : Finding) -> String {
  "[\{severity_name(finding.severity)}] \{rule_name(finding.rule)} at \{finding.index}: \{finding.message}"
}

///|
pub fn format_analysis(analysis : Analysis) -> String {
  if analysis.findings.length() == 0 {
    "No counterpoint findings."
  } else {
    let lines : Array[String] = []
    for f in analysis.findings {
      lines.push(format_finding(f))
    }
    lines.join("\n")
  }
}
