///|
pub(all) struct Scorecard {
  title : String
  technical : Int
  melodic : Int
  harmonic : Int
  rhythmic : Int
  explainability : Int
  total : Int
  grade : String
} derive(Debug, Eq, ToJson)

///|
pub fn make_scorecard(output : PipelineOutput) -> Scorecard {
  let technical = cap_quality(
    100 -
    output.validation.cantus.error_count() * 20 -
    output.validation.counterpoint.error_count() * 20,
  )
  let melodic = cap_quality(
    100 - output.contour.leaps * 4 - output.contour.range * 2,
  )
  let harmonic = cap_quality(
    100 - output.harmony.dissonant * 6 - output.harmony.crossings * 15,
  )
  let rhythmic = cap_quality(100 - output.rhythm.syncopations * 4)
  let explainability = if pipeline_is_explainable(output) { 100 } else { 60 }
  let total = (technical + melodic + harmonic + rhythmic + explainability) / 5
  {
    title: "Counterpoint scorecard",
    technical,
    melodic,
    harmonic,
    rhythmic,
    explainability,
    total,
    grade: if total >= 90 {
      "excellent"
    } else if total >= 75 {
      "good"
    } else if total >= 60 {
      "review"
    } else {
      "revise"
    },
  }
}

///|
pub fn scorecard_grade(scorecard : Scorecard) -> String {
  scorecard.grade
}

///|
pub fn scorecard_dimensions(scorecard : Scorecard) -> Array[Int] {
  [
    scorecard.technical,
    scorecard.melodic,
    scorecard.harmonic,
    scorecard.rhythmic,
    scorecard.explainability,
  ]
}

///|
pub fn weakest_dimension(scorecard : Scorecard) -> String {
  let dimensions = scorecard_dimensions(scorecard)
  let names = ["technical", "melodic", "harmonic", "rhythmic", "explainability"]
  let mut index = 0
  for i in 1..<dimensions.length() {
    if dimensions[i] < dimensions[index] {
      index = i
    }
  }
  names[index]
}

///|
pub fn scorecard_markdown(scorecard : Scorecard) -> String {
  let lines : Array[String] = [
    "## \{scorecard.title}",
    "",
    "| Dimension | Score |",
    "| --- | ---: |",
    "| Technical | \{scorecard.technical} |",
    "| Melodic | \{scorecard.melodic} |",
    "| Harmonic | \{scorecard.harmonic} |",
    "| Rhythmic | \{scorecard.rhythmic} |",
    "| Explainability | \{scorecard.explainability} |",
    "",
    "Grade: \{scorecard.grade} (\{scorecard.total}/100)",
  ]
  lines.join("\n")
}

///|
pub fn scorecard_csv(scorecard : Scorecard) -> String {
  "\{scorecard.technical},\{scorecard.melodic},\{scorecard.harmonic},\{scorecard.rhythmic},\{scorecard.explainability},\{scorecard.total},\{scorecard.grade}"
}

///|
pub fn scorecard_passed(scorecard : Scorecard) -> Bool {
  scorecard.total >= 60
}

///|
pub fn scorecard_action(scorecard : Scorecard) -> String {
  match weakest_dimension(scorecard) {
    "technical" => "repair timeline input"
    "melodic" => "review leaps and contour"
    "harmonic" => "review vertical intervals"
    "rhythmic" => "review beat placement"
    _ => "add an explanation to the report"
  }
}

///|
pub fn scorecard_compare(left : Scorecard, right : Scorecard) -> Int {
  left.total - right.total
}
