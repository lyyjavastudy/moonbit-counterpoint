///|
pub(all) struct ProfileResult {
  profile : String
  score : Int
  grade : String
  findings : Int
  passed : Bool
} derive(Debug, Eq, ToJson)

///|
pub fn profile_result(
  profile : RuleProfileConfig,
  analysis : Analysis,
) -> ProfileResult {
  let summary = summarize(analysis)
  {
    profile: profile.label(),
    score: score_for(analysis, profile),
    grade: summary.grade(),
    findings: summary.total,
    passed: summary.passed(),
  }
}

///|
pub fn profile_results(
  cantus : Array[Note],
  counter : Array[Note],
) -> Array[ProfileResult] {
  let result : Array[ProfileResult] = []
  for profile in valid_profiles() {
    result.push(
      profile_result(profile, analyze_with_profile(cantus, counter, profile)),
    )
  }
  result
}

///|
pub fn best_profile_result(results : Array[ProfileResult]) -> ProfileResult? {
  if results.length() == 0 {
    return None
  }
  let mut best = results[0]
  for result in results {
    if result.score > best.score {
      best = result
    }
  }
  Some(best)
}

///|
pub fn profile_result_table(results : Array[ProfileResult]) -> String {
  let lines : Array[String] = ["profile,score,grade,findings,passed"]
  for result in results {
    lines.push(
      "\{result.profile},\{result.score},\{result.grade},\{result.findings},\{result.passed}",
    )
  }
  lines.join("\n")
}

///|
pub fn profile_result_markdown(results : Array[ProfileResult]) -> String {
  let lines : Array[String] = [
    "| Profile | Score | Grade | Findings | Passed |", "| --- | ---: | --- | ---: | --- |",
  ]
  for result in results {
    lines.push(
      "| \{result.profile} | \{result.score} | \{result.grade} | \{result.findings} | \{result.passed} |",
    )
  }
  lines.join("\n")
}

///|
pub fn profile_improvement(results : Array[ProfileResult]) -> Int {
  match best_profile_result(results) {
    None => 0
    Some(best) =>
      best.score - (if results.length() == 0 { 0 } else { results[0].score })
  }
}
