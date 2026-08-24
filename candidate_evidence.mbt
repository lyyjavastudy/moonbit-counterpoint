///|
pub(all) enum CandidateConstraint {
  Range
  Consonance
  Leap
  Motion
} derive(Debug, Eq, ToJson)

///|
pub(all) struct ConstraintEvidence {
  constraint : CandidateConstraint
  passed : Bool
  score : Int
  detail : String
} derive(Debug, Eq, ToJson)

///|
pub(all) struct CandidateEvaluation {
  candidate : PitchCandidate
  constraints : Array[ConstraintEvidence]
  score : Int
  accepted : Bool
} derive(Debug, Eq, ToJson)

///|
/// Evaluate a candidate as transparent constraint evidence instead of one opaque score.
pub fn evaluate_candidate(
  cantus_before : Note,
  cantus_after : Note,
  counter_before : Note,
  counter_after : Note,
  candidate : Note,
  policy : CandidatePolicy,
) -> CandidateEvaluation {
  let vertical = harmonic_interval(cantus_after, candidate)
  let melodic = melodic_interval(counter_before, candidate)
  let reference_delta = absolute_melodic_interval(counter_before, counter_after)
  let motion_value = candidate_motion(
    cantus_before, cantus_after, counter_before, candidate,
  )
  let absolute_leap = absolute_melodic_interval(counter_before, candidate)
  let range_ok = policy.is_valid() &&
    candidate.midi >= policy.low &&
    candidate.midi <= policy.high
  let consonance_ok = !policy.require_consonance || is_consonance(vertical)
  let leap_ok = absolute_leap <= policy.max_leap
  let motion_ok = !policy.prefer_contrary ||
    motion_value == Contrary ||
    motion_value == Oblique
  let constraints = [
    {
      constraint: Range,
      passed: range_ok,
      score: if range_ok {
        25
      } else {
        0
      },
      detail: if range_ok {
        "candidate is inside the configured register"
      } else {
        "candidate is outside the configured register"
      },
    },
    {
      constraint: Consonance,
      passed: consonance_ok,
      score: if consonance_ok {
        25
      } else {
        0
      },
      detail: if consonance_ok {
        "vertical interval is consonant"
      } else {
        "vertical interval is dissonant"
      },
    },
    {
      constraint: Leap,
      passed: leap_ok,
      score: if leap_ok {
        25
      } else {
        0
      },
      detail: "candidate leap=\{absolute_leap}, reference leap=\{reference_delta}",
    },
    {
      constraint: Motion,
      passed: motion_ok,
      score: if motion_ok {
        25
      } else {
        0
      },
      detail: if motion_ok {
        "motion is contrary or oblique"
      } else {
        "policy prefers contrary or oblique motion"
      },
    },
  ]
  let mut score = 0
  for evidence in constraints {
    score += evidence.score
  }
  let accepted = range_ok && consonance_ok && leap_ok && motion_ok
  let pitch_candidate = {
    note: candidate,
    vertical_interval: vertical,
    melodic_interval: melodic,
    consonant: is_consonance(vertical),
    motion: motion_value,
    score,
  }
  { candidate: pitch_candidate, constraints, score, accepted }
}

///|
pub fn candidate_motion_name(motion_value : MotionKind) -> String {
  match motion_value {
    Parallel => "parallel"
    Similar => "similar"
    Contrary => "contrary"
    Oblique => "oblique"
    Static => "static"
  }
}

///|
pub fn candidate_constraint_name(constraint : CandidateConstraint) -> String {
  match constraint {
    Range => "range"
    Consonance => "consonance"
    Leap => "leap"
    Motion => "motion"
  }
}

///|
pub fn candidate_evaluation_count(evaluation : CandidateEvaluation) -> Int {
  evaluation.constraints.length()
}

///|
pub fn candidate_evaluation_has(
  evaluation : CandidateEvaluation,
  constraint : CandidateConstraint,
) -> Bool {
  for evidence in evaluation.constraints {
    if evidence.constraint == constraint {
      return true
    }
  }
  false
}

///|
pub fn candidate_evaluation_passes(
  evaluation : CandidateEvaluation,
  constraint : CandidateConstraint,
) -> Bool {
  for evidence in evaluation.constraints {
    if evidence.constraint == constraint {
      return evidence.passed
    }
  }
  false
}

///|
pub fn candidate_evaluation_failed(
  evaluation : CandidateEvaluation,
) -> Array[CandidateConstraint] {
  let result : Array[CandidateConstraint] = []
  for evidence in evaluation.constraints {
    if !evidence.passed {
      result.push(evidence.constraint)
    }
  }
  result
}

///|
pub fn candidate_evaluation_summary(evaluation : CandidateEvaluation) -> String {
  let failed = candidate_evaluation_failed(evaluation)
  let failures = failed.map(candidate_constraint_name).join(",")
  "pitch=\{evaluation.candidate.note.midi} score=\{evaluation.score} accepted=\{evaluation.accepted} failed=\{failures}"
}

///|
pub fn candidate_evaluation_markdown(
  evaluation : CandidateEvaluation,
) -> String {
  let lines : Array[String] = [
    "### Candidate \{evaluation.candidate.note.midi}",
    "",
    "- Score: \{evaluation.score}",
    "- Accepted: \{evaluation.accepted}",
    "",
    "| Constraint | Status | Detail |",
    "| --- | --- | --- |",
  ]
  for evidence in evaluation.constraints {
    lines.push(
      "| \{candidate_constraint_name(evidence.constraint)} | \{evidence.passed} | \{evidence.detail} |",
    )
  }
  lines.join("\n")
}

///|
pub fn evaluate_candidates(
  cantus_before : Note,
  cantus_after : Note,
  counter_before : Note,
  counter_after : Note,
  candidates : Array[Note],
  policy : CandidatePolicy,
) -> Array[CandidateEvaluation] {
  let result : Array[CandidateEvaluation] = []
  for candidate in candidates {
    result.push(
      evaluate_candidate(
        cantus_before, cantus_after, counter_before, counter_after, candidate, policy,
      ),
    )
  }
  result
}

///|
pub fn best_evaluation(
  evaluations : Array[CandidateEvaluation],
) -> CandidateEvaluation? {
  if evaluations.length() == 0 {
    return None
  }
  let mut best = evaluations[0]
  for evaluation in evaluations {
    if evaluation.accepted && !best.accepted {
      best = evaluation
    } else if evaluation.accepted == best.accepted &&
      evaluation.score > best.score {
      best = evaluation
    }
  }
  Some(best)
}
