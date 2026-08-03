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
  "[\{Repr(finding.severity)}] \{Repr(finding.rule)} at \{finding.index}: \{finding.message}"
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
