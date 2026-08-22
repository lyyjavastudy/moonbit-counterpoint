///|
pub(all) struct ReportSection {
  id : String
  title : String
  body : String
  priority : Int
} derive(Debug, Eq, ToJson)

///|
pub(all) struct ReportDocument {
  title : String
  sections : Array[ReportSection]
  format : String
} derive(Debug, Eq, ToJson)

///|
pub fn ReportSection::new(
  id~ : String,
  title~ : String,
  body~ : String,
  priority~ : Int,
) -> ReportSection {
  { id, title, body, priority }
}

///|
pub fn findings_section(analysis : Analysis) -> ReportSection {
  ReportSection::new(
    id="findings",
    title="Findings",
    body=analysis_markdown(analysis),
    priority=10,
  )
}

///|
pub fn summary_section(analysis : Analysis) -> ReportSection {
  let summary = summarize(analysis)
  let body = summary_csv(summary)
  ReportSection::new(id="summary", title="Summary", body~, priority=0)
}

///|
pub fn recommendation_section(analysis : Analysis) -> ReportSection {
  ReportSection::new(
    id="recommendations",
    title="Recommendations",
    body=recommendations_markdown(analysis),
    priority=20,
  )
}

///|
pub fn practice_section(analysis : Analysis) -> ReportSection {
  let plan = plan_for_analysis(analysis)
  ReportSection::new(
    id="practice",
    title="Practice plan",
    body=plan_markdown(plan),
    priority=30,
  )
}

///|
pub fn rhythm_section(meter : Meter, notes : Array[Note]) -> ReportSection {
  let summary = summarize_rhythm(meter, notes)
  let body = "notes=\{summary.notes}\nmeasures=\{summary.measures}\nsyncopations=\{summary.syncopations}\ndensity=\{rhythm_density(meter, notes)}"
  ReportSection::new(id="rhythm", title="Rhythm", body~, priority=15)
}

///|
pub fn contour_section(notes : Array[Note]) -> ReportSection {
  let summary = contour_summary(notes)
  let body = "notes=\{summary.notes}\nrising=\{summary.rising}\nfalling=\{summary.falling}\nleaps=\{summary.leaps}\nrange=\{summary.range}"
  ReportSection::new(id="contour", title="Melodic contour", body~, priority=16)
}

///|
pub fn harmony_section(
  lower : Array[Note],
  upper : Array[Note],
) -> ReportSection {
  let summary = harmony_summary(lower, upper)
  let body = "events=\{summary.events}\nperfect=\{summary.perfect}\nimperfect=\{summary.imperfect}\ndissonant=\{summary.dissonant}\ncrossings=\{summary.crossings}"
  ReportSection::new(id="harmony", title="Harmony", body~, priority=17)
}

///|
pub fn sections_for_analysis(
  analysis : Analysis,
  meter : Meter,
  cantus : Array[Note],
  counter : Array[Note],
) -> Array[ReportSection] {
  [
    summary_section(analysis),
    findings_section(analysis),
    recommendation_section(analysis),
    practice_section(analysis),
    rhythm_section(meter, counter),
    contour_section(counter),
    harmony_section(cantus, counter),
  ]
}

///|
pub fn report_document(
  title : String,
  analysis : Analysis,
  meter : Meter,
  cantus : Array[Note],
  counter : Array[Note],
) -> ReportDocument {
  {
    title,
    sections: sections_for_analysis(analysis, meter, cantus, counter),
    format: "markdown-sections-v1",
  }
}

///|
pub fn section_by_id(document : ReportDocument, id : String) -> ReportSection? {
  for section in document.sections {
    if section.id == id {
      return Some(section)
    }
  }
  None
}

///|
pub fn sections_by_priority(
  document : ReportDocument,
  minimum : Int,
) -> Array[ReportSection] {
  let result : Array[ReportSection] = []
  for section in document.sections {
    if section.priority >= minimum {
      result.push(section)
    }
  }
  result
}

///|
pub fn render_section(section : ReportSection) -> String {
  "## \{section.title}\n\n\{section.body}"
}

///|
pub fn render_document(document : ReportDocument) -> String {
  let lines : Array[String] = ["# \{document.title}", ""]
  for section in document.sections {
    lines.push(render_section(section))
    lines.push("")
  }
  lines.join("\n")
}

///|
pub fn report_section_count(document : ReportDocument) -> Int {
  document.sections.length()
}

///|
pub fn report_contains(document : ReportDocument, id : String) -> Bool {
  section_by_id(document, id) is Some(_)
}

///|
pub fn report_word_count(document : ReportDocument) -> Int {
  let mut total = 0
  for section in document.sections {
    total += section.body.split(" ").length()
  }
  total
}

///|
pub fn report_quality_score(
  document : ReportDocument,
  analysis : Analysis,
) -> Int {
  let base = summarize(analysis).score
  if report_section_count(document) >= 5 {
    base
  } else {
    base / 2
  }
}

///|
pub fn compact_report_document(document : ReportDocument) -> String {
  let lines : Array[String] = []
  for section in document.sections {
    lines.push("\{section.id}=\{section.priority}")
  }
  lines.join(";")
}

///|
pub fn report_section_ids(document : ReportDocument) -> Array[String] {
  let result : Array[String] = []
  for section in document.sections {
    result.push(section.id)
  }
  result
}

///|
pub fn append_report_section(
  document : ReportDocument,
  section : ReportSection,
) -> ReportDocument {
  let sections = document.sections.copy()
  sections.push(section)
  { ..document, sections, }
}

///|
pub fn report_with_manifest(
  document : ReportDocument,
  profile : RuleProfileConfig,
  meter : Meter,
) -> ReportDocument {
  let section = ReportSection::new(
    id="manifest",
    title="Manifest",
    body=manifest_text(profile, meter),
    priority=-1,
  )
  append_report_section(document, section)
}
