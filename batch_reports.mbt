///|
pub(all) struct BatchReport {
  labels : Array[String]
  summaries : Array[AnalysisSummary]
  best_index : Int
  best_score : Int
} derive(Debug, Eq, ToJson)

///|
pub fn batch_report(
  cantus : Array[Note],
  variants : Array[Array[Note]],
  labels : Array[String],
  profile : RuleProfileConfig,
) -> BatchReport {
  let summaries = analyze_batch(cantus, variants, profile)
  let mut best_index = -1
  let mut best_score = -1
  for i, summary in summaries {
    if summary.score > best_score {
      best_index = i
      best_score = summary.score
    }
  }
  { labels, summaries, best_index, best_score }
}

///|
pub fn batch_best_label(report : BatchReport) -> String? {
  if report.best_index < 0 || report.best_index >= report.labels.length() {
    None
  } else {
    Some(report.labels[report.best_index])
  }
}

///|
pub fn batch_scores(report : BatchReport) -> Array[Int] {
  let result : Array[Int] = []
  for summary in report.summaries {
    result.push(summary.score)
  }
  result
}

///|
pub fn batch_improvement(report : BatchReport) -> Int {
  if report.summaries.length() == 0 {
    return 0
  }
  report.best_score - report.summaries[0].score
}

///|
pub fn batch_markdown(report : BatchReport) -> String {
  let lines : Array[String] = [
    "| Variant | Score | Grade | Findings |", "| --- | ---: | --- | ---: |",
  ]
  for i, summary in report.summaries {
    let label = if i < report.labels.length() {
      report.labels[i]
    } else {
      "variant-\{i}"
    }
    lines.push(
      "| \{label} | \{summary.score} | \{summary.grade()} | \{summary.total} |",
    )
  }
  lines.join("\n")
}

///|
pub fn batch_csv(report : BatchReport) -> String {
  let lines : Array[String] = ["label,score,grade,total,errors,warnings"]
  for i, summary in report.summaries {
    let label = if i < report.labels.length() {
      report.labels[i]
    } else {
      "variant-\{i}"
    }
    lines.push(
      "\{label},\{summary.score},\{summary.grade()},\{summary.total},\{summary.errors},\{summary.warnings}",
    )
  }
  lines.join("\n")
}

///|
pub fn batch_is_better_than(report : BatchReport, baseline : Int) -> Bool {
  report.best_score > baseline
}

///|
pub fn batch_count(report : BatchReport) -> Int {
  report.summaries.length()
}

///|
pub fn batch_pass_count(report : BatchReport) -> Int {
  let mut result = 0
  for summary in report.summaries {
    if summary.passed() {
      result += 1
    }
  }
  result
}

///|
pub fn batch_failure_count(report : BatchReport) -> Int {
  batch_count(report) - batch_pass_count(report)
}

///|
pub fn batch_average(report : BatchReport) -> Int {
  if report.summaries.length() == 0 {
    return 0
  }
  let mut total = 0
  for summary in report.summaries {
    total += summary.score
  }
  total / report.summaries.length()
}

///|
pub fn batch_quality(report : BatchReport) -> String {
  let average = batch_average(report)
  if average >= 90 {
    "excellent"
  } else if average >= 75 {
    "good"
  } else if average >= 60 {
    "review"
  } else {
    "revise"
  }
}

///|
pub fn batch_manifest(report : BatchReport) -> Array[String] {
  [
    "variants=\{batch_count(report)}",
    "best=\{report.best_score}",
    "average=\{batch_average(report)}",
    "quality=\{batch_quality(report)}",
  ]
}
