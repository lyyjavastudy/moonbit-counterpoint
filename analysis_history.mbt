///|
pub(all) struct AnalysisSnapshot {
  label : String
  score : Int
  errors : Int
  warnings : Int
  notes : Int
  profile : String
} derive(Debug, Eq, ToJson)

///|
pub(all) struct AnalysisHistory {
  snapshots : Array[AnalysisSnapshot]
  best_score : Int
  latest_score : Int
  improvement : Int
} derive(Debug, Eq, ToJson)

///|
pub fn snapshot(
  label : String,
  validation : PairValidation,
) -> AnalysisSnapshot {
  {
    label,
    score: validation.quality_score(),
    errors: validation.summary.errors,
    warnings: validation.summary.warnings,
    notes: validation.counterpoint.note_count,
    profile: validation.profile,
  }
}

///|
pub fn empty_history() -> AnalysisHistory {
  { snapshots: [], best_score: 0, latest_score: 0, improvement: 0 }
}

///|
pub fn add_snapshot(
  history : AnalysisHistory,
  value : AnalysisSnapshot,
) -> AnalysisHistory {
  let snapshots = history.snapshots.copy()
  snapshots.push(value)
  let mut best = history.best_score
  if value.score > best {
    best = value.score
  }
  let previous = history.latest_score
  {
    snapshots,
    best_score: best,
    latest_score: value.score,
    improvement: value.score - previous,
  }
}

///|
pub fn history_from_validations(
  labels : Array[String],
  validations : Array[PairValidation],
) -> AnalysisHistory {
  let result = empty_history()
  let count = if labels.length() < validations.length() {
    labels.length()
  } else {
    validations.length()
  }
  let mut history = result
  for i in 0..<count {
    history = add_snapshot(history, snapshot(labels[i], validations[i]))
  }
  history
}

///|
pub fn history_is_improving(history : AnalysisHistory) -> Bool {
  history.improvement > 0
}

///|
pub fn history_average(history : AnalysisHistory) -> Int {
  if history.snapshots.length() == 0 {
    return 0
  }
  let mut total = 0
  for value in history.snapshots {
    total += value.score
  }
  total / history.snapshots.length()
}

///|
pub fn history_errors(history : AnalysisHistory) -> Int {
  let mut total = 0
  for value in history.snapshots {
    total += value.errors
  }
  total
}

///|
pub fn history_warnings(history : AnalysisHistory) -> Int {
  let mut total = 0
  for value in history.snapshots {
    total += value.warnings
  }
  total
}

///|
pub fn history_latest(history : AnalysisHistory) -> AnalysisSnapshot? {
  if history.snapshots.length() == 0 {
    None
  } else {
    Some(history.snapshots[history.snapshots.length() - 1])
  }
}

///|
pub fn history_best(history : AnalysisHistory) -> AnalysisSnapshot? {
  if history.snapshots.length() == 0 {
    return None
  }
  let mut best = history.snapshots[0]
  for value in history.snapshots {
    if value.score > best.score {
      best = value
    }
  }
  Some(best)
}

///|
pub fn history_markdown(history : AnalysisHistory) -> String {
  let lines : Array[String] = [
    "## Analysis history",
    "",
    "- Runs: \{history.snapshots.length()}",
    "- Average score: \{history_average(history)}",
    "- Best score: \{history.best_score}",
    "- Improvement: \{history.improvement}",
    "",
  ]
  for value in history.snapshots {
    lines.push(
      "- \{value.label}: \{value.score}/100, errors=\{value.errors}, warnings=\{value.warnings}",
    )
  }
  lines.join("\n")
}

///|
pub fn history_fingerprint(history : AnalysisHistory) -> String {
  let values : Array[String] = []
  for snapshot in history.snapshots {
    values.push(
      "\{snapshot.label}:\{snapshot.score}:\{snapshot.errors}:\{snapshot.warnings}",
    )
  }
  values.join("|")
}

///|
pub fn history_scores(history : AnalysisHistory) -> Array[Int] {
  let result : Array[Int] = []
  for snapshot in history.snapshots {
    result.push(snapshot.score)
  }
  result
}

///|
pub fn history_delta(
  history : AnalysisHistory,
  first : Int,
  second : Int,
) -> Int? {
  if first < 0 ||
    second < 0 ||
    first >= history.snapshots.length() ||
    second >= history.snapshots.length() {
    None
  } else {
    Some(history.snapshots[second].score - history.snapshots[first].score)
  }
}
